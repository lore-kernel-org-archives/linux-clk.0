Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2104.outbound.protection.partner.outlook.cn [139.219.17.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9571D218ACC;
	Fri,  3 Apr 2026 05:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195407; cv=fail; b=nHC4YwEy3uC22wApb/UOEPE0VxU3LVdO+/926J6/lw1F8PrA8b47ULH6SmP/JnSl6+AdHJQyMf/2sAkufYRhaQAm7CWP5IT1OSLBro31iwNjazOvpj5wwK58yJ4MmcjUv6RMqjJ/d7WMgAZN1ZZOptSdBXBgt5/IMMAdr1KIgFo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195407; c=relaxed/simple;
	bh=fiwo+/MTuKpcgfK95zpsoBOfLS89VS1AZLNj8OhF4iM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=pnksIjvelPvtGVllJaeAf20ZN7G2qbGCvb06G+Mqdn9+nJWLUj9OSA+UcDyKKBtrMsRDWEAodFB+QdVdtPIQMoa4lmylwOnLaez7xMvnnPSL6+zdkn1tMsYZLfk7Qx/puhLLPbB+4k7iOaNGaJnuHX5WS6GO/Z+9hy62sVHLWyo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YMpdA0kFjWdkGjPbEXF9puL9KLhWoUK+ziDydUnnf4/W++rlNUmS1hSqG3Udj3Q+kyvNQgPwMioyWUMeMaGguci2B0ce8rQb1ALK2KRpvg4U9l652DcGAse+PIMiHuesm3C0bh8qvo5YKhWOK0jb2iJxG2TvAFBhE3iVdQAuLk7WYBkY9T7TjN8Ui4wJFnLC2q7HaGdwMR4x+sPZUvZ5gba2sH4uJrsCu3TZ0W4H4K/biMAAbmwexK84aFB6iyWtmdVlvUQdjy6RpWdKHkKRqdqTO63GSJgt3TXaWGtQmSfwhmOsJtXL4iShXTff78dWi0MOJoB/y1tBmWf/1SSPRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2lNH/PQo9Y0mrevQDlPG2PEOb5X8sIgZuws6X6ft+E=;
 b=cGDmz9RzRlcoZUjlaBzcr6RIcnQdjpX1O26rsYm0ZyuhdHVCuVC5hArib7mu9Yvy1IEuEdmPtT4UYKTqxrfdSkLr6ns5UtcPPLwUPBN/2cdrLw2iVu74P3yBCkyksl+SQhjlMgyHt2RULVVZVGctWK+GGsz9O+vVH+XRM8XIjPQHbwAHQGuMSrVgRay0Su5fUvDXw/a6DwZH8l2r6t2Vn5YW0PdXLrzxMP5BFYsoy0PujgMZJKHtt8fCCeIg62D2IBjl3cabMMvAv6r8FCSNqryhQFQTtE68WsMn5nSLj8prPraMK1N5BYJXBlyyihx3Ab7NuR4itH/1Ds59XFPvyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:49:58 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:49:58 +0000
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
Subject: [PATCH v1 00/13] Add StarFive JHB100 syscon modules
Date: Thu,  2 Apr 2026 22:49:32 -0700
Message-Id: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 2d866f17-3bf9-4019-0219-08de9144d6cd
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	8c/kTRKAipSWgmAOo35MtTBQD/o7eOD3QdIN1TF2T18DIH6wAtLZMJgoxDH6xzqwte5z79/Vb155+Ui+dhM+Sh1OClf2zHGEk5ZKGMM4FjtanHz0ViE892RnYh0a4IZjinCOUIW86l1+N4wpfVKC6OEuDA0cqi+UiUVYYbW6l4TJsAOO/pCA9CPH2Qm7f/dOJMVgBI2vNIqncavYtkTRndtrfqFgDqmqUpj3cJg6YBX3Iq0zDu0fuG9euIiBTXG1nbcIPUHC2JJ6dVDj+ExVCEU+wM1GV+EMoVGdBuC+F1anTkZypBl2+m63B6UED11hqBW1b2ERgmZMCKUB8W41Y2IA+bX5m6yQxiZcPlPigPClodKWD5fE1QzO0c6gDlnUdlQUyKPrY3fVsehdjV6tXLXe0cIarsaSfOZJfRr8n8peDC7zP7ytC/hcW47hR2IY7RoTjriz++WLlLcoX9J8JX1OEf83VLBEZeM9ZbgibRLlG20lu6vZFJ+7cZ5lERHmLbHCUEadJn6DvVAUL09KLj+kQL3T+Vv8gW17BwAvBrv8dKxM8rz4iG3F0li2OatEZ0CeTIPV7IyQBJZ2di6G+Ix3QpucncupYuRgtITR2Hk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?zqhcsInxOB2017GHDzOrB9hhqyZE65QnNul+qLVCSV+yFFPAJ+/zFJWptrB4?=
 =?us-ascii?Q?uwr77b7I/iENp4qRgmeChiMfjtUAZ2NUn+oOJf80r2BEf+gBdJ8aFVrPTapP?=
 =?us-ascii?Q?fROdJ6l1a/dMh5MTeL4HzG1r7YJPUt/EGD7LNIDnd77mqnhAgQJKCLFsS1vr?=
 =?us-ascii?Q?5rQd/cU+FOiXCHrG7SaXuC5yC9Btmby1uSsrPMXFoXLwKg3qQQYr3AJpHTvv?=
 =?us-ascii?Q?pWk04odRBz6Y+q5KSnUEJKXL/kilSbmKNSZDw6Epi8BsvWmwg2sNR/5s02A7?=
 =?us-ascii?Q?GLS4KNJM+IXMlhhU01cI13HLlYT6h6KbKvrHfe6/W1ONyANEI5krxRFBkOGq?=
 =?us-ascii?Q?+vtbgEY1AsU0IOakQyValuV6hJ2d5XylkziXIrPdVhg7/vX2m7KPf6rdNtGf?=
 =?us-ascii?Q?6cPjOVoNGrDD2X4j2W5XrD102m7HjSTlaScPw2ZBaiTT39j1JCe0FHZz8dlZ?=
 =?us-ascii?Q?orNrPAAOqiczvSr3ptxEUta2g0BnDfWyszCTUFbPA80sKv97CPtG5RBAwns9?=
 =?us-ascii?Q?JAPgZ54sj6CglYNEB4wXKOuHR9PsuwWQVvYCQuZoXG5tRpSRS4XhRlGA1Omj?=
 =?us-ascii?Q?gydnw8cr4vJ5JCiVHNDHNV5wTPooCHs5te8iHcZXOjQUSCVEE7qePlIIukis?=
 =?us-ascii?Q?KbA+uxOuU9FmMoZs8OkDyP5WYDi7hBwI2w6rsM0tgBrBwa7CWnZdV7gbgv1V?=
 =?us-ascii?Q?6+0NB0fXV/fRWO5AJwvI+HlW3/+4LdXf9WeShzAgRkOjrpekaOxRS8DIb8Gu?=
 =?us-ascii?Q?g5E56mjftuZdkUxgY7LV2B19oUrRCrYHAFIKYO2xq4mYKORfgRgj3uq6jbAs?=
 =?us-ascii?Q?voJUJakWH5qK17qrWI1NDmDi6b8ug4yoX+hvA0H6O9l3XgPVi4w2IL+Vq9Qb?=
 =?us-ascii?Q?zmWTkeCFESiF1pZx+nsqL/y0ewkZGHq07KqTtwyoOSdyvw11bRmeY4UTO8kO?=
 =?us-ascii?Q?TlLeofipF0FIt2Kv+rsbzveKihQnSfhA7UeuP86rxRTzTpmTjnk1C/93mWP6?=
 =?us-ascii?Q?9thqeM9rHSYd45u5MM8k209GoNnkh6P8DlUJzrRyN0ZFIpmjAPTWKKb3rYbr?=
 =?us-ascii?Q?Rwry4bo1yqcGdo1+nVKvfgGaAsfldTjANRkCpBvSCpSIqhKvAxvvq9pnkmA/?=
 =?us-ascii?Q?XZwv8OGtHjD4lrmI6lig2IkB2sM40k7WpFUV6461jT+LSTpYlb+lCs26Zu4a?=
 =?us-ascii?Q?7GtFx3IoD29QNbt4J5w5JL+9csDovx7RYUIu+cObbXAAd8XlV7QgRdFhsT+i?=
 =?us-ascii?Q?p+s7d8C8sOOx2SAXeQy6E1AdnMQin2txkWKFuJn+Y98i85OMGBgu2+K2Z5Cl?=
 =?us-ascii?Q?I17DwTGtzal4gC2HtmzJOb34KpkxIt+eeyAB+RNvEoiSl8uXSKsTv60XMu1G?=
 =?us-ascii?Q?dBbHrzi0i0Qa33AavvkHGuyBgIbKKooU8N+8gtQJrZtQJlAL4NLQwkGBRuWK?=
 =?us-ascii?Q?flK+vW9hxweND6pk9bct5zR6WvjWaP1/c4zo0DQAKQem/YFq034qFGB7xFQN?=
 =?us-ascii?Q?ptJRb/AJS/dB6IK+HZdmn6cL1MqNh+hIFkxEpdSQXnaobIh6BdwP7JCVJ8u+?=
 =?us-ascii?Q?Ed2kYvMDwxIsKjmbEFryCIDOWIr65deCwYiGT+EoDmjNZChv3RUI973VNVhZ?=
 =?us-ascii?Q?Q94QtLDxr57VDs4TLcaOrGaYMG7dqlsqTjlUN4V7NbCR1euC9upsl6Cs/u8E?=
 =?us-ascii?Q?8YJNR8WrY6vhbHVOxLvATG8z3W5uTmCK31zB/aYb+27FXDKftQq1z8r98ugo?=
 =?us-ascii?Q?NRr72i6Q2wiOz6VGOJdROHv0IQbKOdNfLGM3v7w0oQo3e7ghTlLD?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d866f17-3bf9-4019-0219-08de9144d6cd
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:49:58.2571
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oaTsTwKr66pgryxqJQLP/blrjFnsW/1eHFlHADcfgyl+/delmEavr5PbHj8TAWStYXXHhLeYx1+mfq+Xi4u7+hi2NPvroQ9b7RQHxQclvka5y2tl2zsPn4+69SPzOyOh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

StarFive JHB100 has many syscon modules, as listed below:
- pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
- pcieep1_ecsr_syscon
- host0_syscon		(Host0 syscon)
- host1_syscon
- husb0_syscon		(Host USB 0 syscon)
- husb1_syscon
- husbd0_syscon		(Host USB device 0 syscon)
- husbd1_syscon
- husbcmn_syscon	(Host USB common)
- gpu0_syscon		(GPU0 syscon)
- gpu1_syscon
- b2h0_syscon		(BMC to Host0 syscon)
- b2h1_syscon		(BMC to Host1 syscon)
- h02b_syscon		(Host0 to BMC syscon)
- h12b_syscon		(Host1 to BMC syscon)
- vout_syscon		(Video output syscon)
- pcierp_ecsr_syscon	(PCIe root port externel syscon)
- pcierp_syscon		(PCIe root port syscon)
- usb_syscon
- npu_syscon
- per0_syscon		(Peripheral 0 syscon)
- per1_syscon
- per2_syscon
- per3_syscon
- sys0_syscon		(System 0 syscon)
- sys1_syscon
- sys2_syscon
- strap_syscon

Some syscon modules contain PLL, reset, and socinfo nodes
This series will add these syscon modules, as well as the
nodes under them.

-PATCH 1:	syscon binging
-PATCH 2-7:	syscon PLL driver
-PATCH 8-10:	syscon reset driver
-PATCH 11-12:	syscon socinfo driver
-PATCH 13:	syscon device tree

This series depends on the series:
https://lore.kernel.org/all/20260402105523.447523-1-changhuang.liang@starfivetech.com/

Changhuang Liang (13):
  dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
  dt-bindings: clock: Add system-0 domain PLL clock
  clk: starfive: Add system-0 domain PLL clock driver
  dt-bindings: clock: Add peripheral-0 domain PLL clock
  clk: starfive: Add peripheral-0 domain PLL clock driver
  dt-bindings: clock: Add peripheral-1 domain PLL clock
  clk: starfive: Add Peripheral-1 domain PLL clock driver
  dt-bindings: reset: Add StarFive JHB100 reset generator
  reset: starfive: Introduce assert_polarity
  reset: starfive: Add syscon reset driver support
  dt-bindings: hwinfo: Add starfive,jhb100-socinfo
  soc: starfive: Add socinfo driver for JHB100 SoC
  riscv: dts: starfive: jhb100: Add syscon nodes

 .../bindings/clock/starfive,jhb100-pll.yaml   |  46 ++
 .../hwinfo/starfive,jhb100-socinfo.yaml       |  36 ++
 .../reset/starfive,jhb100-reset-pcierp.yaml   |  38 ++
 .../soc/starfive/starfive,jhb100-syscon.yaml  | 140 +++++
 MAINTAINERS                                   |  11 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 220 +++++--
 drivers/clk/starfive/Kconfig                  |   8 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 554 ++++++++++++++++++
 drivers/reset/starfive/Kconfig                |   9 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-common.c    |  51 +-
 .../reset/starfive/reset-starfive-common.h    |   5 +
 .../starfive/reset-starfive-jhb100-syscon.c   |  48 ++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/starfive/Kconfig                  |   6 +
 drivers/soc/starfive/Makefile                 |   2 +
 drivers/soc/starfive/socinfo/Kconfig          |  11 +
 drivers/soc/starfive/socinfo/Makefile         |   2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c |  90 +++
 .../dt-bindings/clock/starfive,jhb100-crg.h   |  12 +
 .../dt-bindings/reset/starfive,jhb100-crg.h   |   3 +
 23 files changed, 1259 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/starfive,jhb100-pll.yaml
 create mode 100644 Documentation/devicetree/bindings/hwinfo/starfive,jhb100-socinfo.yaml
 create mode 100644 Documentation/devicetree/bindings/reset/starfive,jhb100-reset-pcierp.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100-syscon.c
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/Kconfig
 create mode 100644 drivers/soc/starfive/socinfo/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c

--
2.25.1
