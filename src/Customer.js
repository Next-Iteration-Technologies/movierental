import Movie from './Movie.js';

class Customer {

    constructor(name) {
        this._name = name;
        this._rentals = [];
    }

    addRental(arg) {
        this._rentals.push(arg);
    }

    getName() {
        return this._name;
    }

    statement() {
        let totalAmount = 0;
        let frequentRenterPoints = 0;
        let result = "Rental Record for " + this.getName() + "\n";

        for (const each of this._rentals) {
            let thisAmount = 0;

            //determine amounts for each line
            switch (each.getMovie().getPriceCode()) {
                case Movie.REGULAR:
                    thisAmount += 2;
                    if (each.getDaysRented() > 2)
                        thisAmount += (each.getDaysRented() - 2) * 1.5;
                    break;
                case Movie.NEW_RELEASE:
                    thisAmount += each.getDaysRented() * 3;
                    break;
                case Movie.CHILDRENS:
                    thisAmount += 1.5;
                    if (each.getDaysRented() > 3)
                        thisAmount += (each.getDaysRented() - 3) * 1.5;
                    break;
            }

            // add frequent renter points
            frequentRenterPoints++;
            // add bonus for a two day new release rental
            if ((each.getMovie().getPriceCode() == Movie.NEW_RELEASE) && each.getDaysRented() > 1)
                frequentRenterPoints++;

            // show figures for this rental
            result += "\t" + each.getMovie().getTitle() + "\t" + thisAmount.toFixed(1) + "\n";
            totalAmount += thisAmount;
        }

        // add footer lines
        result += "Amount owed is " + totalAmount.toFixed(1) + "\n";
        result += "You earned " + String(frequentRenterPoints) + " frequent renter points";

        return result;
    }
}

export default Customer;
