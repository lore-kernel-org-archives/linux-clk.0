Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azolkn19011070.outbound.protection.outlook.com [52.103.23.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CD9360ED0;
	Sun,  9 Aug 2026 10:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.23.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786270174; cv=fail; b=fWeA31YAXq97Hx6kMNntN9MeJdDYrQwNL9PYAS+P0fzkItL6Lb7Xf9DmRODvjiGuD5dkNmj2hjUCmUAxptZ4PHuOwISH/m10heCcLLHnaRD+PfKWVm4r6U9s0O/sL3kBKmVYKg6spO6UIoU9LsPApeF1DUsllPOYrnzlC253TI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786270174; c=relaxed/simple;
	bh=QX3QebvR/DUIMZ30cAP1/rYkZRQOJ3IVQUwAtK5lw28=;
	h=From:Date:Subject:To:Cc:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H6HLmwqcr1FVSD9uHc8CJwZql8lJz7/nn3LnF0Z+lgbHoDjS/Ql2xcgN6yf+toYAqFfqT15N/HHrnRY/puE6GLEAF6OUPZ/scJbW96oUaPbI7MD/scBxNNd8csjzRk/Hio5iffpGbaom1CY6voko69QeRpth5d8pdT9+dOWGT+8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=nKvHIxTl; arc=fail smtp.client-ip=52.103.23.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="nKvHIxTl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D76WzMF9gnvyCIJauzSJEy583H+pbV5fu90kX/SIsfr5+28EPJ4+ZSylmY13WZmy94rRXsuXmi9qfQhwy83lW4vQmmTCXicI1i97H+OvDZz8EdSWfC0Z7eilmz2Hpyv4nTYlrReQac5VRxep4pRX2TwaBBpFPQdJypZUfX6KZLeJDcSB4t7WcLuv+M6miZDTT+sm+quFeH3/0mYjo7vXL3SjwMnSWbv7qG0jYow5c7+HL72zuMhJoGfWstqRakRGLz8HS+6j5Sgan480ELfPdDuQY8gf12J6vR4+jWmF0dmR5OmQYlAUZUS/xSFTHv35+4aFmreNZe353KfumF9iSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFmtHbNGF5hBKtW5O/UYLC2tUmqkbLil6SSzV1csE3A=;
 b=e8/HZkB4jAJaR7uq5TmfNDoJw+deCklGo+xk8/xF3YB9Oo8RIoMug+qQjWRjcJEWFU0RwAcPg9tc3Cgog54QWpidGHCZ02pQWF56pV1nmD+tK0wCv501Msf/eMrqVtUieF8xdityU7LP6mA50AsbB340AIIUk0YLfJBFG4cHGkWlIq2SlFIRjICEgRnV95mZAmOjs9F+sxb3DsecKZXhubGdiTUoZ2avze46yDir1S/1LyIgJh8txZHSMSyAOYSMihfAe0lWRXM0LrwtcvjqG91KKDaBDxK7VrNBXbeDbTclCjkeVA/U+2a9QoHE9nep01cug8ZfE0Lb2Jmti0/4fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFmtHbNGF5hBKtW5O/UYLC2tUmqkbLil6SSzV1csE3A=;
 b=nKvHIxTlT5uJcYPLQ0hAbmZ47yF/nlku8XMa9DnLm0eMGytbUi9nzuJ6MLBg9fMR+2/0VnnjvkRC9rmsYtIP0QoDlFoy6xcRGGhUGbT+AK+2BVOMHbnTaIg+pFiejz57ShUsMBD3NQmI03i2WIivHnyJ3xiSJzyL24HVp79etiZ+z1g8uCE3dHYFHjiESL/feOgEFtOzN41Uhu77S6X7cqWDoVNAcoWGl2AHReIehWJiuTZpAA/q1nczkixvlNdcmjjUGHcErxqw8MX1t7M39uGiVMqsUbaq7DgrRdDHSn4ikyFnQwSSslht9Uoba//1HucouawZOE1UY176kocLgw==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by CY8PR19MB7667.namprd19.prod.outlook.com (2603:10b6:930:77::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 10:09:30 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0292.024; Sun, 9 Aug 2026
 10:09:30 +0000
From: Liu Changjie <liucj1228@outlook.com>
Date: Thu, 23 Jul 2026 23:48:58 +0800
Subject: [PATCH v2 3/9] clk: stm32: add STM32H7RS RCC driver
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Message-ID:
 <MN0PR19MB6091BCCEA08218EB99DE07B8ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
References: <MN0PR19MB6091DB524E7A07E16D108F52ACDF2@MN0PR19MB6091.namprd19.prod.outlook.com>
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0053.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:7d0:8::10) To MN0PR19MB6091.namprd19.prod.outlook.com
 (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <178627019585.53236.17772262006237734934@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|CY8PR19MB7667:EE_
X-MS-Office365-Filtering-Correlation-Id: 256c6663-8706-43a0-cc8a-08def5fe4d4a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|25010399006|5072599009|15080799012|37011999003|23021999003|16051099003|8060799015|19110799012|24021099003|41001999006|51005399006|440099028|3412199025|26104999009|40105399003|2607281247196008;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xL4fu3wo8muujUNj+E6JW+WkSYYDIuTgDNfgaZXvzYlKs5h6aLsMSmnQtsHm?=
 =?us-ascii?Q?vCKwjNtgXEWuch11imkX0OyzVxcaMDBgRbMcB8DmSOKiWomKvBxnGDz/GFcn?=
 =?us-ascii?Q?c4hC7lQlUsWIFhsK9U/wzDsp0bYitD2HblLRShpUSq1eXNS/tziyWzcGsDPB?=
 =?us-ascii?Q?9Z8Lk3q/aPYZO4WMCquj9ksYPPamnOLYEOTpoOjR/5BnPFMeqKyC5X7wwbOG?=
 =?us-ascii?Q?xnFNrIJzZPuplWSoS5fT962MQHKw4zShV4cPiuNAFyg5qwH8+fnQ4Lp8qyoD?=
 =?us-ascii?Q?ORpzfTyWwMI9Ri+wzsrOaTQMg4fcI6C7y6dlJczBELe+3jGTnjCf02U7FM+H?=
 =?us-ascii?Q?gfrpwRAR0I6qyLgKK2PPOS79mlhxF5x3N74CmqPRjC/RzAVsZVgydhpGjFks?=
 =?us-ascii?Q?7eooBtSzU8DteleQH27UyVs4zA7yhr1i4ql63Fl5nvtu13+UUD+WgZGmZ9ly?=
 =?us-ascii?Q?ogcK19teQgchMSdRIP19/rIUZBeMLZpeHElX8h5oEHgJTG7eRdG5YHEtjJFV?=
 =?us-ascii?Q?+B+0yQ/d80CSle9NYwZq+XKaLrXFpklS8uPKPcSBNiIpLyp23LivAaiX0xJi?=
 =?us-ascii?Q?g4HxQNPfaMhd0wP3hPUCLX1zRFAUTwouvhF18d/0Ah/wIDGTQltDGO6Z95Tm?=
 =?us-ascii?Q?b3zzh/SbJUEaH5625dJEzVD7LrAUOrVLk5A3h6gp9YiiBM36unVsLGIocVYs?=
 =?us-ascii?Q?0Co0ZHOsMSGYSNnbNhW1tDqgL14czvq3ytGjLTG8+1s4VMuvTaNZfzha3C6c?=
 =?us-ascii?Q?yu0YYNlmXYol9EWk2i0WCBAxiCLe/j+u+greDr0yreiTsoojzNcV4jaF1LRd?=
 =?us-ascii?Q?g3UZVE6TX7cn2MMeFhKg8PYK4iq+jJtcN2+fF/TGHuTwSCiSRFqkKphv3cya?=
 =?us-ascii?Q?J4xPJdzH/kvrQ7WC9hcObRxRbYud78L23GjtvuKs25oSH5b+4fLCBUyeIE46?=
 =?us-ascii?Q?HanOX52jsUE7r8feRlLVAaURhB0NI1piWior9NJBCgpn3R6LOc2jHqtr9tDB?=
 =?us-ascii?Q?nnm3V7vX4h0KXYTQMsT9uNM+5+VIPS2XYSznHZtZOXs6rK0=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dJjk8KuyJTgDV2NYlx376StJZoHU3FpksgbqzLJuK6dlqD6p/HkHZfPtpp94?=
 =?us-ascii?Q?oh+ZrtI3zgFUqv2SS/a1TX+LxbKCB9jndvPXLaE1EQ8TbLLBkPeIBzwai/NH?=
 =?us-ascii?Q?MRbZChWbuy/w33iZ5KtorJAL2+RBLc8c6eNU+9fa4JQCmzPIgPNtx/A5ZY4U?=
 =?us-ascii?Q?NZ8yDLcHd5KCx3OIMMgE46bqVnHzc62X9IvVFI2u5fLV0OKuFmb8khdUe+PD?=
 =?us-ascii?Q?qEBfY0KIapsgw9uF6r9B+rlPoc2+HnH4jCRmAiyD2DeptPQHHaElQ7O3waFm?=
 =?us-ascii?Q?ammTBzH/5KoVqVUpGykC7udvyaBL1OUStvm4rrYrWmTvjbl0U7eS5+xw5poo?=
 =?us-ascii?Q?i3gs58bs5wIyxTfP7hajHFVyxtbdC7LTYUim744Xl/cp/E0rKvM7OXTw701A?=
 =?us-ascii?Q?yGmPepWZ+BAS8FOT8tO8AqK6hnydqVLJMrUgLGEfNxi1UOswsWzjn295hzh8?=
 =?us-ascii?Q?FG250/FJrFKeKTXxzgfVLrfs3NB/Mkqb0rtUZkGGfjzoivT+Dao7jYGXNw84?=
 =?us-ascii?Q?S5Q1UHMgIGYx3l0m4ZPCr+6Et3JEsot4fRnwWNJ0FjJ522rhXFEnNPTw+/q9?=
 =?us-ascii?Q?8JP9IGKjfl9x7D3zu//P1Q1gjbePG/BPcPv2qpdyVdug45hdUStEEmEhJYDv?=
 =?us-ascii?Q?v0V+63WbygCY/XFfGde+kcHTkmdft+nMy2sSElh8TQjRexDuzCHEiDIdG7vu?=
 =?us-ascii?Q?d/XrU0oyNyCHZ362uC1CIH3nm3rw/IaA/pB0f4iAtUCZ7amVwoeDdvWtI2D0?=
 =?us-ascii?Q?QeXPuaRTVahRr2Fkb0YUrtlhw8bUOzC16UdtEalLDT0b/RjIcxo2oTWJtazm?=
 =?us-ascii?Q?xDle4Swmy3XaxPwFjsKz4sEofzWY6ONsbo2DAEFetx+o9Nun7Z6n4rnhdG5C?=
 =?us-ascii?Q?18+EibdINOdimxuc+R4ILNqLulH8Du2OtUAhenTHOl4Ewu+LBXCTm5UcFoSR?=
 =?us-ascii?Q?ry1hxbU6AB+7Mt4HCX87qfRgw0ZeNvnXV4ZEPUNvFqAFVSBbuNcgRMDTvE6h?=
 =?us-ascii?Q?R23mXvOTVM4cOYcv3fhpeDdLM6ahC81WBYHn14KzNaHfU3/lFvlBH6jlEA6b?=
 =?us-ascii?Q?DKsoXWaGHiTxiOAEQeFbhYKImLhEHmuDECAWW96Vn9muCXIIorEPVsMD90/g?=
 =?us-ascii?Q?zhSMyrqIw1KQKnSCJrLpVUyiQjXvfMSzsHCBd/43hYRbOdlDl35Ov5MSLvrv?=
 =?us-ascii?Q?QjqwGh+0gamlT00uMzsdeMT9irtzFQC+qmpDPM3apBeVCpVi6gU98yl7bRb1?=
 =?us-ascii?Q?ZRazjen+KZTYThf4tho9SPJhCuuanKSJ+Egdx12ScdMPwUIOsaQjZ3JCaSNl?=
 =?us-ascii?Q?vvuQouV+om6xlYlQdec/702eBOhxWq+JBXh3gg9YWGfLdTzHxOzXdyUbumEy?=
 =?us-ascii?Q?teITK2/YVamPCYI0raYhr4eURybyjNFVLHcnf6IOqk3bzL6MQQ=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 256c6663-8706-43a0-cc8a-08def5fe4d4a
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 10:09:30.2388
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR19MB7667

Register the active STM32H7RS system, bus and selected peripheral
clocks without reprogramming the PLLs used for execute-in-place.
Decode the PLL2 S and T outputs used by SDMMC from PLL2DIVR2.
Expose gates for TIM5, UART4, GPIO banks A-H and M-P, and SDMMC1.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
Changes in v2:
- Register as a builtin platform driver with a probe instead of
  CLK_OF_DECLARE_DRIVER (Brian Masney).
- Use devm_of_iomap(), devm_clk_get() and the devm clock registration /
  provider helpers, and drop the hand-written failure unwinding
  (Brian Masney).
- Register the peripheral gates with struct clk_parent_data via
  devm_clk_hw_register_gate_parent_data() instead of parent_name
  (Brian Masney).
- Register the RCC reset controller from probe using reset_simple_ops
  (select RESET_SIMPLE) instead of relying on a separate reset-simple
  bind to a shared compatible.
- Drop the unused <linux/slab.h> include (Brian Masney).
- Reorder the stm32h7rs_pll_rate() locals in reverse-Christmas-tree
  order and add the missing blank line before the return (Brian Masney).

 drivers/clk/Kconfig         |   6 +
 drivers/clk/Makefile        |   1 +
 drivers/clk/clk-stm32h7rs.c | 521 ++++++++++++++++++++++++++++++++++++
 3 files changed, 528 insertions(+)
 create mode 100644 drivers/clk/clk-stm32h7rs.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a..666d92a7d 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -448,6 +448,12 @@ config COMMON_CLK_STM32H7
 	help
 	  Support for stm32h7 SoC family clocks
 
+config COMMON_CLK_STM32H7RS
+	def_bool COMMON_CLK && MACH_STM32H7R7
+	select RESET_SIMPLE
+	help
+	  Support for STM32H7RS SoC family clocks
+
 config COMMON_CLK_MMP2
 	def_bool COMMON_CLK && (MACH_MMP2_DT || MACH_MMP3_DT)
 	help
diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index cc108a75a..3dcb2f525 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -98,6 +98,7 @@ obj-$(CONFIG_COMMON_CLK_SI570)		+= clk-si570.o
 obj-$(CONFIG_COMMON_CLK_SP7021)		+= clk-sp7021.o
 obj-$(CONFIG_COMMON_CLK_STM32F)		+= clk-stm32f4.o
 obj-$(CONFIG_COMMON_CLK_STM32H7)	+= clk-stm32h7.o
+obj-$(CONFIG_COMMON_CLK_STM32H7RS)	+= clk-stm32h7rs.o
 obj-$(CONFIG_COMMON_CLK_TPS68470)      += clk-tps68470.o
 obj-$(CONFIG_CLK_TWL6040)		+= clk-twl6040.o
 obj-$(CONFIG_CLK_TWL)			+= clk-twl.o
diff --git a/drivers/clk/clk-stm32h7rs.c b/drivers/clk/clk-stm32h7rs.c
new file mode 100644
index 000000000..8d94953d2
--- /dev/null
+++ b/drivers/clk/clk-stm32h7rs.c
@@ -0,0 +1,521 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Clock driver for the STM32H7RS Reset and Clock Controller.
+ *
+ * The first-stage firmware configures the oscillators and PLLs before Linux
+ * starts executing from external NOR.  The driver reconstructs that running
+ * clock tree from RCC registers and gives Linux ownership of peripheral clock
+ * gates without disturbing the XIP-critical PLL configuration.
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/err.h>
+#include <linux/io.h>
+#include <linux/math64.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/reset-controller.h>
+#include <linux/reset/reset-simple.h>
+#include <linux/spinlock.h>
+
+#include <dt-bindings/clock/stm32h7rs-clks.h>
+
+#define RCC_CR			0x000
+#define RCC_CFGR		0x010
+#define RCC_CDCFGR		0x018
+#define RCC_BMCFGR		0x01c
+#define RCC_APBCFGR		0x020
+#define RCC_PLLCKSELR		0x028
+#define RCC_PLLCFGR		0x02c
+#define RCC_PLL1DIVR1		0x030
+#define RCC_PLL1FRACR		0x034
+#define RCC_PLL2DIVR1		0x038
+#define RCC_PLL2FRACR		0x03c
+#define RCC_PLL3DIVR1		0x040
+#define RCC_PLL3FRACR		0x044
+#define RCC_CCIPR1		0x04c
+#define RCC_CCIPR2		0x050
+#define RCC_PLL2DIVR2		0x0c4
+#define RCC_AHB5ENR		0x134
+#define RCC_AHB4ENR		0x140
+#define RCC_APB1ENR1		0x148
+
+#define RCC_CR_HSIDIV_SHIFT	3
+#define RCC_CFGR_SWS_SHIFT	3
+#define RCC_CFGR_TIMPRE		BIT(15)
+#define RCC_PLLCFGR_FRACEN(_pll)	BIT(((_pll) - 1) * 11)
+#define RCC_PLL_ON(_pll)	BIT(24 + (((_pll) - 1) * 2))
+
+#define RCC_CDCFGR_CPRE_SHIFT	0
+#define RCC_BMCFGR_BMPRE_SHIFT	0
+#define RCC_APBCFGR_PPRE1_SHIFT	0
+#define RCC_APBCFGR_PPRE2_SHIFT	4
+#define RCC_APBCFGR_PPRE4_SHIFT	8
+#define RCC_APBCFGR_PPRE5_SHIFT	12
+
+#define RCC_CCIPR1_SDMMC12SEL	BIT(2)
+#define RCC_CCIPR2_UARTSEL_MASK	GENMASK(2, 0)
+
+#define HSI_RATE		64000000UL
+#define CSI_RATE		4000000UL
+
+static DEFINE_SPINLOCK(stm32h7rs_rcc_lock);
+
+static const u16 pll_divr_offset[] = {
+	RCC_PLL1DIVR1, RCC_PLL2DIVR1, RCC_PLL3DIVR1,
+};
+
+static const u16 pll_fracr_offset[] = {
+	RCC_PLL1FRACR, RCC_PLL2FRACR, RCC_PLL3FRACR,
+};
+
+static const u8 pll_m_shift[] = { 4, 12, 20 };
+
+enum stm32h7rs_pll_output {
+	PLL_P,
+	PLL_Q,
+	PLL_R,
+	PLL_S,
+	PLL_T,
+};
+
+static unsigned long stm32h7rs_hsi_rate(void __iomem *base)
+{
+	u32 div = (readl_relaxed(base + RCC_CR) >> RCC_CR_HSIDIV_SHIFT) & 0x3;
+
+	return HSI_RATE >> div;
+}
+
+static unsigned long stm32h7rs_pll_rate(void __iomem *base, unsigned int pll,
+					unsigned int output,
+					unsigned long hse_rate)
+{
+	static const u8 output_shift[] = { 9, 16, 24 };
+	u32 divr1, frac = 0, m, n, out_div, source;
+	unsigned long parent_rate;
+	u64 numerator;
+
+	if (pll < 1 || pll > ARRAY_SIZE(pll_divr_offset) || output > PLL_T)
+		return 0;
+
+	if (output > PLL_R && pll != 2)
+		return 0;
+
+	if (!(readl_relaxed(base + RCC_CR) & RCC_PLL_ON(pll)))
+		return 0;
+
+	source = readl_relaxed(base + RCC_PLLCKSELR) & GENMASK(1, 0);
+	switch (source) {
+	case 0:
+		parent_rate = stm32h7rs_hsi_rate(base);
+		break;
+	case 1:
+		parent_rate = CSI_RATE;
+		break;
+	case 2:
+		parent_rate = hse_rate;
+		break;
+	default:
+		return 0;
+	}
+
+	m = (readl_relaxed(base + RCC_PLLCKSELR) >> pll_m_shift[pll - 1]) & 0x3f;
+	if (!m || !parent_rate)
+		return 0;
+
+	divr1 = readl_relaxed(base + pll_divr_offset[pll - 1]);
+	n = (divr1 & GENMASK(8, 0)) + 1;
+	if (readl_relaxed(base + RCC_PLLCFGR) & RCC_PLLCFGR_FRACEN(pll))
+		frac = (readl_relaxed(base + pll_fracr_offset[pll - 1]) >> 3) &
+			GENMASK(12, 0);
+
+	if (output <= PLL_R) {
+		out_div = ((divr1 >> output_shift[output]) &
+			   GENMASK(6, 0)) + 1;
+	} else {
+		u32 divr2 = readl_relaxed(base + RCC_PLL2DIVR2);
+		u8 shift = output == PLL_S ? 0 : 8;
+
+		out_div = ((divr2 >> shift) & GENMASK(2, 0)) + 1;
+	}
+
+	numerator = (u64)parent_rate * (n * 8192ULL + frac);
+
+	return div64_u64(numerator, (u64)m * 8192ULL * out_div);
+}
+
+static unsigned long stm32h7rs_ahb_rate(unsigned long parent_rate, u32 val)
+{
+	static const u16 div_table[] = { 2, 4, 8, 16, 64, 128, 256, 512 };
+
+	if (val < 8)
+		return parent_rate;
+
+	return parent_rate / div_table[val - 8];
+}
+
+static unsigned long stm32h7rs_sys_rate(void __iomem *base,
+					unsigned long hse_rate)
+{
+	unsigned long rate;
+	u32 cpre, source;
+
+	source = (readl_relaxed(base + RCC_CFGR) >> RCC_CFGR_SWS_SHIFT) & 0x7;
+	switch (source) {
+	case 0:
+		rate = stm32h7rs_hsi_rate(base);
+		break;
+	case 1:
+		rate = CSI_RATE;
+		break;
+	case 2:
+		rate = hse_rate;
+		break;
+	case 3:
+		rate = stm32h7rs_pll_rate(base, 1, PLL_P, hse_rate);
+		break;
+	default:
+		return 0;
+	}
+
+	cpre = (readl_relaxed(base + RCC_CDCFGR) >> RCC_CDCFGR_CPRE_SHIFT) & 0xf;
+	return stm32h7rs_ahb_rate(rate, cpre);
+}
+
+static unsigned long stm32h7rs_apb_rate(void __iomem *base,
+					unsigned long hclk_rate, u8 shift)
+{
+	u32 prescaler = (readl_relaxed(base + RCC_APBCFGR) >> shift) & 0x7;
+
+	if (prescaler < 4)
+		return hclk_rate;
+
+	return hclk_rate >> (prescaler - 3);
+}
+
+static unsigned long stm32h7rs_timer_rate(void __iomem *base,
+					  unsigned long hclk_rate,
+					  unsigned long pclk_rate)
+{
+	u32 prescaler = (readl_relaxed(base + RCC_APBCFGR) >>
+			 RCC_APBCFGR_PPRE1_SHIFT) & 0x7;
+
+	if (prescaler < 4)
+		return pclk_rate;
+
+	if (!(readl_relaxed(base + RCC_CFGR) & RCC_CFGR_TIMPRE))
+		return pclk_rate * 2;
+
+	return prescaler < 6 ? hclk_rate : pclk_rate * 4;
+}
+
+static unsigned long stm32h7rs_uart4_rate(void __iomem *base,
+					  unsigned long hse_rate,
+					  unsigned long lse_rate,
+					  unsigned long pclk1_rate)
+{
+	u32 source = readl_relaxed(base + RCC_CCIPR2) & RCC_CCIPR2_UARTSEL_MASK;
+
+	switch (source) {
+	case 0:
+		return pclk1_rate;
+	case 1:
+		return stm32h7rs_pll_rate(base, 2, PLL_Q, hse_rate);
+	case 2:
+		return stm32h7rs_pll_rate(base, 3, PLL_Q, hse_rate);
+	case 3:
+		return stm32h7rs_hsi_rate(base);
+	case 4:
+		return CSI_RATE;
+	case 5:
+		return lse_rate;
+	default:
+		return 0;
+	}
+}
+
+static unsigned long stm32h7rs_sdmmc1_rate(void __iomem *base,
+					   unsigned long hse_rate)
+{
+	if (readl_relaxed(base + RCC_CCIPR1) & RCC_CCIPR1_SDMMC12SEL)
+		return stm32h7rs_pll_rate(base, 2, PLL_T, hse_rate);
+
+	return stm32h7rs_pll_rate(base, 2, PLL_S, hse_rate);
+}
+
+static int h7rs_register_fixed(struct device *dev,
+			       struct clk_hw_onecell_data *data,
+			       unsigned int id, const char *name,
+			       unsigned long rate)
+{
+	struct clk_hw *hw;
+
+	hw = devm_clk_hw_register_fixed_rate(dev, name, NULL, CLK_IS_CRITICAL,
+					     rate);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	data->hws[id] = hw;
+
+	return 0;
+}
+
+enum stm32h7rs_parent {
+	STM32H7RS_PARENT_HCLK,
+	STM32H7RS_PARENT_TIM5,
+	STM32H7RS_PARENT_UART4,
+	STM32H7RS_PARENT_SDMMC1,
+	STM32H7RS_PARENT_COUNT,
+};
+
+struct stm32h7rs_gate {
+	const char *name;
+	u16 offset;
+	u8 id;
+	u8 parent;
+	u8 bit_idx;
+};
+
+static const struct stm32h7rs_gate stm32h7rs_gates[] = {
+	{ "tim5", RCC_APB1ENR1, STM32H7RS_TIM5_CK,
+	  STM32H7RS_PARENT_TIM5, 3 },
+	{ "uart4", RCC_APB1ENR1, STM32H7RS_UART4_CK,
+	  STM32H7RS_PARENT_UART4, 19 },
+	{ "gpioa", RCC_AHB4ENR, STM32H7RS_GPIOA_CK,
+	  STM32H7RS_PARENT_HCLK, 0 },
+	{ "gpiob", RCC_AHB4ENR, STM32H7RS_GPIOB_CK,
+	  STM32H7RS_PARENT_HCLK, 1 },
+	{ "gpioc", RCC_AHB4ENR, STM32H7RS_GPIOC_CK,
+	  STM32H7RS_PARENT_HCLK, 2 },
+	{ "gpiod", RCC_AHB4ENR, STM32H7RS_GPIOD_CK,
+	  STM32H7RS_PARENT_HCLK, 3 },
+	{ "gpioe", RCC_AHB4ENR, STM32H7RS_GPIOE_CK,
+	  STM32H7RS_PARENT_HCLK, 4 },
+	{ "gpiof", RCC_AHB4ENR, STM32H7RS_GPIOF_CK,
+	  STM32H7RS_PARENT_HCLK, 5 },
+	{ "gpiog", RCC_AHB4ENR, STM32H7RS_GPIOG_CK,
+	  STM32H7RS_PARENT_HCLK, 6 },
+	{ "gpioh", RCC_AHB4ENR, STM32H7RS_GPIOH_CK,
+	  STM32H7RS_PARENT_HCLK, 7 },
+	{ "gpiom", RCC_AHB4ENR, STM32H7RS_GPIOM_CK,
+	  STM32H7RS_PARENT_HCLK, 12 },
+	{ "gpion", RCC_AHB4ENR, STM32H7RS_GPION_CK,
+	  STM32H7RS_PARENT_HCLK, 13 },
+	{ "gpioo", RCC_AHB4ENR, STM32H7RS_GPIOO_CK,
+	  STM32H7RS_PARENT_HCLK, 14 },
+	{ "gpiop", RCC_AHB4ENR, STM32H7RS_GPIOP_CK,
+	  STM32H7RS_PARENT_HCLK, 15 },
+	{ "sdmmc1", RCC_AHB5ENR, STM32H7RS_SDMMC1_CK,
+	  STM32H7RS_PARENT_SDMMC1, 8 },
+};
+
+static int h7rs_register_gate(struct device *dev,
+			      struct clk_hw_onecell_data *data,
+			      const struct stm32h7rs_gate *gate,
+			      const struct clk_hw *parent_hw,
+			      void __iomem *base)
+{
+	const struct clk_parent_data parent_data = { .hw = parent_hw };
+	struct clk_hw *hw;
+
+	hw = devm_clk_hw_register_gate_parent_data(dev, gate->name,
+						   &parent_data,
+						   CLK_IGNORE_UNUSED,
+						   base + gate->offset,
+						   gate->bit_idx, 0,
+						   &stm32h7rs_rcc_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	data->hws[gate->id] = hw;
+
+	return 0;
+}
+
+static int stm32h7rs_rcc_probe(struct platform_device *pdev)
+{
+	struct clk_hw *parent_hws[STM32H7RS_PARENT_COUNT];
+	struct clk_hw_onecell_data *clk_data;
+	struct reset_simple_data *reset;
+	struct device *dev = &pdev->dev;
+	unsigned long sdmmc1_rate;
+	unsigned long uart4_rate;
+	unsigned long timer_rate;
+	unsigned long pclk5_rate;
+	unsigned long pclk4_rate;
+	unsigned long pclk2_rate;
+	unsigned long pclk1_rate;
+	unsigned long hclk_rate;
+	unsigned long sys_rate;
+	unsigned long lse_rate;
+	unsigned long hse_rate;
+	resource_size_t size;
+	struct clk *input;
+	void __iomem *base;
+	unsigned int i;
+	u32 bmpre;
+	int ret;
+
+	base = devm_of_iomap(dev, dev->of_node, 0, &size);
+	if (IS_ERR(base))
+		return dev_err_probe(dev, PTR_ERR(base),
+				     "unable to map RCC registers\n");
+
+	input = devm_clk_get(dev, "hse");
+	if (IS_ERR(input))
+		return dev_err_probe(dev, PTR_ERR(input),
+				     "unable to get HSE input clock\n");
+	hse_rate = clk_get_rate(input);
+
+	input = devm_clk_get(dev, "lse");
+	if (IS_ERR(input))
+		return dev_err_probe(dev, PTR_ERR(input),
+				     "unable to get LSE input clock\n");
+	lse_rate = clk_get_rate(input);
+
+	reset = devm_kzalloc(dev, sizeof(*reset), GFP_KERNEL);
+	if (!reset)
+		return -ENOMEM;
+
+	spin_lock_init(&reset->lock);
+	reset->membase = base;
+	reset->rcdev.owner = THIS_MODULE;
+	reset->rcdev.nr_resets = size * BITS_PER_BYTE;
+	reset->rcdev.ops = &reset_simple_ops;
+	reset->rcdev.of_node = dev->of_node;
+
+	ret = devm_reset_controller_register(dev, &reset->rcdev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register reset controller\n");
+
+	clk_data = devm_kzalloc(dev,
+				struct_size(clk_data, hws, STM32H7RS_MAX_CLKS),
+				GFP_KERNEL);
+	if (!clk_data)
+		return -ENOMEM;
+
+	clk_data->num = STM32H7RS_MAX_CLKS;
+	for (i = 0; i < clk_data->num; i++)
+		clk_data->hws[i] = ERR_PTR(-ENOENT);
+
+	sys_rate = stm32h7rs_sys_rate(base, hse_rate);
+	bmpre = (readl_relaxed(base + RCC_BMCFGR) >>
+		  RCC_BMCFGR_BMPRE_SHIFT) & 0xf;
+	hclk_rate = stm32h7rs_ahb_rate(sys_rate, bmpre);
+	pclk1_rate = stm32h7rs_apb_rate(base, hclk_rate,
+					RCC_APBCFGR_PPRE1_SHIFT);
+	pclk2_rate = stm32h7rs_apb_rate(base, hclk_rate,
+					RCC_APBCFGR_PPRE2_SHIFT);
+	pclk4_rate = stm32h7rs_apb_rate(base, hclk_rate,
+					RCC_APBCFGR_PPRE4_SHIFT);
+	pclk5_rate = stm32h7rs_apb_rate(base, hclk_rate,
+					RCC_APBCFGR_PPRE5_SHIFT);
+	timer_rate = stm32h7rs_timer_rate(base, hclk_rate, pclk1_rate);
+	uart4_rate = stm32h7rs_uart4_rate(base, hse_rate, lse_rate, pclk1_rate);
+	sdmmc1_rate = stm32h7rs_sdmmc1_rate(base, hse_rate);
+
+	if (!sys_rate || !hclk_rate || !pclk1_rate || !pclk2_rate ||
+	    !pclk4_rate || !pclk5_rate || !timer_rate || !uart4_rate ||
+	    !sdmmc1_rate)
+		return dev_err_probe(dev, -EINVAL,
+				     "invalid boot clock configuration\n");
+
+	ret = h7rs_register_fixed(dev, clk_data, STM32H7RS_SYS_CK,
+				  "h7rs_sys_ck", sys_rate);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register system clock\n");
+
+	ret = h7rs_register_fixed(dev, clk_data, STM32H7RS_HCLK,
+				  "h7rs_hclk", hclk_rate);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register HCLK\n");
+
+	ret = h7rs_register_fixed(dev, clk_data, STM32H7RS_PCLK1,
+				  "h7rs_pclk1", pclk1_rate);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register PCLK1\n");
+
+	ret = h7rs_register_fixed(dev, clk_data, STM32H7RS_PCLK2,
+				  "h7rs_pclk2", pclk2_rate);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register PCLK2\n");
+
+	ret = h7rs_register_fixed(dev, clk_data, STM32H7RS_PCLK4,
+				  "h7rs_pclk4", pclk4_rate);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register PCLK4\n");
+
+	ret = h7rs_register_fixed(dev, clk_data, STM32H7RS_PCLK5,
+				  "h7rs_pclk5", pclk5_rate);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to register PCLK5\n");
+
+	parent_hws[STM32H7RS_PARENT_HCLK] = clk_data->hws[STM32H7RS_HCLK];
+	parent_hws[STM32H7RS_PARENT_TIM5] =
+		devm_clk_hw_register_fixed_rate(dev, "tim5_ker", NULL,
+						CLK_IS_CRITICAL, timer_rate);
+	parent_hws[STM32H7RS_PARENT_UART4] =
+		devm_clk_hw_register_fixed_rate(dev, "uart4_ker", NULL,
+						CLK_IS_CRITICAL, uart4_rate);
+	parent_hws[STM32H7RS_PARENT_SDMMC1] =
+		devm_clk_hw_register_fixed_rate(dev, "sdmmc1_ker", NULL,
+						CLK_IS_CRITICAL, sdmmc1_rate);
+
+	for (i = STM32H7RS_PARENT_TIM5; i < STM32H7RS_PARENT_COUNT; i++) {
+		if (IS_ERR(parent_hws[i]))
+			return dev_err_probe(dev, PTR_ERR(parent_hws[i]),
+					     "failed to register parent clock %u\n",
+					     i);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(stm32h7rs_gates); i++) {
+		const struct stm32h7rs_gate *gate = &stm32h7rs_gates[i];
+
+		ret = h7rs_register_gate(dev, clk_data, gate,
+					 parent_hws[gate->parent], base);
+		if (ret)
+			return dev_err_probe(dev, ret,
+					     "failed to register %s clock\n",
+					     gate->name);
+	}
+
+	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, clk_data);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to add clock provider\n");
+
+	dev_info(dev,
+		 "sys=%lu hclk=%lu pclk1=%lu tim5=%lu uart4=%lu sdmmc1=%lu\n",
+		 sys_rate, hclk_rate, pclk1_rate, timer_rate, uart4_rate,
+		 sdmmc1_rate);
+
+	return 0;
+}
+
+static const struct of_device_id stm32h7rs_rcc_match[] = {
+	{ .compatible = "st,stm32h7rs-rcc" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, stm32h7rs_rcc_match);
+
+static struct platform_driver stm32h7rs_rcc_driver = {
+	.probe = stm32h7rs_rcc_probe,
+	.driver = {
+		.name = "stm32h7rs-rcc",
+		.of_match_table = stm32h7rs_rcc_match,
+	},
+};
+builtin_platform_driver(stm32h7rs_rcc_driver);
+
+MODULE_DESCRIPTION("STM32H7RS Reset and Clock Controller driver");
+MODULE_LICENSE("GPL");
-- 
2.55.0

