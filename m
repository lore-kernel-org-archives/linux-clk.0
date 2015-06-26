Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:39679 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751721AbbFZKYJ (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jun 2015 06:24:09 -0400
Date: Fri, 26 Jun 2015 13:23:59 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: rjui@broadcom.com
Cc: linux-clk@vger.kernel.org
Subject: re: clk: iproc: add initial common clock support
Message-ID: <20150626102359.GA32453@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Ray Jui,

The patch 5fe225c105fd: "clk: iproc: add initial common clock
support" from May 5, 2015, leads to the following static checker
warning:

	drivers/clk/bcm/clk-iproc-pll.c:369 iproc_pll_recalc_rate()
	warn: should 'ndiv_int << ctrl->ndiv_int.shift' be a 64 bit type?

drivers/clk/bcm/clk-iproc-pll.c
  341  static unsigned long iproc_pll_recalc_rate(struct clk_hw *hw,
   342                                             unsigned long parent_rate)
   343  {
   344          struct iproc_clk *clk = to_iproc_clk(hw);
   345          struct iproc_pll *pll = clk->pll;
   346          const struct iproc_pll_ctrl *ctrl = pll->ctrl;
   347          u32 val;
   348          u64 ndiv;
   349          unsigned int ndiv_int, ndiv_frac, pdiv;
   350  
   351          if (parent_rate == 0)
   352                  return 0;
   353  
   354          /* PLL needs to be locked */
   355          val = readl(pll->pll_base + ctrl->status.offset);
   356          if ((val & (1 << ctrl->status.shift)) == 0) {
   357                  clk->rate = 0;
   358                  return 0;
   359          }
   360  
   361          /*
   362           * PLL output frequency =
   363           *
   364           * ((ndiv_int + ndiv_frac / 2^20) * (parent clock rate / pdiv)
   365           */
   366          val = readl(pll->pll_base + ctrl->ndiv_int.offset);
   367          ndiv_int = (val >> ctrl->ndiv_int.shift) &
   368                  bit_mask(ctrl->ndiv_int.width);
   369          ndiv = ndiv_int << ctrl->ndiv_int.shift;

ndiv is declared u64 but only the lower 32 bits are used because of
shift wrapping.

   370  
   371          if (ctrl->flags & IPROC_CLK_PLL_HAS_NDIV_FRAC) {
   372                  val = readl(pll->pll_base + ctrl->ndiv_frac.offset);
   373                  ndiv_frac = (val >> ctrl->ndiv_frac.shift) &
   374                          bit_mask(ctrl->ndiv_frac.width);
   375  
   376                  if (ndiv_frac != 0)
   377                          ndiv = (ndiv_int << ctrl->ndiv_int.shift) | ndiv_frac;
                                        ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Here as well.

   378          }

regards,
dan carpenter
