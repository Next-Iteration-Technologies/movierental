CLASS zcl_mr_customer_test DEFINITION
  PUBLIC
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT
  FINAL.

  PRIVATE SECTION.
    METHODS test FOR TESTING.

ENDCLASS.


CLASS zcl_mr_customer_test IMPLEMENTATION.

  METHOD test.
    DATA(lo_customer) = NEW zcl_mr_customer( 'Bob' ).

    lo_customer->add_rental( NEW zcl_mr_rental(
      io_movie       = NEW zcl_mr_movie( iv_title = 'Jaws'      iv_price_code = zcl_mr_movie=>regular )
      iv_days_rented = 2 ) ).
    lo_customer->add_rental( NEW zcl_mr_rental(
      io_movie       = NEW zcl_mr_movie( iv_title = 'Golden Eye' iv_price_code = zcl_mr_movie=>regular )
      iv_days_rented = 3 ) ).
    lo_customer->add_rental( NEW zcl_mr_rental(
      io_movie       = NEW zcl_mr_movie( iv_title = 'Short New'  iv_price_code = zcl_mr_movie=>new_release )
      iv_days_rented = 1 ) ).
    lo_customer->add_rental( NEW zcl_mr_rental(
      io_movie       = NEW zcl_mr_movie( iv_title = 'Long New'   iv_price_code = zcl_mr_movie=>new_release )
      iv_days_rented = 2 ) ).
    lo_customer->add_rental( NEW zcl_mr_rental(
      io_movie       = NEW zcl_mr_movie( iv_title = 'Bambi'      iv_price_code = zcl_mr_movie=>childrens )
      iv_days_rented = 3 ) ).
    lo_customer->add_rental( NEW zcl_mr_rental(
      io_movie       = NEW zcl_mr_movie( iv_title = 'Toy Story'  iv_price_code = zcl_mr_movie=>childrens )
      iv_days_rented = 4 ) ).

    DATA lv_expected TYPE string.
    lv_expected =
      |Rental Record for Bob\n|        &&
      |\tJaws\t2.0\n|                  &&
      |\tGolden Eye\t3.5\n|            &&
      |\tShort New\t3.0\n|             &&
      |\tLong New\t6.0\n|              &&
      |\tBambi\t1.5\n|                 &&
      |\tToy Story\t3.0\n|             &&
      |Amount owed is 19.0\n|          &&
      |You earned 7 frequent renter points|.

    cl_abap_unit_assert=>assert_equals(
      act = lo_customer->statement( )
      exp = lv_expected ).
  ENDMETHOD.

ENDCLASS.
