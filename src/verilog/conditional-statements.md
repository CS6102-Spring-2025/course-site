# Conditional Statements

The conditional statements are used to determine whether a particular statement should be executed or not. Control statements in Verilog are similar to control statements in C.

---

## if-else

If the expression in the `if` condition is true, then the statements inside the `if` condition will be executed. If it is false, the statements inside the `else` condition will be executed.

---

### Syntax

```verilog
if (expression)
    [statement]
else
    [statement]
```

---

## if-else with Multiple Statements

For multiple statements, the `begin` and `end` keywords are used.

```verilog
if (expression) begin
    [multiple statements]
end
else begin
    [multiple statements]
end
```

---

### Example
```verilog
always @(posedge clock) begin
   if (reset) state <= IDLE;
   else state <= next_state;
end
```
---

Similar to C, it is possible to have nested `if` statements in Verilog.

---

## Conditional Operator

You can assign a value based on a condition by using the conditional operator.

---

### Syntax

```verilog
variable = <condition> ? <expression1> : <expression2>;
```

If the condition is true, `expression1` is assigned to the variable, or else `expression2` is assigned to the variable.
