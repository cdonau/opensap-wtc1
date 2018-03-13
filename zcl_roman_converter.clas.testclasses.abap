*"* use this source file for your ABAP unit test classes
class ltcl_test_calc definition final for testing
  duration short
  risk level harmless.

  private section.
    DATA m_cut TYPE REF TO zcl_roman_converter.
    methods:
      one_in_1_out for testing raising cx_static_check,
      two_in_2_out FOR TESTING RAISING cx_static_check,
      six_in_6_out FOR TESTING RAISING cx_static_check,
      thousandsixtyone_in_1061_out FOR TESTING RAISING cx_static_check,
      setup.
endclass.


class ltcl_test_calc implementation.

  method setup.
    " Given
    m_cut = new zcl_roman_converter( ).
  endmethod.

  method one_in_1_out.
    "When
    data(out) = m_cut->to_arabic( 'I' ).

    "Then
    cl_abap_unit_assert=>assert_equals( act = out exp = 1 ).
  endmethod.

  method two_in_2_out.
    "When
    data(out) = m_cut->to_arabic( 'II' ).

    "Then
    cl_abap_unit_assert=>assert_equals( act = out exp = 2 ).
  endmethod.

    method six_in_6_out.
    "When
    data(out) = m_cut->to_arabic( 'VI' ).

    "Then
    cl_abap_unit_assert=>assert_equals( act = out exp = 6 ).
  endmethod.

    method thousandsixtyone_in_1061_out.
    "When
    data(out) = m_cut->to_arabic( 'MLXI' ).

    "Then
    cl_abap_unit_assert=>assert_equals( act = out exp = 1061 ).
  endmethod.


endclass.
