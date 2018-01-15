Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qk0-f193.google.com ([209.85.220.193]:40496 "EHLO
        mail-qk0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966143AbeAOPWF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Jan 2018 10:22:05 -0500
Received: by mail-qk0-f193.google.com with SMTP id d18so17199221qke.7
        for <linux-clk@vger.kernel.org>; Mon, 15 Jan 2018 07:22:04 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: sboyd@codeaurora.org
Cc: shawnguo@kernel.org, kernel@pengutronix.de, p.zabel@pengutronix.de,
        linux-clk@vger.kernel.org, Fabio Estevam <fabio.estevam@nxp.com>
Subject: [PATCH v2] clk: imx51-imx53: Fix UART4/5 registration on i.MX50 and i.MX53
Date: Mon, 15 Jan 2018 13:21:48 -0200
Message-Id: <1516029708-17204-1-git-send-email-festevam@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Fabio Estevam <fabio.estevam@nxp.com>

Since commit 59dc3d8c8673 ("clk: imx51: uart4, uart5 gates only exist on
imx50, imx53") the following warnings are seen on i.MX53:

[    2.776190] ------------[ cut here ]------------
[    2.780948] WARNING: CPU: 0 PID: 1 at ../drivers/clk/clk.c:811 clk_core_disable+0xc4/0xe0
[    2.789145] Modules linked in:
[    2.792236] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.15.0-rc7-next-20180115 #1
[    2.799735] Hardware name: Freescale i.MX53 (Device Tree Support)
[    2.805845] Backtrace: 
[    2.808329] [<c010d1a0>] (dump_backtrace) from [<c010d460>] (show_stack+0x18/0x1c)
[    2.815919]  r7:00000000 r6:60000093 r5:00000000 r4:c10798d4
[    2.821607] [<c010d448>] (show_stack) from [<c0a353ec>] (dump_stack+0xb4/0xe8)
[    2.828854] [<c0a35338>] (dump_stack) from [<c0126144>] (__warn+0xf0/0x11c)
[    2.835837]  r9:00000000 r8:0000032b r7:00000009 r6:c0d429f8 r5:00000000 r4:00000000
[    2.843601] [<c0126054>] (__warn) from [<c0126288>] (warn_slowpath_null+0x44/0x50)
[    2.851191]  r8:c1008908 r7:c0e08874 r6:c04bfac8 r5:0000032b r4:c0d429f8
[    2.857913] [<c0126244>] (warn_slowpath_null) from [<c04bfac8>] (clk_core_disable+0xc4/0xe0)
[    2.866369]  r6:dc02bb00 r5:dc02a980 r4:dc02a980
[    2.871011] [<c04bfa04>] (clk_core_disable) from [<c04c0e54>] (clk_core_disable_lock+0x20/0x2c)
[    2.879726]  r5:dc02a980 r4:80000013
[    2.883323] [<c04c0e34>] (clk_core_disable_lock) from [<c04c0e84>] (clk_disable+0x24/0x28)
[    2.891604]  r5:c0f6b3e4 r4:0000001c
[    2.895209] [<c04c0e60>] (clk_disable) from [<c0f2340c>] (imx_clk_disable_uart+0x50/0x68)
[    2.903412] [<c0f233bc>] (imx_clk_disable_uart) from [<c010277c>] (do_one_initcall+0x50/0x19c)
[    2.912043]  r7:c0e08874 r6:c0f63854 r5:c0f233bc r4:ffffe000
[    2.917726] [<c010272c>] (do_one_initcall) from [<c0f00f00>] (kernel_init_freeable+0x118/0x1d0)
[    2.926447]  r9:c0f63858 r8:000000f0 r7:c0e08874 r6:c0f63854 r5:c107b500 r4:c0f75260
[    2.934220] [<c0f00de8>] (kernel_init_freeable) from [<c0a4a5f0>] (kernel_init+0x10/0x118)
[    2.942506]  r10:00000000 r9:00000000 r8:00000000 r7:00000000 r6:00000000 r5:c0a4a5e0
[    2.950351]  r4:00000000
[    2.952908] [<c0a4a5e0>] (kernel_init) from [<c01010b4>] (ret_from_fork+0x14/0x20)
[    2.960496] Exception stack(0xdc05dfb0 to 0xdc05dff8)
[    2.965569] dfa0:                                     00000000 00000000 00000000 00000000
[    2.973768] dfc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[    2.981965] dfe0: 00000000 00000000 00000000 00000000 00000013 00000000
[    2.988596]  r5:c0a4a5e0 r4:00000000
[    2.992188] ---[ end trace 346e26f708876edd ]---
[    2.997420] ------------[ cut here ]------------

In order to fix the problem UART4/5 registration needs to happen only on
i.MX50 and i.MX53.

So let mx51_clocks_init() register only UART1-3 and 
mx50_clocks_init()/mx53_clocks_init register all the UART1-5 ports.

Fixes: 59dc3d8c8673 ("clk: imx51: uart4, uart5 gates only exist on imx50, imx53") 
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
---
Changes since v1:
- Register all uart clocks at once (Philipp)

 drivers/clk/imx/clk-imx51-imx53.c | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/imx/clk-imx51-imx53.c b/drivers/clk/imx/clk-imx51-imx53.c
index c864992..caa8bd4 100644
--- a/drivers/clk/imx/clk-imx51-imx53.c
+++ b/drivers/clk/imx/clk-imx51-imx53.c
@@ -131,7 +131,17 @@ static const char *ieee1588_sels[] = { "pll3_sw", "pll4_sw", "dummy" /* usbphy2_
 static struct clk *clk[IMX5_CLK_END];
 static struct clk_onecell_data clk_data;
 
-static struct clk ** const uart_clks[] __initconst = {
+static struct clk ** const uart_clks_mx51[] __initconst = {
+	&clk[IMX5_CLK_UART1_IPG_GATE],
+	&clk[IMX5_CLK_UART1_PER_GATE],
+	&clk[IMX5_CLK_UART2_IPG_GATE],
+	&clk[IMX5_CLK_UART2_PER_GATE],
+	&clk[IMX5_CLK_UART3_IPG_GATE],
+	&clk[IMX5_CLK_UART3_PER_GATE],
+	NULL
+};
+
+static struct clk ** const uart_clks_mx50_mx53[] __initconst = {
 	&clk[IMX5_CLK_UART1_IPG_GATE],
 	&clk[IMX5_CLK_UART1_PER_GATE],
 	&clk[IMX5_CLK_UART2_IPG_GATE],
@@ -321,8 +331,6 @@ static void __init mx5_clocks_common_init(void __iomem *ccm_base)
 	clk_prepare_enable(clk[IMX5_CLK_TMAX1]);
 	clk_prepare_enable(clk[IMX5_CLK_TMAX2]); /* esdhc2, fec */
 	clk_prepare_enable(clk[IMX5_CLK_TMAX3]); /* esdhc1, esdhc4 */
-
-	imx_register_uart_clocks(uart_clks);
 }
 
 static void __init mx50_clocks_init(struct device_node *np)
@@ -388,6 +396,8 @@ static void __init mx50_clocks_init(struct device_node *np)
 
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
+
+	imx_register_uart_clocks(uart_clks_mx50_mx53);
 }
 CLK_OF_DECLARE(imx50_ccm, "fsl,imx50-ccm", mx50_clocks_init);
 
@@ -477,6 +487,8 @@ static void __init mx51_clocks_init(struct device_node *np)
 	val = readl(MXC_CCM_CLPCR);
 	val |= 1 << 23;
 	writel(val, MXC_CCM_CLPCR);
+
+	imx_register_uart_clocks(uart_clks_mx51);
 }
 CLK_OF_DECLARE(imx51_ccm, "fsl,imx51-ccm", mx51_clocks_init);
 
@@ -606,5 +618,7 @@ static void __init mx53_clocks_init(struct device_node *np)
 
 	r = clk_round_rate(clk[IMX5_CLK_USBOH3_PER_GATE], 54000000);
 	clk_set_rate(clk[IMX5_CLK_USBOH3_PER_GATE], r);
+
+	imx_register_uart_clocks(uart_clks_mx50_mx53);
 }
 CLK_OF_DECLARE(imx53_ccm, "fsl,imx53-ccm", mx53_clocks_init);
-- 
2.7.4

