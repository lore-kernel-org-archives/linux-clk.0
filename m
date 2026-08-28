Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2092.outbound.protection.partner.outlook.cn [139.219.146.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE0D40DB3E;
	Fri, 28 Aug 2026 10:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787912991; cv=fail; b=SwAsAPfafBG0ap5181eVywnNAFueRFOowwLI9mYCd5er9j7mVsqpv09bhhED79i26KLidxwik8bOK5/JpqukKMr6csRran8om+t4K/IWzaN3BqDY/f/HIfGt1RRdFMQFsmLRfl3IBdUv2uoNKnribxKjNWZ6TFuca/6b0kJzUGg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787912991; c=relaxed/simple;
	bh=+rfaHml/deFbrnFUpZGNdTJy6GLmE73ZCvWAND4zlPQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HRUM+UFAonFhn13e8Ki13fkLHBfnEKiXNCwPttq+dLnE1YliLUHOSZNJXQKriavgtfTNjEXhq5sUl9hE0EdoAf5vo4OPfRPHYk74UUxeAHQxekDL8wGSoJ2SnO63kavp+loC2a7UxaKU+EP4+SQHXzsRFkIuMmuYnqGf06F/Xwk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mg7AXDxGYZRg/TzlE2aWQuvxGPjqYVCzmQxPB/+cj9Lk1qyihkrDZgdXFceAv3x2MR2Wytm+OTZQg2uuKIV1HjHEwSwdWNdTXtQTP7O09qOohxsvWS5R+Uu/9P3J97g+1VHHtGgA6VWjxXwyPIqvyUKKVupx4OoPVFluFnB0Jd8hj6BRHGttM85epN1HfBfIErZkmPzseCO0p8jzfqXiBwTJhL+2RCw4F6d7ADmGG0RVp1dxl/GWT8+G4kxhm1zwgG3vpdG6BH5G8yiNhPsZNgYxHNhtiP3pYzkHes5Ic8lAEELjBv4TcNMYZvNT/Vd5Tmb6MVO5+ND9wC7FOKp/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58lFl7P/QlCFlTzbKSHFfAsUN1RhvIoAkgGdpj9U5fE=;
 b=VYcj9k9a2qQ9ow4sx19sB1U4Pqvy3fWFy5kH5ukzKJbJ6jDzxcwWqi9MEbfs/HmBG/RqlQVaHCMn8Ot46wdZNQoNiQgDujAkSef0cr6HzGVCIkxRXJWSOGi0XUijwDqK/N6p7Q5TC+He7cXa7XKo/Jng9KjP68GZzVhtlhJkVYILbXwVDeJUIMTMxkaFtGIfNSC1l7qVyF+zgv9MgmFcnotwyhyu/WBbrefzT/OM+uvD2mAj6ZOVTd2SQ/p+8YCsBye2iFaliPbpfZxkVvs81dG5b2jOFKeT37pYnS0CKNZs2/Vw09QSAuZELUGj+lAvaYx1QVEBW17WzKuKKFp0FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Fri, 28 Aug
 2026 09:56:32 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Fri, 28 Aug 2026 09:56:32 +0000
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
Subject: [PATCH v5 8/8] riscv: dts: starfive: jhb100: Add syscon nodes
Date: Fri, 28 Aug 2026 02:56:08 -0700
Message-Id: <20260828095608.19955-9-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: 897b101d-ab25-4d90-13e0-08df04eaa3c6
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|23010399003|366016|38350700014|921020|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Fk05oi17AMB4DhwmeVQ6iwtFQRextt9LodnAMmzosEPV+J75y3a7pjaxBCMv7KDoQDAlxBZlV7ZRzOK9SMfqDCEN8x8TPeLlDRFwvXcV42WqnlFLY29TdzvflAWG2lZvte5+Y1XrZdtw2Fyc+XeKz3ktn9q6K4MPeyP8OMC/rhEP7ZgWt1pZGpsHVfeFpBybV3g/s1vAwJ2QYKC+P7tKk5+PBpfRyhAgdZ9ojNK/37aIBbwHbUYFKmVnfg6ls4EtIaly09OQ5is8dWkcweqeeSr0MCje5lq45grknA/bB+zjuhVaPcwqwPOpN2n7iIZaSjiRvyNWI9E5erEkG3PMYgyyp8vFl2X4tvVFLL1QpFuKhy4IXMLS79eDaWd0EwG9lHrNzSncoZlKe2hnkpEa3Opyu7iIIOWDLwj+T7Ti0KxwZIR/Hbchxokw6ZH7jXL2V6MYSJXUTpPzPDcWuO3yZg7LxfVCaIaBBm+zUFC3COkdvj7djHNvypmAbqdrLALsUTYNsp3EbL18kiUtEfkl7pxFDyqXHbTY3L2BIdo+0c21oEqM8FK6SYH9l8gNVAm29vsnJLfyg6rJqlDcmk7c/w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(23010399003)(366016)(38350700014)(921020)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?orm8g6kJYwtYV94DLGzXhjpfJ9yHqcVegsRM05+pN5fds4i87xrOizfUaAtQ?=
 =?us-ascii?Q?7HwW8J/jt8/QOTdEV95U59iQc+GqgwMx6R8kBH0BgDwfITvTaniwlKd8y3xy?=
 =?us-ascii?Q?Ypp/Y9BDr7ZRzLjmLbc/JQVMILxjaqF25oyj34lqOeuZYDFmQKtzNWSfSBwV?=
 =?us-ascii?Q?O6OQspvWcjP0Emj8wRjgBFCySJO41E+75MZxfDhTP8AwW9fDBDA3gycl//o0?=
 =?us-ascii?Q?u6KlFklzi1r5EQ78nPuN5yU6IGnj3kUXaKdA/LJjcxA1xNWHcvBfjaIzak0y?=
 =?us-ascii?Q?F4/LymHnRDehUFW0ZAvU/cNgi17cPmjWI310+HGsRhtslrAWS7a4m+0unepM?=
 =?us-ascii?Q?HGtW0XW4lh8+lilFw9lFXieaw/UeqArJ+4XLK9TG3rOwYv1pCq0xdIsQkqrH?=
 =?us-ascii?Q?+cchpbEksaUMaqQ1H0ArIlJZNBD1azKOMOxqM03/EfYFAr153io9VAyaanCQ?=
 =?us-ascii?Q?/RQmtOV4vPCcsn/Sen5fN6WNmt4Vv8kGtWTn5HPLyGTVo7OrY0OYcToGUJ9c?=
 =?us-ascii?Q?2YGuf3/E5Qc89oby95zFHDEbCnXQnBzzcXmB1aTZm/mH2NOwgEE3+lahAfxn?=
 =?us-ascii?Q?Eicqa2ewA/1j4LK80/EgxpCrXBs54ePf5c8c9dwoB40141tlDlxXHkbuHq0U?=
 =?us-ascii?Q?aoSAnRR2UNxPktQXMmbkFP6BCR5JigtLqIUXczhrQtp5kPrBjyOStZN0WuPJ?=
 =?us-ascii?Q?Qk9sIJ2kCbHRMZ/1BR80v8wWIcGP4O8Ywitc0AP+AXeP/w87ZdUgUXfPsEnI?=
 =?us-ascii?Q?YfFbPWy1iplvPpdaiuy2N3a1CVRZUbIlHSDmZF0zuLMqLqnzNW6ZDoHPlB4R?=
 =?us-ascii?Q?K23v2fvp28vaQhkl2JlgspiQebob2QgCJ820p2wySX7SCfE0fWXH37tYBDh4?=
 =?us-ascii?Q?8bVWSWM0yhuPP8zOkhunQArN+5ov47v9of3V0Aqv8nme0SRYw1FBrOEoO1QW?=
 =?us-ascii?Q?aoDTTBH/IZhItTvVQttwOmJw6c1+hsBtWzK8KEsexexKebMin7OPWUGuFM7V?=
 =?us-ascii?Q?WlG6V9jhO8BkRR32S9xwdYUqDwzHZuOuxdPdH26ncfZr4R0VllggRDyy31qF?=
 =?us-ascii?Q?JWdQSRY9q6Dsv57nwgVTzcK8GQBHHuBSiInFr/1NiSfJ6XkeB7Pqj7OvZ1LV?=
 =?us-ascii?Q?mUYMRQHhr6QOkVsTFA4NLNmZPIAzjM+vQCa53IrxmjwgaYkhfMuublgKbO8w?=
 =?us-ascii?Q?Nc3BwSE82eytAejUZvHj+yaFZnb/L2QmgFiGVLeURaVmsGKvFiZVJ14E/IDp?=
 =?us-ascii?Q?VjULG258T39j7SDumIJFHKWQ/uE9YrA1TcLBfN3coU850TsxFqOY2HQXNodJ?=
 =?us-ascii?Q?dRJXOwi7ddaTtj7VfSZfSlO+qCuvvhEw2E8hgDMJVpg7EcD99vFp3zngnBrJ?=
 =?us-ascii?Q?s5oNsGkQWYES4px6RvpDkKFxzWq50wIr5oJnrW+Y4Ic7TeMTyq526JqDGyWK?=
 =?us-ascii?Q?AM2VhiX8jo8s3CdVpa26h2eZEbYBDnO6p6uwU+ljh5o0v4BxkLGekPbliEje?=
 =?us-ascii?Q?NGNzIt8Ixvh+DroqMqr9yyB3ImHBk5uUpJ8lt5guj7Lwc96gsUypdS+gdFBA?=
 =?us-ascii?Q?Q2in1VT5/xdGWhh5C90GuW7ha3NbzdnC/DM+UjKTR3/pg4Y4Xop0GHbjR5iJ?=
 =?us-ascii?Q?6kCaHDQj4xc3wVVJRHk+Ud0648YMAfyd6svyRYpD/vE176IvfRIJ4j/0zEF9?=
 =?us-ascii?Q?Ks2gsDuWDPmzvy50/oyG6qDWvOhD7vq8mId6rvoNYAdL69BrnYh1WUbO+i0c?=
 =?us-ascii?Q?nIbe7HMqxkv+ipnaAadhRokgfSqE9b7mEosg1nfy3FB5yYiWfUNW?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 897b101d-ab25-4d90-13e0-08df04eaa3c6
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 09:56:32.7807
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o9hghvkHD1oGv+KkvwcIW6H5kB6bPb9ZfJSpKNghfexBXs4uwzbxLBPy1lv6iX5bqH8KGc4a+p8IIJ4boQOenSqWQLWbFkF+sSwwkg7yq5I3YREgnA54WO8C9YoIEJFb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1204

Add syscon nodes for JHB100 RISC-V BMC SoC. They contain
pcieep0_ecsr_syscon | host0_syscon | husb0_syscon | husbd0_syscon |
pcieep1_ecsr_syscon | host1_syscon | husb1_syscon | husbd1_syscon |
gpu0_syscon | gpu1_syscon | husbcmn_syscon | b2h_syscon | h2b_syscon |
vout_syscon | pcierp_ecsr_syscon | pcierp_syscon | usb_syscon |
npu_syscon | per0_syscon | per1_syscon | per2_syscon | per3_syscon |
sys0_syscon | sys1_syscon | sys2_syscon | strap_syscon |
sfc0_filter_syscon | sfc1_filter_syscon | sfc2_filter_syscon.

Also update the references of pll nodes.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jhb100.dtsi | 193 +++++++++++++++++++----
 1 file changed, 159 insertions(+), 34 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
index 6b2863fd3fd3..e76cf0f3c380 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -282,36 +282,6 @@ pll1: clock-pll1 {
 		clock-frequency = <1000000000>;
 	};
 
-	pll2: clock-pll2 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <903168000>;
-	};
-
-	pll4: clock-pll4 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <100700000>;
-	};
-
-	pll5: clock-pll5 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <100700000>;
-	};
-
-	pll6: clock-pll6 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <2400000000>;
-	};
-
-	pll7: clock-pll7 {
-		compatible = "fixed-clock";
-		#clock-cells = <0>;
-		clock-frequency = <1950000000>;
-	};
-
 	per2_gmac2_rgmii_rx: clock-per2-gmac2-rgmii-rx {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
@@ -393,6 +363,97 @@ bus_nioc: bus {
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
+			b2h_syscon: syscon@11135000 {
+				compatible = "starfive,jhb100-b2h-syscon", "syscon";
+				reg = <0x0 0x11135000 0x0 0x400>;
+			};
+
+			h2b_syscon: syscon@11135400 {
+				compatible = "starfive,jhb100-h2b-syscon", "syscon";
+				reg = <0x0 0x11135400 0x0 0x200>;
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
+				compatible = "starfive,jhb100-pcierp-syscon", "syscon";
+				reg = <0x0 0x11719000 0x0 0x1000>;
+				#reset-cells = <1>;
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
 				compatible = "starfive,jhb100-uart", "snps,dw-apb-uart";
 				reg = <0x0 0x11982000 0x0 0x400>;
@@ -410,7 +471,8 @@ uart6: serial@11982000 {
 			per0crg: clock-controller@11a08000 {
 				compatible = "starfive,jhb100-per0crg";
 				reg = <0x0 0x11a08000 0x0 0x1000>;
-				clocks = <&osc>, <&pll6>,
+				clocks = <&osc>,
+					 <&per0_syscon JHB100_PER0PLL_PLL6_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_400>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_800>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_NCNOC_INIT>,
@@ -422,10 +484,17 @@ per0crg: clock-controller@11a08000 {
 				#reset-cells = <1>;
 			};
 
+			per0_syscon: syscon@11a09000 {
+				compatible = "starfive,jhb100-per0-syscon", "syscon";
+				reg = <0x0 0x11a09000 0x0 0x1000>;
+				clocks = <&osc>;
+				#clock-cells = <1>;
+			};
+
 			per1crg: clock-controller@11b40000 {
 				compatible = "starfive,jhb100-per1crg";
 				reg = <0x0 0x11b40000 0x0 0x1000>;
-				clocks = <&pll7>,
+				clocks = <&per1_syscon JHB100_PER1PLL_PLL7_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER1_NCNOC_INIT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER1_CFG_800>,
 					 <&sys2crg JHB100_SYS2CLK_BMCPER1_NCNOC_TARG>,
@@ -437,6 +506,13 @@ per1crg: clock-controller@11b40000 {
 				#reset-cells = <1>;
 			};
 
+			per1_syscon: syscon@11b41000 {
+				compatible = "starfive,jhb100-per1-syscon", "syscon";
+				reg = <0x0 0x11b41000 0x0 0x1000>;
+				clocks = <&osc>;
+				#clock-cells = <1>;
+			};
+
 			per2crg: clock-controller@11bc0000 {
 				compatible = "starfive,jhb100-per2crg";
 				reg = <0x0 0x11bc0000 0x0 0x1000>;
@@ -458,6 +534,11 @@ per2crg: clock-controller@11bc0000 {
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
@@ -477,11 +558,16 @@ per3crg: clock-controller@11c40000 {
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
+					 <&sys0_syscon JHB100_SYS0PLL_PLL2_OUT>;
 				clock-names = "osc", "pll0", "pll1", "pll2";
 				#clock-cells = <1>;
 				#reset-cells = <1>;
@@ -491,7 +577,9 @@ sys1crg: clock-controller@13004000 {
 				compatible = "starfive,jhb100-sys1crg";
 				reg = <0x0 0x13004000 0x0 0x4000>;
 				clocks = <&osc>, <&pll0>, <&pll1>,
-					 <&pll2>, <&pll4>, <&pll5>,
+					 <&sys0_syscon JHB100_SYS0PLL_PLL2_OUT>,
+					 <&sys0_syscon JHB100_SYS0PLL_PLL4_OUT>,
+					 <&sys0_syscon JHB100_SYS0PLL_PLL5_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_NPU_NCNOC_INIT>;
 				clock-names = "osc", "pll0", "pll1", "pll2",
 					      "pll4", "pll5", "npu_ncnoc_init";
@@ -511,6 +599,28 @@ sys2crg: clock-controller@13008000 {
 				#reset-cells = <1>;
 			};
 
+			sys0_syscon: syscon@13010000 {
+				compatible = "starfive,jhb100-sys0-syscon", "syscon";
+				reg = <0x0 0x13010000 0x0 0x2000>;
+				clocks = <&osc>;
+				#clock-cells = <1>;
+			};
+
+			sys1_syscon: syscon@13014000 {
+				compatible = "starfive,jhb100-sys1-syscon", "syscon";
+				reg = <0x0 0x13014000 0x0 0x4000>;
+			};
+
+			sys2_syscon: syscon@13018000 {
+				compatible = "starfive,jhb100-sys2-syscon", "syscon";
+				reg = <0x0 0x13018000 0x0 0x2000>;
+			};
+
+			strap_syscon: syscon@1301a000 {
+				compatible = "starfive,jhb100-strap-syscon", "syscon";
+				reg = <0x0 0x1301a000 0x0 0x2000>;
+			};
+
 			intc: interrupt-controller@13220000 {
 				compatible = "starfive,jhb100-intc";
 				reg = <0x0 0x13220000 0x0 0x80>;
@@ -518,6 +628,21 @@ intc: interrupt-controller@13220000 {
 				interrupt-controller;
 				#interrupt-cells = <1>;
 			};
+
+			sfc0_filter_syscon: syscon@14090000 {
+				compatible = "starfive,jhb100-sfc-filter-syscon", "syscon";
+				reg = <0x0 0x14090000 0x0 0x1000>;
+			};
+
+			sfc1_filter_syscon: syscon@14091000 {
+				compatible = "starfive,jhb100-sfc-filter-syscon", "syscon";
+				reg = <0x0 0x14091000 0x0 0x1000>;
+			};
+
+			sfc2_filter_syscon: syscon@14092000 {
+				compatible = "starfive,jhb100-sfc-filter-syscon", "syscon";
+				reg = <0x0 0x14092000 0x0 0x1000>;
+			};
 		};
 	};
 };
-- 
2.25.1

