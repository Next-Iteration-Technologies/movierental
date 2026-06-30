CLASS zcl_mr_movie DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    CONSTANTS:
      regular     TYPE i VALUE 0,
      new_release TYPE i VALUE 1,
      childrens   TYPE i VALUE 2.

    METHODS:
      constructor
        IMPORTING
          iv_title      TYPE string
          iv_price_code TYPE i,
      get_price_code
        RETURNING
          VALUE(rv_price_code) TYPE i,
      set_price_code
        IMPORTING
          iv_price_code TYPE i,
      get_title
        RETURNING
          VALUE(rv_title) TYPE string.

  PRIVATE SECTION.
    DATA:
      mv_title      TYPE string,
      mv_price_code TYPE i.

ENDCLASS.


CLASS zcl_mr_movie IMPLEMENTATION.

  METHOD constructor.
    mv_title      = iv_title.
    mv_price_code = iv_price_code.
  ENDMETHOD.

  METHOD get_price_code.
    rv_price_code = mv_price_code.
  ENDMETHOD.

  METHOD set_price_code.
    mv_price_code = iv_price_code.
  ENDMETHOD.

  METHOD get_title.
    rv_title = mv_title.
  ENDMETHOD.

ENDCLASS.
