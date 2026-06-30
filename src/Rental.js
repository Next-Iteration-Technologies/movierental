/**
 * The rental class represents a customer renting a movie.
 */
class Rental {

    constructor(movie, daysRented) {
        this._movie = movie;
        this._daysRented = daysRented;
    }

    getDaysRented() {
        return this._daysRented;
    }

    getMovie() {
        return this._movie;
    }
}

export default Rental;
