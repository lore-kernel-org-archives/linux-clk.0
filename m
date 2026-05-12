Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2125.outbound.protection.partner.outlook.cn [139.219.17.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFFAA38E8D2;
	Tue, 12 May 2026 11:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778584312; cv=fail; b=g26bi6pxeRhJdDrhymdSgJ8tELAoohHRYvCLcY8/jkE1Gja7zGpFgxun1WjhHJLi5ZPFqLXQfecNfb0VGxasG8d6VgZDMzcrNwRqw0IBEaKkTDaMu7PPPy3mNhitDalQd77ypW/djBWrqMnpFHIGTeDFCGanB3xHrEXWZARJ9jI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778584312; c=relaxed/simple;
	bh=/6xHnn58rzGcU+OfidsvUtd0pHNYTLCms/7+3z1w/L0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Zuf4z+v+K31RbCbhoPKo6QWJPR1FA+ke/TZXVruOkKTfxXseILGgKmwrsM37ZPH57efsnl2SWkQqz8+PFA/p/ouNefVpmKQwFK56oQ0q7r90BwVzSYSO4SxaXwvRXshnstBlcRB3kOwkTqoEB32YBO+iPkmrP1nFcYP/iBLO6Z0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=naWMIZumZ8xH0gvva6tpCikGWiD8NU33uzpPXbkhDbtnyvDxsKywx/XlJB7G4MR9LKdNON3pnT3M1FWrqN6jubV5HM9mv478Mf6IuqnRMw7F6j7i0C5TuOd1HaJS1H2su/GGHKmXfNNoDEQ7XSTl/kq6jLJ9dARi4L3rS5FyjoM1XusowlnuxCufWORRNtknVqBwSbxrFIY3AUWe7K1rlTqjNjFhNsy9L3+LDIonHoYrYSyfKt8D91JPEuJKFDaNZX2PuDOLE5Pa1vN9mC0pefVzXtskd5CAaODWcv0/30VDphONsYfjVUAUHWWoeOCexvWKr/n+fGLjPJ4YapndSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQKD/3eN5viMBySHyqDF4Gzb0d4HhI9IzanqtABA+qE=;
 b=kk8y/R+kFPFjRdAZK8ozFAoyuTsk1LMgVAMz82JcfYjLjfbqH0U+msypaHxoRThMqRwvVTCy/a8GPflCB4mLvpx+4n+WlWAa70poBNmH0LncB/AENfT3aZtd15VCPwfC3ebpF6tYoQxWbjVyo8WbyMNoGzno36ZRPv4E5i3EU5yBEflihJcfv1HumfTesqLL6Z5dJAsr0tyucwEJPbhUujxlbmMWBCZe0ZISuDzkDZmdLQ+yAGQ3YOsDGUH3ox3nK7wNVJ7KDI/pneNXhLVd21ipRKzir6kAQmbINuyT7953GMo01u8rLOb2dUoHk+AsVHIG4abJrTN4dXL1IJUhMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:48 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:48 +0000
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
Subject: [PATCH v2 10/12] reset: starfive: Add syscon reset driver support
Date: Tue, 12 May 2026 01:35:19 -0700
Message-Id: <20260512083521.3448-11-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BJSPR01CA0012.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c211:c::24) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: e8b5f4fd-893f-495b-b82e-08deb0017771
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|22082099003|18002099003|38350700014|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	TOLN7waFepQDTk/1U3c4Pft2AVbIOSumGTWrTdtCvtdgSVYKIxbFnHLINTzX46NakDfuQLSt521Qso4eRiqgje/RH1GNrfe81VUvVovj/cnAJUqFYRJstVwLfhjCjJb0X+MuyAQHa9S5OwU9ReOve7/78UrfUZfq4YXvWe5gb9yQCyfkylDfiB11skcVYJViEjYHuu2UH2NmeCN+YdqIpeCRihbICwzvENBQEJvbbIf+3MO40sn5IYv8BCFYHoBgJS7QNtaY+UjzOi19yJnz0yBSJcsYs+DW88apMheW4grSXmM5ypDV7J8x9LpYMfcsrlbB/evvv4OHJZ+0czpCC6DQyKq9wPfzD1SLkX0OGNVuR3ABDVZTmSl3ogwea69H468hEj51DM+XNQnAWmG9SzCzoAcTzBeh4BRliFIKcKHy61l5ZZVYmnodDF6kDLLSm8z6XSNdC845JyM78KVVvequAS0W/BYKae+PgZGb7mdXC92tN03pSK47KOYmCtJiySeefNMyEE0nTE4ijH59juO48+F/2H9f1M6ivfPCCUb2JxB7MVRvzmjxxNqttkBE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(38350700014)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?2zSf56Y2f7gMiHik2gqZC45LizbIuY8Qg3AaO+/S0gb7rU0Pi1sAbcUqfepQ?=
 =?us-ascii?Q?ux5nXQMKXnYHebg0otFiLgtUYWqs/hi3WvcDMTZuyh7ep9xPL0WMFUNwEyCa?=
 =?us-ascii?Q?L91bDOWr96xZEk+H2jmd7AtIhV/zpRQ0JnFe3yrSvp6ReifMeu8Ea0HX5/J2?=
 =?us-ascii?Q?9LyxDkYb6qzfkTMfhJuW2u0qhmMy+2uCIx4AK+KoDJj5JbNKfNXnLAk4q6Tq?=
 =?us-ascii?Q?0yTMH7c1WSAMeYx3UeD6QV1IwOaWZYjNC/WXV/JqLkM9oLFVPUTCGA6yIcfk?=
 =?us-ascii?Q?1Wn3VSzXtxkmUlxFtEk8szHPPr9T/wUzmQRFsA0pHBCzx9/3mIqaXLcfzWgj?=
 =?us-ascii?Q?atGO6j7n5ma7n2agqqC75bzhj7t4WLz0W8nh4f63XL6KMaD+MrEvfiFF6U8O?=
 =?us-ascii?Q?g3zw2C5qokvGVH9ReFSprbTbtjFbtTygyLMQYIfHTTozzuU1IOqt4qG/XSfw?=
 =?us-ascii?Q?FYBOpOk2L6xjxCGgnpXMEqXwR+IjbOAkF/0bEzwXnPLkZPjtBGrnVJqwAaek?=
 =?us-ascii?Q?9AfOWwDLImCbTvIueSSp3aPLMA1hYrUaf5xqeARKPk5eqQaszTZ9aUasjPyZ?=
 =?us-ascii?Q?XM1wxYWDqz/Jc+4GrCRBp6LHG5iMLBkV6iIb09xkwcsq/jyLepnnU8pClmJO?=
 =?us-ascii?Q?+hlAKzPKaYk8pnoTUDS70rCOZCWYvMDHYpblPQ5htxA+w+tBbZi7tj2lLI3W?=
 =?us-ascii?Q?aC1a1X71kNhNmk1YkA7pNEc5n/2HJxPetef7yIAoRbjSr7sW2bM+L0Ux3/29?=
 =?us-ascii?Q?MnOCEj5hoo+dlBSvTj4QIxqMSw28m4RCX5S7rd9+O/3IA22nIEV5RcxOGhW2?=
 =?us-ascii?Q?Jb2bh1WFGPV6CrN5kK9AkKSCCsgPwAIwwec/aXUzg1HCuv1DVzM5mKQbxg1i?=
 =?us-ascii?Q?/vSOwSM2UwmdszNRmrQNqNQsDU4kl9BP/Vy34/qxSC6ubYEqMiRtUiigCI2F?=
 =?us-ascii?Q?mkK1AMrmg0MFSOj7IwTzhyGpZt9nU7FofEBRNYIASwHdC7ohWEY/fSH9mnt+?=
 =?us-ascii?Q?BvXOhEKkbbu8VG+U40gAxrsBHcBUs11vBjxaSnFYo5eaFhDx7WnDdaW+e72K?=
 =?us-ascii?Q?Fa6zUZh6lLVu2zYzbRD7z2zQH4rHkUWBvjvYh/ypzCAjEroaZA1xLGHgsw9u?=
 =?us-ascii?Q?6atoa/Jz3MN4jrPpG3Mpaaxes9GwQnuZ7uCHE/qVGvrBTJv0ti49gVqY1kfH?=
 =?us-ascii?Q?PtKXGn9nfLwcGssteenxsvhL/SBOvMDl9skln0neEN7v9jcXq4ehm4Xuoo82?=
 =?us-ascii?Q?Xai81r4BBM+/RnkYskHXo0f/x6B2nGBwqnUmy2z/RDliIJAy5dIWci1xiH0n?=
 =?us-ascii?Q?S7z4ifrPrtSXOC18kv0KH117zrsPFQvLrnQEHT2dqUCbzw2+8nHxoUk1774Y?=
 =?us-ascii?Q?jQ90FZ/mWc5J3UgAdJFSKt1hOB6V6N8H52zQoz7hMSTrQkfBcVnITfcGm2EV?=
 =?us-ascii?Q?xGahtkUyJTgEIaD/MnNno8yPbcGN205X9tPsoKOJs/16VVc7twijrgOk/Plt?=
 =?us-ascii?Q?nsg01libK041gFGY6tStDb9ixi0kRQpJlQAkxFchXXybrATqOCHWDsTE2UaK?=
 =?us-ascii?Q?jIN69Qk+QLwEsVfQ8JlKwhcC7ZGrlAj6xDeq+drVVVD1XKGHoi4luyS0REz/?=
 =?us-ascii?Q?Tq1/opiBvjZXoJTQLqtJG04NuJO82wqSmuEeaeWm9b8y5yLFFbppM1Qs9vNa?=
 =?us-ascii?Q?+zcHMNcT2aF+AHLVp60/AYkap2ebBq+/QIlbMwaXOPBo/NJELjPzHTjdlNvg?=
 =?us-ascii?Q?sjBgD/TAa7P7wFy/qK4NRsEPngxhzXRWjNOzuh5wYyRReZirSrPW?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8b5f4fd-893f-495b-b82e-08deb0017771
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:47.9812
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3A8OqSWCPvbZki4T05xo36AO6X0DCTWELE+J1/K8ujPmHNv4oQWk8D/IQgaKN+cqOFx8aTDL2qFr3USSTJjHTGz0ZgJx6ToRTx6TFd/egZZSwyHLDmNYZVitnHyCRgH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

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
index 000000000000..830840148ba5
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
+	.assert_polarity = true,
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

