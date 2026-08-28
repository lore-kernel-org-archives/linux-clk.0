Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2097.outbound.protection.partner.outlook.cn [139.219.146.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F243F8B1;
	Fri, 28 Aug 2026 12:30:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787920240; cv=fail; b=esnfPKRXBTnIdGqCYWip4DxQUrsg9Oxb1Pu7SRfe7AJhMcIml7XZ5fGlniJ3PEsZfHMfKJxBbWsM1bcpmgiqn6ijINHrDr7wx97YcTAsN0OssuCrnVlaAqihihEWnsCIHHZS8ScQRAXaE2rjN8OYYhzIZDJPnoxna2Ikh8pTspg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787920240; c=relaxed/simple;
	bh=wvEHweidmdI5Wh0gwV+1U3Knpu7YVHD4n0CV2x6N7II=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kb8LQiJ0WeDU6cAql1N1YNkLu+Ygs4brwOao1U2QYRnTdco0rZz4ecsJpIlX+FQXkP+Bi2jttLzZ5FDHpTtr5CwH+VXp3NiryEaaXAasDuArgDsT2Ne8q9Qvj6Fh8Z6BBCjwk4NmeU+Di2Ma2e1RnccEYoqiU0CeWichn6HwTgM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=htds4rRNl1ft/oq14jOFoWoTBN0d5V4h8GcrJ2xrbNWHC5eZ1l3+KnIv2VUtfKXo3/UWux306+LrxDFf0yjXwrd/sACPpYg6r+hKZ8Z2YBLxJyhFCQ3JSqys9wySeUKN26PTT0eDhqn9steJjMa1vUyZerywtJ7mV48px9t51rhLY4VIFl8lv3XjQeBhTzvXMfqBLrWVrZY6Cdl/xUb6eTUI8q3zyVLfn7rRIWR3iIgqreFSmjObHDjV6ISaHzkvKyA+w84JpGR+yooHcJQHkaaKQzLnOWTPXeVN1v70sAr4v4ZW54+pDAeffrcPqH/Q2NyatQ1v2zmB2VRClqgECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//XltaK3A4Klr2ht7LXcnZiZxEpnr7u5rTeQy339V8Y=;
 b=JPliAik3nBoKcL0EVcvXav+fDWBHHaUiY8z/4WcXwp0GczvGVX5Fmih6cYo6SKJcpJfVqyRqv9Nd3bQMXO4I2qifMVi6uUft4b7LPV9qm58GVC5vparp+7sBKJhl7464cfdsatdQgroudxk6wAUCLCeS5M/CiqnGyl3sG1KrBdkAwMHKrKL6l+TSxmjEko3YsBjawbDb2uK5HO7y8uC3gef1iDaIjyp0tTTOqdZxHt2cnSMB47gs7OEr9sIh6+yuGSYOaElJIocM0zjHsx2TLfYnAG4TSAPkRq3W/g2QsemMWP/7Lpfh2WDlqH8OS1cYwilIGVtuKuUbPIPWAtvXvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1203.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:15::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:31 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:31 +0000
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
Subject: [PATCH v5 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Date: Fri, 28 Aug 2026 02:56:07 -0700
Message-Id: <20260828095608.19955-8-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
References: <20260828095608.19955-1-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 726f9bee-0412-40e2-51ee-08df04eaa2c8
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|1800799024|376014|23010399003|366016|56012099006|10067099003|18002099003|22082099003|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	x7ljCKEBb37EximLfo2SxCQVxG8BSDy4upDoUHSwCmcF2G6kiTT5bAv8ybS4yal2vGQxOTzh0guV3Iz56dwn7+Xqb/Ar7aAcbXEK6D1SDkxadAAdaHhL2xL9fb1cyC3LYhqMetD492R2/ZtntRtySsezGWWuDbjfToqiUC5zjC46sj4v6dXDgdzN1RvdpqJJn0aYAY3pXA9Gwc4VQs/d0Kad2EDTjvtk/i+WP4dTsaTs8SAVeE1moR8pr1YGPNgU4k6pTaH8++MJV+rgagUEIlk/Ldw7HpH9Ofv1ar+ZgsylyWq+5umBi1AtzWCWragn02NdwLU5HuyoyFZe8UYm4I9WgYQIUbCsQz3FkqFwZJHJLB28+lxs760LpZ/V6POHipWGSknTSuMP7h0sh9dJMRXtrjC4oLaUzyoeo6BCmOHst2kWsIHzDPit6ovLblST3h0r0/HDFKzNkHLZuEeOg0bM9sGfbSaxG9AZUzfrHkC9f4JAH9nXG0GLydhfa+ET+ntsgA4FC6FTMnAXCPxR/rFHYhd/5UsUcl2/vvNFJ+5EqeFtONdMxNuMEIcjoJ/CyvpLV4agopNq/eQZ2L1faQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(1800799024)(376014)(23010399003)(366016)(56012099006)(10067099003)(18002099003)(22082099003)(38350700014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pM0Nsf1b8T4Prp2Y0c+JCe+BYFG7XvhXLIOmWDjACM3KM+XgKQ+jmKlfbJrJ?=
 =?us-ascii?Q?AT2obmccSVwXI00h1kRhd+WFykDC3IxkOGdxnlQEklY1dQ3Pnb2VW2w1lMbc?=
 =?us-ascii?Q?AGbfc+fjbDrRgiDtuHbDmujiLQUH099L8N3v2FtS/UZxUFEC+rYxJTn0zUdv?=
 =?us-ascii?Q?5iDbT4e1SS0QXMtWn58yt6AJ+a3UvSlBsLxP1N/NkBOS9ZqYlioukQYUYw+v?=
 =?us-ascii?Q?JSZokyUaz01RDJDCVX4EsvQH40Q06S41lWWh/q6okdjYhit0KDGrsyarPb2J?=
 =?us-ascii?Q?GYwnMCCzw8NvbCi9GO2I2L70lq6DaXarJ8hIZvELDWto5TS2+7/twsDI087Z?=
 =?us-ascii?Q?Wg21CcPBNMnLoYIAqnflaJ9AV3ZgP4Qz5xtrKyAZsoZvQ1aOk1N7AmlXprYK?=
 =?us-ascii?Q?aggy1L1MhMt8MWUXaLzJ/iJ9nF3+EFYvjQWFnsXVhONUlZDdvqeiFh0UXat1?=
 =?us-ascii?Q?ZQs039etHmBO8XH2uQQRBvFaZxYx74bcwqJRVtcCfl2a9yrZFBSOtFHxEESa?=
 =?us-ascii?Q?M02MShj7ZXTvxztsASmyufJDWT26sCjyN3GL/REyoOZscggju9FQMHnmf1Zk?=
 =?us-ascii?Q?cPL1Lxe6/EzaCXK/SwBYaFt5f2PzL2RgPbMSclKZphwrhdG2FYNp4LxemGRT?=
 =?us-ascii?Q?Wv0InLVEroi9kBC27cYyEm4GYiwITXAoXBtXTnuYTpwveN4PZUfKUGIFbpGs?=
 =?us-ascii?Q?9bywhrB+bOn74uSf+utJvzO6NUpC5s4r0vrIidjiUCpLTxG/MGqeu62LfjRP?=
 =?us-ascii?Q?iz6F4IALgnUShFHed/Z0Z0CTJgmtU6KQZSjzw00Z8aKcWLJ+5f8XDM/VnFDc?=
 =?us-ascii?Q?bV682Vb8/NQxih4vBFwh7R+fgjFqIvjtROv2lpfx+iOIQ4kZLyJJRoW8KrU3?=
 =?us-ascii?Q?Zi8oaoWhSKcHPkormp4Ny7hlgejgVtZj3WevKmaXFOJNGb4xBtIYzDSvexdY?=
 =?us-ascii?Q?1AJNKUg7KBfQjaas+JskH56HKsc1RsE2+6zTmLJf8iyt2QsBQfAip2vihG1d?=
 =?us-ascii?Q?lEZ2S2d+mw8A/U4Rpxl6WI6SAltozu5vg+9g7xKPVArtp5CJsifm8oIEIY66?=
 =?us-ascii?Q?YVrMVirk+4lGgbUuoDwLpu4YKBsITBDmukO4+P8tkHlR+FoiobM/rkomq4Jt?=
 =?us-ascii?Q?2txenLZKmmlqv2yc1UR1v2Zvf/0ZlWJ4xT4Q1Pvidd7nAWlLeqMsWjcPEceD?=
 =?us-ascii?Q?f3IVmpAaO4xy29xUuY+IdEuM/7S8c2VnhBliNW3xb2WM0AmEy/5cK2zih2St?=
 =?us-ascii?Q?0ftkWds5W6H6WI1I65VnSeXKd6QOoVk2OxEaXXOZpbmLGBAGQm4L7O5lSgg6?=
 =?us-ascii?Q?dZl1CQyFiEXhf2PJc3TuLsYLceoiCE5a/amak2lUYWuxTnSSjyKbiDroHHOs?=
 =?us-ascii?Q?u6c781cSserm+HD9jm2qJj3Av07SXBt+SGzXihm54b2IiAzIpt+qPhEhCjcG?=
 =?us-ascii?Q?yxX53BIbIIHG+/jhyYZ4+OVxlsCmTbd+D2A0xxnkSn4dxvIvj11umE6aZTbX?=
 =?us-ascii?Q?FOlzWUMe8d029qDTeLZi9r4ArqcsLBXHYgSJZwkFczpfgRQE0Nk1IU4tZEp8?=
 =?us-ascii?Q?HsQ//WfbYsWkUxiRXJS3Yh+bWbAbCnBGWBHL3B5+/CvYslVhb2j105uYZnAK?=
 =?us-ascii?Q?/J+PQSn8ahYceLP/X1J8UdAXtFZg8SLHNAr79UYbHmKPZFZw2Iq2KUi11XXV?=
 =?us-ascii?Q?SuFBisGfWuRn85F+dyJ3kRHAfnahReVjTkusTPwES1c2lBT6t/0fbgWPjvr5?=
 =?us-ascii?Q?LG3VEqmKuGhOpOn/VMhPwLELTpli4DlrfhECi3tQzZONzOwr9y67?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 726f9bee-0412-40e2-51ee-08df04eaa2c8
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:31.1327
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/fremke1we+IQeK03M1QwDe4QNvqtY1akaI+6z46lJEu9dnwDXoA4ZB/cIfZJR99tzHXkOXXp1PPnAbAgmJ9IjlL6miCzAjGTCJ2fQ6Orqp/Xf20tPxBtsRwriidQJx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1203

Add a socinfo driver for the JHB100 SoC, exposing the SoC family, ID and
revision through the SoC bus. It is currently used to distinguish the two
revisions, A0 and A1.

The driver binds to the sys0 system controller node. That region only
contains the PLL controls, this revision ID register and a few debug
registers, so rather than describing an extra child node in the
devicetree, the sys0 PLL device is instantiated from here as an MFD cell.
The PLL driver then picks up the regmap from its parent's DT node.

Note that CONFIG_STARFIVE_JHB100_SOCINFO is therefore a build-time
prerequisite for the sys0 PLL clocks; see CLK_STARFIVE_JHB100_PLL.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 MAINTAINERS                                   |   6 +
 drivers/soc/Kconfig                           |   1 +
 drivers/soc/Makefile                          |   1 +
 drivers/soc/starfive/Kconfig                  |   6 +
 drivers/soc/starfive/Makefile                 |   2 +
 drivers/soc/starfive/socinfo/Kconfig          |  13 +++
 drivers/soc/starfive/socinfo/Makefile         |   2 +
 drivers/soc/starfive/socinfo/jhb100-socinfo.c | 105 ++++++++++++++++++
 8 files changed, 136 insertions(+)
 create mode 100644 drivers/soc/starfive/Kconfig
 create mode 100644 drivers/soc/starfive/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/Kconfig
 create mode 100644 drivers/soc/starfive/socinfo/Makefile
 create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c

diff --git a/MAINTAINERS b/MAINTAINERS
index cecb4f279160..90919c672d4d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26040,6 +26040,7 @@ M:	Conor Dooley <conor@kernel.org>
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/soc/starfive/
+F:	drivers/soc/starfive/
 
 STARFIVE STARLINK PMU DRIVER
 M:	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
@@ -26094,6 +26095,11 @@ S:	Maintained
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
index 000000000000..64f1b1e04d01
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/Kconfig
@@ -0,0 +1,13 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config STARFIVE_JHB100_SOCINFO
+	bool "StarFive JHB100 SoC Information"
+	depends on ARCH_STARFIVE || COMPILE_TEST
+	select SOC_BUS
+	select MFD_CORE
+	select MFD_SYSCON
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
index 000000000000..0a31cae9b4f5
--- /dev/null
+++ b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
@@ -0,0 +1,105 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2025 StarFive Technology Co., Ltd.
+ *
+ * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
+ */
+
+#include <linux/bitfield.h>
+#include <linux/device.h>
+#include <linux/mfd/core.h>
+#include <linux/mfd/syscon.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <linux/sys_soc.h>
+
+#define JHB100_REV_ID			0x38
+#define JHB100_REV_ID_CHAR		GENMASK(3, 2)
+#define JHB100_REV_ID_NUM		GENMASK(1, 0)
+
+/*
+ * The sys0 system controller region only contains the PLL controls, this
+ * revision ID register and a few debug registers, so instead of describing
+ * a child node in the devicetree the PLL device is instantiated from here.
+ */
+static const struct mfd_cell jhb100_sys0_syscon_cells[] = {
+	{ .name = "jhb100-sys0-pll", },
+};
+
+static void jhb100_socinfo_unregister(void *data)
+{
+	soc_device_unregister(data);
+}
+
+static int jhb100_socinfo_probe(struct platform_device *pdev)
+{
+	struct soc_device_attribute *attrs;
+	struct device *dev = &pdev->dev;
+	struct soc_device *soc_dev;
+	struct regmap *regmap;
+	char rev_char;
+	u32 rev_id;
+	int ret;
+
+	regmap = syscon_node_to_regmap(dev->of_node);
+	if (IS_ERR(regmap))
+		return dev_err_probe(dev, PTR_ERR(regmap),
+				     "failed to get syscon regmap\n");
+
+	ret = regmap_read(regmap, JHB100_REV_ID, &rev_id);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to read revision ID\n");
+
+	attrs = devm_kzalloc(dev, sizeof(*attrs), GFP_KERNEL);
+	if (!attrs)
+		return -ENOMEM;
+
+	rev_char = FIELD_GET(JHB100_REV_ID_CHAR, rev_id) + 'A';
+
+	attrs->family = "JH";
+	attrs->soc_id = "JHB100";
+	attrs->revision = devm_kasprintf(dev, GFP_KERNEL, "%c%lu", rev_char,
+					 FIELD_GET(JHB100_REV_ID_NUM, rev_id));
+	if (!attrs->revision)
+		return -ENOMEM;
+
+	soc_dev = soc_device_register(attrs);
+	if (IS_ERR(soc_dev))
+		return dev_err_probe(dev, PTR_ERR(soc_dev),
+				     "failed to register SoC device\n");
+
+	ret = devm_add_action_or_reset(dev, jhb100_socinfo_unregister, soc_dev);
+	if (ret)
+		return ret;
+
+	ret = devm_mfd_add_devices(dev, PLATFORM_DEVID_AUTO,
+				   jhb100_sys0_syscon_cells,
+				   ARRAY_SIZE(jhb100_sys0_syscon_cells),
+				   NULL, 0, NULL);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to add mfd cells\n");
+
+	dev_info(dev, "StarFive %s SoC rev(%s)\n", attrs->soc_id, attrs->revision);
+
+	return 0;
+}
+
+static const struct of_device_id jhb100_socinfo_of_match[] = {
+	{ .compatible = "starfive,jhb100-sys0-syscon" },
+	{ /* sentinel */ }
+};
+
+static struct platform_driver jhb100_socinfo_driver = {
+	.probe  = jhb100_socinfo_probe,
+	.driver = {
+		.name = "jhb100-socinfo",
+		.of_match_table = jhb100_socinfo_of_match,
+	},
+};
+
+static int __init jhb100_socinfo_init(void)
+{
+	return platform_driver_register(&jhb100_socinfo_driver);
+}
+subsys_initcall(jhb100_socinfo_init);
-- 
2.25.1

