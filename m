Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2129.outbound.protection.partner.outlook.cn [139.219.17.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A35481664;
	Tue, 12 May 2026 08:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575027; cv=fail; b=sqwRXEMm4WI13ktdEtzTEbBtO1+Dh/6B2rWg8W5IxLNxdX7Jpxecuzc8ogaUjubQrgY3yMNcg5sYRpCMTEj9RUgxveMdlkYnruk5YyMAZYGxfXld5sLY8s5VO93ZzqmMBcgkjhvoqAir4rFlP6PLQdkfTghtMoixAC0yaqbyEPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575027; c=relaxed/simple;
	bh=ko8yUEFHehT4TqDlsflVqL6grfoWaKVgbAO/PZgourQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lSuWoq+89golMG6THWmxR9iNImVvnWrTpkdC6LfIdKzSGwxLM7NCx75cenRNo17OAD09gUWsdzFXBxb9YyeyMA/axCxsmnrIs4GeRpTfCCqAgOeyYtB4Qhxnrw/LACPZ7wbA+zUmMRueEx9PvveU4WklQg9kPNFCBdUcNhVGq/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZshKo/1aKUlJrer8p3z910Sa04SPZx+yjwMvvnNWjYRpNjsfEOcqR8A7zYVEPt+pgMg4PMfi/Gw5ITwl6wD1+g0SO+d5jLyK/ArTw2qROgX+oNwGybZGC41eeFN0dto6kEEgVl26NpVHlkRs+mHVBhLweAOW8e3C1eOJDdhwXle0fmy5N4f9TSgwerBjr1AZtbL6kHxaD4T6xOF0LPGm2gj3GVrSm9ITqKh4EDdYvc12PlvtWQFPxkpzbcj+veZJQQtXevRgVZt3C1sTOYg1MLEqOGNOA5QWP1sBOBhR8RJQjKcTnGe1qMzfuXW3rjAtkcDHHIzKSWd5udVRe0S0Jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U3s7NRKVTV96UArsQWaj8CWg4YNBsiYVibAuvTpcN0Q=;
 b=AXEv8BaCHty59f010t3UO01VfX8qYE9OIgwWllUqsS2OIxZMyos0OAYG/XOUym7Frayxm/aipASqxmDRdl/BWaTui+AT/sVQmnS+FQLTJK7P55yDgSWXh3xLpmHdKEdwT4HVRsHvcG9EBEuZcqp0ZXilQ/7DighTHJFlOppD6r/BsWQkbIYL6O1trmsB6LDyXbP3fVoe/By82vv7mS3Q/oGyjgSVgt+lJgnmddv+2YFTHQTKmp7pMMklLd23elT4Oq5fbtoBLoTNlW63z0Jkq3MtVQxDp1TQohfsMxjuIMhDfWVR7yaiuzU8pyuiPAdPmQLD9frl3kePEGL8espRXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1268.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 08:35:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%5])
 with mapi id 15.20.9891.021; Tue, 12 May 2026 08:35:51 +0000
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
Subject: [PATCH v2 12/12] riscv: dts: starfive: jhb100: Add syscon nodes
Date: Tue, 12 May 2026 01:35:21 -0700
Message-Id: <20260512083521.3448-13-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
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
X-MS-TrafficTypeDiagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1268:EE_
X-MS-Office365-Filtering-Correlation-Id: f19ac383-db7f-4483-426b-08deb0017973
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|22082099003|18002099003|38350700014|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	+G90xbjG6TXMsYKnT0MDCllt9rUjLWE8WYgsTXUWhFiA2BL4q8snbiW+W2MiAvN6qaec7cHigPwD3on15ZivMEqnd/Q9JMIWUHMQNwYohlko260zGYzApeGzGyQExlSnGjCVpU8pKC4NeDaapsPHAgNXNRvKabgXgb+8t9FGV1wVQFBdnKiOuzg2ADOxVDhbmARS59PtLupuPjFSIaFm0wQGB8vLX5sFpmBFXQSRtW0qOeOa7NGtenOZCUoq66GveEQ3WvCRSJL1F1f5lzqMOwRzk+UNesXMDaC6H0jiGbi1pzqzgFqebMNYu21p79WCs0+mR/ov2Qzm+d2fNKfSThtqSwQWJgh3rlT1bGWrxGzKVaflXcx3bOM4YAAbccrVMfHHIRD/BPXVKMWZKM8yYkUbeOQxaf7tzd8+I8WiMlqQBRXW1IX2rdQ2qwZho4HA4IcO9DYAj0u/TkEkeDWpMIyJpGrEqO6jWBcwQR7zVWhvmw67ZqV8NyN42RPjqZSO5gPXJUcDSXre1Mmt/A2MLI9ijHDwQCMABXYR6OBwR75ThLeuSFJ1QxrR5Vi7GtU5PcupZYfnaevqyvUAHwFacg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(22082099003)(18002099003)(38350700014)(921020)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?W/E2KcIyWCB0/1hTn2okEKEEwrXTHy6X1lWLuNtp/Ov9171i2xiP43xG6cfH?=
 =?us-ascii?Q?krIIOcdUGSjtVCMDBAVYHP+gUH4WoTw9Yr7dQUXsMJYejpKpER5RZ6DtQlA0?=
 =?us-ascii?Q?K5PrYKRuzYIwExc2o6VoVoytGTQZ7oxq+ZM1Tnv610aK4XOHWnMHbxvZgREc?=
 =?us-ascii?Q?83CbMKkQmJnIo9UiTncsWvQuecUQz0l8wgt/Eqw+XA71dYhxr10bQdKyLSYu?=
 =?us-ascii?Q?2dE8LcRhgaAo1iHfomhvFikphH15YYu7Kt15RfFGlkuDLJGxg3w9pCteIlfj?=
 =?us-ascii?Q?UhbhycUe0ykSBuhjSnSEwlAjepl8BPOhn+G4KvdyXabFaQkNyttzeI4oIyw2?=
 =?us-ascii?Q?tLEI0WXe4nScgk1ij7xA0s+KO+ZdFuvCZOki5etlO05+6uAki4OBxCwbbRf4?=
 =?us-ascii?Q?0FQ6v6Vh0J6bK9Ou442moEYuty5qSb4H4id0i0oqfP7drdj20+JWvO0cqe/v?=
 =?us-ascii?Q?IWmo1T7bQYeXQ+/Q3/voTnIReTg4WFeyrtUKw8YT3O699lSNndX+t3amzC7f?=
 =?us-ascii?Q?wr/zNTrWRmni4NMXW9oropcwmv1J+Lg4il2Ms+TrPxGBhBib03lJHrlqVODo?=
 =?us-ascii?Q?gmpeBdDrwGhsZ8r91A+JwaPqI9JweByl4VsUbitJfR9L616Hx5WByKqEiJhW?=
 =?us-ascii?Q?bR+TtZflKN2JjQ0Plgu9rjBnLHktZJEumzbUzbLRQ7JCM/x8BTtjgDr7Texe?=
 =?us-ascii?Q?qftv6+/puLynFsRVHyeN7Qdd/1mRzqUbUCYS46SKHwhjbe9dDK5GHIQMLyVp?=
 =?us-ascii?Q?qQ2nUAWuQki4nKbo7RLd5szVT/4ZVmTa1UOuMQx3QMxqqQFErJIqHE9im/gk?=
 =?us-ascii?Q?BPpaoNSa0u3y0jUVxU3dwryaqju2xjDqa9jcqgZ+I98P/bdWofJ9MXGxGfSE?=
 =?us-ascii?Q?j4V0IDumFNCexj1TWT+yPShoOeNI9SVJm5tNTwcF84GqE0XZyDlStaFGpaIi?=
 =?us-ascii?Q?4lggxanwNxmxMdLEkvsFlKHGmv/D+Iw0riw8/zL7y3/VBpk7/GHtdaZdUpiv?=
 =?us-ascii?Q?xvc/3DW1OfOYTEsomqwrsxkmMe+TwZi/uyoeeJe6StqtEDW7z5s4rhIz6Wv8?=
 =?us-ascii?Q?97o5bO3OEQ/72Xh9eK0f7pPqHorxBnzWCrnTxlWZe6vTSZeJdU+bheK1l9+2?=
 =?us-ascii?Q?hbEKo5dqcr4JAFEFEutlBNjfiEZpkkVxhPhMYY6fiKWpP6G31ZHyBd3crYJw?=
 =?us-ascii?Q?XWy6W3hpoL8H81TB0MfhH8d5MV3m4o9WVtv4MPEbIo0q3mpavVQEY6Jh3TOJ?=
 =?us-ascii?Q?IOUgvu+KycOtZWgUSCnYPb2/CfrAF8krxZaSeGhgygN65wkD5a6p3RltkhOn?=
 =?us-ascii?Q?Mrgxvvk8UpLYGXhLn7JOcDbv0ldF9uZgEmvVLKt2q5uqO+LgIcCTaUPWpvOD?=
 =?us-ascii?Q?VQ/Xxm7p+asL7X8PS4EsKsEsYqrqK0ESi9VRUFCVa1UVFB7er5rEZJIH6gIu?=
 =?us-ascii?Q?ZgO/Cwo5f48kmaPqJRJxe2iwwdihsO0YB8SJ/hIbPcW2/iWBacXvmLN+TW2B?=
 =?us-ascii?Q?hRiYA1XvsB961RvecrdZ35iEMGHJNtoHMckj8iY0C0OPB6M2aH75JtZIaasM?=
 =?us-ascii?Q?vZ8uyOXGWJABfvZMI2LIiLq9c5oeQ3RY9RZlK3plSdVPBOmMWUxL3WukIN84?=
 =?us-ascii?Q?gWXxkiXuqRtDBq+jnRUWHFL6iRr+N4Ob6bdz5JGOgqBFNEIeW0QpFhhaVS1e?=
 =?us-ascii?Q?NTkxydCUAky3N2zuN9FKuvqye0KVbwDRbkrOAwLSBZabFBNHFL7wAMffsV2/?=
 =?us-ascii?Q?bbnbeVnd4xh2B0DORKemjLKQnhUq+tTVFR9e2v8qN73cWmjCEDCR?=
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f19ac383-db7f-4483-426b-08deb0017973
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 08:35:51.3560
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: je+B2WUT9nzX7pxd3/GYkN3EpzeQ2mEaA5mJZDIw4e1f+cQfkKwmMN6GhSGmca6P3TjNnup1L6izteVGEajWX7BbYrdoQBAnqIMFfH2SoF79Zy2Gj0UCJ9W4enjLK64m
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1268

Add syscon nodes for JHB100 RISC-V BMC SoC. They contain
pcieep0_ecsr_syscon | host0_syscon | husb0_syscon | husbd0_syscon |
pcieep1_ecsr_syscon | host1_syscon | husb1_syscon | husbd1_syscon |
gpu0_syscon | gpu1_syscon | husbcmn_syscon | b2h_syscon | h2b_syscon |
vout_syscon | pcierp_ecsr_syscon | pcierp_syscon | usb_syscon |
npu_syscon | per0_syscon | per1_syscon | per2_syscon | per3_syscon |
sys0_syscon | sys1_syscon | sys2_syscon | strap_syscon.

Also update the references of pll nodes.

Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jhb100.dtsi | 180 ++++++++++++++++++-----
 1 file changed, 145 insertions(+), 35 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jhb100.dtsi b/arch/riscv/boot/dts/starfive/jhb100.dtsi
index 943324b3b2fd..bbdc717399e5 100644
--- a/arch/riscv/boot/dts/starfive/jhb100.dtsi
+++ b/arch/riscv/boot/dts/starfive/jhb100.dtsi
@@ -288,37 +288,7 @@ pll1: clock-pll1 {
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
-	per2_gmac2_rgmii_rx: clock-per2-gmac2-rgmii-rx {
+	per2_gmac2_rgmii_rx: clock-per2-gmac2-rgmii-rx  {
 		compatible = "fixed-clock";
 		#clock-cells = <0>;
 		clock-frequency = <125000000>;
@@ -399,6 +369,97 @@ bus_nioc: bus_nioc {
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
 				compatible = "snps,dw-apb-uart";
 				reg = <0x0 0x11982000 0x0 0x400>;
@@ -416,7 +477,8 @@ uart6: serial@11982000 {
 			per0crg: clock-controller@11a08000 {
 				compatible = "starfive,jhb100-per0crg";
 				reg = <0x0 0x11a08000 0x0 0x1000>;
-				clocks = <&osc>, <&pll6>,
+				clocks = <&osc>,
+					 <&per0_syscon JHB100_PER0PLL_PLL6_OUT>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_400>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_CFG_800>,
 					 <&sys0crg JHB100_SYS0CLK_BMCPER0_NCNOC_INIT>,
@@ -428,10 +490,17 @@ per0crg: clock-controller@11a08000 {
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
@@ -443,6 +512,13 @@ per1crg: clock-controller@11b40000 {
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
@@ -464,6 +540,11 @@ per2crg: clock-controller@11bc0000 {
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
@@ -483,11 +564,16 @@ per3crg: clock-controller@11c40000 {
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
@@ -497,7 +583,9 @@ sys1crg: clock-controller@13004000 {
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
@@ -517,6 +605,28 @@ sys2crg: clock-controller@13008000 {
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
+				reg = <0x0 0x13018000 0x0 0x4000>;
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
-- 
2.25.1

