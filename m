Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.111
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794996352;
	b=uOnuNjSSYUam4qXPLLerqu1TYfvdtJJgajn4mUwGkTlkTG4H6z/vNolN2h5eeZYnGzJa
	 Qo2xiVPZJasoJhQvEexPimpFcG0J5xmAX42qdE7SsYTfufh1f9BL5tCbTR4GWrxX2VX7W
	 45fvcarV5bReg9+gUiSnu1BVarDFvqdLTQJP8RdYFxUVPUps4TK9EShr+xLqW/Al+l57E
	 jVdFavHRmpsWfJCqXUSATSkXzM2fsZc4BzqXJ8OQ4GuUVjLbgHmV/Il7xd1wpk0HJV2NY
	 pR+jquUmGQm1S/6kSEKbis9XVWYsL6T8b8dNxTTFd6PemMNKyX1qzATzgf7WnS9vUoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794996352;
	h=DMARC-Filter:Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:Content-Transfer-Encoding:
	 Content-Type:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=RLglTC6kAxoau3ukzr1ox2Mmg0j5XOOYzlW1xzBHmOQ=;
	b=1aBdvzjaEPT4PI3s+jFVqeF4iUVnb0fyfenFl7f1DrJfAYnm0MyPBfau2IAYRvb9jO+R
	 VmfO0hYXXzqpqXzn6FJs78CjEPAXkd/GWBXqFqP0ejFod01UFy2J5380Ft6NXV2I8X9/K
	 /KB7q5rAwNRxkiHJN2dZHm8EamyRiRhEc9m73VDKrOvy4S1+mXFM5AxQMazbCwzBPic+R
	 NwxZky1Nuf1YI76XuGRexkpEbxNE6sHRYwtCuE/W4Yamek3yS7Xyr7704op6MSbRk4wqI
	 ozWYBfHmnTIP8XEzyMqOuEQnfhGOF9wFanSkrnSkH1iuAofHIbBtPNMi6HlK12SU4KQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.111
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2111.outbound.protection.partner.outlook.cn [139.219.146.111])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3E90606A890;
	Wed, 18 Nov 2026 10:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3E90606A890
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G+Ok5Rs+pwPXLdDBD+JtaXsUWABoFUQQHmoXnBF+wEdln7FGQw5Lbl9L5GCzp4Ugln9JK38ILetLGu6e7avarEmyizehD5wT//3mrD0TfmrkPBUxfPnOko5+PBVeuWMiTrhPsVCI8cOoZe5pzaiYUXV19QdjvUUiaZhnTlV+iu/NSO6hCY/lOYn5Fo/yYNOcr5Jp7CAlb5BjDw4OF+fH8RwRuQGYabWfyoWlM5bDla9x5lyGpi1380nAzroNuvdMDboqCXxr5xwAIN5bI3Ct69jQqucDowRuGaObWjGtmxkUmjTCA1MMX+8QQZ4Vo3yZoj7TJSY2hvoxPbMkEQYr4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RLglTC6kAxoau3ukzr1ox2Mmg0j5XOOYzlW1xzBHmOQ=;
 b=gS2mmO0cWjvyYkNB9CQCT63se8l3hyAZ5XYTc0NqrhyfmCkJXMB5PBvXO4ZK0AxLDWD2Kz6dMg7LuSICYjZj+GNRDglFdlAG4WVBTpon3Qs1Seh3/QdVZvIIhmy9d3BuxFwmkSHNamo5ya7di+tJpPTULIbWYthP4tzKYmy/CW2JRG6NIfVTssJ4ngxJ8vabJ5v/ncbeMRHylXA3HjMiN8LgLDDS3e3n92/xd7R84n170Q/jAaHQXEviUh90B4gdgI1KjWeoyUXFepK8q54xxC7cmTvPBnr659q4mtDf+yuyGNmin+1ks1w1q05EydNMlcT+iz0XUOIOLOjqejlFlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1170.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.10; Wed, 18 Nov
 2026 10:05:42 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0615.009; Wed, 18 Nov 2026 10:05:42 +0000
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
Subject: [PATCH v2 6/6] reset: starfive: Add StarFive JHB100 System-0 reset driver
Date: Wed, 18 Nov 2026 02:05:23 -0800
Message-Id: <20261118100523.11395-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
References: <20261118100523.11395-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0013.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::25) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1170:EE_
X-MS-Office365-Filtering-Correlation-Id: 38969ead-39c2-41e7-6438-08df455b8156
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|23010399003|1800799024|376014|366016|261009223027099003|261026140227099003|38350700014|10067099003|261021121427099003|261021135927099003|56012099006|261021130227099003|261021133027099003|261022105027099003|261022115727099003|261022113327099003|261102123227099003|261022075727099003|261026135527099003|261021123027099003|261026130827099003|261028144727099003|261026121527099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	IWSeTQ/xpNR7vLxhfVlrKChhBB9fAtO273Rws8harcb0Js3IB2xnSHSe+jcG1WvYI5OX231leqAn6oBdLL8rOkz5IhMnr16I15oozh8N633JnIYqGrNre+r5G+rwB+pRMHi38G3kdpKFFqfEvwgRzAItszElJbw9Nckft5xCTEL31m6uAxdr2BNgG2ihyovMWH2pmAFE4QHJ4zXRp6HW+hYPFeUxXVUoD+VOKaST05rriB8p/Udi/FZH0fMegTzUzwjujeXphqMvJyLAX2Uks0bqOGamPRTr0C59GZWGABkJI4zopxLr6ZgrK9eK4KqzrcBt/WuP1kjyDibhrDmV6Ii3kTkBZGUVw3keGcUvfpGsM9Y+tqwmXylJuUUFAVCJP1XpsAjwbbWlFzwkiWIr94MQZ7j6eSmvseHcrEF1bpNhKl1qrmN7LXduPwd1CgXnqAMJ+9qZv+3tZsHMQPp2HJvL06qtkgaS5hWn8Fg/69eWDaX+S+Soq0fPcH/WcIysPhuGlwvDLzFZC4cvAOT3zeXxn9576dTFyyysg+xK0qgjQvhBIaH7eEWOVh2OK51Y
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(23010399003)(1800799024)(376014)(366016)(261009223027099003)(261026140227099003)(38350700014)(10067099003)(261021121427099003)(261021135927099003)(56012099006)(261021130227099003)(261021133027099003)(261022105027099003)(261022115727099003)(261022113327099003)(261102123227099003)(261022075727099003)(261026135527099003)(261021123027099003)(261026130827099003)(261028144727099003)(261026121527099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?BGT1UBS2fVad864qj+QdEIoh57okAX/47POnKpWWmiIQP+okD9/EheCtyJn2?=
 =?us-ascii?Q?uUlJscwJVjSM1uqPxrAXPU2CNBkqmZlMBdMop4JIgUwLGoJSmBnRk79JrEzc?=
 =?us-ascii?Q?q1GjuK1OYhWl9b8VZAe+XCpkQhdqvNX3ekB7Cwf48J3zPjEbzVnn8GvZB1/N?=
 =?us-ascii?Q?htIq5MpdXlpWlirHqhQGdRttPs7Nx2ykf2GriK6RFXzJ5xiyDk9YOLg0RGyQ?=
 =?us-ascii?Q?ioutgZboUyfdE1bf/MXrTiPAgHuKkC7kyQ/JpOAnl7OsDOsiUwEfOvLZhynn?=
 =?us-ascii?Q?E7kozXLiCjBIYPMe+IHVJ/IRW1pvctH4aUDrxI0V1jd7gizb+K5flYw61X1U?=
 =?us-ascii?Q?3Jkf0Bs+dSRafqjxFpMzl+YmpXBFWOIoUyrvWLhA3Ob+tvztfDRRa+f8iWPK?=
 =?us-ascii?Q?mC3CIIb4wCN5gjHWqPDuuf3DJ2Vj6k/goaYMsU+FJpA6yEeNFL+UDWXQvgdh?=
 =?us-ascii?Q?HqluzjtyxycCqNa4svPDaFVPYFADPuD1MD+LPnp6il7OHgnhRnToHQ9azeOz?=
 =?us-ascii?Q?uDiLX4+rQOCZMfJ8rF/syICVAHZq/dRh5mKX12rU3IEZ/sVBPwBwIewYUBqA?=
 =?us-ascii?Q?fWY05Nxthm+tQAGFzOjnGnUQweMhYcOM+SF+9IAf50dSOqACCs0YTjOSYRb8?=
 =?us-ascii?Q?PZfGFxMox88q8mb6OZjk/t4JOPjnb7qB0tsr7ticJLfjP+jcsWZfZZ1GfE17?=
 =?us-ascii?Q?j0gaHbP14yVMWkvmFFySkwwhRrOlAczThnl7tRsPI7bV9n5HbbLxiRDn1h4S?=
 =?us-ascii?Q?qEEqD2EgVmZzJ4wUkTQzG+HvsaigK8C1G8gkL/M0XZR4ReykYyKz/qi9qBr2?=
 =?us-ascii?Q?BOmSnxKoB0WSYMQQKLoqAFtWLTU10anrL7QBHLbv+1tuCaf3o6ift4Srdi8x?=
 =?us-ascii?Q?/7ClH3MXu4bBouzoiSJL3Htafi5CJLQgGLDWh2exUyUqJCuWCoN4OhI45Hr5?=
 =?us-ascii?Q?n92z9Ot7Uj0l9wJX3OYkv+M3RRjmy026x4aHUrdoadRCuL9g4dEccOrObubS?=
 =?us-ascii?Q?lma9hPkjeCjLD+p6SjlIObftBfIUkFxJGWXiF8G3Nvle4CMgi1aWBeuRR3nR?=
 =?us-ascii?Q?760Y78w3ANjo77qPLuO3Y7VymVZUSSS9lL5CEv0vlpOX/6xxig3LCnhHDpkU?=
 =?us-ascii?Q?aephF4cVyK58IaeFUKq0eMZZyRL2jkXSaZvTpXa6+ocG67uEhYQKPhhkKotC?=
 =?us-ascii?Q?HvkjtML6bjk/Wi1v8fcSdt7bkq3SLMY73QBKeciDP+GaUqIiWC+QxyD6Oma4?=
 =?us-ascii?Q?rnthPqc+r612VTJW99G2zSrWyLSL4x0QXISRnSWx/0L/o97qkG10vtCylKl0?=
 =?us-ascii?Q?5cOvaU4T5bj/xvThnqFW8FpGVfKJqa3xnMgs23R/7Zj2LxELG+Mj1gsSMJLn?=
 =?us-ascii?Q?Pb5TtZj+U7oanJqDbVmQklTcQHDCLaEkG0cBDjqvXsuxy2VWVc5Hh1vIt9ZH?=
 =?us-ascii?Q?cXNjlR+xtyFgYTAs6ehxDc6W4pt9f3XUFQGAK0/B1AHVUoYPNzE50aYzPtD1?=
 =?us-ascii?Q?TCjtJ8L+A9JH9sqwWflQCJHPqKUIr8rJjr+nctpksb80uWtRtjLr2XhtEnNR?=
 =?us-ascii?Q?Xf3nhXc9B8sRSgqkI+HLz2+f+ilNZFO+fZIHjomPjd3WOqPuJTiL0VR23oA+?=
 =?us-ascii?Q?yxBIwpnssxHLirzxptSeAjaQVrR5KU4jPQ3ID7t1WGq2QTOohYzVx0gQMNkN?=
 =?us-ascii?Q?UKrqmh+lz+dw8Aqiygk51PNx0e7FZyF+55W8GCRRjiV7wEzTu06OKLqjz0NO?=
 =?us-ascii?Q?Rg/tSn/wrGIZn9K7oz59wPPPugMuq4jRaBeTXeKhugBzm/utoguq?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38969ead-39c2-41e7-6438-08df455b8156
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 10:05:42.5165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v5laDUgbyA2JULiYlnkJS+rfD3IKX2A8c5bcjv4GtUkRio0T99ZEAYNpeuScbz+7mjaDfAYo8romN+gCtim2+PW8SvGnuqAgpGECo1dUIXWK1d3UaJi3ctsCtRM2LonD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1170

Add the auxiliary reset driver for the StarFive JHB100 SoC. It binds to
the auxiliary devices registered by the JHB100 clock generator drivers
and uses the register base handed over as platform data.

Start with the System-0 clock and reset generator (SYS0CRG). Its reset
IDs do not map one-to-one to the hardware reset bits, so the controller
is registered with a reset ID map.

The other JHB100 reset controllers are added by follow-up patches, each
right after the clock driver of the same CRG.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |  6 ++
 drivers/reset/starfive/Kconfig                |  8 ++
 drivers/reset/starfive/Makefile               |  1 +
 .../reset/starfive/reset-starfive-jhb100.c    | 74 +++++++++++++++++++
 4 files changed, 89 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a891c9046eca..a77f5049ff55 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26928,6 +26928,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/pinctrl/starfive,jhb1*.yaml
 F:	drivers/pinctrl/starfive/pinctrl-starfive-jhb1*
 
+STARFIVE JHB100 RESET CONTROLLER DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Supported
+F:	drivers/reset/starfive/reset-starfive-jhb1*
+F:	include/dt-bindings/reset/starfive,jhb1*.h
+
 STATIC BRANCH/CALL
 M:	Peter Zijlstra <peterz@infradead.org>
 M:	Josh Poimboeuf <jpoimboe@kernel.org>
diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index d832339f61bc..d1833f1ee719 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -19,3 +19,11 @@ config RESET_STARFIVE_JH7110
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7110 SoC.
+
+config RESET_STARFIVE_JHB100
+	bool "StarFive JHB100 Reset Driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select AUXILIARY_BUS
+	select RESET_STARFIVE_JH71X0
+	help
+	  This enables the reset controller driver for the StarFive JHB100 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index 7a44b66fb9d5..d781103355d3 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -3,3 +3,4 @@ obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
 
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
+obj-$(CONFIG_RESET_STARFIVE_JHB100)		+= reset-starfive-jhb100.o
diff --git a/drivers/reset/starfive/reset-starfive-jhb100.c b/drivers/reset/starfive/reset-starfive-jhb100.c
new file mode 100644
index 000000000000..883f67ff1fa6
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100.c
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Reset driver for the StarFive JHB100 SoC
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <dt-bindings/reset/starfive,jhb100-crg.h>
+#include <linux/auxiliary_bus.h>
+#include <soc/starfive/reset-starfive-jh71x0.h>
+
+#include "reset-starfive-jh71x0.h"
+
+static const unsigned int jhb100_sys0_map[] = {
+	[JHB100_SYS0RST_RESOURCE_ARB]			= 0,
+	[JHB100_SYS0RST_SYS0_IOMUX_PRESETN]		= 3,
+	[JHB100_SYS0RST_SYS0H_IOMUX_PRESETN]		= 4,
+	[JHB100_SYS0RST_RST_ADAPTOR_TIMEOUT_RSTN]	= 5,
+	[JHB100_SYS0RST_BMCPCIERP_RSTN_BUS]		= 14,
+	[JHB100_SYS0RST_BMCPCIERP_RSTN_CRG]		= 15,
+	[JHB100_SYS0RST_HOSTSS0_RSTN_BUS_ESPI]		= 16,
+	[JHB100_SYS0RST_HOSTSS0_RSTN_BUS_PCIE]		= 17,
+	[JHB100_SYS0RST_HOSTSS0_RSTN_CRG]		= 18,
+	[JHB100_SYS0RST_BMCPERIPH2_RSTN_CRG]		= 19,
+	[JHB100_SYS0RST_BMCPERIPH2_RSTN_BUS]		= 20,
+	[JHB100_SYS0RST_VCE_RSTN_CRG]			= 21,
+	[JHB100_SYS0RST_VCE_RSTN_BUS]			= 22,
+	[JHB100_SYS0RST_BMCUSB_RSTN_BUS]		= 23,
+	[JHB100_SYS0RST_BMCUSB_RSTN_CRG]		= 24,
+};
+
+static const struct jh71x0_reset_info jhb100_sys0_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_sys0_map),
+	.assert_offset = 0x12c,
+	.status_offset = 0x130,
+	.map = jhb100_sys0_map,
+};
+
+static int jhb100_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	const struct jh71x0_reset_info *info =
+		(const struct jh71x0_reset_info *)(id->driver_data);
+	struct jh71x0_reset_platform_data *pdata = dev_get_platdata(&adev->dev);
+
+	if (!info || !pdata || !pdata->base)
+		return -ENODEV;
+
+	return reset_starfive_jh71x0_register_with_info(&adev->dev, adev->dev.parent->of_node,
+							pdata->base + info->assert_offset,
+							pdata->base + info->status_offset,
+							NULL, info, NULL);
+}
+
+static const struct auxiliary_device_id jhb100_reset_ids[] = {
+	{
+		.name = "clk_starfive_jh71x0.jhb100-r-sys0",
+		.driver_data = (kernel_ulong_t)&jhb100_sys0_info,
+	},
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(auxiliary, jhb100_reset_ids);
+
+static struct auxiliary_driver jhb100_reset_driver = {
+	.probe		= jhb100_reset_probe,
+	.id_table	= jhb100_reset_ids,
+};
+module_auxiliary_driver(jhb100_reset_driver);
+
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 reset driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

