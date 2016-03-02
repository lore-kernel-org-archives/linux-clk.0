Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:21887 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751616AbcCBLLs (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 2 Mar 2016 06:11:48 -0500
Date: Wed, 2 Mar 2016 14:11:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: tony@atomide.com
Cc: linux-clk@vger.kernel.org
Subject: re: clk: ti: Add support for dm814x ADPLL
Message-ID: <20160302111130.GA10965@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Tony Lindgren,

The patch e6ab1637c643: "clk: ti: Add support for dm814x ADPLL" from
Feb 26, 2016, leads to the following static checker warnings:

	drivers/clk/ti/adpll.c:465 ti_adpll_recalc_rate()
	warn: should '__readw(d->regs + 20) << 18' be a 64 bit type?

	drivers/clk/ti/adpll.c:945 ti_adpll_probe()
	error: we previously assumed 'd->clocks' could be null (see line 921)

drivers/clk/ti/adpll.c
   450  static unsigned long ti_adpll_recalc_rate(struct clk_hw *hw,
   451                                            unsigned long parent_rate)
   452  {
   453          struct ti_adpll_dco_data *dco = to_dco(hw);
   454          struct ti_adpll_data *d = to_adpll(dco);
   455          u32 frac_m, divider, v;
   456          u64 rate;
   457          unsigned long flags;
   458  
   459          if (ti_adpll_clock_is_bypass(d))
   460                  return 0;
   461  
   462          spin_lock_irqsave(&d->lock, flags);
   463          frac_m = readl_relaxed(d->regs + ADPLL_FRACDIV_OFFSET);
   464          frac_m &= ADPLL_FRACDIV_FRACTIONALM_MASK;
   465          rate = readw_relaxed(d->regs + ADPLL_MN2DIV_OFFSET) << 18;

This should probably be:
		rate = (u64)readw_relaxed(d->regs + ADPLL_MN2DIV_OFFSET) << 18;

   466          rate += frac_m;
   467          rate *= parent_rate;
[ snip ]

   773  static void ti_adpll_free_resources(struct ti_adpll_data *d)
   774  {
   775          int i;
   776  
   777          for (i = TI_ADPLL_M3; i >= 0; i--) {
   778                  struct ti_adpll_clock *ac = &d->clocks[i];
   779  
   780                  if (!ac || IS_ERR_OR_NULL(ac->clk))

ac can't possibly be NULL here.

   781                          continue;
   782                  if (ac->cl)
   783                          clkdev_drop(ac->cl);
   784                  if (ac->unregister)
   785                          ac->unregister(ac->clk);
   786          }
   787  }
[ snip ]

   910          err = ti_adpll_init_registers(d);
   911          if (err)
   912                  return err;
   913  
   914          err = ti_adpll_init_inputs(d);
   915          if (err)
   916                  return err;
                        ^^^^^^^^^^
This is the last direct return in the function, meaning that
ti_adpll_init_inputs() must allocate something but I can't see what.
It should match clkdev_drop() and ac->unregister()?  I don't understand.

   917  
   918          d->clocks = devm_kzalloc(d->dev, sizeof(struct ti_adpll_clock) *
   919                                   TI_ADPLL_NR_CLOCKS,
   920                                   GFP_KERNEL);
   921          if (!d->clocks)
   922                  goto free;

We don't set the error code here.

   923  
   924          err = ti_adpll_init_dco(d);
   925          if (err) {
   926                  dev_err(dev, "could not register dco: %i\n", err);
   927                  goto free;
   928          }
   929  
   930          err = ti_adpll_init_children_adpll_s(d);
   931          if (err)
   932                  goto free;
   933          err = ti_adpll_init_children_adpll_lj(d);
   934          if (err)
   935                  goto free;
   936  
   937          err = of_clk_add_provider(d->np, of_clk_src_onecell_get, &d->outputs);
   938          if (err)
   939                  goto free;
   940  
   941          return 0;
   942  
   943  free:
   944          WARN_ON(1);
   945          ti_adpll_free_resources(d);

This is a classic one err bug, where we have a single exit point but
it's too complicated and subtle to handle all errors so we mess up.  The
label doesn't indicate what we are freeing.

Ideally, the allocate and the free functions mirror each other but I
don't see a ti_adpll_(alloc|register|whatever)_resources().  Possibly
this is a mirror of ti_adpll_init_dco() so it could be called
ti_adpll_free_dco()?  I'm not sure.

   946  
   947          return err;

regards,
dan carpenter
