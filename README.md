# MovieRental Refactoring Exercise

This source code follows Martin Fowler's book "Refactoring, Improving the Design of Existing Code".

When you find you have to add a feature to a program, and the program's code is not
structured in a convenient way to add the feature, first refactor the program to make it
easy to add the feature, then add the feature.

Whenever you do refactoring, the first step is always the same.
You need to build a solid set of tests for that section of code. The tests are essential because even though you follow refactorings structured to avoid most of the opportunities for introducing bugs, you are still human and still make mistakes. Thus, you need solid tests that act as safety net when we refactor the code.

## Problem Statement
- This codebase includes a refactoring exercise implemented in ABAP.
- Read the problem statement here: [MovieRentalRequirements.md](MovieRentalRequirements.md) thoroughly before attempting the exercise.

This refactoring exercise, when performed systematically provides insight into understanding different code smells, the technique to refactor and the design principles to consider while refactoring. This is an exercise to demonstrate how clean code can be evolved from legacy codebase.

## Setup

All you need is access to an SAP ABAP system (SAP BTP ABAP Environment, SAP S/4HANA, or an on-premise ABAP system).

Upload the following `.abap` files to your system using ABAP Development Tools (ADT) in Eclipse or the SAP GUI:

- `zcl_mr_movie.abap` — Movie class
- `zcl_mr_rental.abap` — Rental class
- `zcl_mr_customer.abap` — Customer class with the `statement` method
- `zcl_mr_customer_test.abap` — ABAP Unit test class

## Testing

Tests are implemented using the ABAP Unit framework. Run them from ADT by right-clicking the test class and selecting **Run As → ABAP Unit Test**, or execute via transaction `SE80` / `SE24` using **Program → Test → Unit Test**.

Tests are located in `zcl_mr_customer_test.abap`.
