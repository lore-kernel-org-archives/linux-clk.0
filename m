Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2112.outbound.protection.partner.outlook.cn [139.219.146.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6F5275870;
	Fri, 28 Aug 2026 13:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787923781; cv=fail; b=YcIeZakFEnkZm7o0FeLMvMc9pjKode5Pg/ohi2IOdKOnpg+G1oi4nqE139YGVp/GIgZk9sgagdIHJCRI0tNXjcLY2o75if0T0mMPOcUJwB9dG44IJTunkyj+qc+WFncJHZezqj0ILc6n2uv3NCW+TQeYIlUKSS+Rwbx7847nlPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787923781; c=relaxed/simple;
	bh=JkVeUzcdUucKvY4laq+qe97G9rTk4VK9IpzFfkMYLMM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=U0sG4GjEoBNq3z6/NmI7h3aKfo5e9chFdWKKsk0wMc0QPJhCLc4EyNcXR8FqhsTRlAskZtV/hKQxHG+p2XsAHvkWBTMMAsOy6IxSI+UbikPYzD06jHygyzg/WAjYPC5KKmoS0DsSIyYDuvSFtXDzchk8K6SkNP5vUzdGEdiY1R4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TXHHxhFLjA6hTDYRuiYTmaGvmzlx5whQ64oN0n5ALlAS5wJMw3lep0F6j2lEVStFW3jYqpy9SDQ/iC3Kn0sv9ju4dLxRtURAM2OfQSeRpH+L26r1Qx6va0OKg5SLtzWe5dhsR3MXqThf0xAMjyjvZYn/sIowRsv7arVHZ2O66PB3+OenLWU9ngSry7e09YcP3WLnoSM3S+lOiZQN9IGpdVxTL1H8iPGisaSUl82nVHYtQ5xymIkdcENYi5/jvBIQ9g0H+WVfv3RDikJPyqCjpxJ1cXald6Kke1Kpbua9bQse2NgU3gK1XTfg6u4yDlv+Z15Q2xPIUqAvocyqd7NPSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FpBS9jAsb4G4ztET91H/zmifpH6DyT2l1kprPmj+3uI=;
 b=TgURvwHF66Vl1ACVzngVyaQE/hfU+CrSWXmwYTllepEWjCrZqBRb1NuNkWRCrNIvaSyQj6e8ZkjStqFE2w534hOXhvjxF3L0m3WOjdMwpgo2MF84HizrApE7mv9uv+XrztKKd7W6V3SMVMgua6b/ErJIPwwjgi4lonARj18nF0UTPglDE2CDsjaXEJq81DlER0Z7wjfBWPsCaWdlWdMDkzKcNqWLiLwf+Mk3MFp2rTK1Y6vt4Lnrs1iSrVgnnpmeQKLnEe7arjdaF85TjuSeQFOXIsJFBfG+h++2U2Y3BM1424OQzQ750Cdq/5VyCAZzWFXfPQ1/UqWqJXYYYkxzDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1203.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:19 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:19 +0000
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
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>
Subject: [PATCH v5 0/8] Add StarFive JHB100 syscon modules
Date: Fri, 28 Aug 2026 02:56:00 -0700
Message-Id: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0028.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:c::15) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1203:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c230a8a-b130-402f-9e2b-08df04ea9b9e
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|23010399003|366016|56012099006|10067099003|18002099003|3023799007|6133799003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	3Tsy66s3ympxxjJvvJmqtxFIsSpRU1+Wld7VqyZ1td49we97U9cgPRB5VEk1Ib4ElYS+lwl9y7AMAUYDPubXvGkbf120tXeyBQdiWUbCrj2Sa1J3YYxx2V5nded4KMo4/u/SQOJ4RNIzD04UoUxIUdfZiYedaqo1KsCmtZhdVMAeLEje8/G/efejIlYpig7/V/B3lTGEQnde+d8r3xFIIPW9G7X6MWwEzY0LH9D5gh0zyrOGncqWKjuKi8Z5gHyYmB6Ns1rSjawNiD2bc/AdFWtCLkbe/FiDY+4JnGuf10LIj82Z1lZ9HHKm4FsDRvRoIxsaa/hDYeYHmr2Xtdo1LDGJCjYH42f8NFzEG08SGrPqx8N9H+4TD6PRBHNDfLiQnHY89V7kTnDLENA2suUdH+O1eTN2DFsGvfr36s6xJZPPCg0JU1KZjQQFi7/IaEYPGPN9Xxk7ITrsoAUo79BpK5sjVbXSxAmIyA1/YUxlCGiyhcg/7BCmgok1P+9rQOIGFhsGWCB0S2rKU2yImWTeqyyQSEQD4pMe/5aS5zYcHhqjq1OCYvRiaz/UoWF0U39uM6ZH2W5kQWFB4vzcqN/4LA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(18002099003)(3023799007)(6133799003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ZHR/heQKZ+1opBOQsKxvcG7WYENa63BgjegZCASKSOAdTDl1uK8EmYdp18CI?=
 =?us-ascii?Q?e9mARAytRTrEUXZVBC8gXsMrE/gAe+w8kKdgYLZ4LZXvz/69AEEOshmZESxa?=
 =?us-ascii?Q?zJPBKINnNP1068QHMa/1aHz63MhBr+NAzZOADzVD5IswoF48PS2ildvKsyuZ?=
 =?us-ascii?Q?SLVrjVqhIgma0sHtErAdx5lvds6YYzttNFedst2biTXzrRzqcMszV5tBRsSM?=
 =?us-ascii?Q?b779ibh1nD2BhnB/a5lHW+yWUZ6XW6CN9/zDlUzu2DgGUAxVkJ6ta3UU3mIe?=
 =?us-ascii?Q?32V/JowUI303hMPJAIo3vlB1Z/EvXqTXdtVUCdTfv3tlsmvxdBtjHIBjfaFb?=
 =?us-ascii?Q?+NETJ9zZhk/7zwxCoqL77kIkA+vHiSnMU05mGgEN+w+cikzsgmQWgMMy4dQ9?=
 =?us-ascii?Q?b3iFOAPP12mWLTL41ImIEoI/DCaq3BPnql0nE2sEZtoe1faLJW1qDss5u3jb?=
 =?us-ascii?Q?b9zwNs0K14J3k2tKMkeo8mJck9K09kXGZBoB3e2Qj9EdoH7UdPr7/36+rkCj?=
 =?us-ascii?Q?QMsUxk2DGqswnlYbCUiP6ry1NiDa6kO4wkRiQU+lW1DAWGJ4jr5bq7frNeMw?=
 =?us-ascii?Q?Bl7/72zFDr3OanWYKV3pzOB/3SO1J/ShtWaHIZld5LFexPyieao802SDb/5K?=
 =?us-ascii?Q?b1vqCzbpBOKEzLrRq05+D3YFrme9US9OpX+EfWNZJ7QC5lQSA5w9/XuYvzT9?=
 =?us-ascii?Q?6Klk7+YVyX8FeEkgGZ32S3ZaxfLfYjP+PjQguBUjcAvyIxCAH0H1ZHjOE5xu?=
 =?us-ascii?Q?gJSzM1gMReT2shNu9OIB+v74tQJj50JpqhZYuqL1VH3GvhltxvNwIojBb10E?=
 =?us-ascii?Q?LkK3DM3SeZITAX8hXfpMXrSNBm4nvbNWwb0Wk5kEAWL8S/SO7SROJSaSHhIO?=
 =?us-ascii?Q?TOBNxfaL3NQRw8/MzRfFQC7tfqlWf2oOSOOzBEMIRKvH5diBe8YQ4/KHBz2K?=
 =?us-ascii?Q?8j84ZRu7OYuGv55evZ2+X19IFw0dtbk5ux2jDdziRYwOmX3d5lZZreAY5NMV?=
 =?us-ascii?Q?vx22ilUiAcFxxhhtzJmZ84LYN9uptjH0tzB/FVtSmLQN2pe9nN4qVImblhqn?=
 =?us-ascii?Q?FHvdsJf9zPpqA9A9TgcRY0o/bcwoWjZ2r2E5GESREI1mUHVN3VqVTq7n83eh?=
 =?us-ascii?Q?0iCYlg5pEanx+6xo7P3xwklvAuEZHJmh5xNNPbAq/eIJP8Pu6nuxOOjXltk7?=
 =?us-ascii?Q?+7aDKPhL+4uPSjutiWgM1wcmQhx+nDLHm93fwiRAl/U552v4kePemngyffnT?=
 =?us-ascii?Q?rjWVCz7KbVMUjGyKUVU4cPmf7rIJkIjdF8BA9NAQKQAkG89/nQzTT4Tq5Y8F?=
 =?us-ascii?Q?m9IdYrFmlGtp66PdA0MgHOZaavpfLCI13K3saIJKHi3RL1j9Q01SJAm1eIPk?=
 =?us-ascii?Q?OmTDJxl/SctUIEt5Hb7COE+56DQmzuft0FzuanXKCJhmSDo7bPpD6M4LHxhZ?=
 =?us-ascii?Q?TZ4I8juOHRUVSHOPjvEG3QU9y46EIVbZqmmSS8lR3rChjztKB1+lZ3lw6LcP?=
 =?us-ascii?Q?7n+iVckW1hOYmS7DBQcBKnj/9eXWR3hxuy3i9Qa4kAspE7kC0D0HyjZgnIFO?=
 =?us-ascii?Q?rASXpESXuzMRNiIM5GqnFzwKoq2GLTVwt4V3wT7JnynqAYPdqQ6xTYfAY6Bu?=
 =?us-ascii?Q?k5zwNxSFRFZhQYOFIr+mpzQgGoijlXTJQ2OtTO9ly7xpOoMEDYDi5hX2yc27?=
 =?us-ascii?Q?uxGG0DDSFhBHdwQySoddBVaVnNweoblkyOwfvCVPl0NY46GD9pQ7Vi3RgX/T?=
 =?us-ascii?Q?YwVw0XSGMvDBNDo6e+eKNOGaZ7QrsPckbfZwa1IPIQC4buAY4Ztz?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c230a8a-b130-402f-9e2b-08df04ea9b9e
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:19.2977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCesL47aL29hXwpK7UHHqDCOjVdtS1smV/v9xwNslQL5j2LhEDjsDOSrxKPIy8wKkuXSksPdeRRYBKiVCc7DtpoGS2UyTym2dUMF77IUAkk/uZni8/XWEf+JX6iR/B3M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1203

StarFive JHB100 has many syscon modules, as listed below:
- pcieep0_ecsr_syscon	(PCIe endpoint 0 externel syscon)
- pcieep1_ecsr_syscon
- host0_syscon		(Host0 syscon)
- host1_syscon
- husb0_syscon		(Host USB 0 syscon)
- husb1_syscon
- husbd0_syscon		(Host USB device 0 syscon)
- husbd1_syscon
- husbcmn_syscon	(Host USB common syscon)
- gpu0_syscon		(GPU0 syscon)
- gpu1_syscon
- b2h_syscon		(BMC to Host syscon)
- h2b_syscon		(Host to BMC syscon)
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
- sfc0_filter_syscon	(SFC0 filter syscon)
- sfc1_filter_syscon
- sfc2_filter_syscon

Some syscon modules contain PLL, reset, and socinfo nodes

This series depends on the series:
https://lore.kernel.org/all/20260807112923.191627-1-changhuang.liang@starfivetech.com/

changes since v4:
PATCH 2:
- Constify name pointer
- flag ==> flags
- Use FIELD_GET() and FIELD_PREP()
- Use DEFINE_SHOW_ATTRIBUTE()
- Replace of_device_get_match_data() with device_get_match_data().
- Make the driver compatible with both MFD cell instantiation and
  direct device tree node probing.
- select STARFIVE_JHB100_SOCINFO and select MFD_SYSCON

PATCH 3:
- The changes in PATCH 2 introduced a conflict with PATCH 3, requiring
  modifications.

PATCH 7:
- Binds directly to the "starfive,jhb100-sys0-syscon" node.
- Instantiates the sys0 PLL clock driver as an MFD child cell,
  since the syscon region contains both the revision register
  and PLL controls.
- Uses devm_* APIs for automatic resource cleanup.

v4: https://lore.kernel.org/all/20260809015054.210577-1-changhuang.liang@starfivetech.com/
v3: https://lore.kernel.org/all/20260521012932.24163-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260512083521.3448-1-changhuang.liang@starfivetech.com/
V1: https://lore.kernel.org/all/20260403054945.467700-1-changhuang.liang@starfivetech.com/

Changhuang Liang (8):
  dt-bindings: soc: starfive: Add StarFive JHB100 syscon modules
  clk: starfive: Add system-0 domain PLL clock driver
  clk: starfive: Add peripheral-0 domain PLL clock driver
  clk: starfive: Add Peripheral-1 domain PLL clock driver
  reset: starfive: Introduce active_low
  reset: starfive: Add syscon reset driver support
  soc: starfive: Add socinfo driver for JHB100 SoC
  riscv: dts: starfive: jhb100: Add syscon nodes

 .../soc/starfive/starfive,jhb100-syscon.yaml  | 115 ++++
 MAINTAINERS                                   |  11 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 193 +++++-
 drivers/clk/starfive/Kconfig                  |  10 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 593 ++++++++++++++++++
 drivers/reset/starfive/Kconfig                |   9 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-common.c    |   6 +-
 .../reset/starfive/reset-starfive-common.h    |   6 +
 .../starfive/reset-starfive-jhb100-syscon.c   |  62 ++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/starfive/Kconfig                  |   6 +
 drivers/soc/starfive/Makefile                 |   2 +
 drivers/soc/starfive/socinfo/Kconfig          |  13 +
 drivers/soc/starfive/socinfo/Makefile         |   2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c | 105 ++++
 .../dt-bindings/clock/starfive,jhb100-crg.h   |  12 +
 .../dt-bindings/reset/starfive,jhb100-crg.h   |   3 +
 20 files changed, 1117 insertions(+), 35 deletions(-)
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
