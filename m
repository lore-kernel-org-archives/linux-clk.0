Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2412D7DC6;
	Thu, 21 May 2026 01:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779327002; cv=fail; b=jDYMIN5WOA6KkGKpDUjB4A+RffQdxhgLiYBtzme+WEWbNaL/eVTUE4+9xqAtgY+137LQCfdqVCMf8Lun60SNTztqCg9QMxm/HUgy7zphZOX0HwyO+a23krMw4Gv1IbtUHfHVpIn7zs5ZGbB/WsZdfq2+SXQI9IoYtk7kTK662pQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779327002; c=relaxed/simple;
	bh=ID9hh8LPGxoLFwkH1dIPuHqH2jyYqWRftlmHUiIWHcg=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=S4bFSIsgdWcWHYLnh/x9RnR3bIXmXjP7rJ+CI+irkqEYj04RTYjrSLO5wr9cFzy0JdniVSxLN+PuKjVvbAGRHC8EJUrPIFEwQ0STib1l9j0jm1aR69gjlRmsofdgwn7uN4v4s/rrwSCNwWVKn7OWXxlD5Pk0tObpMmwtThWLEog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TpfYmYQsNpUXIhtXl2MLpsvcXzhW4k9C6ER1jeQP9u8NBGYkP+ucYRzdrprapjmOUkkyXLNV+Wu3viz1MVwyXInbxgqv6anKfvpVZyc+23dptoRp1YIcUjcO1E9QfW03A2fK9dmQ/dRPOrLUyZD3g6desGihPy3lcqR339we7lkqTIqmpBBSJeeoZRLvyhD0WnztCcrNJWtCo7LiEz2f9/weL411OMVlbQdI8TNqh7eS9i1DgT8UOCWxR54kTRfJhJf98kDiz+5v2myWUvXsmiKrjv5n07JTW4FrZ37qUuJm/x41SSmkIgLgNYfGS7tXZGlEOCPG7/SoFVQDrNq/Ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p+C3kZg26FIxaoeyU57igUPz2nQxDnH6qwOKYGsUb2s=;
 b=O/FbqL/13WRQOK9cYa2kjzCAsS80PqFGIFcXgxIlB3wzoSnpZnOY2jSD5Jk31JjCEqUrvB8BUJn4DnARgaaUBF+xJsRvD1qq82h63UJE3PTbcXqBddXbF3VL+MLnzajhxmC6C4FbMYB+00VgERGkeLpFWBYWB2nSGC+/7uMnxY+VoGMKmiHdx3tYM1etffqw4zSCICLoCOitRcoS/Zt9xKsLHH45NYt9LI2VEy1PZMzE+EJdkO/F0HM2He86PTjZ+YpSpbtQDStildz/nrDWoh01EskC2hbklvj1FvNDFjdJLzxUB4I7W2dZYvrDNwi5cYfqLA6ZjATE4916WmxHIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1281.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.48.16; Thu, 21 May
 2026 01:29:46 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.21.0048.016; Thu, 21 May 2026 01:29:46 +0000
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
Subject: [PATCH v3 0/8] Add StarFive JHB100 syscon modules
Date: Wed, 20 May 2026 18:29:24 -0700
Message-Id: <20260521012932.24163-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 55e74a21-d6a4-495d-69e9-08deb6d8713a
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|1800799024|366016|921020|38350700014|3023799007|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	T2KYgzVVRezCO7XUA8Cj02ZTUHYDWk7x4DpZovCOn0KHnHGZJ79HNSEoCziBgmNIb4XAA/iggn+546r8gQDfkBy9bed4ZReFAyAQt97ON/KpNnQdPeZI7NnxvVeYj7/ORaFrQ6IO6xVibgpHpA97+0+U63Ivvh1NeWAZDSCfvhkhalueigNxVBEU/hN1JkYlyw2PsvL6+HF6pOx6iMBmHGQjMGlo2gRgHoU1FvT7x5fYRTkuuTAi6CIz1YIU1pctbRbpDve5h0q1WlYqScknGhwBnN3apC4t9kF0jL0Sr6rFLhsTBfevtMNOtM1pFZvJRkMJRdzAX5qpoiyPV9bk5FTbfGeG+FTbtcsBMioI6gZ1b/mI6G9euubctjrU4W7l6vAMNVpHQ9++404CXaPAwpIXmCMdZpahArryBFj4JKAoNF6Sll8/KAnYIzYpu5kUBd8Ltlj/60v/DN4UZ91AedzLSiSFQR7e1FD0C+XXQZKO871qi3J4KnnKavrmowZvVqnP4VK5EPgOvRHzEGEaetfQ2G9fINQq3o3r8yv7JZR4F4cZJ/+/5r2e8RozdYOK/cyNXY+xeOK0L9NO8fQIHA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(1800799024)(366016)(921020)(38350700014)(3023799007)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/lgPMsna/CupYJ1KdlkL6kxNXERypDHsmhxtRvr4PuDib8DO+a6MWWwbMoWX?=
 =?us-ascii?Q?9qm7vIoFWbGKlKjqDthL0Wpr0EjfPHCjReu3L27zTj4QaUi868p3qqqZLiAf?=
 =?us-ascii?Q?3pYRnWwOfHjEQXCmdFibtLaELOe5hUukdQ6FV67aWG9RNXEWj39aUKFOwDOh?=
 =?us-ascii?Q?NttvmMoN7Ebekx2GMJahSdb9d4OfSertCLwptLJjWH7tW/6vfJLfIVJo7k80?=
 =?us-ascii?Q?bqtNxia0d4PewaDF1UbJUE1uUkqFcGVXuiUJfL23BteEL9pBghDuTbwXQhgn?=
 =?us-ascii?Q?70FtiwNMxvrONVxSovcHCkf313Bw3IcQIVA2E+3YkyQdk3gNXuPF8z9qIp+6?=
 =?us-ascii?Q?dyG39Cmkw4NhI8kSWaOl9r72K2GeehXLkDuZcEoYVabpIB7Pp+uG244VwtTy?=
 =?us-ascii?Q?NpMnWRLqYQmkouyQnDbYR1Q0/vP9n5yTIbuDIekpJUFT+RfZsnQhNe8AgLO2?=
 =?us-ascii?Q?DkgTdbKuS29NVvGL62MsIY+vTNXVyiefipcH0eBykR3dgLo/TrbETqTHzz1v?=
 =?us-ascii?Q?hOHPeDVaIhLx+UMvPOZldRIkxOkIahrB/B6mf/TXr7COAyJO+8frvEPo+yA4?=
 =?us-ascii?Q?P8w0qrXjXDrduBRY8dnIgXc/AwLyO6nCblXKA+LlHLcGx++QPzALafX5l8yY?=
 =?us-ascii?Q?PFI9XAnkl5+kqV0+ES2GFPh9YxiocXZktfcruHjbwdxY4FvGzfEoh/loxnOq?=
 =?us-ascii?Q?IUQviGUOJQgco9NyVF+I8REYYsRz3Z2p7IYPW71djr1gAloQRidu5EK4IWFv?=
 =?us-ascii?Q?8MsmhIqCt/lZ2b5YU+1pZQSruStNQRi+rI9z0CZYX0u74+Oo0h0ZCXNgm3Cj?=
 =?us-ascii?Q?9E/UJaIDufqdqmfq3r7oV0yKI7h4aZftWEjEAxzof+3gvQRGJ4Fdyvm462RY?=
 =?us-ascii?Q?CWt5TEzFUAzi/F+lVJ/D3zq7hDpojKEoKn1ZZKyY0vx9DncWlXvsaMkFmbHr?=
 =?us-ascii?Q?fuo7hZDVlJkjiq9x1vrnEWzXrVJE7ZHnGhbckF4A24u4P6klBZDdeX2TlrC2?=
 =?us-ascii?Q?GWXKODy15Uu0ot/s8AtVaaULuNjfQZ9WU6+s8qDQK38d3HaSkKn+b0Hi+UFZ?=
 =?us-ascii?Q?Nq0h3RFZAiTm57G2J8YjDhQYeRRuGkK+WhrX2H85xn8/5YJTupFxpozAnGjg?=
 =?us-ascii?Q?hl/p3wWntYh4vrRrn7bs6d4V/gzu+jpyO02msViXhlQoOcotxE7sl+nH6N/K?=
 =?us-ascii?Q?DizqOg8BUEDF/rM5ewVv6IVZH7Og6mgTpFTYZAzjzClkg4w9zNyy2x52o+v2?=
 =?us-ascii?Q?2frfJ6eXT8O6t3kTaZFMTfMH7iMblAQ94c6W2gmAgXUbT72oBtZiDqGHExWv?=
 =?us-ascii?Q?isAIdF+un0UjGwbryitZ+K/gWqrTBzd0PANXJzQCIz6xfLeN1oFEdwEt0RfB?=
 =?us-ascii?Q?J3K8xROiCmVSNGEKrpsLAefxUjV0IsHQH7tWhErLuvy3fpCRUZ9ndsfan0LS?=
 =?us-ascii?Q?meHLFBx6Ma+2oNNnd+I8p51PwSmx8RIrYwPEyjCa4b6Z30AUQVSmhcKHiTz/?=
 =?us-ascii?Q?ZwM6fk5yvrTCahSDW6xS41xgVT7kihwVF/XLe5WPOommCGC4lfsOC5lS+vJG?=
 =?us-ascii?Q?55/dNyMhwT0xD5Y9BpLJcNoB2Nkomcg98qmZjSeki0FaEbWCFaWRhYREUtLz?=
 =?us-ascii?Q?W8y9SZHgc3V0zan7RFq9dlRT3aKh6a2w3guPAEG16MwgUHbeV+mNkvM2oKD8?=
 =?us-ascii?Q?fTiWMhjAVruEI1XiLUKFkKjrppttTNPxFsd/nKD3NSPwgYRspJkS4EUD9tx+?=
 =?us-ascii?Q?SEOLyAUgh0yqRjThTv5tOnfb83fSVzWS4wrSzNcJhdZd2mNvFqoB?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e74a21-d6a4-495d-69e9-08deb6d8713a
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 May 2026 01:29:46.3787
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AjxZZCGKiG8/ozD6a5WNeifV8PL/RWz0nezKfLBpH1+t7Mt2L6Qk9RAl1J17PT/OcZg8eR+KPNHG3GrQ10ULIwoI0O8H6Zk+omPWVFIBNzMhgZAZzvYRJI/FN1UA6cQp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1281

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

Some syscon modules contain PLL, reset, and socinfo nodes
This series will add these syscon modules, as well as the
nodes under them.

-PATCH 1:	syscon binging
-PATCH 2/3/4:	syscon sys0/per0/per1 PLL driver
-PATCH 5/6:	syscon PCIe RP reset driver
-PATCH 7:	syscon socinfo driver
-PATCH 8:	syscon device tree

This series depends on the series:
https://lore.kernel.org/all/20260508053632.818548-1-changhuang.liang@starfivetech.com/

changes since v2:
- Squash patches 2, 4, 6, and 8 into patch 1

PATCH 1:
- Add else: clocks/#clock-cells: false
- Add else: #reset-cells: false

PATCH 5/7:
- Remove (void *) cast

PATCH 9/10:
- Rename assert_polarity to active_low

PATCH 11:
- Add drivers/soc/starfive back to the "STARFIVE SOC DRIVERS" entry
- Replace early_initcall with subsys_initcall

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

 .../soc/starfive/starfive,jhb100-syscon.yaml  | 114 ++++
 MAINTAINERS                                   |  11 +
 arch/riscv/boot/dts/starfive/jhb100.dtsi      | 180 ++++--
 drivers/clk/starfive/Kconfig                  |   8 +
 drivers/clk/starfive/Makefile                 |   1 +
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 586 ++++++++++++++++++
 drivers/reset/starfive/Kconfig                |   9 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-common.c    |   5 +-
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
 20 files changed, 1065 insertions(+), 36 deletions(-)
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
