CLASS zcl_mr_customer DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    METHODS:
      constructor
        IMPORTING
          iv_name TYPE string,
      add_rental
        IMPORTING
          io_rental TYPE REF TO zcl_mr_rental,
      get_name
        RETURNING
          VALUE(rv_name) TYPE string,
      statement
        RETURNING
          VALUE(rv_statement) TYPE string.

  PRIVATE SECTION.
    TYPES:
      tt_rentals TYPE STANDARD TABLE OF REF TO zcl_mr_rental WITH EMPTY KEY.

    DATA:
      mv_name    TYPE string,
      mt_rentals TYPE tt_rentals.

    CONSTANTS:
      lc_half TYPE p DECIMALS 1 VALUE '1.5'.

    METHODS:
      format_amount
        IMPORTING
          iv_amount TYPE p DECIMALS 1
        RETURNING
          VALUE(rv_string) TYPE string.

ENDCLASS.


CLASS zcl_mr_customer IMPLEMENTATION.

  METHOD constructor.
    mv_name = iv_name.
  ENDMETHOD.

  METHOD add_rental.
    APPEND io_rental TO mt_rentals.
  ENDMETHOD.

  METHOD get_name.
    rv_name = mv_name.
  ENDMETHOD.

  METHOD statement.
    DATA: lv_total_amount        TYPE p DECIMALS 1,
          lv_frequent_renter_pts TYPE i,
          lv_this_amount         TYPE p DECIMALS 1,
          lv_result              TYPE string.

    lv_total_amount        = 0.
    lv_frequent_renter_pts = 0.
    lv_result = |Rental Record for { get_name( ) }\n|.

    LOOP AT mt_rentals INTO DATA(lo_each).
      lv_this_amount = 0.

      " Determine amounts for each line
      CASE lo_each->get_movie( )->get_price_code( ).
        WHEN zcl_mr_movie=>regular.
          lv_this_amount = lv_this_amount + 2.
          IF lo_each->get_days_rented( ) > 2.
            lv_this_amount = lv_this_amount + ( lo_each->get_days_rented( ) - 2 ) * lc_half.
          ENDIF.
        WHEN zcl_mr_movie=>new_release.
          lv_this_amount = lo_each->get_days_rented( ) * 3.
        WHEN zcl_mr_movie=>childrens.
          lv_this_amount = lv_this_amount + lc_half.
          IF lo_each->get_days_rented( ) > 3.
            lv_this_amount = lv_this_amount + ( lo_each->get_days_rented( ) - 3 ) * lc_half.
          ENDIF.
      ENDCASE.

      " Add frequent renter points
      lv_frequent_renter_pts = lv_frequent_renter_pts + 1.
      " Add bonus for a two day new release rental
      IF lo_each->get_movie( )->get_price_code( ) = zcl_mr_movie=>new_release AND
         lo_each->get_days_rented( ) > 1.
        lv_frequent_renter_pts = lv_frequent_renter_pts + 1.
      ENDIF.

      " Show figures for this rental
      lv_result = lv_result
               && |\t{ lo_each->get_movie( )->get_title( ) }\t{ format_amount( lv_this_amount ) }\n|.
      lv_total_amount = lv_total_amount + lv_this_amount.
    ENDLOOP.

    " Add footer lines
    lv_result = lv_result && |Amount owed is { format_amount( lv_total_amount ) }\n|.
    lv_result = lv_result && |You earned { lv_frequent_renter_pts } frequent renter points|.

    rv_statement = lv_result.
  ENDMETHOD.

  METHOD format_amount.
    " Format a packed decimal like Java's String.valueOf(double):
    " always shows at least one decimal digit (e.g. 2.0, 3.5, 19.0)
    DATA: lv_cents TYPE i,
          lv_whole TYPE i,
          lv_frac  TYPE i.
    lv_cents = iv_amount * 10.
    lv_whole = lv_cents DIV 10.
    lv_frac  = ABS( lv_cents MOD 10 ).
    rv_string = |{ lv_whole }.{ lv_frac }|.
  ENDMETHOD.

ENDCLASS.
