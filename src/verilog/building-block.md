# Building Blocks in Verilog

Verilog provides several fundamental building blocks that allow designers to describe the structure and behavior of digital systems. These building blocks work together to define how hardware components are created, connected, and operated.

---

## 1. Verilog `Module`

A Verilog module is a self-contained unit that defines a specific functionality. It serves as a blueprint for creating instances of that functionality in your design. Modules **encapsulate** a set of logic, inputs, outputs, and potentially internal signals.

```verilog
module Adder (
    input  [3:0] A,
    input  [3:0] B,
    output [4:0] Sum
);

    // Logic to implement addition

endmodule
```

---

## 2. Verilog `Port`

Ports are the communication interfaces of a Verilog module. They define how information flows in and out of the module. Ports can be `inputs`, `outputs`, or `bidirectional`, allowing modules to interact with other parts of the design.

```verilog
module Decoder (
    input [2:0] Input,
    output reg [7:0] Output
);

    // Logic to decode the input signals

endmodule
```
---

## 3. Verilog Module Instantiations

Module instantiations are instances of a module created within another module. They allow you to use the functionality defined in one module inside another, enabling hierarchical and reusable design structures.

```verilog
module TopModule;
    Adder   A1 (.A(inA), .B(inB), .Sum(sum));
    Decoder D1 (.Input(selector), .Output(decodedOutput));
endmodule
```

---

## 4. Verilog `Assign` Statements

The `assign` statement connects a source to a destination, creating a continuous assignment. It is used to connect wires or signals directly without using a procedural block, making it suitable for modeling **combinational logic**.

```verilog
assign Sum = A + B;
```
---

## 5. Verilog `Always` Block

The `always` block defines procedural logic that executes whenever the conditions specified within it are met. It is often used for **sequential logic** and state machines.

```verilog 
always @(posedge clock) begin
    if (reset) state <= IDLE;
    else state <= next_state;
end
```
In an `always` block triggered by a clock signal, the logic statements are executed at each positive edge of the clock.

---

## 6. Verilog `Initial` Block

The `initial` block contains procedural code that is executed only once at the start of simulation. It is commonly used for **setting initial values** or performing setup tasks, especially in testbenches.

```verilog
initial begin
    clk = 0;
    reset = 1;

    // Other initialization tasks
    
end
```

---

These building blocks collectively allow you to create complex digital designs by defining the structure, behavior, and interactions of different components in your Verilog code.
