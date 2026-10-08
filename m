Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FE249B5D1;
	Thu,  8 Oct 2026 12:35:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462926; cv=fail; b=spGiLm5xLxzaDMiVahEWIDv9qg/ZFHqqnkIngWgpAXVp5hIGzfMvnewaEXUn+aXDCcZprXJAXGlop5iyHIbjnb2Pp04Ucp0TnQHfXRnTLcfa6VPQcgtFzU9MSPkupTuZdxMcVRERwnvV8ulfW4zr7T0o5dBDatRLTdBJgcy6wc8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462926; c=relaxed/simple;
	bh=acmxda+y9pjPeeWUzjH2IZ0iWUBuJ55y9Kht2IFsNbo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XN3YJhd5D5DVeSHhoqdWZ9h2J4bRj298rXrTGni5xmR4CSVXBvg95FELWOF1eclMjDOdy6ts+x25+wqPAuK/3j5kp0OKihU6QQQCze+biGWz8m5gJFmayHbeZfpFsdRu8Q42bG/72x5xm7zrZDD+VPE6zBKz523O13dXN7t9EBE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DvVwXYbTEroLNxuN4pjrHxc2YuAo3Eyjk8cBh3S+n7kFLQsTavInbMvHUHFmII3sZfLNUjTv0lZ3nT8mTriZ9w88SKEFKRBb+CYXtNf+hrvMlzJeCPwm6pTXAC3PggF2xAE5qvTdZqevFdGQof5ktGXGWPv2t4+hDrRUoyTE/OJhSGOzn+w4pndSHviUJvuhqZ1p4bmEJ8g5E1Uh2+K3rb7ZxTri1bn4MZ1pS8gUYOoOhhKZLltyfoui60JZ+NnGfr1LkuBCJbr24ZmhK26O0sLf2gi6OsMF+qxFGhWfdZOC5BlSWvMHMKkqvO2gEQyTcxmQ1C2QT2HtrGkV0hK3wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJ2wf9/FDrQk6fwg6nCVHSeFpYBIeVd5UQZrzk388q8=;
 b=lXtLaCuTPSlnuweZctimsBGzxgdXHKOJQm/nBF+7TbjOYIb4WpjbPYduBFD1EAFGncv7tW3JA3U7/YVUfVsOzkTV8hSAGksvPGpxemLS8Um1leyIpuFtEwemhYanIzlme2o566AbPZaPWI8CkktnR+XIrWI6lB3t4unoWorXgSNWFHozHvzB5B+pgl3XWFijLuZ5z0n/YTNjHIHaQDk/HwLN//G6zd6d7EQAaJTHYKiFPer1wyA7kSvsYaXCU06TdRsH8GkZBSPXEA6UTyl5ZxbqU15mQ3LEo/+wvI3zLxVoC9XykvUgjZPN7KBYb6zrQCQPn9lpOosN8N+DnuW/UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:34:03 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:34:03 +0000
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
Subject: [PATCH v6 13/15] clk: starfive: Add StarFive JHB100 Peripheral-3 clock driver
Date: Thu,  8 Oct 2026 05:33:36 -0700
Message-Id: <20261008123338.11081-14-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: a5f4c574-97a7-4710-8950-08df25386fdc
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	ifvN94E37lDI2JCKw3ECzrWDxlH7qvrsicZlzDQ1bq2xbD9naJYfzdYO55BECmLFhfIptYva863LCaROr7o7zlD8KDsYjKmu6vA+M8cG2trjb+Ljz/wyQ6NP8nfizUNIV3WvOTp5GIpKv40mc/6OSQp+dw5jjy4EITcLae0rEYur4c+HQQF2PWvCFQ2Fkn12SCGjeIx2QfbUXoFE3OjIhxgmsltxwz2h+N+RDctGHNVlobJTjxh4aBD5JeMH6DXzinmJsaHwdQ4mtKe9I4MmP7j5UJFi1lfIBrm67oWMeN/CG984SSzJkjMfN8KqHv8OZhGDyfdMVhQsqXk9kqm64+niikqtY5IVYoLdJldKKTPxSDzy8iL+dZP+/pTIlFrcAUnTVgiqMBQEtxM1ZjvoXDAQXpIWd2ANSB79zfj4GCgasv4J+oqb8YU5RDVDtgsAtv0ZRc4HpfR37+iBHGZDnQhnqSgpFaEq4KIa9uM7lEnDUS37PZjlopXCiWfQI4PZLx4jYSWbyDbu3HHLcmlz7pWSKktn0sK1meCAxpBcGwPy5ARpMpSUf/33BORfC3qx
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vs8+Bw7/Z814VuqgTGRRky1KQIeCzarpch9kqK/pt7qRjNwxvK7pJRHDrERp?=
 =?us-ascii?Q?Lal0HPrAk8F9KtChssDSp/qEb20mPmPvIX5B25EuYY3E6ZTpBRuKr4z7qnY/?=
 =?us-ascii?Q?9UAqVhwdCY/OCn8wUpvo9mJfhjpPVs4lz0hSXxaeq+SKJrUHKskA0S5yoGtA?=
 =?us-ascii?Q?+kjP50zMfpLOeg23DdGLIUMmLI1TiEwVd+PaOatdnEL4SVDJ9rf8zDhReCSf?=
 =?us-ascii?Q?vSFfq3k5LZ+F+ywB9I4fYrop02lwYIlS9R8TOnSF/0J1/vHKT6O0gRsOa7o2?=
 =?us-ascii?Q?LmAN02vCA8JfFRolh40edjt0q6rY0fvSrXTD3FqQLtTddzOE8W6zbQjdil+0?=
 =?us-ascii?Q?4GrlDuL4CgbNGehCaiotR2pH/sqYuAJUSvUkeSaQ+dnv8+vxuAvRzmtQspTa?=
 =?us-ascii?Q?iFtgwGGcV3scuKgQVuZ5DAGzh2FLu3lELTiv3zMFdhmhS46bXUSYLM9H71Mi?=
 =?us-ascii?Q?hvg0KDxaSz79O+pk58IunMkVwgNIq8bMJSXQiGvBeahhp+qfcNSHLVzo+IxA?=
 =?us-ascii?Q?OYnjugEbtcUjILk9gI2aWrJWB7dple+PRMdlrWBi1QRxFQjw6dCFFn1zDxIC?=
 =?us-ascii?Q?fy6iskrKuyH/w72+hgVWPUd30i2pOTNHFK4LBMsKOIEV2OTvAVN0If7p97qC?=
 =?us-ascii?Q?vEAPZ8uNHvzG+pTiCt8+c1YrK3aBaeVc6/K4YLYNH/zAn+jqrF71GG2inOx9?=
 =?us-ascii?Q?GoGmRghfDDqybtP2RiUuzl2/N0r/yidASQDuzYO3stiHcBPJjz6V2F9yUf1E?=
 =?us-ascii?Q?cpgHHS1GKAlVV5GvVG6k/Tl2X3+G4fjZZoUoz8ik5iAouMoW+1Gsrt5XhEzN?=
 =?us-ascii?Q?YSOEK42Pu62pY8YLXADJnxEw+9Y0EXRNdGfSS3ipfqyjqg6J0NkXUaX5wQCg?=
 =?us-ascii?Q?is9jaIO0jwZmwIz2sdKZQAi6+mEbuIfKej4Lc6JxUbdh1VXXwQuU+Oys4Ldz?=
 =?us-ascii?Q?f25tn0f1F6LdWj56Puybnxslg1FOeXLsnlCbXwmOYYC6fKnd4dbpk0D/Z+F4?=
 =?us-ascii?Q?3t/cAwsXUDPAXfkJ3oP+f/M9jkBZEvtPpu+xS7btT3f9kpohlkOdHUJEm9up?=
 =?us-ascii?Q?5rfjKIF1E9N3YuexcChhHY15wvYy019XQnxYfrUVh3kjVac2aIWteXa/59Oz?=
 =?us-ascii?Q?RwPx6f9aD8t+DX7T6H6PuNZ3UM71JwkiWmhTreYT+YkSdVuJQtG3XoGYNuvX?=
 =?us-ascii?Q?2NHhLoc8In+twA7l2XOFTwFcqdCGwgUHbNr7vMU2o+QBKsxiOS+YXQhfQ6Zg?=
 =?us-ascii?Q?r6GieihYIizoqH/UWSCREKNszNZ3OXeWzewMxVQbTsgMsD8wyRRsn7Nr3P/D?=
 =?us-ascii?Q?zZka4XeQi4+1lBAGWcthc7K0MjCQue2KM+fWORPGUJu9Us6Tmlaoa65ioW5U?=
 =?us-ascii?Q?kpbDTM1odmqLTdh8BqCtyLp+642vSaoPHpBXC5n1pI+DLElq1lPH3kFIwOhL?=
 =?us-ascii?Q?mr/YqedA/DalySHL6k4j88N0HBlNFbYy/wLshoeV6lKwV+zW9VJRHtFZF3//?=
 =?us-ascii?Q?A3JPOWlip4Rw58SupTS8FkblnjedFPsddzQhhnthAhBMbCqOARz+fwykVUzA?=
 =?us-ascii?Q?qoK2yhVpuvJZzZJLfTy1jR3AkUz82Vdskg+SCmaj2W9bPFKUdmkIObXILeC1?=
 =?us-ascii?Q?Ct8W786ZDndUmEVQ1gj91XWdHL3fE/IoVcvmFOfqnLTt37hjq5o9/S6nWMAH?=
 =?us-ascii?Q?0/Yk7FTnTR+dTHTt6qAXrTd1rnGEDGt7FOhsPIY7NYXKLSB+AwpPYXoXWurR?=
 =?us-ascii?Q?Ib6ApiEgEqj9YeohejwzoJGwDL/+F32m+u2s6lgd3+nUWOE+EByb?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f4c574-97a7-4710-8950-08df25386fdc
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:34:03.6165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lTHV7f4PCiuJ0XL09BJMDX/0Bl7cV1VLl2TTFvq0C0A1D95lD62sBpm4GXycjtH+eV9SoJGTv41d1z4yWyqTkMeTiCnPNswFCnBkz8zGsGpXTVGZnwnCiIoujDho6VRc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Add driver for the StarFive JHB100 Peripheral-3 clock controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  10 ++
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-per3.c   | 140 ++++++++++++++++++
 3 files changed, 151 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per3.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 57a3838475e9..1c9dd5d47cb8 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -103,6 +103,16 @@ config CLK_STARFIVE_JHB100_PER2
 	  Say yes here to support the peripheral-2 clock controller
 	  on the StarFive JHB100 SoC.
 
+config CLK_STARFIVE_JHB100_PER3
+	bool "StarFive JHB100 peripheral-3 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the peripheral-3 clock controller
+	  on the StarFive JHB100 SoC.
+
 config CLK_STARFIVE_JHB100_SYS0
 	bool "StarFive JHB100 system-0 clock support"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index ca9347d38023..2c4554c2e70e 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -14,6 +14,7 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+= clk-starfive-jhb100-per1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+= clk-starfive-jhb100-per2.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+= clk-starfive-jhb100-per3.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per3.c b/drivers/clk/starfive/clk-starfive-jhb100-per3.c
new file mode 100644
index 000000000000..aa023a74ad72
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-per3.c
@@ -0,0 +1,140 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 Peripheral-3 Clock Driver
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
+#define JHB100_PER3CLK_NUM_CLKS			(JHB100_PER3CLK_MAIN_ICG_EN_GMAC1 + 1)
+
+/* external clocks */
+#define JHB100_PER3CLK_NCNOC_INIT		(JHB100_PER3CLK_NUM_CLKS + 0)
+#define JHB100_PER3CLK_NCNOC_TARG		(JHB100_PER3CLK_NUM_CLKS + 1)
+#define JHB100_PER3CLK_CFG_125			(JHB100_PER3CLK_NUM_CLKS + 2)
+#define JHB100_PER3CLK_GMAC0_RMII_RCLKI		(JHB100_PER3CLK_NUM_CLKS + 3)
+#define JHB100_PER3CLK_GMAC1_SGMII_TX		(JHB100_PER3CLK_NUM_CLKS + 4)
+#define JHB100_PER3CLK_GMAC1_SGMII_RX		(JHB100_PER3CLK_NUM_CLKS + 5)
+#define JHB100_PER3CLK_OSC			(JHB100_PER3CLK_NUM_CLKS + 6)
+
+static const char * const jhb100_per3_ext_clk[] = {
+	"ncnoc_init",
+	"ncnoc_targ",
+	"cfg_125",
+	"gmac0_rmii_rclki",
+	"gmac1_sgmii_tx",
+	"gmac1_sgmii_rx",
+	"osc",
+};
+
+/*
+ * Regarding the CLK_IGNORE_UNUSED flag:
+ *   Clocks flagged CLK_IGNORE_UNUSED are not consumed by any driver. The flag
+ *   keeps them in their hardware default state (enabled) instead of letting
+ *   the clock framework gate them once it disables unused clocks.  If this
+ *   flag needs to be removed later, it must be ensured that these clocks will
+ *   not be disabled even if they are not consumed.
+ */
+static const struct jh71x0_clk_data jhb100_per3crg_clk_data[] = {
+	JH71X0__DIV(JHB100_PER3CLK_300, "per3_300", 256,
+		    JHB100_PER3CLK_NCNOC_INIT),
+	JH71X0__DIV(JHB100_PER3CLK_200, "per3_200", 256,
+		    JHB100_PER3CLK_NCNOC_INIT),
+	JH71X0__DIV(JHB100_PER3CLK_GMAC1_PTP_REF, "gmac1_ptp_ref", 2,
+		    JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0__MUX(JHB100_PER3CLK_GMAC1_TX_125_MUX, "gmac1_tx_125_mux", 0, 2,
+		    JHB100_PER3CLK_GMAC1_SGMII_TX,
+		    JHB100_PER3CLK_CFG_125),
+	JH71X0__DIV(JHB100_PER3CLK_GMAC1_TX, "gmac1_tx", 50,
+		    JHB100_PER3CLK_GMAC1_TX_125_MUX),
+	JH71X0__MUX(JHB100_PER3CLK_GMAC1_RX_125_MUX, "gmac1_rx_125_mux", 0, 2,
+		    JHB100_PER3CLK_GMAC1_SGMII_RX,
+		    JHB100_PER3CLK_CFG_125),
+	JH71X0__DIV(JHB100_PER3CLK_GMAC1_RX, "gmac1_rx", 50,
+		    JHB100_PER3CLK_GMAC1_RX_125_MUX),
+	JH71X0__DIV(JHB100_PER3CLK_GMAC0_PTP_REF, "gmac0_ptp_ref", 2,
+		    JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0__DIV(JHB100_PER3CLK_GMAC0_RMII_PLL, "gmac0_rmii_pll", 2,
+		    JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0__MUX(JHB100_PER3CLK_GMAC0_RMII_MUX, "gmac0_rmii_mux", 0, 2,
+		    JHB100_PER3CLK_GMAC0_RMII_PLL,
+		    JHB100_PER3CLK_GMAC0_RMII_RCLKI),
+	JH71X0__DIV(JHB100_PER3CLK_GMAC0_RMII_MUX_DIV2, "gmac0_rmii_mux_div2", 20,
+		    JHB100_PER3CLK_GMAC0_RMII_MUX),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_RMII_CLK_TX_I, "ether0_rmii_clk_tx_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_GMAC0_RMII_MUX_DIV2),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_RMII_CLK_RX_I, "ether0_rmii_clk_rx_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_GMAC0_RMII_MUX_DIV2),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_RMII_CLK_PTP_REF_I, "ether0_rmii_clk_ptp_ref_i",
+		    0, JHB100_PER3CLK_GMAC0_PTP_REF),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_RMII_CLK_RMII_I, "ether0_rmii_clk_rmii_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_GMAC0_RMII_MUX),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_RMII_CLK_CSR_I, "ether0_rmii_clk_csr_i",
+		    0, JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_RMII_ACLK_I, "ether0_rmii_aclk_i",
+		    0, JHB100_PER3CLK_300),
+	JH71X0_GATE(JHB100_PER3CLK_GMAC0_RMII_RCLKO, "gmac0_rmii_rclko",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_GMAC0_RMII_PLL),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_CLK_TX_I, "ether0_sgmii_clk_tx_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_GMAC1_TX),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_CLK_RX_I, "ether0_sgmii_clk_rx_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_GMAC1_RX),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_CLK_TX_125_I, "ether0_sgmii_clk_tx_125_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_GMAC1_TX_125_MUX),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_CLK_RX_125_I, "ether0_sgmii_clk_rx_125_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_GMAC1_RX_125_MUX),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_CLK_PTP_REF_I, "ether0_sgmii_clk_ptp_ref_i",
+		    0, JHB100_PER3CLK_GMAC1_PTP_REF),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_CLK_REF_25_I, "ether0_sgmii_clk_ref_25_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_OSC),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_CLK_CSR_I, "ether0_sgmii_clk_csr_i",
+		    0, JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_ACLK_I, "ether0_sgmii_aclk_i",
+		    0, JHB100_PER3CLK_300),
+	JH71X0_GATE(JHB100_PER3CLK_ETHER0_SGMII_PHY_PCLK_I, "ether0_sgmii_phy_pclk_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER3CLK_MAIN_ICG_EN_SENSORS_PERIPH3, "main_icg_en_sensors_periph3", 0,
+		    JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER3CLK_MAIN_ICG_EN_PECI0, "main_icg_en_peci0", 0,
+		    JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER3CLK_MAIN_ICG_EN_PECI1, "main_icg_en_peci1", 0,
+		    JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER3CLK_MAIN_ICG_EN_GMAC0, "main_icg_en_gmac0",
+		    0, JHB100_PER3CLK_NCNOC_TARG),
+	JH71X0_GATE(JHB100_PER3CLK_MAIN_ICG_EN_GMAC1, "main_icg_en_gmac1",
+		    0, JHB100_PER3CLK_NCNOC_TARG),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_per3crg_info = {
+	.clk_data	= jhb100_per3crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_per3crg_clk_data),
+	.ext_clk	= jhb100_per3_ext_clk,
+	.num_ext_clk	= ARRAY_SIZE(jhb100_per3_ext_clk),
+	.rst_name	= "jhb100-r-per3",
+	.power_domain	= false,
+};
+
+static const struct of_device_id jhb100_per3crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-per3crg",
+		.data = &jhb100_per3crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_per3crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-per3",
+		.of_match_table = jhb100_per3crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_per3crg_driver);
-- 
2.25.1

