Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29BD366042;
	Fri,  3 Apr 2026 05:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195416; cv=fail; b=OCiG9bL4hNDK8v3THZS+O04HfunIIClCDgkcw8wAo36wSZvHlhDw2S5OYxNhIeXsBgz91wts52xGiCHqBqDRFGVTv68uhXiBzLWLACOHIzn1MI1wTHp7A6MUaEbKol+JkhvWACwXs6sEh064NLuCWPQr2H5G1qTl8Rpra9qKfSk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195416; c=relaxed/simple;
	bh=lwQXhWiiY6d4Ajc0OVo9h+okM3SHE/H3PFlSFRvGl7s=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nzvHAN0HP8ER6aTJTQdpcPFrIyj3WdhF6vlCxi9bWGnA9ltG7/+KqIeAQDH1cieDHclhK0A4JLAa30FihoI44zLkrgGIRqMwJW63+n2NQ4HqKnUuFdm5QJQaoInU3SYp7RNjlMgqhMiamZBSJ6oONk2Us31DkDHZtLlGZhHcnUI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nm6CiTMDJhKW2s15SVjdKTw5pdWVdJnwRM39JR0QHLYWXbnuu5meEQPpOSDekrI419FdixtLMLvxOoztcltx3cD4u75HjYPrnGbiwUOY2Tr06gOccxsvEmR2b6QRv7ddU7flIcRsdIfrS3DsXjTCs/4jep7lXtqkRgNCH3/DZ30lOQruEDZP88M2ZX5pBUWEzimJkRLHOwlGdkpyIizk4meV4cRNqLR/SdxVoKA6+leM5S7Y+sO2KlJCb1hfpZRNszFgOIXCjgKa/2gPsYjEMLHvKrj9ZIVoF4g4+Zf1jtfUIwJH2pzJKJVKJIfw0oiI0isnUCnzqa1+ih8JhLmp0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cNaYk0ucuyOPFyJs9Gezfu6co+7kCin4qeVAtyqrQaI=;
 b=T1UO9SdwdnMkpaA1NfonatCFwn+1rmy0uR4xyKocWnR8hWfWA+x8NEi5zasntS3I1+M5MNSeOA7lB6mxbsSuEeT8k3KVk/2bwUOsjbiF+Y98ch1BzPPAqFenPQP+2LBiTs+F7twxRLxQIlG/Swn2iB7yTDrGswHm2bEEOC9xp2bXj8KeajaHlymiIQdx9g25pc3reSZKcKzh+GgcBHgXma41qb+qF/gg2xNI1ldM9WSlMQ79cfqrbzLJbmRUVWlbIEcXaneDoMWU4WE8AamIo97Tht5ZYJbI3K4bXUgzAksRzfFhDNOqhYjwP99ZaZYaG1Ux4GH1vCD7r1U9U6xDXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:02 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:02 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
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
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 03/13] clk: starfive: Add system-0 domain PLL clock driver
Date: Thu,  2 Apr 2026 22:49:35 -0700
Message-Id: <20260403054945.467700-4-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJXPR01CA0052.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:12::19) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
X-MS-Office365-Filtering-Correlation-Id: 07f6590e-a854-44e3-ff6c-08de9144d976
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	nCWyFQ62LKlGZLcIIZCihdIWC7RgK5hnzEqvILHmhHGaJ0nbLNMNHn8dLZDA+paGbvTJgiDtBLq52gCnGYsGQbpC/NLerJwpoRy3Ueq9SMVeNLi7cHPTLT1rpIHKIFAVj1On4UHpShGkDgVZpEbbhsXjfANENTqv3VueLBPyGfVkEqbJqmbL6q50KkmObcf/pHnvVyga+UvX18oNaC73rg36p652PpuD/texM7thJ+0iK2Ibiyg3AOBHm8HT0qB6g+DwS8rzfmr5kyC39sQI0gSgm4wQMHGaC//a3UlZFuCp+HXLWn9Zv1Pqr/6gereANEr00WLa1se5EZwFNwhNX5KHHRHd/dE9P3yI+EOoHET0BtZEVEkLb7czTuiYF4xgZyNU7Zp3/jciTwuEATht58MnsSukxSBwj+tGk2SjklTGrMrHjgETbDxuSkR0ImsuYKmlKe04GqH48eRz8SJ696juJpEOcnxxSVfrTEBnbTpQKpqg7BZo/7XjYtQrQcWyUbxqeajcOJgZ/LWtgl6JOQvO9HVLWc3oqnI0iEsbWXeVCxh6fM9QjqXyXIXF90pKE8mv2/OCj0t7EPz3ID+CNbYInMHqa8pGn3pJFW4FpTI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?SuymHBptW9UzjS5dOmXIa7waH0TVmu9+MMiLLaQVA1LZi/mkBi8OGGtrUN6b?=
 =?us-ascii?Q?D8oPa7G7fxPfvZVKcld9hddb6MN/huhwSlW55R3Aen6KrWnDcQOR5qndJkqt?=
 =?us-ascii?Q?IDRQGOXXYs2gvtP5/A65ISX/M+aEO9tlQcYxa7T6duqR8rQN0BJqqfL0mhbh?=
 =?us-ascii?Q?cJ6awoRXIpmYxcL/bLdpD8aVLrij/gJpn9Jh9tbYtRnedNLG9acTy1kpZSnF?=
 =?us-ascii?Q?AYE19bPYLPUogXERKXgcUoQaF1WOEmq73IqIbfX47nFsHsMiy/EWrMvxGE9S?=
 =?us-ascii?Q?kzViz7JBQx6s86UmBwKtbMmX2N7QIvVKHO/O2x1mW9Cw3ahP61vaJraq83dG?=
 =?us-ascii?Q?Lygk0eNpoq0UTDrkntypgGn2xnigw3jz9DBAUT5D/tD/JqvumimK0ssUrchW?=
 =?us-ascii?Q?yuaa33orNXlnrO2sykKAMmN2Y55vzkfOumu2I/7hMOTKhSoLOhCRy54xEnwD?=
 =?us-ascii?Q?I7r4PUvnufJ61bv2+MAf6Agrn0QYPEPGE+IykQYTAvXahG1oGCYYvxOckK24?=
 =?us-ascii?Q?1/MW2YgclqmKshyEUAojBkUZL5LLCXCTecpsWi/bZsyw3SA56GPQOHllr4qD?=
 =?us-ascii?Q?w+srdKnb0KftzjCpTfFyEjxTPN37lBNjSc6CQkmXSWjDSV0sl7BowkzbbZYw?=
 =?us-ascii?Q?eXERpmEZUgT3HAFoouYda5f5HwEyToSKMdjlJMWvml8oWTl2XtNRrADRUwqb?=
 =?us-ascii?Q?GF1O3SvRMJVowLCl4+YDpw1CSwunPjbp7BKfFGh23I1rDBd2tnXrlWFR1BoS?=
 =?us-ascii?Q?VzXfjCMVJ7MTfnpGltBzp4m337sKOpwUHGwbEygF2T4VzRR9Q0XVq5f4IB5q?=
 =?us-ascii?Q?E6JDop4zqVbJ0cE3+8Ch8+Dmo+Zlr0u4qwbJYu23R3aT+6L1RLVvfTJp+Xn7?=
 =?us-ascii?Q?xRQRP6EvQKXJXmLiZXgy6mNsBs8zZTKFKLvkbUD9UhXJbU5jFwMUKDDbrrJV?=
 =?us-ascii?Q?KTCUH1TZVSiXJNm6z2YN30OjvSz2pPe9ku/LP9i73JcJhOiTm/RIp3WbxD2U?=
 =?us-ascii?Q?2lNzPck8wLZLe5U8JkczIaua7nVPYg6U7ydRyvqss6cB7Rjb8k2CKdjS04lD?=
 =?us-ascii?Q?prCt4kC1lx1S2TBs1TT2J9P8ZSQ3wFVVgFOlxASbZPYWZ/lkaW/GBnU/gwE+?=
 =?us-ascii?Q?+o4KVFHGz1DHPrsIMEAn5R91LMpHowStHNxgN7dL7oaKOcTg5myU8DhB9LwK?=
 =?us-ascii?Q?wbWe05y6sMdk7NJBm8zFa2wyyqrKPVaysl084e9uB2L+kFeEt7yBh5N9SV74?=
 =?us-ascii?Q?6gOs3Pz/6fqTVAZ2drSz7iLF+lQHZqN67cCLxlORKBLv1H2g3E7HDdX3mCwZ?=
 =?us-ascii?Q?KbgmiYDIK3qhFBVEpzuXKTUkAQMkOTL2JYEXmN07qwOSADbi5D6aDJYCjHB/?=
 =?us-ascii?Q?MdIVmgWev/exrUpqxUSpdunK4EvdtSjo61Eoz89yLPan/AtIH3lQJocWzdIm?=
 =?us-ascii?Q?/1k/Q1nDXS7M8vHi9Lg5bm32imVMyXyj2WP8FsheYgQo7wT4XQR9BVNp6BEl?=
 =?us-ascii?Q?shESj3fq3gQ12528p2z4GY8SbiJ9n/e3C7eDovuV8q+/vvSXZW78Cvv3uF+V?=
 =?us-ascii?Q?RHQ1KqhKhZUzO+jgwyOLQcED9vhOLgVZvDAhfqkUq5NcV1pEv9om9slieov0?=
 =?us-ascii?Q?jg3qjQ797wiiH6/x0i2Z01YC0o2w0zqUJb90TdIcqpTgiVQg7VyTZZqubCV1?=
 =?us-ascii?Q?R5ZzPL09XBckfxJHH3IBMnbIG2LqY7fgggjZXRhHPM8yANOGnzjqhbIxAcni?=
 =?us-ascii?Q?1u0A9IMmfuTurAQmJP891JjZzLq2OgDPJ6DRuDxY208TaQvBpyoB?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07f6590e-a854-44e3-ff6c-08de9144d976
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:02.7117
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bHQPwqzUTcTeriauys8fYoepTu2IdWtDC64JVLRmeJaMj4nbDHxFZSigJZjDuAFfTDpZwg2rpF/qT4OJqdx1uLlqatAM2ppRxrlXVv3nxjDtCODwt+IbYBZDoRnCMg5b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add system-0 domain PLL clock driver for StarFive JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |   8 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 498 ++++++++++++++++++
 3 files changed, 507 insertions(+)
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
index 000000000000..1751a734ee83
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-pll.c
@@ -0,0 +1,498 @@
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
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+
+/* this driver expects a 25MHz input frequency from the oscillator */
+#define JHB100_PLL_OSC_RATE		25000000UL
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
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset),
+			   JHB100_PLL_PD, 0);
+
+	return 0;
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
+
+	regmap_read(priv->regmap, JHB100_PLLX_CFG2(info->offset), &val);
+
+	return !(val & JHB100_PLL_PD);
+}
+
+static void jhb100_pll_regvals_get(struct regmap *regmap,
+				   const struct jhb100_pll_info *info,
+				   struct jhb100_pll_regvals *ret)
+{
+	u32 val;
+
+	regmap_read(regmap, JHB100_PLLX_CFG0(info->offset), &val);
+	ret->fbdiv = (val & JHB100_PLL_FBDIV) >> JHB100_PLL_FBDIV_SHIFT;
+	ret->foutpostdiv_en = !!((val & JHB100_PLL_FOUTPOSTDIV_EN) >>
+				 JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
+	ret->foutvcop_en = !!((val & JHB100_PLL_FOUTVCOP_EN) >>
+			      JHB100_PLL_FOUTVCOP_EN_SHIFT);
+
+	regmap_read(regmap, JHB100_PLLX_CFG1(info->offset), &val);
+	ret->frac = (val & JHB100_PLL_FRAC) >> JHB100_PLL_FRAC_SHIFT;
+
+	regmap_read(regmap, JHB100_PLLX_CFG2(info->offset), &val);
+	ret->postdiv = (val & JHB100_PLL_POSTDIV) >> JHB100_PLL_POSTDIV_SHIFT;
+	ret->refdiv = (val & JHB100_PLL_REFDIV) >> JHB100_PLL_REFDIV_SHIFT;
+}
+
+static unsigned long jhb100_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	struct jhb100_pll_regvals val;
+	unsigned long rate;
+	u32 power = 0;
+
+	jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
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
+	if (!!val.foutvcop_en == !!val.foutpostdiv_en)
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
+static int jhb100_pll_set_preset(struct clk_hw *hw, struct jhb100_pll_preset *val)
+{
+	struct jhb100_pll_data *pll = jhb100_pll_data_from(hw);
+	struct jhb100_pll_priv *priv = jhb100_pll_priv_from(pll);
+	const struct jhb100_pll_info *info = &priv->match_data->pll_info[pll->idx];
+	unsigned int value;
+
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset), JHB100_PLL_FBDIV,
+			   (u32)val->fbdiv << JHB100_PLL_FBDIV_SHIFT);
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset), JHB100_PLL_FOUTPOSTDIV_EN,
+			   (u32)val->foutpostdiv_en << JHB100_PLL_FOUTPOSTDIV_EN_SHIFT);
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG0(info->offset), JHB100_PLL_FOUTVCOP_EN,
+			   (u32)val->foutvcop_en << JHB100_PLL_FOUTVCOP_EN_SHIFT);
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG1(info->offset), JHB100_PLL_FRAC,
+			   val->frac << JHB100_PLL_FRAC_SHIFT);
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset), JHB100_PLL_REFDIV,
+			   (u32)val->refdiv << JHB100_PLL_REFDIV_SHIFT);
+	regmap_update_bits(priv->regmap, JHB100_PLLX_CFG2(info->offset), JHB100_PLL_POSTDIV,
+			   (u32)val->postdiv << JHB100_PLL_POSTDIV_SHIFT);
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
+			return jhb100_pll_set_preset(hw, (struct jhb100_pll_preset *)val);
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
+
+	jhb100_pll_regvals_get(priv->regmap, &priv->match_data->pll_info[pll->idx], &val);
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
+	priv->regmap = syscon_node_to_regmap(priv->dev->of_node->parent);
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
+		.compatible = "starfive,jhb100-sys0-pll",
+		.data = (void *)&jhb100_sys0_pll,
+	}, {
+		/* sentinel */
+	}
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

