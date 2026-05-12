Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2121.outbound.protection.partner.outlook.cn [139.219.17.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9851547DD7A;
	Tue, 12 May 2026 08:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.121
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778574946; cv=fail; b=YmhNUuf7b0NCAa+05hSioZ5cf7wVooRvIxyl9RxvQ7HNk2K3IW/6k7/o/CgCs3H7C2+yaV2onUBzEXnRmn8zEDmvzwaEIoh0V94YTKd9Ed/g/hxLJkZ7SmwZawJLOks2o2AJWuNjx+Sym9GH6JJb+uByQ4/huM4tw+hSlREx29I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778574946; c=relaxed/simple;
	bh=RqW6t6px2Okw2hO7DCvPFmvwPQTANLZDUUWwnDVULGk=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=Jiun/kPi6s76eQuWMdd7wJ9TarSIpSiWt/sZ+3IY1MZ3STxZlQ6Y7T0CdFvIPzyfdG3byelT8cbyYLioRdSarZmNjCGJFpgKCIBZfVSrOKHC9X2OLtaMuWwwzkm8AjQqDJZsCLCmo50jhYJs5gBSJ3fxrzV07MSQP60OBS9RnIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XcrF6n/lgzVEh1RhUoD4FMOE8YaCzkONPgVa8uRZYm8fz4szF8kQOej8qzQ/LKU5JmRrrSLUELaS2TVJy0SNqEW5D80tk3X95IApU7SKkPyc8LAgBrfAJXsfFZYOcdNDqPjmG1rGULumCGeNCLknT5HTwomHZT4dDLBpToO9YO26tevYir2l7U9dzh0FKD6ntD1yCIklOCqcwt8GFaSZaXvbJiP0C1A+XnQmOfeBI79f2m93da1uH1BlW8zKIpr64419caN4GFjk2j06gMhqYcMvazj8SG5icjsaIYCr+0Fr9I/xjeBmbrw4PiBAOyTXCxWS/ysmujvPQz+5LiH+eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LZseIOEt8XzhgzORThX49lCh+FGinuDuS+0Hh8lykMM=;
 b=iHzg3+8kS3huwwSsfLMFgf60V2gVxw9XMLMjGrd5KepRdDXqV+9dEHiA9WHJvi7OZ6+j+cmAX7V1+ambZm+KIkSrSVcTtKY2nixqy77x43ahFBc5ZMcZtAlfBr8BNL/7FO/gprL5tkf8TQ4gEfpuVjub81/rE21FLfPCiVc2ECd87GKvp3oIjBBGvPgIaVKjVoAyJsjKrhg/YTd8bzyadMnBAptF35THgvACtkVbNOFuP3S5+Yt+mmSPXASY5N9fkodAT/rgHsG2/dlkEhiKDFTFWppsW1p/OlSzHxMocO3sxwI4QX+Zvs+TfhlIAfUEC1pkJO50uHS9feE2foOBDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1284.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:31 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:31 +0000
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
Subject: [PATCH v2 00/12] Add StarFive JHB100 syscon modules
Date: Tue, 12 May 2026 01:35:09 -0700
Message-Id: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1284:EE_
X-MS-Office365-Filtering-Correlation-Id: fdab8f72-2c40-4d9a-a053-08deb0016dc6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|18002099003|38350700014|921020|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	cBW9vrJXuMyDKRigkQBI1GY0dwrscthMXX+bcj4bjUdjUg2shdXKoBVx1Jdh6lOG/jJWSY/ClvNJgRqkKbaP9EEXqbT4EOVtT8l/DP4/R0VXS6xCb/XpFIxj0MUi93PIp2J0PCBaSRwX7Ofq1eitZ2mo2UNtJeHc/w90ff/YP4l+89jlPpY1jsyd9hgQMTXjLtBqJeSrJLNdqlpVdc1fmH0ul1jI8VFCNCJTt9uTmkc421JJ048iTvYJuqtIPV05EZbFTOROCv0VnWwu6iy2QRmtlHegBvX41jM3lfmwm3HpXNWTmzdOnDu/BuiL8bP1uD1X6NLwlmTc1OIAe7iyMUzs/8+uqUrEv9Nj7n5Zqir/qwHTtC7J4iu11EkasZG+mxbbfxO2XG23XdgBqSAOjb3jHDjmJsul7zJf4QggUTAcqUU1A2sVHk5CBgJXu/2ONXM/HM+RtDJTDNrztWB/ojeYN1HgRetautWgL+h+M1lqXrYxBYv1bDyZDmh2XQYHYkWsEqS8HtgeCFQo/+g1mvVs3ZqIMX4rOnJkMuTPncaFy3CDEM61ltIAmIRPaWgCHT7LbzhSUQcuj/BotFgw/A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(18002099003)(38350700014)(921020)(56012099003)(3023799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?t3RHoGFjqo/OTUDU/QqTG7ne5wwkMymVHHmr6SgV/w0a+V344PpZ3Wniij/s?=
 =?us-ascii?Q?coqQISF59IBbjzRa2vo0Nwauvk1lOK4Medj6aYjt+nmDzmjXo1A5LhFTAMEq?=
 =?us-ascii?Q?vgC4352/8ah50twb+BDQ5PsQeV5FafNbpk2gDT81QEbPz535VfgNj0xH4El3?=
 =?us-ascii?Q?kkuwIk+w17HYz9BrzhLNvtQnNF4jyigyUyNRENov9nIbrE42TphGmE4RAVA0?=
 =?us-ascii?Q?hy57R2E1Y8t6+jB3RtGW112SUTk3bzP/yclshq3pTFfMAlc/TSfFcXIFZHKb?=
 =?us-ascii?Q?my5HIh2sQCHvUVKrcGq3pj3OEc13O6Ty9NA7Pcubb/Hd+POp0TuGQaz4epda?=
 =?us-ascii?Q?QR36B3qBaTbic+0D6zHL+tfcI4QceYcO+uM9HBhVg8h2wWV1Uut06yYBKIjf?=
 =?us-ascii?Q?KTu6ki6jABv8ZChCbx3A5cDO40UHX/qL1TnSXHIbBTybUTDVZX1BihDmtzYP?=
 =?us-ascii?Q?spDrj+6PjMISpNASwLx88c+SlOZ9Zl9hwj/kBtBWoD2S6W74AeP+McupOyLP?=
 =?us-ascii?Q?XQRbAXgfuwJ1SKSis2c2cZFQyITRXPmncycpfloiXpH7O9ELc7RljAnNK8bB?=
 =?us-ascii?Q?1Sk29AMLbUka42m8VsHw/4kavgvwMncG/0A8PQu1FeY8YD+V8yG0KHaF9n+b?=
 =?us-ascii?Q?zrLktDSC5DufLX5YOQHN1zh9qNyaU+Xsx243Pn1GPzxPNs6D2eYiqV9Wf+pc?=
 =?us-ascii?Q?b7IJlLF6yKdQRI6uagq/lDbEZWfesFamGf8YYkwFJe90XCc39MrE9UIiRL3l?=
 =?us-ascii?Q?b5rIREiQXR7qF5o7pNmA8sO/3xaTZDkOHFEpXmoQjeoNeIQaFovAvXDrmAbX?=
 =?us-ascii?Q?husQvko/sShA3/CGiFfhNQGGVO8BGefgvM6mX4/GcS7gN5rR/9uyPN8eZ2aw?=
 =?us-ascii?Q?aRT2hBeC35T737qwyd7zOZC911qzTOw/FrBS5bygwh3IkVXTAcoji6CnpPpw?=
 =?us-ascii?Q?tXKAlQXlt9TVBNXfO5MGc4eesuDA4Z9B2ZI392gcLM2yyMyEuQx/gsIprPgz?=
 =?us-ascii?Q?Nn1uqGma5Jtl418D9prDGEQ4zGBEexvn1y909ap5Bhku/Xeq5lNGj8ojqjES?=
 =?us-ascii?Q?o4n7161WXEs2EknZ6jnD0O2+abdNg3rt6RgJJjLzYTPCjCK5Vri4PbHvx3Vv?=
 =?us-ascii?Q?KOzcCcLaR7QJS1DldtyUOrmCJyM/koy8aHmmrQl1/4dMn+Kf5XsxN+OjlJo9?=
 =?us-ascii?Q?xbEdZGckJMfWX7Tp52St0Cfm7tAUrrSvtAtH96HZZ3NhKewBDFKYa+pd2bLp?=
 =?us-ascii?Q?Y7wC2TnfNF6e9hTPJnSJP/sW5TcVDoBfdE8SgKKebpVZDvpphZtyz2r7rJzH?=
 =?us-ascii?Q?nxyKI8ujI3Hbz5fzQ5SaJxAjGpjPHYDPL1/VA946U5J6ef9nv/Y8w6xjF6q9?=
 =?us-ascii?Q?4REQ3fbhglaeIihGqI86xozhSaJG05R3+Oi9Yc5C9BZUS26r0MAMdLJDeZe9?=
 =?us-ascii?Q?Sd6z2Hmy4my/uo49m6PAsvK9PNXrYAu7jasbTMx6qwsGvCyCuG84M5te3NoU?=
 =?us-ascii?Q?FM7+f/W6UwqJ+nz96/eHK/k4bGUjUjut31yZyuu8zT/AJWIGJUalNqMsG/zC?=
 =?us-ascii?Q?h4hYWao7z90KijkrMsnxvHHrKVIHT+x2twqXy4CR+worvCEWngqSqeZno0kE?=
 =?us-ascii?Q?MW4VRegLxrmd+DO7/Ig3wBRKzvYdTBgu3T3nJ4sYleqPjsxamr3DpQRKyLbZ?=
 =?us-ascii?Q?KvpKL2HnLbpBX3mzUCOAjJBrrab5ewfGnYHn/Gu4n+iVpJu6ZO0OCx6K2yPt?=
 =?us-ascii?Q?G71HPKre1ArkxpnGRI9RPr143sGFrYw5v1F/6iXoxwy7bTE58eD9?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fdab8f72-2c40-4d9a-a053-08deb0016dc6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:31.7497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: azANyUW4/zaoDxd65FQftMdyvTh106uqwDafkpIUH7/sPwdjvw9c09gQkdpNlHfT9zwU0UpC5OIgzTiZwwkUNBzMjMri+XcjQp5DVmSlDy9LMpkozKajcUz/brheBt+g
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1284

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

Some syscon modules contain PLL, reset, and socinfo nodes
This series will add these syscon modules, as well as the
nodes under them.

-PATCH 1:	syscon binging
-PATCH 2-7:	syscon PLL driver
-PATCH 8-10:	syscon reset driver
-PATCH 11:	syscon socinfo driver
-PATCH 12:	syscon device tree

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

changes since v1:
-Remove PATCH 11

PATCH 1:
- Folded PLL and syscon reset resources into the syscon node
PATCH 2/4/6:
- Remove PLL bindings
PATCH 3:
- Use HZ_PER_MHZ
- check regmap_ return value
- check val.refdiv != 0
PATCH 8:
- Remove syscon reset binding
PATCH 11:
- Changed from platform driver model to syscon-based direct initialization
PATCH 12:
- Folded PLL and syscon reset resources into the syscon node

Changhuang Liang (12):
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
  soc: starfive: Add socinfo driver for JHB100 SoC
  riscv: dts: starfive: jhb100: Add syscon nodes

 .../soc/starfive/starfive,jhb100-syscon.yaml  | 107 ++++
 MAINTAINERS                                   |  10 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 180 ++++--
 drivers/clk/starfive/Kconfig                  |   8 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 586 ++++++++++++++++++
 drivers/reset/starfive/Kconfig                |   9 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-common.c    |  18 +-
 .../reset/starfive/reset-starfive-common.h    |   6 +
 .../starfive/reset-starfive-jhb100-syscon.c   |  62 ++
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/starfive/Kconfig                  |   6 +
 drivers/soc/starfive/Makefile                 |   2 +
 drivers/soc/starfive/socinfo/Kconfig          |  11 +
 drivers/soc/starfive/socinfo/Makefile         |   2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c |  80 +++
 .../dt-bindings/clock/starfive,jhb100-crg.h   |  12 +
 .../dt-bindings/reset/starfive,jhb100-crg.h   |   3 +
 20 files changed, 1068 insertions(+), 38 deletions(-)
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
