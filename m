Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2118.outbound.protection.partner.outlook.cn [139.219.17.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 608052E62C4;
	Thu, 21 May 2026 01:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327020; cv=fail; b=bW+54dAYfAwHLhqm5NQ+QwPRdTQVPvp8BIPn/yJgIpAMZuveiaNYqER3ipcFJVHmxdq+HrE6uY087j6wwLB3Cfnni1RvbwVpo/XSXO4eTWfvlrov3YhupepQC7OccJS0F3CufrW82cxQOnIXw4wMJRxjEelO2NRnZG75dxwmVro=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327020; c=relaxed/simple;
	bh=cJzVh+1EUYorTCcg3keJQ05azJ7lgo27q7JgcOVTxuA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=H2CtDljkj69Cy5BYTrhojChe6o1JiBwJ9qWwkXGOzI84Y0Cx4l2UGib0P7/jtFZAxuQbAg1V2BYzZOGcuZXEc8pEaqTrIR6RbSPIOfZ00YmWea5dZGLzG+viXgROBevpMhthb8v+hlcJkPH6tOFfBvev/1oXdoqkNG2BeAp1sRM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=laabM1hRayCDMT2FzXBGNwKD4wSCgBBRfhot4b2P6zY298J7LHkZJ6w3T9YXXJGKDT7KXuEOvfQPc38CR4fm4DYSVYXsN5p+HVEoCRo7M6JIbueWEzxAw4zgZllK92W5S/Lh1o9j8THac58lr9U3xlIxeYu1ura+iR3csHQPUCRYmJghO+lS+77eWuqmklXChMMQVA7VFLLWLgTDVL+AZwhP+QacphAx4L062DxkmdvQkxhcRHInqZGEIZujaxsx8rxYdcYUvi6Up8EJVX1UGewp93MlO5qsZl1002RdjGMTquNy7Ma5gSF9JAc4maK1ZxQyHqrdpMXPCdR5wXUgww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bzswFOA7/SXHeU7EF2BTDmK0PmFxIWMf1btwqh857YU=;
 b=BjC5t2k04Ft9BkRLfZfcQS2IRCWnYyg19ZQT9ubIPpZNLrkN6W3N27KWt4l7i2dhnJcY0gC8zQb2iOcWL+rEneoTLMn+zQb6wpzyYYg9qy48ak5Ce2p4yu6uRavUiQTp0An610KBS22W6Zt2+5qJMgjhxteNHkew+PKCB52LolS/BEBXBRGla+Br68tW23HhATX7piXO6Kkzs8c7oWHwblhZTkGFrybov5CbLr7pe5H0AWiTqrmpTcO46f1dMUrwqAd73U5in75gVyB0k9qqh9dEG8oYxtk0RGzKGIEWcb3AUZ7IC2RdJ/flRzugHJpY5zSqmPwXKLj+d0VcDNaG1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1330.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:57 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:57 +0000
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
Subject: [PATCH v3 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Date: Wed, 20 May 2026 18:29:31 -0700
Message-Id: <20260521012932.24163-8-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1330:EE_
X-MS-Office365-Filtering-Correlation-Id: d975e245-3a66-48c8-1a33-08deb6d8781c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|22082099003|18002099003|56012099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	omuhqSf3aO4dZgZdz4MvSjZS94DvVcRxTaGPd/cWY6UR7LV8ysNfM14by49J86dXJ+GNBYMeIdOCCf8Xms2Fq5A5d7LloXuHGQI3lBKingyMq4+YqGAdMpK38ZHMqh2W/GS3pqkONOcwRRmE7Jui0Eg1o60aw4va52jDCQX3JmMX3TsiQbzmgCkSYl6MDkMRg3CPnI5XGJxAz8O6fQc0+ayS4fwlg2YVGRUaPnP0JKCOyDZK4SvhT1gbfJCJBRFtpQgDJMA6M0KDp9vPsL9wAuda2wMorwSKm4J9sxmrF5Xt0QYhehMlYTQYKPcYl6iU0ILTyq5jAmYEfcgLt/ihiVu/dehpBuhyiGpMQvQNOleV1G5MztCI6+nw5LQu2WkrSklBccv1/g1qWiVWBbaK88ZoDrugVPn3OXlNFnmO1GsLZ6EOK4u3vxhA74uyZ7V9WHBjmkHCQBMkHU7MIGwkXAZdrZtedFB6W4AWdTgHPJ+r8cogyW4NGPZuD9ytA5hqrXQSiJVFJbscTkEohLBbt8Fq3dKiVrlKARt9BksQgyhj1rgQengCnx5480ICi6eAAE9tVbJw3Ser81ZqPEdFqA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(22082099003)(18002099003)(56012099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?EgYxKUsFpVLmKrZAHtle5nPCoxFo87trTVxIHwExiom72MLx1PC0WEdVNswv?=
 =?us-ascii?Q?e/mZ4Srl8c47A4rjSvWsvurSnRghPc0w2b7cTbK1glzB46nEdzEVPxHJkc5O?=
 =?us-ascii?Q?GqaeMMdDCVINnGTSHh00Q6FqRshFHZJfUijb2ns3EcqKpVDyKsmYnKEoBgt/?=
 =?us-ascii?Q?OBETlIG3wCPUJd//bkei14XkOB27ytGRj7C/ikVkvdEJ5GcNOhXKKNuRh3aJ?=
 =?us-ascii?Q?llDZptPXP0s3iy0+GEexdk+RthlCz4PDoQSPav7Cvngvkb2KvVFI8Mn2eyx+?=
 =?us-ascii?Q?XRis8QR1boNPueoJJNhcpxBDoPYa7dt3sgx3uXL+2h0cXSSjOG2Aao3GlM+0?=
 =?us-ascii?Q?FlewAJivZe+1e9DT8gl04FTeUxm029ROzRaF3H2hkTcX4PGK75EXJhkYXSMa?=
 =?us-ascii?Q?wRUmBBTlpoL++dyS94N+IiL/RG7dhgYdzm87CrmTbj+VlRZmKUtgs0RjbcoO?=
 =?us-ascii?Q?QFFe5fYjwkqu+lMW5LXHijW/5wAc15LiVn97yekW7euWgYFgDwNfdY5NphHx?=
 =?us-ascii?Q?yyJAXXwyA0m4eLt0obqCaEpFOOPpqJAqJXGshlgmiYOsIIxW/LaodPXBpLIG?=
 =?us-ascii?Q?4HETQysU2OB/wURu1acz48Pzb61rpFov1pk4ceLtn04XzaBBpRD4r2nTN4PS?=
 =?us-ascii?Q?yKTRSXkpho5sU5mfaleF/DHkaspMOSX4jRa0BeNtjuBBsOSLg0WKbrB4mB8Y?=
 =?us-ascii?Q?/yDcj6H3ehQGODdmJbwlk4mFnHAP0lWSNR6yCKp9o9jOkwjqy9QTtYGKUSil?=
 =?us-ascii?Q?dbQjKlNAv761xTKUEgn3sRuPUd5A3NmG+vDC1BpM3N1v+Bv0LuhjgOyZ1jMV?=
 =?us-ascii?Q?4TKPpGF5hG3mtUHmU/6v6N8XCVcfJe4m50fYvc2IbJwZYxqpHMC19Ik1tj0t?=
 =?us-ascii?Q?p0pLyw3Qkzq8ep/dix4sgwwi6J5ngzPmuPJeZw/CenU1GDabzz95zd5v92sh?=
 =?us-ascii?Q?lw2T6m5vQkpoM8D+HmQ+p50xaFU17bgp7Y1bBPgilf/Jc53/C8B7NIKCfVsc?=
 =?us-ascii?Q?6+iewvHIVDcNzfkrnH3nDhR26hOLqssp/4p4X7liYLpjnMN5QzXQvhmahKNJ?=
 =?us-ascii?Q?8OG861wazA+TR0qRYwgp/vYK+HpcKuzeJwCpvV04yFnsduaYl0NEse1oopf9?=
 =?us-ascii?Q?uiFU3zsfKBosaUCvf9ESQo1NHp3OPnQnlLqSKkwbzoC9tpcM1PiqIIerYfS2?=
 =?us-ascii?Q?knDSJbEVcVXH3fUYBlAdK8u56VZA9i7DZWVGaDw2ZjQ7DhxPi26TcKpQwFiO?=
 =?us-ascii?Q?Mf1iTh9GrONdw9ZTVkXiEwzsaoNFOFRr1dFoeAzoL3+FWi3dljFdeZg13M9P?=
 =?us-ascii?Q?WqwKhj7GWC56oyzf4VE4T9Ik4/ScIzw5FS4HVwp9ByrAj6/WxoGvVTy8T1N2?=
 =?us-ascii?Q?AOm8u9JtdByc7TnbCHxKniWadf/qcWiN1VpQTCKegi+ID6yRj7BI4li/srIk?=
 =?us-ascii?Q?jkzo8DFSWokCo/j+XkfPATsn4yofMr2cyz5Rj8C4RWESLop1FMfdbKLA1tAx?=
 =?us-ascii?Q?1Stvyxyn+KHD1QeIvdyKn2Y34kmqEwdbxEkKVwmSZBxJocKObnkcUsL6hyKH?=
 =?us-ascii?Q?0cRe/gxsSTl7MBe5NVbuttMcC+4T2+vZgI8MhiegaGIyBtVsQL1Z8GJiQP3Z?=
 =?us-ascii?Q?m2X/t81oJFdpD1h2bI+IBsZVXWKKgvrSoOzey8Xq2xC3942XvELvKLYQpItP?=
 =?us-ascii?Q?PrAWCWamBfpK/8sUbtgyrhzEnomBIKRiz7ed0905Ta3CaJlb28fjtabSSpOM?=
 =?us-ascii?Q?EJuqsTRxuDRcC4bTU/IaKxm3hmzu64uCECMrjzY6AHf00ltpeldi?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d975e245-3a66-48c8-1a33-08deb6d8781c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:57.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15pwyrqS2dEcxQsv/3bZbWz8hxEqitIsqRqbn3gteoKtJyeOnyAvoOa7N3oycWoTCUsXBarsaFcWkIyoNyDXHVE0Z+XA9ZiCxrYAKqwpJJgankIRzoJDPaQA/WRDtXXW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1330

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
 drivers/soc/starfive/socinfo/jhb100-socinfo.c | 80 +++++++++++++++++++
 8 files changed, 109 insertions(+)
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/Kconfig
 create mode 100644 drivers/soc/starfive/socinfo/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 6f6aac7cea95..0ee2f7bc91e3 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25559,6 +25559,7 @@ M:	Conor Dooley <conor@kernel.org>
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/soc/starfive/
+F:	drivers/soc/starfive/
 
 STARFIVE STARLINK PMU DRIVER
 M:	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
@@ -25613,6 +25614,11 @@ S:	Maintained
 F:	drivers/reset/starfive/reset-starfive-jhb1*
 F:	include/dt-bindings/reset/starfive,jhb1*.h
 
+STARFIVE JHB100 SOCINFO DRIVER
+M:	Changhuang Liang <changhuang.liang@starfivetech.com>
+S:	Maintained
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
index 000000000000..92bbab62895b
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/Kconfig
@@ -0,0 +1,11 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config STARFIVE_JHB100_SOCINFO
+	bool "StarFive JHB100 SoC Information"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select SOC_BUS
+	default y
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
index 000000000000..184568dc243b
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
@@ -0,0 +1,80 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/init.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/regmap.h>
+#include <linux/sys_soc.h>
+
+#define JHB100_REV_ID			0x38
+#define JHB100_REV_ID_CHAR		GENMASK(3, 2)
+#define JHB100_REV_ID_NUM		GENMASK(1, 0)
+
+static int __init starfive_socinfo_init(void)
+{
+	struct soc_device_attribute *attrs;
+	struct soc_device *soc_dev;
+	const char *machine = NULL;
+	struct device_node *np;
+	struct regmap *regmap;
+	char rev_char;
+	u32 rev_id;
+	int ret;
+
+	np = of_find_compatible_node(NULL, NULL, "starfive,jhb100-sys0-syscon");
+	if (!of_device_is_available(np)) {
+		of_node_put(np);
+		return -ENODEV;
+	}
+
+	regmap = syscon_node_to_regmap(np);
+	if (IS_ERR(regmap)) {
+		of_node_put(np);
+		return PTR_ERR(regmap);
+	}
+
+	ret = regmap_read(regmap, JHB100_REV_ID, &rev_id);
+	if (ret) {
+		of_node_put(np);
+		return ret;
+	}
+
+	of_node_put(np);
+
+	rev_char = (char)FIELD_GET(JHB100_REV_ID_CHAR, rev_id) + 'A';
+	rev_id = (u32)FIELD_GET(JHB100_REV_ID_NUM, rev_id);
+
+	attrs = kzalloc_obj(*attrs);
+	if (!attrs)
+		return -ENOMEM;
+
+	np = of_find_node_by_path("/");
+	of_property_read_string(np, "model", &machine);
+	if (machine)
+		attrs->machine = kstrdup(machine, GFP_KERNEL);
+	of_node_put(np);
+
+	attrs->revision = kasprintf(GFP_KERNEL, "%c%u", rev_char, rev_id);
+	attrs->family = "JH";
+	attrs->soc_id = "JHB100";
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev)) {
+		kfree(attrs->revision);
+		kfree(attrs->machine);
+		kfree(attrs);
+		return PTR_ERR(soc_dev);
+	}
+
+	pr_info("StarFive %s SoC rev(%s)\n", attrs->soc_id, attrs->revision);
+
+	return 0;
+}
+
+subsys_initcall(starfive_socinfo_init);
-- 
2.25.1

