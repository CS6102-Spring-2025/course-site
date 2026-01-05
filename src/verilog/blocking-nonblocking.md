# Blocking & Non-blocking Assignment

Blocking and Non-blocking assignments controls the execution order within `initial` and `always` block statements. **Blocking assignments** are assigned using **`=`** and **Non-blocking** assignments using **`<=`**. Both these assignments are used to generate combination or sequential logic.

---

## Blocking Assignment

In the `always` block below, the Blocking Assignment is used. In this example, the value `1` will immediately propagate to `r_Test_3`. The Blocking assignment immediately takes the value in the right-hand-side and assigns it to the left hand side.

Blocking assignments literally block the execution of the next statement until the current statement is executed.

```verilog
always @(posedge clk) begin
    r_Test_1 = 1;
    r_Test_2 = r_Test_1;
    r_Test_3 = r_Test_2;
end
```

---

## Non-blocking Assignment

The `always` block in the Verilog code below uses the Non-blocking Assignment. It will take three clock cycles for the value `1` to propagate from `r_Test_1` to `r_Test_3`. Now consider this code:

```verilog
always @(posedge clk) begin
    r_Test_1 <= 1;
    r_Test_2 <= r_Test_1;
    r_Test_3 <= r_Test_2;
end
```

It results in simultaneous or parallel statements execution. You can schedule assignments using non-blocking statements so that the procedural flow is not interrupted. Anytime you want to assign many registers in the same time step without respect to their order or dependence on one another, you can use the non-blocking procedural statement.
