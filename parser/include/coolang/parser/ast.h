#ifndef COOLANG_PARSER_AST_H
#define COOLANG_PARSER_AST_H

#include <optional>
#include <string>
#include <variant>
#include <vector>

namespace coolang {
namespace ast {

class LineRange {
 public:
  LineRange(int start_line_num, int end_line_num)
      : start_line_num(start_line_num), end_line_num(end_line_num) {}

  std::string ToString() const { return "#" + std::to_string(end_line_num); }

  int start_line_num;
  int end_line_num;
};

class AstNode {
 public:
  AstNode(LineRange line_range) : line_range_(line_range) {}
  LineRange GetLineRange() const { return line_range_; }

 private:
  LineRange line_range_;
};

class Expr : public AstNode {
 public:
  Expr(LineRange line_range) : AstNode(line_range) {}
  virtual std::string ToString() const = 0;
};

class AssignExpr : public Expr {
 public:
  AssignExpr(std::string id, std::unique_ptr<Expr> rhs_expr,
             LineRange line_range)
      : Expr(line_range), id_(std::move(id)), rhs_expr_(std::move(rhs_expr)) {}

  std::string ToString() const override;

 private:
  std::string id_;
  std::unique_ptr<Expr> rhs_expr_;
};

class IntExpr : public Expr {
 public:
  IntExpr(std::string val, LineRange line_range)
      : Expr(line_range), val_(std::move(val)) {}

  std::string ToString() const override;

 private:
  std::string val_;
};

class Formal {
 public:
  Formal(std::string id, std::string type, LineRange line_range)
      : id_(std::move(id)), type_(std::move(type)), line_range_(line_range) {}

  std::string GetId() const { return id_; }
  std::string GetType() const { return type_; }
  LineRange GetLineRange() const { return line_range_; }

  std::string ToString() const;

 private:
  std::string id_;
  std::string type_;
  LineRange line_range_;
};

class Feature {
 public:
  virtual std::string ToString() const = 0;
};

class MethodFeature : public Feature {
 public:
  MethodFeature(std::string id, std::string return_type,
                std::unique_ptr<Expr> body, LineRange line_range)
      : id_(std::move(id)),
        return_type_(std::move(return_type)),
        body_(std::move(body)),
        line_range_(line_range) {}

  std::string ToString() const override;

 private:
  std::string id_;
  // TODO arg list
  std::string return_type_;
  std::unique_ptr<Expr> body_;
  LineRange line_range_;
};

class AttributeFeature : public Feature {
 public:
  AttributeFeature(std::string id, std::string type, LineRange line_range)
      : id_(std::move(id)), type_(std::move(type)), line_range_(line_range) {}

  std::string ToString() const override;

 private:
  std::string id_;
  std::string type_;
  std::unique_ptr<Expr> initialization_expr_;
  LineRange line_range_;
};

class CoolClass {
 public:
  CoolClass(std::string type, std::optional<std::string> inherits_type,
            std::vector<std::unique_ptr<Feature>>&& features,
            LineRange line_range, std::string containing_file_name)
      : type_(std::move(type)),
        inherits_type_(std::move(inherits_type)),
        features_(std::move(features)),
        line_range_(line_range),
        containing_file_name_(std::move(containing_file_name)) {}

  LineRange GetLineRange() const { return line_range_; }

  std::string ToString() const;

  std::string InheritsTypeAsString() const {
    return inherits_type_.value_or("Object");
  }

 private:
  std::string type_;
  std::optional<std::string> inherits_type_;
  std::vector<std::unique_ptr<Feature>> features_;
  LineRange line_range_;

  std::string containing_file_name_;
};

class Program {
 public:
  Program(std::vector<CoolClass>&& cool_classes, LineRange line_range)
      : classes_(std::move(cool_classes)), line_range_(line_range) {}

  std::string ToString() const;

 private:
  std::vector<CoolClass> classes_;
  LineRange line_range_;
};

}  // namespace ast
}  // namespace coolang

#endif  // COOLANG_PARSER_AST_H
