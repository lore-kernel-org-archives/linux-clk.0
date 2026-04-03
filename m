Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70704372B39;
	Fri,  3 Apr 2026 05:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195423; cv=fail; b=oUBPf/2BF23CeNmiImRhOIdsRCl6pN8Nr6gtBvmxGbb9hzgdDVAzL+TNVZz4XooWK3jEdHUTuFDORnIWsvqph1cTnarAOx3WJaXPYoSyWkooVMa7B7NMATvHdwGG8DSNmztgCscd4OV6jKw/tI/xzM/q5cpwiPRE392dvO3lFco=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195423; c=relaxed/simple;
	bh=RdccuZ/jJAkYC9UWd3dmvdjZqRm4DLBnUpf1Hwprt/8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1DSNIT1hG7EssRalEVItbFaMiaRFpLD7KtGqoI7Wr1w8nhbrh3k8RZRhN4h1woTPabwN/Dk6M616/rWnjNZuwi6gHWV72SVZh5Ppx/yaN8633clHs4BYXHJ4+U0ulD0u6S+krb94wjvpQhqSevSjUCqBuUDvzOb8dGmrS6hHSw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Th1hwwtbkW6UKUaSHSG42yQOvK/RI6WXgaw8INZukd8LdcSLJrGDFVVQ97ALvO9D1VQUEqSZiBihbWYWpdW+XQkzr+T4pzY16uAJHXmHTYW+BvcaNMqB9b622G0j3xz0OgYR6QIGPuBIKbSh0YUO3ahAVCEF1y5OT95mMK1wlMflYmFBcqjQZv98svKMAzgSTa0y9P6PzJ/6Kt8gEAPvB7OQKfHX4P/l6RsUS8n3uLWxdfYUsCFmdEhxMto94MJeGvFsllt9lvytvcCeTGz0UXWXUGFAWHB8gVv68014XVblphIdSqjX8xzSp4+Hkf6qtBsifpZ5MzojjCKKYyQjCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r0U+AalG1JlIkHOSloK07+zjy2/9xY4Qiw+qOmsqr+Y=;
 b=j4qdIyZljyCS8o8uSiyjBxp9+aqrOsjC9j4BKAFa41FKrT6S6hn42ufZkQxRWmLEJokAECGC8BkIdF08FT2dcm5AODtWPJng+drEQbLxN4SpTlnMbqSS21h6N7aIgvwLCP3GOjan7YRx11q372fksXqabzMdNf17emiBmuSsXPtyyF40oWFjrFR7Q76f2f1sJggYRByRwXCim3E863jtZL1g82kp9qPHN8PmldyPe8ZQYExheixm6EbADfKKVBt5injbFA4GxwrKJ3QjvH86/3Pi647++3Yz3e8zb3bv57mGC4EGzeIwl1NSJ1GMigQOIW96tkyjJfqi76JXqm3Vug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:15 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:15 +0000
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
Subject: [PATCH v1 12/13] soc: starfive: Add socinfo driver for JHB100 SoC
Date: Thu,  2 Apr 2026 22:49:44 -0700
Message-Id: <20260403054945.467700-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 4b7251df-2b53-4eee-f99c-08de9144e12a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	rmHdMZQqVxpvZEOQ3FwJpPh15+xhPjAaH4V7k3m9rDSS4znGy2KevlZkZxmIWV1B+QUhPDjgbGO9YNyeCYCMnTkbC2fvBSZIaZt/Ntkt6Q2whfUdv4GKA2UW5+aQUHtqw0flKMBPqGKb404MU9+MMbLaORZnxUsE7a+GYWsyVtSTfS6NpmHnC3znn5wl60fYhrldRQq8vRJDg1LbPS8RbWOpyRnUykuO86M4VqY41G5vNV5HD7kTvQ3vQDXphQ1Av5072V08KEUTItfH0zbSrQa48FY6tkAW75nQF2Hb+E9zfs/aS6o4kDWQUfZP0rXFlREJtXqJOBKRl5XCs5MFqa6t93UGizFT5AptyYVOL3gxd7pXBljja38f+84UMHlmKPyDvKAHFwHln2Uho80QMf43n5HoJ8YxwQCcDMr35EVDpkP4i+KtIAdYvO7GKYcOpSGBYUPnUW86iTY/2LsLKt+OVOxy7a5lCJVzrhUbSmPHgUIkeVUWDKjlrdokO85QiI+GxSieZ5CjoJbT93PuHe4AEuF0pWzg1+Uf9Dawa0lBmiIW07UNhWCke7Pdm0gF+Qyn5JEPi8VMgV+B0kELzTs5wprBmyUtpLTx5YuR8FA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9z9uez7ikkpmuWJJqfbsQ2yTP4W2nvhNX/yLWFUzGRyKDGGK6ouUynCR4J8m?=
 =?us-ascii?Q?/1UJj+fcXDTm3NO4IyU4H4QrzLUMsYYkliIaDTy9hmticNrANERylGaslULz?=
 =?us-ascii?Q?GGzedMirzF3QMNkUc4xlYNIU5PkrbE0LKKVBCdj4kwmnWH3POH9sUXI1kBy/?=
 =?us-ascii?Q?fIdTDeCJKN7aO4vBSUYbbrXYFjvbjYyvanClOs7Se/Ch8UEAVzmkhqpdEup4?=
 =?us-ascii?Q?gUt6a35O48hcgi28h/25z3rZbRKP8Mp/Y2hAk9UuDA3RHQ3kTaX+JsUWjaad?=
 =?us-ascii?Q?oSsfv9ZodIQFvakCuzB91D397ym204We57BTTJQjFJQNNr/e6U+d6Zkf5pdB?=
 =?us-ascii?Q?ViAB8cRLZNRa32sWI0LKgujQdl1vNV5ar+J6FX8Ylsz4HWN0pDS3Pk7pjWi1?=
 =?us-ascii?Q?MXYpFK8ol9TEFE4O8PadzalTvb98NzgClOpxYA3iItUGpJU7JJ8HrkTobqHk?=
 =?us-ascii?Q?nWoa+9EKOXOoB7sSwKx4y/7xiFx9IOuOcbogm9vh2hBYmSxjuGAbpJ+DhuuA?=
 =?us-ascii?Q?rO3zI9/wPb+Cblf38CBLpU6bKjytLFIlcN0K6xj5YMugZCwUJ/BtxV5D0+yn?=
 =?us-ascii?Q?/riGKElw6Fz0YLxa2SQufNhCY6+GqwEuUPCJCWBLmuvfVCKiGB4J/EtTHFM0?=
 =?us-ascii?Q?A/bROoAM18qvbgiu2lG9zTYsMOv05axEqZHU5hpFgXQHUMcHSS6yfFH6ezCf?=
 =?us-ascii?Q?AjgPeilkqQeMaI2NouOfMCIYkmVlxARz65wQ/OOdWInh4w0DqnXvhKNXMMjr?=
 =?us-ascii?Q?t/KQGowCxx+IBpF6Wa14VyjQEGY2wnekEmThA5DzWNTXipobbZp2qS38+Wl0?=
 =?us-ascii?Q?aLUTnz5tnzl1HNYe1Jb6qZOAoHnG3Fd+Vuzr/y7V52RH0/W/xc7aMRAIC64H?=
 =?us-ascii?Q?wbQJmhY+WDKNSLqd2NqsvgZDk3e+HHDync9kPN1X3FW3cWMAVlmu9UEYYCKB?=
 =?us-ascii?Q?wDvttp4KzOQomK4gZPEcAhrs8GUPdEEKr5aDvbld/O5SRBAld5YhddP+n/FN?=
 =?us-ascii?Q?d3PzcrhWZcHfKb3dJUbe8qI0TInwfkBKlgp9/NYQs5cqNHS1kpcuzKojSd5n?=
 =?us-ascii?Q?ctNl3+7svTUeeVcoCSzuP9dpa0MDUB4GOIBM+TiQpq/hESBbThklceWxKm5r?=
 =?us-ascii?Q?xUkmpdajZBK5E9abeBh5uB9JEXAn0MHoXZp7F2SAk5rEk9pFnR6z8beVuMfF?=
 =?us-ascii?Q?Bi31F8DnTb4nlUhyVNpvR0HdNsFeqaH1G43uA2IKKoZp8KA9xWbj8WfHm057?=
 =?us-ascii?Q?lqcImTmfxB/dyov2bNSXL/d2lWdlQVu472yV0JAtv1W90FmE7P4HPVQuozlD?=
 =?us-ascii?Q?287nsE1YJbHTAY+mxA89Z7ssGAj7SCtWuqw994zECTDaNZ0DOrk0BmKiLlpm?=
 =?us-ascii?Q?YD9p84Q1NOZZHA7vXTN4FifpwcwgyDgw7bTx7UofuVaQ2VPm6ygLPGL4yUTW?=
 =?us-ascii?Q?ZTfxlVk80j/Y5lc8E9zXCL94/Y+XkLUmyXqXauOCBoAUJk8+6tYzjudZ8cZp?=
 =?us-ascii?Q?LxRV4s7IRXphNy4lnqJBFTVvgS9lzLCqjGI2ZmJHBDa2IDlZe7PYs6IsCcfA?=
 =?us-ascii?Q?T+A/adUYOaSVFb+oUoZGKTCfBktS1L8YP0xT5pVLxJxb+bmxAUtKoqaKLICK?=
 =?us-ascii?Q?regsm4OCwWeOnuEIu3RjOiyWPy1QT159gx0jgwbzXaMyD0mnh1tvcclZ5Gz5?=
 =?us-ascii?Q?gzmkaGGpEzVY5Y68GFwosWt1gtVL6MkmzOWBullSKRsAQ0ryps0kjt68SssB?=
 =?us-ascii?Q?c7PJaA12uwe0mi3vzFCa7SL35Q3nMHb+4HGWDgWozD3zwYH22Zts?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7251df-2b53-4eee-f99c-08de9144e12a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:15.5993
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: D4FoZkk26aLOxBGAly6qJZKJJZZvzSkOrFtnkbRg2KSr3qSo065Py4ZB/sHtzV7ca4eErAJanDu69XysNm43GyUVCOwWEaYD/Yly4QIVe0VLoHUbFBAY21ICN5U28iwr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

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
index eb5f6a383146..32bd94a0b94c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25325,6 +25325,12 @@ S:	Maintained
 F:	drivers/reset/starfive/reset-starfive-jhb1*
 F:	include/dt-bindings/reset/starfive,jhb1*.h
 
+STARFIVE JHB100 SOCINFO DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
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
index 000000000000..0a20382da5d3
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config STARFIVE_JHB100_SOCINFO
+	tristate "StarFive JHB100 SoC Information"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select SOC_BUS
+	default ARCH_STARFIVE
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
index 000000000000..c2ad1c269314
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
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/init.h>
+#include <linux/io.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/sys_soc.h>
+
+#define JHB100_REV_ID_CHAR		GENMASK(3, 2)
+#define JHB100_REV_ID_NUM		GENMASK(1, 0)
+
+static void jhb100_soc_socdev_release(void *data)
+{
+	struct soc_device *soc_dev = data;
+
+	soc_device_unregister(soc_dev);
+}
+
+static int jhb100_soc_probe(struct platform_device *pdev)
+{
+	struct soc_device_attribute *soc_dev_attr;
+	struct soc_device *soc_dev;
+	void __iomem *base;
+	char rev_char;
+	u32 rev_id;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	soc_dev_attr = devm_kzalloc(&pdev->dev, sizeof(*soc_dev_attr), GFP_KERNEL);
+	if (!soc_dev_attr)
+		return -ENOMEM;
+
+	rev_id = readl(base);
+	rev_char = (char)FIELD_GET(JHB100_REV_ID_CHAR, rev_id) + 'A';
+	rev_id = (u32)FIELD_GET(JHB100_REV_ID_NUM, rev_id);
+
+	soc_dev_attr->revision = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%c%u",
+						rev_char, rev_id);
+	soc_dev_attr->family = "JH";
+	soc_dev_attr->soc_id = "JHB100";
+
+	soc_dev = soc_device_register(soc_dev_attr);
+	if (IS_ERR(soc_dev))
+		return -ENODEV;
+
+	dev_info(&pdev->dev, "StarFive %s SoC rev(%s)\n", soc_dev_attr->soc_id,
+		 soc_dev_attr->revision);
+
+	return devm_add_action_or_reset(&pdev->dev, jhb100_soc_socdev_release,
+					soc_dev);
+}
+
+static const struct of_device_id jhb100_soc_of_match[] = {
+	{ .compatible = "starfive,jhb100-socinfo", },
+	{ }
+};
+
+static struct platform_driver jhb100_soc_driver = {
+	.probe = jhb100_soc_probe,
+	.driver = {
+		.name = "jhb100-socinfo",
+		.of_match_table = jhb100_soc_of_match,
+	},
+};
+
+static int __init jhb100_soc_init(void)
+{
+	return platform_driver_register(&jhb100_soc_driver);
+}
+
+static void __exit jhb100_soc_exit(void)
+{
+	platform_driver_unregister(&jhb100_soc_driver);
+}
+
+subsys_initcall(jhb100_soc_init);
+module_exit(jhb100_soc_exit);
+
+MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
+MODULE_DESCRIPTION("StarFive JHB100 SoC Information Driver");
+MODULE_LICENSE("GPL");
-- 
2.25.1

