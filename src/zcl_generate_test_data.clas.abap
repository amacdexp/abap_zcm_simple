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
    move sy-mandt to wa_itab-client.
    move 'LH'     to wa_itab-carrier_id.
    move '0400'   to wa_itab-connection_id.
    move sy-datum to wa_itab-flight_date.

    move 200      to wa_itab-restricted_seats.
    move 11       to wa_itab-restricted_seats_b.
    move 10       to wa_itab-restricted_seats_f.


*   Write to table
    insert zsflight_ext from wa_itab.

*   Check output with demo class
    select *
    from zsflight_ext
    into table itab
    up to 10 rows.


    out->write( sy-dbcnt ).
    out->write( 'ZSFLIGHT data inserted successfully!').

  ENDMETHOD.

ENDCLASS.
