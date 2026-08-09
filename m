Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2091.outbound.protection.partner.outlook.cn [139.219.146.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94C021F8755;
	Sun,  9 Aug 2026 01:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786240351; cv=fail; b=YiKGe/g9W8AiwTTEG6+QzFywpcBhEsxbBoZ0jrKTHn6NF1bSLqhaGheW6oxNvRETXGJKYFE2Iab9yqamGE3DrRONgHhlCvTQcBW1iR+vyPaZ17WcKmgWC69sBUy3fwbnHFSCFlfUzR1DEAkU6vEQhTloSXKVSEf6oo/Zt8zXUN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786240351; c=relaxed/simple;
	bh=Fejndg3Z7pEpogs8AAE+KuZ6kQLd1QWm6a37CQKtXUw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jb2cQrHlQKTXjzWLiYwNFr7BcQIuRmacZ+PYvouytZEUQIgjY0laH5avII1zfziMClyfnkCMUUhAZCOCAKCxhdm4ezAovGUSWc2PS7+oSyowk+STj5DWYL+9dwX8zunk6XYTVC6JhRttdAKROtM8Ye6iXhFx9RmyUl0+3dO5Sn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cH0+eCJELk/ED/XokcPefTycWiKVVOcD4A4EWYFz9zTgAwLa95fTRahBLTu6G07IrrN8S8cQJuMWuF+3J0NacnURpR6wfMJSMKrBztqfB7LhCBufiMUnxFT+wUKcZqVXuPaS+I2AWKbNiilj8xqH33/XZlGIxg+FV+cW4YesxdCwhWn+MhstdbAOfyHTwknHffNn3cRCC2RxCNpLpa7YvHftvsMrvqh5Ws5Y+Kd9aLyD7KdUU/+aT5LWqelZvabtKRR1NqmoxNKITjI1ZVKvFBMWVDzoI4AZYaApHgURIz6Zcq2ij+N1NJjP+QyKWTRPYgM3hOWRArH/it7gFoC9iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=N6ZlzuX+psrUaO5DSvtncFnJbqXbgKjdrX8E6geZKEA=;
 b=BrViTgn4/ihI15plohEkpO2cFsIKzOFQbL6JaVdL/Vw7pnmracqehYeHUkxmj0sBHdButgWTDgtRWSrUhtGuXsl0Xnu9brdaHUm9Obe1boEXnd3rYIbdEvPOfl+/baCGDOOZrrjtZWvcD28BzXBqfo59w7ygAkLsZ3OFji39MAwuZIa+Hgpz5LEi0P+ZPb+fQk942wfFE4FQa4mtZaNNEF7Rl3fHCU9Z0mZlXEFPhi+4jHOuYu3SCF92jk+c+LmdJV9QTeUOuInyb0RvAYFXNjBIAm43d8UhebnqGVqO/BkO6s5mga8hemcXmIvgSX0IpGFaRCTwX1wm5mc4O+sn5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 01:51:13 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Sun, 9 Aug 2026 01:51:13 +0000
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
Subject: [PATCH v4 6/8] reset: starfive: Add syscon reset driver support
Date: Sat,  8 Aug 2026 18:50:52 -0700
Message-Id: <20260809015054.210577-7-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 931927ae-1d5b-401f-c944-08def5b8b192
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|23010399003|366016|921020|38350700014|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	OOyUSiy5rEo/upp6Uy0QDQmlcozW0UwcYx8a7iKQVF7Q/CZ4rc6MDa4vHxEkUUyV+H7q4PL2kz8vZNX1aqMUWeHMc/oe9mWWnbNAU/2sGyitLqCBqwjMGUhCnvytX0HJg04tF8FMahaAs60v4bvbyuEI4sfr1Y/Qn/aV9JHv6dwdXs7tahysPm9xhGJ0E9Z4zXfdQI58CHbTx8whBdyOZh+lnj8ROZcYv9/T97ffWhdRHx++dizAGbfQPeY3Sq5y6ylH5S8Qs1kLmzQBvWnBxZ8rLVVrYYJ78WF4DyO9NQjYOEgn9ez4l6B8G99AIQdNbLgnQJOu4tJ5+VRh9gwlu5SiLvkuN/5r9SDxTnYkmrKPw0qieGhOokcJlFsQwQ0eNiv4VHLWMMmPhu3IxJNqoInNQO8oIwSbdC13fWaRIn5PdtoE82Qa6+OJMHyucuZGRAPY98sSqDmFrwkjKwcqfyT9vsX2SnUWj4KbdT1omHyBh6IVnZD+CjrmRkAGhcCLbwvtY2zEIW5xnEHHAYQP6uvwfkAVkTIjcsi0F9AqYITvYcTrnn4g06VZhknOULpS
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(23010399003)(366016)(921020)(38350700014)(56012099006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9Ue3Zw6LVMwk04OqIJ2dXpnfFZtfJna0EiFt9g3Q9rYlI745xb/EAoclFUme?=
 =?us-ascii?Q?w8ryTsasPBSmT23GshL0vAEY+oEesHlsmpTWUbIlR/lTp6GLDYQfuX5AFN3t?=
 =?us-ascii?Q?QZKAjpgg79IG8VxMdkBWVhU+J4Dd33reW2bXVRxi+e6qls7YvwUxbx1OV4Yj?=
 =?us-ascii?Q?j5Dkl7SllEUQwyIERHuZiMEDx0unUWuAzP5gpdgwEd8WE/UaNcINNxzo43uK?=
 =?us-ascii?Q?Ip++5lIVrZZRcoMgcF2fxDfOUliPZrQ4/Lwlk9CYAV0/GXrALvLFAZ1yPoAA?=
 =?us-ascii?Q?d4gFSSsA5pW1WkFO8tqyyB7KdQH5FgKgf8mdiwqfVm3F7aVd6tr3UrZwH13B?=
 =?us-ascii?Q?Pcn5+XdrXfz9KkTkMXTqlOsSaHDaF/YVwE34EcFTsQr4KshpFH9CcXEmtsfh?=
 =?us-ascii?Q?ENKBOaZ1C9ASfosfC9ICnvCVeViuoaoVqBSV4inThpGcP13QpPhVO2Opb1j/?=
 =?us-ascii?Q?MZ5ZBWyYVze1U4dSXmZu867zDLrdWvFA2BirBBTZ4HlQ0DiSTOsdkf6MrPEe?=
 =?us-ascii?Q?LSYh5QzblbLDtFZJgtWyw7AhJJC+CcCsSkhccMV47zhHvbcj/OHRZxD11br0?=
 =?us-ascii?Q?Dq932j/MLuyATjbcFS2Z+HF5Grl8LE4xLxa1n6d0t2yMBKZdhQGYfmZtPCk/?=
 =?us-ascii?Q?plZ/Ehh5DuWjku2szoa++J799stZ9oIJFexkzw8GU9nbkoelGGc4ZTzD3eb+?=
 =?us-ascii?Q?ROCyPEcGYCYnfEpzeSzYKcnl1aoOzciQdm5U8Q3z+apmTRyi/TT4L/1YJ6HG?=
 =?us-ascii?Q?tanY7AjoXkRlnWujkTk4UCQaIEiEFeOlzmz35L0E7kuAX6w+A8xXlIE09BWL?=
 =?us-ascii?Q?Bze4yojOEEYUIF6UIZ7++H2gi5+sr19XrJhuByXi4PgZCCyzG9xfntatqY5s?=
 =?us-ascii?Q?OTEfCnEYYO1VavLdjYGqgfAoiPKHtUGsV5ERT2uvCIgJORvqYMoXOunV3fmu?=
 =?us-ascii?Q?ggdU3Ngek58KM54/to5froVL7gouTmF7CzDt/MjzmTCesvsIiwqIQoZ6tPGH?=
 =?us-ascii?Q?8riEwCVAWlhX4w6q3Gw61iz0gqkBFp2pIA1AOdhqP56DmZMIgH5Q5OKusByi?=
 =?us-ascii?Q?a+d4tQbQaJIasmVFcGPm0HxsISnDVl+M/r0un0bunh1EslcZGnBSmrFC8Dex?=
 =?us-ascii?Q?qIcf4kmjNx8Gj7672IeIYoj7oaV9vd8ZgH3Dq3wEUCjddEPR2xG101h+rIFr?=
 =?us-ascii?Q?OnSsreE+P/2P0aDBVYv2hebiMvu+I6/E7CQNmc+cK+dWVr622JuGPopEqy0r?=
 =?us-ascii?Q?h+JIrRIwUG6hvKnDjaSRF7xaH2tipeB+5mbY3I1k8KdOzoYuBOtBObsr2sWw?=
 =?us-ascii?Q?Fg6PZ8m5OTGEHX3W3UJ6j/pNIZq6ziFS1aZLZhV96xlL9+6dfCZEnN7RDsaH?=
 =?us-ascii?Q?TSXbiWw72LehFaIizoOrAfNz/8aJ37ZtrWBiuahjeeP0cvDmWMQxQsY1n+vq?=
 =?us-ascii?Q?Gp0p1oL1/kxEISrwVtNQcPD63Lt6twUHfVyPZ76+edS+Y2hcBrDrH80AzjdH?=
 =?us-ascii?Q?Aj4ySan7gH1k3mWDirQgcX/fSVYCMebslNjjW8X4tfrcuArStIJVFRN5Cahf?=
 =?us-ascii?Q?wNpk0r7PNAs7mTm/ouRIFrS54ueyoOw3v3uHCyVKy0UDouAFnBKbM/y5xZcC?=
 =?us-ascii?Q?LrCbefbOcI2k5vh/01BgiXWaIAwuoGGBAmWTaI40lJzvr9tfswDrbkFgJz1m?=
 =?us-ascii?Q?3FsH8HBEc4YusWAHZQFQvyKRKburMXYg5bil7wI1TDQvV1y7+F9oEehGS/FX?=
 =?us-ascii?Q?w1ri01kjQTswBkIyWfUHhe1QEY5KaCifiaLNUW+/QKjKzv9ehvzh?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 931927ae-1d5b-401f-c944-08def5b8b192
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 01:51:13.6373
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: smIbzXRxpDUGNf4WK2HCo8IoBg8KxNTN6jsJvLG+sN57qacYFyPnyLux1Cc1JRHSKd8hTFQf/2yyust2x7P9L8LiBuq2gSWOdKeDQY5eeaERJjP0gk2MnGzkibS4sKFm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265

Add syscon reset driver for JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/Kconfig                |  9 +++
 drivers/reset/starfive/Makefile               |  1 +
 .../starfive/reset-starfive-jhb100-syscon.c   | 62 +++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100-syscon.c

diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index ce00495be6ad..d96cfb59f51c 100644
--- a/drivers/reset/starfive/Kconfig
+++ b/drivers/reset/starfive/Kconfig
@@ -28,3 +28,12 @@ config RESET_STARFIVE_JHB100
 	default ARCH_STARFIVE
 	help
 	  This enables the reset controller driver for the StarFive JHB100 SoC.
+
+config RESET_STARFIVE_JHB100_SYSCON
+	tristate "StarFive JHB100 SYSCON Reset Driver"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select RESET_STARFIVE_COMMON
+	default m if ARCH_STARFIVE
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
index 000000000000..55d84e6ad2a8
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100-syscon.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SYSCON Reset driver for the StarFive JHB100 SoC
+ *
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ */
+
+#include <dt-bindings/reset/starfive,jhb100-crg.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <soc/starfive/reset-starfive-common.h>
+
+#include "reset-starfive-common.h"
+
+static const struct starfive_reset_info jhb100_pcierp_info = {
+	.nr_resets = (JHB100_PCIERP_SYSCONRST_PE2RST_OUT + 1),
+	.assert_offset = 0x14c,
+	.status_offset = 0x14c,
+	.discontiguous = false,
+	.active_low = true,
+};
+
+static int jhb100_syscon_reset_probe(struct platform_device *pdev)
+{
+	struct starfive_reset_info *info;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	info = (struct starfive_reset_info *)of_device_get_match_data(&pdev->dev);
+	if (!info)
+		return -ENODEV;
+
+	return reset_starfive_register_with_info(&pdev->dev, pdev->dev.of_node,
+						 base + info->assert_offset,
+						 base + info->status_offset,
+						 NULL, info, THIS_MODULE);
+}
+
+static const struct of_device_id jhb100_syscon_reset_dt_ids[] = {
+	{
+		.compatible = "starfive,jhb100-pcierp-syscon",
+		.data = &jhb100_pcierp_info,
+	},
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

