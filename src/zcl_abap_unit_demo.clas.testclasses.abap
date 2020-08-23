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

    DATA(AMOUNT) = M_CUT->DETERMINE_DISCOUNTED_AMOUNT(
        IM_PERC = '90.00'
        IM_AMOUNT = '100.00'
    ).

    CL_ABAP_UNIT_ASSERT=>assert_equals(
        ACT = AMOUNT
        EXP = '90.00'
        MSG = 'Wrong amount'
    ).

  endmethod.

endclass.
