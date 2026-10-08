Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2094.outbound.protection.partner.outlook.cn [139.219.17.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8B249B44A;
	Thu,  8 Oct 2026 12:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.94
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791462913; cv=fail; b=MSqGn6L/elSrUe47fzbeS6sna7TtJzPyD8C/ETk/X5yXoQY3atqVcy1uNL0ZBI65m+QWodkc9xUKixCrALbWGsuysr0o3TtRLrdoYgcknrmUgegM6gEuy0Fs+b+6YB4CqQVaUVJcoXgvli8H3Sx6EehrGo71O+bs2usaV17efjs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791462913; c=relaxed/simple;
	bh=hn/fM+vrqFfNbcXGlRaITjNQtwuVjbqmkPMAfvdn41o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FEsQtCdUaaK1OLIIF7tnpQ+Kp8TA5QO52jeLqVbgfKQjROFXDWcnayDRPdYoL76DP3lBLVeoLsdUnY7T/WqNEqV5eWSsZS7UJV4ofeG634pxDRDh0IGJEmIbbfwFUS5ooqg8yJdIxVo7HH0P6OuPL8yxMwDO+bD7TXyy0biVq5I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q9VCDYgghOoKUEAkidaaEfLeTcydhM0TmIFH7N31zC3AgkFu9AvOSaB0DVNk/XngEh25wYDdlZYXlIiaB3ozcNlMbahp2L6ZS0LxEmCtb6ChL2s895dxCKAh7VUX2reDmKzQPVMYZHMx/h93flFhmO4ersYGeJ+eqdbQuMHtEhLRyvfHlLc389Z1darckYZWbz79WcrVQZIXz5gAorfPYCalHPevPycz8iJB5gN52rMr04r5OFLOUffNJdTpu6OvAp2mXUy5o0Kc5vC5GzOyOwm+m/quMhOvp2ivCcW+fdflVKX9dmy8wDooCkBWZ5SVHhQr9COUaT4GdafSFT5VVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kXgZ8MQ3SOVqev/DVBU+1R4kGs8iPsgDOljQnwL8kiM=;
 b=D5AJiAcNb5WJlTZNeuCIJQwwU0Hk9PcDk9OsGSmCeOFCNiXduEWYVoyGwboaqh6RmLRh2ZIeCU89ptO2+g666Oq63QJUVXDRvkFhadUGT2aqzQgzcwR9l+dQKIN1t3NTv+fkjbJ8kKNWp5Drs1FZPbos+2DKteUl6eJM/A1OxoyXGVLgPxCc1AnEQfSfAfZoXRbr4wWzPNDvxP8FYXBvj2IpQ90oG1pPUgjpN5J1cdSDp0XitDLDpR7d8BJoJvhMKix+kVlcUyRK+yMERAa2pfoKJM1IsYgyYYvj7V2dpUxvoRNU8X3fPAAlvwUMPHXhFLSTK9cInUlO7XWheF9hDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Thu, 8 Oct
 2026 12:33:56 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0496.015; Thu, 8 Oct 2026 12:33:56 +0000
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
Subject: [PATCH v6 07/15] clk: starfive: Add JHB100 System-2 clock generator driver
Date: Thu,  8 Oct 2026 05:33:30 -0700
Message-Id: <20261008123338.11081-8-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 392c7c36-e984-43a6-ec7c-08df25386bb4
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|23010399003|366016|18002099003|22082099003|10067099003|56012099006|38350700014;
X-Microsoft-Antispam-Message-Info:
	4YmS8/BCXcW9f0JuTXcHG0uqxGYkbbiqXFHlKW7zhALTyPtafV+jjEi9AA6S4bbGEcKumPOE2bayygbN7w4r/WEOjNrYjuImBafoKwSKrckbv0Bl8plaa8nIKJKnp3+A6f8RSA0VEfwf+1ctHjvCYL6XJEAl8gWMmgxWHgcXxPQu9NWJwmq9ViGj2siOTnRqDHasJSkkDQyfAnCWuA/n39eDZDRv+MW7KcJvFpU4tsxROJ4BUgJNW4ig7JEfnfmg+oBPlr3XYGdh7Y0G/l8RKid7YQkO+Pl5UmFsQkivE1UfVIvM4KVxwI2b0q03t/ayOZSO8ma1JZSUEhaB0UI/AREC5o5Cz5t9y5+EJnn0Egn9vivPZvXx4FODZ163fUk/o0hbkFmwWigwEWfrCt+vRR1RicXD6S5e8GnLiSREl2NXaBxcQnj3Ay6HW+MPL98fiwbamnAIYgwIa3NjQJNrE/I6mNRUX9B3AZaph1am/hGsfLdhXmX1XsH9+7zFYmobX6VKdCWtPGTJwrG/O3+JegTxx5+16DVPtPe7/xESgcqfM33Nd7Fjr1z5aP0NwdbJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(10067099003)(56012099006)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zo+S15xtZ+LHeJccct7sjwSuS35ZVA7fzuWmYuPAZ0gHf2tFlWUGRvIIT2nX?=
 =?us-ascii?Q?t3LV1nfI4vvltZXmZeq2oqnN40x/SNTBqCYRprbCMS0X9kUsMjOOzCQ3QzeK?=
 =?us-ascii?Q?VALP8cR6+47oBtMPLKG1Ie+OexWCTrtyuDo9qlKmCYBnhZBLi1xjzBX9vPWp?=
 =?us-ascii?Q?nyxchvHfA+qAxaeXlSo84ShtHgvKEUgokugRce0WoXhgA0RTEt9gD7LkVXuy?=
 =?us-ascii?Q?edsH3aBtSvVnahhASZ1Ozdntf8JUXvi3mtj1l51+Dbj7y8y/go8Gb3HcD9AW?=
 =?us-ascii?Q?7FBpzIbvFxmhQBlNwxFrNWioVV6RFrcUyku57NUtNubymamdlGshztrdSFno?=
 =?us-ascii?Q?6TrWpNO/UjjNeagJkWms5JhuIemeC63+ByMwJZ6YoOwKGNsYpcYgZcCdJw+x?=
 =?us-ascii?Q?BBXm1iCnJUGibdMXEpOX39UasuTJPMoAJ9tCkIq+/qyboSp2QVs+92s0H48e?=
 =?us-ascii?Q?ium+YqSSfMq/uak3Q7gUYPov4oCKJJjJgtmVAfWswEayrilyjkaVFUZ8iaRu?=
 =?us-ascii?Q?+jazbQ5kiOx+IILvh6SgKdVN1UgDzNyaykrxBFqSMfvXfdz89O7p4/gsTuVi?=
 =?us-ascii?Q?PJp0wyGqHk9zcHpGo6kqqnozoCHf3scoTY2GWmxNgTlagYWFxjcU2RaFjCfZ?=
 =?us-ascii?Q?5PnP3yjn2qNEBleoQdf8yHBoZ3LGUDjovfPP9telJC4DBZTi+69MbqQVHxb4?=
 =?us-ascii?Q?HZUhTliutBlMpd9pi8qcHLn8dISMXZp77X3kJ4YcBaFIk2VRyjRN16+KHwGf?=
 =?us-ascii?Q?0EI5oM52oXjnmrYpN8mYMSJ304Iccv5VFepB9juUF5cs9I9tG09WdHpXXa9G?=
 =?us-ascii?Q?Dj7G+Yqv/ejL8gwfwYYZw38HA/6T8o5mSJkHadhiUUqqBntnSKWDbniu248H?=
 =?us-ascii?Q?f7FXF8Ifdc5cHB/XI3/vsM7KfXh62qMzlWihI5t1s/vGYgkmT5BAHdsqldKT?=
 =?us-ascii?Q?H+XXn57V0xOyzBhhZyoeZKIzZBBSbk6p/VNtfClfmb+nNjnWAh3RqqucL9J3?=
 =?us-ascii?Q?Zvo/Mt026Zahb4IEUj6gBU4Z4O06lH1qAwFGBVZslhDXyIqd0HlhKEQa2OMB?=
 =?us-ascii?Q?J/+a0b1eq3S/9GXup9A7lceGSrYdW8ME+H2peCg6TBxmHQOwkQjYReEXKfek?=
 =?us-ascii?Q?4D12G2MX9KoRPUzZlCbgDMzANh+pGsxs943cZFUBxFlQBO0WB2AiPTNf9dN3?=
 =?us-ascii?Q?VuKUfufSMEe4owwdwmsAsgzW8C9EsfKjpqGEK7knS8ATqlEW3di21lX28Qtm?=
 =?us-ascii?Q?k4I3CdUO6urzHrEdFY9gfLMAmFuxxiug03MQOqXMd/el7uhh9hEY31Blf0DU?=
 =?us-ascii?Q?NqJEsjO4YJlbruEVNlcu3+tHafwdrHLNSaKqI9b6AV0VVEbeL8zlMsgPM/ov?=
 =?us-ascii?Q?vuA+JZwmx6nZZ7uxKjB4zgor0ygbaXc055Iu9Qb7gTRXbvOujWK5ednd6BhX?=
 =?us-ascii?Q?Y4VkmmJiSeJGq84GBldb/NRqPZwfoYnfh/+UANbUqxIxBDjxU3LTEoXow5Z3?=
 =?us-ascii?Q?5FqVChgbcuZ7ORAaY9TIy2rG7WOhCDNH+Fcrdkn2/J6WDml3NFi+X/OU9oRO?=
 =?us-ascii?Q?JOFsFNubj1Oxkto1UNGlNhKYKtwwgC2QeegXBiBY9P7JJjPrIuxT27HFeTwy?=
 =?us-ascii?Q?rIGk3IAHxCBc615X2Dk+6QvnyMVya3pPEfrHqoAv9IJ7idBlhRuWz47mHzdj?=
 =?us-ascii?Q?gGKlzaPyoFLSoENwsonzSJ15cZ7jcZfZj1dwOr5W+75rZVi10uKUW1zQTaFd?=
 =?us-ascii?Q?bqeN3GVgo21N9maWaZtuMFFRPmLitw34PJiI9tCa80uL+RgGXNex?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 392c7c36-e984-43a6-ec7c-08df25386bb4
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2026 12:33:56.6368
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DWuvJO8mNy7ABHSvUcUDHhuGz75juNA0sBwPVS/r1RdrkkPYOeEVMuf8AUGXnpp3mvb+sqnCcyMB56xWelPTvzztrVJw1La0ZIP5d2RZGUudPUcb9hHfZnyvNgsFyBOP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Add support for JHB100 System-2 clock generator (SYS2CRG).

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/clk/starfive/Kconfig                  |  10 ++
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-sys2.c   | 135 ++++++++++++++++++
 3 files changed, 146 insertions(+)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys2.c

diff --git a/drivers/clk/starfive/Kconfig b/drivers/clk/starfive/Kconfig
index 11da8bcc4046..cfaac934a8e0 100644
--- a/drivers/clk/starfive/Kconfig
+++ b/drivers/clk/starfive/Kconfig
@@ -92,3 +92,13 @@ config CLK_STARFIVE_JHB100_SYS1
 	help
 	  Say yes here to support the system-1 clock controller on the
 	  StarFive JHB100 SoC.
+
+config CLK_STARFIVE_JHB100_SYS2
+	bool "StarFive JHB100 system-2 clock support"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select CLK_STARFIVE_JH71X0
+	select RESET_STARFIVE_JHB100 if RESET_CONTROLLER
+	default ARCH_STARFIVE
+	help
+	  Say yes here to support the system-2 clock controller on the
+	  StarFive JHB100 SoC.
diff --git a/drivers/clk/starfive/Makefile b/drivers/clk/starfive/Makefile
index 0061550e0f7e..29cdef20575e 100644
--- a/drivers/clk/starfive/Makefile
+++ b/drivers/clk/starfive/Makefile
@@ -13,3 +13,4 @@ obj-$(CONFIG_CLK_STARFIVE_JH7110_VOUT)	+= clk-starfive-jh7110-vout.o
 
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS0)		+= clk-starfive-jhb100-sys0.o
 obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS1)		+= clk-starfive-jhb100-sys1.o
+obj-$(CONFIG_CLK_STARFIVE_JHB100_SYS2)		+= clk-starfive-jhb100-sys2.o
diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys2.c b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
new file mode 100644
index 000000000000..405f45a3042a
--- /dev/null
+++ b/drivers/clk/starfive/clk-starfive-jhb100-sys2.c
@@ -0,0 +1,135 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * StarFive JHB100 System-2 Clock Driver
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
+#define JHB100_SYS2CLK_NUM_CLKS			(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG1 + 1)
+
+/* external clocks */
+#define JHB100_SYS2CLK_OSC			(JHB100_SYS2CLK_NUM_CLKS + 0)
+#define JHB100_SYS2CLK_PLL1			(JHB100_SYS2CLK_NUM_CLKS + 1)
+#define JHB100_SYS2CLK_GPU0_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 2)
+#define JHB100_SYS2CLK_GPU1_NCNOC_INIT		(JHB100_SYS2CLK_NUM_CLKS + 3)
+
+static const char * const jhb100_sys2_ext_clk[] = {
+	"osc",
+	"pll1",
+	"gpu0_ncnoc_init",
+	"gpu1_ncnoc_init",
+};
+
+/*
+ * Regarding the CLK_IS_CRITICAL flag:
+ *   Clocks flagged CLK_IS_CRITICAL feed logic that has to keep running whether
+ *   or not a consumer holds them, such as the bus interconnect and always-on
+ *   blocks. Gating them hangs the system, so they must never be disabled.
+ */
+static const struct jh71x0_clk_data jhb100_sys2crg_clk_data[] = {
+	/* jtag mst*/
+	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_HCLK, "jtagm0_hclk", 6,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_HCLK, "jtagm1_hclk", 6,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG, "jtagm0_atpg", 12,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG, "jtagm1_atpg", 12,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS2CLK_JTAGM0_ATPG_TCLOCK, "jtagm0_atpg_tclock", 2,
+		    JHB100_SYS2CLK_JTAGM0_ATPG),
+	JH71X0__DIV(JHB100_SYS2CLK_JTAGM1_ATPG_TCLOCK, "jtagm1_atpg_tclock", 2,
+		    JHB100_SYS2CLK_JTAGM1_ATPG),
+	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_HCLK, "jtag0_mst_wrap_hclk",
+		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
+	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_CLK_JTAG, "jtag0_mst_wrap_clk_jtag",
+		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_HCLK),
+	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_APB_PCLK, "jtag0_mst_wrap_apb_pclk",
+		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
+	JH71X0_GATE(JHB100_SYS2CLK_JTAG0_MST_WRAP_ATPG_TCLOCK, "jtag0_mst_wrap_atpg_tclock",
+		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM0_ATPG),
+	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_HCLK, "jtag1_mst_wrap_hclk",
+		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
+	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_CLK_JTAG, "jtag1_mst_wrap_clk_jtag",
+		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_HCLK),
+	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_APB_PCLK, "jtag1_mst_wrap_apb_pclk",
+		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),
+	JH71X0_GATE(JHB100_SYS2CLK_JTAG1_MST_WRAP_ATPG_TCLOCK, "jtag1_mst_wrap_atpg_tclock",
+		    CLK_IGNORE_UNUSED, JHB100_SYS2CLK_JTAGM1_ATPG),
+	/* hostusbcmn */
+	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSB_NCNOC_TARG, "hostusb_ncnoc_targ", 12,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS2CLK_HOSTUSBCMN_CFG_500, "hostusbcmn_cfg_500", 4,
+		    JHB100_SYS2CLK_PLL1),
+	/* bmcperiph1 */
+	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_NCNOC_TARG, "bmcper1_ncnoc_targ", 6,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_250, "bmcper1_cfg_250", 5,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0__DIV(JHB100_SYS2CLK_BMCPER1_CFG_143_DFT, "bmcper1_cfg_143_dft", 8,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0_GATE(JHB100_SYS2CLK_BMCPER1_CFG_143, "bmcper1_cfg_143", CLK_IS_CRITICAL,
+		    JHB100_SYS2CLK_BMCPER1_CFG_143_DFT),
+	/* bmcperiph0 */
+	JH71X0__DIV(JHB100_SYS2CLK_BMCPER0_NCNOC_TARG, "bmcper0_ncnoc_targ", 6,
+		    JHB100_SYS2CLK_PLL1),
+	/* gpu0 */
+	JH71X0__DIV(JHB100_SYS2CLK_GPU0_NCNOC_TARG, "gpu0_ncnoc_targ", 12,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0_GATE(JHB100_SYS2CLK_GPU0_BUS_CLK, "gpu0_bus_clk", CLK_IS_CRITICAL,
+		    JHB100_SYS2CLK_GPU0_NCNOC_INIT),
+	JH71X0_GATE(JHB100_SYS2CLK_GPU0_APB_CLK, "gpu0_apb_clk", CLK_IS_CRITICAL,
+		    JHB100_SYS2CLK_GPU0_NCNOC_TARG),
+	JH71X0_GATE(JHB100_SYS2CLK_GPU0_OSC_CLK, "gpu0_osc_clk", CLK_IS_CRITICAL,
+		    JHB100_SYS2CLK_OSC),
+	/* gpu1 */
+	JH71X0__DIV(JHB100_SYS2CLK_GPU1_NCNOC_TARG, "gpu1_ncnoc_targ", 12,
+		    JHB100_SYS2CLK_PLL1),
+	JH71X0_GATE(JHB100_SYS2CLK_GPU1_BUS_CLK, "gpu1_bus_clk", CLK_IS_CRITICAL,
+		    JHB100_SYS2CLK_GPU1_NCNOC_INIT),
+	JH71X0_GATE(JHB100_SYS2CLK_GPU1_APB_CLK, "gpu1_apb_clk", CLK_IS_CRITICAL,
+		    JHB100_SYS2CLK_GPU1_NCNOC_TARG),
+	JH71X0_GATE(JHB100_SYS2CLK_GPU1_OSC_CLK, "gpu1_osc_clk", CLK_IS_CRITICAL,
+		    JHB100_SYS2CLK_OSC),
+	/* main icg */
+	JH71X0_GATE(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG0, "main_icg_en_jtag0", 0,
+		    JHB100_SYS2CLK_JTAGM0_HCLK),
+	JH71X0_GATE(JHB100_SYS2CLK_MAIN_ICG_EN_JTAG1, "main_icg_en_jtag1", 0,
+		    JHB100_SYS2CLK_JTAGM1_HCLK),
+};
+
+static const struct jh71x0_crg_domain_info jhb100_sys2crg_info = {
+	.clk_data	= jhb100_sys2crg_clk_data,
+	.num_clk	= ARRAY_SIZE(jhb100_sys2crg_clk_data),
+	.ext_clk	= jhb100_sys2_ext_clk,
+	.num_ext_clk	= ARRAY_SIZE(jhb100_sys2_ext_clk),
+	.rst_name	= "jhb100-r-sys2",
+	.power_domain	= false,
+};
+
+static const struct of_device_id jhb100_sys2crg_match[] = {
+	{
+		.compatible = "starfive,jhb100-sys2crg",
+		.data = &jhb100_sys2crg_info,
+	},
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_sys2crg_driver = {
+	.probe = jh71x0_crg_probe,
+	.driver = {
+		.name = "clk-starfive-jhb100-sys2",
+		.of_match_table = jhb100_sys2crg_match,
+		.suppress_bind_attrs = true,
+	},
+};
+builtin_platform_driver(jhb100_sys2crg_driver);
-- 
2.25.1

