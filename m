Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn [139.219.146.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CC440D59C;
	Sat, 10 Oct 2026 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791630002; cv=fail; b=Q2cI8vZwM1iwAsq0TbdngWZLkvWLFbF1k++Se1V9NVfBM87dGoupX5NPCdKwLRmRg9P7It4nh7rUbXNJIqieItejFtmpMXzY3ncuQr86zsIyNGeuNKSIX44m9InvLUyUBAUfgMLyXHN0L1gbX85/6OB2SUey30M76yCbEw9LB20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791630002; c=relaxed/simple;
	bh=H4GaQYMwVt9ZAb6NWNj12jAy+7rDiWn4PPT7i1dh8lc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tJzTOBp0g7J+zXsmclpcocGDbE30XFsQtBNWA/nswJg2KrWqtNmRlIMbFu7mStl3CuPQ+q7lX1UAp1vuF02/Ng9XwDz1OAMl1FoGbEpLjQlAgihUThifbaphy9RrzToz6oisrEIveQWwrNfXWQpfuFGjdjYlBdubM36rnvbKvqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PUOjlpHozFF/JcHYwQYYHCQK7RNI2X8Zxri7wDeVv526asItXIVF4mu42hRmNQk3RzPAq4je0mbL9mR0nva81oaT7ESL+8jHDN13UY9IOqZLLzCJEU6/t7bib9+QbfqSES3bNhRee3/nFJ4VraqpRVi+vRuwZwxnjPve01TkG0Q8R7RZNDvBEfvkJdzu2zHR8CENMPhPni4IAox3HPrzJQXKIyMe0D6KulwtNbUAqGnd427p2EUbYtOIC5XZE2a2/YwOO2MNCxCtKoka6XbUUSd+CSQtZWnloXyvhFfOCf+n+gdoaXfDmjlC7Uo/hBVKr7R62wOXz4Q8t69yCV5+yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=owlEn9+C6tAUjFoWxNHCGkX/WpjDr/sOLYI6BqO1NA8=;
 b=MG3lXKMgj3Mbq1XrGAf8SSKsPKT4o7cg7kLNsJYlqWa5+vZ8mZOc8QqU+vaf5lzeNxKxVZMi7gPFhswm+kNX2MDJbPQPeUrCfaAL55xUS3sTAvY1cdxQUsEbcUBcy8bes05PyVg5LV+tSgnZsSz6VXbFI8cspdnyqryLPScRGyHPdZRbPljXIek5ceIU9YpGLCn/ENljOLpH3ODGcuHjXDkfmco1HT7pIaHLh8eaJ1qsLKWoF6n+W/f4scXF/Yqy2zLbI+IrApMjikVpGMwHunsTuSM38Die4SNsSRBoQyJ9EbxeDzCKeAEGhHhGj1+hWqemQk71GVUyuZCaNNp+cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.9; Sat, 10 Oct
 2026 10:59:44 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0496.017; Sat, 10 Oct 2026 10:59:44 +0000
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
Subject: [PATCH v6 5/5] reset: starfive: Add syscon reset driver support
Date: Sat, 10 Oct 2026 03:58:59 -0700
Message-Id: <20261010105859.19505-6-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 01dc00e9-26bd-4edf-598f-08df26bd97a2
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|22082099003|18002099003|10067099003|261009223027099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	pY0iu1hivDzAKaddK5Kr/RC07FwRdJzb7rG3fuP62yURSof1L8ePPq2EtIICEypZiTcVvOzaiL+zNgtJxiWj/ZMbfReUcEyc74ylfpNQyV+BexO7G+/659t4cEK/TgfikSB4kr4SdYv/6OEwwoX4IEWMoZoUeZbo6xlVFkdnhvPS/M/Abw9iMmadYXBvE7AnwdEAP1MPQUAYzSQx0vG9bwY2FBa+mWQIfdOEqWNOQy9FqF74+E9ujzHagE8VqLeSG8F0UJ6cOFjtQWDgg2Sr/55q9eMG3dVT1CT7nmCRwnHEL1eGS//eVqf5nrw7x2NFxI1Gt/k+kP0DiDMJiHcZ+Nj4D2dIJsrDtM/1ov5AGoszpAtzzS7cMvDYTXmgmJK8u9PHze4gPPzDcV+O3j8w6zLhsPmAEpqD2TfM2T8uwtLXpHQwpmkwswK3eixMKosXqNfMACVQSJObfDQQtqtCnFOT1oZG6UBSnMbBl0C0u18E0puzNPzm661gaR8tyMgeKF2WSaemo8+JCqmscUVzPuey4GhWVZm4En0AK9ozeaMi7Rd2n7dADThRW3LODkVl
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(261009223027099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6s1gTW1wx6Rzuo7HSTJF8GkSq2lLhIQISzMRNIniiDrwgklfIL6UxA4tbk2w?=
 =?us-ascii?Q?O3HWcXdKRpnrFNsjsQ6o98P//3Z93O4VlKiROjeB3H6B1zAgwhJgE7RdSgZ6?=
 =?us-ascii?Q?q6w/B7xePbXvzo+/0/eVgYh88P3w5UvkUxZwvG07VPMkkHyW+t7nK2kVMGap?=
 =?us-ascii?Q?ZvjM4ol81jJ1BayS+h6CApH04MOjXVZyW6JZBrewnxTvfN76PL3sCACyQMl1?=
 =?us-ascii?Q?+nW3zaFvEygqGKapwGE+7k90adLRUs5WiAAuxisTQ1tYWjgK+pRSN1XyW08a?=
 =?us-ascii?Q?mAWAQAaEPVUrw0et18TshQz+OHgguMQ6KoQazKf1n+nS+jepHzRCDF5ykrMd?=
 =?us-ascii?Q?sPwakJprEJDKLWyUF/gulM+2Wv5TztQjxPWfTKEkqaLUOOGs1F6ZLCr+Ig9n?=
 =?us-ascii?Q?9yQXUARs/taW50IfIEO4jYwaYeJ8o0q4hQ0fJTHIB6L3ZIVKblOaGqOUz4qB?=
 =?us-ascii?Q?2j0vW+lN9mCCeLWLrlrp3dK2eQece3ufTPYN+wkGGUXZAJeiLTF8tkvUTbZP?=
 =?us-ascii?Q?Jv2FK38UeGHU6zlcJHGLvLgM25suMtw7sOAOfevrr3zJMpDlSV48GQu9hAFb?=
 =?us-ascii?Q?VBI6skb92GXZbr21JCgNh3NI9FPB8OlsIS79G5MheD4y5+W+MSrmjE71FzV+?=
 =?us-ascii?Q?qQcBAlJGDxhJlw2q1qOFAj7VDH/F00MEeO8xtqq16BDj/J3jlb2p1kdgqeID?=
 =?us-ascii?Q?0FxwwXrSyNjj/bZfhR0uJt06q4X5gXh1FI2Jh/+TPfeis1GBecrmEHdoZmw9?=
 =?us-ascii?Q?3Be24RfdA8GESNnNP+T0byfN3HcUH9yBj0K3oTPqcokuwb6Y9xalzRXVO0wF?=
 =?us-ascii?Q?i7oXaoso5PRVCeUaO827Zmpqirb1bp37C3EW2+AojmcUC3726CMxbI2DM8xf?=
 =?us-ascii?Q?MvE5gtCevbC/LUzWxEzpWcTyw79X1roNVoYTVY/QRi8x9t9chx1VGUGqro4p?=
 =?us-ascii?Q?Xb+Oah7jUHY0FZdrS0D56txFzuIrYdwyaeKQB3pO2NvntH0MGlpEEyB/p20s?=
 =?us-ascii?Q?9wX4QoA9Cim+A2gPlL3Kp5XWtjRT3amkaNumNrPg18tXI2GSAyCscNgX4Y0s?=
 =?us-ascii?Q?vaA4YRMd0M6yy6pMlHZLUUSSPzwuwGPbCKPE3HieUnGkH9yUlvxP+zaL6C1m?=
 =?us-ascii?Q?3zwY76GQISPND/97mARilDQvSzjgI265+EdZvYP3Gsm4hzj5QjshH2F/FuuT?=
 =?us-ascii?Q?JItfix0otBQ0B5oCits83LhjOOB78MqyQPr87mwyjGSVyQ6Z/2VoHFE3xGIQ?=
 =?us-ascii?Q?A94cvVe1+Aj4NacTGIX3Ixnmfs3KRg+P+fiBZNZEPs8pCo7/8/p4idesi2wv?=
 =?us-ascii?Q?0qLaLdrhlABRKgZ6L2VDgTwNH8dWodXOgSalErpefDnTT6hYlaPPRghBCDFx?=
 =?us-ascii?Q?/2EbbgryQQRxk1YKbVBYSQJ6HWauT0cU1JSEF8kGq/5ZGo0dUJuvs7u2PALJ?=
 =?us-ascii?Q?YTEyv+JWLN1sjM5/K/ngk5PoPr8fZ8EgcofEXK5PUXYTHbbGlwNGqHkcSC26?=
 =?us-ascii?Q?kZqiWk8l63CXdVDsHJ/da94vmreXQ7SGwXVf484rTTHrzMhLyUQbpL+JjJeG?=
 =?us-ascii?Q?ZYkFaH7Qb4+uT9Rmu/kaWxCMMDU5NUxTUDH1bKl25ZLf11BpOcjYg3ClW7cK?=
 =?us-ascii?Q?m/ceGyRUgAjzB80e39hRPxELusxy2UDS5LZQCrzGGjZyrR+MEJtezhSlGtby?=
 =?us-ascii?Q?41DAO4n/Bx7GQ1+pmCQrJXRdL5s2zR5sQc8KkxqfYiPT7un1LoezjAZZCML/?=
 =?us-ascii?Q?GRDXe9OPBJ9cbPz/YraZhEgRsdl7l6Rj3hFzNpuadOwckIvwhSuH?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 01dc00e9-26bd-4edf-598f-08df26bd97a2
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:59:44.5992
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5YvRA0ccbge/sRL1m9O8LZeIT3s61O7c/3Dr0y0lzaD6yTUrMkLMkiGaK2ecD+Z5Rrt2FIpWB3ynqpwr4DS+mLJWGENyZ5wq0J2K/lGBTQx89GOH2nz3Er2B32CBKsIq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1005

Add syscon reset driver for JHB100 SoC.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 drivers/reset/starfive/Kconfig                |  9 +++
 drivers/reset/starfive/Makefile               |  1 +
 .../starfive/reset-starfive-jhb100-syscon.c   | 61 +++++++++++++++++++
 3 files changed, 71 insertions(+)
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100-syscon.c

diff --git a/drivers/reset/starfive/Kconfig b/drivers/reset/starfive/Kconfig
index 84baefbaee14..be948b855c79 100644
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
+	select RESET_STARFIVE_JH71X0
+	default m if ARCH_STARFIVE
+	help
+	  This enables the SYSCON reset controller driver for the StarFive
+	  JHB100 SoC.
diff --git a/drivers/reset/starfive/Makefile b/drivers/reset/starfive/Makefile
index d781103355d3..f568938d0219 100644
--- a/drivers/reset/starfive/Makefile
+++ b/drivers/reset/starfive/Makefile
@@ -4,3 +4,4 @@ obj-$(CONFIG_RESET_STARFIVE_JH71X0)		+= reset-starfive-jh71x0.o
 obj-$(CONFIG_RESET_STARFIVE_JH7100)		+= reset-starfive-jh7100.o
 obj-$(CONFIG_RESET_STARFIVE_JH7110)		+= reset-starfive-jh7110.o
 obj-$(CONFIG_RESET_STARFIVE_JHB100)		+= reset-starfive-jhb100.o
+obj-$(CONFIG_RESET_STARFIVE_JHB100_SYSCON)	+= reset-starfive-jhb100-syscon.o
diff --git a/drivers/reset/starfive/reset-starfive-jhb100-syscon.c b/drivers/reset/starfive/reset-starfive-jhb100-syscon.c
new file mode 100644
index 000000000000..16b2333d27fe
--- /dev/null
+++ b/drivers/reset/starfive/reset-starfive-jhb100-syscon.c
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * SYSCON Reset driver for the StarFive JHB100 SoC
+ *
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ */
+
+#include <dt-bindings/reset/starfive,jhb100-crg.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
+
+#include "reset-starfive-jh71x0.h"
+
+static const struct jh71x0_reset_info jhb100_pcierp_info = {
+	.nr_resets = (JHB100_PCIERP_SYSCONRST_PE2RST_OUT + 1),
+	.assert_offset = 0x14c,
+	.status_offset = 0x14c,
+	.active_low = true,
+};
+
+static int jhb100_syscon_reset_probe(struct platform_device *pdev)
+{
+	const struct jh71x0_reset_info *info;
+	void __iomem *base;
+
+	base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
+
+	info = device_get_match_data(&pdev->dev);
+	if (!info)
+		return -ENODEV;
+
+	return reset_starfive_jh71x0_register_with_info(&pdev->dev, pdev->dev.of_node,
+							base + info->assert_offset,
+							base + info->status_offset,
+							NULL, info, THIS_MODULE);
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

