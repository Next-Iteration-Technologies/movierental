import Movie from './Movie';

/**
 * The rental class represents a customer renting a movie.
 */
class Rental {

    private _movie: Movie;
    private _daysRented: number;

    constructor(movie: Movie, daysRented: number) {
        this._movie = movie;
        this._daysRented = daysRented;
    }

    getDaysRented(): number {
        return this._daysRented;
    }

    getMovie(): Movie {
        return this._movie;
    }
}

export default Rental;
