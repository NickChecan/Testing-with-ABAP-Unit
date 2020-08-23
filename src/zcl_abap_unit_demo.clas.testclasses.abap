*"* use this source file for your ABAP unit test classes

class zctl_test_class definition for testing
    duration short
    risk level harmless.

    private section.

        data: m_cut type ref to zcl_abap_unit_demo.

        methods: setup.

        methods: qty_100_dis_5 for testing
        raising cx_static_check.

        methods: amt_100_perc_90 for testing
        raising cx_static_check.

endclass.

class zctl_test_class implementation.

  method setup.

    m_cut = new zcl_abap_unit_demo( ).

  endmethod.

  method qty_100_dis_5.

    data(discount) = m_cut->determine_discount(
        im_qty = '100.00'
    ).

    cl_abap_unit_assert=>assert_equals(
        act = discount
        exp = '0.05'
        msg = 'Wrong discount'
    ).

  endmethod.

  method amt_100_perc_90.

    data(amount) = m_cut->determine_discounted_amount(
        im_perc = '90.00'
        im_amount = '100.00'
    ).

    cl_abap_unit_assert=>assert_equals(
        act = amount
        exp = '90.00'
        msg = 'Wrong amount'
    ).

  endmethod.

endclass.
