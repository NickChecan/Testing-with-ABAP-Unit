*&---------------------------------------------------------------------*
*& Report z_abap_unit_tdd
*&---------------------------------------------------------------------*
*& Requirement:
*&
*& value - user input
*&
*& value > 100 = Discount = 0.5
*& value < 100 = Discount = 0.2
*&
*& Display the value calculated with the discount
*&---------------------------------------------------------------------*
report z_abap_tdd_todo.

*&---------------------------------------------------------------------*
*& Classes
*&---------------------------------------------------------------------*

*&---------------------------------------------------------------------*
*& Test Class
*&---------------------------------------------------------------------*
class: lcl_test_discount definition for testing
duration short
risk level harmless.

    private section.

"    data: discount_provider type ref to lcl_discount_provider.

    methods: setup.

endclass.

class lcl_test_discount implementation.

  method setup.
    "me->discount_provider = new #( ).
  endmethod.

endclass.

*&---------------------------------------------------------------------*
*& Selection Screen
*&---------------------------------------------------------------------*
selection-screen begin of block a with frame.
parameters: p_qty type wrbtr.
selection-screen end of block a.

*&---------------------------------------------------------------------*
*& Events
*&---------------------------------------------------------------------*
start-of-selection.
