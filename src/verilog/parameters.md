# Parameters  
Parameters in Verilog are nothing but a way to instantiate constants in the digital design.

A parameter is local to a module, but it can change value when the module is instantiated. It is used to define a property of the module.


### Syntax

```verilog
parameter <parameter_name> = <constant_expression>;
```

### Example

```verilog
parameter size = 4;
parameter clk  = freq / 2;
```

This property can be left to default, or it can be modified at instantiation of the module.

```verilog
module adder (a, b, sum);
        parameter width = 8;
        input [width-1:0] a;
        input [width-1:0] b;
        output [width-1:0] sum;

        assign sum = a + b;

endmodule
```

By default, the adder is 8-bit (the width parameter uses the default assigned value of 8). However, the instantiator module can change the parameter value.
```verilog
module top;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] sum1;
    wire [15:0] sum2;

    adder add1 (a, b, sum1);
    defparam add1.width = 16;

    adder #(16) add2 (a, b, sum2);

endmodule
```

---

## Local Parameter

A local parameter (`localparam`) is also used to store constants in the digital design, but the constant defined inside the module cannot be changed. (i.e from where the module is instantiated).



### Syntax

```verilog
localparam name = value;
```

### Example

`localparam len = width/12;`

`localparam size = 16;`

```verilog
module adder (a, b, sum);
    parameter height = 8;
    parameter width = 10;
    localparam length = 4;

    input [width-1:0] a;
    input [height-1:0] b;
    input [length-1:0] c;
    output [width-1:0] sum;

    assign sum = a + b + c;
endmodule

module top;
    reg [15:0] a;
    reg [15:0] b;
    wire [15:0] sum1;

    //error as length is not accessible outside the module adder
    adder #(.width(16), .height(4), .length(5) add_0 (a, b, sum2));

endmodule
```