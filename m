Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2120.outbound.protection.partner.outlook.cn [139.219.17.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E888306774;
	Thu, 21 May 2026 01:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.120
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327038; cv=fail; b=eih9L7R7zdrsolI0GrSc99HTFSYfZmntbl1IFnWiJL2lloOSYDxzmG6jPfOyhxeZh1qyZwDg4EWwq6VgcGBuum3bSFU/rnQAzGFucdccqkZZGweOeEGITzDgs6fl6Wx1QUgoaHNnHj6kop9B7mmbzvDJZAjV6yP2/PK7KIF2298=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327038; c=relaxed/simple;
	bh=SRExgt3D5ENTlKh9sdPwjo/EoRTQThBW6bFTPrt1F78=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HtOj9c3m4EGuL23KS06QlqrOGAPdJ1dZMSod+x6ZU+k3/PmmqxWlnqv91K2Ttfhj3kFaiRPcOJ5thFym8djIHeYfdfl6YiYR+8+NSDN1SvTLvo5AjzT99ehZyorb9ZsN1jxtyecO+1WbDDFh/MFm9/PnEirKDxSQnxC3l/SJ2Ew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWwJ1jqbjSrzqed96Vzr5hwhRDtRbac6yUY+63jRNXy3oDlhf7rPKMztcgy/ZSwRV9TMdpqcH+acjKiF3Nc8xcP1+FAEK9FoQ1IqWUtQknaaqm4zFqu6YbNSp28Z6RqAQTKj0iQnF9TnJ1UIyfeKUhQcwGN5661mzi1523QAe/qgw5OtDhNJz4PwvuTpzI85pUwvEVRppIN9V3Dt0w6TinBb2kCd2cUf9PdE7Occmi+Dy7dcXxGlNMj7GgY348HH2hQ6aF6jG3ZQME/1kkmgOvKIwg+N2ifSI7x2YMnaFE2UlsTt7mavaOVQeRgfwpJFdQ/a5qlWY06uNCtiYowXcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VaM2YYh3f0rPbMu+GLZd6Cj0nDpNQwolnl7lAAnllIg=;
 b=j67yGEKEthgubhznIhm9iHPpRr1/yWz76g9eNld8WmqDOBqTDlUAgAaFmYyRsZix44C2itt6i95YlQg1Z1JgYx30GdmyiqjvOPQEXyFk3Qc7xc8pWzItpKExiRiZAcpCFMxRMkrp23yV7GoYBnQzEdosEW/4s+VoGK40x9CG9uaCGrk8nY7FPKVwjYTrxIjFMZT1ck+sMIZcx4D+6X4wJ/tiqnXh2VvZhG2I9mEud7wukM4JzYwljlLiFGAf/0IT/xU/SCZYRYszbwKk0A3BeZs/0cgQC9ZdbFE3jPfXOCgcsgsxNOExxDcNp4/yyjv4IBUkNbDcvHJUmNDtvnIGkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:56 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:56 +0000
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
Subject: [PATCH v3 6/8] reset: starfive: Add syscon reset driver support
Date: Wed, 20 May 2026 18:29:30 -0700
Message-Id: <20260521012932.24163-7-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
References: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0020.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::16) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1281:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c312106-e2a2-4b28-3e19-08deb6d8771e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	C1Tl4rh1lrg3iQXd527djdxQOrW6W/T6oWrITBTacmhr87+OVPsYYR7VLoGUu2RaXXZa7NSZVuA3sC9yC1HtmLTgfBS8qCyLPjleMdRTYptytisEpW+v9FZF8pC+Jofik9ippqiq6yYFjq5lHIqhNVPFLYM6PsFLaO2v4xqT/yahe9EZzd2nwiAAbfVL4YHwQIUkpwgDzSJT35ESKZEukU96R5nuRcr9gjTYmTH0NdGCRcZLmLd4RR0AO0xitieWK6dQH6FjSkvtFrAhyxH3wEiQvT9hq3PU+0wQSkYANwTYhKa1jHXvvvME2ysKsuLMaDIpnxpDe3yYH1kRqxGnD3NjOHCrIH1C5kgC0vZjyPXq3RqKkr/uMhJuNP0PraCfkOc4p/IrphehgAD3uI6GhlvVOhQwnA9/Kd0oc+uoQYMlT1vxKT7kpVCP4xI++QZLM5RsVlDyiMGUsg20k+Gmbp5ElnJk2Topj87/f++zqUWnGT9zClDlRMOf7uuzUFpAQ0EnS82mOlKFCLQHcsPK/U5zQ1c6JMKdqNhWw00aWX7ejuVV4U3Q0Euq3hWgupwG
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZkE6t7W3wH45q3Is9TUpNW3CVDuBPdJDDBPNJ2YQQ0R0b6E7XiyPSSM0qTSY?=
 =?us-ascii?Q?dBXRaRUEh6at6CjbCEmuW7me/4sQSHLXgTHDQHHUPwCXH+oaOGdzxJpD/wZz?=
 =?us-ascii?Q?LIBZNg0Xw87X+LoFR2AJ0oNcpWFnQ6SihBTKipmtPSphRcQAcw1wVJ9AiE70?=
 =?us-ascii?Q?KVeuyDUpGHqsxRO3SmgizPbqrJPdg3FqjLpbFU0LLAW0lKqfw/vQf+TDA+eK?=
 =?us-ascii?Q?8dfiiqLmw38lPw0kPOn60UBL5Xnsinv+9uyzAT4RLV0PDxJlgeEjr16hdI2x?=
 =?us-ascii?Q?4vU+AZ7A2PSppc3wUlXEvRHMNMNS1lGxm+4o9vcBThl0GzUMgHa/8kGeXiVF?=
 =?us-ascii?Q?/Ebup3vsynfK+fXd8ptSH5ZrSPltUgz4ZuPRDdCXpzI9g2RqKZQ+ukbvwO3z?=
 =?us-ascii?Q?wfP7buGfLcMG37qmpVeTVi0HuFOyHoSmtMHIdEADXYo3tmyO2/4O4zoDVQqT?=
 =?us-ascii?Q?LdNiYq+EKBcEwP03WkVDYuJVRTiGS8qDaJjObtGC6HH8WnfbPXrFjkB+JPxR?=
 =?us-ascii?Q?5fSu3nQk/SVhcyr+aCRBaRE1iW6cN2DKTnMoikuCqlzRddUuAAkq3FdYcmiK?=
 =?us-ascii?Q?i+8DBOKDYIC0299tzgO3bQGHlM+nvX763vH0VlAqYHMhtcvoaKwfjZBX+1Xk?=
 =?us-ascii?Q?FrGOA5klZgDWQyd1J5ILa6SGCqyT//+tRdCn/qEjLezt9l6Wpm+E3gLGUYfy?=
 =?us-ascii?Q?8GqainN/M6iTf0ifJc0jjB2Q+Ane7g8Kmps3XDDbDDen/D1segs6B7MkSP0J?=
 =?us-ascii?Q?pVQK3rcN4LITlFY1xtwoJQSlz8YKbhV3unttslYSBXo8R5JhL5Ns83TsnZ98?=
 =?us-ascii?Q?Ph+tq052bDXNYi6RKCa4WX4DHP5ahRdxeSsAtpfkT1X4CzIEqvoOAgxoIvfX?=
 =?us-ascii?Q?5Fs7HG1yIaDUcN7aRd61KaYizK7azA+bQ+hKQcZtqYxMZCZtLlh+pbKkLYC7?=
 =?us-ascii?Q?o9qRJioqcVYGpkiXtRKO99PW9FX4I22IN7T/uNl8vbse3pKux9NuCLdtCwDa?=
 =?us-ascii?Q?/q8hPH13PqHA/PiYm5efoC4/3Uy2E28xI+YSjSZsr9fhFPpVs54imQkGQrHG?=
 =?us-ascii?Q?NdWunWQkTru7fhrKgX5hVoG35RsM4ozhKyZ6nXKQ4Ui+OfKRsNpV/IKBpLeG?=
 =?us-ascii?Q?brWK65L+ztBxt6D9E0KOG2S/bnzRuFEHrQqPO8DIG1scOaaTEYIUwnv9z/As?=
 =?us-ascii?Q?Kpy+Domn0/9RvtowiaN22jwWnzMbboawEAgsFCFAVjk8ozm4znRBPd+Wf0I7?=
 =?us-ascii?Q?ReLNeBjbceu52ytitIJ64lp0VNvUivnPW3GsLpXlN8CldICJtMIl/qmjfLdZ?=
 =?us-ascii?Q?36GoVhCyORCug49n+v/3BZt5GoOeIHjy7Rk8fvTxpn+q0rXlcynaFlzfPCp4?=
 =?us-ascii?Q?VvTAi+6AY1J1CMO7GeSZihpjZ9rPQBOHNOFQjXFbfRQymAvUxhP5LxAoECae?=
 =?us-ascii?Q?fX+0BkVMHTRp7PqhXKnNbNEtlUgFA/GKyiha2NxQkGtEzFEdQKk+Rbn4azs+?=
 =?us-ascii?Q?3ujo9GGgvsdT0B2lmE/oZERrQ7NAw8QgUXFSyu6xPqoRRFi8EOdYR4lWkeps?=
 =?us-ascii?Q?axjhAhb4w5hlrEXZMQnYIC/0PYbgY4xkpJf16iFBbPEJ+FBSIii2A1uo0WAC?=
 =?us-ascii?Q?bbS2yFlPSgjnCMIoR+/5DVYf93n01NRJDolbst8nACy71hLFRiRmt3rAxa46?=
 =?us-ascii?Q?uSpjkj9RnFjgm9V6PGmQF8nlZzJyxgK9kDu4PsFopDGWjJtQPrLxd8JoZVKh?=
 =?us-ascii?Q?UG78PNhRbdaQ4E4Hb3XR4TUCwRTsUTUApScmfvfhT07Tezh5zEkV?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c312106-e2a2-4b28-3e19-08deb6d8771e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:56.2123
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxXnxJm1MZj5t9/gg85/FQEusJuE9ghwC7haDWtYWUmCb21Qjhl5QvtnIfC+ntpg0HyUAqCdjRbpIRngQNba9gVpIcTSTMQT+Q2vspNi0js0o1xYNHBMG4Na4Rd/hb38
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281

Add syscon reset driver for JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/Kconfig                |  9 +++
 drivers/reset/starfive/Makefile               |  1 +
 .../starfive/reset-starfive-jhb100-syscon.c   | 62 +++++++++++++++++++
 3 files changed, 72 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100-syscon.c

diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index ce00495be6ad..5ff73469acd2 100644
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
index 000000000000..ff880de04a69
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100-syscon.c
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SYSCON Reset driver for the StarFive JHB110 SoC
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
+	.nr_resets = JHB100_PCIERP_SYSCONRST_PE2RST_OUT + 1,
+	.assert_offset = 0x14c,
+	.status_offset = 0x14c,
+	.discontigous = false,
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
+						 NULL, info, NULL);
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

