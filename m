Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2129.outbound.protection.partner.outlook.cn [139.219.146.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C15340B112;
	Sat, 10 Oct 2026 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791629994; cv=fail; b=Jy6F241mfQMNp3C8/Ma+FxtNdmObafAYRX+gNZoUzAFbhhNq26VWSIeBc0xMDRuaGigKdJqVTB4StWtxJYFWV3v6CmrrNaSNkFMDI959r9ggdRqF054bglSKaq/yEfzJdR8DnJgcVhdKByvtydRNg99sPzst7N6EG7eOddy1Z/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791629994; c=relaxed/simple;
	bh=bUH+QIBSsl+/K3CUXNNEF7uShw35YSAW7SHHfkqmWH4=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=ZHcE04vMIOP9ExkRNBxA41zSvK1aM5kb71t3F+GaY3W1KO1+iKhh0rNB6AXCUbBzw0yeyqFODTYribzPjTXesQHrsPlH1HqLxi+oMC/h3HOxrp9ET7gufsR3o4p/645p+cRl+n+pgw5bqLqLQitL7P5FNmgjHnVWbpneoAzVu2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m6NIFAViLVeSbnlmvJt7rlPYfFTL0V43P9Yhzssyv43u93Y8b+6myO4tHxYHZ+44cWF2X+mmJO59xGBzN93Az6KqJKosKmE4ZGbPub8on46701w2VIM7DsTb8C+9Ad+z5ILnejLP0n5UTjTfZmNhGXyVI7g4UFzA4BWWs9uqSGfIziO+Q581pJuAjng9EuCnRK6+NgrepW+7b8JgjhHgrBDBr1X3P2GgmTXa7jhWKsTrQCPLZ75NbPaU00BZaNbLtHvnWVso0sPrusuvkArqDm/W7OjOFG2CH/tJq1uVk1umcChdUtm+3izXxUYvydAdVMB4iCvf+kyo9CyKwqjFoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZvB+dBh4xswcWTzoEeHg+YsNAhhcZP6lhlvCI9ilek=;
 b=aH7L0zrfaXe1Hvz5cOiIQIU/RTZMPGkvVmEs5P5cE2hAelidOmmcZA0AhWRXpYIy9IO7NwTNRPgNvwVrLCksSX3vrKsl4D0QsVdCPw2RgXlpHYdlieRVVo9YivTDoLuQG4kc35I2kTfmnxoCBjszZogJHyJtGRVNdWhcYgzGnhy3VYdxarCRoPucs6fYx1gGOQPUsrVCp/m89zNVTR+q9dY0Dznz4yN6L0PXmJkEvJDPf0/zK6WIwxWf0c+CM62NTaM+szNvFcM8/gyT7Zcws6lemlEPcbHtD+PGi3Zi8bgTiXFjHRxJ7VmsDBU+kbd0EBATzLe/0z9OGrBAykqawQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:11::9) by NT0PR01MB1005.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510:6::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.9; Sat, 10 Oct
 2026 10:59:36 +0000
Received: from NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
 ([fe80::1666:48e8:19e9:ad29]) by
 NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn ([fe80::1666:48e8:19e9:ad29%4])
 with mapi id 15.21.0496.017; Sat, 10 Oct 2026 10:59:36 +0000
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
Subject: [PATCH v6 0/5] Add StarFive JHB100 syscon modules
Date: Sat, 10 Oct 2026 03:58:54 -0700
Message-Id: <20261010105859.19505-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
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
X-MS-Office365-Filtering-Correlation-Id: 3e1b08b9-814e-437f-f3e7-08df26bd92c9
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|23010399003|18002099003|10067099003|3023799007|261009223027099003|38350700014|56012099006;
X-Microsoft-Antispam-Message-Info:
	eTb4NDQ6rf6ZOzGqYAlFsBcIKfJt1ocAAyVGpMV5uUdTUV5xLbwAasukeWdn3Cir18g2/3EUgVexT1EHpWAx7k1YFcsGWhcpNIrWW52tXfshFKWE6CTftXQcs4kT2ULF0RN8NX7owh17aX+O8bnqG/t1eMdMhCEfwwEswMLCKezMUKiPb72jp1nSIHldH/H3fvTya6ALmGuQph/QXPd/S/owfefmLgOQx+STYBNvTUAkp5GG+fG18DcL6f22rTVUiOqemiYsoeHX5AA9nXM/N/N3q0mzIDQ0DS1xx50N7m4mAHvjYyJ+m6uui6IAAz43XDpYwHSQK9Qs0LMUB1sEiOuszI6Kj2gcsytqqtwwxRjg4+yWabmz9mNaMx1tIafGsKW1q/vV2GeB9geOZyRqvL6UmUTeTR9ARPl+Xv2o7c1nhMKvwc8Gb1BWaIo/jvgYCAM4q8CjRVyaL2t7ihIgdZVCzfAlFS6ufcMx9gMqjqNjhNV0isLWiD8EjSaETaXoGmimoXM7YOBW6tqe6B1sT0d0FFymjxBmeEIrua1oASwhCVfq++GJHwoMIMxBqlsN
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(23010399003)(18002099003)(10067099003)(3023799007)(261009223027099003)(38350700014)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DvdYbBi+olukfqm7neEYgKywhw+uKg4S+z++4vmcYrdR5kjULDpdtLnww/i0?=
 =?us-ascii?Q?oiFq8w/tTh6t1UTzZLLPnlBmx2mxw+AYpb11+hF6Gwu5LwwXwXzmABAFIteT?=
 =?us-ascii?Q?yqeM7PxL9W6qMbcZwut+ZYr7hzJBWXBVfg9JMRpE5fXRl85qAE3gS+xXcqY6?=
 =?us-ascii?Q?daBtlYHte4SiFJSD/BzweVt0GUImbUYMueutcHRDtCTBdnCdZr5XC7eac/FN?=
 =?us-ascii?Q?dCR/nVUTKcVsShPT29hW4gTTEXItCG2Dh6UPJBaQ+t6RMunhDlZv8tbVZ0Ln?=
 =?us-ascii?Q?BL1u5WDk+m/p0bB/b1utdnAYD/kt25iJx4LjrDJpK2LH+nhWdWaWkmLGBueg?=
 =?us-ascii?Q?r3M9wEXMOMpzUZm8rLT6fPGiHibZnMK8Lk9BAIBr3sXX/hCDnDj5Ql+M4sG8?=
 =?us-ascii?Q?gPWVGerY5LfGq/JYPR5fllYOfx1kOIXzBurlxGGpK3zGR6/TJU9n2LCAWs7H?=
 =?us-ascii?Q?KH8geqZ/TeEpdBoCApBcQv63udZ9Q4CMx0rv+1ZP9REglQ+tRNe6+52Lc1Xh?=
 =?us-ascii?Q?cUaMdgEZbc6jtsFYpRln1MVVTMnUYLEEx9FLWUpFefVEmum4O9829fcnCfX8?=
 =?us-ascii?Q?rjOXvVCyvqP6oVtWf9FXOrh/GlSk4vRUMGA9/BAsbVixq7g5R18SBjPeXPuh?=
 =?us-ascii?Q?0UKAK5v+s/db5hhnVtxQRx5cwlFaEEK4BsrnDMvjBZHxWSOPSfoTssSpKSdI?=
 =?us-ascii?Q?JdunG4QWsl9nCsnVjQh1jk1rSC+kHY4W/N2y3YyNOiPciQ6LAc/lUZh6fQjJ?=
 =?us-ascii?Q?v/iamQ8ciZ3uC3y/O2+b4QWErmm3PwYeGgvMoQfpXRgCBq0RT9e3Hg43nmk3?=
 =?us-ascii?Q?3I7+DZoZEdNGW8vHOmo5pHVDEVw8EbUFY8UMl+vPEgrAvg+QejlS/Ztxgs4t?=
 =?us-ascii?Q?YHxu+TuSg0IUKsVs7YjgG2i4a/RtkQ5zdLrRRq4MgbicbTl3qoKshlf2P2Hd?=
 =?us-ascii?Q?JdRYedCE/gzh9TU2Yi6EHsQmk/QNE7E00VZjumg7CxnG6+aqcAeFNSpdPMtc?=
 =?us-ascii?Q?qwlqSbBMOiOBs+L/dDTjufixW4C+Q1lGTMcGMGgvZS9cEcFbklqL3/U+ge7j?=
 =?us-ascii?Q?MVmdccDcv1jyklumW0QPHp1NerPNes2cOEV8YhB737++107h1ZGc5/lRE45Q?=
 =?us-ascii?Q?EHwKvesdUDd22DPCR2zPklHMGYcH7EDCudlxNY4dUM4Zm2te30Ff5zWPR4eY?=
 =?us-ascii?Q?PguaABg9P0NH6V5ZnaD/6NGo7YEZewFUEoVHLSSBSjtjD9opjrxCCv+9KYhe?=
 =?us-ascii?Q?46KVsCdEkskdU2y2avY9pjzG1sG2vJ6TQGywgC4NpJjzdfj5snGvIARObrOM?=
 =?us-ascii?Q?pqFJUjK5syzl3vwQ2ldVsUHPn3ei/pNuSzLoJo1ZYuEVNQtS3llIv+us9dgU?=
 =?us-ascii?Q?QNXiZDWoHFoJBl1PriKzd0MTDvcUKwOjBxJ9mVdoMh85UnQbZTH5MBDubAAg?=
 =?us-ascii?Q?xShWbIa4yrxavlubLLyoqX2xEkD8Q4F7j7UOEQfanygEupCFchTAVcljoWpd?=
 =?us-ascii?Q?sTBxdMZy0vV7zarwq/fDGFulGBOUga6Gn8/AIZY2XjpYF+CcGMyyseRgV4Co?=
 =?us-ascii?Q?6FtRBoonmcFAuS655DZC9B/wdnruwYPA01WdHmUMajdezQ9EMF+zqajM2IxR?=
 =?us-ascii?Q?JXEludYvDsQi8g03kLZBK/QZLBo0eYkcWLjZ9JadEQM51Us4WYw4AliLzSC2?=
 =?us-ascii?Q?iX5EExN3HAfWhveizSle0OXqgSXjoKRNUcauMn38RysX4aAkFhC9YIOrqOWe?=
 =?us-ascii?Q?jK9Niiu7ve23py0SJDVbudWSI3qlO0s8l0LhNg5FE33azBww1vQl?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e1b08b9-814e-437f-f3e7-08df26bd92c9
X-MS-Exchange-CrossTenant-AuthSource: NT0PR01MB1216.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:59:36.4684
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C7KaG+7dUIk6dzmcNQj6K2AMLBQ1rBa8wnC+pw90EM+LGtq1sZn4eLFD+U47jY4t5TrbbVZr9vO1NO9i749UQFy65rMbsWHtXtTTmri8gSXF24A9bizh+r9r03ujPUAT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: NT0PR01MB1005

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

Some syscon modules contain PLL, reset.
This series adds related drivers for PLL and reset.

This series depends on the series:
[1]: https://lore.kernel.org/all/20261008123338.11081-1-changhuang.liang@starfivetech.com/

changes since v5:
- Remove PATCH 1/7/8 in v5

PATCH 1 (in v6):
- Split a PLL into 3 clock modules: VCO, POSTDIV, and OUT.
- Implement the PLL registration as a generic interface,
  provided for specific PLLs to call.
- Since the PLL enable/disable function is optional, the new
  version decides to remove this implementation and keep the
  PLL always on. (This may differ from the email reply in v5.)
- Remove the debugfs-related implementation.
- Add a VCO operating frequency range limit for the PLL.
- Stop recording the PLL frequency, and instead calculate it
  from the multiplier factor.

PATCH 2&3(in v6):
- Make corresponding adjustments due to the changes in PATCH 1.

PATCH 5(in v6):
Make minor adjustments due to the changes in series [1],
with no functional changes:
- select RESET_STARFIVE_COMMON ==> select RESET_STARFIVE_JH71X0

v5: https://lore.kernel.org/all/20260828095608.19955-1-changhuang.liang@starfivetech.com/
v4: https://lore.kernel.org/all/20260809015054.210577-1-changhuang.liang@starfivetech.com/
v3: https://lore.kernel.org/all/20260521012932.24163-1-changhuang.liang@starfivetech.com/
v2: https://lore.kernel.org/all/20260512083521.3448-1-changhuang.liang@starfivetech.com/
V1: https://lore.kernel.org/all/20260403054945.467700-1-changhuang.liang@starfivetech.com/

Changhuang Liang (5):
  clk: starfive: Add system-0 domain PLL clock driver
  clk: starfive: Add Peripheral-0 domain PLL clock driver
  clk: starfive: Add Peripheral-1 domain PLL clock driver
  reset: starfive: Introduce active_low
  reset: starfive: Add syscon reset driver support

 drivers/clk/starfive/Kconfig                  |  28 ++
 drivers/clk/starfive/Makefile                 |   3 +
 .../starfive/clk-starfive-jhb100-per-pll.c    |  95 ++++
 .../clk/starfive/clk-starfive-jhb100-pll.c    | 425 ++++++++++++++++++
 .../clk/starfive/clk-starfive-jhb100-pll.h    |  63 +++
 .../starfive/clk-starfive-jhb100-sys0-pll.c   |  69 +++
 drivers/reset/starfive/Kconfig                |   9 +
 drivers/reset/starfive/Makefile               |   1 +
 .../reset/starfive/reset-starfive-jh71x0.c    |   3 +-
 .../reset/starfive/reset-starfive-jh71x0.h    |   6 +
 .../starfive/reset-starfive-jhb100-syscon.c   |  61 +++
 11 files changed, 762 insertions(+), 1 deletion(-)
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-per-pll.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.c
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-pll.h
 create mode 100644 drivers/clk/starfive/clk-starfive-jhb100-sys0-pll.c
 create mode 100644 drivers/reset/starfive/reset-starfive-jhb100-syscon.c

--
2.25.1
