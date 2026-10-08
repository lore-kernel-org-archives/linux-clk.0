Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EB8D49B5D6;
	Thu,  8 Oct 2026 12:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462924; cv=fail; b=FbOsN5knRmFRqPGEP0zYWtk4iEeE+aOP+idL2GOzpUH1T7fp5FmcxHcXniXAg6iaSeZidaKCKJxV4QDGEztPd/cGHLlgD6M7oj6/nKcOVnMx7JlQIox14KfeX4AmdL5i9Yn1lCCmu+bnswJ0N5JN0qkMk3CmYmH4Cq9zroA7Qxc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462924; c=relaxed/simple;
	bh=wpMXZ3r76b6Y6d7lfavmfpTh/jNghW+FvrZnDqtmoUY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QQMa/fiQkUjrFs+cVyhkozGLHd1ztotg/nrRETMArFB/PQWZzQTpbjKpAZfNxeTc2QN9nI/zXKBA1WDB7rQ1hi/daeHd8PtV5KcUv2/Ujyl5CjELlHeyggDkMTqfwg8MPDuPdXlxuNxkmdF1RIRAggWKBiUSqteKSv5TBBbrufc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IAJtMZZutDI8JlUIUChb1lb6KwzPzas7LIohpOglPj35R7aLT4q5FOkj1S9uslprmGsJPwnqFF4c/tH6sqxw9qi77nw5OYlRgFE1msBFeE9Udf1OGIJ81/844GFUErsu/y9mOdxqH2cqKWzfc6rp8DgJktEDg4BPpS8o1UU5Y38wANJgTIYMoIpHDZu3FhNB44zBLMv4RFX3YlQGlX/nIgLMmKt6QqcHcKEA5VHQ5SuNPv1mme6buDnqDiYMc0XWgir4jPkV6hpL5nagmxs0TXeeb1W0ji69RZQAtS7uN4YxwZhsvV6f8NSo496PX9L8DwhxJdiPVbEw4bBBCGe0WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v2ihLiz2Tzf9XX57uT91LPDORvM7tvgXXabm64uPbB8=;
 b=BfPcjrOKf5VVxnZLS44tV1rhP7yiDIB3uVwm0+aVn5Oj4dmXqzOUB3wdQpdM5gg4CizZNSVc3/fsiMPAF8Au64klAt55WU8HW/vvrCUma++4S0iTOHvshtnBZchP54mgZ2sjXv4tWKJvb4G9vxpyfCvYgUr2SeEayrXye9IGej3cSHeUlMrDYicDJC+KdY98x+zSrWfvBlznZpNOqvsjKRc7b6xjsgOsLm68qLvhXMVGg5GjbpFgd7633uPm/CA5I5Wxpc+za9u4S3Jyv/NVhOlCVeE61RFEz/E0NoBwrJwLSfX0FrEv28ZIJadB/k14i8b6Nw2tmXm0/uE1t5vsNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:34:02 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:34:02 +0000
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
Subject: [PATCH v6 12/15] clk: starfive: Add StarFive JHB100 Peripheral-2 clock driver
Date: Thu,  8 Oct 2026 05:33:35 -0700
Message-Id: <20261008123338.11081-13-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 42e263ea-c953-4855-01a6-08df25386f35
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	sV4DwaRU3urI4s/rwqDMq9Ft1nrNGKevTYWhWKRpgWITkZ9kkmad0svzd0HuwiDTP7A947/0v7riV0YLKxqQz7W+JA4S9A9i7mAMiiYGyU774C5PxwQBsRWjrx01EEPnzh8sz75hkTDObqjqIRwS3AK7xlW9D4fgoAJjkxtxg8uAum9PsO2t5Xm6rcVbmgLddQR91nHyDFYfyR4Yh689SwT2oeaClMp7APJohoeK4DF3o1/vZ7TqBMMIdPDC+47fL8GEFBE5jiUYWHe+JlDqCNqo5rVeaE/5Ea9XeCv0xhfrSJ8+X8wj0n6/mMIyXHGj2bSkfZbb4BZPx4PdJbwmVm9jd4OqeT/wqn4bMRJ3Wdz9r0F9wS31qjxU/3i6+ADdqAproOHR8PG7gG9I+vHRtQVrOzUJ0UokL2BwCfX+xnkW4dQBLINHBrfg/h0H2jbq8ExMTtKjjNrQuBdMsqiCWSL5Plr7rdp0kv0MREFxjxn2Su+xpu7tIGAVd3OVy40uoD2BzPQP12TfEDB2k2LY4dnHEiBoLUEbdB8Xgj5cYI80L97YjJRopnr1ggFPXRXa
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jAi95orE4RBZxZq2PV+H1r5gZOXv7xNRma0Dm3XmRpqnsjrzXMKPLq7ujUli?=
 =?us-ascii?Q?q9VJaFGLqKloIMxCJfvgVYt6BrtJH2mYcPdM4t/Ekdfe8ZdvBT96HBn/pYB8?=
 =?us-ascii?Q?z7ZkGe7CejKzVcM2q71XQh0/OtE5tyfsFbmy7BohofB7yDNeJopa8dBiTMwA?=
 =?us-ascii?Q?iFhMTSTARPLi1yW32XLQ+WkXK9f/4Zkfbsa2nQ22OHz4oKqM+FPnF4PCraxw?=
 =?us-ascii?Q?IDnN2eyRYect23LrpKd7WK//Mljv79hixC41IoNRbPJdrDoV9tbVeJsXZtsQ?=
 =?us-ascii?Q?0boMlwIUlCiDTnzRnhASeY0wgLo9rmZ9gxnAoL/YSWqRWfiwvMUL3XNISGeD?=
 =?us-ascii?Q?ZJnxw8RK0+vnmy0V6KrG3L80eomKh2Cr2JBiEpsziO0wDZ+NMEaDrQmz8fi5?=
 =?us-ascii?Q?Bv6F4ipcSReO+qkJ7vtDWrg6j4CQcebe0MxDgMXk6jHeltkSy7Odf7O+fjV1?=
 =?us-ascii?Q?Fq9auSMPBDqGjOb6fARnVpaWE30lK1VHHQqX065CvwKBcDvBfa+/Q5CLUNoC?=
 =?us-ascii?Q?vkGdHMMugWtZu8AH8HX6Y2zKVZkDZyBpF4bjkxM50zNgLwWgEBVMjYxvGpMz?=
 =?us-ascii?Q?W/+VmfelnQ5agvXQZxFfrtoj3vbIuA/f+xJlUcskqLespXwX/tUFLS3Or0+k?=
 =?us-ascii?Q?XfIT8RMUW+TLeSoaPKechlPKwZURHftfWou0FWhReIuU1B8Ghfb8a699AKU5?=
 =?us-ascii?Q?9PpaLiJsKBxzTUd5jMdtXCAbSLzqJRmSZ+IFIUU9K1/is1RRStG1h+tbkt2/?=
 =?us-ascii?Q?XCZ8iEyZNJLqCs2HYeYpxHy/ww4yDrzZfbSmll+j0n3Qrqmwc8fd1Ag97Lqn?=
 =?us-ascii?Q?mgqXHjjOOkX3NyxSpvPqUXuCJvlsoPh3aQIiUJELrg/N++KBlg6kVo8Xv+LG?=
 =?us-ascii?Q?7dJ6MGC3xvsvwVvorNVcUMuLf6V4FKxvZFXL0LNiiKhXhqFIH6F10AMlJkzt?=
 =?us-ascii?Q?oC41SVrfhMN5sAnzLJ7eWYr2yx4mdIoHlkHvQGlLBBds5frumH9KmZRmUngJ?=
 =?us-ascii?Q?9at9ORtKaK+xUmryhBC2+REvCS/DKYoOa6wp77DjJ4/eGmfuJ15N8jaxIBIc?=
 =?us-ascii?Q?AFyPQoEQm/uLhQtfWHwdu7uKTqkcdInSeHzlr8pgUfAv9E1op+1+FuDg8M6t?=
 =?us-ascii?Q?fSyYfEH0wA9bPuUsQMcqzcMLcXkbm9Mgwfl31AEmhEccCAwDmFsrV7xUuqfh?=
 =?us-ascii?Q?J5rDKCa4aPB0HagnGZgTxHu9TfC7jPz77rC353yG1oBqM75eq2KHyZ2jG12J?=
 =?us-ascii?Q?Twx90v2hiz+2llFeMGEp9d/2WbPBjX1vhPC/rgBbXirj2xHwUR6dC4vBwULe?=
 =?us-ascii?Q?VeUDG69PRm5sfb/yHZ0Ulk91qtdlANE4SwTBhAs0ZY/jGsrzhs7Jcms7ryv0?=
 =?us-ascii?Q?M72aHJWVaMObNb0mdz2MthclVRP984xbNeqDIN2oFtN4D7Xv9vH+FX51jJ9T?=
 =?us-ascii?Q?XdV9HqiYzrKalVLXIZ3owu0jbWEEBETDYrYd1CZH0xxaOLtQUU0YsvLENlLQ?=
 =?us-ascii?Q?AI56D6d/7GIUSUXwx8/EN0re7hPwk4W7ZHlQ4yPckcdZ1rYKqVg0zxTyboz2?=
 =?us-ascii?Q?ro1LEip55movqxJ023IFHmefnha4T1pygGYzMJBmZ2wPG9JWz+unR3Lwz4fg?=
 =?us-ascii?Q?NirObdiCR2HrerGKel9QwI6WizI57llepdX1DvkeRfNTFpvreQBGlSowLy6/?=
 =?us-ascii?Q?HT9ugQaJIqlAu5HcGx3WViiP7zVcYVBxLhx2n3r7apEJqSWSjENCLSDwMsBd?=
 =?us-ascii?Q?osk0xAMZafZkZw3Rk7CM/oGJV6MBPRk8PZUzRWS168LiBrACs2tY?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42e263ea-c953-4855-01a6-08df25386f35
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:34:02.4992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wOV4qS8wqLBTblyFCKwT3Ik4JXeuQJI4zs9FRXvKABD1JdM4TTYTuABLT1j+schhyxLA+1JpIMbPk89L+wMOPUZ+IF0O72W4B299mdAMWIRUQRoVrPCbYb2PsDwV6Ckq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Add driver for the StarFive JHB100 Peripheral-2 clock controller.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  10 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-per2.c   | 182 ++++++++++++++++++
 3 files changed, 193 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per2.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 62727ce3aef3..57a3838475e9 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -93,6 +93,16 @@ config CLK_STARFIVE_JHB100_PER1
 	  Say yes here to support the peripheral-1 clock controller
 	  on the StarFive JHB100 SoC.
 
+config CLK_STARFIVE_JHB100_PER2
+	bool "StarFive JHB100 peripheral-2 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the peripheral-2 clock controller
+	  on the StarFive JHB100 SoC.
+
 config CLK_STARFIVE_JHB100_SYS0
 	bool "StarFive JHB100 system-0 clock support"
 	depends on ARCH_STARFIVE || COMPILE_TEST
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 279e0cdfc99b..ca9347d38023 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -13,6 +13,7 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
 
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER0)		+= clk-starfive-jhb100-per0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_PER1)		+= clk-starfive-jhb100-per1.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_PER2)		+= clk-starfive-jhb100-per2.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-per2.c b/drivers/clk/starfive/clk-starfive-jhb100-per2.c
new file mode 100644
index 000000000000..213f0fd9a260
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-per2.c
@@ -0,0 +1,182 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 Peripheral-2 Clock Driver
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
+#define JHB100_PER2CLK_NUM_CLKS			(JHB100_PER2CLK_MAIN_ICG_EN_GMAC3 + 1)
+
+/* external clocks */
+#define JHB100_PER2CLK_NCNOC_INIT		(JHB100_PER2CLK_NUM_CLKS + 0)
+#define JHB100_PER2CLK_CFG_400			(JHB100_PER2CLK_NUM_CLKS + 1)
+#define JHB100_PER2CLK_CFG_125			(JHB100_PER2CLK_NUM_CLKS + 2)
+#define JHB100_PER2CLK_GMAC2_RGMII_RX		(JHB100_PER2CLK_NUM_CLKS + 3)
+#define JHB100_PER2CLK_GMAC2_RMII_REF		(JHB100_PER2CLK_NUM_CLKS + 4)
+#define JHB100_PER2CLK_GMAC3_SGMII_TX		(JHB100_PER2CLK_NUM_CLKS + 5)
+#define JHB100_PER2CLK_GMAC3_SGMII_RX		(JHB100_PER2CLK_NUM_CLKS + 6)
+#define JHB100_PER2CLK_OSC			(JHB100_PER2CLK_NUM_CLKS + 7)
+
+static const char * const jhb100_per2_ext_clk[] = {
+	"ncnoc_init",
+	"cfg_400",
+	"cfg_125",
+	"gmac2_rgmii_rx",
+	"gmac2_rmii_ref",
+	"gmac3_sgmii_tx",
+	"gmac3_sgmii_rx",
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
+static const struct jh71x0_clk_data jhb100_per2crg_clk_data[] = {
+	JH71X0__DIV(JHB100_PER2CLK_300, "per2_300", 2,
+		    JHB100_PER2CLK_NCNOC_INIT),
+	JH71X0__DIV(JHB100_PER2CLK_100, "per2_100", 4,
+		    JHB100_PER2CLK_CFG_400),
+	JH71X0__DIV(JHB100_PER2CLK_50, "per2_50", 2,
+		    JHB100_PER2CLK_100),
+	JH71X0__DIV(JHB100_PER2CLK_GMAC2_RMII_50, "gmac2_rmii_50", 2,
+		    JHB100_PER2CLK_100),
+	JH71X0__DIV(JHB100_PER2CLK_CAN0_CORE_DIV, "can0_core_div", 20,
+		    JHB100_PER2CLK_CFG_400),
+	JH71X0__DIV(JHB100_PER2CLK_CAN1_CORE_DIV, "can1_core_div", 20,
+		    JHB100_PER2CLK_CFG_400),
+	JH71X0__DIV(JHB100_PER2CLK_CAN0_TIMER, "can0_timer", 100,
+		    JHB100_PER2CLK_100),
+	JH71X0__DIV(JHB100_PER2CLK_CAN1_TIMER, "can1_timer", 100,
+		    JHB100_PER2CLK_100),
+	JH71X0__DIV(JHB100_PER2CLK_RTC_CORE_DIV, "rtc_core_div", 763,
+		    JHB100_PER2CLK_OSC),
+	JH71X0__MUX(JHB100_PER2CLK_GMAC2_RMII_MUX_DLY, "gmac2_rmii_mux_dly", 0, 2,
+		    JHB100_PER2CLK_GMAC2_RMII_REF,
+		    JHB100_PER2CLK_GMAC2_RMII_50),
+	JH71X0__DIV(JHB100_PER2CLK_GMAC2_RMII_DIV, "gmac2_rmii_div", 20,
+		    JHB100_PER2CLK_GMAC2_RMII_MUX_DLY),
+	JH71X0__MUX(JHB100_PER2CLK_GMAC2_RGMII_125_MUX, "gmac2_rgmii_125_mux", 0, 2,
+		    JHB100_PER2CLK_GMAC2_RGMII_RX,
+		    JHB100_PER2CLK_CFG_125),
+	JH71X0__DIV(JHB100_PER2CLK_GMAC2_RGMII_DIV, "gmac2_rgmii_div", 50,
+		    JHB100_PER2CLK_CFG_125),
+	JH71X0__MUX(JHB100_PER2CLK_GMAC2_TX_MUX, "gmac2_tx_mux", 0, 2,
+		    JHB100_PER2CLK_GMAC2_RMII_DIV,
+		    JHB100_PER2CLK_GMAC2_RGMII_DIV),
+	JH71X0__INV(JHB100_PER2CLK_GMAC2_TX_180_BUF, "gmac2_tx_180_buf",
+		    JHB100_PER2CLK_GMAC2_TX_MUX),
+	JH71X0__MUX(JHB100_PER2CLK_GMAC2_RX_MUX_DLY, "gmac2_rx_mux_dly", 0, 2,
+		    JHB100_PER2CLK_GMAC2_RMII_DIV,
+		    JHB100_PER2CLK_GMAC2_RGMII_125_MUX),
+	JH71X0__INV(JHB100_PER2CLK_GMAC2_RX_180_BUF, "gmac2_rx_180_buf",
+		    JHB100_PER2CLK_GMAC2_RX_MUX_DLY),
+	JH71X0__MUX(JHB100_PER2CLK_GMAC2_TXCK_MUX_DLY, "gmac2_txck_mux_dly", 0, 2,
+		    JHB100_PER2CLK_GMAC2_RMII_50,
+		    JHB100_PER2CLK_GMAC2_TX_MUX),
+	JH71X0__MUX(JHB100_PER2CLK_GMAC3_TX_125_MUX, "gmac3_tx_125_mux", 0, 2,
+		    JHB100_PER2CLK_GMAC3_SGMII_TX,
+		    JHB100_PER2CLK_CFG_125),
+	JH71X0__MUX(JHB100_PER2CLK_GMAC3_RX_125_MUX, "gmac3_rx_125_mux", 0, 2,
+		    JHB100_PER2CLK_GMAC3_SGMII_RX,
+		    JHB100_PER2CLK_CFG_125),
+	JH71X0__DIV(JHB100_PER2CLK_GMAC3_TX_DIV, "gmac3_tx_div", 50,
+		    JHB100_PER2CLK_GMAC3_TX_125_MUX),
+	JH71X0__DIV(JHB100_PER2CLK_GMAC3_RX_DIV, "gmac3_rx_div", 50,
+		    JHB100_PER2CLK_GMAC3_RX_125_MUX),
+	JH71X0_GATE(JHB100_PER2CLK_SENSORS_PERIPH2, "sensors_periph2", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_FAN_TACH_PCLK, "fan_tach_pclk", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER0_RMIIANDRGMII_TX_I, "ether0_rmiiandrgmii_tx_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC2_TX_MUX),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER0_RMIIANDRGMII_RX_I, "ether0_rmiiandrgmii_rx_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC2_RX_MUX_DLY),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER0_RMIIANDRGMII_TX_180_I, "ether0_rmiiandrgmii_tx_180_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC2_TX_180_BUF),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER0_RMIIANDRGMII_RX_180_I, "ether0_rmiiandrgmii_rx_180_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC2_RX_180_BUF),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER0_RMIIANDRGMII_PTP_REF_I, "ether0_rmiiandrgmii_ptp_ref_i",
+		    0, JHB100_PER2CLK_50),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER0_RMIIANDRGMII_RMII_I, "ether0_rmiiandrgmii_rmii_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC2_RMII_MUX_DLY),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER0_RMIIANDRGMII_CSR_I, "ether0_rmiiandrgmii_csr_i",
+		    0, JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER0_RMIIANDRGMII_ACLK_I, "ether0_rmiiandrgmii_aclk_i",
+		    0, JHB100_PER2CLK_300),
+	JH71X0_GATE(JHB100_PER2CLK_RMIIANDRGMII_IOMUX_GMAC2_TXCK, "rmiiandrgmii_iomux_gmac2_txck",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC2_TXCK_MUX_DLY),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_TX_I, "ether1_sgmii_tx_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC3_TX_DIV),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_RX_I, "ether1_sgmii_rx_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC3_RX_DIV),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_TX_125_I, "ether1_sgmii_tx_125_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC3_TX_125_MUX),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_RX_125_I, "ether1_sgmii_rx_125_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_GMAC3_RX_125_MUX),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_PTP_REF_I, "ether1_sgmii_ptp_ref_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_50),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_CSR_I, "ether1_sgmii_csr_i",
+		    0, JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_ACLK_I, "ether1_sgmii_aclk_i",
+		    0, JHB100_PER2CLK_300),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_PHY_PCLK_I, "ether1_sgmii_phy_pclk_i",
+		    0, JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_ETHER1_SGMII_REF_25_I, "ether1_sgmii_ref_25_i",
+		    CLK_IGNORE_UNUSED, JHB100_PER2CLK_OSC),
+	JH71X0_GATE(JHB100_PER2CLK_MAIN_ICG_EN_CAN0, "main_icg_en_can0", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_MAIN_ICG_EN_CAN1, "main_icg_en_can1", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_MAIN_ICG_EN_DMAC_8CH, "main_icg_en_dmac_8ch", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_MAIN_ICG_EN_RTC_SCAN, "main_icg_en_rtc_scan", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_MAIN_ICG_EN_ADC0, "main_icg_en_adc0", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_MAIN_ICG_EN_ADC1, "main_icg_en_adc1", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_MAIN_ICG_EN_GMAC2, "main_icg_en_gmac2", 0,
+		    JHB100_PER2CLK_100),
+	JH71X0_GATE(JHB100_PER2CLK_MAIN_ICG_EN_GMAC3, "main_icg_en_gmac3", 0,
+		    JHB100_PER2CLK_100),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_per2crg_info = {
+	.clk_data	= jhb100_per2crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_per2crg_clk_data),
+	.ext_clk	= jhb100_per2_ext_clk,
+	.num_ext_clk	= ARRAY_SIZE(jhb100_per2_ext_clk),
+	.rst_name	= "jhb100-r-per2",
+	.power_domain	= false,
+};
+
+static const struct of_device_id jhb100_per2crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-per2crg",
+		.data = &jhb100_per2crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_per2crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-per2",
+		.of_match_table = jhb100_per2crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_per2crg_driver);
-- 
2.25.1

