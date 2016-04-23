Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:36851 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751770AbcDWKZg (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2016 06:25:36 -0400
Date: Sat, 23 Apr 2016 13:25:16 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: maxime.ripard@free-electrons.com
Cc: linux-clk@vger.kernel.org
Subject: re: clk: sunxi: Add TCON channel1 clock
Message-ID: <20160423102516.GA14424@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Maxime Ripard,

The patch cc510c736b1b: "clk: sunxi: Add TCON channel1 clock" from
Jul 1, 2015, leads to the following static checker warning:

	drivers/clk/sunxi/clk-sun4i-tcon-ch1.c:89 tcon_ch1_get_parent()
	warn: signedness bug returning '(-22)'

drivers/clk/sunxi/clk-sun4i-tcon-ch1.c
    79  static u8 tcon_ch1_get_parent(struct clk_hw *hw)
               ^^
Is u8.

    80  {
    81          struct tcon_ch1_clk *tclk = hw_to_tclk(hw);
    82          int num_parents = clk_hw_get_num_parents(hw);
    83          u32 reg;
    84  
    85          reg = readl(tclk->reg) >> TCON_CH1_SCLK2_MUX_SHIFT;
    86          reg &= reg >> TCON_CH1_SCLK2_MUX_MASK;
    87  
    88          if (reg >= num_parents)
    89                  return -EINVAL;
                        ^^^^^^^^^^^^^^
Can't fit.

    90  
    91          return reg;
    92  }

regards,
dan carpenter
