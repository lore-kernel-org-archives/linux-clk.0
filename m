Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2115.outbound.protection.partner.outlook.cn [139.219.146.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23FB21A6814;
	Sun,  9 Aug 2026 07:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.115
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786260332; cv=fail; b=De1i0xYyCX+6uRyGegMkvlk70MNijj3ZAROK8n9q+Pav74GxxzxThRfXYIRoRipKkxWX/CitKRKkm0+rt7H+y6U2NpNi5kV22+FjIxfYNLEIhbk0PnrrHy5B7OmoK2C588rZEuqtnboeSUGMMNJhUCtz1h38mHlHce6A8BsQ3QY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786260332; c=relaxed/simple;
	bh=z4nePmSh27ewbvfNshKYpnJSILgh70TWhvuGkQiTHVo=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=QpIVrlmxzX3e4+nrEewVO5P+dFVvlldJ3/xhhMHqFpTziRbwmh6AK4vMUgX6Jdks1C6WhaOx0OjGM//7dJrp7YKReHsVQQ/0cYB4WJWW1ESxDJPDnP4ZV5TWXZ2uq43D0Ywxwyprfa4s43035Th0rp0GIRjpzNiRLc7ZgdV2prM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aITJ4LCYN0XKQm0Am+egEBZ5rOoFUyy9d7ohdkYTUkHkQO5me9oaVP5j1jibLxxiIybfE+1pl9QJmps7Bf3FyB1ngGvnYvTVnLAqUyXSpqwoWnixIN86MOBiEKLKN0jtON87W4CkzWFZWBxYN8je/Aw49cr1Zt3HAPDYB58FzhvVHITzZi4Qs9ODXp86f6ypXqRcyoLl4NeBnr9BjoYKjDnIQooESeCudt5tPsKg1vRtx5K7rAQp1uFHD3VeyJDh/vaBQKc5ewPKQZe0wBO7Nz3F8/liwXTs5rbQ+w4q/ez2518o6pfaL69TNLc8sCgUwY4uKpVWT5BbEytxrgAbdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FzMF4gIDq6/g55vXny7c+DD0Qg+c59cAQhVB0g7hQk8=;
 b=OAm1s+3SoALMKPJPC/iUXQiUJ+8DwaJoN7QKTtgnxPrm2QYx1NZUkikR0FDtr4WM1f+Z8/B0rbXRCzV1FvxZekmpOZC1rBrFx3zAJUY/RwIw+lfhA5OVwMrjOOrG8hIkichOioKBApFRW+y/CW2OJL7rCMFH2o0oKVWoi6l/RrBUMQiJ/WfTuOHLg+SMq0pyWdJong7YY7TYEtO/3D94M8RPi4TGgDxvvNR8FYbTIO+fEJhDt/1gk0KsHLuO8H7KxYnTtS6qkLx6RZ+otuepmZ1eX1T06HcUUpNZ/udkEbgsbkq6s8PfhVjKUqoqeshO/3UKFIUuGB3DbXBpAFkGAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1265.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 01:51:03 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Sun, 9 Aug 2026 01:51:03 +0000
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
Subject: [PATCH v4 0/8] Add StarFive JHB100 syscon modules
Date: Sat,  8 Aug 2026 18:50:46 -0700
Message-Id: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: NT0PR01CA0016.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c510::18) To ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1265:EE_
X-MS-Office365-Filtering-Correlation-Id: 65b8d372-cbfb-42be-e07b-08def5b8ab7c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|376014|1800799024|23010399003|366016|921020|38350700014|56012099006|10067099003|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	MU9ebY0RAVD00AT/Pe/Payyme7N10//M5DeXgNRRRe4Wl4AFOWZPnNl+3OErowxGwbEE4+6nxhJaT33I+6ZkadAlmlDEhdQGs8S932DEPVYywVjyeq6IhHRrSuAFMkJTEkSZPd6M+D5KOJCfkjfgtdF41Drd4rwQnBl/wI8bUmwdruBVLnNXt3xx6IbdK78E7VcaAZWp+p/psHW/y8zpjiuAWCWTRrcHOr5IPGXM/l4UudOjqrL42HPP0A8fORNYgpNA4WJ92Xuqow3ICjvXMYvlbXQXlYN5WwMxjbCP8dq4EVsGrw7ptBTdSo2RnVyV7oO7wrn2sV1/eoPiCk6fCi449e5nnv7465TWlQdGO/pyTkP6UD+HGRcK7SF0rSOpLE3hNOceWT1AtIhpE8ILOIoL8Bo2thoL5xxMJx7n1Lm4vRlXZDxqVlB4BUMFDSjHCiFh9dabj+jEA/VIHSqY6VCjzWvQS+fzKFx8NsbBpvYQOGmr01iySy79e6G2z8JIBTQrlAF79Owr7XMpgxdHUhdISh2L3IWV5cdfIg2iYyOrXgqlP0u7pLyh3nCcO2hKsVstzFDEmQxymciqvH89yw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(376014)(1800799024)(23010399003)(366016)(921020)(38350700014)(56012099006)(10067099003)(3023799007)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?XtXZHokDfdhaN4JvdegZK1/o9D9WxspPgpX/cywjByUUF8Q5yP6DdfXAk9yk?=
 =?us-ascii?Q?0WlZTVaXKzzHnZ0MXdIlH+P9p25kJb4SlHuBCAaB5z1H+IBSxdKFW3zwstIt?=
 =?us-ascii?Q?7eD2x+egj7F50SDSr3gu8ffk8zR98V4acmvRlsZNlK1PWh9HIw4olIECb1OW?=
 =?us-ascii?Q?V2ja6Nu9uBPAnKjgEMXzWIA+fUMsWOneTjRzIwK/NXwbysY1bw7sKSWfEGWy?=
 =?us-ascii?Q?MIcfASugMFJvENHcjCPuCoWN9T4Csd1CPjpBOFr3tGH4CtA6aFyP+gq2fa65?=
 =?us-ascii?Q?VZEy1z+0TsB4zeKE9xKlQmxMsjiF0UW1U6Pf6f2iG+hZMW/XiERfvDicQs9P?=
 =?us-ascii?Q?0Xm7o2WuucgKqjqDyqoElfvZ/aaQmSu2m4kK7ibgeL5moIITPxs3529yJQRA?=
 =?us-ascii?Q?zhWvrb+MefQRJTauFWpMJdMO97U7pt/qtDbbCcbdUMsCiwI5c0/iNicdEqPY?=
 =?us-ascii?Q?JfEXtdgp89Y90YqZfQMsAfF56Du1swb17dndGdWI8wBSne+ZXMlQmQvGVFOx?=
 =?us-ascii?Q?DQ9AnqWkRWQE1Ftib5HrcwoUTkiN2Tjh2AwsX/pdsy5kHhZvSb+RO927wrNy?=
 =?us-ascii?Q?uATWANlNdHZTe+fpBfUdhj3LGWGxIQSaR9VblWTrHWalAkBU1gPSpuzkqOhY?=
 =?us-ascii?Q?xNbLSRYuuwaPa4eGw2+2ECHKrDY19ixl6tF+GakNbznISYPxXQUvyza5pGj2?=
 =?us-ascii?Q?pkkvbViaK/ym6kme0WZMbNG9glfvu9I8Jd4nIGDJmM+8lN68f4tsynnlfw+K?=
 =?us-ascii?Q?4X5WvzU+vtdhUT/Wpb4bhAzQcXCbe442FiN5h0B3do4LbGqxx75O68i7wm9B?=
 =?us-ascii?Q?typlHRk3aFyFIDgzg/69GG7QYWccSfXnSRxYovZOBE/XPyz41YHWXCLPwwDB?=
 =?us-ascii?Q?X6HMAkzp0fLJD/roJiiKeD6Xerp0OKKSHpMKMfBK4fMRWQyqvBUAhIOoBtAE?=
 =?us-ascii?Q?DvFIKaz/sbwp+P2J6Q2f9d6dJteY68lzvVBclgrfT7erMouL4PwhUXYaC4nw?=
 =?us-ascii?Q?p/LbJnd8C18fBd3BQIfw8zq7CqvnbJu90OYza42hVIY6HUr8IARgHRX3VMyE?=
 =?us-ascii?Q?MjubcYrAfjtbe6jB8iDSDXkgNu9tmOiOrnQcKvFHEYyRYhOIP/5LMaVtwiV7?=
 =?us-ascii?Q?9VexcQebWt1bh6gtwhdmZkwlLV1xC5Oc4IxGmxsskaAiPbAHe6/T/8GNVl9B?=
 =?us-ascii?Q?zclzejKqwqpAk8XN960g9saVMQ4Mgi/pi+EZR0zHS5rypcl2i3IyTLM4f2V7?=
 =?us-ascii?Q?Weph63vx+XWpcH0AxdCb/RZBga4Yol6l088S/0zkv0CjYZ7SnQFMXkrGDLt9?=
 =?us-ascii?Q?Z9SWogp/2JAN+lJztN0svuOKE2cF5Cud51BljBb8+fYuKTUXVC9VDu34rHj7?=
 =?us-ascii?Q?xvI0EcmrP6hfitMV8AzB0+GISAD2vxilUOyKyDybPOwbGOHZqxi25MpLAah+?=
 =?us-ascii?Q?Axh8fWYF3IqxT+O4W//Ka5ce/apoit5FasPXmXCYxSNP8g27dsyQ63TsIo6E?=
 =?us-ascii?Q?ZxuvB0/Oz34x9Gx26E5WodAX1Wbtmt3wAweJ5hHzY/NvFdOYHpRK1jBc4sec?=
 =?us-ascii?Q?eSOp6M136+mPRHfBH27vxqmqwrl5QnEjXlv3AsK1qIYhwg6zXpEWt4ajjQ4o?=
 =?us-ascii?Q?3AJ7uYj/zENDfxMFZeKhqfG1sfDRTP95ZBrklHbkBf7Eo2vYLt2Mp9Pptkug?=
 =?us-ascii?Q?e353VNwYFGLSQkEFHWQuOMWFY9v2zYggHQ9C9UsP1TH9DgDtzbN6xe1s57xO?=
 =?us-ascii?Q?44cAHcS3UaYNNkjBk9ove7tXtQMGt1J7nAvCx5pkaSzz0iHBkFjj?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b8d372-cbfb-42be-e07b-08def5b8ab7c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 01:51:03.5512
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2smTDJ8ph6TZjbfjvQIaz9EHWuDkAR0BI5nTOgQIRONAuByd3lSiGdn2IsnNUarBPo416DgyIHVMs7jAspoioaGViUHtyZU+3j5MKzqSAQkK3jC6L3TIJ2VkcYXm0OrZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1265

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
This series will add these syscon modules, as well as the
nodes under them.

-PATCH 1:	syscon binging
-PATCH 2/3/4:	syscon sys0/per0/per1 PLL driver
-PATCH 5/6:	syscon PCIe RP reset driver
-PATCH 7:	syscon socinfo driver
-PATCH 8:	syscon device tree

This series depends on the series:
https://lore.kernel.org/all/20260807112923.191627-1-changhuang.liang@starfivetech.com/

changes since v3:

PATCH 1:
- Add a new "starfive,jhb100-sfc-filter-syscon" use for JHB100 SFC

PATCH 2:
- clk use regmap_read_poll_timeout() instead of the _atomic() variant.
- clk switch PLL ops from .enable.disable to .prepare.unprepare so the
  sleeping syscon regmap is no longer accessed under the Common Clock
  Framework spinlock.
- clk use 64-bit math and div64_ul() in jhb100_pll_rate_to_preset()
- clk use mul_u32_u32 and div64_ul() in jhb100_pll_recalc_rate()
- Replace builtin_platform_driver_probe with builtin_platform_driver
  to support deferred probing.

PATCH 5:
- Add bool active_low = data->info && data->info->active_low;
  to simplify the code

PATCH 6:
- Fix typo: discontigous ==> discontiguous
- Fix typo: JHB110 ==> JHB100
- Allow RESET_STARFIVE_JHB100_SYSCON to be compiled as a module

PATCH 7:
- check kasprintf() failure in the socinfo probe path.
- Add #define pr_fmt(fmt) "jhb100-socinfo: " fmt
- include the <linux/slab.h> and <linux/string.h> headers

PATCH 8:
- Fix sys2_syscon reg length (0x4000 - 0x2000); it overlapped
  strap_syscon.
- Add sfc0/1/2_filter_syscon nodes.

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
 drivers/clk/starfive/Kconfig                  |   8 +
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
 drivers/soc/starfive/socinfo/Kconfig          |  11 +
 drivers/soc/starfive/socinfo/Makefile         |   2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c |  90 +++
 .../dt-bindings/clock/starfive,jhb100-crg.h   |  12 +
 .../dt-bindings/reset/starfive,jhb100-crg.h   |   3 +
 20 files changed, 1098 insertions(+), 35 deletions(-)
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
