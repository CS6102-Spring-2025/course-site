<!-- <div id="tutorial-jan28-notice"
  style="
    background-color:#111827;
    border-left:6px solid #f59e0b;
    color:#f9fafb;
    padding:14px 18px;
    margin:20px 0;
    border-radius:6px;
    box-shadow:0 4px 12px rgba(0,0,0,0.4);
    position:relative;
  ">
  <strong>📌 Tutorial Announcement</strong>
  <div style="margin-top:4px;">
    <strong>Jan 28 (Tuesday): Tutorial class — Mandatory attendance</strong>
  </div>

  <button onclick="document.getElementById('tutorial-jan28-notice').style.display='none';"
    style="
      position:absolute;
      top:10px;
      right:14px;
      background:none;
      border:none;
      color:#f59e0b;
      font-size:20px;
      cursor:pointer;
    ">
    ×
  </button>
</div> -->

<div id="assignment1-notice" style=" background-color:#111827; border-left:6px solid #f59e0b; color:#f9fafb; padding:14px 18px; margin:20px 0; border-radius:6px; box-shadow:0 4px 12px rgba(0,0,0,0.4); position:relative; "> <strong>📌 Assignment 1 Announcement</strong> <div style="margin-top:4px;"> Submission deadline: <strong>20 February 2026</strong>. Submissions via <strong>Moodle</strong>. 

<div style="margin-top:6px;">
  <a href="/assignments.html" style="color:#f59e0b; text-decoration:underline; font-size:0.9em;">View assignment details</a>
  &nbsp;|&nbsp;
  <a href="https://forms.gle/kzjKPqYcJz2GAMXH8" style="color:#f59e0b; text-decoration:underline; font-size:0.9em;">
    Group registration form (one member per group)
  </a>
</div>


</div> 
<button onclick="document.getElementById('assignment1-notice').style.display='none';" style=" position:absolute; top:10px; right:14px; background:none; border:none; color:#f59e0b; font-size:20px; cursor:pointer; "> × </button>
 </div>


# Implementation Security in Cryptography

**Instructor:**  
[Prof. Sayandeep Saha](https://sites.google.com/view/sayandeepsaha/home)

---

## Course Details

| | |
|---|---|
| **Lecture Slot** | 6 |
| **Lecture Venue** | CC 101 |
| **Lecture Schedule** | Wednesday and Friday, 11:05 AM – 12:30 PM |
| **Piazza** | [Course Piazza Page](https://piazza.com/iit_bombay/spring2026/cs6102) |
| **Piazza Access Code** | `cs6102` |
| **Instructor Office Hours** | After class or by prior email appointment |
| **Teaching Assistants** | **[Shoaib Ahamed](https://www.cse.iitb.ac.in/~sgshoaibahamed/)** (24m2102 [at] iitb.ac.in)<br>**[Aritra Belel](https://www.cse.iitb.ac.in/~aritrabelel/)** (24m0814 [at] iitb.ac.in)<br>**[Keyaan Kartikeya Rajesh](https://www.cse.iitb.ac.in/~keyaan/)** (24b0977 [at] iitb.ac.in)<br><br>*Please use Piazza for general course-related queries.* |

<!-- ---

## Course Outline

The detailed course outline and reference material are available on the  
[official course webpage](https://sites.google.com/view/sayandeepsaha/courses/implementation-security-in-cryptography). -->

---

## Lecture Schedule (Tentative)

### Weeks 1–2: Foundations and Motivation
- Relationship between hardware security and cryptographic theory
- Fundamentals of block ciphers and hardware design principles

### Weeks 3–5/6: Hardware Design of AES
- Finite field arithmetic
- Finite field multipliers
- Architectural design of AES

### Weeks 7–9: Side-Channel Attacks
- Introduction to power analysis attacks
- Classification of power-based side-channel attacks
- Countermeasures against power attacks

### Week 10 Onwards
- Fault injection attacks
- Fault attack countermeasures
- Advanced topics in implementation security

---

<!-- ## Detailed Lecture Plan

| Date | Lecture Topic | Prerequisites | Lecture Slides | Lecture video | Reading Material |
|---|---|---|---|---|---|
| Jan 07 | Course Prelude and Introduction | – | [Lecture 01-slides ](slides/ISC_lec1.pdf) | [lecture 1 video](https://youtu.be/5agBRN75GPk?si=25lxIxpa3wNH1xJq)  | – |
| Jan 09 | Some basics and Perfect Secrecy | – | [Lecture 02-slides ](slides/ISC_lec2.pdf) | [lecture 2 video]()  | – |
| Jan 14 | Computational secrecy and block ciphers | Lec 2 | [Lecture 03-slides](slides/ISC_lec3.pdf) | [lecture 3 video](https://youtu.be/65B3pzsPMFk)  | – | -->

## Detailed Lecture Plan

| Date | Topic | Prerequisites | Slides | YouTube Video | Reading / References |
|------|-------|---------------|--------|-------|----------------------|
| Jan 07 | Course Prelude and Introduction | — | [Lecture 01](slides/ISC_lec1.pdf) | [Video](https://youtu.be/5agBRN75GPk?si=25lxIxpa3wNH1xJq) | — |
| Jan 09 | Fundamentals and Perfect Secrecy | — | [Lecture 02](slides/ISC_lec2.pdf) | [Video](https://youtu.be/jlRH6im7Ni8) | [Introduction to Modern Cryptography](https://www.google.co.in/books/edition/Introduction_to_Modern_Cryptography_Seco/OWZYBQAAQBAJ?hl=en&gbpv=1&pg=PA25&printsec=frontcover) |
| Jan 14 | Computational Secrecy and Block Ciphers | Lecture 2 | [Lecture 03](slides/ISC_lec3.pdf) | [Video](https://youtu.be/65B3pzsPMFk) | — |
| Jan 16 | Hardware Design Using Verilog | Basics of digital logic (MUX, flip-flops, registers, etc.) — see [Resources](resources.md#digital-circuits) | [Lecture 04](slides/ISC_lec4.pdf) | [Video](https://youtu.be/4s_JIQ2wqL8) | [ASIC World: Verilog HDL](https://asic-world.com/verilog/index.html) |
| Jan 21 | Sequential Circuits & Hardware Mapping | Lecture 4 | Lecture 4 slides + [extended slides](slides/Lec_4_ext_Mapping_an_algorithm_to_hardware.pdf) | [Video](https://youtu.be/9eYv7Vz8c3U) | [Switching and Finite Automata Theory](https://www.google.co.in/books/edition/Switching_and_Finite_Automata_Theory/Qv0LBAAAQBAJ?hl=en&gbpv=1&pg=PP1&printsec=frontcover) |
| Jan 23 | Finite Fields and Hardware | — | [Lecture 06](slides/ISC_lec6.pdf) | [Video](https://youtu.be/jbZetkHINS4) | — |
| Jan 28 | Verilog Tutorial (Tutorial 1) | — | [Tutorial 1](slides/Tutorial1.pdf) | — | · [Tutorial Tab](tutorials/1/index.html) <br> · [Download Files](tutorials/1/Tutorial1.tar.gz)|
| Jan 30 | Galois Fields and AES Introduction | — | [Lecture 07](slides/ISC_lec7.pdf) | [Video](https://youtu.be/NOIWtU-vDgc) | — |
| Feb 04 | Field Operations over Hardware | — | [Lecture 08](slides/ISC_lec8.pdf) | [Video](https://youtu.be/RY41eaS_R0I) | — |
| Feb 06 | Extension Fields Isomorphism | — | [Lecture 09-10](slides/ISC_lec9_10.pdf) | [Video](https://youtu.be/ZzNfmcmB6hE) | — |
| Feb 11 | Quiz - I | — | [Quiz-I_solutions](slides/quiz1.pdf) | — | — |
| Feb 13 | Extension Fields Isomorphism contd. | — | [Lecture 09-10](slides/ISC_lec9_10.pdf) | [Video](https://youtu.be/n1CdWUEP5EI) | — |

---
## Grading Policy (Tentative)

| Component                                  | Weight | Notes |
|--------------------------------------------|--------|-------|
| Programming Assignments                     | 30%    | Best 2 out of 3 assignments will be considered |
| Quizzes                                     | 30%    | - |
| Mid-Semester and End-Semester Examinations | 40%    | - |


---

> *Note:* All schedules and policies are subject to revision during the semester.
