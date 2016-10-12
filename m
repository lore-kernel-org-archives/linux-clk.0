Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from userp1050.oracle.com ([156.151.31.82]:42192 "EHLO
        userp1050.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752706AbcJLLlR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 12 Oct 2016 07:41:17 -0400
Received: from userp1040.oracle.com (userp1040.oracle.com [156.151.31.81])
        by userp1050.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with ESMTP id u9C9ZOt6012960
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2016 09:35:24 GMT
Date: Wed, 12 Oct 2016 12:34:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: yamada.masahiro@socionext.com
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: uniphier: add core support code for UniPhier clock
 driver
Message-ID: <20161012093404.GA29062@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Masahiro Yamada,

The patch 734d82f4a678: "clk: uniphier: add core support code for
UniPhier clock driver" from Sep 16, 2016, leads to the following
static checker warning:

	drivers/clk/uniphier/clk-uniphier-mux.c:56 uniphier_clk_mux_get_parent()
	warn: signedness bug returning '(-22)'

drivers/clk/uniphier/clk-uniphier-mux.c
    40  static u8 uniphier_clk_mux_get_parent(struct clk_hw *hw)
               ^^
    41  {
    42          struct uniphier_clk_mux *mux = to_uniphier_clk_mux(hw);
    43          int num_parents = clk_hw_get_num_parents(hw);
    44          int ret;
    45          u32 val;
    46          u8 i;
    47  
    48          ret = regmap_read(mux->regmap, mux->reg, &val);
    49          if (ret)
    50                  return ret;
    51  
    52          for (i = 0; i < num_parents; i++)
    53                  if ((mux->masks[i] & val) == mux->vals[i])
    54                          return i;
    55  
    56          return -EINVAL;
                       ^^^^^^^

We can't return -EINVAL as a u8.

    57  }

There are a bunch of similar bugs:

drivers/clk/samsung/clk-s3c2410-dclk.c:72 s3c24xx_clkout_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/uniphier/clk-uniphier-mux.c:56 uniphier_clk_mux_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/microchip/clk-core.c:296 roclk_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/microchip/clk-core.c:837 sclk_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/ti/mux.c:51 ti_clk_mux_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/ti/mux.c:61 ti_clk_mux_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/nxp/clk-lpc32xx.c:1018 clk_mux_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/nxp/clk-lpc32xx.c:1022 clk_mux_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/rockchip/clk-ddr.c:91 rockchip_ddrclk_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/clk-mux.c:51 clk_mux_get_parent() warn: signedness bug returning '(-22)'
drivers/clk/clk-mux.c:61 clk_mux_get_parent() warn: signedness bug returning '(-22)'

regards,
dan carpenter
