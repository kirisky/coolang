#ifndef COOLANG_LEXER_LEXER_H_
#define COOLANG_LEXER_LEXER_H_

#include <fstream>
#include <optional>
#include <string>
#include <variant>
#include "coolang/lexer/char_stream.h"
#include "coolang/lexer/token.h"

class Lexer {
 public:
  Lexer(std::string input_file_name);

  Token GetNextToken();

  Token GetCurTok() { return CurTok; };

 private:
  Token gettok();
  void AdvanceToEndOfComment();
  std::optional<TokenType> TokenTypeForSingleCharSymbol(char c);

  /// CurTok/getNextToken - Provide a simple token buffer.  CurTok is the
  /// current token the parser is looking at.  getNextToken reads another token
  /// from the lexer and updates CurTok with its results.
  Token CurTok;

  CharStream char_stream_;
};

#endif  // COOLANG_LEXER_LEXER_H_
