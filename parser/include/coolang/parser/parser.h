#ifndef COOLANG_PARSER_PARSER_H_
#define COOLANG_PARSER_PARSER_H_

#include "coolang/lexer/lexer.h"
#include "coolang/lexer/token.h"
#include "coolang/parser/ast.h"

class ParseError {
 public:
  ParseError(Token unexpected_token, std::string file_name)
      : unexpected_token_(std::move(unexpected_token)),
        file_name_(std::move(file_name)) {}

  std::string ToString() const {
    return "error: " + file_name_ + " " + TokenToString(unexpected_token_) +
           '\n';
  }

 private:
  const Token unexpected_token_;
  const std::string file_name_;
};

class Parser {
 public:
  Parser(std::unique_ptr<Lexer> lexer) : lexer_(std::move(lexer)){};
  std::variant<coolang::ast::Program, ParseError> ParseProgram() const;

 private:
  coolang::ast::CoolClass ParseClass() const;
  coolang::ast::Feature ParseFeature() const;
  coolang::ast::MethodFeature ParseMethodFeature() const;
  coolang::ast::AttributeFeature ParseAttributeFeature() const;
  coolang::ast::Formal ParseFormal() const;

  const std::unique_ptr<Lexer> lexer_;
};

#endif  // COOLANG_PARSER_PARSER_H_
