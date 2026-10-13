Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2134.outbound.protection.partner.outlook.cn [139.219.146.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30C01421245;
	Tue, 13 Oct 2026 10:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791887261; cv=fail; b=r4lcWkHPusqlnf2nm6bC2hGlp45A+upwFJ8eIqP5DN8woh7a/wT5zwKL1dgCH+1X1HBmx/Q8l32LHz9HQf+ytYMRf0WUZLk3Q5Y4HtVI0r7JdGX1aX9J+wQ6OqUY7ZMzWndcCy0EVw5HmuovdUi/TDknYOFoWPzGEHiPaYC5AN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791887261; c=relaxed/simple;
	bh=cpfIGrEMmt1HT5jttxkUiQjNe4ltq4Cm7OkQjDApDUE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RsuS6h8mwBHQ2sFp2w4s5557EVExtWgSOE9Y7Crpeow8D6TI/aET0eb0dt2cMEXL4yHfppQff1dnxzwo+4mm4/kpPhbq69I4u103vTXBYZ29iJfmXAdVGPOYNoHtlV6fQXAaqjhIy5DXjFmZ6dNtvdGtnqqf/qSP1gw8d1OxFlc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bP4scp7yaR9jFq9YzTW/+hN3CiGo4b8yuORulfO5/W9stmInc+3sb6m7sM5WD6LJwaTJX2XSbpxpFKRDBUxxcFPhJhlaRPFEVdCXJFQF9Kz6GotiRM2AO72Hw6cqqhnKQhOYLNnqJt9J8cIZoOYOuS4yr8XqVWtNhqsd5ETUOh0MoxYWIca/EmUrk52T7/Sk6lzNfpXH2O6xQDs0xKrNuUDKBoTdRfAxNf6xBwsR9dnglyLXOF1vr/5FzuDb1yf2zbGvTQu3nDlCZhUGMYimtNp8bnrEdNUaBkvwl04sI020nsfIvIf01IoOuwp5s2SLRV5bOMbMFdNpEkTDSljf9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BoJTjMnVQaCgxZDidulmYjeiI1FgYceKrtC7z0XRpKM=;
 b=hCqFCbyJ1SD2YuibshSzPER/KbnJBQ7h7a3NShO+vA18j7znsg+iqeoUqSnvM5xaERFgxHALspBAp/XXWflrmsZca1PdB8VyPfSyYd9ehwCQl0ulwGwjjksxSFk1zLI7o7tSFSZfoO59X2HCNMvllXr7zhzncyzSPTYDx5aRX4Dpjxrg9xWezNS/rSKc0jkiOi7VAUxVdNs3QyI9IvkWAZEb96B/AnB7SA1WraDIcoaGF7i399L2SBrrwHlAJ+QoTfaaWzbzDPCcnbhdmCFhdMCHZfLkhtFXxbCe8H4JYHd8nx4sG3qw7ybsnN041kKcsmWoxFHexF0iSNy3dp77DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1234.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.23; Tue, 13 Oct
 2026 10:27:26 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.021; Tue, 13 Oct 2026 10:27:26 +0000
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
Subject: [PATCH v1 6/6] reset: starfive: Add StarFive JHB100 System-0 reset driver
Date: Tue, 13 Oct 2026 03:27:07 -0700
Message-Id: <20261013102707.9207-7-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1234:EE_
X-MS-Office365-Filtering-Correlation-Id: 833bdb06-95e7-43ca-3f62-08df2914937f
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|366016|23010399003|38350700014|56012099006|261009223027099003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	bUnxEFQR62wZcpTlJzxGWNabhLON6aJEJHDWo1n1IPSFSOvXBJFailZioLKxcXjmXpUxQjxU3oBu97dagZWsDsVWYi497p7ctHRJBxy150mSPFQuSKE4IMF5f8ONJI6m7lofmnbM4RqseiPXTep4Izaenei31ddBrbmEftGc0OPn1Bw64JlLAXDWpeAyoeBXGtD0gxYJN42gKEjlNDbg61QvJFcG3JsC4oHsb1YE9mtIchJneoZ2V6ABtXn1fqc7k9u+898BFm905UMj10hPfn1n7eOWdoQD5kC1qCkxNn5UA9PyOUGLcx8jPTOyA1hvQCLASPnQdnO5F78Mk10xy4ZSRYWd4975R5HMXWvzVZwlF6Yo16Jg+oeWAmUhFxUmh9u8PvKtHq4O4i2yxrDVRBDbVs+W0GtpghXTpFKneJELnZgei2TICQQz9ytAEdu0NUswHccj3e60XTVRIrY5MQBy51fColOro8iDnWSFRXqVcq39SNSCa/dOnIdFay/y15BVS9v2rJRjl5eppUjzOyaExf/KCgdSFxyVEf7Fv3A0I2PYIx5VMLDbaCMF0jIR
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(366016)(23010399003)(38350700014)(56012099006)(261009223027099003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?mlDvXtL16Ju0fu+rEZVmpQxPqK62kTL4z0BADqi8R0sQHQCGHuxg7hWIbKfK?=
 =?us-ascii?Q?vhqoIeLGckTk6VwLSeYJWv+chtvSW8HEezPLLZxMnC/+1sl3inywkOevXqf+?=
 =?us-ascii?Q?A6dx4MjVl/7MVJV05TVUdSss/snR2Y3fFTYLb4vtgNBVIHJggHUSK6270pyt?=
 =?us-ascii?Q?Ddc1Jc6hsa/hqEQffuhCTCRPpqgLZF4SOplXjI4easRHc6jFLFKWevVmAOo1?=
 =?us-ascii?Q?60hEcBkysa18nC258VeyqpZ8HtMhXMQZeN6s+gPvVIh1DYYWl10dKwSPyxeJ?=
 =?us-ascii?Q?fuo39wja0jbRVKcgNMXgq+kabNUDbaW4H0iPq8lNF6dWkN04xh1tXq0Lz0OD?=
 =?us-ascii?Q?83xC5FFRNuKqslUB1jzpA+n3ViTK0I52CdV9yVEEeHv3IMFvO2enp6tS4viB?=
 =?us-ascii?Q?RnhkcyMzqCmLFr8cLt0YmE1La65FZ724yCPRSKyjqozTw0DUpmvQa+J6ypZ8?=
 =?us-ascii?Q?Oj8wdV6aVssLQeRTa2vBtiG9ngISFDDD46JIR7CIZOqGqrtRJhhtQfCXfVgj?=
 =?us-ascii?Q?BMd6qWfnycYpALYLxhWFT9CArnK5MKCRRe1anLEsom6OLUm2OhMzMD2CHl6B?=
 =?us-ascii?Q?Ay+DL5QxOCdDxNGqRKRh+QWmBk2/cNDI/MVQeH1ESBUis0TdS9ovubJE5+sH?=
 =?us-ascii?Q?NfV/ULp+47AJce0Jof8Klog02+iVHkKN1XlAWFiJQgeRh11CNrI/MEOjnqJt?=
 =?us-ascii?Q?g9ugLBrLz+/Ojipw1TH7/WQPvNICv7Pt7pBd4vmkMSGz0ENCEmtbApChpMD/?=
 =?us-ascii?Q?OKy5771Tv7if9N72A3Qgg57JQN/Bsya7W/TVbLAUUlc+7nkX7LdEQc/jQeoW?=
 =?us-ascii?Q?BSiMjgdhQd/SVQamvPvuJ+l+lWNTSg2PibjbZJ3m8Q04lGc+23/eKuw1r+WO?=
 =?us-ascii?Q?sjc6O5XIcakn9dpp4nP6BFxK45jfkZ3SJeo4B9Y77xBOqDQ9QePr/be24Xc0?=
 =?us-ascii?Q?ul4VKmTAN1ogL1rzoaDrY7xxipQCHE0N0g1Hq0fq4NejYCfKfSHIpuaU1F8K?=
 =?us-ascii?Q?8rkDr+D10lQclH/qHhcH8HPNwEdunwLVqDB0iGT2mvxs8gXFBeblj5ZPNwAN?=
 =?us-ascii?Q?vsHfAcrtO5RouTou2zGYMt5W/sUqroPVVTjmyDvDvqUrcu9waCCw/qkFK4CQ?=
 =?us-ascii?Q?B+0TkT9hqRQvUm/b1bPzT0UC11FwndYcfsejsTicziYeELSc/Z5Dqh+zvTCw?=
 =?us-ascii?Q?zRDA6k+FT8LYgKL5maHDWA1DcVU5UMGH9QHhtQ0TFQJkHG80UCV2yfRwjyZ4?=
 =?us-ascii?Q?Dp40yROxV0jI3bZla82hRi21Q6iVaOJA3Hr4aEi4q/Ww5CxTmpAnoBkmVCaW?=
 =?us-ascii?Q?uNS9UtHj/x4zYFaTfUIGQpiXm4zbQxj7zQLXOH7MhIbAQoPn9FDfGANTczSW?=
 =?us-ascii?Q?OCmNtOQwrdABYecC8G+brktmjwO82zFxXXyTyKaoD6hMsnOeR6O9UBUfBv01?=
 =?us-ascii?Q?FTMaRm+xqU7Kt1gHqVHY7n/HJO+IJSj7/fR0Pyk4RbIwSLgw9w0/vGFyo5o2?=
 =?us-ascii?Q?cKC16mg27sAgMuljx/NQOqUJIjJCrokZneaQMQXHlrvdUewaTJGmOiTqdgsQ?=
 =?us-ascii?Q?E/43Dz0wPZj7+vk7Ksy0G3jPA3B4+FGuLcrrKGpPrbn+UlQ1pn7gl1wa+8LV?=
 =?us-ascii?Q?TTtvs6G6i/u/6EGe0bFpJ8bxpni78st/eLa356ggHsjGsGZH2ot3O6fBl2Ev?=
 =?us-ascii?Q?xGaMCr4cx+5/J4L3YihNSZQvB/RIzeaM4hKsSTPE00Do9e5Phy9iwfjqbmTp?=
 =?us-ascii?Q?3ZKJRQWUPElhmuxqbdCgJ9rzy5jcUIvXx19uHB5xSBLdhb86AIuT?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 833bdb06-95e7-43ca-3f62-08df2914937f
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2026 10:27:26.1781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMkoayV8Uzmy9DUKJQTFhENsvuMdrtvz3RJDC9etSqKSO7nZJiP9m0y45aqopRxnmhGDkc2o1SJ4ettuOT4TQcek3rTTwKfjAIG2U2HpjVkXgZTI9/fQqEimjye47jew
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1234

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
 drivers/reset/starfive/Kconfig                |  9 +++
 drivers/reset/starfive/Makefile               |  1 +
 .../reset/starfive/reset-starfive-jhb100.c    | 75 +++++++++++++++++++
 4 files changed, 91 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100.c

diff --git a/MAINTAINERS b/MAINTAINERS
index dff8b819f83e..2d05cf52ea69 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26230,6 +26230,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/interrupt-controller/starfive,jhb100-intc.yaml
 F:	drivers/irqchip/irq-starfive-jhb100-intc.c
 
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
index d832339f61bc..84baefbaee14 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -19,3 +19,12 @@ config RESET_STARFIVE_JH7110
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JH7110 SoC.
+
+config RESET_STARFIVE_JHB100
+	bool "StarFive JHB100 Reset Driver"
+	depends on CLK_STARFIVE_JH71X0 || COMPILE_TEST
+	select AUXILIARY_BUS
+	select RESET_STARFIVE_JH71X0
+	default ARCH_STARFIVE
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
index 000000000000..129e5e8af251
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100.c
@@ -0,0 +1,75 @@
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
+static const struct jh71x0_reset_map jhb100_sys0_map[] = {
+	{ JHB100_SYS0RST_RESOURCE_ARB,					0 },
+	{ JHB100_SYS0RST_SYS0_IOMUX_PRESETN,				3 },
+	{ JHB100_SYS0RST_SYS0H_IOMUX_PRESETN,				4 },
+	{ JHB100_SYS0RST_RST_ADAPTOR_TIMEOUT_RSTN,			5 },
+	{ JHB100_SYS0RST_BMCPCIERP_RSTN_BUS,				14 },
+	{ JHB100_SYS0RST_BMCPCIERP_RSTN_CRG,				15 },
+	{ JHB100_SYS0RST_HOSTSS0_RSTN_BUS_ESPI,				16 },
+	{ JHB100_SYS0RST_HOSTSS0_RSTN_BUS_PCIE,				17 },
+	{ JHB100_SYS0RST_HOSTSS0_RSTN_CRG,				18 },
+	{ JHB100_SYS0RST_BMCPERIPH2_RSTN_CRG,				19 },
+	{ JHB100_SYS0RST_BMCPERIPH2_RSTN_BUS,				20 },
+	{ JHB100_SYS0RST_VCE_RSTN_CRG,					21 },
+	{ JHB100_SYS0RST_VCE_RSTN_BUS,					22 },
+	{ JHB100_SYS0RST_BMCUSB_RSTN_BUS,				23 },
+	{ JHB100_SYS0RST_BMCUSB_RSTN_CRG,				24 },
+};
+
+static const struct jh71x0_reset_info jhb100_sys0_info = {
+	.nr_resets = ARRAY_SIZE(jhb100_sys0_map),
+	.assert_offset = 0x12c,
+	.status_offset = 0x130,
+	.discontiguous = true,
+	.map = jhb100_sys0_map,
+};
+
+static int jhb100_reset_probe(struct auxiliary_device *adev,
+			      const struct auxiliary_device_id *id)
+{
+	const struct jh71x0_reset_info *info =
+		(const struct jh71x0_reset_info *)(id->driver_data);
+	struct jh71x0_reset_adev *rdev = dev_get_platdata(&adev->dev);
+
+	if (!info || !rdev || !rdev->base)
+		return -ENODEV;
+
+	return reset_starfive_jh71x0_register_with_info(&adev->dev, adev->dev.parent->of_node,
+							rdev->base + info->assert_offset,
+							rdev->base + info->status_offset,
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

