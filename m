Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2108.outbound.protection.partner.outlook.cn [139.219.146.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5642E415B8A;
	Fri, 28 Aug 2026 11:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.108
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787916525; cv=fail; b=JnSECeh6ZwU7AmwCGnaAtCtHxa/OTlzjeo8sFCoylMQ/JpMlgYUTWhE/NPhtLa6YyIw22tG4/GucA1bdzD/EphZQm43myuXmaKCm7lJwaaErw04jRqSAejioxOP9H32z+3YbhszD0tgvYe0Na/ECcsIE1TLie8NVq2rs5ez+bG4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787916525; c=relaxed/simple;
	bh=pZ4yevZvpf9CShd2KM9HWuMRdTYnl6QlQQVQrkLZV+g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A5xnogUNeNRtRO/VUW49T6/5fOdLrs6bY1SaHNXEaiEyo93lq05H5KgBTlIXYTLxLFbR5zSzUdJpASgcBGaiop03VZ6ImUjxcnc/8FU8oCrlqrqSeQ028shuOPkXVLYyy2q4G+UmGwOUhCEdFexwZcw4xKjMUCrKE3hAqxEiOz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fl7tPnsPVY4EEcF5+RTwW2ID6cyHzx4ecFhOa0EkeQMEQ1/APUS9+YANzcpXlHH5ls+vsGQdQ61/D1DDjv/wTjEheJj/hSzNh5FF2YV7GShuU73PNSmzyQKPjg+6FTEgwwsUuYW9SsqUUX6u4szb4T+v8vxCUtsUpa4HwE31c9IdsfYX5aHHaQodyijAS/xdQB2hU231KmkARXETQj8/PdKmHPDs5kuxbjuZG1JANHEkEaDa6vXCNm/eZwKd7h0BlDmDnqvDq1a0OHm3QJ4ksa0KKM0x15EfqC3bzaYN1FHh2ukM5R04LwnS4jz2qoWLy8RFa/APFWE+ws+cpn8s+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MIXCri253AVHCMKyx1g5uGJnuQmFzHBzaHqwJslpA4c=;
 b=RIeD+H1P2XBLlqa/8uzwfnAf1p0+0J3yS4DycPE4PPz069sQGc6iHaXw1oN42lgucm7hn4fjKvMFRFd679zqcoIxIIYSeke5glCIQ9+h/7LGvw6PShh6Bi9vG/bEDNR7WAb9kcSckOFHz796N1EP+JjL64kkF2C+DmBA9/5YbGN7iQ1iTkyQ8YlRs/y8uElfKKu/85H2ugilIuosKTCtoK3ZaVh0cyHyNCEfw0cRuexjkkyfr8ExjlIxJAnI49ekE89BBdophRWM4zyso7o5bpFOTdBO10LTRe7O93M/oyp3qsxkmunwKZn3+jUs3EOKtXxCx3WScMUOlC42yhA0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1203.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:22 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:22 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v5 2/8] clk: starfive: Add system-0 domain PLL clock driver
Date: Fri, 28 Aug 2026 02:56:02 -0700
Message-Id: <20260828095608.19955-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::15) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1203:EE_
X-MS-Office365-Filtering-Correlation-Id: e504d388-28af-441b-ac56-08df04ea9dcb
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|23010399003|366016|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	5LMbvNL7zvhhMjErQRNLmeOFKjiupviQ/eiu0rTdk6NugVLTG51pBCRBMpP6PCHVmHmqg2C2SlEWUkxFuI/aNshuSNBKmUUV6wYlBJpR1cZ1jEZ18UZJqiah/qKs0e5GuQaIaqD+Bj9z0Nv7/29YEH3Ut72Ee83qvjyayRTBR1nZE20v0Hk5Wnrt4kP+LJJHHKRBs1xcCJ2qLK9PoCMy27iVcwIjEdV5EYrRm5oXnUnOWfHRR2RE/ki7B7Q3kprtgM31jECSJYgYW1g15FpxjFqSf4R5cRJKp/qHSAKGzxfUFgYbW1Iy8k6b1DTBAQu2acwW95MACQDUBpF4gJJPngAZ+j/wbD+On6GSxqsbLHZtXHC41jKFRR9Xy86S2XFV8YkpV3Mx7TMKJuSkqxEzS12Cb54i9dLrenbpOSNE6JqkfcW+Ami04cjl/JVCYKjQeANeQCrI39YYLu4XbAvEncRvfdBeE39TltbXgCNg++pWUNeO0SDc6sBHdOMCLyBu3ZRlkiYkeAGWpNT8TnCSV2PXkRcpNLFsAipEX1W1EPdVXbtQ2C/L18G1hVAe0nnKJcHYdwXq5aaSBmDPBG56QQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hVm650dNQQV367cb4KtNj5wyleDMv2pavNg8CvMmCI9YguvrCoJiNL8x07GB?=
 =?us-ascii?Q?+4vOoXRe88TPLwXPll5Hf136tDoA/8BhFZ8Uii6p8u7W2IrUTES830pGPs39?=
 =?us-ascii?Q?aqg0x1wvx8WvudmdvGFVrRn002ikUkvvZgbOQVnEOP8fWUbYXyun7v475aHe?=
 =?us-ascii?Q?ThfIXiPnxKlJ3JgifSBKwrObO75GdssBCjehYQn60QJp+H8P9S7pDTDNn/KB?=
 =?us-ascii?Q?+WkKYFvA/p6SQENVJwlQHHViVwyVTHM/qb+VISPKvBdCjEJRB5+iebday7XX?=
 =?us-ascii?Q?E2aQyrH723essXKf/2udTV0TwRxXYXm6MoWf4e+Sq/7+lHpqoI9HNKvpBX+I?=
 =?us-ascii?Q?kylmjAJ6q6Q37xMvjvlohggDhVNEK0zLrARqQtLfyidIEypyL33NkaBrHAdj?=
 =?us-ascii?Q?OhVEH0pESauPWYZUOpLAGp0ZxFAe3iHtuuhISx/ibTi6vbVkiAf3LVYcKDNv?=
 =?us-ascii?Q?M/dGHpnccM0Kb3DSu4PP7bA10WZRrvmT2nmXLGTyda6/VHhtSPsYlqsVWi/n?=
 =?us-ascii?Q?4u5hnwY3R2m87TbZfRDExzsSOqEWY6QuKwYWTVKnZnRZAtHuy2pil0HsOJpr?=
 =?us-ascii?Q?K8SOqtXRsz6lRxCXUa68IiivNo5kazWV+8QlIw4KusDzPpaq6VFoVldqgRm+?=
 =?us-ascii?Q?kuhY9ad+RgM7gke4bJV8fN3CWh4sFVXQVQynR1VORwDrq7hHmhlHKJxZwhLy?=
 =?us-ascii?Q?9qwuBSj7O2Ee7TRvtYvtPwjhbUUAw3ECLfrRqsgmYhWdXmPpxbRYG6BidSWB?=
 =?us-ascii?Q?Alj6FE0HETW9BXbpq5IBsDWPQPZsZFR05y/6WGXOX/9fsIF0lw5MQgsKgbxr?=
 =?us-ascii?Q?jbRdSsaO8maBiak/D9HEvlRO6lqxjxDMNJejmNUC3AQ0yoPBemCohTTVYK3A?=
 =?us-ascii?Q?T/HfWUmqjmfNdMd9EgDgyE0wx9BLhJokAFKL1ZoFLIeYvOk+QXTz60V+AGdW?=
 =?us-ascii?Q?q3gtdijedGCHtX6hE5CPi2Qe7hKbtpAt8JVaFkjxQ9B4O0+jVbyg9o1gQNoK?=
 =?us-ascii?Q?u+G3jCsTrOCnF0059Dz0G4vAIxNr4VjZ2pqjMdYgqqXuTjoxCSPjIYEFQ8tw?=
 =?us-ascii?Q?brZfuo8f8ftakahtkdLCF+V9OSiwioek3qo5EM2Zk9sEcpoTyGDXJjPj4bmD?=
 =?us-ascii?Q?HSa2z32b+wME+bfvhzqCCRPghorSmvH7NIY6NvcJDW7lPjIrollgE1e8eQkz?=
 =?us-ascii?Q?TIzAFgJMSTQ+fMzrVE0UrSDC2J35ZTuWcwwRlaHf6NflrU659R1jZfN94Ygw?=
 =?us-ascii?Q?o9U4eSa0wv5E9vVuUYiL4yDvKiH6IQXTmVl1g2BwB/en+YSx+ufQJX8cNXdf?=
 =?us-ascii?Q?gm5z3QEHhd6AScM4byKwZtKPZFW88JqhSC5KBEeRmwlOgQvIb/qDwes1dS3M?=
 =?us-ascii?Q?BpG3ZhpTT7bCzBfPOQEJD4wzu5GdN0fx2wCitJ2VYYs2O/xmxXBT3Fyeeg6w?=
 =?us-ascii?Q?8HGhVvpeY0Ebl0NxF4fSOFovanBlswtE33ZIZf4HJsSOs290StYpeyR+pHkS?=
 =?us-ascii?Q?2ASfISsHEhmJaTg/drATD+d2PzncgTLche19OISjobaXeYT0ez4Q4sa+TGHw?=
 =?us-ascii?Q?x4OXNynnTmjBNyQSrrQa3YQi3TyHeoz1jkuBcjtC3ygfPn1y5yeid+pUAoFV?=
 =?us-ascii?Q?IYVOhI+WJ6aKM+njqdCDjS1+nj1sBeev3TYNHstl9TftgN3r5ndNaT0e6loQ?=
 =?us-ascii?Q?utAYf/YG61hgu2ImpUDicBy0Bx1HQBWlsEACysfVT131Nq3bdeNmNBuY+nNJ?=
 =?us-ascii?Q?0IZl0P5eYnEBtCZRTPxThFK7vNeHRoNlsqPgVMK79dyOmBWDMmzk?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e504d388-28af-441b-ac56-08df04ea9dcb
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:22.7945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GCi5zMbqknDRNVoNrXj/P0nt7OthZuSFXsH1RT4h4q9+1vyO9A9WnQkdky10TlZRQlK8MBTHUmD4PEy/Fw9yY3rCPhMspCI+2CHAKxTULxg5bw/eIgvHDc2Jvpkv4+YZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1203

Add system-0 domain PLL clock driver for StarFive JHB100 SoC.

This driver is instantiated either as an MFD cell of the sys0 system
controller (added in a later patch) or by matching the per0/per1 syscon
nodes directly.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Xingyu Wu <xingyu.wu@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  10 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 524 ++++++++++++++++++
 3 files changed, 535 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 852464949334..2603d054173f 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -117,6 +117,16 @@ config CLK_STARFIVE_JHB100_PER3
 	  Say yes here to support the peripheral-3 clock controller
 	  on the StarFive JHB100 SoC.
 
+config CLK_STARFIVE_JHB100_PLL
+	bool "StarFive JHB100 PLL clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select STARFIVE_JHB100_SOCINFO
+	select MFD_SYSCON
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the PLL clock controller on the
+	  StarFive JHB100 SoC.
+
 config CLK_STARFIVE_JHB100_SYS0
 	bool "StarFive JHB100 system-0 clock support"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index f00690f0cdad..547a8c170728 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+= clk-starfive-jhb100-per1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+= clk-starfive-jhb100-per2.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+= clk-starfive-jhb100-per3.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_PLL)		+= clk-starfive-jhb100-pll.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
new file mode 100644
index 000000000000..e23365164497
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -0,0 +1,524 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 PLL Clock Generator Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
+#include <linux/math64.h>
+#include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+
+/* this driver expects a 25MHz input frequency from the oscillator */
+#define JHB100_PLL_OSC_RATE		(25 * HZ_PER_MHZ)
+
+/* System-0 domain PLL */
+#define JHB100_PLL2_OFFSET		0x00
+#define JHB100_PLL3_OFFSET		0x0c
+#define JHB100_PLL4_OFFSET		0x18
+#define JHB100_PLL5_OFFSET		0x24
+
+#define JHB100_PLL_CFG0_OFFSET		0x0
+#define JHB100_PLL_CFG1_OFFSET		0x4
+#define JHB100_PLL_CFG2_OFFSET		0x8
+
+#define JHB100_PLLX_CFG0(offset)	((offset) + JHB100_PLL_CFG0_OFFSET)
+/* fbdiv value should be 16 to 4095 */
+#define   JHB100_PLL_FBDIV			GENMASK(13, 2)
+#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
+#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
+
+#define JHB100_PLLX_CFG1(offset)	((offset) + JHB100_PLL_CFG1_OFFSET)
+/* frac value should be decimals multiplied by 2^24 */
+#define   JHB100_PLL_FRAC			GENMASK(23, 0)
+#define   JHB100_PLL_LOCK			BIT(24)
+
+#define JHB100_PLLX_CFG2(offset)	((offset) + JHB100_PLL_CFG2_OFFSET)
+#define   JHB100_PLL_PD				BIT(13)
+#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
+#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
+
+#define JHB100_PLL_TIMEOUT_US		1000
+#define JHB100_PLL_INTERVAL_US		100
+
+struct jhb100_pll_preset {
+	unsigned long freq;
+	u32 frac;			/* frac value should be decimals multiplied by 2^24 */
+	unsigned fbdiv		: 12;	/* fbdiv value should be 16 to 4095 */
+	unsigned refdiv		: 6;
+	unsigned postdiv	: 2;
+	unsigned foutpostdiv_en	: 1;
+	unsigned foutvcop_en	: 1;
+};
+
+struct jhb100_pll_info {
+	const char *name;
+	const struct jhb100_pll_preset *presets;
+	unsigned int npresets;
+	unsigned long flags;
+	u8 offset;
+	bool continuous;
+};
+
+#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flags, _cont)	\
+	[_idx] = {							\
+		.name = _name,						\
+		.offset = _offset,					\
+		.presets = _presets,					\
+		.npresets = _npresets,					\
+		.flags = _flags,					\
+		.continuous = _cont,					\
+	}
+
+#define JHB100_PLL(idx, name, presets, npresets, offset, cont)			\
+	_JHB100_PLL(idx, name, presets, npresets, offset, 0, cont)
+
+struct jhb100_pll_match_data {
+	const struct jhb100_pll_info *pll_info;
+	int num_pll;
+};
+
+struct jhb100_pll_data {
+	struct clk_hw hw;
+	unsigned int idx;
+};
+
+struct jhb100_pll_priv {
+	struct regmap *regmap;
+	const struct jhb100_pll_match_data *match_data;
+	struct jhb100_pll_data pll[];
+};
+
+struct jhb100_pll_regvals {
+	u32 fbdiv;
+	u32 frac;
+	u32 postdiv;
+	u32 refdiv;
+	bool foutpostdiv_en;
+	bool foutvcop_en;
+};
+
+static struct jhb100_pll_data *jhb100_pll_data_from(struct clk_hw *hw)
+{
+	return container_of(hw, struct jhb100_pll_data, hw);
+}
+
+static struct jhb100_pll_priv *jhb100_pll_priv_from(struct jhb100_pll_data *pll)
+{
+	return container_of(pll, struct jhb100_pll_priv, pll[pll->idx]);
+}
+
+static int jhb100_pll_prepare(struct clk_hw *hw)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+
+	return regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
+				  JHB100_PLL_PD, 0);
+}
+
+static void jhb100_pll_unprepare(struct clk_hw *hw)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
+			   JHB100_PLL_PD, JHB100_PLL_PD);
+}
+
+static int jhb100_pll_is_prepared(struct clk_hw *hw)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+	u32 val;
+	int ret;
+
+	ret = regmap_read(priv->regmap, JHB100_PLLX_CFG2(info->offset), &val);
+	if (ret)
+		return ret;
+
+	return !(val & JHB100_PLL_PD);
+}
+
+static int jhb100_pll_regvals_get(struct regmap *regmap,
+				  const struct jhb100_pll_info *info,
+				  struct jhb100_pll_regvals *val)
+{
+	u32 value;
+	int ret;
+
+	ret = regmap_read(regmap, JHB100_PLLX_CFG0(info->offset), &value);
+	if (ret)
+		return ret;
+
+	val->fbdiv = FIELD_GET(JHB100_PLL_FBDIV, value);
+	val->foutpostdiv_en = !!FIELD_GET(JHB100_PLL_FOUTPOSTDIV_EN, value);
+	val->foutvcop_en = !!FIELD_GET(JHB100_PLL_FOUTVCOP_EN, value);
+
+	ret = regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &value);
+	if (ret)
+		return ret;
+
+	val->frac = FIELD_GET(JHB100_PLL_FRAC, value);
+
+	ret = regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &value);
+	if (ret)
+		return ret;
+
+	val->postdiv = FIELD_GET(JHB100_PLL_POSTDIV, value);
+	val->refdiv = FIELD_GET(JHB100_PLL_REFDIV, value);
+
+	return 0;
+}
+
+static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	struct jhb100_pll_regvals val;
+	u32 power = 0;
+	u64 rate;
+	int ret;
+
+	ret = jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
+	if (ret)
+		return 0;
+
+	/*
+	 *
+	 * if (foutvcop_en)
+	 *      rate = parent * (fbdiv + frac / 2^24) / refdiv
+	 *
+	 * if (foutpostdiv_en)
+	 *      rate = parent * (fbdiv + frac / 2^24) / refdiv / 2^(postdiv + 1)
+	 *
+	 * parent * (fbdiv + frac / 2^24) = parent * fbdiv + parent * frac / 2^24
+	 */
+
+	if (!!val.foutvcop_en == !!val.foutpostdiv_en || !val.refdiv)
+		return 0;
+
+	rate = mul_u32_u32(parent_rate, val.frac) >> 24;
+
+	if (val.foutpostdiv_en)
+		power = val.postdiv + 1;
+
+	rate += mul_u32_u32(parent_rate, val.fbdiv);
+	rate = div_u64(rate, (u64)val.refdiv << power);
+
+	return rate;
+}
+
+static int jhb100_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+	const struct jhb100_pll_preset *selected = &info->presets[0];
+	unsigned int idx;
+
+	/* if the parent rate doesn't match our expectations the presets won't work */
+	if (req->best_parent_rate != JHB100_PLL_OSC_RATE) {
+		req->rate = jhb100_pll_recalc_rate(hw, req->best_parent_rate);
+		return 0;
+	}
+
+	/* continuous means support any rate */
+	if (info->continuous)
+		return 0;
+
+	/* find highest rate lower or equal to the requested rate */
+	for (idx = 1; idx < info->npresets; idx++) {
+		const struct jhb100_pll_preset *val = &info->presets[idx];
+
+		if (req->rate < val->freq)
+			break;
+
+		selected = val;
+	}
+
+	req->rate = selected->freq;
+
+	return 0;
+}
+
+static int jhb100_pll_set_preset(struct clk_hw *hw, const struct jhb100_pll_preset *val)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+	unsigned int value, cfg;
+	int ret;
+
+	cfg = FIELD_PREP(JHB100_PLL_FBDIV, (u32)val->fbdiv) |
+	      FIELD_PREP(JHB100_PLL_FOUTPOSTDIV_EN, (u32)val->foutpostdiv_en) |
+	      FIELD_PREP(JHB100_PLL_FOUTVCOP_EN, (u32)val->foutvcop_en);
+
+	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
+				 JHB100_PLL_FBDIV | JHB100_PLL_FOUTPOSTDIV_EN |
+				 JHB100_PLL_FOUTVCOP_EN, cfg);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset), JHB100_PLL_FRAC,
+				 FIELD_PREP(JHB100_PLL_FRAC, val->frac));
+	if (ret)
+		return ret;
+
+	cfg = FIELD_PREP(JHB100_PLL_REFDIV, (u32)val->refdiv) |
+	      FIELD_PREP(JHB100_PLL_POSTDIV, (u32)val->postdiv);
+
+	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
+				 JHB100_PLL_REFDIV | JHB100_PLL_POSTDIV, cfg);
+	if (ret)
+		return ret;
+
+	/* waiting for PLL to lock */
+	return regmap_read_poll_timeout(priv->regmap, JHB100_PLLX_CFG1(info->offset),
+					value, value & JHB100_PLL_LOCK,
+					JHB100_PLL_INTERVAL_US,
+					JHB100_PLL_TIMEOUT_US);
+}
+
+static int jhb100_pll_rate_to_preset(struct clk_hw *hw, unsigned long rate,
+				     unsigned long parent_rate)
+{
+	struct jhb100_pll_preset val = {
+		.refdiv = 1,
+		.postdiv = 3,
+		.foutpostdiv_en = 1,
+		.foutvcop_en = 0,
+	};
+	unsigned int power = 0;
+	u64 fbdiv_24, t;
+	u32 fbdiv;
+
+	if (val.foutpostdiv_en)
+		power = val.postdiv + 1;
+
+	t = (u64)val.refdiv << power;
+	t *= rate;
+
+	fbdiv = div64_ul(t, parent_rate);
+	if (fbdiv < 16 || fbdiv > 4095)
+		return -EINVAL;
+	val.fbdiv = fbdiv;
+
+	fbdiv_24 = div64_ul(t << 24, parent_rate);
+	val.frac = fbdiv_24 - ((u64)fbdiv << 24);
+
+	return jhb100_pll_set_preset(hw, &val);
+}
+
+static int jhb100_pll_set_rate(struct clk_hw *hw, unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+	const struct jhb100_pll_preset *val;
+	unsigned int idx;
+
+	/* if the parent rate doesn't match our expectations the presets won't work */
+	if (parent_rate != JHB100_PLL_OSC_RATE)
+		return -EINVAL;
+
+	if (info->continuous)
+		return jhb100_pll_rate_to_preset(hw, rate, parent_rate);
+
+	for (idx = 0, val = &info->presets[0]; idx < info->npresets; idx++, val++) {
+		if (val->freq == rate)
+			return jhb100_pll_set_preset(hw, val);
+	}
+
+	return -EINVAL;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int jhb100_pll_registers_show(struct seq_file *s, void *unused)
+{
+	struct jhb100_pll_data *pll = s->private;
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	struct jhb100_pll_regvals val;
+	int ret;
+
+	ret = jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
+	if (ret)
+		return ret;
+
+	seq_printf(s, "fbdiv=%u\n"
+		      "frac=%u\n"
+		      "refdiv=%u\n"
+		      "postdiv=%u\n"
+		      "foutpostdiv_en=%u\n"
+		      "foutvcop_en=%u\n",
+		      val.fbdiv, val.frac, val.refdiv, val.postdiv,
+		      val.foutpostdiv_en, val.foutvcop_en);
+
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(jhb100_pll_registers);
+
+static void jhb100_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+
+	debugfs_create_file("registers", 0400, dentry, pll,
+			    &jhb100_pll_registers_fops);
+}
+#else
+#define jhb100_pll_debug_init NULL
+#endif
+
+static const struct clk_ops jhb100_pll_ops = {
+	.prepare = jhb100_pll_prepare,
+	.unprepare = jhb100_pll_unprepare,
+	.is_prepared = jhb100_pll_is_prepared,
+	.recalc_rate = jhb100_pll_recalc_rate,
+	.determine_rate = jhb100_pll_determine_rate,
+	.set_rate = jhb100_pll_set_rate,
+	.debug_init = jhb100_pll_debug_init,
+};
+
+static struct clk_hw *jhb100_pll_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct jhb100_pll_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < priv->match_data->num_pll)
+		return &priv->pll[idx].hw;
+
+	return ERR_PTR(-EINVAL);
+}
+
+static int jhb100_pll_probe(struct platform_device *pdev)
+{
+	const struct jhb100_pll_match_data *match_data;
+	const struct platform_device_id *id;
+	struct device *dev = &pdev->dev;
+	struct jhb100_pll_priv *priv;
+	struct device_node *np;
+	unsigned int idx;
+	int ret;
+
+	id = platform_get_device_id(pdev);
+	if (!id)
+		return dev_err_probe(dev, -EINVAL, "no match data\n");
+
+	/*
+	 * Instantiated as an MFD cell of the sys0 system controller,
+	 * which owns the DT node describing the PLL registers.
+	 */
+	match_data = (const struct jhb100_pll_match_data *)id->driver_data;
+	np = dev_of_node(dev->parent);
+
+	priv = devm_kzalloc(&pdev->dev, struct_size(priv, pll, match_data->num_pll),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->match_data = match_data;
+	priv->regmap = syscon_node_to_regmap(np);
+	if (IS_ERR(priv->regmap))
+		return dev_err_probe(dev, PTR_ERR(priv->regmap),
+				     "failed to get syscon regmap\n");
+
+	for (idx = 0; idx < match_data->num_pll; idx++) {
+		struct clk_parent_data parents = {
+			.index = 0,
+		};
+		struct clk_init_data init = {
+			.name = match_data->pll_info[idx].name,
+			.ops = &jhb100_pll_ops,
+			.parent_data = &parents,
+			.num_parents = 1,
+			.flags = match_data->pll_info[idx].flags,
+		};
+		struct jhb100_pll_data *pll = &priv->pll[idx];
+
+		pll->hw.init = &init;
+		pll->idx = idx;
+
+		ret = devm_clk_hw_register(dev, &pll->hw);
+		if (ret)
+			return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, jhb100_pll_get, priv);
+}
+
+static const struct jhb100_pll_preset jhb100_pll2_presets[] = {
+	{
+		.freq = 903168000,
+		.fbdiv = 72,
+		.frac = 4252017,
+		.refdiv = 1,
+		.postdiv = 0,
+		.foutpostdiv_en = 1,
+		.foutvcop_en = 0,
+	},
+};
+
+static const struct jhb100_pll_preset jhb100_pll3_presets[] = {
+	{
+		.freq = 800000000,
+		.fbdiv = 64,
+		.frac = 0,
+		.refdiv = 1,
+		.postdiv = 0,
+		.foutpostdiv_en = 1,
+		.foutvcop_en = 0,
+	},
+};
+
+static const struct jhb100_pll_info jhb100_sys0_pll_info[] = {
+	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2_out", jhb100_pll2_presets,
+		   ARRAY_SIZE(jhb100_pll2_presets), JHB100_PLL2_OFFSET, false),
+	_JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3_out", jhb100_pll3_presets,
+		    ARRAY_SIZE(jhb100_pll3_presets), JHB100_PLL3_OFFSET,
+		    CLK_IS_CRITICAL, false),
+	_JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4_out", NULL, 0,
+		    JHB100_PLL4_OFFSET, CLK_IGNORE_UNUSED, true),
+	_JHB100_PLL(JHB100_SYS0PLL_PLL5_OUT, "pll5_out", NULL, 0,
+		    JHB100_PLL5_OFFSET, CLK_IGNORE_UNUSED, true),
+};
+
+static const struct jhb100_pll_match_data jhb100_sys0_pll = {
+	.pll_info = jhb100_sys0_pll_info,
+	.num_pll = ARRAY_SIZE(jhb100_sys0_pll_info),
+};
+
+static const struct platform_device_id jhb100_pll_ids[] = {
+	{
+		.name = "jhb100-sys0-pll",
+		.driver_data = (unsigned long)&jhb100_sys0_pll,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(platform, jhb100_pll_ids);
+
+static struct platform_driver jhb100_pll_driver = {
+	.probe = jhb100_pll_probe,
+	.id_table = jhb100_pll_ids,
+	.driver = {
+		.name = "clk-starfive-jhb100-pll",
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_pll_driver);
-- 
2.25.1

