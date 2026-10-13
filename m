Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2111.outbound.protection.partner.outlook.cn [139.219.17.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05EEE511E81;
	Tue, 13 Oct 2026 13:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.111
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791897413; cv=fail; b=rBWwOCXViR3Ftt53DaNKp6A1JuRGYuFRWT+IcQ9BTO9MOSH//aY8WHhAttPe8ixvil0aQvYaWRpJt4URpSd84eXHRWzCQnpY3+x2c8y1QmAJqhQyn208a1bDtWEnRf78NpdwicGDj4Oup+6IqfBVOFPyuZGPxjVV7nbPFI4RkbI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791897413; c=relaxed/simple;
	bh=rdAa5Y7XtUZ8yrKtylu6WX2dxk4L0AnubgIPbJ5tjxw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=k4ubJd+dMQ8y1rtIvFa74ZdyqzXUC8oUCkKhB3ss2lDpRcSwMK8NPaX4oeMDKdqitPRHiiSvXTNfJNkeEUhU40igZARuvswi1/AKXVdI6Rb+F2uGfveOcwvJXIdVupR9l5uhBwz29OPsYGwTy1XsD/Z/5l7UcBwUCNxzm0/a4S0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
Received: from ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) by ZQ0PR01MB1238.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Tue, 13 Oct
 2026 13:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CV7I84Z9Lltw6PBcPv5hHE07QnZf+QOkdOw+Hq6b7ajvR7QRZC4voI19hmOdCVfzdKV+Qo+Smu/N6e9dQHQ/SdnJtfedVU8IlJmM9UACsQHsuq+y+BjsXN/XLdeEK5Xsv5hSEuNa/lEPHeqxkr80GII3kuicRkpkFbI/1KkfSzr2WPSISMcluE4+mytE+lq9EDxJfbk+QRX7qUOYKHC03KLzrltWMJL4O3cGpgncrCFCkCW/Nwv7o+pps3b2Raqd0ai73c1gwKYJoVkJgrAO6pALyqOEnVAKACEzVP0a+TfNDddbY87YWz6fKYM/pRb/3Kb3LO7KuN/+r+4Oo+DjzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tXA78mfVht5mlLE+3DgLVNzjWH48SBT3fe30PlRu4c0=;
 b=LrPTuRSuVq1VaU8zUHb3l2+hQufRj9ALKbQT2r3OtnBYM678Nnf1HwN6y/yZVSdSsKWlvEpgeGxsOJ+b8DVw9nzbAWZbbhjN2NX0ZGY3U+epPpudkTUYtXj1HTYowIQqWO6kBM7FzeNxnO7Bwy66GCoLAG8BZmR6MjPzHNqYTtbJ67lSaD/LuaC5qdg3Ok7iaeeOK0dxhLEv2pzLxRBex4saeHm4PparpYrx8iIY9hEZ2Z/ChxdNIGfOTXMlP2x5UhmBTi5FD7yFnFDPqJ8T3l/+15Q+xT6SHYfv8nDw4kSJ6oSBDyy3xg2IdZ4obg02Rsu5t161GFhFESPpDFkIuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:27:24 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 10:27:23 +0000
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
Subject: [PATCH v1 4/6] clk: starfive: Add JHB100 System-0 clock generator driver
Date: Tue, 13 Oct 2026 03:27:05 -0700
Message-Id: <20261013102707.9207-5-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0027.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::20) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic:
	ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_|ZQ0PR01MB1238:EE_
X-MS-Office365-Filtering-Correlation-Id: b7214522-970b-44e8-748b-08df2914922a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
 4RSfVhEXXE5uF1uq+ayjGsZtrJkwM5riC6ubyl/f+zKMv29Tdots2tjJKquc6e+htmMFxrqf1mDAK098+TQelDN1sOQm1dELRPrWbK4yFjR+LVm7zRiv2zQThlEZoRVLPSwequE1cSwdDl0Ch6BQKWNbAf6YHYt8ORG4XEHBP31xFe2EtYiIVb6EF2Oh7fNuiQ1dRZCz4cfmSv55TT8ROeBZm5I6jjJIMAvJ+5crK6CDoQmRBxQ/LeVOwq6ufe3XRwsqkfUXiXGmtG7Ag5PmNherNAKLmZobLZZIHEF6myMn0BrzxLkRC5KTAefYXi+MXivw6aAAlEAFx76ZzPMczkojXhP6+1t5SIswJpHI3YyLUoQBf9+7qYG4xmAjtIrwrZJyMTpScpUfJlWRq/TLf2DTVRbhIlAlOm1ygHGZ6zQqOYwbqMnmKYlXslBemSF365QPfQt6t3oozSCPNfRzquai2ZYTATiaQ6jn2chfGe1VV8YMXyFWi0Al8L+ntbCSzzqxO4KLw26BDnUU8MSV9w6KkaHSbgOedw+XCBb8vnnETDL0DOKor1ml9IILAnfk
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?4ejKaw7XG6JG1G9pDc9Lczt+psGQ2iXXT/jdpbB18EbB1jdTzMzmeSlhG3d1?=
 =?us-ascii?Q?/2cZgGGwM0XXUYSD7LQ6pqiywzg1M84daCv65psqMdUNTrbnWVMHv4tZZIyG?=
 =?us-ascii?Q?HSfYIL0S4eqLfIchkNaWsBYc/ToWar2QYWSHI2Cgu5vMMx27EQ27DfpSQAhh?=
 =?us-ascii?Q?g3Jn+zTpTj4LYYObNCnes3aRRwGOZu0ZlKuMxVSCnIrlJGPSeOoNVnD7n0pc?=
 =?us-ascii?Q?hgdaFwHUUsva9d2OpJ9g1DmoyJ2BwLhpysbcuJqmVQ8AIE12MUPW8MxpHn/y?=
 =?us-ascii?Q?IaTQxfx8oRlXHV7CpjPfxeIgZ302EfDXMNK1PqBqM1WvlyP7gV7DQN8Mwlup?=
 =?us-ascii?Q?ZNqRbQsSij0lsPV8N4CrLa/1XKyeEBOS8KUxHmDmf31fqPqLeLSwaBKB+ER5?=
 =?us-ascii?Q?LA4cwri/rNmTHAlKqSuAwe8OdCdy1lL6veRsytYmHh5C0m4nrOkRCWiR307P?=
 =?us-ascii?Q?w5ntaVWcP7LWkNYTCRs8bj8W46qO/UJcRuBadse8Ca/GBmzGDELYyNhy/WSx?=
 =?us-ascii?Q?nlnJDoSVdV+D7x/71BfCKW5qLVGog3ubUry+m+0Yk9zWflPdcOgOw/C1mqqh?=
 =?us-ascii?Q?Y8+ENj5NHVtXJjHwCgowGmh8nX+f74NZU8ew6CeZEicwapTVcIWwSUnaJPJt?=
 =?us-ascii?Q?QtR76oK4DdLQpmz7/f2p3bhwSrBqv1HB1cvIjPIklpILmz0UtKGxJ6Ae/a8s?=
 =?us-ascii?Q?XVYWwSkDiPS6GxSda5xOuf+YdngoUQQ+mFMR5v1gsVBL3Z5KT4Ycbxw9jIxn?=
 =?us-ascii?Q?AWL5E0zP95jZDQJqoMc274JwdphBaF8+QRVToAdtZTDnfG5lD8ZIk9I0Uzhv?=
 =?us-ascii?Q?AWwCkay2JXMsWr73eAlhxNiJIla9fqoBvkxIme+GWARYmg634kPN2dK6UUBh?=
 =?us-ascii?Q?xpfyXWheURNkVSIX1pbamYsSf4/PWV76NgCC6w5o5oDBOeaeyVNagtnWnkGp?=
 =?us-ascii?Q?p4CEjLd1yvPDbjk2AowK1Yupq6iLeO1oXraQgKHgMFugskhAMoVo90HtC1B4?=
 =?us-ascii?Q?MA/ivrqmn2Pq6MzMegh4vSMo2YN5h45yXq/fGDRqkwxbbO+sZvvRxhhPSEFz?=
 =?us-ascii?Q?nJGlJEbJWiMODqGIL3FUm92kcI9/OwG/dcedbhnyjtLG204alcoqrrRPP6tQ?=
 =?us-ascii?Q?RwqvB+2s79dwiWjBLrkyJO6QtUXvmdyrP3+6MkSe0vCKi1eJB06LXdSxEmV2?=
 =?us-ascii?Q?AZp+wQcKq7TgTH2Vniz7K/bb5qPemjR+VL4lkhJcoO9XgovTDKeZnVemLDvf?=
 =?us-ascii?Q?p+AEMSGguh72JyU36VmSEqzYt0ghkLjwKhAzTZ0wC0kBeo3R5nEw2v50g4uo?=
 =?us-ascii?Q?+l0aSTSKwkbsL9IXHMWBX8CnZ1vclLgqa0SKYzciYh2sTfhbs32r7gmlN4sE?=
 =?us-ascii?Q?BEJKswO3HO3wSe+/pNLSffxRObTMSSIDkb65dt3yf1e2NJCD0apywaZHBDH2?=
 =?us-ascii?Q?HNIS6ps/eg6CvLcj8jkO/GRdfCy1xjOZl9jOGb2IObiyVO7C9sbcMN5NrB3f?=
 =?us-ascii?Q?TuNADb4F55oQH1eMVpScGteToqLcFQvttUTrdEf85iG+WdH35NcLmw+eyHCN?=
 =?us-ascii?Q?b+2EOGIRBCo9fhLTdnlwzQwfrcHjre67j6vIgFIayt02ppWdJwD0tUSWtpHt?=
 =?us-ascii?Q?WJwDqGlq5ZXuxj/khIDZZRBpqsVd4RRmDl2Kn3FdUqqJ+4gzw6ZEw6m50ZCe?=
 =?us-ascii?Q?6jLjucXTHw2+XW2EWbZDdRncU0wJEts/uAYRSeE/8zT7nfK0yFKbGpeuy7ZP?=
 =?us-ascii?Q?GdkkfUxLDpMpSkghYgvgjWvDzbyY/x+NTtiQtzaSPufTB5wKczc6?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b7214522-970b-44e8-748b-08df2914922a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:27:23.9351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFDTVxc4S0K2u6oMD+sDTqHmyPqbFiL6CpAYmaXqLfhRy9557z/c4Tqxx13kjiZSOeIU8RLzbXXrB3LFVX62cp+aRBfm01JGPepFEYir4g8iWoa+dla/Hr/J3jEJaBvh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234
X-OriginatorOrg: starfivetech.com

Add support for JHB100 System-0 clock generator (SYS0CRG).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |   7 +
 drivers/clk/starfive/Kconfig                  |  10 ++
 drivers/clk/starfive/Makefile                 |   2 +
 .../clk/starfive/clk-starfive-jhb100-sys0.c   | 148 ++++++++++++++++++
 4 files changed, 167 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 66d6c15f1dd2..dff8b819f83e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26217,6 +26217,13 @@ F:	Documentation/devicetree/bindings/phy/starfive,jh7110-usb-phy.yaml
 F:	drivers/phy/starfive/phy-jh7110-pcie.c
 F:	drivers/phy/starfive/phy-jh7110-usb.c
 
+STARFIVE JHB100 CLOCK DRIVERS
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Supported
+F:	Documentation/devicetree/bindings/clock/starfive,jhb1*.yaml
+F:	drivers/clk/starfive/clk-starfive-jhb1*
+F:	include/dt-bindings/clock/starfive,jhb1*.h
+
 STARFIVE JHB100 EXTERNAL INTERRUPT CONTROLLER DRIVER
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>
 S:	Supported
diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 51716655554f..cb246ae12c08 100644
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
+	imply RESET_STARFIVE_JHB100
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
index 000000000000..dd4d65f4e682
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
@@ -0,0 +1,148 @@
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
+/* external clocks */
+#define JHB100_SYS0CLK_OSC			JH71X0_EXT_CLK(0)
+#define JHB100_SYS0CLK_PLL0			JH71X0_EXT_CLK(1)
+#define JHB100_SYS0CLK_PLL1			JH71X0_EXT_CLK(2)
+#define JHB100_SYS0CLK_PLL2			JH71X0_EXT_CLK(3)
+
+static const char * const jhb100_sys0_ext_clk[] = {
+	"osc",
+	"pll0",
+	"pll1",
+	"pll2",
+};
+
+static const struct jh71x0_clk_data jhb100_sys0crg_clk_data[] = {
+	/* bmcpcierp */
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN, "bmcpcierp_ncnoc_main", 6,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG, "bmcpcierp_ncnoc_cfg", 12,
+		    JHB100_SYS0CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS0CLK_PCIE_REF_CML, "pcie_ref_cml", 24,
+		    JHB100_SYS0CLK_PLL0),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_DATA_INIT, "bmcpcierp_ncnoc_data_init",
+		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG_INIT, "bmcpcierp_ncnoc_cfg_init",
+		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_CFG),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_NCNOC_TARG, "bmcpcierp_ncnoc_targ",
+		    0, JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN),
+	JH71X0_GATE(JHB100_SYS0CLK_BMCPCIERP_PCU, "bmcpcierp_pcu", 0, JHB100_SYS0CLK_OSC),
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
+		    0, JHB100_SYS0CLK_BMCUSB_SCANCLK),
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
+		    "hostss1_phy_scan_400_icg_buf", 0,
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
+static_assert(ARRAY_SIZE(jhb100_sys0crg_clk_data) <= JH71X0_EXT_CLK_FLAG);
+
+static const struct jh71x0_crg_domain_info jhb100_sys0crg_info = {
+	.clk_data	= jhb100_sys0crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_sys0crg_clk_data),
+	.ext_clk	= jhb100_sys0_ext_clk,
+	.num_ext_clk	= ARRAY_SIZE(jhb100_sys0_ext_clk),
+	.rst_name	= "jhb100-r-sys0",
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

