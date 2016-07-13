Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:36921 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751005AbcGMPwp (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 13 Jul 2016 11:52:45 -0400
Date: Wed, 13 Jul 2016 18:51:42 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: keguang.zhang@gmail.com
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: ls1x: Update relationship among all clocks
Message-ID: <20160713155142.GB31747@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Kelvin Cheung,

The patch 3526f74fa925: "clk: ls1x: Update relationship among all
clocks" from Oct 10, 2014, leads to the following static checker
warning:

	drivers/clk/clk-ls1x.c:38 ls1x_pll_recalc_rate()
	warn: mask and shift to zero

drivers/clk/clk-ls1x.c
    32  static unsigned long ls1x_pll_recalc_rate(struct clk_hw *hw,
    33                                            unsigned long parent_rate)
    34  {
    35          u32 pll, rate;
    36  
    37          pll = __raw_readl(LS1X_CLK_PLL_FREQ);
    38          rate = 12 + (pll & 0x3f) + (((pll >> 8) & 0x3ff) >> 10);

0x3ff >> 10 is zero.  It's not clear to me what is intended.

    39          rate *= OSC;
    40          rate >>= 1;
    41  
    42          return rate;
    43  }

regards,
dan carpenter
