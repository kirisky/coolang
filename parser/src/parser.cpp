#include <variant>
#include "coolang/lexer/token.h"
#include "coolang/parser/parser.h"

using coolang::ast::AssignExpr;
using coolang::ast::AttributeFeature;
using coolang::ast::CoolClass;
using coolang::ast::Expr;
using coolang::ast::Feature;
using coolang::ast::Formal;
using coolang::ast::IntExpr;
using coolang::ast::LineRange;
using coolang::ast::MethodFeature;
using coolang::ast::Program;

class UnexpectedTokenExcpetion : public std::exception {
 public:
  explicit UnexpectedTokenExcpetion(Token unexpected_token)
      : unexpected_token_(std::move(unexpected_token)) {}

  Token GetUnexpectedToken() const { return unexpected_token_; }

 private:
  const Token unexpected_token_;
};

template <class T>
T ExpectToken(Token token) {
  try {
    return std::get<T>(token);
  } catch (std::bad_variant_access&) {
    throw UnexpectedTokenExcpetion(token);
  }
}

std::variant<Program, ParseError> Parser::ParseProgram() const {
  try {
    std::vector<CoolClass> classes;

    while (!lexer_->PeekTokenTypeIs<TokenEndOfFile>()) {
      classes.push_back(ParseClass());

      auto semi_token = ExpectToken<TokenSemi>(lexer_->PeekToken());
      lexer_->PopToken();
    }

    auto eof_token = ExpectToken<TokenEndOfFile>(lexer_->PeekToken());

    const int program_end_line =
        classes.empty() ? eof_token.get_line_num()
                        : classes.back().GetLineRange().end_line_num;

    return Program(std::move(classes), LineRange(1, program_end_line));
  } catch (const UnexpectedTokenExcpetion& e) {
    return ParseError(e.GetUnexpectedToken(),
                      lexer_->GetInputFile().filename().string());
  }
}

CoolClass Parser::ParseClass() const {
  auto class_token = ExpectToken<TokenClass>(lexer_->PeekToken());
  lexer_->PopToken();

  auto type_id_token = ExpectToken<TokenTypeId>(lexer_->PeekToken());
  lexer_->PopToken();

  auto lbrace_token = ExpectToken<TokenLbrace>(lexer_->PeekToken());
  lexer_->PopToken();

  std::vector<std::unique_ptr<Feature>> features;
  while (!lexer_->PeekTokenTypeIs<TokenRbrace>()) {
    features.push_back(ParseFeature());

    auto semi_token = ExpectToken<TokenSemi>(lexer_->PeekToken());
    lexer_->PopToken();
  }

  auto rbrace_token = ExpectToken<TokenRbrace>(lexer_->PeekToken());
  lexer_->PopToken();

  return CoolClass(
      type_id_token.get_data(), std::nullopt, std::move(features),
      LineRange(class_token.get_line_num(), rbrace_token.get_line_num()),
      lexer_->GetInputFile().filename().string());
}

std::unique_ptr<Feature> Parser::ParseFeature() const {
  if (std::holds_alternative<TokenLparen>(lexer_->LookAheadToken())) {
    return ParseMethodFeature();
  }
  return ParseAttributeFeature();
}

std::unique_ptr<MethodFeature> Parser::ParseMethodFeature() const {
  auto object_id_token = ExpectToken<TokenObjectId>(lexer_->PeekToken());
  lexer_->PopToken();

  auto left_paren_token = ExpectToken<TokenLparen>(lexer_->PeekToken());
  lexer_->PopToken();

  // TODO arg list

  auto right_paren_token = ExpectToken<TokenRparen>(lexer_->PeekToken());
  lexer_->PopToken();

  auto colon_token = ExpectToken<TokenColon>(lexer_->PeekToken());
  lexer_->PopToken();

  auto type_id_token = ExpectToken<TokenTypeId>(lexer_->PeekToken());
  lexer_->PopToken();

  auto left_brace_token = ExpectToken<TokenLbrace>(lexer_->PeekToken());
  lexer_->PopToken();

  std::unique_ptr<Expr> expr = ParseExpr();

  auto right_brace_token = ExpectToken<TokenRbrace>(lexer_->PeekToken());
  lexer_->PopToken();

  const LineRange line_range =
      LineRange(GetLineNum(object_id_token), GetLineNum(right_brace_token));

  return std::make_unique<MethodFeature>(object_id_token.get_data(),
                                         type_id_token.get_data(),
                                         std::move(expr), line_range);
}

std::unique_ptr<AttributeFeature> Parser::ParseAttributeFeature() const {
  Formal f = ParseFormal();
  // TODO parse init expr if present
  // need to change line range if theres an init expr
  return std::make_unique<AttributeFeature>(f.GetId(), f.GetType(),
                                            f.GetLineRange());
}

Formal Parser::ParseFormal() const {
  auto object_id_token = ExpectToken<TokenObjectId>(lexer_->PeekToken());
  lexer_->PopToken();

  auto colon_token = ExpectToken<TokenColon>(lexer_->PeekToken());
  lexer_->PopToken();

  auto type_id_token = ExpectToken<TokenTypeId>(lexer_->PeekToken());
  lexer_->PopToken();

  return Formal(
      object_id_token.get_data(), type_id_token.get_data(),
      LineRange(GetLineNum(object_id_token), GetLineNum(type_id_token)));
}

std::unique_ptr<Expr> Parser::ParseExpr() const {
  if (std::holds_alternative<TokenIntConst>(lexer_->PeekToken())) {
    return ParseIntExpr();
  }
  return ParseAssignExpr();
}

std::unique_ptr<IntExpr> Parser::ParseIntExpr() const {
  auto int_const_token = ExpectToken<TokenIntConst>(lexer_->PeekToken());
  lexer_->PopToken();

  const auto line_range =
      LineRange(GetLineNum(int_const_token), GetLineNum(int_const_token));

  return std::make_unique<IntExpr>(int_const_token.get_data(), line_range);
}

std::unique_ptr<AssignExpr> Parser::ParseAssignExpr() const {
  auto object_id_token = ExpectToken<TokenObjectId>(lexer_->PeekToken());
  lexer_->PopToken();

  auto assign_token = ExpectToken<TokenAssign>(lexer_->PeekToken());
  lexer_->PopToken();

  auto rhs_expr = ParseExpr();

  const auto line_range = LineRange(GetLineNum(object_id_token),
                                    rhs_expr->GetLineRange().end_line_num);

  return std::make_unique<AssignExpr>(object_id_token.get_data(),
                                      std::move(rhs_expr), line_range);
}