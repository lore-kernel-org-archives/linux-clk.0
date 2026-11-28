Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795854983;
	b=nbak4uWiWD80o7Z/xunrMqnZIzd33qjLB+9P+gRP2LkoEj4jgcVTGj3k4irlcc1aW3rO
	 IiQmzZ0t42AXPLSB1wyMi+gPr5IjI3mjHkv5rm/yHXjpY9zah1N6wHxZve0o7GFLKrys0
	 Og6hrRFz/gigq4xdDLsVOMh5/wML2KJ+F/0soxTdbbusw7zEzC9E/xjvh5Tv6RNkVKGsY
	 adS70P+T+VyJo9MRpUZDZijdRrRwNL94MvEIJnn70U9pRMZE/9lTrbWtAm+d//A8T/bqf
	 UFxuk9oTki0g3K6o0KV1gP9CuvfZ9193e14Ud2NXKBWiH/cMxAHm+AH5TW3kWoY0m3g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795854983;
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
	bh=XUH4W233bUtP7PLX+cxngyYQtxFQV8VSWkkqgvRKTQY=;
	b=tTBjwBowz5mbjhb4mJtiRB44X7oPUjEughW26GDpigaMyyLTSoK2+/NMSiyEmi0ZeMU0
	 o5y7uDoxGxfX7sDdeuMrcU0l3alDIEP/ZdyC/EcDcNU86yUEoz5n6MPGvIPRAmKpkzDdD
	 nQq3y8z9ejjPEp29mKWz4Wtgc0Hh3avgzF733BApuBHzG34hiJUs7hq+HYc2qF6aSfmzp
	 nMF6jv7Dz+2juOhZtEL91VtwPeiO9C60UMHmPLAH5aGd7aiNArBudz+AXYVPYMEuBY9xD
	 RrAhpKIlQ//Ek3g9aAoUAKAHox2H5R/lc7Dtoc4GPsnV1EAkHo4CurQjZInPkwYM2eA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.146.97
Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308D0606A323;
	Sat, 28 Nov 2026 08:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 308D0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltBhVtMbNCECnkrAWjT6WtqyDudR5l2PP68wXAItrGnBJA6jyXwvhbJhl3tK0JAhe5sgE0d65HgMev+NBMtXbZzc40n63UHQO2tJscWLX0aaTIRuR7FM+3WNHyQ8JkHD5rXx9JgyFm5zInFa6U/ybWp+ux+oHCPNECLvwFOnsDwVM7HLcplVj5Tpd5+bMYLtIqJKFIlp7//LGQDfCPhHJUZkWOuNvwz3NB3cf57cduQU83p6Gyoypc3ttNlI/2qYBECf6cf5GU1I/E8HUDVFcD4h/DcXZXGJdjGCqZQAvlwjDPlIN8Gtj7UxpmrJBfopECE4duxcCnzky49eQpi3Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XUH4W233bUtP7PLX+cxngyYQtxFQV8VSWkkqgvRKTQY=;
 b=GpFhD4ecCFMWyntBjMyU5Pz1I+a/y20WPT7gba51TNygFHJ/YeoC6DW+5D1vZDNKjanCSSmTadjfuJgtfzWbKwOPjIVvGGF6ndqxQOFXRyunMyK+4QUf/gJJGee/EqXPW507RhUVXDOff+PGiZuPBxjVeLBbnTRC6AY8/NO3/ZFLGOCJunT2brPWIpKKB0Gi7jJSWPVOCzqxxI/PdLV12OqB+Sm3ceazeo6B1cwF0V9C3pDhkiRDg/VhokGQhJrbZtC3WrBUuORR31FZnyePgNruk7f+vD0zSufLmS+yrzNlPh5sBfkG6FuNLanCivp0gkvTvJ0Uum72s3ISKf8yqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1313.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.17; Sat, 28 Nov
 2026 08:36:08 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%6])
 with mapi id 15.21.0639.015; Sat, 28 Nov 2026 08:36:08 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>
Subject: [PATCH v1 1/2] clk: starfive: Add JHB100 System-1 clock generator driver
Date: Sat, 28 Nov 2026 00:35:53 -0800
Message-Id: <20261128083554.2993-2-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261128083554.2993-1-changhuang.liang@starfivetech.com>
References: <20261128083554.2993-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0006.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::8) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1313:EE_
X-MS-Office365-Filtering-Correlation-Id: 8545b431-734e-453b-b37a-08df4d2aa60b
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|366016|23010399003|1800799024|38350700014|10067099003|56012099006|261021121427099003|261022115727099003|261021133027099003|261022075727099003|261021123027099003|261021130227099003|261021135927099003|261026135527099003|261022105027099003|261022113327099003|261026121527099003|261026130827099003|261026140227099003|261102123227099003|261028144727099003|261009221227099003|261009223027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lEVDe/NxgE3zdbiHJaAy4lh39VOBb+id7QK5B1ZGNQeFv/YSGwIEvbLXCPMquo2sYUvzA0pbfUdvgotgvQ71ZAXpF7daUqByQcv0UVMARDnK4oFKQ9jB/BjVC4Hq5SDtC3JEpVFG45TeJMfjlm5vfws+D9q5rOqiI+tKZTiLRq6vAk7o4evVjrDOHlzHkiogm04Ar+gVY7TEl4GWskZt6Td46wlYWh3Md/RX0jG6wC8pQH8L2oFZMS13gnLHWGEEOjgjsYqJkZjSC8WZRkTqx41X6qw9KPw3FUObnHAhns/nQQYkNF2T2jYsQZjVG0SbhD+otVnquM/ES4q75MLI27cg0Msrto3GhJGzEa4bMXv/LMTWo+PaytqKaa5rp7Uho1DM+W+Pho45ki7eC7IBWrOwixHARoMdd2Bv3P45u+ex3lIU6YtryL0HHwzdPk8aZOsruV8mpriVArAqq4QpOW3/sdLoLShwJZSplJmGimoKv54ALdQU1lNXNSpDv6U8hytzvu27a6th/xOQhY/G6ldbRSUJUMpkKMBRQDqat/UXNOOFhDVp5l36dBOu2eOE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(366016)(23010399003)(1800799024)(38350700014)(10067099003)(56012099006)(261021121427099003)(261022115727099003)(261021133027099003)(261022075727099003)(261021123027099003)(261021130227099003)(261021135927099003)(261026135527099003)(261022105027099003)(261022113327099003)(261026121527099003)(261026130827099003)(261026140227099003)(261102123227099003)(261028144727099003)(261009221227099003)(261009223027099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZpuwkYR7wAHNIb3XKpMfVGVbZniWxkFn6zpC6Q4DyxPchxc1ByWMyoWKIaYy?=
 =?us-ascii?Q?m9LsYBg1v2Svc154PmodcOKw2S3laD6mNwsCVobgNBmufQDISfZZWBpG+Kp6?=
 =?us-ascii?Q?UfWpK/RzReScTJBakEtR3zL0YVC4HQNiX80NtPwXMkQX1J7DDyfZpSpXJb/3?=
 =?us-ascii?Q?wMeQEFjLjLahff5Wr2ty3yK7hNwHcv/F4rTMb4qQwM+UlXgXrZI/QVG6Gv/8?=
 =?us-ascii?Q?osfiOsy9TGSfX31ZHor++Rb3NSmlhymRaRso9uByaUUIGDC3n5LRJqI/d/bn?=
 =?us-ascii?Q?Ve33STzv0ukjbOIlrFzd8DbBho9jtczk1UwMyq6qYA2bltN3jNvhjH9OLGXX?=
 =?us-ascii?Q?E+iWuwJgy8lCGnTOK2KxSykuH1OcDT7DDmwY69KO8bdFWQ95g7+2UwaBj+Ta?=
 =?us-ascii?Q?cj2xCKfQ1qFnEvZVpluwwVLR+vkur6tOLXvcjAcCVL7r2+6q5SpCoFZNQsAC?=
 =?us-ascii?Q?DDmavbySVepOqZ9DJDf/1sxzWuj3dT7jL/+RtqlTh8SBmOJTMqzfM+6Eaa7Q?=
 =?us-ascii?Q?oB2/HtoRLve7p/JJH/kEXWUDS4vvrBblrMMTK9dUim4GQTO1bHtm3hn6nMsw?=
 =?us-ascii?Q?2CSqjZEBRE7fkYnqt7nk1S111A9tXrEidOTWMi1+51gcZhzBvt71RZGAfoWd?=
 =?us-ascii?Q?+J+uq7xUeLCXbjfYE6JS9lqeX5YLAMs9su0WmHX/w3dpESlJGSJWkldRPMD9?=
 =?us-ascii?Q?VdV0cgoeg2qEmX2TSQ8+vVyfALzs5nO/vBHR+6XGxeTVza9IYy8ayzCLNwGB?=
 =?us-ascii?Q?CKBi4vA0NTvInqUhxg/WyQr6/cUUFzseU23EZgcwirZmrRjgH1q+zf8FjcWy?=
 =?us-ascii?Q?rwyZO/wuNhC1UFlM4e4QcXFCFqn5IuNMhTjQu2XxuCCFN6r9JHcxJbv3Xnka?=
 =?us-ascii?Q?zmQfYFVke6m/X3Sb83xarEXaUy3qL0VOVdNZ2Ru8sW55Rgf6hOKWCetJDdIO?=
 =?us-ascii?Q?B6lMOjEE/PDFLFi1eV42EglHKC2CYqE5iQJerQcmTlvlNes57aq1n7Y9B9ku?=
 =?us-ascii?Q?uppCWCfanDLa7JzRM3Hld2tZG2cB2uWii5syKPuLsibVwPBFSaYrrrAcmXON?=
 =?us-ascii?Q?5NALj0ePrCREVu2N1QRP0B0DjEx+JQNAhIPwqkcIzUZLyznhRgKZm93S7fDp?=
 =?us-ascii?Q?LQbqE9FjmHBjmQf8lyL7Cshl1VIHA9xKbGgk2B5vEWK43FswqFpqZ42be0LE?=
 =?us-ascii?Q?CKgHZ0pNSSLS5PTNPNR+D8pM2apLUZzhBVkV+iyyI/gKB92coBFqfCqHb3W3?=
 =?us-ascii?Q?qOGG3cMZpL9KjUUdbyNlanPkM9MtKWfIO+xOB0zwgtYcR7LP9a8NFZ0eqP9f?=
 =?us-ascii?Q?yZ/4j+lglGlReROPcyMYUnlR73kECV4Xo6/5NLteIT/et0Q4mccY14YL+L+R?=
 =?us-ascii?Q?CgZQv8uelcOfv27Mwkz8ZO1fD+KTFPsCdI0WA/g/U/y7lJBr8UcXdDsnFe0G?=
 =?us-ascii?Q?o+RnXRDSh6KaO1qiYGyfqesZ4qr0I1Wz9L0ZG7NCWxFz1O7Bv71756mTib4v?=
 =?us-ascii?Q?x6oO5wePlfNfe9gA17MVfaITlSNZzr4LRS2Zw03JUOSLUezkdm+H74EeBJ0R?=
 =?us-ascii?Q?QFCmcry+kwyTV1e5GkyVFdT0Nc5Rx2zugm1vU81lRItYtxC2tkAkUuTmCTcH?=
 =?us-ascii?Q?gKJdZu59yhTfxO/6lMjy+9lDJvsoHP7ITC/3iTgtCexop/EdluQYitsMD/HY?=
 =?us-ascii?Q?UuZXC/mg4+IzQmIjgIGo4DYjVwVOp7s14k+FEwIO0/qTueZh82xqNq6x6VLu?=
 =?us-ascii?Q?LSTRCGagPLxq1m2WFhP1hKnETtwIwkXji36lAchkk3GI5mvgyQuD?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8545b431-734e-453b-b37a-08df4d2aa60b
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2026 08:36:08.0423
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ay7w4lpgGyQ2WijrEhealvvH6KdzO9hUnCu+L0U55LaJU19Y/j1vSHGhZexKsXWIXqrJV04y/CYO9iGeqPlv+khYrnZgGiB+cWS9YrTQkhu9rR7inx8RMiwQj8kWNYPQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1313

Add support for JHB100 System-1 clock generator (SYS1CRG).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  | 10 +++
 drivers/clk/starfive/Makefile                 |  1 +
 .../clk/starfive/clk-starfive-jhb100-sys1.c   | 89 +++++++++++++++++++
 3 files changed, 100 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys1.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index cb246ae12c08..324a04f0880b 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -82,3 +82,13 @@ config CLK_STARFIVE_JHB100_SYS0
 	help
 	  Say yes here to support the system-0 clock controller on the
 	  StarFive JHB100 SoC.
+
+config CLK_STARFIVE_JHB100_SYS1
+	bool "StarFive JHB100 system-1 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	imply RESET_STARFIVE_JHB100
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the system-1 clock controller on the
+	  StarFive JHB100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index d2ba83d7d02c..0061550e0f7e 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -12,3 +12,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_ISP)	+= clk-starfive-jh7110-isp.o
 obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
 
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys1.c b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
new file mode 100644
index 000000000000..926dec7bf5a6
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys1.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 System-1 Clock Driver
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
+/* external clocks */
+#define JHB100_SYS1CLK_OSC			JH71X0_EXT_PARENT("osc")
+#define JHB100_SYS1CLK_PLL0			JH71X0_EXT_PARENT("pll0")
+#define JHB100_SYS1CLK_PLL1			JH71X0_EXT_PARENT("pll1")
+#define JHB100_SYS1CLK_PLL2			JH71X0_EXT_PARENT("pll2")
+#define JHB100_SYS1CLK_PLL4			JH71X0_EXT_PARENT("pll4")
+#define JHB100_SYS1CLK_PLL5			JH71X0_EXT_PARENT("pll5")
+#define JHB100_SYS1CLK_NPU_NCNOC_INIT		JH71X0_EXT_PARENT("npu_ncnoc_init")
+
+static const struct jh71x0_crg_clk_data jhb100_sys1crg_clk_data[] = {
+	/* root */
+	JH71X0__DIV(JHB100_SYS1CLK_APB_MAIN_SYS1, "apb_main_sys1", 12,
+		    JHB100_SYS1CLK_PLL1),
+	/* sensor */
+	JH71X0_GATE(JHB100_SYS1CLK_APB_SENSOR_ICG_BUF, "apb_sensor_icg_buf",
+		    0, JH71X0_INT_PARENT(JHB100_SYS1CLK_APB_MAIN_SYS1)),
+	/* hostss1 */
+	JH71X0__DIV(JHB100_SYS1CLK_GPIO_ESPI1_EXT, "gpio_espi1_ext", 14,
+		    JHB100_SYS1CLK_PLL2),
+	JH71X0__DIV(JHB100_SYS1CLK_HOSTSS1_NCNOC_CFG, "hostss1_ncnoc_cfg", 12,
+		    JHB100_SYS1CLK_PLL1),
+	JH71X0_GATE(JHB100_SYS1CLK_HOSTSS1_PHY_SCAN_1000_ICG_BUF,
+		    "hostss1_phy_scan_1000_icg_buf", 0,
+		    JHB100_SYS1CLK_PLL1),
+	/* npu */
+	JH71X0__DIV(JHB100_SYS1CLK_NPU_NCNOC_CFG, "npu_ncnoc_cfg", 6,
+		    JHB100_SYS1CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS1CLK_NPU_CORE_DIV, "npu_core_div", 10,
+		    JHB100_SYS1CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS1CLK_DOM_NPU_CORE_CLK, "dom_npu_core_clk",
+		    0, JH71X0_INT_PARENT(JHB100_SYS1CLK_NPU_CORE_DIV)),
+	JH71X0_GATE(JHB100_SYS1CLK_DOM_NPU_BUS_CLK, "dom_npu_bus_clk",
+		    0, JHB100_SYS1CLK_NPU_NCNOC_INIT),
+	JH71X0_GATE(JHB100_SYS1CLK_DOM_NPU_INIT_CLK, "dom_npu_init_clk",
+		    0, JH71X0_INT_PARENT(JHB100_SYS1CLK_NPU_NCNOC_CFG)),
+	JH71X0_GATE(JHB100_SYS1CLK_DOM_NPU_OSC_CLK, "dom_npu_osc_clk", 0, JHB100_SYS1CLK_OSC),
+	/* vout */
+	JH71X0__DIV(JHB100_SYS1CLK_VOUT_NCNOC_TARG, "vout_ncnoc_targ", 12,
+		    JHB100_SYS1CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS1CLK_VOUT_PIX0, "vout_pix0", 4,
+		    JHB100_SYS1CLK_PLL4),
+	JH71X0__DIV(JHB100_SYS1CLK_VOUT_PIX1, "vout_pix1", 4,
+		    JHB100_SYS1CLK_PLL5),
+	/* bmcperiph3 */
+	JH71X0__DIV(JHB100_SYS1CLK_BMCPER3_NCNOC_TARG, "bmcper3_ncnoc_targ", 12,
+		    JHB100_SYS1CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS1CLK_BMCPER3_CFG_125, "bmcper3_cfg_125", 10,
+		    JHB100_SYS1CLK_PLL1),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_sys1crg_info = {
+	.clk_data	= jhb100_sys1crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_sys1crg_clk_data),
+	.rst_name	= "jhb100-r-sys1",
+};
+
+static const struct of_device_id jhb100_sys1crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys1crg",
+		.data = &jhb100_sys1crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_sys1crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-sys1",
+		.of_match_table = jhb100_sys1crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_sys1crg_driver);
-- 
2.25.1

