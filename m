Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2117.outbound.protection.partner.outlook.cn [139.219.17.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 432F22DE702;
	Sun,  9 Aug 2026 01:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786240291; cv=fail; b=swju5Z/++pdzmYPWGBnB/jKk6Y6F7xvQ6z3d8t32mQX1/Byu732PLURvYhAV50ZBissAuC3GumEWmAGO1l8TkMjJrKHEAslUKDs0PObJYNNUoru1xQtZPn4NDiOKurYUf6P93istTDaOgLokchHnup5Gl64fG8XAD09hhWAyPlU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786240291; c=relaxed/simple;
	bh=EajvuvsAZADlxbhBdpaPlV85GLCxanP2MFStaO6EBFQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ap/fLBANOP81Vw7GIf3EAmYN332UEayYFR5cQk2KBywIWPryRwyvDm/h0KQpJGN5idgsDyGGUsFDve5pe4YDJxWJW6obOXEgHpaDlFzP4xSymn1ETS+BfSTvdZ+1XbtP5Ekq14ysR7pIHN8iy8Jw+mejk7RAX7t58pdX3Gljkpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OviSupX5Z1Uie+KKtezWw+It5tUUABEeCWC7j0QSaDUJxhAIG8MCRLiHZjlUNz7c6haDfVXsv+srjly0T3Mf7KAVbSPWNnso+3uzQV/N75hCKhSBQNcl/QI//0Fsn7Yzv9g54R4VjTlUu/Yuv9fPwkhUjLlvAJrn9Pd1gFAK7mhINIW3yr+yg99RKzBa0iZO7eeb5fHC7azU4+00WudoFtCaKLy4CYbiVYCfNT95DMzq/nIxUN3UZj/J5kzMyoPc+TFidu0t8ViVVbvs+mfiqXFMXx+J8N/XUVQZMpPJwriyfPUCM9uUmnd7yTdY74sVCIAClKd02bOGoPfT7FMLig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Dhta+/afUivtMMzjhTz20pGOzKWvNRAS1AIa28MUzg=;
 b=Wls6cZmZs0ssF0sLQUD6Tr5Sk92yb/t7GlnCl3ZgnIuKdSVb14k8vZG0g+dZ0Lb1+6np/b2i4Qz8GqxED50peZbIurGWWZYC6/+5hxX/0lO9vWd2rD/Q2inI3Oc9dLT+KiTQcHXZhgTNlP70BDbiVOjMrDozGyv/SSO5dmojcbJ+RbWl2lxhsTy7ONgjxX0KskcCtvAb68UgbkGO5jyqUsl+rj5EtBcyXfyKqafBnJlvAMuiPlc+xArEVLVOnbFAD8LBZ/aJh2weOOF/UBfvSPm4MmRTGEMRaqtvKE9kroqPDsLmRfTx/dFWPJQUgvPeSVPDZpJjyslbzMAbykqlgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 01:51:07 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Sun, 9 Aug 2026 01:51:07 +0000
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
Subject: [PATCH v4 2/8] clk: starfive: Add system-0 domain PLL clock driver
Date: Sat,  8 Aug 2026 18:50:48 -0700
Message-Id: <20260809015054.210577-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0016.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1265:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f817917-2426-4262-7426-08def5b8ad8a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|23010399003|366016|921020|38350700014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	YmUpejacsz9ct+0xMEhHqUiXp+oOmIBSje1gem4EBAe1rd1VRlcQKM1flj1SiMafZzSKMP1XyVcerPXE/AQeu5WwS2t215YX25ck7lNGbkwlN+mc53cx2/HFooyqUE8hVHTqwnfcDP8TeMyw7xLvlirYvoOBhLBW2YyUsqagwjP/kqsSTnvgS/aSi0QuQAQ6Kr52NgSg7LyaYqqM7UaQikXFE/u7pF1UhK3enksxQkT4FV39x/oAv5cZzTadVdeRKkQZA05pe9G5K+dS6XCEhT3NsR9Hq6FET/FU4JpKffw8qFSFm86pbwpdMuMKddMLkCoAsyv71WwXath3eMRUK9A2sZPV2szTY68R2zAa6o6eYFACNL/nh+CAEABGLqQWYzdm+eoFGBc4CnLp1G99Yvoi+Q6NdI1gsWoJg1zVGt4pQh4/Ql/T4o3S2eynKWGZwanAFjMinQp4QWYF2j+Bk55dDIpCMmvsFcHdFKYfUUVhEHVKjxB/YL3kvtTs3vYo0nI01pnkC5eKEURuR1AvAQH+12SIM5+d2O2b+4HulUCmugOd8guHB0h6crmXQpi5Eim4qJsGCV397Q/rnp34kA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(23010399003)(366016)(921020)(38350700014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?evHMWDkppi6n4hFV6MBWvSn5qiKF7MCqDWpl8LYGaS33pSlJRJdLpwR17lLQ?=
 =?us-ascii?Q?8K8+9bvwREGugL75N4Dz/JyY0y0JqMMOu3NpJc8P8sHAdvVm/I842ub+ffCc?=
 =?us-ascii?Q?0vCSSsG6TJGxqTPcN3frqoS37NHsegW30xEtwG/zaj2tgG4Yn8EQzDuZMkce?=
 =?us-ascii?Q?O838pxJPhKumKPOuh2XRHI8KKzkZTQExjPVktgESKO2B4R2//lbuuGL6yXOx?=
 =?us-ascii?Q?O6E0GcFxrfGQRVlZV134BlShQwMFHf4MguN7YL0+5fxenCEjeXI8oJbq/v7L?=
 =?us-ascii?Q?nMjT4kzGY3sKnXGoJLfxuLncQh71wtD2q+t930/mmbU/pvquejNZMpbAJ06j?=
 =?us-ascii?Q?mK9yZm+88Jzj55Uq7z7lKQwbCIOn6+EDUmX0npqrryvi/bLuYGcLXOJBm9WZ?=
 =?us-ascii?Q?RHcDU64p4RJMHDR3DrV8dKMc4laX7KMR5tLFMSvSfZ3vEgIzjtWAw/lGFEip?=
 =?us-ascii?Q?DkJMFReeLl8JFIYkPY38xir90khVBY60+HTY4pcUYwqsK7YpUb/oydI19LKL?=
 =?us-ascii?Q?P+ljJZo8V35wHh8oMljhUAmLMnz9cChn5G9djnocjmoT3tsni/9fO9yvE7cB?=
 =?us-ascii?Q?lnz4dywGOzylS0KbGFGit0uVB/jtbgY82wXQpd9r+sQk+UwHWeX0oXstZXY2?=
 =?us-ascii?Q?7F0kW8SI5s7ZRh/9T8z/X6MzAS4NBDDFZJhObu+DpTcZv6Y/YIPURjgXCxJG?=
 =?us-ascii?Q?F1/2BtdAHggXHBWXHkn7CXqqby1+Jtw03N92N2rPY5f2SWWz0iiIfbPav7Xq?=
 =?us-ascii?Q?MIkNOb7aDOEYp0KiFuULsw5/vwTLApNOzsP8fExXQXx04cUznVoiE8dtv7Wb?=
 =?us-ascii?Q?yUcTylgBvCEh+2eYTu8Uq12ya/oueck07fRYnhnz2WJytB4MkvBeWNyrmhxS?=
 =?us-ascii?Q?SScdXM1wLJlqt6OYXIDVYdiWt6vxeDiY/uWRhNLCcPiBwAcUIcTIP7c1tutv?=
 =?us-ascii?Q?mCBUNRZFRb8PZTroFpU9J1ydvuWHmf5lO39tsN42Zh6z1rJMPPvG6hVMeeVa?=
 =?us-ascii?Q?O04q86TB0irwtnUKxtGdQHkp/0dUEsUxesQLgcsau54Kxm2izT17LCDks9VR?=
 =?us-ascii?Q?7Ox3/ivOXSRiOe4wqcquiJK0EFcvW5A+GDhaKJ5VL7G28p+up2z9traBf6S6?=
 =?us-ascii?Q?uOaun68QBAXFuMgU1CEf6vdrqLAVTq46X0CPPb98h7gNFIDYgBoYQDL0aWGr?=
 =?us-ascii?Q?OfO0HebFA4+3ul+52Z1iD+Qbud1WOlvCx7goxriUbHkvQK3Y8lpD9qgMWJM3?=
 =?us-ascii?Q?wVv1M06T56xHTx0Q57nUl6GDVOTQ7EvkCoNs292poggdEJJo2ytd2qvdELc7?=
 =?us-ascii?Q?QM9bjO1RUH7hIqhTtRELUSB4FujhGIGrvnSZVXPt3Vz2umfnD9806i30hSPe?=
 =?us-ascii?Q?7rluxm2pA9zH/62eLwRDoKFbPk8CU7s2NhSkYl4PFlHkm+LweGp3/msQAsEE?=
 =?us-ascii?Q?uXLxml9qUHdm2tWMYINtYOKwfTClIyjgR22hzEtJu2/T031AN6N4Ie/FUG7G?=
 =?us-ascii?Q?v1NU1G2HtX3caOO0oB6KdWyly5P0w0K4Os2FJ0eyH1DyhmKd7tM0SwvWBplG?=
 =?us-ascii?Q?Xt+Q3/h118ck/lhOBL/6qe6MQJXO6daYj+I3DDn4Y3Vg44XyfN99sN3rmgen?=
 =?us-ascii?Q?jqlC0f73B7g3MPb2ZDhck9KZlmxCMnSP2njjz/LbmBXFFhiGC6rNH8EXUVog?=
 =?us-ascii?Q?mtetFpSNMLKYQW+XP3G94dGXJt8C3pF1/C8sRhJ0/ioWEqnny46M7eysuw67?=
 =?us-ascii?Q?tccUMANvPaHVAWUyqmt7mFjcA0cDhgXl/7VZY0Z5EmikNNbYKatO?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f817917-2426-4262-7426-08def5b8ad8a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 01:51:06.8894
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: koNGps+PentChl2s9IDZew1BU/ASJgsDXIDRVw6WBU4Fpj84F/zxUNmohrrRjAnXlM7KZaTjwKICNEFkVA3mgd/aN698sw2cIFE1C44+6uxzUvJyCI8x1wec+IrHhHDJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265

Add system-0 domain PLL clock driver for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |   8 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 535 ++++++++++++++++++
 3 files changed, 544 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 852464949334..a39dd22112fa 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -117,6 +117,14 @@ config CLK_STARFIVE_JHB100_PER3
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
index 000000000000..55d589bc831e
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -0,0 +1,535 @@
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
+	unsigned fbdiv		: 12;	/* fbdiv value should be 16 to 4095 */
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
+			   JHB100_PLL_PD, BIT(JHB100_PLL_PD_SHIFT));
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
+	.probe = jhb100_pll_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-pll",
+		.of_match_table = jhb100_pll_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_pll_driver);
-- 
2.25.1

