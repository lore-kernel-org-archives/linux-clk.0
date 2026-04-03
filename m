Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAFF4370D47;
	Fri,  3 Apr 2026 05:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195421; cv=fail; b=JcLAUkxhiTHYroR5Y7wSH1OaX1+J+Dx5qV1ZaTN3uiCYkDyhP1sd1sudqFDW4ar2oNzCrMaOKZvJNwZvGLyQermOZa6OnnKOFKBgM+BUdWb3XhPuHWh7Zat57lRGe0wn9Z8QfjxbsiemgMp+dQcdsdeT+z7kB2cteh8f1N3KJAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195421; c=relaxed/simple;
	bh=Tah7z7TbrdlC1s7h+JNsGYg8jY3p8Y78Sft3Y2Dy064=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eVSuVobzvdrkG3ebi7/K9L6D6gu7Rg80k+fRZf7ZP+Ttbkn3bxbOudrS6/E+bMeiurebAYwYVI92lKmASA7/LGs9qt7JVFa5hxqLxxjdIDAvSac2vt1ehCoylfG+Jf6qEYlvWlYkiUzJX4K71Bj+Qw+NMyp8BwcOo/coahrYbQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hyuKmnUNTXhVhlQUZc/+NQEEN1pPKI+6rENWbsQpopN8qKkgs69oNCE7QD9CzG06bLENSAVk8KdZKcqbMsdJc/ae/xhe4J8H6/2EBYXI9j0iIa2Cl3fYHzoIYpq4JxJmPCtTTV8vSYCv0vknbhdn6BU5qeNWwIDiC4eVdJqPaOz9m0VfZQusODKQEAdj5tP9lCDtPIfj8z/+6l1WMkrGvFkUW4dS3TUTMWFpjtsZvwqzCEvdIwEJYN+HNgtzxubRALhvTv1SNFNlDMbTties2wvbq4na//hWbJN3GFwft0kf0iCjHT/z6NKwcfl86LiGvyWPgc1IwAwXz4jJuwN4Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1yPJfAQk8+shPJxt2K3PZExFJ3BPpC7yXXsPs52jHNQ=;
 b=c13uXoRBK7Tk7qTVdtMfKYHS/SA3GQgZaiTJIAyakBOc0+PPI0bEAYjjVqYfF1f4NKE1E291TGkcDG9PGh3xo/laXlRmXaECr07gTnBB3V/RLyKdBB6f8avyBJMS2wlyyAatW/6nSAPkAR2DI//FnPXORtYsG385f0/U7ospQ3zvCHMSlyGWrwPQMTfa2TZpNZWeL0S612DBHMUJJuSnu71oI3Mj8sLU2mi1ttKVcwBHYJGNV/SxfFP1pDrspOF3WQa7hRqiIVrH1plgFSLjWnIiQz5EOraDoYiVdgtP1P9oA0r9wm1QY3ite5eWnbL39F0Y5jfefg4P+Csc1+OYqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:12 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:12 +0000
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
Subject: [PATCH v1 10/13] reset: starfive: Add syscon reset driver support
Date: Thu,  2 Apr 2026 22:49:42 -0700
Message-Id: <20260403054945.467700-11-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: c8f30830-e2d7-4ae1-932e-08de9144df7e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	BZWzHgwDQS0793MQ84cGT1+eoZzHOutT8D6e46U6LPfnHg0NYYZdHHra5vv227t+gyP/DxYe5CgDprQM4r4asoegR0HMq0ZARD2GV0FHrZT84A5IlnKJErmWZ5Fpwsa0/U+d9Sd9QdxU6azh2PYIWu96ueUcx8GCaH+BnvjtFJKZ5jr7SbpV9gYlX5mGO8yMhsOrKuHgeOpeiWQUo5dqGX/jsYNauu+GDZbQ4KarE2cRbi0I4Jy1YV436am9mb/D/x58j8cSle60WzLL7jkIVrLe01fn76Q13wt5z3o2S4TXmGm+h2stlIvxruaOOoxezsbzWS/4+rMuKYE0sdrfj8TcnkEcw6/hc61EPOM2jWMjPArxA8JxYMvI+IYYDZcKxmbEnnnmkYXWMRghF4tEb8CUes0C2ndXBYro9kdKTEoST7ahYXJC3GI7zgCim5oADdYp+DRCYzEsOUoeuNlVeCpSWbDcC8XgaSIP5E4IKGN7wt1SJRhntwO52XAQtzuTYKYf1dT6lc3aH0hAb/sKRyn+uUiJT34Cl8mYtUJN+/kMoQ1sKgjb8SBksPINSTzQ144teyL890gpiGLkNjK3DLBsk9KYuXUNHVGVCit2SZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kV61ee/mcIHHNk7ztn5IIxI/L2UmkK7OBhum1shHLWlAmuff+qjVWqrRz0WI?=
 =?us-ascii?Q?VWlL6oTO/8Ws1yuznAqsJLcxYAbHPxr3yahsHVvtbjuOLqrGcfGPTO+uaOYg?=
 =?us-ascii?Q?Hh3CIBQvOJJ2GCEDMGf9V4yiH6qkCqmt6LfbJHhVofa9iVDgmEvcwNwz5gMV?=
 =?us-ascii?Q?EPfcg0+4RnlFTodB/26IRIR0svwLUFJLTnGMg+9ptXsJcw31MJjkrfrsIwPY?=
 =?us-ascii?Q?yeiGyo8kzo8fhQNKJvtvICmupqYcGFM9hAww0O/Cg8BrWfa9Am0WyzU60jqN?=
 =?us-ascii?Q?Pu3/k/Nb3LCXQlWKd6WM4eK+VSVpRza7osfMp+OEAOyz71unh7MWtB5ZcTQ0?=
 =?us-ascii?Q?2IpbLM0UxR0748XoEFDOe2qpqLw5y+WoG7AmeKk4pPrKm6dZsmxPUrD6bmAq?=
 =?us-ascii?Q?0yOyzN5Ir5Zq+68Qn0sk0E/ci7J0iSSp19qj/wWFci4RLTEXx2R+r+7r+HKD?=
 =?us-ascii?Q?ht7WyKrJR7xv9hY6iDdqBLCsHRxfZnlchdrvPhOtzl2lTioO6sZm/q/RLerl?=
 =?us-ascii?Q?YIiXFz/7h2BMbGyQegDRMrZUFolJ3gK23d9aaPLblqTrBFZO3F68Umx/8bed?=
 =?us-ascii?Q?DAsSiw3gU2oh7tC/UYh5pQvhOb4JajToKV19+DvdO+KlD2Siy6hVyVqoPqQ3?=
 =?us-ascii?Q?XRd8hJI0q9ySYPyHcXYpBCOZqFPDZnhS90WPcCgCT5ME1oHYPJPJL3SbEZVl?=
 =?us-ascii?Q?NdflOw3v6AbS1NtdPL2ykrkZ+gr//hY7mtD+5uqSocV61EDvULW6tFM5mDCX?=
 =?us-ascii?Q?CkyOgFjL5fv5FMqu+G83wkxsZjOwTzoayxzw1Sbgnic7RdkvFjNiRl4cah16?=
 =?us-ascii?Q?8EVNorsZwuf679ZQ21e19o5AG0ThFG/T2zOTz8RB8+iE22H7txhl7D8+13L0?=
 =?us-ascii?Q?2CI7GKIPlfqwUCsX1DWxEqDWKUngR/skEfaDgoUuPil5VfjdzkwRiuqP8Q58?=
 =?us-ascii?Q?DqjL/WPisPKkBsV/f7CCKq5CtTW7aIAB3DhcrWGxwn6fRMa6GndMwqhUcxjY?=
 =?us-ascii?Q?avEc+9N9LgNEzHoJOEjjBYqNjxwpFwQGYS5Ehq/RgeDumkfI4c7dcOiRnbzk?=
 =?us-ascii?Q?VS5os1+XDpAU2AOpx2HQKJdmed5edDkmL4vtxs7qf+WbR/xBkwI/WiSPoY4i?=
 =?us-ascii?Q?CZU0xUs2KgF/I0AU/NKnotres6Sni9lQ84GDGB4Jy6t+SyEaTUbp8zYZ2p75?=
 =?us-ascii?Q?4VZpUKMyVuDsljEGSLDGNqO4eMfg6AX7IpT4RVFo20qigQSPr4sihOgCJsYN?=
 =?us-ascii?Q?0kT6HPrX4v9X2PnmmmCWUfH2xhjNqSCIFROxTTdpZT22ENxrSZA+pWtZiJVC?=
 =?us-ascii?Q?wNRgOlrGjKx42YK2fNpWM7a81Xvq9Kk3y+l2saSKeSCRuts0s7IrM1DjA0Vn?=
 =?us-ascii?Q?0ZQ8Q8CYzgdrs6Z0AisjIvHN4qTGUX6cjR69EX+vBujIWWn/38lS6lzWYtbd?=
 =?us-ascii?Q?JbWjGSmsipQ/39Pzre66JKDQBJEfgRUqxsRDWq0d39ZY9BZi/vxQnbWCqxWA?=
 =?us-ascii?Q?TtrmRCFAYgaXmSb+AFoUPKK3xaBv246Q/qNd8LZ/1LEGmT8mLOIfEgr5Pcyn?=
 =?us-ascii?Q?1iPqDwYlzpA/tqHGo22O35/aDixwMDZ+gxbXRxHQLlnlCXLG/UeIu4axg7v5?=
 =?us-ascii?Q?GgZQKNa7A2ShPW3/ly9dvas64727Qiy+LQlf+Wmvro2duzmHVYgSQ4nEHENv?=
 =?us-ascii?Q?wk9rEcJhSbYzypeJLto6abQj2cPWwicTn3Brs+F6ElA9wUAZfQ+whI7r46Gd?=
 =?us-ascii?Q?F7wZXghbsIvdExQ54YJWqpcaHTY1b0y+ZS98valNa6jaI7F9d5SG?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8f30830-e2d7-4ae1-932e-08de9144df7e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:12.7976
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OFKu+EGSaaqvZoP4Ps/aqJ4uIZFCGSFKS2UJJr0ER4oJ/2iLUbHuNKDqypM1w2CCjRVLTRXvuoLxqtTqlSpfR/O7jUJH+8oqA53EGew4V9Q1i//8QeYDh5Hi2WRFIyAD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add syscon reset driver for JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/Kconfig                |  9 ++++
 drivers/reset/starfive/Makefile               |  1 +
 .../starfive/reset-starfive-jhb100-syscon.c   | 48 +++++++++++++++++++
 3 files changed, 58 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100-syscon.c

diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index 6f9a0f24f9b9..cd5ae9cad9d9 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -28,3 +28,12 @@ config RESET_STARFIVE_JHB100
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JHB100 SoC.
+
+config RESET_STARFIVE_JHB100_SYSCON
+	bool "StarFive JHB100 SYSCON Reset Driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select RESET_STARFIVE_COMMON
+	default ARCH_STARFIVE
+	help
+	  This enables the SYSCON reset controller driver for the StarFive
+	  JHB100 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index 217002302a9f..d5033d723167 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_RESET_STARFIVE_COMMON)		+= reset-starfive-common.o
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
 obj-$(CONFIG_RESET_STARFIVE_JHB100)		+= reset-starfive-jhb100.o
+obj-$(CONFIG_RESET_STARFIVE_JHB100_SYSCON)	+= reset-starfive-jhb100-syscon.o
diff --git a/drivers/reset/starfive/reset-starfive-jhb100-syscon.c b/drivers/reset/starfive/reset-starfive-jhb100-syscon.c
new file mode 100644
index 000000000000..8de6419615c2
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100-syscon.c
@@ -0,0 +1,48 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SYSCON Reset driver for the StarFive JHB110 SoC
+ *
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ */
+
+#include <dt-bindings/reset/starfive,jhb100-crg.h>
+#include <linux/platform_device.h>
+#include <soc/starfive/reset-starfive-common.h>
+
+#include "reset-starfive-common.h"
+
+#define JHB100_PCIERP_SYSCON_RESET_ASSERT0	0x00
+
+static int jhb100_syscon_reset_probe(struct platform_device *pdev)
+{
+	void __iomem *base = devm_platform_ioremap_resource(pdev, 0);
+
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	return reset_starfive_register_polarity(&pdev->dev, pdev->dev.of_node,
+						base + JHB100_PCIERP_SYSCON_RESET_ASSERT0,
+						base + JHB100_PCIERP_SYSCON_RESET_ASSERT0,
+						NULL,
+						JHB100_PCIERP_SYSCONRST_PE2RST_OUT + 1,
+						NULL);
+}
+
+static const struct of_device_id jhb100_syscon_reset_dt_ids[] = {
+	{ .compatible = "starfive,jhb100-reset-pcierp" },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, jhb100_syscon_reset_dt_ids);
+
+static struct platform_driver jhb100_syscon_reset_driver = {
+	.probe = jhb100_syscon_reset_probe,
+	.driver = {
+		.name = "jhb100-syscon-reset",
+		.of_match_table = jhb100_syscon_reset_dt_ids,
+	},
+};
+module_platform_driver(jhb100_syscon_reset_driver);
+
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 SYSCON reset driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

