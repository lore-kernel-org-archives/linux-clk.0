Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:44639 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752124AbdBFNrz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 6 Feb 2017 08:47:55 -0500
Date: Mon, 6 Feb 2017 16:47:37 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: wens@csie.org
Cc: linux-clk@vger.kernel.org
Subject: [bug report] clk: sunxi-ng: Add A80 CCU
Message-ID: <20170206134737.GA2593@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hello Chen-Yu Tsai,

The patch b8eb71dcdd08: "clk: sunxi-ng: Add A80 CCU" from Jan 28,
2017, leads to the following static checker warning:

	drivers/clk/sunxi-ng/ccu-sun9i-a80.c:1205 sun9i_a80_ccu_probe()
	warn: odd binop '0x10000 & 0x40000'

drivers/clk/sunxi-ng/ccu-sun9i-a80.c
  1192  static int sun9i_a80_ccu_probe(struct platform_device *pdev)
  1193  {
  1194          struct resource *res;
  1195          void __iomem *reg;
  1196          u32 val;
  1197  
  1198          res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
  1199          reg = devm_ioremap_resource(&pdev->dev, res);
  1200          if (IS_ERR(reg))
  1201                  return PTR_ERR(reg);
  1202  
  1203          /* Enforce d1 = 0, d2 = 0 for Audio PLL */
  1204          val = readl(reg + SUN9I_A80_PLL_AUDIO_REG);
  1205          val &= (BIT(16) & BIT(18));

This line just sets "val" to zero.  Not sure what was intended.

  1206          writel(val, reg + SUN9I_A80_PLL_AUDIO_REG);
  1207  
  1208          return sunxi_ccu_probe(pdev->dev.of_node, reg, &sun9i_a80_ccu_desc);
  1209  }

regards,
dan carpenter
