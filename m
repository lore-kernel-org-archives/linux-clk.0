Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2113.outbound.protection.partner.outlook.cn [139.219.17.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3007F4D8DBE;
	Thu,  8 Oct 2026 15:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.113
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791472142; cv=fail; b=WMxPHOQSWBiEqhtUSh8SoygiMu1eH+7sMjePpnoZaOmBsjQZREIgT/K58/v9Z//d5Ph96GT9I7usJN7T+Tdizobir8eTS76Advlqus90NQ64FJNjaHs9Ae1Nc5f7cbYtgLwD6Ed8LSNBLQUKz3r+hQ76N2I4Q01hj4+R1SxTUlk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791472142; c=relaxed/simple;
	bh=vX7sFe//3RKvRKHaoT1XrCUxRC13qohvSIMx0TTFdx0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=I7UG/QflEcLqVsI1KnZzcOF5EWilhGqzZFIGM4CGkWujydfw1+67+bB3f2wsZL53QF2FyXPkMwxwPb9Sr7k69KoRQC+OPzcpvvNaY0TN6gpWCw0ClF2j7b4rK0ZSM8Br9BHASYWEHicjG+vjVkvRBu2cbSNU4yDEcIwAU7pN70Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VD1qFSyoF0aDpUiCRhuELgBluymiKRwV4rJEmKWj0MaDDsKQMncBoj4Fl21m2ufILzBRsXX15O8PfLofk1T2TkrLtsEYObtDIbWalXTl46j/AUsFX1JkZxunVvR+KWg+Q9vjjHNruJcP2m0050QFlfLDyRfyXiV721PdHgniIGWQ00rnKqygkk0awskH9wsSOXVmPOxd4FYJ+JduH4qEC9UBbhFpt5/ajGISOC7wBFhTzXezcCXrQ43YB9cwCVOiI82c6+FbF1pHMK8bt0uavTiXxZgFtBxJDc4dwSlyfUZyjsWePqNK+rkiUZeD7SYmoqc9hYUlotH8t+8G+QgCZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uuzJeowSanfeCU0MmYxZ5c8LkHHbXcweYLKadSGN42M=;
 b=GFKKkHMRX5en008RLafWaujvq9SAIgsxQBZpEDg40+wqA4gwN+x4re6W8hNS+JEFsrN7Z68MaR9u82ublaTzvjcFvjJCMEAAh3yys8s4x7o7t/sRUzzlWLDrQLPrZDXL8C61i9jXCmX3EQIimSwWilBpFUOj4ldAyS+sZSsLhzf2PytNtJVCrutw2K1l0Rvhvl2BJspHldIXyfn0/U//X5HrmhqdE5OtYzZViUu7RJs7pLx+xcpaQ9vdyYqHvZNhivaX1ppmc9IM07Rl6vcbEjY5p6Zz02duADLQzLb45GfSBHU42MNAcTdaEi0O6y4rOcio7suW3hDjj2XnEbfCHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:54 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:54 +0000
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
Subject: [PATCH v6 05/15] clk: starfive: Add JHB100 System-0 clock generator driver
Date: Thu,  8 Oct 2026 05:33:28 -0700
Message-Id: <20261008123338.11081-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 48cca771-5a4d-4d70-2b68-08df25386a5f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|3023799007|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	Q78oB/XY3f6uMu0c0ZX+ct1BD9cG4pDPjuu+IZOPCDLRdiuMG29qtWt02ZW5wmEu534nQwtD8jYJ/DovUt0V/biRDnqM/Wrejpvaqpg51BN04xlk2emizZiA94IBrgFASDnavO2juo57MBiWRfWY1j78zMRLstWF+HliwlE8LWR3Sx9tNC5J+Xb+H5jLAbVvNfrTYKvuWee5rcpatWoiLcDSDGZRMyrQf707SQenDe02NT3tHFyRGSLfq9l2Mqlb/TD7YIfb0jU8ZVynKyV4X6jdS+6UaKooVp7lI5R7935zIzlRrZ8rb97ORAGFpn3MO0OMxBjMuzd2WARNpoALoxN13iXNTq7fCUpRfjzijMOjY5rmhc4RQfAddUa/nN6KF5NDVU2EZ95jH2CEmeNSqIwOWRtoEJgB1ZF2gLzWbrz5jgW0O/A8bOhaeHvQY2kTjMyJIl+mo1vqnGQ+MKjpgvAXgSexuWrQmkx/jv3ZfdfiQyoId68RJdf2N7vSEcz5nAMHU7W+WKu6GGNj+BnHe4jqLlGaVOXsRXz9nBCCe4i2rSvOzcXM0VKziXq3CO0n
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(3023799007)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?1w4xruxmGKvZFHxhLmADCt3Y+lExO9xtOD0wnaYKnePiLZ2RjBy/jRN2qYFv?=
 =?us-ascii?Q?kfokSL9DwcH/A61p9GWgXO2bJF/LVrjJmBRyRwYDdSt5MQbrg6rKKAIJJxao?=
 =?us-ascii?Q?C8eFZ/MHfOYiw7tB7GSO14A5DGTN2Sbs96HKT+ZsyjjQ46pnrYEjG+kTQVXK?=
 =?us-ascii?Q?/I86Zh0iXj11XSvTqrfkY1UfCNVyp7njjlbRtvSjpV7q2iN6NZVK6Gi/wSk4?=
 =?us-ascii?Q?Qlsj0nR+GCD8qbXFxTdDpbjlU1u5vGdH30rvbMzkDF7MUvKWNT+qgjWft/Ib?=
 =?us-ascii?Q?qSasu4hc0qk1Cj/TtSSOc2xRnnY70Wnfu5vSeLgpZknvyTWBlajYnPnWeu12?=
 =?us-ascii?Q?liNNGtGKKeTEQ6Z3S080QTae/PlnG3nullwssJWckHZriLMixHGziBOwYQbe?=
 =?us-ascii?Q?01Mcq8nf0sRmN46ReuBcQifOpntBvJGYvuOY+ju+1TpgxSFvXIU3dfWHZosd?=
 =?us-ascii?Q?jlf1z4L11ANl1xlv2vZLc+QIH9QndF07Fa/+nbk0F3DelhARFyv74s+UqGN+?=
 =?us-ascii?Q?4mmuVWD/AITiQbPegRXmWuZyyAWJZsuaNMoTMQnpNZlbGL9Q5uJCxmUw6cTj?=
 =?us-ascii?Q?S/JC7drw9Fl0lwnuxS4TCOF7zgdQ46UV/MPLWJ7K2MdIDjQDoIB9i4R6Or5s?=
 =?us-ascii?Q?iWsSqzIPyC5d+q2CSsgHBtuHg+UAQ3pveLj3O/arWqlu6Mq6fJldybaD6YNX?=
 =?us-ascii?Q?ShznGFRwTEz0PEx9zl/B3L82M0AJFphJ9FAcOIE6e0LmCAhwfa+vw3nBiVt3?=
 =?us-ascii?Q?czgoAL8Rk+bF55r491H4E9YiIXfpf0zirZCup7kTJ2UeZIpFiU9UVlYMyTxo?=
 =?us-ascii?Q?I6NjsKMCkVbkAGgSs6FCU9ZNflVNisWHYh+dKx0i4/qJ10pDzFZhVAo4igES?=
 =?us-ascii?Q?MGqMHwNAHc3jqtiV39spsXpuGK6mIe21yMYStGhaUJVrWFVcJs9wmfCLLF7Z?=
 =?us-ascii?Q?fytCg2iIf1RSScR0wZYYxIDQv6QVWW6cUvHT6yrILBj7jQBcEosI9V6cvqAd?=
 =?us-ascii?Q?rHtrblkgGP3gyAaz9yqOCFKuT9DYQkDGt8AupFLxJVV/gOT1+cSyky8CBy57?=
 =?us-ascii?Q?yqVpP6A6L721wg3K6cebJr/rjDgjqRN3gyv63ccMDziZxosHgp8WacMaEnmZ?=
 =?us-ascii?Q?frRDYhdwqvPOloA2fhIo67rlIYDvrKzOqvSclPRYkHmTpeMybMJMK64osBkF?=
 =?us-ascii?Q?OD4jG/fyHZRn64fbVipmBYou5A70TdB8VhVumT33BYWS+kNXjkCzCLVzzx98?=
 =?us-ascii?Q?/WdhBgjcsMDJh8KmRkLO9enD01qIemJlpkNuIsBWwkIHmMawClGLrGfxiEzG?=
 =?us-ascii?Q?YhVl5xL9PVojpWcTipeni5tP79h6uRR5jy0n4upj22ff+pswmiWp+H06KCoP?=
 =?us-ascii?Q?+YlY7VLbhzlHwD1h5A8tsgw7h66Z1r9K8w9PMNxPE5zYf6E1R8dToVej8WJx?=
 =?us-ascii?Q?JrGZlK7fXgv7qnMjeNCXhPI21+nHP/CxmH49Key3/yuIAePRacUQAcB5MJoF?=
 =?us-ascii?Q?Z2h3z28GK/t5v4ReIZHWusTANW7J8EmtZaMX0OWGMVDslb2jrbAyXIFAcSAL?=
 =?us-ascii?Q?6tKmS7diqKN9KWXuCcLZI99iVvkXTce1J5SrS8WITh0EqlTpDxqWrk4twujU?=
 =?us-ascii?Q?fCWoNrxbg+tH2d5ml2hM8POZMjeZyL5JZ5hnpMvAxJd9+fa4b87nkaLnvknP?=
 =?us-ascii?Q?RUPYzEIg97eAO/XoxQrihZH0uzf+w7n8ruQTgWAqmPJB1fHWVdD9S+UPw+G6?=
 =?us-ascii?Q?o8WjK0jQTstxPevuYR1sB1+TvbHjXfv0FowU3gHvVp5Mk7GSx+rW?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48cca771-5a4d-4d70-2b68-08df25386a5f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:54.3945
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ji7o1357otrxf7AfjP2/hk+A7waeOLPd9cZzAxTbpFewzb9aAQqNTcXAu3i527N6jFXrEH3x4YXMjwvxHorWU1Wmk9JEgboYO8sA8vEUUEDiIfanrXZPmTB1eHFNWB1/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Add support for JHB100 System-0 clock generator (SYS0CRG).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |   7 +
 drivers/clk/starfive/Kconfig                  |  10 ++
 drivers/clk/starfive/Makefile                 |   2 +
 .../clk/starfive/clk-starfive-jhb100-sys0.c   | 156 ++++++++++++++++++
 4 files changed, 175 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 155165267892..fcba280781b4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26633,6 +26633,13 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
 F:	drivers/phy/starfive/phy-jh7110-pcie.c
 F:	drivers/phy/starfive/phy-jh7110-usb.c
 
+STARFIVE JHB100 CLOCK DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
+F:	drivers/clk/starfive/clk-starfive-jhb1*
+F:	include/dt-bindings/clock/starfive,jhb1*.h
+
 STARFIVE JHB100 DEVICETREES
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 L:	linux-riscv@lists.infradead.org
diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 51716655554f..cd5b7754403e 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -72,3 +72,13 @@ config CLK_STARFIVE_JH7110_VOUT
 	help
 	  Say yes here to support the Video-Output clock controller
 	  on the StarFive JH7110 SoC.
+
+config CLK_STARFIVE_JHB100_SYS0
+	bool "StarFive JHB100 system-0 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the system-0 clock controller on the
+	  StarFive JHB100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 199ac0f37a2f..d2ba83d7d02c 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -10,3 +10,5 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_AON)	+= clk-starfive-jh7110-aon.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_STG)	+= clk-starfive-jh7110-stg.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
+
+obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
new file mode 100644
index 000000000000..edab54f228ad
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
@@ -0,0 +1,156 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 System-0 Clock Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ *
+ */
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+#include <linux/init.h>
+#include <linux/platform_device.h>
+
+#include "clk-starfive-jh71x0.h"
+
+#define JHB100_SYS0CLK_NUM_CLKS			(JHB100_SYS0CLK_GPU1_NCNOC_INIT + 1)
+
+/* external clocks */
+#define JHB100_SYS0CLK_OSC			(JHB100_SYS0CLK_NUM_CLKS + 0)
+#define JHB100_SYS0CLK_PLL0			(JHB100_SYS0CLK_NUM_CLKS + 1)
+#define JHB100_SYS0CLK_PLL1			(JHB100_SYS0CLK_NUM_CLKS + 2)
+#define JHB100_SYS0CLK_PLL2			(JHB100_SYS0CLK_NUM_CLKS + 3)
+
+static const char * const jhb100_sys0_ext_clk[] = {
+	"osc",
+	"pll0",
+	"pll1",
+	"pll2",
+};
+
+/*
+ * Regarding the CLK_IS_CRITICAL flag:
+ *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
+ *   or not a consumer holds them, such as the bus interconnect and always-on
+ *   blocks. Gating them hangs the system, so they must never be disabled.
+ */
+static const struct jh71x0_clk_data jhb100_sys0crg_clk_data[] = {
+	/* bmcpcierp */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN, "bmcpcierp_ncnoc_main", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG, "bmcpcierp_ncnoc_cfg", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_PCIE_REF_CML, "pcie_ref_cml", 24,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_DATA_INIT, "bmcpcierp_ncnoc_data_init",
+		    CLK_IS_CRITICAL, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG_INIT, "bmcpcierp_ncnoc_cfg_init",
+		    CLK_IS_CRITICAL, JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_TARG, "bmcpcierp_ncnoc_targ",
+		    CLK_IS_CRITICAL, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_PCU, "bmcpcierp_pcu",
+		    CLK_IS_CRITICAL, JHB100_SYS0CLK_OSC),
+	/* hostss0 */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_CFG, "hostss0_ncnoc_cfg", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_NCNOC_DATA, "hostss0_ncnoc_data", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS0_PHY_SCAN_400, "hostss0_phy_scan_400", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_GPIO_ESPI0_EXT, "gpio_espi0_ext", 14,
+		    JHB100_SYS0CLK_PLL2),
+	/* bmcusb */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_INIT, "bmcusb_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_NCNOC_TARG, "bmcusb_ncnoc_targ", 6,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCUSB_SCANCLK, "bmcusb_scanclk", 5,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCUSB_480M_SCANCLK, "bmcusb_480m_scanclk",
+		    CLK_IS_CRITICAL, JHB100_SYS0CLK_BMCUSB_SCANCLK),
+	/* vce */
+	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_INIT, "vce_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_VCE_NCNOC_TARG, "vce_ncnoc_targ", 12,
+		    JHB100_SYS0CLK_PLL1),
+	/* bmcperiph2 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_INIT, "bmcper2_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_NCNOC_TARG, "bmcper2_ncnoc_targ", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_400, "bmcper2_cfg_400", 8,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER2_CFG_125, "bmcper2_cfg_125", 10,
+		    JHB100_SYS0CLK_PLL1),
+	/* hostss1 */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_NCNOC_DATA, "hostss1_ncnoc_data", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400, "hostss1_phy_scan_400", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400_ICG_BUF,
+		    "hostss1_phy_scan_400_icg_buf", CLK_IS_CRITICAL,
+		    JHB100_SYS0CLK_HOSTSS1_PHY_SCAN_400),
+	/* npu */
+	JH71X0__DIV(JHB100_SYS0CLK_NPU_NCNOC_INIT, "npu_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* vout */
+	JH71X0__DIV(JHB100_SYS0CLK_VOUT_NCNOC_INIT, "vout_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_VOUT_AUX, "vout_aux", 150,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph3 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER3_NCNOC_INIT, "bmcper3_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* hostusb */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSB_NCNOC_INIT, "hostusb_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	/* hostusbcmn */
+	JH71X0__DIV(JHB100_SYS0CLK_HOSTUSBCMN_CFG_480, "hostusbcmn_cfg_480", 5,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph1 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_NCNOC_INIT, "bmcper1_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER1_CFG_800, "bmcper1_cfg_800", 4,
+		    JHB100_SYS0CLK_PLL0),
+	/* bmcperiph0 */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_NCNOC_INIT, "bmcper0_ncnoc_init", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_400, "bmcper0_cfg_400", 8,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPER0_CFG_800, "bmcper0_cfg_800", 8,
+		    JHB100_SYS0CLK_PLL0),
+	/* gpu0 */
+	JH71X0__DIV(JHB100_SYS0CLK_GPU0_NCNOC_INIT, "gpu0_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+	/* gpu1 */
+	JH71X0__DIV(JHB100_SYS0CLK_GPU1_NCNOC_INIT, "gpu1_ncnoc_init", 10,
+		    JHB100_SYS0CLK_PLL0),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_sys0crg_info = {
+	.clk_data	= jhb100_sys0crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_sys0crg_clk_data),
+	.ext_clk	= jhb100_sys0_ext_clk,
+	.num_ext_clk	= ARRAY_SIZE(jhb100_sys0_ext_clk),
+	.rst_name	= "jhb100-r-sys0",
+	.power_domain	= false,
+};
+
+static const struct of_device_id jhb100_sys0crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys0crg",
+		.data = &jhb100_sys0crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_sys0crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-sys0",
+		.of_match_table = jhb100_sys0crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_sys0crg_driver);
-- 
2.25.1

