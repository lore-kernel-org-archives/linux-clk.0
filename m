Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2139.outbound.protection.partner.outlook.cn [139.219.17.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5970373BE0;
	Fri,  3 Apr 2026 05:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.139
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775195423; cv=fail; b=oBVZK2Rw32ZAcZ10Z05FQdqXxZ+NQ9EfQ0Y6TfbHRuBnvXk7UjKCJ6t0I9PNKjlcu9CJZ+QYoykmoeBGHQp/Nwkf1RXpQDza7PtsFH6JD7PD4Z7vqRgvooBOFih7DHf1LEaNMLLU+1IEcC1Mg7cT+UCNgnf5HvWbnzpduyMz9hM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775195423; c=relaxed/simple;
	bh=6jkfYZuNzqZ48e8FgxkXDauPnH4Iy+F4z0hzdLVUvbA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EoGdfT7PTV+hJkttkAQ6BrxkNvQ5ukCoHIP3E74US8B+0IljAAgL/CFk58Wl6BzluKedO/ngqRgyB+wv0q2rlnrfaSyCZPogk0rUH80C9zihIdMCDfdoaGinFnezohZS/lWvAJjH7gsZ6vSEssdxxf2MB/gopnQEG/tUo1zWYFU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JoYa49dobRvoH2+8Vn048OvBA3PNPNMpkwkVnarRGpJk2jWFo8K5UL1MIQsudJLu8nrh0/+fGOJcHZPJvtHUFfeesSBPkivXnxKBvG+mKxgGoGTxcfBWSzJFxCpofx9cSBBoI54HlDz03v2Jw5ohzpbo5koSYLAALERIQzjuzvoMxE/xEj29LaaAt3gmk6gkAd+46pqPrUgMU4SulLdezp7SQu3yZS7PMgpDpE9qMlNzHbVTfBzUjV8Sgqkpe99kCUI/5WzhiRHM11Z8BDGxSgD4wilXhPDRhsWwL4wH2PlDN8BrLAED5VYvDuys01MClq5FeJXUxSmfjAU54TW57g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=80PlJjiVzD2MxPWzT3X7S8AGCpivOCPdGhk6711Q1kI=;
 b=FoERwcS1MHSB0CdEml9u6jG8SZa8yAqDKndSOuKgZtmkbaERMBsvET+LWDRNZ7aT5ah+rRAEczgQ67ISazqHf3B+/jDjRVRIM4zNBG8xowEZtLjAOM6RZoRqMZ6PU8Lf59+IZZ3Z/s2yceaQBAxEGoMTwrp50+LztdQrk60ba2944rUKmER/3PHBMMwiCxIQQo7vlmXCHcywiXbbNWmdr5rsYHLt7o+gouV/iZasKzDivrPOlOqDBtkE/4WCVLzJzydR5FwKp3CigbdfVtRwB7wZaeDHeKsJheuXvsXlfjw6BbiMb1WSAWnHuTm8HS98UR0C3vRuacqJfi5lxCmNoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.19; Fri, 3 Apr
 2026 05:50:17 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9769.020; Fri, 3 Apr 2026 05:50:17 +0000
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
Subject: [PATCH v1 13/13] riscv: dts: starfive: jhb100: Add syscon nodes
Date: Thu,  2 Apr 2026 22:49:45 -0700
Message-Id: <20260403054945.467700-14-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
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
X-MS-Office365-Filtering-Correlation-Id: 82bf2bc6-db10-4d69-7d2e-08de9144e1ff
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|7416014|376014|921020|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	dkVkr4EoFJt5Q5SANE+E271DoEk6kTmxVAAraTfgoIZT4akd3zCMvPOnzgwvofdlFmDpNupANnLXytTmxDryWR97bXNjSyL+lVud4js12PuA7XSUOiMqJMqAjmyLcCPovvtuVuwFW5Ev2Bw2vFGnOq1PtP6oRTLmH6WkJg3uFcTxz+c14XXGU+mP4NGLRKhY5tQbsg0bisz2OIBwfbgl3Xs0zufFLWx5r94n3Fje2cNkDDZpj2/dXnSlbSf2ZZh7SIb3ydBqABGH2Vbx77VT1UGF0eC1EhSmN16EJKzvr1GOfxwHtUJImVYkYYv1EbbfNL5kl4jtrLvKEGsjQyHpYuNneMZA0iwTvf0B7D7jMMIlOzGAhPREpOk1qq9bcwNAR9FF+3OCULRfcBzBvx827vIoxqMZY3SgEcrgCKTgXbomSBtD/9e7V4aWApPVD/lScAldv5yVaZomW82cuNui7/pxoY3rWgqVAF/IOCJO7ayTpvyV5q+musyp3nZ0T9kZobHO2RjwqF9sNbq9kFYe2b4elIN6f0LpAS5RVVUy8Sg33BVwSiiv9mcS43Xl08umDvH8cSDHPqFnQjlCYlKAFQjhEUcYqU0fGaAIeFWiMh8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(7416014)(376014)(921020)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iBUooWmHhwSBTd7jCxxOV/oromL0BcFNWt10qXmvfPybpyJ34EVBDTuBuq90?=
 =?us-ascii?Q?aznLQednzzJCo9YBJobT7y6JzsD1yCLC9GtZjFw/GHU31ho7Bq24BEXOAFeV?=
 =?us-ascii?Q?xKN6S6REYC9B3qUOIcRLM4+JYZDJasdnamRZKj1baVtDQNmF+b187G8qnH+j?=
 =?us-ascii?Q?rsjibH/tYI5so0YDamvUWPSPRkhyqUeu6jtKZUvwHhdOF8wBXKGNx5XvFm/L?=
 =?us-ascii?Q?RQDB/tPll+V/IBTNeTG1R06jhbKgYfxvrfbC6eyGr43wu/pc8RIpErGYkHWJ?=
 =?us-ascii?Q?1DjkecgHzUPOW8r424NWNe8YIhtkmH/5tV8ozGMmhCIG18jTAPTywaPx0AdA?=
 =?us-ascii?Q?un8szbCBfPhx1iQsCFkjbXBsJ5ZJMaWMn119WKB/oVqG5fpcNc/EaW28zO9Q?=
 =?us-ascii?Q?6smPy5wLG/kGOze4ovwn2RWaKEAAoEUg3SAqF8et03JIeyUmnwt7leRXCdXB?=
 =?us-ascii?Q?dJ4Hl5Y4FX2CR7hQaUHWXDwsPszD8An5VsdJzEvYGXNAYqPTbhr8E60xG5Gl?=
 =?us-ascii?Q?x0dD6aYk88VYj8VrYt49mBCuNSQgVQ3m9aYcfQ4Ye55t2ynR/EADeaQLg2Gm?=
 =?us-ascii?Q?6kgWzHDIN+rwISFIrQ55iwxR4WZo9bVYqvqKSrUxI0q4zmyQNzTZINj4ieK/?=
 =?us-ascii?Q?M6MM/gwRQL+Js4wludN+NMnayNsPdwE3hvjYDfL7QJFbYp9SiUxQdkBnUVK2?=
 =?us-ascii?Q?9MCRIqL554pqrS8ZoaGP2zptzxz0hj9gEb6YtXD20AJpHOzRAX0zv5xkdEmu?=
 =?us-ascii?Q?xut7pGW+puAtbvjftUFeaobrpIgCji1RR+7MHLAHUXhser9NP6Ies2hejqe3?=
 =?us-ascii?Q?2jXY44BoiZcUBMZmfq+10HZmvZk07vIGcsOeNQ2Yai2MkQjm1ypx8iS6lZ/a?=
 =?us-ascii?Q?P1vfwftztZx/rfUOqFo0hIhSmoYNMwDLe8InMmNyXYbGbl4dygliazpxs5S9?=
 =?us-ascii?Q?u6DN43WSyG0TG1UyHMWcaIA1SJBMIGau/toOnb0Dn0pVlqZ4qKm6OpeeIVtc?=
 =?us-ascii?Q?LiVaGf6ByL2oqWo7Q7Ss/uxE2ZGtYVaOJuLqv0khw8m2iHR3zsITqZwXtP3M?=
 =?us-ascii?Q?1aww8T7NO69Pk5bkqw/QcbiEpmvqZ1ZxupKjJPthgCw9rYQCnCzDcECUNfvQ?=
 =?us-ascii?Q?+4rFaePJm9Ukn7YXU499WoRJmWqYvI0aeIoA4+jK0tb10fqds9ytlCjOvhNi?=
 =?us-ascii?Q?NLOUvxFPb7fgZ/B1o/FmDxsw/hfjPkU4zI52yQNvEufpOto3s4AQGEepbbIV?=
 =?us-ascii?Q?Foy5P208HUifp2Jesvx3CX+uPnsHQF/rZ+JIRvDDG5LM1P+HjUSy5OKJ8u22?=
 =?us-ascii?Q?csEXAvicggtxHTNwNTRjUEW9RfIKmCnc0PhZowhpxkvrs3McexMcn6y55BZj?=
 =?us-ascii?Q?MehQvTV1p+Jn79m1y01nIZjlWooL/Vpq87CfPLOnVGwltLt+1nQiCqokNxtL?=
 =?us-ascii?Q?TFDTUZmGcECKRMAPyDGjWT8YfA3k2f+vxqsgJQ/OmIZFzCWV1DtsEvvsaPT2?=
 =?us-ascii?Q?uRpvwohN3sRfjKh7QI8OZmGZA9eBNnjP2PuP5FVA3bSftE3y0OKotjcDnDMl?=
 =?us-ascii?Q?ENTNeCpi49hM1rv+0/WSywFmHyQVLYJJIgP8rfJIy31B0fB0T6wKWR7/oS+4?=
 =?us-ascii?Q?ICWATCz7WsudTXRlQ7ppfdG6bT4h4l5jYdU8qKRJQRQKm6Dn5SPKecd8Jm+u?=
 =?us-ascii?Q?PdbQk16FUUatcx2SFyKN3CVS4BGR6P94UNnZf9mNDAYXAnpQfE5WTn/Za0zY?=
 =?us-ascii?Q?cPTFWtCr6df4wyR2ZDnJwM/266GzSuUsKjya1hU+HSJFZwF0yZDT?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82bf2bc6-db10-4d69-7d2e-08de9144e1ff
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2026 05:50:17.0071
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RvhdlRotSW11Lx34sDHUWJgDVMpV11OUCusyqlU7uSiA3xUCGqq+//MiA+ym3TC7mWewMm2Ri0OaHjK3ysVoaqEo7aJ+ukIIFETNsrQbDf55O2TS25PZKeiNUM592IHE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Add syscon nodes for JHB100 RISC-V BMC SoC. They contain
pcieep0_ecsr_syscon | host0_syscon | husb0_syscon | husbd0_syscon |
pcieep1_ecsr_syscon | host1_syscon | husb1_syscon | husbd1_syscon |
gpu0_syscon | gpu1_syscon | husbcmn_syscon | b2h0_syscon | b2h1_syscon |
h02b_syscon | h12b_syscon | vout_syscon | pcierp_ecsr_syscon |
pcierp_syscon | usb_syscon | npu_syscon | per0_syscon | per1_syscon |
per2_syscon | per3_syscon | sys0_syscon | sys1_syscon | sys2_syscon |
strap_syscon.

Simultaneously add the pll, reset, and chipid nodes under syscon.
Also update the references of pll nodes.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jhb100.dtsi | 220 +++++++++++++++++++----
 1 file changed, 186 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
index 700d00f800bc..3456aef30500 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -288,36 +288,6 @@ pll1: pll1 {
 		clock-frequency = <1000000000>;
 	};
 
-	pll2: pll2 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <903168000>;
-	};
-
-	pll4: pll4 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <100700000>;
-	};
-
-	pll5: pll5 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <100700000>;
-	};
-
-	pll6: pll6 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <2400000000>;
-	};
-
-	pll7: pll7 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <1950000000>;
-	};
-
 	per2_gmac2_rgmii_rx: per2-gmac2-rgmii-rx {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -398,6 +368,116 @@ bus_nioc: bus_nioc {
 				     <0x4 0x00000000 0x4 0x00000000 0x2 0x0>;
 			ranges;
 
+			pcieep0_ecsr_syscon: syscon@10511000 {
+				compatible = "starfive,jhb100-pcieep-ecsr-syscon", "syscon";
+				reg = <0x0 0x10511000 0x0 0x1000>;
+			};
+
+			host0_syscon: syscon@10519000 {
+				compatible = "starfive,jhb100-host-syscon", "syscon";
+				reg = <0x0 0x10519000 0x0 0x1000>;
+			};
+
+			husb0_syscon: syscon@10695000 {
+				compatible = "starfive,jhb100-husb-syscon", "syscon";
+				reg = <0x0 0x10695000 0x0 0x800>;
+			};
+
+			husbd0_syscon: syscon@10695800 {
+				compatible = "starfive,jhb100-husbd-syscon", "syscon";
+				reg = <0x0 0x10695800 0x0 0x800>;
+			};
+
+			gpu0_syscon: syscon@10745000 {
+				compatible = "starfive,jhb100-gpu-syscon", "syscon";
+				reg = <0x0 0x10745000 0x0 0x1000>;
+			};
+
+			pcieep1_ecsr_syscon: syscon@10d11000 {
+				compatible = "starfive,jhb100-pcieep-ecsr-syscon", "syscon";
+				reg = <0x0 0x10d11000 0x0 0x1000>;
+			};
+
+			host1_syscon: syscon@10d19000 {
+				compatible = "starfive,jhb100-host-syscon", "syscon";
+				reg = <0x0 0x10d19000 0x0 0x1000>;
+			};
+
+			husb1_syscon: syscon@10e95000 {
+				compatible = "starfive,jhb100-husb-syscon", "syscon";
+				reg = <0x0 0x10e95000 0x0 0x800>;
+			};
+
+			husbd1_syscon: syscon@10e95800 {
+				compatible = "starfive,jhb100-husbd-syscon", "syscon";
+				reg = <0x0 0x10e95800 0x0 0x800>;
+			};
+
+			gpu1_syscon: syscon@10f45000 {
+				compatible = "starfive,jhb100-gpu-syscon", "syscon";
+				reg = <0x0 0x10f45000 0x0 0x1000>;
+			};
+
+			husbcmn_syscon: syscon@11045000 {
+				compatible = "starfive,jhb100-husbcmn-syscon", "syscon";
+				reg = <0x0 0x11045000 0x0 0x1000>;
+			};
+
+			b2h0_syscon: syscon@11135000 {
+				compatible = "starfive,jhb100-b2h-syscon", "syscon";
+				reg = <0x0 0x11135000 0x0 0x200>;
+			};
+
+			b2h1_syscon: syscon@11135200 {
+				compatible = "starfive,jhb100-b2h-syscon", "syscon";
+				reg = <0x0 0x11135200 0x0 0x200>;
+			};
+
+			h02b_syscon: syscon@11135400 {
+				compatible = "starfive,jhb100-h2b-syscon", "syscon";
+				reg = <0x0 0x11135400 0x0 0x100>;
+			};
+
+			h12b_syscon: syscon@11135500 {
+				compatible = "starfive,jhb100-h2b-syscon", "syscon";
+				reg = <0x0 0x11135500 0x0 0x100>;
+			};
+
+			vout_syscon: syscon@11135800 {
+				compatible = "starfive,jhb100-vout-syscon", "syscon";
+				reg = <0x0 0x11135800 0x0 0x400>;
+			};
+
+			pcierp_ecsr_syscon: syscon@11711000 {
+				compatible = "starfive,jhb100-pcierp-ecsr-syscon", "syscon";
+				reg = <0x0 0x11711000 0x0 0x1000>;
+			};
+
+			pcierp_syscon: syscon@11719000 {
+				compatible = "starfive,jhb100-pcierp-syscon", "syscon",
+					     "simple-mfd";
+				reg = <0x0 0x11719000 0x0 0x1000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x11719000 0x0 0x1000>;
+
+				pcierp_syscon_rst: reset-controller@14c {
+					compatible = "starfive,jhb100-reset-pcierp";
+					reg = <0x0 0x14c 0x0 0x4>;
+					#reset-cells = <1>;
+				};
+			};
+
+			usb_syscon: syscon@11820000 {
+				compatible = "starfive,jhb100-usb-syscon", "syscon";
+				reg = <0x0 0x11820000 0x0 0x10000>;
+			};
+
+			npu_syscon: syscon@118e5000 {
+				compatible = "starfive,jhb100-npu-syscon", "syscon";
+				reg = <0x0 0x118e5000 0x0 0x100>;
+			};
+
 			uart6: serial@11982000 {
 				compatible = "snps,dw-apb-uart";
 				reg = <0x0 0x11982000 0x0 0x400>;
@@ -413,7 +493,8 @@ uart6: serial@11982000 {
 			per0crg: clock-controller@11a08000 {
 				compatible = "starfive,jhb100-per0crg";
 				reg = <0x0 0x11a08000 0x0 0x1000>;
-				clocks = <&osc>, <&pll6>,
+				clocks = <&osc>,
+					 <&per0pll JHB100_PER0PLL_PLL6_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_400>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_800>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_600>,
@@ -425,10 +506,22 @@ per0crg: clock-controller@11a08000 {
 				#reset-cells = <1>;
 			};
 
+			per0_syscon: syscon@11a09000 {
+				compatible = "starfive,jhb100-per0-syscon", "syscon",
+					     "simple-mfd";
+				reg = <0x0 0x11a09000 0x0 0x1000>;
+
+				per0pll: clock-controller {
+					compatible = "starfive,jhb100-per0-pll";
+					clocks = <&osc>;
+					#clock-cells = <1>;
+				};
+			};
+
 			per1crg: clock-controller@11b40000 {
 				compatible = "starfive,jhb100-per1crg";
 				reg = <0x0 0x11b40000 0x0 0x1000>;
-				clocks = <&pll7>,
+				clocks = <&per1pll JHB100_PER1PLL_PLL7_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER1_600>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER1_800>,
 					 <&sys2crg JHB100_SYS2CLK_BMCPER1_200>,
@@ -440,6 +533,18 @@ per1crg: clock-controller@11b40000 {
 				#reset-cells = <1>;
 			};
 
+			per1_syscon: syscon@11b41000 {
+				compatible = "starfive,jhb100-per1-syscon", "syscon",
+					     "simple-mfd";
+				reg = <0x0 0x11b41000 0x0 0x1000>;
+
+				per1pll: clock-controller {
+					compatible = "starfive,jhb100-per1-pll";
+					clocks = <&osc>;
+					#clock-cells = <1>;
+				};
+			};
+
 			per2crg: clock-controller@11bc0000 {
 				compatible = "starfive,jhb100-per2crg";
 				reg = <0x0 0x11bc0000 0x0 0x1000>;
@@ -461,6 +566,11 @@ per2crg: clock-controller@11bc0000 {
 				#reset-cells = <1>;
 			};
 
+			per2_syscon: syscon@11bc1000 {
+				compatible = "starfive,jhb100-per2-syscon", "syscon";
+				reg = <0x0 0x11bc1000 0x0 0x1000>;
+			};
+
 			per3crg: clock-controller@11c40000 {
 				compatible = "starfive,jhb100-per3crg";
 				reg = <0x0 0x11c40000 0x0 0x1000>;
@@ -480,11 +590,16 @@ per3crg: clock-controller@11c40000 {
 				#reset-cells = <1>;
 			};
 
+			per3_syscon: syscon@11c41000 {
+				compatible = "starfive,jhb100-per3-syscon", "syscon";
+				reg = <0x0 0x11c41000 0x0 0x1000>;
+			};
+
 			sys0crg: clock-controller@13000000 {
 				compatible = "starfive,jhb100-sys0crg";
 				reg = <0x0 0x13000000 0x0 0x4000>;
 				clocks = <&osc>, <&pll0>, <&pll1>,
-					 <&pll2>;
+					 <&sys0pll JHB100_SYS0PLL_PLL2_OUT>;
 				clock-names = "osc", "pll0", "pll1", "pll2";
 				#clock-cells = <1>;
 				#reset-cells = <1>;
@@ -494,7 +609,9 @@ sys1crg: clock-controller@13004000 {
 				compatible = "starfive,jhb100-sys1crg";
 				reg = <0x0 0x13004000 0x0 0x4000>;
 				clocks = <&osc>, <&pll0>, <&pll1>,
-					 <&pll2>, <&pll4>, <&pll5>,
+					 <&sys0pll JHB100_SYS0PLL_PLL2_OUT>,
+					 <&sys0pll JHB100_SYS0PLL_PLL4_OUT>,
+					 <&sys0pll JHB100_SYS0PLL_PLL5_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_NPU_600>;
 				clock-names = "osc", "pll0", "pll1", "pll2",
 					      "pll4", "pll5", "sys1_npu_600";
@@ -513,6 +630,41 @@ sys2crg: clock-controller@13008000 {
 				#clock-cells = <1>;
 				#reset-cells = <1>;
 			};
+
+			sys0_syscon: syscon@13010000 {
+				compatible = "starfive,jhb100-sys0-syscon", "syscon",
+					     "simple-mfd";
+				reg = <0x0 0x13010000 0x0 0x2000>;
+				#address-cells = <2>;
+				#size-cells = <2>;
+				ranges = <0x0 0x0 0x0 0x13010000 0x0 0x2000>;
+
+				sys0pll: clock-controller {
+					compatible = "starfive,jhb100-sys0-pll";
+					clocks = <&osc>;
+					#clock-cells = <1>;
+				};
+
+				chipid@38 {
+					compatible = "starfive,jhb100-socinfo";
+					reg = <0x0 0x38 0x0 0x4>;
+				};
+			};
+
+			sys1_syscon: syscon@13014000 {
+				compatible = "starfive,jhb100-sys1-syscon", "syscon";
+				reg = <0x0 0x13014000 0x0 0x4000>;
+			};
+
+			sys2_syscon: syscon@13018000 {
+				compatible = "starfive,jhb100-sys2-syscon", "syscon";
+				reg = <0x0 0x13018000 0x0 0x4000>;
+			};
+
+			strap_syscon: syscon@1301a000 {
+				compatible = "starfive,jhb100-strap-syscon", "syscon";
+				reg = <0x0 0x1301a000 0x0 0x2000>;
+			};
 		};
 	};
 };
-- 
2.25.1

