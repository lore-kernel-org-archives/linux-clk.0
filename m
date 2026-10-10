Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2116.outbound.protection.partner.outlook.cn [139.219.146.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C69149AA5A;
	Sat, 10 Oct 2026 12:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791635707; cv=fail; b=KdGHCNk1y2E/LQ7PGHmq7Fy/w9KFh/W9Ncm2/OlBXWop+Er05DAioAV8PgRBfSsu4gKXilgx4fFic2KnlFRRyiS64/mp4nYRN3ylkC63LapBjt4pU+wwNmlU9YCNKiG+LzjsFVJz/UyXzjmPsIfbLfvxMoQV8xl0y2cvaSnKlhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791635707; c=relaxed/simple;
	bh=yfxnXEL4U5uvARioEc7B4E6qWykKT5y32uB1ovIZlMs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cuLRf1zcBofjKB3z42Zhi4htEJsNK9Uuozvic/vpEAABvI3UIvcowPZwK0hStUGyiEKIEjmx8vTrymcYB191prkgtbS1bWroGQrUZODTX6O/+l210P1s1/TdFLI02nVV3ru6NwwzuhDylQrj+aUAHDDURitjvLk9/PG9DNtVn+E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Xun3uQyaxW9N3/eWKaU5QY0E1ioVSP/5qwRuq3ci0rCPdJlkX6FdJ/GrFT0Wet3PM3mxdizHMRhkY2C4T4BjVHWOedmRRPTqlHHpRyIdtNH+KjAq4cVeRoxLfExI04iQl/ww/znYCZWMYXyXKlDPhnl1Y6F8G+2vyfXKakJw0JvevzLfj857SM/VckOUyntKEUvwztL80Fvl2oUtaJYuBaH/Y8YYUi9OY5+lQde3phxWULCJSBEJMZ7uuiQNnBBhirfEMJtDCPYxvdlAYuOjxHSZ7sFeeN5+vXT7FWZ8UKJAHa/rgvGaGBcIE9N4G1l1nYDZAU/bxvtVKd8zCG4/Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jwoLIN27Uttt/kpjs9H62KMUReD36jThnRtBXwXITw=;
 b=QrZ3ibe2OsbiAADeGRMfcS//EVx3M8SMgef7U5jV/92LeqG6TVcLVB544dk4gpEVvJze+RpAeuIEG7CLl8NoDI4mkSaoXahb75Fv/xxI8nvN5B7aK0647vhxhl4eNhPEnLQyezd3M+REBAtHwsK6JzmdYFOOhauIRTZ2mxcasjcmMlqtbV2mA3xDCuaxkqPcHAQ/Y/J3GuV2W9Kyp5ot1OckuKAvQQmj+4QfZMU4xyMYEa71FKdJVYezIgeh8cfzrS+TXoUNuSVV2j1kessykyDBne3Wb+xRKDvz6YJFuoo0S4CXfkqVjEy/i/Y/AxVKn5UI+sq9JwwdUaAETebBFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.9; Sat, 10 Oct
 2026 10:59:38 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0496.017; Sat, 10 Oct 2026 10:59:38 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v6 1/5] clk: starfive: Add system-0 domain PLL clock driver
Date: Sat, 10 Oct 2026 03:58:55 -0700
Message-Id: <20261010105859.19505-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
References: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0036.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::20) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1005:EE_
X-MS-Office365-Filtering-Correlation-Id: 4061e0e1-a131-4841-581a-08df26bd939e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|261009223327099003|22082099003|18002099003|10067099003|3023799007|261009223027099003|38350700014|5023799004|261009221727099003|261009221227099003|261009220027099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	61pEPjJeXu5CTFoJKfXEdmvhhDYxBbB8cbFCu55IqP9IMyHSXYfbllMD53nkqg3k3ZgwzHdJd7gypweiGzCsyk8cqkMdwlWib9phuIQmuI8kdU93734EQyZY46uEuP6BM7PhhTdS6/SQ05haPauIC8a9GXK35fZlAImUolFdffowVO2RepRivyhUSi9N+a3noX/SbBAVgz4Oxjzi2+XZTMhXtxm0a8VGSddV7meFjarnDEM7Yj+YeQEtuBXnstcwnHt9eX4X74g+cxYs73DwPkM7q5EA5jpPVOarHl2fhPC0DYZBoaJlZ5FfW0hnQrNZhb3+GP+ZxvEo8tq34Pv+hC7nR9i8DiJAsqIaDzeordx+NZGbyCyonbH/Ouy7thBQt0ymD4dJZ0Ia5w5ZH3zy8OizItNVo8g0Iu2YXgrMnaho/RQVbipUKBK+zHmKs/sTTrypVBqjJLACGzMeFk9CD5rW6zzWNKBrt6vGMpprNY2xXY6R1FMVNBBuKOQnBJsXG4ZPiCJJIkSc0bPVWCMuJtFufRC3tdpsDEKYQhycFMt3rDRrpwjLO+ALB5aIB8rf
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(261009223327099003)(22082099003)(18002099003)(10067099003)(3023799007)(261009223027099003)(38350700014)(5023799004)(261009221727099003)(261009221227099003)(261009220027099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Njdt++t3T5kCLXLUmW64a2pmBTkx009hdNovvl6FTZp3duwUp4KHUO+Nc3Gq?=
 =?us-ascii?Q?aGq/0DQs6KGZ2+w/1NFeR1TwO8wbY0rI34/pc9inWMAVgWzk2Opg4cs93xRZ?=
 =?us-ascii?Q?39XSVxyCQzgX3iKPbFk94SoVVwnwS7h50xbwHDo/EDRZhkTzvr7NJ2WWuoj6?=
 =?us-ascii?Q?K9fXlr4oi+QHkcdQjNUN3u7vZrmJH+zOPtemHpzAgnnrwt1HT1rP5iZgJ9KO?=
 =?us-ascii?Q?01JzWsgR8+N78ePZkJaTGJyunV2BBPDMjSRG+uxWAhoTOtKJrfLD5/kjpvI7?=
 =?us-ascii?Q?KQMgMQgbI9DB7eXkkkXqrWw1mNL0HWpL17q+Bs9ReWL5A02QxY8qqSjgsrTq?=
 =?us-ascii?Q?xQRXbKV7y5/oNy/3oFR5cSIBqBeixpM8L2AK0y7BTJQ7N3DpK2CA3we5YIYA?=
 =?us-ascii?Q?F5axoQuaYuFDE9dErRNkTZDCJlN1SasMa4UDvTyw2lPq8HzTfpDIyu2JFOFQ?=
 =?us-ascii?Q?iDLK1827RDZyDxyXzO8KT4nQ8kgAf+A9B2KSVY7r4271XCx9qJnKLut1m0Tp?=
 =?us-ascii?Q?izG1ZipmUYN7Wr768fm2MrTC2SpKiK5yR+FVDn6+JL8FJ0EndLP01YzyBip4?=
 =?us-ascii?Q?j72rVdNsRWNpewFmPQCD7AnXEEgXHaYA7HGhuv4V+pkudySOJmbcqj6vdsMp?=
 =?us-ascii?Q?a4Tfphnd8QnlRH7ykcwhesCHjwlIJ26EY8jX3D0bng/l3xh+T/tJpKaPXp33?=
 =?us-ascii?Q?cl+c4UGbwnH3NBKztQ6T+1L1psQt9JW872w9Khc1xOP414hCfxkxDtsgTXiF?=
 =?us-ascii?Q?EUBQL12LrOlTdOOysyMlPlLSN646px+GhpISKgSlh1leP0Z/s/asv6Vi80bZ?=
 =?us-ascii?Q?nOAcbn8PZ/zyED42W6PAbFv1IQBikbD8Ktw7pqNe3IyuyYMb7bQqH60dyKub?=
 =?us-ascii?Q?WHpcbO91+vambOCI1X6nqc3Xiv8uAH84nYnj8wRypX7oaEkGbhmFNwEcHJcM?=
 =?us-ascii?Q?7c51VjkuiaVPOzNMLxqvhi1CJOCppuNkg6cKGIAYkj7J7eCZVf5lu9jRDHgk?=
 =?us-ascii?Q?HnidtSyf/+0CuXW3Qo+Wjb0lzYAIGMo2FJq8pfryEZ148A5/+aI5PiD8wQGz?=
 =?us-ascii?Q?672RlKE6bFIMh8ERtAmRDKKh/pUG1GrsDfplN4WdHSTtwlz1JdctgjITU1yM?=
 =?us-ascii?Q?Bm2IoFw3oWuXTOpaD4bbfluB5/4mPpsNEx8HtvYWeJ9nV1EjGvyquH03Xh9T?=
 =?us-ascii?Q?HYjumFnF0juHvRIWyyHVpOOwznZbB0xvs7dbhJqhsC4gx1J7RTockTIo9uan?=
 =?us-ascii?Q?HijqA6/Rs21nwuNjw6y6UIBW6goE1wcMJuQ8rsuKrvjzU/p5DDFJEc1Pf2OC?=
 =?us-ascii?Q?aPJfAnf25AHR2oMRpBDlPI0OiX7bJxBihOsRvygMfmR4BCSm1E5k185fwp8I?=
 =?us-ascii?Q?Lp9M2/9Bkftc/icjAKNwmLc6ryMb2QUUasR4UAloUpGkJgXUa0eyT19n9S/h?=
 =?us-ascii?Q?oFqNKZpIh/PEXjFkIWHuLKrHeIWM38g5F7krnOxQPMP3JEkt68OJEogm7BNC?=
 =?us-ascii?Q?1Q4IcMM2CEFd+oLpXyCQSz+v2CTmtxBxv7+99TMezPeXBCUhYUPpGj40jbyB?=
 =?us-ascii?Q?SRI1J5ggGnpV+S4CNLg/YgC2nrazHIexa7+34hov5rOES26LV6LojoUAeVfT?=
 =?us-ascii?Q?xSKbdqsJ88dKNaMiOXVNxSteWHxhgh71L8ioKNtRv2Ezb7cBlvtDZZfNuUYa?=
 =?us-ascii?Q?e1YqyA9R0e0dn+FEvByfy7kjEHOzEUN0DhTN4qyCmE1Z5ce8QYn1+/JgVltj?=
 =?us-ascii?Q?zj7yw59sCtyVZ4TZv7Qx2/q6w2z2JCr1GRdX/kCvoRZnTt1cLQ0C?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4061e0e1-a131-4841-581a-08df26bd939e
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:59:37.9097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KoX04J7U+D2kQIQKz4aFFYwkbNdYJWX6OXb1lijL3eLbd2/FoQBzMCnaJFsjBlS45lZNrz3hX8zKvAqPVL3DAB+OUP7M/gK9mvSe67Q+xCAcYWKOe1Z+0ojJ3584DpzC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1005

Add system-0 domain PLL clock driver for StarFive JHB100 SoC.

The PLL itself is a building block shared by several system controllers
of the SoC, so it is implemented as a library. Each PLL is described with
three clocks matching the hardware topology: the VCO, a power-of-two post
divider and the output selecting one of them.

The VCO multipliers are either taken from a table or computed from the
requested rate. Rates are always derived from the actual parent rate.

The system-0 PLLs are registered by a platform driver bound to the device
created by the owner of the sys0 system controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  16 +
 drivers/clk/starfive/Makefile                 |   2 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 425 ++++++++++++++++++
 .../clk/starfive/clk-starfive-jhb100-pll.h    |  63 +++
 .../starfive/clk-starfive-jhb100-sys0-pll.c   |  69 +++
 5 files changed, 575 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.h
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0-pll.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 1c9dd5d47cb8..4a7c67445f4c 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -113,6 +113,9 @@ config CLK_STARFIVE_JHB100_PER3
 	  Say yes here to support the peripheral-3 clock controller
 	  on the StarFive JHB100 SoC.
 
+config CLK_STARFIVE_JHB100_PLL
+	bool
+
 config CLK_STARFIVE_JHB100_SYS0
 	bool "StarFive JHB100 system-0 clock support"
 	depends on ARCH_STARFIVE || COMPILE_TEST
@@ -123,6 +126,19 @@ config CLK_STARFIVE_JHB100_SYS0
 	  Say yes here to support the system-0 clock controller on the
 	  StarFive JHB100 SoC.
 
+config CLK_STARFIVE_JHB100_SYS0_PLL
+	bool "StarFive JHB100 system-0 PLL clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	depends on STARFIVE_JHB100_SOCINFO
+	select CLK_STARFIVE_JHB100_PLL
+	select MFD_SYSCON
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the PLL2 to PLL5 clock generators found
+	  in the system-0 system controller of the StarFive JHB100 SoC.
+	  The device is instantiated by the JHB100 SoC information driver,
+	  which owns the system-0 system controller.
+
 config CLK_STARFIVE_JHB100_SYS1
 	bool "StarFive JHB100 system-1 clock support"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 2c4554c2e70e..3a8f75c55c96 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -15,6 +15,8 @@ obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+= clk-starfive-jhb100-per1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+= clk-starfive-jhb100-per2.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+= clk-starfive-jhb100-per3.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_PLL)		+= clk-starfive-jhb100-pll.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0_PLL)	+= clk-starfive-jhb100-sys0-pll.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
new file mode 100644
index 000000000000..7be01022b1b8
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -0,0 +1,425 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 PLL Clock Generator
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ *
+ * Each PLL is described with three clocks:
+ *
+ *   osc --> vco --+-----------------> |
+ *                 |                   | out
+ *                 +--> postdiv -----> |
+ *
+ * - vco: fractional-N multiplier with a reference divider [1200MHz - 4800MHz]
+ *	  It has no gate: the PLL is only powered down while its multiplier is
+ *	  being changed.
+ * - postdiv: power-of-two divider, from 2 to 16 [75MHz - 4800MHz]
+ * - out: selects either the VCO or the post divider output [75MHz - 4800MHz]
+ */
+
+#include <linux/bitfield.h>
+#include <linux/bits.h>
+#include <linux/clk-provider.h>
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/math64.h>
+#include <linux/minmax.h>
+#include <linux/overflow.h>
+#include <linux/regmap.h>
+#include <linux/units.h>
+
+#include "clk-starfive-jhb100-pll.h"
+
+#define JHB100_PLL_CFG0			0x0
+#define   JHB100_PLL_FBDIV			GENMASK(13, 2)
+#define   JHB100_PLL_FOUTPOSTDIV_EN		BIT(14)
+#define   JHB100_PLL_FOUTVCOP_EN		BIT(16)
+
+#define JHB100_PLL_CFG1			0x4
+#define   JHB100_PLL_FRAC			GENMASK(23, 0)
+#define   JHB100_PLL_LOCK			BIT(24)
+
+#define JHB100_PLL_CFG2			0x8
+#define   JHB100_PLL_POSTDIV			GENMASK(15, 14)
+#define   JHB100_PLL_REFDIV			GENMASK(23, 18)
+
+#define JHB100_PLL_FRAC_BITS		24
+#define JHB100_PLL_FBDIV_MIN		16
+#define JHB100_PLL_FBDIV_MAX		4095
+#define JHB100_PLL_POSTDIV_WIDTH	2
+
+/* VCO operating range */
+#define JHB100_PLL_VCO_MIN		(1200ULL * HZ_PER_MHZ)
+#define JHB100_PLL_VCO_MAX		(4800ULL * HZ_PER_MHZ)
+
+#define JHB100_PLL_OUT_VCO		0
+#define JHB100_PLL_OUT_POSTDIV		1
+
+#define JHB100_PLL_TIMEOUT_US		1000
+#define JHB100_PLL_INTERVAL_US		100
+
+struct jhb100_pll {
+	struct regmap *regmap;
+	const struct jhb100_pll_info *info;
+	struct clk_hw vco;
+	struct clk_hw postdiv;
+	struct clk_hw out;
+};
+
+struct jhb100_pll_priv {
+	unsigned int num;
+	struct jhb100_pll pll[] __counted_by(num);
+};
+
+static const struct clk_div_table jhb100_pll_postdiv_table[] = {
+	{ .val = 0, .div = 2 },
+	{ .val = 1, .div = 4 },
+	{ .val = 2, .div = 8 },
+	{ .val = 3, .div = 16 },
+};
+
+/* VCO */
+
+static unsigned long jhb100_pll_mult_to_rate(unsigned long parent_rate,
+					     const struct jhb100_pll_mult *mult)
+{
+	u64 m = ((u64)mult->fbdiv << JHB100_PLL_FRAC_BITS) | mult->frac;
+
+	if (!mult->refdiv)
+		return 0;
+
+	return div_u64(mul_u64_u32_shr(m, parent_rate, JHB100_PLL_FRAC_BITS),
+		       mult->refdiv);
+}
+
+/*
+ * @round_up selects the direction the multiplier is rounded to:
+ *
+ * - false, to find the multiplier of the highest rate lower or equal to
+ *   @rate. This is what a rate request needs, as a rate higher than the
+ *   requested one is rejected by the dividers down the tree.
+ * - true, to convert a rate returned by jhb100_pll_mult_to_rate(), which
+ *   rounds down, back to the multiplier it was computed from.
+ */
+static int jhb100_pll_rate_to_mult(u64 rate, unsigned long parent_rate,
+				   bool round_up, struct jhb100_pll_mult *mult)
+{
+	u64 m, fbdiv;
+
+	if (!parent_rate)
+		return -EINVAL;
+
+	if (round_up)
+		m = DIV64_U64_ROUND_UP(rate << JHB100_PLL_FRAC_BITS, parent_rate);
+	else
+		m = div64_u64(rate << JHB100_PLL_FRAC_BITS, parent_rate);
+
+	fbdiv = m >> JHB100_PLL_FRAC_BITS;
+	if (fbdiv < JHB100_PLL_FBDIV_MIN || fbdiv > JHB100_PLL_FBDIV_MAX)
+		return -EINVAL;
+
+	mult->fbdiv = fbdiv;
+	mult->frac = m & JHB100_PLL_FRAC;
+	mult->refdiv = 1;
+
+	return 0;
+}
+
+static unsigned long jhb100_pll_vco_recalc_rate(struct clk_hw *hw,
+						unsigned long parent_rate)
+{
+	struct jhb100_pll *pll = container_of(hw, struct jhb100_pll, vco);
+	unsigned int offset = pll->info->offset;
+	struct jhb100_pll_mult mult;
+	u32 val;
+
+	if (regmap_read(pll->regmap, offset + JHB100_PLL_CFG0, &val))
+		return 0;
+	mult.fbdiv = FIELD_GET(JHB100_PLL_FBDIV, val);
+
+	if (regmap_read(pll->regmap, offset + JHB100_PLL_CFG1, &val))
+		return 0;
+	mult.frac = FIELD_GET(JHB100_PLL_FRAC, val);
+
+	if (regmap_read(pll->regmap, offset + JHB100_PLL_CFG2, &val))
+		return 0;
+	mult.refdiv = FIELD_GET(JHB100_PLL_REFDIV, val);
+
+	return jhb100_pll_mult_to_rate(parent_rate, &mult);
+}
+
+static int jhb100_pll_vco_determine_rate(struct clk_hw *hw,
+					 struct clk_rate_request *req)
+{
+	struct jhb100_pll *pll = container_of(hw, struct jhb100_pll, vco);
+	const struct jhb100_pll_info *info = pll->info;
+	unsigned long lowest = ULONG_MAX, best = 0;
+	struct jhb100_pll_mult mult;
+	unsigned int i;
+	int ret;
+
+	if (!info->nmults) {
+		ret = jhb100_pll_rate_to_mult(clamp_t(u64, req->rate,
+						      JHB100_PLL_VCO_MIN,
+						      JHB100_PLL_VCO_MAX),
+					      req->best_parent_rate, false, &mult);
+		if (ret)
+			return ret;
+
+		req->rate = jhb100_pll_mult_to_rate(req->best_parent_rate, &mult);
+		return 0;
+	}
+
+	/* find the highest rate lower or equal to the requested rate */
+	for (i = 0; i < info->nmults; i++) {
+		unsigned long rate = jhb100_pll_mult_to_rate(req->best_parent_rate,
+							     &info->mults[i]);
+
+		if (rate <= req->rate && rate > best)
+			best = rate;
+		if (rate < lowest)
+			lowest = rate;
+	}
+
+	req->rate = best ?: lowest;
+
+	return 0;
+}
+
+static int jhb100_pll_vco_set_rate(struct clk_hw *hw, unsigned long rate,
+				   unsigned long parent_rate)
+{
+	struct jhb100_pll *pll = container_of(hw, struct jhb100_pll, vco);
+	const struct jhb100_pll_info *info = pll->info;
+	const struct jhb100_pll_mult *mult = NULL;
+	struct jhb100_pll_mult calc;
+	unsigned int val, i;
+	int ret;
+
+	if (info->nmults) {
+		for (i = 0; i < info->nmults; i++) {
+			if (jhb100_pll_mult_to_rate(parent_rate, &info->mults[i]) == rate) {
+				mult = &info->mults[i];
+				break;
+			}
+		}
+
+		if (!mult)
+			return -EINVAL;
+	} else {
+		ret = jhb100_pll_rate_to_mult(rate, parent_rate, true, &calc);
+		if (ret)
+			return ret;
+
+		mult = &calc;
+	}
+
+	ret = regmap_update_bits(pll->regmap, info->offset + JHB100_PLL_CFG0,
+				 JHB100_PLL_FBDIV,
+				 FIELD_PREP(JHB100_PLL_FBDIV, mult->fbdiv));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(pll->regmap, info->offset + JHB100_PLL_CFG1,
+				 JHB100_PLL_FRAC,
+				 FIELD_PREP(JHB100_PLL_FRAC, mult->frac));
+	if (ret)
+		return ret;
+
+	ret = regmap_update_bits(pll->regmap, info->offset + JHB100_PLL_CFG2,
+				 JHB100_PLL_REFDIV,
+				 FIELD_PREP(JHB100_PLL_REFDIV, mult->refdiv));
+	if (ret)
+		return ret;
+
+	return regmap_read_poll_timeout(pll->regmap,
+					info->offset + JHB100_PLL_CFG1,
+					val, val & JHB100_PLL_LOCK,
+					JHB100_PLL_INTERVAL_US,
+					JHB100_PLL_TIMEOUT_US);
+}
+
+static const struct clk_ops jhb100_pll_vco_ops = {
+	.recalc_rate = jhb100_pll_vco_recalc_rate,
+	.determine_rate = jhb100_pll_vco_determine_rate,
+	.set_rate = jhb100_pll_vco_set_rate,
+};
+
+/* Post divider */
+
+static unsigned long jhb100_pll_postdiv_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct jhb100_pll *pll = container_of(hw, struct jhb100_pll, postdiv);
+	u32 val;
+
+	if (regmap_read(pll->regmap, pll->info->offset + JHB100_PLL_CFG2, &val))
+		return 0;
+
+	return divider_recalc_rate(hw, parent_rate,
+				   FIELD_GET(JHB100_PLL_POSTDIV, val),
+				   jhb100_pll_postdiv_table, 0,
+				   JHB100_PLL_POSTDIV_WIDTH);
+}
+
+static int jhb100_pll_postdiv_determine_rate(struct clk_hw *hw,
+					     struct clk_rate_request *req)
+{
+	return divider_determine_rate(hw, req, jhb100_pll_postdiv_table,
+				      JHB100_PLL_POSTDIV_WIDTH, 0);
+}
+
+static int jhb100_pll_postdiv_set_rate(struct clk_hw *hw, unsigned long rate,
+				       unsigned long parent_rate)
+{
+	struct jhb100_pll *pll = container_of(hw, struct jhb100_pll, postdiv);
+	int val;
+
+	val = divider_get_val(rate, parent_rate, jhb100_pll_postdiv_table,
+			      JHB100_PLL_POSTDIV_WIDTH, 0);
+	if (val < 0)
+		return val;
+
+	return regmap_update_bits(pll->regmap,
+				  pll->info->offset + JHB100_PLL_CFG2,
+				  JHB100_PLL_POSTDIV,
+				  FIELD_PREP(JHB100_PLL_POSTDIV, val));
+}
+
+static const struct clk_ops jhb100_pll_postdiv_ops = {
+	.recalc_rate = jhb100_pll_postdiv_recalc_rate,
+	.determine_rate = jhb100_pll_postdiv_determine_rate,
+	.set_rate = jhb100_pll_postdiv_set_rate,
+};
+
+/* Output selection */
+
+static int jhb100_pll_out_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct jhb100_pll *pll = container_of(hw, struct jhb100_pll, out);
+
+	return regmap_update_bits(pll->regmap,
+				  pll->info->offset + JHB100_PLL_CFG0,
+				  JHB100_PLL_FOUTVCOP_EN | JHB100_PLL_FOUTPOSTDIV_EN,
+				  index == JHB100_PLL_OUT_POSTDIV ?
+				  JHB100_PLL_FOUTPOSTDIV_EN : JHB100_PLL_FOUTVCOP_EN);
+}
+
+static u8 jhb100_pll_out_get_parent(struct clk_hw *hw)
+{
+	struct jhb100_pll *pll = container_of(hw, struct jhb100_pll, out);
+	u32 val;
+
+	if (regmap_read(pll->regmap, pll->info->offset + JHB100_PLL_CFG0, &val))
+		return JHB100_PLL_OUT_POSTDIV;
+
+	return val & JHB100_PLL_FOUTPOSTDIV_EN ? JHB100_PLL_OUT_POSTDIV :
+						 JHB100_PLL_OUT_VCO;
+}
+
+static int jhb100_pll_out_init(struct clk_hw *hw)
+{
+	struct jhb100_pll *pll = container_of(hw, struct jhb100_pll, out);
+	u32 val;
+	int ret;
+
+	ret = regmap_read(pll->regmap, pll->info->offset + JHB100_PLL_CFG0, &val);
+	if (ret)
+		return ret;
+
+	/* Exactly one of the two outputs must be selected */
+	if (!(val & JHB100_PLL_FOUTVCOP_EN) != !(val & JHB100_PLL_FOUTPOSTDIV_EN))
+		return 0;
+
+	return jhb100_pll_out_set_parent(hw, JHB100_PLL_OUT_POSTDIV);
+}
+
+static const struct clk_ops jhb100_pll_out_ops = {
+	.init = jhb100_pll_out_init,
+	.get_parent = jhb100_pll_out_get_parent,
+	.set_parent = jhb100_pll_out_set_parent,
+	.determine_rate = __clk_mux_determine_rate,
+};
+
+static struct clk_hw *jhb100_pll_get(struct of_phandle_args *clkspec, void *data)
+{
+	struct jhb100_pll_priv *priv = data;
+	unsigned int idx = clkspec->args[0];
+
+	if (idx < priv->num)
+		return &priv->pll[idx].out;
+
+	return ERR_PTR(-EINVAL);
+}
+
+/**
+ * devm_jhb100_pll_register - register the PLLs of a system controller
+ * @dev: device providing the clocks. The reference clock is looked up at
+ *	 index 0 of the "clocks" property of its DT node, or of the DT node
+ *	 of its parent if it has none.
+ * @regmap: regmap of the system controller
+ * @info: description of the PLLs, indexed by clock ID
+ * @num: number of PLLs in @info
+ *
+ * Return: 0 on success, a negative error code otherwise.
+ */
+int devm_jhb100_pll_register(struct device *dev, struct regmap *regmap,
+			     const struct jhb100_pll_info *info,
+			     unsigned int num)
+{
+	struct jhb100_pll_priv *priv;
+	unsigned int i;
+	int ret;
+
+	priv = devm_kzalloc(dev, struct_size(priv, pll, num), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->num = num;
+
+	for (i = 0; i < num; i++) {
+		struct jhb100_pll *pll = &priv->pll[i];
+		struct clk_parent_data parents[2] = { };
+		struct clk_init_data init = { };
+
+		pll->regmap = regmap;
+		pll->info = &info[i];
+
+		parents[0].index = 0;
+		init.name = info[i].vco_name;
+		init.ops = &jhb100_pll_vco_ops;
+		init.parent_data = parents;
+		init.num_parents = 1;
+		pll->vco.init = &init;
+
+		ret = devm_clk_hw_register(dev, &pll->vco);
+		if (ret)
+			return ret;
+
+		parents[0].hw = &pll->vco;
+		init.name = info[i].postdiv_name;
+		init.ops = &jhb100_pll_postdiv_ops;
+		init.flags = CLK_SET_RATE_PARENT;
+		pll->postdiv.init = &init;
+
+		ret = devm_clk_hw_register(dev, &pll->postdiv);
+		if (ret)
+			return ret;
+
+		parents[JHB100_PLL_OUT_VCO].hw = &pll->vco;
+		parents[JHB100_PLL_OUT_POSTDIV].hw = &pll->postdiv;
+		init.name = info[i].out_name;
+		init.ops = &jhb100_pll_out_ops;
+		init.num_parents = 2;
+		init.flags = CLK_SET_RATE_PARENT | CLK_SET_RATE_NO_REPARENT;
+		pll->out.init = &init;
+
+		ret = devm_clk_hw_register(dev, &pll->out);
+		if (ret)
+			return ret;
+	}
+
+	return devm_of_clk_add_hw_provider(dev, jhb100_pll_get, priv);
+}
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-pll.h b/drivers/clk/starfive/clk-starfive-jhb100-pll.h
new file mode 100644
index 000000000000..3b5054f5bc25
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.h
@@ -0,0 +1,63 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * StarFive JHB100 PLL Clock Generator
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ */
+
+#ifndef __CLK_STARFIVE_JHB100_PLL_H__
+#define __CLK_STARFIVE_JHB100_PLL_H__
+
+#include <linux/types.h>
+
+struct device;
+struct regmap;
+
+/**
+ * struct jhb100_pll_mult - VCO multiplier setting
+ * @frac: fractional part of the feedback divider, in units of 1 / 2^24
+ * @fbdiv: integer part of the feedback divider
+ * @refdiv: reference divider
+ *
+ * The VCO rate is parent_rate * (fbdiv + frac / 2^24) / refdiv.
+ */
+struct jhb100_pll_mult {
+	u32 frac;
+	u16 fbdiv;
+	u8 refdiv;
+};
+
+/**
+ * struct jhb100_pll_info - description of one PLL instance
+ * @vco_name: name of the VCO clock
+ * @postdiv_name: name of the post divider clock
+ * @out_name: name of the output clock
+ * @mults: multipliers supported by the VCO. If NULL, the multiplier is
+ *	   computed from the requested rate.
+ * @nmults: number of entries in @mults
+ * @offset: offset of the PLL registers in the system controller
+ */
+struct jhb100_pll_info {
+	const char *vco_name;
+	const char *postdiv_name;
+	const char *out_name;
+	const struct jhb100_pll_mult *mults;
+	unsigned int nmults;
+	u8 offset;
+};
+
+#define JHB100_PLL(_idx, _name, _offset, _mults, _nmults)		\
+	[_idx] = {							\
+		.vco_name = _name "_vco",				\
+		.postdiv_name = _name "_postdiv",			\
+		.out_name = _name "_out",				\
+		.mults = _mults,					\
+		.nmults = _nmults,					\
+		.offset = _offset,					\
+	}
+
+int devm_jhb100_pll_register(struct device *dev, struct regmap *regmap,
+			     const struct jhb100_pll_info *info,
+			     unsigned int num);
+
+#endif /* __CLK_STARFIVE_JHB100_PLL_H__ */
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-sys0-pll.c
new file mode 100644
index 000000000000..7ccf66a72c0a
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0-pll.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 System-0 domain PLL Clock Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+
+#include "clk-starfive-jhb100-pll.h"
+
+#define JHB100_PLL2_OFFSET		0x00
+#define JHB100_PLL3_OFFSET		0x0c
+#define JHB100_PLL4_OFFSET		0x18
+#define JHB100_PLL5_OFFSET		0x24
+
+static const struct jhb100_pll_mult jhb100_pll2_mults[] = {
+	{ .fbdiv = 72, .frac = 4252017, .refdiv = 1 },
+};
+
+static const struct jhb100_pll_mult jhb100_pll3_mults[] = {
+	{ .fbdiv = 64, .frac = 0, .refdiv = 1 },
+};
+
+static const struct jhb100_pll_info jhb100_sys0_pll_info[] = {
+	JHB100_PLL(JHB100_SYS0PLL_PLL2_OUT, "pll2", JHB100_PLL2_OFFSET,
+		   jhb100_pll2_mults, ARRAY_SIZE(jhb100_pll2_mults)),
+	JHB100_PLL(JHB100_SYS0PLL_PLL3_OUT, "pll3", JHB100_PLL3_OFFSET,
+		   jhb100_pll3_mults, ARRAY_SIZE(jhb100_pll3_mults)),
+	JHB100_PLL(JHB100_SYS0PLL_PLL4_OUT, "pll4", JHB100_PLL4_OFFSET,
+		   NULL, 0),
+	JHB100_PLL(JHB100_SYS0PLL_PLL5_OUT, "pll5", JHB100_PLL5_OFFSET,
+		   NULL, 0),
+};
+
+static int jhb100_sys0_pll_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+
+	/*
+	 * This device is instantiated by the sys0 system controller, which
+	 * owns the DT node describing the PLL registers.
+	 */
+	regmap = syscon_node_to_regmap(dev_of_node(dev->parent));
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get syscon regmap\n");
+
+	return devm_jhb100_pll_register(dev, regmap, jhb100_sys0_pll_info,
+					ARRAY_SIZE(jhb100_sys0_pll_info));
+}
+
+static struct platform_driver jhb100_sys0_pll_driver = {
+	.probe = jhb100_sys0_pll_probe,
+	.driver = {
+		.name = "jhb100-sys0-pll",
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_sys0_pll_driver);
-- 
2.25.1

