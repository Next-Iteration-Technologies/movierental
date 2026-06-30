class Movie {

    static CHILDRENS = 2;
    static NEW_RELEASE = 1;
    static REGULAR = 0;

    constructor(title, priceCode) {
        this._title = title;
        this._priceCode = priceCode;
    }

    getPriceCode() {
        return this._priceCode;
    }

    setPriceCode(arg) {
        this._priceCode = arg;
    }

    getTitle() {
        return this._title;
    }
}

export default Movie;
