class Movie {

    static CHILDRENS: number = 2;
    static NEW_RELEASE: number = 1;
    static REGULAR: number = 0;

    private _title: string;
    private _priceCode: number;

    constructor(title: string, priceCode: number) {
        this._title = title;
        this._priceCode = priceCode;
    }

    getPriceCode(): number {
        return this._priceCode;
    }

    setPriceCode(arg: number): void {
        this._priceCode = arg;
    }

    getTitle(): string {
        return this._title;
    }
}

export default Movie;
