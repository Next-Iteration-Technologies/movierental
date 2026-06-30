# MovieRental Refactoring Exercise

This source code follows Martin Fowler's book "Refactoring, Improving the Design of Existing Code".

When you find you have to add a feature to a program, and the program's code is not
structured in a convenient way to add the feature, first refactor the program to make it
easy to add the feature, then add the feature.

Whenever you do refactoring, the first step is always the same.
You need to build a solid set of tests for that section of code. The tests are essential because even though you follow refactorings structured to avoid most of the opportunities for introducing bugs, you are still human and still make mistakes. Thus, you need solid tests that act as safety net when we refactor the code.

## Problem Statement
- This codebase includes a refactoring exercise under the `src` directory.
- Read the problem statement here: [MovieRentalRequirements.md](MovieRentalRequirements.md) thoroughly before attempting the exercise.

This refactoring exercise, when performed systematically provides insight into understanding different code smells, the technique to refactor and the design principles to consider while refactoring. This is an exercise to demonstrate how clean code can be evolved from legacy codebase. 

## Setup

All you need is Node.js and npm.

    $ npm install

## Testing

Unit tests can be run using npm:

    $ npm test

Tests are located in `src/CustomerTest.js` and run using Vitest.
