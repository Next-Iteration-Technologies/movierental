" The rental class represents a customer renting a movie.
CLASS zcl_mr_rental DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING
          io_movie       TYPE REF TO zcl_mr_movie
          iv_days_rented TYPE i,
      get_days_rented
        RETURNING
          VALUE(rv_days_rented) TYPE i,
      get_movie
        RETURNING
          VALUE(ro_movie) TYPE REF TO zcl_mr_movie.

  PRIVATE SECTION.
    DATA:
      mo_movie       TYPE REF TO zcl_mr_movie,
      mv_days_rented TYPE i.

ENDCLASS.


CLASS zcl_mr_rental IMPLEMENTATION.

  METHOD constructor.
    mo_movie       = io_movie.
    mv_days_rented = iv_days_rented.
  ENDMETHOD.

  METHOD get_days_rented.
    rv_days_rented = mv_days_rented.
  ENDMETHOD.

  METHOD get_movie.
    ro_movie = mo_movie.
  ENDMETHOD.

ENDCLASS.
