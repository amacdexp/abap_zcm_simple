class ZCL_GENERATE_TEST_DATA definition
  public
  final
  create public .

public section.
  INTERFACES if_oo_adt_classrun.
protected section.
private section.
ENDCLASS.



CLASS ZCL_GENERATE_TEST_DATA IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA: itab TYPE TABLE OF zsflight_ext.
    DATA: wa_itab   like line of itab.

*   delete existing entries in the database table
    DELETE FROM zsflight_ext.

*   Prepare first entry for table
    WA_ITAB-CLIENT = SY-MANDT.
    WA_ITAB-CARRIER_ID = 'LH'.
    WA_ITAB-CONNECTION_ID = '0400'.

    DATA(sy_DATUM352) = cl_abap_context_info=>get_system_date( ).
    WA_ITAB-FLIGHT_DATE = sy_DATUM352.

    WA_ITAB-RESTRICTED_SEATS = 200.
    WA_ITAB-RESTRICTED_SEATS_B = 11.
    WA_ITAB-RESTRICTED_SEATS_F = 10.


*   Write to table
    INSERT ZSFLIGHT_EXT FROM @WA_ITAB.

*   Check output with demo class
    SELECT
    FROM ZSFLIGHT_EXT fields *
    INTO TABLE @ITAB
    UP TO 10 ROWS.


    out->write( sy-dbcnt ).
    out->write( 'ZSFLIGHT data inserted successfully!').

  ENDMETHOD.

ENDCLASS.
