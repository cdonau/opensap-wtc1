CLASS zcl_roman_converter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    METHODS to_arabic
      IMPORTING
        i_roman        TYPE string
      RETURNING
        VALUE(r_value) TYPE i.
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_ROMAN_CONVERTER IMPLEMENTATION.


  METHOD to_arabic.

    DATA current_value TYPE i.
    DATA roman TYPE string.

    CHECK i_roman IS NOT INITIAL.
    roman = to_upper( i_roman ).

    " Check first for two char digits
    IF strlen( roman ) > 1.
      current_value =
        SWITCH i( roman(2)
          WHEN 'CM' THEN 900
          WHEN 'CD' THEN 400
          WHEN 'XC' THEN 90
          WHEN 'XL' THEN 40
          WHEN 'IX' THEN 9
          WHEN 'IV' THEN 4
          ELSE 0 ).
    ENDIF.

    IF current_value <> 0.
      " In this case we shift two chars
      roman = shift_left( val = roman places = 2 ).
    ELSE.
      " No two char digit found => Check for one char
      current_value =
        SWITCH i( roman(1)
            WHEN 'M' THEN 1000
            WHEN 'D' THEN 500
            WHEN 'C' THEN 100
            WHEN 'L' THEN 50
            WHEN 'X' THEN 10
            WHEN 'V' THEN 5
            WHEN 'I' THEN 1
            ELSE 0 ).

      " Now just shift one char
      roman = shift_left( val = roman places = 1 ).
    ENDIF.

    r_value = current_value + me->to_arabic( roman ).

  ENDMETHOD.
ENDCLASS.
