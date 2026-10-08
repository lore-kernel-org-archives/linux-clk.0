Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2137.outbound.protection.partner.outlook.cn [139.219.17.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B2D45FFD2;
	Thu,  8 Oct 2026 12:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.137
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791463766; cv=fail; b=WNRtqdZXHfBemnfdJ9aOS53MXAjCr0JgBtp2GlabD0+l4g1sgDt1fKbQUJGtOejoNSdWczySNyugpMHjk1QC3IG4dGKf9Wr2gAzdFk3LeNVbe8j+yvglRVU5sNsEzmWJHdM+3UwoQBqZlWmZjLer2gWj6JOU55joX1+OfU6DYvQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791463766; c=relaxed/simple;
	bh=NpRKuMOebUz+Fs0uenDBxRXfxNjEYotFsoJCkz6eqcw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DZGxMzgcggt5CcNsFeI/ofBwjKM6QhvLRCHVm3WGKsg3ynQyooLegauKSn8fcwPOkcbBzVZt0/KErttRhEIbo1Wbou4zmjE0yWoSFj0XbG7B2DQak0LmRBMm1Qz8RpbMnqTkt9w/76Itg1hVlC/j7mcH4/OiHXCucVZ4eR0Bmfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAUrsMh9D1pFZ19DihiSNNCZ7DydUkGFauJHfXWgOWqGzT0/6ol5ELKk88WFuj7OhrjMslwYFJnl1FiMRk5hD/03rMv7Lhj5QSOJ9rHJqynWUPXvxIFsHs1GnGYzaxEThxZuOfDAG/C+BV7gRWjFK9GDL7GjNEX33OayNshpXRsR2tSmPLMUv8QbPTtJfw+Mxq1RhHh3gHeuQeiwqhqI8obWivSDqXv9JGU5bP371NZbhSxxjerN3uBKM/GpLeTBap7gm/pkh/jR3EDSqXTzIhNnzeqEVpE+iD/iXdwRMiJoHEaK89jVmJrJRudmE4fax+WiQiKL5RKK8OixlrsS7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FvWDZJE5y/z6hwjRDkH2+vB1PCEepDN5nNSqhfs8IQQ=;
 b=UGF0leKCZtVCceZ5J3fFZZFsZ0h/np95NcyDP6fRbRIVJ3yEOc4kKLBaSS5sNhLVBggMHXSeB4RbBJ3ycR34EtuXFP4D+09AKDdFM85+mlgAEQwHEcJDmSKJ00R0rqPRob641uzbgh6EFcrooVY4OZIYTMW2ZQo2awKsnakc2JDpkUpP0CuGg3t2t0ACJopuTQ+zeu6/EEy3JFjiKY1CW6zTinhuxZaq7d0tmUCWSFaiZ/w0BYkvFPrAnsMVRiTduTtIsynRcFVEH1OgVHYe7a7KDpoomxo7WZqJ3e+O2GPMx9WuoZ9O8WZQMurFgz+zEF9G8PnaYH29TEEcIuuliQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:34:01 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:34:01 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Hal Feng <hal.feng@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v6 11/15] clk: starfive: Add StarFive JHB100 Peripheral-1 clock driver
Date: Thu,  8 Oct 2026 05:33:34 -0700
Message-Id: <20261008123338.11081-12-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
References: <20261008123338.11081-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SHXPR01CA0017.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c311:1b::26) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: 22fec09b-2843-4c9a-e2a3-08df25386e89
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	U3cMQGUfcOThzeH5XebPZ4vCyICRVL391EggnAlkFwtesJ5BSRbGnZ/yOndW3yP9qlK67poF5oeMb8LWDBHD5Y0tHY7OZ2lWHSA61DxxYGyot1pktGDocb1+iKZh80DX1plZQMrAlzzFC6n/RyDG+enBKC6Nu/IPKyFqkbEpzendNzLLaSRfuUzH7K6aM91ktetP0vPk+sNzA41UD+4w9HsrEs6mvNgTGgrr821tOeRBc0SQE/2ev/bmdJ3qDipATHD97XBDBpPWYHS53Zq+WfW8bWa6N7RRGvTWRLc6XaihtAFxyDnzSaZg0RjPZXOuHfb+YRX8VPTnvpSqbTZ/OaN89fhKthjCNlEX9LtwJJJPucvP/mHdmDb9W1aXcMc9hnxFrnpZMiOfZ6ALhGtAqCmPRKeaXHgTX9fnqMxvRZAO9RKNDlHSV4iaz1NzzGf0wRJBVhBqvYWs1h5L7/tXCkqR6J+LgIbfmKr4umuVOU6M++qYQulcB4w2GTeRV5RNWYEbzg7NiVj1Gt5MiZphiPUdR0VI1Y8+t1B/poib8EuKqhf90i4LSF2aDSqKfoIf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?J0sZ5u8SQPds2O2fA0sjB/gbYg9ZIWcpzuNWs4J0Sj8xMdOpCd7ZAmQogUCS?=
 =?us-ascii?Q?bMGJzqWyCoCMYdjTqanWkUhvf6ibb+V1wfNtH0pOUd0o5LLvvxlJ2RajDRvu?=
 =?us-ascii?Q?0RUtYhAuHYn5aezf0F+W23cmGNWd1jrs72IUhddMmPPl7M+N+N2GUj5tWumG?=
 =?us-ascii?Q?pLw+yIXapWC3wKDVl4nRByyKgW3SFazbf/R4Q6QZQZcjiD5bu9R9ROrA3Cvh?=
 =?us-ascii?Q?UaiMRBptb9mcfbTuslGHgYGHMX3vfT5UuG0cnyYVJ90zvDbETOiF3poUHpiP?=
 =?us-ascii?Q?IKIgY98ltYGmsX18dKJXxzN6wFmEd1UYgy3vhvfDN5WpOxvHe971WHZksj0H?=
 =?us-ascii?Q?anXNxDLBxYe82PPJm1G6NzhKk04mRjLwD4Lc9ZS2xpGVdoM7af4GGTUpYb86?=
 =?us-ascii?Q?NCE5zN3YCx9q6jG6RWXzf42chkFSJpf6LAIDw0d0t4H5mfiF960P+gbHKp38?=
 =?us-ascii?Q?Z0fB/sRO86EPT2m8/2s6ohgdo5SngfZMPT39HNuFaBjUfALaOgl6VNIOUNZH?=
 =?us-ascii?Q?2PkyOC4SVUedrbBHleVPK/gk5vPi9znDiK4EjrtKd5kf1mxlQ0pBADQ8JVBS?=
 =?us-ascii?Q?4hn5D4xLm1ZOZacSA1gJZUNbnce+29GpHInzQy3g0b1fef1LZ/Mm8/wCmKHk?=
 =?us-ascii?Q?tEteVIR4fF+056lbooqgqnQLCgyN3SIc3xQXrZCXuLkxlfewHS+ytarhmvCG?=
 =?us-ascii?Q?sSY6szt6/dxgTwx8LRJucjPXP6VWq4c+OhbD9HFLTwtsq5wRC06JYxLZx85f?=
 =?us-ascii?Q?WDTzHE3a8bIPqEoYy3ZqXYZCKNtR/KLsR70XaSBA3l56AHtKgcHtVZwktQ6Z?=
 =?us-ascii?Q?S7GnqRkP7i96OrqvrdoMKGxa293L5913FT+ftNs7utJ+IEn3azmZsONeJwyK?=
 =?us-ascii?Q?niUO8BLp+V0KFuiDDtP/ayXJND8KwL8HZevUfu5hjtrmy8uqtFvZuGM47lUO?=
 =?us-ascii?Q?R8qDCEgWyaiYUsF+oIBJJkw0ftoKsbCt2SEywJPjsgqnGLt0NcdgwGCk9Kqo?=
 =?us-ascii?Q?tfqSNzCf/+lQZ/fSlJOH5sp2MNAmpyJB+qBJP4ELMd9bV/uph94DRHWCrTGF?=
 =?us-ascii?Q?ntyEvuvoz2V7CE7a9yj/Fd9SK9kV68uyYqlY2jpHCO0kdNlES7q4N3XnfV4J?=
 =?us-ascii?Q?w+jK6dewx8XjE4oqgA0BvPIn6SAB0my0UYLBxkNieADLmnYBOPkoryfZkv3Y?=
 =?us-ascii?Q?X5CabE3gvVoolhYK+XMEOxV+3D49q6KPS0Xrz3BKDbDRsngBMAkcIffeSBgU?=
 =?us-ascii?Q?wJ1dhh8ZPiqJ/ZQxVQFxnqCFmhIkgltHEFHgubrwk04XU6j1zEeelHrYlfEM?=
 =?us-ascii?Q?Nbv2LcXWTAFdpSXGyQ0dfPX2sQlhiaMaYa+jc2I3BzCmfJTfyJb8JVtCey7V?=
 =?us-ascii?Q?wty5De88hAv0SCgpdbVQ37FapniCK2VLdjUMru7HypwJPSY67NcOZ8KVhzeV?=
 =?us-ascii?Q?VyT1nEqTiYaapGhysgnSyNdoBCOxNPWuqDicqZIUnApqNLPKeBcCDM0YlkAb?=
 =?us-ascii?Q?feFFQv92dGs3nphX5zpRXqlJM04raHZ2SqK/eVZpvS09tn0rdvEdgD6oVgbE?=
 =?us-ascii?Q?vIkuk3HkEWQercXgmnID3WsKD8FT1AKwr9TiFKj2TzWBf/WahAVxquBwtWTa?=
 =?us-ascii?Q?1xTVqf/aroKyZUTjDXR/xDuRD+QO8sPZ/ov/6aQ2Ccb90ZWAnxOQ3Ah1ilFy?=
 =?us-ascii?Q?xh2LC7FRBuYQbFD8N2KjgVi0rHQdePHSUJy2pydsvGsco18KEXtFE7QTLDxk?=
 =?us-ascii?Q?aFLjN6qNbJqqID9g1L88hBUp2oB/xjZ2ZVa86af7/E1NKiJT2TKk?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22fec09b-2843-4c9a-e2a3-08df25386e89
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:34:01.3847
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1K4oE1MqI0B0HObj62XS7dQgdk8kCv/lRtpUisCtLi4s9hW5rQPRxOtJ5evVRojexaZ5u8+9Q6n6Hgt6Fp9kA3fd+DB9GCahPq5mPGOyvRrmKsiMKxJ65tSia2YJZaDl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Add driver for the StarFive JHB100 Peripheral-1 clock controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  10 ++
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-per1.c   | 162 ++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per1.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index b2a05bbb450f..62727ce3aef3 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -83,6 +83,16 @@ config CLK_STARFIVE_JHB100_PER0
 	  Say yes here to support the peripheral-0 clock controller
 	  on the StarFive JHB100 SoC.
 
+config CLK_STARFIVE_JHB100_PER1
+	bool "StarFive JHB100 peripheral-1 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the peripheral-1 clock controller
+	  on the StarFive JHB100 SoC.
+
 config CLK_STARFIVE_JHB100_SYS0
 	bool "StarFive JHB100 system-0 clock support"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 352717886295..279e0cdfc99b 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -12,6 +12,7 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
 
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+= clk-starfive-jhb100-per1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per1.c b/drivers/clk/starfive/clk-starfive-jhb100-per1.c
new file mode 100644
index 000000000000..1f56563bc77e
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-per1.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 Peripheral-1 Clock Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+#include <linux/platform_device.h>
+
+#include "clk-starfive-jh71x0.h"
+
+#define JHB100_PER1CLK_NUM_CLKS			(JHB100_PER1CLK_MAIN_ICG_EN_UFS + 1)
+
+/* external clocks */
+#define JHB100_PER1CLK_PLL7			(JHB100_PER1CLK_NUM_CLKS + 0)
+#define JHB100_PER1CLK_NCNOC_INIT		(JHB100_PER1CLK_NUM_CLKS + 1)
+#define JHB100_PER1CLK_CFG_800			(JHB100_PER1CLK_NUM_CLKS + 2)
+#define JHB100_PER1CLK_NCNOC_TARG		(JHB100_PER1CLK_NUM_CLKS + 3)
+#define JHB100_PER1CLK_CFG_143			(JHB100_PER1CLK_NUM_CLKS + 4)
+
+static const char * const jhb100_per1_ext_clk[] = {
+	"pll7",
+	"ncnoc_init",
+	"cfg_800",
+	"ncnoc_targ",
+	"cfg_143",
+};
+
+/*
+ * Regarding the CLK_IS_CRITICAL flag:
+ *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
+ *   or not a consumer holds them, such as the bus interconnect and always-on
+ *   blocks. Gating them hangs the system, so they must never be disabled.
+ *
+ * Regarding the CLK_IGNORE_UNUSED flag:
+ *   Clocks flagged CLK_IGNORE_UNUSED are not consumed by any driver. The flag
+ *   keeps them in their hardware default state (enabled) instead of letting
+ *   the clock framework gate them once it disables unused clocks.  If this
+ *   flag needs to be removed later, it must be ensured that these clocks will
+ *   not be disabled even if they are not consumed.
+ */
+static const struct jh71x0_clk_data jhb100_per1crg_clk_data[] = {
+	JH71X0__DIV(JHB100_PER1CLK_100, "per1_100", 8, JHB100_PER1CLK_NCNOC_INIT),
+	JH71X0__DIV(JHB100_PER1CLK_1, "per1_1", 100, JHB100_PER1CLK_100),
+	JH71X0__DIV(JHB100_PER1CLK_200_DIVN0, "200_divn0", 256,
+		    JHB100_PER1CLK_CFG_800),
+	JH71X0__DIV(JHB100_PER1CLK_200_DIVN1, "200_divn1", 256,
+		    JHB100_PER1CLK_CFG_800),
+	JH71X0__DIV(JHB100_PER1CLK_200_DIVN2, "200_divn2", 256,
+		    JHB100_PER1CLK_CFG_800),
+	JH71X0__DIV(JHB100_PER1CLK_200_DIVN3, "200_divn3", 256,
+		    JHB100_PER1CLK_CFG_800),
+	JH71X0__DIV(JHB100_PER1CLK_200_CCLK_DIV, "200_cclk_div", 2046,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_SGPIO0_PCLK, "sgpio0_pclk", CLK_IGNORE_UNUSED,
+		    JHB100_PER1CLK_100),
+	JH71X0_GATE(JHB100_PER1CLK_SGPIO0_DCLK, "sgpio0_dclk", 0,
+		    JHB100_PER1CLK_100),
+	JH71X0_GATE(JHB100_PER1CLK_SGPIO1_PCLK, "sgpio1_pclk", CLK_IGNORE_UNUSED,
+		    JHB100_PER1CLK_100),
+	JH71X0_GATE(JHB100_PER1CLK_SGPIO1_DCLK, "sgpio1_dclk", 0,
+		    JHB100_PER1CLK_100),
+	JH71X0_GATE(JHB100_PER1CLK_EMMC0_BCLK, "emmc0_bclk", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_EMMC0_CCLK, "emmc0_cclk", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_DMAC1_1CH_CORE, "dmac1_1ch_core", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_DMAC1_1CH_ACLK, "dmac1_1ch_aclk", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_DMAC2_1CH_CORE, "dmac2_1ch_core", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_DMAC2_1CH_ACLK, "dmac2_1ch_aclk", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_DMAC3_1CH_CORE, "dmac3_1ch_core", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_DMAC3_1CH_ACLK, "dmac3_1ch_aclk", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_DMAC0_2CH_CORE, "dmac0_2ch_core", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_DMAC0_2CH_ACLK, "dmac0_2ch_aclk", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_REF, "ufs_ref", 75,
+		    JHB100_PER1CLK_PLL7),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_300, "ufs_300", 2,
+		    JHB100_PER1CLK_NCNOC_INIT),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_150, "ufs_150", 12,
+		    JHB100_PER1CLK_NCNOC_INIT),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_400, "ufs_400", 2,
+		    JHB100_PER1CLK_CFG_800),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_75, "ufs_75", 2,
+		    JHB100_PER1CLK_UFS_150),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_37_5, "ufs_37_5", 2,
+		    JHB100_PER1CLK_UFS_75),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_7_5, "ufs_7_5", 10,
+		    JHB100_PER1CLK_UFS_75),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_1_875, "ufs_1_875", 4,
+		    JHB100_PER1CLK_UFS_7_5),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_7_143, "ufs_7_143", 20,
+		    JHB100_PER1CLK_CFG_143),
+	JH71X0__DIV(JHB100_PER1CLK_UFS_3_5715, "ufs_3_5715", 2,
+		    JHB100_PER1CLK_UFS_7_143),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_SFC0, "main_icg_en_sfc0", CLK_IS_CRITICAL,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_SFC1, "main_icg_en_sfc1", CLK_IS_CRITICAL,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_SFC2, "main_icg_en_sfc2", CLK_IS_CRITICAL,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_SPI0, "main_icg_en_spi0", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_EMMC0, "main_icg_en_emmc0", 0,
+		    JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_SGPIO0, "main_icg_en_sgpio0", 0,
+		    JHB100_PER1CLK_100),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_SGPIO1, "main_icg_en_sgpio1", 0,
+		    JHB100_PER1CLK_100),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_SENSORS_PERIPH1, "main_icg_en_sensors_periph1", 0,
+		    JHB100_PER1CLK_100),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_DMAC_SFC0, "main_icg_en_dmac_sfc0",
+		    CLK_IS_CRITICAL, JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_DMAC_SFC1, "main_icg_en_dmac_sfc1",
+		    CLK_IS_CRITICAL, JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_DMAC_SFC2, "main_icg_en_dmac_sfc2",
+		    CLK_IS_CRITICAL, JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_DMAC_SPI0, "main_icg_en_dmac_spi0",
+		    CLK_IS_CRITICAL, JHB100_PER1CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_RAS, "main_icg_en_ras", 0,
+		    JHB100_PER1CLK_100),
+	JH71X0_GATE(JHB100_PER1CLK_MAIN_ICG_EN_UFS, "main_icg_en_ufs", 0,
+		    JHB100_PER1CLK_100),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_per1crg_info = {
+	.clk_data	= jhb100_per1crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_per1crg_clk_data),
+	.ext_clk	= jhb100_per1_ext_clk,
+	.num_ext_clk	= ARRAY_SIZE(jhb100_per1_ext_clk),
+	.rst_name	= "jhb100-r-per1",
+	.power_domain	= false,
+};
+
+static const struct of_device_id jhb100_per1crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-per1crg",
+		.data = &jhb100_per1crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_per1crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-per1",
+		.of_match_table = jhb100_per1crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_per1crg_driver);
-- 
2.25.1

