Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2127.outbound.protection.partner.outlook.cn [139.219.17.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18183BED56;
	Sun,  9 Aug 2026 09:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.127
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786267679; cv=fail; b=gNTTzgIZqaSOltVq8mfT4I8t/Ee9UY0v8fmmwpWHn/9lPfV4MRn1U7gTGLvCLsmDs1U3y/i2UxQxb7b2X2AW4uTJ4ATkgS7Dlj6fnesOsemj/+LRQRWXpAiHlxY7pa2JRLdO2hxjm6EfjHNSDjYyJoEoY4zlytgLn6Ne1VsW5VA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786267679; c=relaxed/simple;
	bh=bRtUm/mMPK4rwMp02F6oGU2pXNS8q9mbEcQ2EGHz1GE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=c9/cu5JnRZ78Gc/StuvLzXSkPMRnJZAKONe+0zYoSL+wVcupLR7pVSFSTtrOtT6nU/1LqKHDA7LKCAvjjd4exgFpZG4MbgA64UpjeSsTMMprMUU3zg6kIl1HYp5s3fQqKGHhLWRr04hly3eYy/rO3uoq/Mf9soSYDpfmV2/de1M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.127
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M9gTe65NDjU/sajH8Dev3dl2OC1L/fSPtK2ugSnflVkqUmIZubULkEQGOvNCt4cGkgOuXaFqpFoM/jDSzBVExpeWYp+RnKyFNyw3iLYwVtpWVdsy4JJnNOR8xvFixoL5m0RGHMAYnoRFcybcgb9ZFaGKGCrrP98Q2/LaCg3sMdWoHJ9eGlE150kzH83hQVH73JwPCMMpdnFaJ6MaIeH1fnJa4kUwyayVMtkOwCVz/wxD2cC8UxZmi5UE4IfxSk8Sajm8eSHVIRWqN2yYkPj9Ne1F3clfL3NUL+WfEfcZLzuZDCXGx6qJuNKjcy6spNTZYyeGBB3zo21uUkdYKY5+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58lFl7P/QlCFlTzbKSHFfAsUN1RhvIoAkgGdpj9U5fE=;
 b=HMxFzeM/BzWVuQ70a+9vR4HYYD0VeLM7B4jG/WWItWHQlPUBHrtpLZbpibt5sd/1Gy1HAzWpVqeyePeM7w/YijjxsHGiudivwLABTETdLkRUBSKC0pajAD9NcKSoHDyegyFSnlXWDfrEdbiwDaEMGGsD9ts08OBlE0oaKT66lo+HclCbIGtfdUCGxopDoRiCQHRYjrIs4SHblXCDO+dBZ4HquMu5IE0bzn4o3q+vYe4sIUI29laBcuxSW8axfouaruy/zMR/SXpNpwP4krmlJ9K5lEIAw1gnnRkgQtRiqwmZDj7YWqqC4ozHkqzh5xMdCRvdAeZSBcuBaPaSB3CE7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1204.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Sun, 9 Aug
 2026 01:51:17 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.024; Sun, 9 Aug 2026 01:51:17 +0000
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
Subject: [PATCH v4 8/8] riscv: dts: starfive: jhb100: Add syscon nodes
Date: Sat,  8 Aug 2026 18:50:54 -0700
Message-Id: <20260809015054.210577-9-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1204:EE_
X-MS-Office365-Filtering-Correlation-Id: da838cb9-75f7-4535-5a60-08def5b8b39c
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|376014|52116014|366016|23010399003|921020|38350700014|10067099003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Sl9mUHrKjqaj8D5a83bFT5JkVjgM8bCav2p43drmBPdayWbwKJFnkwPRXfMZBZqJPRFWt1OF/wotUiZTd9GqTeHfj2BIgYFKOSN72D1waU2PbYcxKBMOi/HjzPYIelpdM+kkLEvPQtiiDUQhT8hFp6SR7Xm8mzygywcG3TZTEfnd64fLm2Q8uHvmqRyIjpO2b+9d/1YyhF/5wowfPLifQJYj4FSsIY9WyjIqmHgkhOhAmunsWz77fs3u97PMw0Df4NXVdC5Z0NO5uAma1Xn6DrI8zOLFpHRchaXp0HSzoBXkQb5+yT1NstaZhxL/R3w0L2dsCgbKRG4xRWrl559zWO2XbbzezuTtZAgpejAa5xg3Y42BX3IiUxx9rAa7SfHZtANjhAhuP7XCN3Cqcgi9uRNM/HO0O+Aiu1crbdmY++iMHzXGxi5oxI7t2fw7tjE/bkyFuh0IIXhOFDSHW1ZJ8QaoCLs98HrfDnNGxeZvwryInSiI5bZn71Aev1Igq/PtiehWRDbkAtJ3WLk+PMf2nN5BvZKBxbUDRQbFTjJcG+wcVvBlUw+d4Xu7HAIy0vH566QI16jZRXonYGzsRT1OEQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(376014)(52116014)(366016)(23010399003)(921020)(38350700014)(10067099003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0ly/5dKSMFsGmbk890l6gnLe/jz/0r8pUjFaeaUgvZ2/3PPmqAPa4T5L8FF4?=
 =?us-ascii?Q?doqFwVc4yrV5Vxo1tHJTlfPuCYUkN/anoPbx0xTGm5dO73IWcvPqMzL4eSXK?=
 =?us-ascii?Q?JYNaaQYHF60HjZn5KOBoscAgr2qnEQ3T9NUtjEZe/AWNaUcDE7RnjhigJ1/9?=
 =?us-ascii?Q?hg2kTC/fbPADRR9EXhW3TwcX7unW76xh6R2c2mvmsBfVez6XdSNV+8um7Mun?=
 =?us-ascii?Q?Gl2XINbPmfiTYblDuecSQtaF1rEiVIFogIHSHSbd8i+K0wzh7PluyT8rUW+M?=
 =?us-ascii?Q?M8UMWDvmpj7Pe1le3uWIGargf3FM7fgMjEgKB8UTXvQ+3sj44RCLiNWnJCoz?=
 =?us-ascii?Q?PXSDUl2hx4y3G4KPPGImnohsRvMfcnwDryy8HofQRLV2hWJgGFlNhom7/Mbx?=
 =?us-ascii?Q?Rgv1kCvuaDMKN0rOEs+zRSHDG6WQBuwmONTtdJuluy8QZrAZQxnv4L23k2Wp?=
 =?us-ascii?Q?qQPDuNOzt6Hqacwyfe8wVvnUkk7qsdkwuzVL0f6x78ZFNNmBftAAbIt07Dlt?=
 =?us-ascii?Q?1WyNWDBu9ASlipd9ZE6TFbEr3AS/kCTlhmPgXGzVebLDdqjFhp5Fi83WJxlo?=
 =?us-ascii?Q?JFwR5j/XFf614oOAoAbMNbK1FOnhIMhlbCgTtrXq3KXgMzpK+W7K0hm9l+9J?=
 =?us-ascii?Q?R53cZ498jU08HO5o6rBQv9C+9ArHX6ZguvIe2qq4bFKScd9qWmHjW5gAWJu7?=
 =?us-ascii?Q?CkQWbtMw9TwSE/ZHO/KP0b4MF0sKJsAvApsoXTGstUWlwczpG3tL8py3/uwB?=
 =?us-ascii?Q?Jlv6AgP/z3kYeI/f1ccoT7Bn0VVsnh6C1jJG013poUjSQp3Ik0eRbJ1dZAOy?=
 =?us-ascii?Q?QENqN2AXNfMammHTuzeOq5bOK6BZef08U7qUrz7hWlqClM1jhXp0tiW1KdC3?=
 =?us-ascii?Q?Fzw32SiNHjhlwu57LssYZuwsAK7XqQ9nV0i7uF8mwJyqYMA00uQpc1JeTY+J?=
 =?us-ascii?Q?ulszEQh4fiJGLE+zf56uofsnGoNSZblIqDY1C/i1VIE//J5UHW5H47d0vQRo?=
 =?us-ascii?Q?SXlDjgpiNnOq7+TsHody92h00kssDFMUdHx+mLTOMEs8ccr2UGBPowFcsRkz?=
 =?us-ascii?Q?1dokKF2Zyj9UAW53LCttdcHkhGiuNLrGhKKWijfHdm2NDO1AWfcaGRYzDTCU?=
 =?us-ascii?Q?Qggd0yykHySSaQoMOflvCHMkppwRkxCbzofGZOTLc3sMrfxj2NUtM/A+GECS?=
 =?us-ascii?Q?dbAMRI3VSG/iToXAmCBxUceuHzeqD/vgZIcWWTnKGKjMbBRCCDOPMUX1yGT/?=
 =?us-ascii?Q?K71momYaH2NxDZkfGbWvUE+o+CSQbxkytI1v5Gztpn8uQ9ptsh8JAbm6VXEW?=
 =?us-ascii?Q?8aX3UJ+FvhDz4SZjW161qXARYpJIPunvQXJVHIbC8Ks7C43X5o4GugmYxcFB?=
 =?us-ascii?Q?9eAWxvjU68OgQ1Frx0Tp9VRhu5AkSz/kkZxRZD37eyXXykqig8+duEYzBi/M?=
 =?us-ascii?Q?NNri2LcZXAOVfTrH1RKKXgOjS8xmOLHMjI0onz5SyE+dn1DgElpSgEvXxB6d?=
 =?us-ascii?Q?khAWASiwW5Hh/4yOiZtcFhXIWTVVJ50OzkY8zIa8N2bc4n/bRkcxL6rR7abx?=
 =?us-ascii?Q?7eZvIwBTnJ6XJLR+tsHwIvyLMEXVwhMoBl5cgE8ijxfhjd6fn7njiw/VmMmw?=
 =?us-ascii?Q?gAwXFk2PWi7lw+m25q6HOl6V04x5/cacwapGSNQ1/N+i6LhjuW2Gw0Iqwuej?=
 =?us-ascii?Q?HQelL2pP1ZgIxME+OyqRHelqw0n50oTw3L0Yo5JLnKu0MwiacXavud7YNA4G?=
 =?us-ascii?Q?Fx0Ym8cC+I2clKLwI+aAr4IhpW0vZMo=3D?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da838cb9-75f7-4535-5a60-08def5b8b39c
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Aug 2026 01:51:17.0718
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKlZiAbdocBQvNyulwdqomlWkoiXNCRFLUpIgHhWNYi1B/XxoTXc5m3tXeBhMfmxZrewzHk6h/3hfCQ8dOOrik++ekZig+tis7X8myGTSxKrvvIU7TQsrMEa/EYcOm2L
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
