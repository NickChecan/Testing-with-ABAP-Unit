*&---------------------------------------------------------------------*
*& Report z_abap_unit_tdd
*&---------------------------------------------------------------------*
report z_abap_unit_tdd.

*&---------------------------------------------------------------------*
*& Classes
*&---------------------------------------------------------------------*
class lcl_discount_provider definition final.

  public section.

    methods determine_discount
      importing
        value(im_qty) type wrbtr
      returning
        value(r_result) type wrbtr.

    methods calculate_discounted_amount
      importing
        value(im_perc) type wrbtr
        value(im_value) type wrbtr
      returning
        value(r_result) type wrbtr.

  protected section.

  private section.

endclass.

class lcl_discount_provider implementation.

  method determine_discount.

  endmethod.


  method calculate_discounted_amount.

  endmethod.

endclass.

*&---------------------------------------------------------------------*
*& Test Class
*&---------------------------------------------------------------------*
class: lcl_test_discount definition for testing
duration short
risk level harmless.

    private section.

    data: discount_provider type ref to lcl_discount_provider.

    methods: setup.

    methods: test_qty_100_dis_5.

    methods: test_qty_90_dis_2.

    methods: test_qty_250_per_90.

endclass.

class lcl_test_discount implementation.

  method setup.
    me->discount_provider = new #( ).
  endmethod.

  method test_qty_100_dis_5.

    data(lv_discount) = me->discount_provider->determine_discount(
        im_qty = '100.00'
    ).

    cl_abap_unit_assert=>assert_equals(
      exporting
        act = lv_discount              " Data object with current value
        exp = '0.05'                   " Data object with expected type
        msg = 'Wrong discount amount!' " Description
    ).

  endmethod.

  method test_qty_250_per_90.

    data(lv_discount) = me->discount_provider->determine_discount(
        im_qty = '90.00'
    ).

    cl_abap_unit_assert=>assert_equals(
      exporting
        act = lv_discount              " Data object with current value
        exp = '0.02'                   " Data object with expected type
        msg = 'Wrong discount amount!' " Description
    ).

  endmethod.

  method test_qty_90_dis_2.

    data(lv_discounted_amount) = me->discount_provider->calculate_discounted_amount(
        im_perc  = '15.00'
        im_value = '70.00'
    ).

    cl_abap_unit_assert=>assert_equals(
      exporting
        act  = lv_discounted_amount       " Data object with current value
        exp  = '10,50'                    " Data object with expected type
        msg  = 'Wrong calculated amount!' " Description
    ).

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
