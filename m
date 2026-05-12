Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2106.outbound.protection.partner.outlook.cn [139.219.146.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBFB4963B3;
	Tue, 12 May 2026 08:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574958; cv=fail; b=caKrO53Eh1YknFd9+snzc+ND6oZ4u7Yf2YRflWr7v+qpH/en0EtzJfPe1tvC42WUZLqemo1iDqHmlJAVgCl/pOZlEYQl4nGbLDZAJ2lcxK3612L7iQEefjoyU6h13Dvk6PJTMsjV1G5udhEt564IL6r86yUS6skwN/EmXtQXIrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574958; c=relaxed/simple;
	bh=nxj1aKAYxXHnYpUP1CoD7dPlTGgHUvamSboTfHn77hY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nOQXt43jIc/uwqf5ujyQqlh5FJFK52LlTQJru60u9nuQxfwDC+vu4XIX4ix0hYQtCq0qHN9vFxZa4SGko/O+eg5tfLDGtdImnB4XKiudMvFjOPzrobX2DQVghCEvJ4Z7B6fyrAGDc/cVKDSvxylRw624Z8dWff0rpJNjjoiLTKg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UnNVvq3U6k5TPmiFoIMVAFS200rnrbqmJXGKrIT/6dAv4g0hNUmBHlCQ6BHvN6A4Gg6/v137t39/266mAn7dLMTldUU6Ofj1Ok8ub2b1l0Souby35gW2iSUyt9Ks4A+d6FAUhVihb3MwHAswHzAhlr31Z+W87u9+Mg99ZJYQQJko2m+6BO0Jv/80EDYt056b+MYOuMKZqG7F/NvHcuzq5Vg/rtpcC5pC41pANyngvVMSzMj5EESMvypvIkwsuMsrGBDSIUtiCySWChpVrjIAFSFlCGrbmx9BDEJiGP9wE/akCnXAFPywgXY135eC8LIbZmTwZiTiT+eu2mQp86tqug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kS5yw6QgyHtnoTjEwLb7p29lHY/LB8j+mS1uf+codY=;
 b=Vue8vhpbiuLU/olTlkylnAvHffYeKdB6qtxrqwSBOJEkM8DWydZPfmo1M+K7n63Wlz5r8H0r6/tW4GnO6vccQZ0we477gT1s4iO2NJoU/4LQk3o62EGH14PmsZY1dsfiNAs2blDNJaAcFim0Gsh6EmVoz46ajlblPJa3IvA/h9AnTtS6iNOnlos88Denetiwdf8iQXBRhbn9aNfKLH89mnh264bO9/+si9LrrWtgFotfyGVDFbHCn0Zmzrk8HXR1oqVQ331kFfi67PXYfEb3YGVvAEE7GBraQyFmCbO95RpETKQg8mjc4FpEeF3Kz2JinAD3xbmeHLaWbf+2vx1Zog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:36 +0000
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
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v2 03/12] clk: starfive: Add system-0 domain PLL clock driver
Date: Tue, 12 May 2026 01:35:12 -0700
Message-Id: <20260512083521.3448-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: 25412e07-83cc-4af1-b425-08deb00170c1
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|366016|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	SnN70k1WNrqOnl79XDKn3dphYYI61IFlyQF7CraJ6cve8To3xbtIjHipfD1ylPcWYwZHklHoatnY5JGzNBpKD4gQ+IhPxTUMcvM6fHfrilyA5IgV3/3UEjgu7OhKbxqhLt9m1dgJdcIjn2nxZS/i6VUZr016JCr/TCt+rGod7CBqIXAUvY7ILiiHV9CMDMKGSeuoFvfzNH/FDQ8a235Zprzsk350x9maXurOuUt/1YpkkmtIsihPBM/uIxG8YbQ8pbpJPRT2Zn+XN3+6kUwzFUls7rf0a1v/NWtOBMNJzcwG7p+9yylJF7GsSEIEN2R9Q4fKkoaewn6wJ0wZRDVJdU5mlvUFpRpxqeLROFFvQtTu3VT3BKIvPfOYlFq8VVEFYM4JTCGBucMwLPMp8KFsqZvlLP1YZWUj3uKZHQXVsVHDeDa22QyCRPhsWbtt9SG//1VxnQqxOuReI+uQ5Cf6+Y2Nqxyh94kPWoEBS/0PASsRZUGSi1PputT6G+tz58VMXzbXz5Obsb7mnEVPI16KVogtsjyBZ/ccsIlNqOmO5FMAwZkmiskuVgps9CSST1E7RBV0JckKuwZEkEOHLd66jA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(366016)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xN2GeapSiZdgfYY1M+Y4wz9WVWQEtPCOUFwstpz3Wo9Q+P1Ptm2jDbUe8mLF?=
 =?us-ascii?Q?uqMEvakwgcdu159zd6O4mgUuP5XS5EIkcnFZLlJwwwSQV0ropSvt9KJsePQr?=
 =?us-ascii?Q?xwcIcnyc5uX4/NCHAl9g2z9w0s49W35Ej63ETY878eCjLIFs5nvtEIj14XTP?=
 =?us-ascii?Q?gx1XB5PURK/1tK3uLHGfcLn8x0JXS0EKTUi6LpQu5OaWlXhvHfBhxZtaTwJ+?=
 =?us-ascii?Q?07MFjnG4HdJqzvnZUlEzYGDqHcLsKxJfVCPZLyQEhsTMoNPz6sBHFEh6nwDr?=
 =?us-ascii?Q?6Ge0AD/xJtuX4QKRey848lFdw1Va8ik3KODt1O//UQte8VwTYwntIj5yNHYu?=
 =?us-ascii?Q?LU1kVQPtyJmQy7lvoHZrMi42UL3G5s7dt4ACAToZQQPzdC9s8ktzMNAa22mH?=
 =?us-ascii?Q?1jHwwB/OlJNnoppC9CGt+KTvNnI+LPhQi7ks+KXsJSHDzlYb/zlHzTzWQ0Us?=
 =?us-ascii?Q?/V4bLJu5ULnOoPigXYJQkqZ7z3BII+KKOYGkcXP/2NNz4HupVVy18uqgxZEx?=
 =?us-ascii?Q?sm1uu5QJkQ7qlk/Q/3cEcZJCiLFgb17OBw1zxPMB61bGLZSmDvDr1NeTBJt8?=
 =?us-ascii?Q?/5yJRP1MAWXIs/jOrhcPE8Q411Lm95s4gSXH1VUJvGzBoOPseNZcgf2gl6+9?=
 =?us-ascii?Q?mq2eGGghJ35Qbd3jjwAGvnH+NzXBtYDr515lsv/Z5qEENnSyUkKHjTVjLXAB?=
 =?us-ascii?Q?zsvQrYhbxpBrqnCfbc/Dd3h2STJoFwygZi2QZpx4ih0wTZbwIGHm1BE5tp3M?=
 =?us-ascii?Q?OC6AYYWVFUzSo6+P1iu3BbiLYS/iYni/B3J6cA8pnSDpo0TBLu7ARMHjH3WT?=
 =?us-ascii?Q?rB6g/8aCKIY4jkr3e8bmqZg09iL3hyw8X+q6bHrs3lBTfFoBTi6JdCO+MYRp?=
 =?us-ascii?Q?iZybBf3AN0ROafCc0aGTqtt33vGtcxYfsWrUhrjAiA2PU4Xfk3MfuhZbhDBJ?=
 =?us-ascii?Q?cbh1sqFR621BDyS6I9NeipwrZxjfJv24W6i8w2GfhF1A4rVNrbp3lpCmX6NL?=
 =?us-ascii?Q?GVcVGvqmvMZ+tZ37ugouJvTsBunkyPV5bifBlcQ/HiBbQ1clbGAYDz9CEmPc?=
 =?us-ascii?Q?UVSk8Eka9OcF7IOgpVKVYkfwhG0RN1xXms7EbOaKlOGEpP0P/5frrAZP+XjD?=
 =?us-ascii?Q?NI4erp8SxtVCcjZRMDbXIUAdQIUhCCHZDYw3UqnXRB0DoUYuilGE+myH93CX?=
 =?us-ascii?Q?4tEmwcsg06PJaWyQd4vSyoyXJkgDThgleQgX8w3lNpyf+XLOjwiiUffdwb5g?=
 =?us-ascii?Q?3kBNKwbJUQwHXR0Ayoe7BY2hM1kRltyaI7dMHmXCp4RWHPZU7IAOwNlxTWqZ?=
 =?us-ascii?Q?dar2JoQXSlcgJcwIcKuZOMfz3Wd7sH4LZFAMi97CxxBZbVQzmcKPjLeCSfTv?=
 =?us-ascii?Q?OQbiMpiGpoKXxwSsvfeQEjBiyg/L8mFcnKsGU36/noWqglMOqxI0mlBRYxVF?=
 =?us-ascii?Q?ryL6D347P9xYhYNnP1VfU2ZXql5AidsV4piRJXrobBsNXxiDkcvRhO7iHgRC?=
 =?us-ascii?Q?jIlDGTmSL/+t36jmngWEdr7FitsDm+1FtPVN/VNdlyAkRzpDlc0aWinit6mP?=
 =?us-ascii?Q?kxupgUnECB1AQIWlNvcyJFCx4YSxnVysYFeHXXA8Xatduswnb1TAfhbJhXBc?=
 =?us-ascii?Q?/PCL9jg2+mubz7QHD9/4qCLCL/YkpE256A2xMjg++iDRtIQkJTKxxiz+1ez6?=
 =?us-ascii?Q?sjGF0xcjmy40PPyDW8Gvw19RL9b80oI8UNdEnMad4halYn2X7TgE4dgDRky3?=
 =?us-ascii?Q?KX3mz+cH3RHBiisKSZDymlEzpRM3MyB1GNXSVNLmh7ESCot08jfP?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25412e07-83cc-4af1-b425-08deb00170c1
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:36.7731
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yZF+TcCG8183iJ2M3xS+s3OThjFsX+0nnj7Uk5eVnWGMNrnDjQ3nhGBm1qI4dxyW+tomQA+pEa4SjawmcJl14JnsUHByngt9XpVyuw5/oADOxJ8SIEJUR4WTsZYknTWB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204

Add system-0 domain PLL clock driver for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |   8 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 528 ++++++++++++++++++
 3 files changed, 537 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index c612f1ede7d7..cc712da68bd0 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -105,6 +105,14 @@ config CLK_STARFIVE_JHB100_PER3
 	  Say yes here to support the peripheral-3 clock controller
 	  on the StarFive JHB100 SoC.
 
+config CLK_STARFIVE_JHB100_PLL
+	bool "StarFive JHB100 PLL clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
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
index 000000000000..603b928bbb81
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -0,0 +1,528 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 PLL Clock Generator Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/debugfs.h>
+#include <linux/device.h>
+#include <linux/kernel.h>
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
+#define   JHB100_PLL_FBDIV_SHIFT		2
+#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
+#define   JHB100_PLL_FOUTPOSTDIV_EN_SHIFT	14
+#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
+#define   JHB100_PLL_FOUTVCOP_EN_SHIFT		16
+
+#define JHB100_PLLX_CFG1(offset)	((offset) + JHB100_PLL_CFG1_OFFSET)
+/* frac value should be decimals multiplied by 2^24 */
+#define   JHB100_PLL_FRAC			GENMASK(23, 0)
+#define   JHB100_PLL_FRAC_SHIFT			0
+#define   JHB100_PLL_LOCK			BIT(24)
+#define   JHB100_PLL_LOCK_SHIFT			24
+
+#define JHB100_PLLX_CFG2(offset)	((offset) + JHB100_PLL_CFG2_OFFSET)
+#define   JHB100_PLL_PD				BIT(13)
+#define   JHB100_PLL_PD_SHIFT			13
+#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
+#define   JHB100_PLL_POSTDIV_SHIFT		14
+#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
+#define   JHB100_PLL_REFDIV_SHIFT		18
+
+#define JHB100_PLL_TIMEOUT_US		1000
+#define JHB100_PLL_INTERVAL_US		100
+
+struct jhb100_pll_preset {
+	unsigned long freq;
+	u32 frac;			/* frac value should be decimals multiplied by 2^24 */
+	unsigned fbdiv		: 12;	/* fbdiv value should be 8 to 4095 */
+	unsigned refdiv		: 6;
+	unsigned postdiv	: 2;
+	unsigned foutpostdiv_en	: 1;
+	unsigned foutvcop_en	: 1;
+};
+
+struct jhb100_pll_info {
+	char *name;
+	const struct jhb100_pll_preset *presets;
+	unsigned int npresets;
+	unsigned long flag;
+	u8 offset;
+	bool continuous;
+};
+
+#define _JHB100_PLL(_idx, _name, _presets, _npresets, _offset, _flag, _cont)	\
+	[_idx] = {							\
+		.name = _name,						\
+		.offset = _offset,					\
+		.presets = _presets,					\
+		.npresets = _npresets,					\
+		.flag = _flag,						\
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
+	struct device *dev;
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
+static int jhb100_pll_enable(struct clk_hw *hw)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+
+	return regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
+				  JHB100_PLL_PD, 0);
+}
+
+static void jhb100_pll_disable(struct clk_hw *hw)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
+			   JHB100_PLL_PD, BIT(JHB100_PLL_PD_SHIFT));
+}
+
+static int jhb100_pll_is_enabled(struct clk_hw *hw)
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
+	val->fbdiv = (value & JHB100_PLL_FBDIV) >> JHB100_PLL_FBDIV_SHIFT;
+	val->foutpostdiv_en = !!((value & JHB100_PLL_FOUTPOSTDIV_EN) >>
+				 JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
+	val->foutvcop_en = !!((value & JHB100_PLL_FOUTVCOP_EN) >>
+			      JHB100_PLL_FOUTVCOP_EN_SHIFT);
+
+	ret = regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &value);
+	if (ret)
+		return ret;
+
+	val->frac = (value & JHB100_PLL_FRAC) >> JHB100_PLL_FRAC_SHIFT;
+
+	ret = regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &value);
+	if (ret)
+		return ret;
+
+	val->postdiv = (value & JHB100_PLL_POSTDIV) >> JHB100_PLL_POSTDIV_SHIFT;
+	val->refdiv = (value & JHB100_PLL_REFDIV) >> JHB100_PLL_REFDIV_SHIFT;
+
+	return 0;
+}
+
+static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	struct jhb100_pll_regvals val;
+	unsigned long rate;
+	u32 power = 0;
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
+	rate = (parent_rate * val.frac) >> 24;
+
+	if (val.foutpostdiv_en)
+		power = val.postdiv + 1;
+
+	rate += parent_rate * val.fbdiv;
+	rate /= val.refdiv << power;
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
+	cfg = ((u32)val->fbdiv << JHB100_PLL_FBDIV_SHIFT) |
+	      ((u32)val->foutpostdiv_en << JHB100_PLL_FOUTPOSTDIV_EN_SHIFT) |
+	      ((u32)val->foutvcop_en << JHB100_PLL_FOUTVCOP_EN_SHIFT);
+
+	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset),
+				 JHB100_PLL_FBDIV | JHB100_PLL_FOUTPOSTDIV_EN |
+				 JHB100_PLL_FOUTVCOP_EN, cfg);
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset), JHB100_PLL_FRAC,
+				 val->frac << JHB100_PLL_FRAC_SHIFT);
+	if (ret)
+		return ret;
+
+	cfg = ((u32)val->refdiv << JHB100_PLL_REFDIV_SHIFT) |
+	      ((u32)val->postdiv << JHB100_PLL_POSTDIV_SHIFT);
+
+	ret = regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
+				 JHB100_PLL_REFDIV | JHB100_PLL_POSTDIV, cfg);
+	if (ret)
+		return ret;
+
+	/* waiting for PLL to lock */
+	return regmap_read_poll_timeout_atomic(priv->regmap, JHB100_PLLX_CFG1(info->offset),
+					       value, value & JHB100_PLL_LOCK,
+					       JHB100_PLL_INTERVAL_US,
+					       JHB100_PLL_TIMEOUT_US);
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
+	unsigned long fbdiv_24, t;
+
+	if (val.foutpostdiv_en)
+		power = val.postdiv + 1;
+
+	t = val.refdiv << power;
+	t *= rate;
+
+	val.fbdiv = t / parent_rate;
+
+	fbdiv_24 = (t << 24) / parent_rate;
+	val.frac = fbdiv_24 - (val.fbdiv << 24);
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
+	return -EINVAL;
+}
+
+#ifdef CONFIG_DEBUG_FS
+static int jhb100_pll_registers_read(struct seq_file *s, void *unused)
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
+static int jhb100_pll_registers_open(struct inode *inode, struct file *f)
+{
+	return single_open(f, jhb100_pll_registers_read, inode->i_private);
+}
+
+static const struct file_operations jhb100_pll_registers_ops = {
+	.owner = THIS_MODULE,
+	.open = jhb100_pll_registers_open,
+	.release = single_release,
+	.read = seq_read,
+	.llseek = seq_lseek
+};
+
+static void jhb100_pll_debug_init(struct clk_hw *hw, struct dentry *dentry)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+
+	debugfs_create_file("registers", 0400, dentry, pll,
+			    &jhb100_pll_registers_ops);
+}
+#else
+#define jhb100_pll_debug_init NULL
+#endif
+
+static const struct clk_ops jhb100_pll_ops = {
+	.enable = jhb100_pll_enable,
+	.disable = jhb100_pll_disable,
+	.is_enabled = jhb100_pll_is_enabled,
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
+static int __init jhb100_pll_probe(struct platform_device *pdev)
+{
+	const struct jhb100_pll_match_data *match_data;
+	struct jhb100_pll_priv *priv;
+	unsigned int idx;
+	int ret;
+
+	match_data = of_device_get_match_data(&pdev->dev);
+	if (!match_data)
+		return -EINVAL;
+
+	priv = devm_kzalloc(&pdev->dev,
+			    struct_size(priv, pll, match_data->num_pll),
+			    GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->match_data = match_data;
+	priv->dev = &pdev->dev;
+	priv->regmap = syscon_node_to_regmap(priv->dev->of_node);
+	if (IS_ERR(priv->regmap))
+		return PTR_ERR(priv->regmap);
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
+			.flags = match_data->pll_info[idx].flag,
+		};
+		struct jhb100_pll_data *pll = &priv->pll[idx];
+
+		pll->hw.init = &init;
+		pll->idx = idx;
+
+		ret = devm_clk_hw_register(&pdev->dev, &pll->hw);
+		if (ret)
+			return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(&pdev->dev, jhb100_pll_get, priv);
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
+static const struct of_device_id jhb100_pll_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0-syscon",
+		.data = &jhb100_sys0_pll,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_pll_match);
+
+static struct platform_driver jhb100_pll_driver = {
+	.driver = {
+		.name = "clk-starfive-jhb100-pll",
+		.of_match_table = jhb100_pll_match,
+	},
+};
+builtin_platform_driver_probe(jhb100_pll_driver, jhb100_pll_probe);
-- 
2.25.1

