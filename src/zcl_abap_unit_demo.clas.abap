class zcl_abap_unit_demo definition public final create public .

public section.

    methods: determine_discounted_amount
    importing value(im_perc) type wrbtr
              value(im_amount) type wrbtr
    returning value(r_amount) type wrbtr.

    methods: determine_discount
    importing value(im_qty) type wrbtr
    returning value(r_discount) type wrbtr.

protected section.

private section.

endclass.

class zcl_abap_unit_demo implementation.

  method determine_discount.

    r_discount = cond #( let q = '100.00' in
        when im_qty = '0.00' then '0.00'
        when im_qty ge q then '.05'
        when im_qty lt q then '.02'
        else '0.00'
    ).

  endmethod.

  method determine_discounted_amount.

    if im_perc is not initial
    and im_amount is not initial.
      r_amount = im_amount * im_perc / 100.
    endif.

  endmethod.

endclass.
