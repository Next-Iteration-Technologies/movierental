# Movie Rental Requirements

In this MovieRental codebase, the `statement` method prints out a simple text output of a rental statement
```
Rental Record for martin
  Ran 3.5
  Trois Couleurs: Bleu 2.0
Amount owed is 5.5
You earned 2 frequent renter points
```
We want to write an HTML version of the statement method :
```
<h1>Rental Record for <em>martin</em></h1>
<table>
  <tr><td>Ran</td><td>3.5</td></tr>
  <tr><td>Trois Couleurs: Bleu</td><td>2.0</td></tr>
</table>
<p>Amount owed is <em>5.5</em></p>
<p>You earned <em>2</em> frequent renter points</p>
```


## Setup
All you need is Node.js and npm.

    $ npm install

## Testing
Unit tests can be run using npm:

    $ npm test

Tests are located in `src/CustomerTest.js` and run using Vitest.
