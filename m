Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azolkn19012057.outbound.protection.outlook.com [52.103.10.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A71193C661D;
	Sun, 26 Jul 2026 16:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.10.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785082176; cv=fail; b=m/O7Ouqph0lQzNlfrloeeugE7aaDLPxdTugcyezfidybeGLZsuYORsubW0FiQhhgpVvJ/qDvCpqobQ/Jb4s+SIIsgbWf+ujcezgPDVab800k4Xx0j6euKU5X1HpoL+sT2EJrgDWhYXQ/9hklzD/qOJf4H+LOEHHp3ZO2UZsB3DU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785082176; c=relaxed/simple;
	bh=dgAf8eM27rjCj6M/zjgqzx843RW4iTGGeUSzVi/wsVY=;
	h=Message-ID:In-Reply-To:References:From:To:Cc:Date:Subject:
	 Content-Type:MIME-Version; b=qwV9VWtqA37DoHaoopAaOojUCy6Rorp8qD0oeb800Iyt4rvRecJz6jHFI0VOELj3Oinl32tCz8Kf9Rl5+iUAODk9om9Cbdq7oOOPZOw07yAfuljBw9lGLAkr6gAwCvex61iBEkh6sfhC+SCDHuHOdxdp5Gn6g2C6rK4neRrmur8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=kFe3Q6da; arc=fail smtp.client-ip=52.103.10.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="kFe3Q6da"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x10ReprNqxjKqSCIPtDWKGtHtzHEuLQsLJKaRkCy6bvsumrLmGT6QNNgJ1hydzg/0AQ/1KqTngkp4vnTwKXCruq0tAG7P6sSKZ2OaeZRVk722+Hf9P2IQJZ2Euo61zDTYnSLR64lycFBI0VTufYn5kpivMM6t+RqqRf73kTOZGQR1XmypulPVScYBiMmXWKDnO54tETG0FyqdXrKGO+Ubwy/BBlbk6X0x1sz+hKML7XYeGefDU/D3CB7CD4mEB/6mqcP+vc+dQDuPlcYblYRFssBXyYK16JpS1vGXl/eWZG5BCTFhtNGdF+5yqsUFQfP1uI7rcGkCIPGoyub1dW5qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5kpsH1cjjEvu9jrR6sTEQ63vP2nPPGUnsP0jqkIfrNs=;
 b=ODetNvInxkJeSDiecJbznNS1Vnl6yLD3p1WhLoMvyPg2jLM7kB710mAOq6UofnZVLkM4Mo/FgQtX3kIfpZL8Uw+ppeiEQMGAyHFTiqn3QPYC0CwSxdqYJIKE3HYcPvw1HTD13LTv2hT/+PxBAYq3HFgmBmMunqpbrmtEsmKg31MNmtr5l9FtmjtguOF6+W+vLyHlO38yYsn4tLBxNFMZwkCcIZROnMR5q0WwRH9rog9jm2PLSU7zD4strfh1QkFs5q+d1H0nhtz/9XU1aHKvH7vwEoJsrTUM3PTFb9q7KsCJBh6cQ/jY2STpfi8Ec55etcrlTuniLd/g7Wyvb8TNmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5kpsH1cjjEvu9jrR6sTEQ63vP2nPPGUnsP0jqkIfrNs=;
 b=kFe3Q6daDNYcAG0xHBVlDa0xszRYglHIkUBsJvFd95cYK2RCM59ZMdOul8VwpOUVhLUPWhLfE4S6Olblz058Ihi8P/BQG8oAlbbWnhNZOtrplXlirS/q6+phfIat1e/7nJE2cBU9eP3l5VYFSsEtAxhnYa1WtQd2L9jUIZNn5rnQaErSBsTCAKwi4Su3h8GpuZMo1oFwH36tr1SSRABExNAJDKr8qDwRGDdcM52St89aC3d1k96GKxdJgGzd5eIPtiQimxt4rjqNwAgJbqOGNfF+Bi/EHsadQtfMuU/GsX9bwo0Ucs0UA0YoO6Bw0T7ZWqtis/mjCxk/+UmZKdlA9A==
Received: from MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
 by SN7PR19MB4765.namprd19.prod.outlook.com (2603:10b6:806:100::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Sun, 26 Jul
 2026 16:09:32 +0000
Received: from MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374]) by MN0PR19MB6091.namprd19.prod.outlook.com
 ([fe80::af9a:4cc3:facf:9374%5]) with mapi id 15.21.0245.012; Sun, 26 Jul 2026
 16:09:32 +0000
Message-ID:
 <MN0PR19MB6091BD038D1C31CA2480047FACCD2@MN0PR19MB6091.namprd19.prod.outlook.com>
In-Reply-To: <cover.1785080950.git.liucj1228@outlook.com>
References: <cover.1785080950.git.liucj1228@outlook.com>
From: Liu Changjie <liucj1228@outlook.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 23 Jul 2026 23:48:58 +0800
Subject: [PATCH 3/9] clk: stm32: add STM32H7RS RCC driver
Content-Type: text/plain
X-ClientProxiedBy: TPYP295CA0008.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:9::9)
 To MN0PR19MB6091.namprd19.prod.outlook.com (2603:10b6:208:382::21)
X-Microsoft-Original-Message-ID:
 <11b65028436c6aca994298d061cee10fd5774949.1785080950.git.liucj1228@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR19MB6091:EE_|SN7PR19MB4765:EE_
X-MS-Office365-Filtering-Correlation-Id: 58867787-ddc1-417c-abe6-08deeb304784
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|51005399006|24021099003|15080799012|23021999003|5072599009|25010399006|41001999006|37011999003|19110799012|8060799015|12091999003|3412199025|440099028|26104999009|40105399003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9zbs7l7AUNpmP6WMrFb5O2jWiKPA6FWPttbEiNrJR/G9+IUpFXeFN2DI4zU0?=
 =?us-ascii?Q?8jVJxmcMzvBb1hn+873IcijtNg7ElDSLDw1JcnlMHtQYbmjgRmE5XmykFzx4?=
 =?us-ascii?Q?W95su/pYKoStLFNl/lBqgsMA+UsYJXPaR7+F6s19wugJ4nxQVIGtqtSIvI6o?=
 =?us-ascii?Q?2F5QDfEoFN66Lf2f7g/Mad1vR4rPtU7H1Q1+npRCOA6ZZ70p6iqD7IzpO0cn?=
 =?us-ascii?Q?WWu124TCcOrdZ4a12AEYpiHBJ2dzaTI5JR9w+WFgqtI2BKPvvRUwGs4EDZGt?=
 =?us-ascii?Q?yUY5crjBfxpWtyU6ob53VcTAwepG181Lx10XVkAu+e4NygaOSY6gxdrCMd4P?=
 =?us-ascii?Q?kHEqCvaKk4tBPA8nlzFkEL/kzBmoLsyi56ETz1THe54TOeFdlBh8EYDdtNt3?=
 =?us-ascii?Q?Sat/DXZ5Sj8t4y8bZ3NrzcTAGvWKlIC1o0MldI2V7jqZ+IbtVtQ5vLQJ8cYQ?=
 =?us-ascii?Q?xFILBLopeb6aobnl9lMxfY7zmi3hcqxd1/RhMObMzQpFLuUdMGiaXfTKGLdB?=
 =?us-ascii?Q?E1USHT1vjxilm8RYAEHSqglrIM/EGqt+f7bCC9VbmLIwYGiagnBpDqtirhgQ?=
 =?us-ascii?Q?SDyc1RQZBWS64QoTegVSAtKF7aoIW2VMREORcIUWA3UZL9HNUF0chtpBNIVI?=
 =?us-ascii?Q?d4rW9ACbXvgn65PTdQD6g3osfdLK9tEste+xGudMD9+sfpMDwMVOPpvnnqgP?=
 =?us-ascii?Q?fXcSu773cgXcK0AFnzVKdMh52p5L9GZHMgEaqtefbpR0tFXK9EA/9wIrw8ws?=
 =?us-ascii?Q?b6OcMrNpfTh3H9i4CtIAOQ52Fu+v94NmjtJnDPfb5WTFn0GjCzxw4mcB2g+w?=
 =?us-ascii?Q?KN80WtGcV0wwLprjsAfxzBRDWnMjafk8mkPGGk/8deH92/ZjFFs9zIMG5hzx?=
 =?us-ascii?Q?xm9hT29XwCcqNIXiA1DdYD2Z3HJg5RpOM/IrlcIHyqx8+v6EBNFu4+xdpSOj?=
 =?us-ascii?Q?uvTU0TMCzz/WgQ4EvYapzOwQWGUKqaR9M0Jj8NCzmp/pgjF4PPmuanIt34yN?=
 =?us-ascii?Q?Ms4rFpROuVQO5F8nBjzW4AKRaQ=3D=3D?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?UJ76Y/bruiFZZklQOEU8A/zF+VJQUjEMzyvaZUfsJJ/OoswIiB7s23w4kHbz?=
 =?us-ascii?Q?6dMksl9yZD8cqIEm2odrbX8PH81PRO+7qHaBInuN99eBScTGtP3B37pfGOUm?=
 =?us-ascii?Q?3UpSwwIqd/UJPHBLQ0xth/wQWepNkd5OWzt/KdwwdJIIkP6opPJCmbWdgvWJ?=
 =?us-ascii?Q?jKPF5EvfY5IFJNPh8FDtVcDNiMz5feglKR2EPT8Ammi1DIm/mQ7xfr2+sCIo?=
 =?us-ascii?Q?ivNVqbi75IvoWM4wNL9ZWThz8JUYd9fvSmPgxSxHILYnxXxHhktJtu9sIpd6?=
 =?us-ascii?Q?dr6I0HZMgjr4YYmEaXI2B0g0FnSUc97/cZmjYGiqyA367BNlZEQm+58YRQPv?=
 =?us-ascii?Q?+PCxkCUhD20BCWCVZrPI4KrIKRkA6BVURPo06kknWo3TuHxuq6IzqiwfdoOD?=
 =?us-ascii?Q?wDeBUDpms71wajrQ9a+OAOqDUUd4M6rdRSbWuiNn1bvUgV1b5ofttHn5/FGK?=
 =?us-ascii?Q?Tfh1mV2pS7yD2Pi+Jk8oQKcSyM3kiYTU4bat7whgpYrWYXyMRw3XQHeRqmwV?=
 =?us-ascii?Q?ZeFF8JHSsH5wlQGdt/mqT/z7uVLdhds5GlSgCSZPGLPuT6Ed1stiCZx8X+nx?=
 =?us-ascii?Q?4Qs3HidmRXanu8w0iqlWXmsA8DEuen/RbnxZaDtM809Nc9JpY9c8aq3ed6HX?=
 =?us-ascii?Q?IZI0wpiMu4CvIY2shaiqYzd55rYB4Zg+CpKwD00sNDdg3hFtmUPL9zk467e0?=
 =?us-ascii?Q?jK+ErERLE8gIFtBCmcNbu4Ls39uqB/Hy4hL0Ym9ln66VN4jE84HrZuTl6fh3?=
 =?us-ascii?Q?5HcLQytyAfIhGFlO600K0afG+tBF3IxrcTab0NdTJ4lC4AFe3QdhZv3MOnny?=
 =?us-ascii?Q?vXRpw6pSEbbs2YpY0/hdJXs4QtQQ+DEKp3FPQa7dCkOFCh3eNmoZP+v9zMvZ?=
 =?us-ascii?Q?n9sbu3kKrwYkTEyUhWYjInyNMgZcAI+J3gC9gJxQFHTV8ioSscYVlz3r3abk?=
 =?us-ascii?Q?8k7Vd/OqtAiaX0bmynYNbMNJ+7Xfk9NsQ8dSplOJOl1E5BvDKd0EY+vTPLty?=
 =?us-ascii?Q?SkCqkz028HKScM2UtDGMSIWJw27Ih53ODugTKjohySWmeLQER8Zydhxbl+YZ?=
 =?us-ascii?Q?steA1tHGF3fsuPGRhrvg9c6ERAR3ym2Zkz0PI6EKSbKvmsMntRYP+Q5AAIpu?=
 =?us-ascii?Q?nS8rRL96zO8xfD7nR+NN277vW8Of2CXJzOpdOFJXC1Xz7vru1ArwGUVWrAXu?=
 =?us-ascii?Q?Kxnuvbz+GURLFioOh0sbX7cQeNMtqWTdM2STIP5asjPc0bIhJNuUCpdbr5w1?=
 =?us-ascii?Q?NjZb2Dw71M9s4NUYP5Qqfjmbnz/yGM9SCMtLDSa4pOTS/83M7I0roVjHNGL3?=
 =?us-ascii?Q?ePYa7mY6Zvgd+DNdmRdFjfaDxCsjggH9nXeSkLsutiscL9jn2rq6qSdUQJb5?=
 =?us-ascii?Q?bv9R7mS3swUvjrEUNvEK8rFeUEaJ1k1nSADp4D3LGQtrGKsVtg=3D=3D?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58867787-ddc1-417c-abe6-08deeb304784
X-MS-Exchange-CrossTenant-AuthSource: MN0PR19MB6091.namprd19.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2026 16:09:32.7650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR19MB4765

Register the active STM32H7RS system, bus and selected peripheral
clocks without reprogramming the PLLs used for execute-in-place.
Decode the PLL2 S and T outputs used by SDMMC from PLL2DIVR2.
Expose gates for TIM5, UART4, GPIO banks A-H and M-P, and SDMMC1.

Signed-off-by: Liu Changjie <liucj1228@outlook.com>
---
 drivers/clk/Kconfig         |   5 +
 drivers/clk/Makefile        |   1 +
 drivers/clk/clk-stm32h7rs.c | 466 ++++++++++++++++++++++++++++++++++++
 3 files changed, 472 insertions(+)
 create mode 100644 drivers/clk/clk-stm32h7rs.c

diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index 1717ce75a..5d1562a8a 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -448,6 +448,11 @@ config COMMON_CLK_STM32H7
 	help
 	  Support for stm32h7 SoC family clocks
 
+config COMMON_CLK_STM32H7RS
+	def_bool COMMON_CLK && MACH_STM32H7R7
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
index 000000000..b82a24822
--- /dev/null
+++ b/drivers/clk/clk-stm32h7rs.c
@@ -0,0 +1,466 @@
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
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/of_clk.h>
+#include <linux/slab.h>
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
+	u64 numerator;
+	unsigned long parent_rate;
+	u32 divr1, frac = 0, m, n, out_div, source;
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
+static int __init h7rs_register_fixed(struct clk_hw_onecell_data *data,
+				      unsigned int id, const char *name,
+				       unsigned long rate)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_fixed_rate(NULL, name, NULL, CLK_IS_CRITICAL, rate);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	data->hws[id] = hw;
+	return 0;
+}
+
+static int __init h7rs_register_gate(struct clk_hw_onecell_data *data,
+				     unsigned int id, const char *name,
+				      const char *parent_name,
+				      void __iomem *base, u16 offset,
+				      u8 bit_idx)
+{
+	struct clk_hw *hw;
+
+	hw = clk_hw_register_gate(NULL, name, parent_name, CLK_IGNORE_UNUSED,
+				  base + offset, bit_idx, 0,
+				  &stm32h7rs_rcc_lock);
+	if (IS_ERR(hw))
+		return PTR_ERR(hw);
+
+	data->hws[id] = hw;
+	return 0;
+}
+
+struct stm32h7rs_gate {
+	u8 id;
+	u8 bit_idx;
+	u16 offset;
+	const char *name;
+	const char *parent_name;
+};
+
+static const struct stm32h7rs_gate stm32h7rs_gates[] __initconst = {
+	{ STM32H7RS_TIM5_CK, 3, RCC_APB1ENR1, "tim5", "tim5_ker" },
+	{ STM32H7RS_UART4_CK, 19, RCC_APB1ENR1, "uart4", "uart4_ker" },
+	{ STM32H7RS_GPIOA_CK, 0, RCC_AHB4ENR, "gpioa", "h7rs_hclk" },
+	{ STM32H7RS_GPIOB_CK, 1, RCC_AHB4ENR, "gpiob", "h7rs_hclk" },
+	{ STM32H7RS_GPIOC_CK, 2, RCC_AHB4ENR, "gpioc", "h7rs_hclk" },
+	{ STM32H7RS_GPIOD_CK, 3, RCC_AHB4ENR, "gpiod", "h7rs_hclk" },
+	{ STM32H7RS_GPIOE_CK, 4, RCC_AHB4ENR, "gpioe", "h7rs_hclk" },
+	{ STM32H7RS_GPIOF_CK, 5, RCC_AHB4ENR, "gpiof", "h7rs_hclk" },
+	{ STM32H7RS_GPIOG_CK, 6, RCC_AHB4ENR, "gpiog", "h7rs_hclk" },
+	{ STM32H7RS_GPIOH_CK, 7, RCC_AHB4ENR, "gpioh", "h7rs_hclk" },
+	{ STM32H7RS_GPIOM_CK, 12, RCC_AHB4ENR, "gpiom", "h7rs_hclk" },
+	{ STM32H7RS_GPION_CK, 13, RCC_AHB4ENR, "gpion", "h7rs_hclk" },
+	{ STM32H7RS_GPIOO_CK, 14, RCC_AHB4ENR, "gpioo", "h7rs_hclk" },
+	{ STM32H7RS_GPIOP_CK, 15, RCC_AHB4ENR, "gpiop", "h7rs_hclk" },
+	{ STM32H7RS_SDMMC1_CK, 8, RCC_AHB5ENR, "sdmmc1", "sdmmc1_ker" },
+};
+
+static void __init stm32h7rs_rcc_init(struct device_node *np)
+{
+	struct clk_hw_onecell_data *clk_data;
+	unsigned long hse_rate, lse_rate;
+	unsigned long sys_rate, hclk_rate;
+	unsigned long pclk1_rate, pclk2_rate, pclk4_rate, pclk5_rate;
+	unsigned long timer_rate, uart4_rate, sdmmc1_rate;
+	struct clk_hw *timer_hw = NULL, *uart4_hw = NULL, *sdmmc1_hw = NULL;
+	struct clk *input;
+	void __iomem *base;
+	unsigned int fixed_count = 0, gate_count = 0;
+	unsigned int i;
+	u32 bmpre;
+	int ret;
+
+	base = of_iomap(np, 0);
+	if (!base) {
+		pr_err("%pOF: unable to map RCC registers\n", np);
+		return;
+	}
+
+	input = of_clk_get(np, 0);
+	if (IS_ERR(input)) {
+		pr_err("%pOF: unable to get HSE input clock\n", np);
+		goto err_unmap;
+	}
+	hse_rate = clk_get_rate(input);
+	clk_put(input);
+
+	input = of_clk_get(np, 1);
+	if (IS_ERR(input)) {
+		pr_err("%pOF: unable to get LSE input clock\n", np);
+		goto err_unmap;
+	}
+	lse_rate = clk_get_rate(input);
+	clk_put(input);
+
+	clk_data = kzalloc(struct_size(clk_data, hws, STM32H7RS_MAX_CLKS),
+			   GFP_KERNEL);
+	if (!clk_data)
+		goto err_unmap;
+	clk_data->num = STM32H7RS_MAX_CLKS;
+
+	sys_rate = stm32h7rs_sys_rate(base, hse_rate);
+	bmpre = (readl_relaxed(base + RCC_BMCFGR) >>
+		  RCC_BMCFGR_BMPRE_SHIFT) & 0xf;
+	hclk_rate = stm32h7rs_ahb_rate(sys_rate, bmpre);
+	pclk1_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE1_SHIFT);
+	pclk2_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE2_SHIFT);
+	pclk4_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE4_SHIFT);
+	pclk5_rate = stm32h7rs_apb_rate(base, hclk_rate, RCC_APBCFGR_PPRE5_SHIFT);
+	timer_rate = stm32h7rs_timer_rate(base, hclk_rate, pclk1_rate);
+	uart4_rate = stm32h7rs_uart4_rate(base, hse_rate, lse_rate, pclk1_rate);
+	sdmmc1_rate = stm32h7rs_sdmmc1_rate(base, hse_rate);
+
+	if (!sys_rate || !hclk_rate || !pclk1_rate || !pclk2_rate ||
+	    !pclk4_rate || !pclk5_rate || !timer_rate || !uart4_rate ||
+	    !sdmmc1_rate) {
+		pr_err("%pOF: invalid boot clock configuration\n", np);
+		goto err_free;
+	}
+
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_SYS_CK,
+				  "h7rs_sys_ck", sys_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_HCLK,
+				  "h7rs_hclk", hclk_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK1,
+				  "h7rs_pclk1", pclk1_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK2,
+				  "h7rs_pclk2", pclk2_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK4,
+				  "h7rs_pclk4", pclk4_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+	ret = h7rs_register_fixed(clk_data, STM32H7RS_PCLK5,
+				  "h7rs_pclk5", pclk5_rate);
+	if (ret)
+		goto err_register;
+	fixed_count++;
+
+	timer_hw = clk_hw_register_fixed_rate(NULL, "tim5_ker", NULL,
+					      CLK_IS_CRITICAL, timer_rate);
+	if (IS_ERR(timer_hw)) {
+		ret = PTR_ERR(timer_hw);
+		timer_hw = NULL;
+		goto err_register;
+	}
+	uart4_hw = clk_hw_register_fixed_rate(NULL, "uart4_ker", NULL,
+					      CLK_IS_CRITICAL, uart4_rate);
+	if (IS_ERR(uart4_hw)) {
+		ret = PTR_ERR(uart4_hw);
+		uart4_hw = NULL;
+		goto err_register;
+	}
+	sdmmc1_hw = clk_hw_register_fixed_rate(NULL, "sdmmc1_ker", NULL,
+					       CLK_IS_CRITICAL, sdmmc1_rate);
+	if (IS_ERR(sdmmc1_hw)) {
+		ret = PTR_ERR(sdmmc1_hw);
+		sdmmc1_hw = NULL;
+		goto err_register;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(stm32h7rs_gates); i++) {
+		const struct stm32h7rs_gate *gate = &stm32h7rs_gates[i];
+
+		ret = h7rs_register_gate(clk_data, gate->id, gate->name,
+					 gate->parent_name, base,
+					   gate->offset, gate->bit_idx);
+		if (ret) {
+			pr_err("%pOF: failed to register %s clock: %d\n",
+			       np, gate->name, ret);
+			goto err_register;
+		}
+		gate_count++;
+	}
+
+	ret = of_clk_add_hw_provider(np, of_clk_hw_onecell_get, clk_data);
+	if (ret) {
+		pr_err("%pOF: failed to add clock provider: %d\n", np, ret);
+		goto err_register;
+	}
+
+	pr_info("STM32H7RS RCC: sys=%lu hclk=%lu pclk1=%lu tim5=%lu uart4=%lu sdmmc1=%lu\n",
+		sys_rate, hclk_rate, pclk1_rate, timer_rate, uart4_rate,
+		sdmmc1_rate);
+	return;
+
+err_register:
+	while (gate_count) {
+		const struct stm32h7rs_gate *gate;
+
+		gate = &stm32h7rs_gates[--gate_count];
+		clk_hw_unregister_gate(clk_data->hws[gate->id]);
+	}
+	if (sdmmc1_hw)
+		clk_hw_unregister_fixed_rate(sdmmc1_hw);
+	if (uart4_hw)
+		clk_hw_unregister_fixed_rate(uart4_hw);
+	if (timer_hw)
+		clk_hw_unregister_fixed_rate(timer_hw);
+	while (fixed_count)
+		clk_hw_unregister_fixed_rate(clk_data->hws[--fixed_count]);
+	pr_err("%pOF: failed to register clocks: %d\n", np, ret);
+err_free:
+	kfree(clk_data);
+err_unmap:
+	iounmap(base);
+}
+
+CLK_OF_DECLARE_DRIVER(stm32h7rs_rcc, "st,stm32h7rs-rcc", stm32h7rs_rcc_init);
-- 
2.55.0

