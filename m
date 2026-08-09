Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 508293033FD;
	Sun,  9 Aug 2026 01:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786240358; cv=fail; b=R76kCt8rr7U58YIzOkuOTMBioNwTHeIGlTYkUTILKrIqSb0+PN5QwfALbg3jsRpj3ZbY7OnLiZ8drqeKTpFT/rd96OG89BvQx0WcoMgzKHqtOm+8S5zCbGpWaKx1a5Xd+rawbPow+siQW2ELN0oJYcj0gM9syyfSJG8DOWlOu00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786240358; c=relaxed/simple;
	bh=/0b3dtU8CK4spC7ZyC8jYuop1JoS8bXidnrRyZfaPYk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TjMkTSCG2E0BJfEZMQO20nwOvplVZzLOpruBUlRDlNx/JsQXp84bGrq6e5GBhbblP2ivaX+lFdPtX89dpg6rElMHP2JAvUCKRx5x5rZdWxReAm+yNB22cX72AOMzoRXn6rgCoX0W0xugdNAedR5WllBw/Wx4mToDxC7Rej7Osf4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gD491qcSPtSeIVkSQ+yfY6O/n3Nu8OiHmdvnP7V0FDfHWf7LnDJBlU0Zki6sWsoA5LpdfkO4fnsuxq325keVOxjOW3V+9ZnZxX8ydn35fGZgpFXt5qoWKQLQ9JiJck07FOihsrWwUdaFpqGCaImWnnO5cz3dtI5dTN28YDYyr21k/TFpyskARoNGkqtN/Jg45+mlCUvyo+TYP1Gi1MlbEGhF51/J4v/KhnTHPMyhUIbR3q7A+/iY/4V8gxq1AlPhN27KtoaqWLvyQev4jZyY/aZX/X/Ta90qm+g0wVVlH7/YE5pYPrdOpL/7JYelr9xjg6Ky91V/qLKJmuMyc65+TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iim4wYaSVAMOOi8HByKOiMfeHpxPVTIcF4dwFADNK4Q=;
 b=FbAKAoXEakoO7ynL2zp0KAesOekOE9pua4o70npy6JKXrVm1sEDgqcR3F1JyQOMZvb4gP1No2lE+uX0IB0odlhae6+dW2FuE98V8JKd05IBguSAgpbIkwDTV1tVN9fyALylSQJDUYSQH2YxjnsNWszKu+1o7E+FlQZnV/YwBGjP95zRX1RubdSHgXIt3uwREGPGPLAJp/SjCwnUnWSk/X53RnFH1/WZVZ1aov5v9oseESn3wkY76ebfmNBP6pwu0JuxWvJansfEleuEWcJbbqYweOnnaal4287QbjXNJ7XXoLgaIlkIalfDM684s5r+pvtPDhsMsI/tvIaiQvK62ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 01:51:15 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Sun, 9 Aug 2026 01:51:15 +0000
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
Subject: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Date: Sat,  8 Aug 2026 18:50:53 -0700
Message-Id: <20260809015054.210577-8-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 8c81481e-8b97-47bd-4381-08def5b8b2a0
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|23010399003|366016|921020|38350700014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	DqE0QndXMJTHbRaXZnn+/EqMsiVKQ0yYy4L3dB2BgfrZXhXJ15zOdxiqtiE3UCfj6b14Kns9RrUk1UflJRbku922HiWolQXTZ0Kwid3iHsH0Ww+lqzrlKhCtRTSRA3+VWKrsrRcFEcuTw7GnvT9SqowS+rutF3NZN6ULrbp8k1oKQVzsQMhshitHCBMaDqh6yKkQWeaZAtvj/zWtswVlQkBWPDlkVm3EQs90BcobkDLJ9bg/qcLTCHqk0sjVM9L8kmYcm6MLtEIgZJZaMfiH3sseTuT4FlGITQNBoSWXwyoLMqV1oijnmqNJ92brIFOmF1xfjHoTSq0Sa9nFiEXl60didOW63FshA8ZVXbwETCxHpNutq2VrJIBQ6KDyY2wQBXJffwbRPX7xxmiJ6tu10Wu8X4ptEqcslmMNdT1j+VN4UUMoj0cvB4UkF3mq+V3FlREprfoNawWNfDBtN+CWYDVmHTXRk1nUm8vnsdxCEBe0X3C69KGprzLbttZY626IcI+S0Y+JWvsDX67PmJSmwLFnjTfkqZFtvpEay2Wbb+3cCZ7zjXjomMfJ6pMXPFYz6xSX/Q4uv8+84JfsD7w9TQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(23010399003)(366016)(921020)(38350700014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GO813x8wZb2MC6+4Tc95AMVW0CNN2ffn3k5vKafF3p/nlw8pPewE87oIWaJB?=
 =?us-ascii?Q?dbX78Ow+t1mcJmkzFxc9Kxidd+reVKWMSkkvAi58afGOOrBPUCOakTkBqKVb?=
 =?us-ascii?Q?9BQJW8DdmEcDo4GKHne1NblhNz4myolwH6blbY+LWNbI2khMecmUZ1q8bQux?=
 =?us-ascii?Q?fH437EAvE1WtRtISRdhXDvZFKuPUFH2Sc+f/G6HMwBdRSqukq+iU8/4Uis1E?=
 =?us-ascii?Q?rfOXiJCIzZDufF+bcgTuIXUz6vRXyvDuRj5q3W/ZlUDD/KniD1+jGpmPD20h?=
 =?us-ascii?Q?1vRoenprrj0ukWoYIwdUrDt8kJWTdik2IvXLtbbgERTIKIfob4baHnVYFjFn?=
 =?us-ascii?Q?JS6JhQ4wgmVdw4SxTm3FQKcb5QkMndLnxkCl8/wDDMeMbsXIQ0ZnDKahv7Gf?=
 =?us-ascii?Q?qUxObXTnWmIuL/Ss89LU4HAJhxMayfnQ6kdy+zl+w/3nVCQyl8o1cZSi0cQ0?=
 =?us-ascii?Q?TLK3GZRo3PPPJJw/MIU/o28m1XLRPXYPkez0gtd6g6Wz+0jzgunyDQEeN0ef?=
 =?us-ascii?Q?JHnzdhDgH53ZuRl5l8h8u4sSLuqKwMpIU6Pi6CJRExnKAVmKilH25K8xPS/t?=
 =?us-ascii?Q?vQwOtArykuLw39tks8XGEARMCQTSlsFYni1TWW0PBGCnvSmUimQM8M754HnX?=
 =?us-ascii?Q?A1Wy/13ncwKI8I3+PA2ZpuqiPVf4ICFAxk2IANusd2i/ezeWmFdaXbZhKWpE?=
 =?us-ascii?Q?uS9V7ioysX13g+xuR6RL6X+csERzRpN/WNOEZhk7vkfnfqxFWI2h11VX++Yj?=
 =?us-ascii?Q?resYYRFINJ1yABraWFuvGONT/zPyjiUdRUG+4Ab6gyn2B1dSFVUy21hj3IjT?=
 =?us-ascii?Q?EMsI2JDh2VgG2Lexsmmi49UE5dvDKHCTa5f3YC7oaLYcrggsAl9IsBWlMwrs?=
 =?us-ascii?Q?rYUGryOFnHmneBPi9Wdv547/z3ZMUMQ74j/ThZfyTOZEE0u4ZMWDpVjktkuw?=
 =?us-ascii?Q?x/DvnxD+IL/rw9s8CnfdhKJbSxpbZTF/hTlmcgrF2eWa5Bss7nHjM4PMm3Zh?=
 =?us-ascii?Q?x8bzRI8OOfuRa2/TUq20X0Z9kvEd8bLnTBwV3Jz9v5M6RdwWKPlMgPYKSdaA?=
 =?us-ascii?Q?BA6ejyZ5e+4IfiLAokgDjeS4BORWt2aiAUxH8YbWkszydq8/lYL0zWp/YMTh?=
 =?us-ascii?Q?acbD3tlI/IrQLekK9NfJxiH1xcv4J+GPAACwgchmIHkhyKIDaVXP22C9QC7L?=
 =?us-ascii?Q?nXUGbAZ/zmusES105l3HDYWZdhe/zPOg/Nn5KPawrmUJowlDYRDFnNZLzG6A?=
 =?us-ascii?Q?kUtFgbazpjYoF3YXel6kCwj0oi8kjs3iL01mg/jlJ6Y/hlWBZtJXDK+3F6Fc?=
 =?us-ascii?Q?je8HlTTPLI7arkknhXpj4uqo78bnGgh6qi+S36pEN8Sqlszvalo9PYUOU4Mn?=
 =?us-ascii?Q?etPhoOBvWhcYsrT4t1RemJF+5OUXJzUv5c1XOX3RfkNgd84IlBKM6qsWOpVP?=
 =?us-ascii?Q?i1Y8tqW3sM0XFCzHUNqC63cKk9ZQktGK6M/5E9tfclhOsJL1GOZGVAUbzpKV?=
 =?us-ascii?Q?ewovESkLqSsBmMcVgii/KHzPc4iqT9U1Q0waPldtmONbCZGBYNuGVKw4ho4S?=
 =?us-ascii?Q?JEzA9KzoHcTyLnfLJfvOSAC2iywyRjpoY27JlZBkdH6xL1uMyyPc7LAaNTIS?=
 =?us-ascii?Q?Tttuu8UQROP5PpTGONp8yPRCszTYaevUfvqm4KWRYSBBzR8Uw0Y+VY0ucB/o?=
 =?us-ascii?Q?XlUiEc3UWfgKHjbVbkHOpw1pCdgeMKSPtfd4PwdR/zEHIBf6aJBdNf3y4vYe?=
 =?us-ascii?Q?kOm12UGk6QB/1m0q+Wp+9ldG2PPBycs2s+7N2je4YqoAktxiRmTp?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c81481e-8b97-47bd-4381-08def5b8b2a0
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 01:51:15.4138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mDUZqQnLdvMS4B6x5ipmMZ91/57ZvP6RUm9QG1OMWy/Bjx94uGuOXkdkuWdMykWEhBpSw6/Uj9InZ3djlN01C5RGxk6/i4uNuydn4NDzv9jTciG+6TuSdnWt37Wj1dvB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265

Add socinfo driver for JHB100 SoC. Currently available for distinguishing
between the two reversions, A0 and A1.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |  6 ++
 drivers/soc/Kconfig                           |  1 +
 drivers/soc/Makefile                          |  1 +
 drivers/soc/starfive/Kconfig                  |  6 ++
 drivers/soc/starfive/Makefile                 |  2 +
 drivers/soc/starfive/socinfo/Kconfig          | 11 +++
 drivers/soc/starfive/socinfo/Makefile         |  2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c | 90 +++++++++++++++++++
 8 files changed, 119 insertions(+)
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/Kconfig
 create mode 100644 drivers/soc/starfive/socinfo/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cecb4f279160..90919c672d4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26040,6 +26040,7 @@ M:	Conor Dooley <conor@kernel.org>
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/soc/starfive/
+F:	drivers/soc/starfive/
 
 STARFIVE STARLINK PMU DRIVER
 M:	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
@@ -26094,6 +26095,11 @@ S:	Maintained
 F:	drivers/reset/starfive/reset-starfive-jhb1*
 F:	include/dt-bindings/reset/starfive,jhb1*.h
 
+STARFIVE JHB100 SOCINFO DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Maintained
+F:	drivers/soc/starfive/socinfo/jhb100-socinfo.c
+
 STARFIVE JHB100 SYSCON
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Maintained
diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
index a2d65adffb80..b3b01fc38139 100644
--- a/drivers/soc/Kconfig
+++ b/drivers/soc/Kconfig
@@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
 source "drivers/soc/rockchip/Kconfig"
 source "drivers/soc/samsung/Kconfig"
 source "drivers/soc/sophgo/Kconfig"
+source "drivers/soc/starfive/Kconfig"
 source "drivers/soc/sunxi/Kconfig"
 source "drivers/soc/tegra/Kconfig"
 source "drivers/soc/ti/Kconfig"
diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
index c9e689080ceb..009f85ff891a 100644
--- a/drivers/soc/Makefile
+++ b/drivers/soc/Makefile
@@ -30,6 +30,7 @@ obj-y				+= renesas/
 obj-y				+= rockchip/
 obj-$(CONFIG_SOC_SAMSUNG)	+= samsung/
 obj-y				+= sophgo/
+obj-y				+= starfive/
 obj-y				+= sunxi/
 obj-$(CONFIG_ARCH_TEGRA)	+= tegra/
 obj-y				+= ti/
diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
new file mode 100644
index 000000000000..04b020083d3e
--- /dev/null
+++ b/drivers/soc/starfive/Kconfig
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+menu "StarFive SoC (System On Chip) specific Drivers"
+
+source "drivers/soc/starfive/socinfo/Kconfig"
+
+endmenu
diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
new file mode 100644
index 000000000000..ca1e609b8104
--- /dev/null
+++ b/drivers/soc/starfive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-y += socinfo/
diff --git a/drivers/soc/starfive/socinfo/Kconfig b/drivers/soc/starfive/socinfo/Kconfig
new file mode 100644
index 000000000000..92bbab62895b
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config STARFIVE_JHB100_SOCINFO
+	bool "StarFive JHB100 SoC Information"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select SOC_BUS
+	default y
+	help
+	  Include support for the SoC bus socinfo for the StarFive JHB100 SoC
+	  platforms to provide information about the SoC family and variant
+	  to user space.
diff --git a/drivers/soc/starfive/socinfo/Makefile b/drivers/soc/starfive/socinfo/Makefile
new file mode 100644
index 000000000000..26c2bdf1de3b
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0-only
+obj-$(CONFIG_STARFIVE_JHB100_SOCINFO)	+= jhb100-socinfo.o
diff --git a/drivers/soc/starfive/socinfo/jhb100-socinfo.c b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
new file mode 100644
index 000000000000..638f81ef174c
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
@@ -0,0 +1,90 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#define pr_fmt(fmt) "jhb100-socinfo: " fmt
+
+#include <linux/bitfield.h>
+#include <linux/init.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/sys_soc.h>
+
+#define JHB100_REV_ID			0x38
+#define JHB100_REV_ID_CHAR		GENMASK(3, 2)
+#define JHB100_REV_ID_NUM		GENMASK(1, 0)
+
+static int __init starfive_socinfo_init(void)
+{
+	struct soc_device_attribute *attrs;
+	struct soc_device *soc_dev;
+	const char *machine = NULL;
+	struct device_node *np;
+	struct regmap *regmap;
+	char rev_char;
+	u32 rev_id;
+	int ret;
+
+	np = of_find_compatible_node(NULL, NULL, "starfive,jhb100-sys0-syscon");
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	regmap = syscon_node_to_regmap(np);
+	if (IS_ERR(regmap)) {
+		of_node_put(np);
+		return PTR_ERR(regmap);
+	}
+
+	ret = regmap_read(regmap, JHB100_REV_ID, &rev_id);
+	if (ret) {
+		of_node_put(np);
+		return ret;
+	}
+
+	of_node_put(np);
+
+	rev_char = (char)FIELD_GET(JHB100_REV_ID_CHAR, rev_id) + 'A';
+	rev_id = (u32)FIELD_GET(JHB100_REV_ID_NUM, rev_id);
+
+	attrs = kzalloc_obj(*attrs);
+	if (!attrs)
+		return -ENOMEM;
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &machine);
+	if (machine)
+		attrs->machine = kstrdup(machine, GFP_KERNEL);
+	of_node_put(np);
+
+	attrs->revision = kasprintf(GFP_KERNEL, "%c%u", rev_char, rev_id);
+	if (!attrs->revision) {
+		kfree(attrs->machine);
+		kfree(attrs);
+		return -ENOMEM;
+	}
+
+	attrs->family = "JH";
+	attrs->soc_id = "JHB100";
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev)) {
+		kfree(attrs->revision);
+		kfree(attrs->machine);
+		kfree(attrs);
+		return PTR_ERR(soc_dev);
+	}
+
+	pr_info("StarFive %s SoC rev(%s)\n", attrs->soc_id, attrs->revision);
+
+	return 0;
+}
+
+subsys_initcall(starfive_socinfo_init);
-- 
2.25.1

