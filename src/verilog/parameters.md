# Parameters  
Parameters in Verilog are nothing but a way to instantiate constants in the digital design.

A parameter is local to a module, but it can change value when the module is instantiated. It is used to define a property of the module.

---

## Syntax

```verilog
parameter <parameter_name> = <constant_expression>;
```
---

## Example

```verilog
parameter size = 4;
parameter clk  = freq / 2;
```

This property can be left to default, or it can be modified at instantiation of the module.

By default, the adder is 8-bit (the width parameter uses the default assigned value of 8). However, the instantiator module can change the parameter value.

---

## Local Parameter

A local parameter (`localparam`) is also used to store constants in the digital design, but the constant
