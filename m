Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C24C2F8E9B;
	Thu, 21 May 2026 01:30:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327017; cv=fail; b=KfeAei0r0RIfWfJ9GMyvdsSsPHNdH2QWn4dvvPHxYjnbWPcJu6xRXkbi0h8omx3ZH0Xj42kFnXIKWXlxlOZMZlre6viEVEo5PGeu3SmBlaU8CQwLur3Wu24Z7HPl3DoQscFZ/6w5aekSt5jvNhCBPqkMu7Lsfoty53MTv+t3QNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327017; c=relaxed/simple;
	bh=nxj1aKAYxXHnYpUP1CoD7dPlTGgHUvamSboTfHn77hY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QzFTGxOtGi4Q0W9Vt67naI6TkFQcEJTGvpy7vMkGQcjtpgBRWmpcTlNUxBJbICZqBnRJzFaWMTjp9FNtq0LvrAS0eLSZ1fp+DFmwkl+WtnkqqWprrFb94k3zSyTg7Ig1uKJ6djkr1tivq/WhLQiINTD23c2jqoPMU4FwPW0V+GY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyIIaNw4IzYIyoYTp0i0OJ7i1tlGxrIQqAAHu1xwMw2E0KMf+6CYWr6tFZRoaSR9QxePApqH95Vr3cc9aM0Jk+K/Mgu5HeZvwz2EOaXNRbJpPHW/aZpLsNXqBcYjwoiPiOKD+GH5+If8NIweKEWPtI3X4o3RnQ3lyosaj1o+S0bNt5HbHgRYj032cXeE2wa3itRx0F7ubltXngTC9Twa5abQM4FIp9B37MEuAPesW8GdD0pO4lme0/K64FizW8ikmC0K2rffjbOrEjeacireSyOH0gKKE0j1G7M4V+jTW9uwNxYGLDOI/VTCRb20DhefuKqPxFkiQFg50OhF+bN8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6kS5yw6QgyHtnoTjEwLb7p29lHY/LB8j+mS1uf+codY=;
 b=UHkluxMsoCX3lt/YTjP43gefQS+SUT2JwPsbJspe9m5SL+3tyukTfv7ds2zLX2rRBDgHoXIS5TidH/q54q18fQhoTPPpXeWrr02HdCMV1OKJprW2cVK60dmHOsKfKhoMZv7OJ9T5xBfclLAaNvYnFl4J9jZ3JPyulr90pFc+dqz+pB73h1opIDz7iyviCgkuV7clfyi/Hs8qHwsVOjeTfeyudsOvXvSbimhcB9+iZ70NeqQ0L2eoHgMMVxaeZWg/eItZ0ZlJ5r3hxGReqXv3dOxTdt3TOf7oOoFpiZAPEjuyvOtbHC6UFNk5V/9N6Q4eBXyRPduTJbJueZpjPEG9rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:49 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:49 +0000
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
Subject: [PATCH v3 2/8] clk: starfive: Add system-0 domain PLL clock driver
Date: Wed, 20 May 2026 18:29:26 -0700
Message-Id: <20260521012932.24163-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
X-MS-Office365-Filtering-Correlation-Id: d02d3afb-accf-4dfd-4c95-08deb6d8733a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	S2nvYLqdNpmunX2FCpvbTsrEiRdQE14Nm+sG0ZtwU3rD7vJrKq1DrEH06WW3Q5sROcx8bGpamVhOx9eX1oV/kxHAlc7/fn4DFfZYm/KDpRMTDxYfwWTX081rs9CqkI/Gt/TumWmLdW/JFyicCqkf8EQpJsXzUY2i8ByHsvEl5qCqceSXROTw0UE7/wCx8YzGMSZ0k5tKgLkP7IdiiXLijdpsTxX6bgdmjJxy4BhNt/a2c0UCBSnwRRf9Z0rNw+eEIfo3jD7x0vGIR3uCr/I01cXUhMAFdxZwnDa1H0pIKAuRkfLvDD0MxgppXLnsVr7X9ADe0VEk6meTIvjPhsw8V3U4ytmauzK2g/JGeBQH0eDZZxmOrpAeIuxKNfJwPxxVmO7bmZc6B2htzZxJkM0V+UFihH1Wdb2wu+5DUPJk6dHfBI5FrqKldmf+pal14XkTPGOU/GJv/ZxRnwQ/gohUEmsXW58EfrjXRP/O9DmA43gaJgBtML6mmkAMr6k89B8C+OtEyZqs/jyapiosQyiDZQkk5TSRxe3UDjlG1w1qDOJMjP/ZiPSekXFsapaJYlEqfAj5j+fUMMunfpkn8e3stA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?L0rZantNDeKbOqasBdLdkeJ3FsfTPKXlBXLV6Hu3RwwhbiCS7lVjdeEsuJWL?=
 =?us-ascii?Q?0J+s1U08P5vjN4mSf7qAGHitkZCif68kLxs8PMaBVEuu2tjNL7dgQuJPjDYg?=
 =?us-ascii?Q?hvxhzrQlvSyNUCY/RhOxfGqqbrFeMy6J7O9K6UybHZGZsGcaRcw81BaarHed?=
 =?us-ascii?Q?pH02hyzuzde+CFD4t6JFNDlAPyGmpMtF/qNJ2HNKgFj+eJ/MroK0IUsFnr6T?=
 =?us-ascii?Q?eAAa79eQ9MAd1CNjJ2fFYoIsfS+XKxtT8r1N/HVx7FXo9wbWFCKampnjTT0A?=
 =?us-ascii?Q?afULWpc/fYk7vSx0PzcH8EH6spd4vTaIcdbAj3ahwNwXJQiaOe2OQg5SZrFc?=
 =?us-ascii?Q?U8+4qYZOEejkDKExYcRKmsv5RFqRMRtrVHnnxW61Gx/w5+/SJPy5dPS7dEN2?=
 =?us-ascii?Q?Wo7SkDA3VaNlT13IExnSTyPS3TgKGT2uwkf7hWuBe/RrZ0iAvFORHWYD9qRz?=
 =?us-ascii?Q?CvPcKBel69eQvKZKg3KWgxEEgXQVYDJR+djBA6xiVN2GV/PeIrFxJFEbHDun?=
 =?us-ascii?Q?CneheP+jIRhtF9JK2MQLh8YruQ3titoz1GVCjfaSlaYR6nDNpcZyxcwVfD8B?=
 =?us-ascii?Q?jNJt+AnvgY0xrAtXIZT9Lam+gwPlT8S0VdpHKT3wlQvBoL6k6BqXTztuzCjo?=
 =?us-ascii?Q?U9xyZ2xU11A3EgnzNwve76ovkmQPrqz+77dnmqhqc1mhm+p68ArT713WbrUx?=
 =?us-ascii?Q?MDi155HkeWIOgsM3d4fQInHLZXSGViFfLRTnLICVwDwOCv0OsYPaMfmYBUv6?=
 =?us-ascii?Q?tbBETLlLZVcPNY+W7bBh9L5OIDPE+qo3EX8HDGJRZpO6eauMpgyr9lwDCQ6/?=
 =?us-ascii?Q?ojRu9c2EYfq24ivw0v3OlbA2eBcwOXx1eZNhS2opWJpMP6JRd8TK5Rlz6Tcl?=
 =?us-ascii?Q?Xc+lV0X4uEF5qyu4G4Kjn9sK6wur5JA/i+sb3ueul95oTq/ZSQklWlTMWLAN?=
 =?us-ascii?Q?Yd1G4EheQBqyP5wDMEU7GWXRGWTyPRlVfesJpo5ifft2CkUxiZ4Ywtv28Kx5?=
 =?us-ascii?Q?A0CeLYzgMNiMvK1v60NrleJuEU+1Yhe5h2er8NxOqcW4HWnQdjH/+CWOlXU5?=
 =?us-ascii?Q?QqOLwpWcatsjZzJu9gSCLN0hDAkzkM7hrYvdwAEZZd8xd24790vRT4zqR8uz?=
 =?us-ascii?Q?VcMdU6GLVJSaiNQIDKPa9UXB3s+lALfoUf3V+G+0NxQX2ZNTdhkOo5XjoYK+?=
 =?us-ascii?Q?3q1mvJ1WK8Ywg3W6xVVJE73uwoSD4OzS3WAmo/OPnUFI4qmbI9q9pQKgAaAO?=
 =?us-ascii?Q?UOD3ZnHDb6dfdFjdXi5GFQPJd5g9Gs6ozkh2BUzIUvpQYQ83LGkuumKaZ9ZA?=
 =?us-ascii?Q?i0Ixi4R9Sw2VAAuPoT9sMFwkH1YGR5apuR3YfsJPbZ0kPbuCTyr3tgH+OJRf?=
 =?us-ascii?Q?cem3lxQNLxKyA4IY1/e4YzNpIdhbMTCQC+lJk7z1yIVDCvOI4E2OgfZGXKB+?=
 =?us-ascii?Q?nLIsekmjKYvSwkvcJAzcCWq7HXFRzIqhterBd4Q54vFvYpl1e7/PdZYZ1TWK?=
 =?us-ascii?Q?TNAbqeE8VOKYpb8FOAWxSbmIpKGIvz7wy8oDQ+VvjWbHzkuK0Mi3UvD3TrRe?=
 =?us-ascii?Q?sknoCj/sa1P0mzRDJmyYnTFXNONaGcUI1L1/g/WlknCbw/sDxZTGJWSUtnuy?=
 =?us-ascii?Q?BCfHW4pPrZKGXLRcbCq+uk4CkorfAE/5KKXkZcw/Sqsfb8T4QUZTyAXN8A4H?=
 =?us-ascii?Q?Ir9E21gURYv951kJG+RJ0WISEaHquMdjFnibS7HTPZFB0/93RqjL3KiCraI0?=
 =?us-ascii?Q?0aupRWO7olGZKijnchDxayfMbQaEBeTb8YWHyAUIyavnagldcu4P?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d02d3afb-accf-4dfd-4c95-08deb6d8733a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:49.6966
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qkc+qHwjLl6Z6mtkWalXOKnjs/N33UTiAN27oDYaGm26sd7G8iH0Wl4UY1KEPLY7rEp3dd9Ls+ySyEAi4bF2GUV84vmpIa9Lr6xqUo8srtC56MxDJlKeKHKPAT643IYN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281

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

