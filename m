Return-Path: <dan.carpenter@oracle.com>
Date: Tue, 21 Jul 2015 00:48:55 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: mturquette@linaro.org
Cc: linux-clk@vger.kernel.org
Subject: re: ARM: OMAP4: clock: Convert to common clk
Message-ID: <20150720214855.GA22901@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
List-ID: <linux-clk.vger.kernel.org>

Hello Mike Turquette,

The patch 32cc002116b8: "ARM: OMAP4: clock: Convert to common clk"
from Nov 10, 2012, leads to the following Smatch warning:

	drivers/clk/ti/clkt_dpll.c:213 omap2_init_dpll_parent()
	warn: signedness bug returning '(-22)'

drivers/clk/ti/clkt_dpll.c
   204  /* Public functions */
   205  u8 omap2_init_dpll_parent(struct clk_hw *hw)
        ^^

   206  {
   207          struct clk_hw_omap *clk = to_clk_hw_omap(hw);
   208          u32 v;
   209          struct dpll_data *dd;
   210  
   211          dd = clk->dpll_data;
   212          if (!dd)
   213                  return -EINVAL;
                               ^^^^^^^
Truncated to positive u8.

   214  
   215          v = ti_clk_ll_ops->clk_readl(dd->control_reg);
   216          v &= dd->enable_mask;
   217          v >>= __ffs(dd->enable_mask);
   218  
   219          /* Reparent the struct clk in case the dpll is in bypass */
   220          if (_omap2_dpll_is_in_bypass(v))
   221                  return 1;
   222  
   223          return 0;
   224  }

regards,
dan carpenter
