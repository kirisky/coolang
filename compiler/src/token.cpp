#include "coolang/compiler/token.h"

std::string TokenTypeToString(TokenType token_type) {
  switch (token_type) {
    case TokenType::CLASS:
      return ("CLASS");
    case TokenType::ELSE:
      return ("ELSE");
    case TokenType::FI:
      return ("FI");
    case TokenType::IF:
      return ("IF");
    case TokenType::IN:
      return ("IN");
    case TokenType::INHERITS:
      return ("INHERITS");
    case TokenType::LET:
      return ("LET");
    case TokenType::LOOP:
      return ("LOOP");
    case TokenType::POOL:
      return ("POOL");
    case TokenType::THEN:
      return ("THEN");
    case TokenType::WHILE:
      return ("WHILE");
    case TokenType::ASSIGN:
      return ("ASSIGN");
    case TokenType::CASE:
      return ("CASE");
    case TokenType::ESAC:
      return ("ESAC");
    case TokenType::OF:
      return ("OF");
    case TokenType::DARROW:
      return ("DARROW");
    case TokenType::NEW:
      return ("NEW");
    case TokenType::STR_CONST:
      return ("STR_CONST");
    case TokenType::INT_CONST:
      return ("INT_CONST");
    case TokenType::BOOL_CONST:
      return ("BOOL_CONST");
    case TokenType::TYPEID:
      return ("TYPEID");
    case TokenType::OBJECTID:
      return ("OBJECTID");
    case TokenType::ERROR:
      return ("ERROR");
    // case TokenType::error:
    //  return ("ERROR");
    case TokenType::LE:
      return ("LE");
    case TokenType::NOT:
      return ("NOT");
    case TokenType::ISVOID:
      return ("ISVOID");
    case TokenType::PLUS:
      return ("'+'");
    case TokenType::DIV:
      return ("'/'");
    case TokenType::MINUS:
      return ("'-'");
    case TokenType::MULT:
      return ("'*'");
    case TokenType::EQ:
      return ("'='");
    case TokenType::LT:
      return ("'<'");
    case TokenType::DOT:
      return ("'.'");
    case TokenType::NEG:
      return ("'~'");
    case TokenType::COMMA:
      return ("','");
    case TokenType::SEMI:
      return ("';'");
    case TokenType::COLON:
      return ("':'");
    case TokenType::LPAREN:
      return ("'('");
    case TokenType::RPAREN:
      return ("')'");
    case TokenType::AT:
      return ("'@'");
    case TokenType::LBRACE:
      return ("'{'");
    case TokenType::RBRACE:
      return ("'}'");
    case TokenType::END_OF_FILE:
      return ("EOF");
  }
}