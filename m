Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn [139.219.146.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA26841168B;
	Sat, 10 Oct 2026 10:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629998; cv=fail; b=RthR1AyBd7qotFs1xWhERWFnFQ8QmkvfPhPP+tk16srQitfmSUuxQvcqPglTR5RTlorTM+9J8OL3lfcVfcE+VFWh2wL8o7hQFiQG0TykFELvSEwEnHu3UkfwGwPfHPgoth3YPY6krQD+2iFplEShuIwL55Qf8RM36LMyOxR4bC8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629998; c=relaxed/simple;
	bh=gGYIhuHV+rkacZ6t1uYkT4zSO6OzFhraLgauIncDHj0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KT80cFLEWqNfybSsElZcwQucseKOGdbvWet6z0fHrTsSGtNI8Wt94llx38bu4fyyDEnZ5k8q26bkpBJJUFE92uMOnF1P+BPCfA/FcyxGrWkGUafdDdjtNdC7W35yIOy7gmaqt64jCYw/vXOIdSb3SsGR+d1KvC2uTZZIqR42mV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AMx15IV9OsLDn2kgxXo16SlN9yjp46b89xu3M/2JxbVEyNsNvmjJ4zPx+GMpXTQcRK3fBLXhWY6qjK+Uc99hlJvPns6Oq17UrDBxzmANBRu9T7BrNqVbryUCBqpZTOmMMC1zH4teh26No2fU4se77lPyvp3tQvMV6lBYtSL+UAgDas5gP9jOSxbvatX5l1sGWimy3SFEt8s/ALp2NP0dGrDfjlkr0Wt6p2tp4PP3aAiBqah9iqPLL2r7sgd5gbR2hY7RMJbNbrkXR98yEOqMT91JYK7kERP9SQzvRC4uVzpJJKbCC7EsdTSS2KxOwM4XXdrQvgQQzTOMJ0Hc8kVJIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TPgBAICI/ENK3v5saFL0fSTPikwe3FE7KKykn+TWx+0=;
 b=l2//haamtYxkpFtJsh+3UMnF/XjojkSBFNUtvfA7JYGw/rPSd4simiX5zLCKfMwA/cwbS4/9l8pB2GZDveXPKBMHDQuXwmlPPRzd+UAvnbrzqSRblR3m6QhkOg2M3cJsV33nEwz23vdH5miJrecvUIpPAeCL2PqT9ajretsMoqjxYsPCZJsCWAlcRqBIh9guxv6mWwDY1vxMwKWzBGlrKsd6YjKvZ0Jfv9bkJOaz6ppYq/qWS3Ra7Y79EbmoLKNfsiSSjJv1RWkvpKmhPycforwyoZF9D8o0HT78uNef+EeNallHt6NLtDUbx+Bqf4dxl2SGsWlvOeE+C+L6XUKzbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.9; Sat, 10 Oct
 2026 10:59:39 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0496.017; Sat, 10 Oct 2026 10:59:39 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v6 2/5] clk: starfive: Add Peripheral-0 domain PLL clock driver
Date: Sat, 10 Oct 2026 03:58:56 -0700
Message-Id: <20261010105859.19505-3-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
References: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZQ0PR01CA0036.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:2::20) To NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: NT0PR01MB1216:EE_|NT0PR01MB1005:EE_
X-MS-Office365-Filtering-Correlation-Id: af708082-702b-46ad-01c9-08df26bd947e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|22082099003|18002099003|10067099003|261009223027099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	XTMQqg/vdWuSwc1bviYn/RjC0mpCrUQkUawQ2oNfGLAwiTnBnDV2mnqz1uLe3G5UzG5lAJ54zsrt/l3bpSwdmgZlYnEz/UmlVFGb2cMv8uDT27VuNBuakBUg/BwaCY8kwBZjFC9Bmu91N5c0xGSe9aHhy4WYuPb7oMQIMmFi3UyK6HLttZTvlmM5AsV780714438trSTTKPM8/ZKDPlF4jYzWYCDpDPrjX6cnzHhtjf7B9oUhPhDjav16uqU4nWEJSk0/l/KPu7ZDZAlXeCcZQ7IgeWsq4FBJkR3eUxnqHK2Dffi4n0WLUk8gzh9oRzIY6zpFbVRdhWPMiwFsLcUU73vn2t061wXOQyHAwIaEgyCtmN/LwXweY3AwJH4twyvjif/FJnq8hJOKIH0B9flnfVl9c4WDnrSU0eyTzpjePKGbBY/n1lHujllPsZyBAh1ykf+N5GuvCx6vxh6/tTgAEhK6F5PvvKd/4HpDEzysx5AuXsf2O6A+4ceuxjdMqKw7XEyW4LB2YV6/O1Z0zgiC8uitzkE0O47GfHmLP4WJor6+YHRpNeIZc+2ojbkRdao
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(261009223027099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?9ZE76B+GGWrLTzDVVAe+51SEd1Luxy94wkYwAZvEdwwVigSI8XytFG4K1ClV?=
 =?us-ascii?Q?QwD8fgGRiMKSOk5wFQKR+5ZbuWAkBESKTroRaCTGY49ERYWKO5i1xjKSlrYc?=
 =?us-ascii?Q?uT1nkFgcMc734PEXz7VK6yVZkoMAMgwzL9DDae7yGNfHlH3Sg2duPZr1PB6z?=
 =?us-ascii?Q?wJpw0t5gVOOVaIREn5yRU4BRHXAaqlvmEbl6/yXCrVoYfqBeZhxbwTsW8Ml3?=
 =?us-ascii?Q?R6IeXWqcmkh+AnKSmm4grZAt3Kab6eKCZjfeifeyIS9+gZMOM0tNeiJXXg2w?=
 =?us-ascii?Q?fPw7MS4k0R6h3fEPgjhzcCcRt1AFu39svtA8l995JIqN7BjZ9tB1sTAYsYLh?=
 =?us-ascii?Q?XgDg5FDczhdTL1oD4eQUIhylco/tVY8tYe41texAvSOB+0wZzXgvO2DT025n?=
 =?us-ascii?Q?91kSsssS4eAjAZ1aYYmLJV/2ciRPutBrDP5umLaULlTBgFe95QScHTPXbkvq?=
 =?us-ascii?Q?7jX0RM6sgQOBrCJRM9jM6fJ0GqpVYrDQqAL8APybXsmDrssYNHSisEyIBEr6?=
 =?us-ascii?Q?SpE3XkTXq2BWflgtagfjoJR6d+Gs7LpIC4eDaaE28bTXDj0f6Ejd4qNWa769?=
 =?us-ascii?Q?kit/maLdFwslwj4/8l+ZXbWYF+f2RsNiQdPX65fUJlpVRUJ6NC4/ZYCzvwRv?=
 =?us-ascii?Q?g+MysY/QaMmJmzNDgYMhUTahGPPFB/M4hllP7hoe3cKcAMUvSgx98RpFYwU6?=
 =?us-ascii?Q?8wEyFfe+4I67Us4HGMPsfWMLI9zJp7FmFW9rXY2Hn1okzzmKsI74hf7TdV4t?=
 =?us-ascii?Q?D6GjVrfhurlnyYNblmWWjJ8x6PCHIhVTx0Xw4lAlSzlNDSsEs1cn8N+tI+93?=
 =?us-ascii?Q?Hai2W/Tp1UQkz7aExjUTcErsuS/Xu4uW7/d0Jd3+nOumOk9U37+mT3wI2yrB?=
 =?us-ascii?Q?RWBaJ+SHkfMP2nzCJydDOcmoeTECV4k0xeFpYojYEEBPSboqC7xzb35dBkhG?=
 =?us-ascii?Q?D/utfvk7moAVm+hMRGnOPok6tXFBLQJ3x1Dead3QGZJgftyjRY04cnxN4zuW?=
 =?us-ascii?Q?pi1SlFjQs8xjaaww6nxPHzX+tYAQaL4uWoUXO68oQhkzeKeD5HHegyR7PM06?=
 =?us-ascii?Q?DdS1BDturBpE7zhuJAmSRpC3paqJ8JIPw9H6DT7dbZs69WIebg67XAUZmweE?=
 =?us-ascii?Q?h/Y6ksDltJ2XMyQDmIiKjURNN5k3ydAq/+5jeifOISwc0sM+aXYRYrposa9D?=
 =?us-ascii?Q?J3sW+/IMnREfjD87US9lLlKM11J/DbPixTR9XyeKYsfSzpIG+CDN6rKkQVv3?=
 =?us-ascii?Q?9DFiKz7vCChMFk7Hy02/RqBMLOVLX7G9iQhx+uq3HGSpMMGkcw0gLQRWqBEt?=
 =?us-ascii?Q?wjTgO9ZF9Fsp+TRor6zBh49p/SJYIQvc0IDRWOOzUFIJTc2nReYWPX6bqYJ1?=
 =?us-ascii?Q?MorH9cRzCzMcCz70IuNYoS2b9YEQ1WMWRv678pCP+nr1rdoDRJy1r7P7NBML?=
 =?us-ascii?Q?FHPzd+4HIku9UqhtMiNGjA7gR4yyuv6TXFhWDjJgWKZ5G78rYTi44BbjrD2o?=
 =?us-ascii?Q?dw1tFizOjOrHm25az0LLEEsMQ4/OEsoCJb3cVoSjOPhCV4VEnBFFRJz49k5H?=
 =?us-ascii?Q?zSAOZD0oxMaxcMDsg8Nis0cPBf6T0CpTl0r4oiaOMuFqy/RLbUbEdzWpyTiD?=
 =?us-ascii?Q?Noj3v9Yj4HN5TRsfPTmk9xnVWC+0W5GR1pb2P21upzCoJY9PxYW2tQbyVL6S?=
 =?us-ascii?Q?w/XwEWHJ16C4nlS+x1ZeeEHApRUtuc/QqqHr6pCfJk7g/rxF87g87LTJHce3?=
 =?us-ascii?Q?vT+RtzPOunNLJpCA29v7+a9RgqpkbXsf4gWmF9KaqK/QzjpFNVY4?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af708082-702b-46ad-01c9-08df26bd947e
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:59:39.3342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWyprfoQTm0zWkLhrEbjjd9vl2RQOq5I/CsKiz89aHJpLk31qV75gYmEj7cWHQIsTFC9JcvcS7gm/I4IAMKzoPqEc4V3HQd3PFBv5+GZZ0L2xlr281Kk3mHP0SqgPABB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1005

Add Peripheral-0 domain PLL clock driver support for StarFive JHB100
SoC. It binds to the per0 system controller node and registers PLL6
using the JHB100 PLL library.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  | 12 +++
 drivers/clk/starfive/Makefile                 |  1 +
 .../starfive/clk-starfive-jhb100-per-pll.c    | 76 +++++++++++++++++++
 3 files changed, 89 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per-pll.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 4a7c67445f4c..00c46f5ec976 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -113,6 +113,18 @@ config CLK_STARFIVE_JHB100_PER3
 	  Say yes here to support the peripheral-3 clock controller
 	  on the StarFive JHB100 SoC.
 
+config CLK_STARFIVE_JHB100_PER_PLL
+	bool "StarFive JHB100 peripheral PLL clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JHB100_PLL
+	select MFD_SYSCON
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the PLL6 clock generator found in the
+	  peripheral-0 system controller of the StarFive JHB100 SoC. It
+	  provides the parent clock of the peripheral-0 clock
+	  controller.
+
 config CLK_STARFIVE_JHB100_PLL
 	bool
 
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 3a8f75c55c96..e31ded58bd6f 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+= clk-starfive-jhb100-per1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+= clk-starfive-jhb100-per2.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER3)		+= clk-starfive-jhb100-per3.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_PER_PLL)	+= clk-starfive-jhb100-per-pll.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PLL)		+= clk-starfive-jhb100-pll.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0_PLL)	+= clk-starfive-jhb100-sys0-pll.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per-pll.c b/drivers/clk/starfive/clk-starfive-jhb100-per-pll.c
new file mode 100644
index 000000000000..d38116f16935
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-per-pll.c
@@ -0,0 +1,76 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 Peripheral domain PLL Clock Driver
+ *
+ * Copyright (C) 2024 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <linux/kernel.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+
+#include <dt-bindings/clock/starfive,jhb100-crg.h>
+
+#include "clk-starfive-jhb100-pll.h"
+
+#define JHB100_PLL6_OFFSET		0x00
+
+struct jhb100_per_pll_data {
+	const struct jhb100_pll_info *info;
+	unsigned int num;
+};
+
+static const struct jhb100_pll_mult jhb100_pll6_mults[] = {
+	{ .fbdiv = 192, .frac = 0, .refdiv = 1 },
+};
+
+static const struct jhb100_pll_info jhb100_per0_pll_info[] = {
+	JHB100_PLL(JHB100_PER0PLL_PLL6_OUT, "pll6", JHB100_PLL6_OFFSET,
+		   jhb100_pll6_mults, ARRAY_SIZE(jhb100_pll6_mults)),
+};
+
+static const struct jhb100_per_pll_data jhb100_per0_pll_data = {
+	.info = jhb100_per0_pll_info,
+	.num = ARRAY_SIZE(jhb100_per0_pll_info),
+};
+
+static int jhb100_per_pll_probe(struct platform_device *pdev)
+{
+	const struct jhb100_per_pll_data *data;
+	struct device *dev = &pdev->dev;
+	struct regmap *regmap;
+
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
+	regmap = syscon_node_to_regmap(dev_of_node(dev));
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get syscon regmap\n");
+
+	return devm_jhb100_pll_register(dev, regmap, data->info, data->num);
+}
+
+static const struct of_device_id jhb100_per_pll_match[] = {
+	{
+		.compatible = "starfive,jhb100-per0-syscon",
+		.data = &jhb100_per0_pll_data,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_per_pll_driver = {
+	.probe = jhb100_per_pll_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-per-pll",
+		.of_match_table = jhb100_per_pll_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_per_pll_driver);
-- 
2.25.1

