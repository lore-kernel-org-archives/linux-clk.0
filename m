Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011002.outbound.protection.outlook.com [40.93.194.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE0024F93B2;
	Tue, 29 Sep 2026 09:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790674814; cv=fail; b=Y7zJ7kSRzFCxJVe5AqrK3tArLwKA3teSOLfL/Ew/KLLBFk+TYWIIQI/60hCDvf8ndKsj/EV4jVf/L0CRyVcM58mSeHmM7JsqphKAT12NonxKVMxNpKBzrrrjPawUbAjFw2B6cSWAjYrKXBwr0fVgaeXnTvSOmSvAiDtHdBeuSXo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790674814; c=relaxed/simple;
	bh=USca8wSvPW4T9UZANqU4Utkb5uMsxJm+fyQ31hBCqrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dphiolr/sANMIsRcVWEAKjN3JjCp3Xsi34qovxWsZqr7VR/+iIljtGPlKC8w+ETDJwPK1pPvtc7CrJmz6hNI1lYcc4xZJmwbY+Sp7tcxA8qO4VWctgpyKivYd3nqzl5WJOxnVDJ+kzsqiCIjjqUIn4VN/1VByIa9HqK97UYaPxs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=hTqLCn+v; arc=fail smtp.client-ip=40.93.194.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="hTqLCn+v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PPQ86Qb+73ZQlCtdpzCpNDQJIH+3pVO9Z/NKv6cjeYq01SgZAxGuYvEhU+iZSuBbfTcBwaUelHXETHiSrtb8dnT4it5QT6CXU4Dl2UUT17wSpNO8gNotXh2FLS1XHYueddNKeDBdwE9iCR45MjFMcnazNwWl2TUv9Fv9qwZZ6E5A5FenZIKM/tW4mFdXopkpBq60awj5nmZ/yxup3x+q+QpGFwRsR52iZNLWAS0xDaLIq7vIBwgLL0OmiiqQ1T+uOWqoSZt2Zh/KLyNFb3MHhp8JhU2Do0lkWQeoWVyOdxaLoEDlVSn7LYx6KVhu4Eh+gQOHSsUca39P9K9wW7bxYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aLwdifYpVJYnypM0/Y/0p8Y6JwPQ6oPaF/W4fda3JSA=;
 b=LGvG4q6217wKXPR3YNOtn9unIayhPeBFOR1h5tLwiT00dtjw/GAaR+2yvmubpfF/i7EYMdJgtE7/rRCcBsSvhB287WJg4rxp5CeVXvaPEke20+c5N9pEVE8NPZ4CcVoWUYzdqn6wv6hCz4ExPSAOtXq4LGumgU3roQ/XotDpjADlyyIDpYq8TAIgOVQrVBu16gA115wZ/RNauCEVD3Q9doJQ5pCTj3MMEu6NFLCXB2D7FetiXdwk7+czOV/VR9l0ChoQ/FuBrqw7dtghVHdIK0JeXlDLQ1KMp9SrXa4yzoQqftOE6A3XlGvXm3c1L40hRsy4TXissVAwV9Z+M+iz/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aLwdifYpVJYnypM0/Y/0p8Y6JwPQ6oPaF/W4fda3JSA=;
 b=hTqLCn+vZsL+MNCRoqC7wGHLrUlHaKLNUY3seDgLeB+uDPTB4dSDTasrsCkb609+17xN4iUU5+PNF8Bo3GUmtUdhlfEJEeCD4VsxMXHbROinNiZpi7aIk0pOvB4Ow0Uw12Rb3oKJQFTkILwgjGBbVCldatynoT1n1BB0pb8vcRw0eqqUtuOwjOznocKddk04ZCZF+51EnW6NIDt+67U9o/K3wZeDCE+n6IvkalrgUyEFODZYxJrIb98+V2mJJR5sLvB1YySqSQqKtclKEov40+D4Z48mNLTgdZy+hk8Be+JLpJTLWIcTXbHagBpUsahkYAS4PD62ASkbvFyTSqurpA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by SA5PR03MB989108.namprd03.prod.outlook.com (2603:10b6:806:4d6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.18; Tue, 29 Sep
 2026 09:40:11 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0451.024; Tue, 29 Sep 2026
 09:40:11 +0000
From: evon.chiam@altera.com
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>
Cc: Brian Masney <bmasney@redhat.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: socfpga: agilex72: add clock manager support
Date: Tue, 29 Sep 2026 17:38:14 +0800
Message-ID: <d6a2a5026a6a00d0b7ecfae76ff299f5b9752686.1790661931.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1790661931.git.evon.chiam@altera.com>
References: <cover.1790661931.git.evon.chiam@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0188.namprd05.prod.outlook.com
 (2603:10b6:a03:330::13) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|SA5PR03MB989108:EE_
X-MS-Office365-Filtering-Correlation-Id: ff8a5279-ff74-470e-d4f5-08df1e0da7bc
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|7416014|366016|10067099003|11063799006|55112099003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	roYFn/zWKTaE0JaxmYizD7OBkO1nFsSZ56iXUb0GetsPzcTYy8iHah0oJgppmB4Rsv5C0Ph7bBn77tIc1FQFo/TBsM7N8Ih8l3RQTzDo0YHfwHedOSafdQFVBVOxfaPr/H+aGpmHrpvOCustx0LWZrHblKC2y33Yfln4hQSpuBcwJALG6D/x/ZGJdN1BD1woLyRCb2naioTvoK0oooAkGGSd6cazhufRnTkPfwR/B0XBVLqvmrM6zha9BclPrKdFp2X9Zesg+S7WMg9ipr96jub3Py3mFIMig2+JTKQUMViC0mMYyAa7WtrCKK36PLZpo9IW/+2nyC2kcTfUKnVYXd5SGaUOGQQ++JweizJSUTFNaUK5EbUlIFEUsbQKsYaU3BMxsItpNyk+CfFvCHUb4XZBz48lt14oN27xNtdaiBpgIM5AP11DebNtlB5ciLJTN2KSWV9PbaV7dmsy4pHEf2f+bErj/LGUIpJGSSZvMXpwZk9welRvgtRlIeeFTnhSjcNqTru4tALi8Sfi3t3Zs8i+V3gGg+DVKwe1XkU7WKAGcld9phSObsPhVctp2xt6+Qadlded+pXHmAeX0n2B1t85+bHAQk4iqEdWJ2iUxIQb+RWpN9z4yfAf4gIFCIDA5Gnyi+EAtSU+qfrYu4sXgGKEnfitG6oQUGMY/60ig5E=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(7416014)(366016)(10067099003)(11063799006)(55112099003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ij5LsbsS4TjDWstDt397pl9Ndbyx84ZQ+GeJGKgU8yO03Sq7QgtXKILKd29K?=
 =?us-ascii?Q?X2PvT/L4Vp3Xd6xJmakEHdK2BbepNmd1UqWnaVnIeQ9RiTkOffra1vbUy7hs?=
 =?us-ascii?Q?PPndWiz/GxAvlLnmF56RsMgcNuCBxS8euNvqRaIOoSawiz7m7fEzYn/s+LPU?=
 =?us-ascii?Q?1GzLrwPg6nbBFgZt+6tnzBt/aiYJARmabL555EoUgSi2iPUooxysusAIRj9/?=
 =?us-ascii?Q?AT30OlxMUK8tCjqRS0X1vJPfthpCz1kPRSrdCfEPsTsjcslJBcK7ldNkGX6U?=
 =?us-ascii?Q?skrGzPy0C8Xs5BwhJfgLb7qipSXTl6983zPLCeIOoLzQ7TZaO/qnEnRMb9Ze?=
 =?us-ascii?Q?jB7+iU3wxwrQtxq07ap+Xseexe7X1M2NAq/QOwTliNEC0MvBc8gHWYUQrnTD?=
 =?us-ascii?Q?rzeUrkT74ffNt/m60keo1adJh5jhFIiaoJd4DrGP/O+Qe/bZHcEMiqYsvx5Q?=
 =?us-ascii?Q?uUeGSJBSGZZpGmT4Mw9c7eBpbDGwVEJuNGOu/dwkSWGJHtuDbUNAheBg+8+Y?=
 =?us-ascii?Q?Y1W9fo07RtA1Ghvz6ko775HKBs/5nUC4ZPaiKs1z6Z1E/vd8ljyn666BW8LW?=
 =?us-ascii?Q?B98COcufnm00r4Uf7nzqd56hH6XFJ1fWlVIvxmwNYzHdeWsseW76kjC67VQh?=
 =?us-ascii?Q?XLdlAIgzcWHkH2rD2YaaoEYP3zFfoCTt5PL4jqHknMBPsJucatN8q2wSDR0p?=
 =?us-ascii?Q?5nANZekP5e/tRGiYmA8lOfUmLGq5cAKg41Cbu5+DyIhQrQTsYuJj3V57PMsM?=
 =?us-ascii?Q?gUM+OeQQFSQlcGVksGZBUw3CxxGN9wIE7rVnaaoRtgjvKucKmmZlUQLsD6Dr?=
 =?us-ascii?Q?B977DNXo53WFd7ls88BMAudu8QCtEDEXDbHvplwCw/FJeVHMurFILkcxzJ00?=
 =?us-ascii?Q?7qyZiSDk+72EJ3QbSdItYU3Y+G2esub4Vx7cu1chzgHCl8le6U9hLbZoRV0O?=
 =?us-ascii?Q?gh46NiutcstetBfy1DI3bBAkLFU75V34I0OQhOmAToM1bHF9D6i26d6nH39h?=
 =?us-ascii?Q?rzg5yxFD5mL7YCgQlILjPg5Kvk1gNuazdkOG7po68UcD5q+ceSUqWPpTz2O4?=
 =?us-ascii?Q?KM2Z6GUgA37P2F9sQAHoY5jEAJsNYblxxSNdwLAvd+yzv5Smxx4svFOLATMW?=
 =?us-ascii?Q?YCAFKo8Poztm1Pc6gz82d447BPOQpMFfbingdBTHohy27kwVnENidWnBlH2O?=
 =?us-ascii?Q?PuUuOlbJ2Z//WRu7L99CxVTSFx0IlxIC3ZXnPL5NRr0bfggVG38tBYEDVk8l?=
 =?us-ascii?Q?Gbvrj7t/L9fPiSGuJJGZgHk215shZe5K/G/WMsm7ylzQp+QlCriNcmI066X0?=
 =?us-ascii?Q?X6ANIyJQZOfok+50Y4oFvkOTPjpQJToo7gmYyl6VPrQJaMuJQ1HESUhced3U?=
 =?us-ascii?Q?KfBZczP2kOpV5zk09ha3g+X6/vV0HXAU6Ok4NhBzV0CCG9droztsiciGYCFb?=
 =?us-ascii?Q?Zo4SESL/0YAe1f5z460C/tY+Eg5bj8CGECu726W9pKavgP+/ZUFMB0ZWh3Ib?=
 =?us-ascii?Q?9JCX48d0E7R3zzSQhqCEei0LI2uDOS5o7uWTBTxRStwDZLJhsWYSAmba3Ceg?=
 =?us-ascii?Q?YjFM2ug5RHKuMc9wGV19BGbkKKf7bgG08lO9EA8BBdMHOSBygeiF3sFbjTm1?=
 =?us-ascii?Q?bI8hJlQhlHErdC3LnhOaApVBcQPd7MGbyobCeyF414DTBRYOYu9NJhOj95n8?=
 =?us-ascii?Q?TwfzrLdTlO70e+UQWOS7zfRvTZmP76Xwe3XY8QkYoBNmPKe3QtPtFhbm0+0/?=
 =?us-ascii?Q?oIyoAdTivw=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff8a5279-ff74-470e-d4f5-08df1e0da7bc
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2026 09:40:11.7037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TVgBwKxcaRotRbzU3RY163khXCb87QNPgyZJrQfnfGX3MSbgLOVo+vA6nB3VrzOkjHyPMAhKcOMI6M2UPuxQRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PR03MB989108

From: "Chiam, Evon" <evon.chiam@altera.com>

Add the Agilex72 clock manager node and input reference clocks, and
wire the UART clocks through the clock manager instead of a fixed
clock. Set the SoCDK board-specific input clock frequencies.

Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
Changes in v2:
- Subject: use the "arm64: dts: socfpga:" prefix to match the directory.
- Keep the device tree in dts/intel with the existing "intel," compatible
  strings.
- Pass the four external reference clocks to the clock manager node via
  clocks and clock-names.
- Dropped the unused sdm_xspi_clk fixed clock.

 .../boot/dts/intel/socfpga_agilex72.dtsi      | 44 +++++++++++++++++--
 .../boot/dts/intel/socfpga_agilex72_socdk.dts | 12 +++++
 2 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
index c29c2afcaab7..e1553791c472 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex72.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/altr,agilex72-clkmgr.h>
 
 / {
 	compatible = "intel,socfpga-agilex72";
@@ -64,11 +65,32 @@ cpu3: cpu@300 {
 		};
 	};
 
+	/* Clock tree 4 main sources */
 	clocks {
-		uart_clk: uart-clk {
+		cb_intosc_div2_clk: cb-intosc-div2-clk {
+			#clock-cells = <0>;
 			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		cb_intosc_div10_clk: cb-intosc-div10-clk {
 			#clock-cells = <0>;
-			clock-frequency = <125000000>;
+			compatible = "fixed-factor-clock";
+			clocks = <&cb_intosc_div2_clk>;
+			clock-mult = <1>;
+			clock-div = <5>;
+		};
+
+		f2s_free_clk: f2s-free-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
+		};
+
+		osc1: osc1 {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <0>;
 		};
 	};
 
@@ -133,13 +155,27 @@ ocram: sram@0 {
 			#size-cells = <1>;
 		};
 
+		clkmgr: clock-controller@915c000 {
+			compatible = "altr,agilex72-clkmgr";
+			reg = <0x915c000 0x1000>,
+			      <0x915e000 0x1000>,
+			      <0x915f000 0x1000>,
+			      <0x9160000 0x1000>;
+			reg-names = "clkmgr", "gppll0", "gppll1", "gppll2";
+			clocks = <&osc1>, <&cb_intosc_div2_clk>,
+				 <&cb_intosc_div10_clk>, <&f2s_free_clk>;
+			clock-names = "osc1", "cb-intosc-div2-clk",
+				      "cb-intosc-div10-clk", "f2s-free-clk";
+			#clock-cells = <1>;
+		};
+
 		uart0: serial@9038000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x9038000 0x100>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&uart_clk>;
+			clocks = <&clkmgr AGILEX72_LSP_SP_CLK>;
 			status = "disabled";
 		};
 
@@ -149,7 +185,7 @@ uart1: serial@9039000 {
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&uart_clk>;
+			clocks = <&clkmgr AGILEX72_LSP_SP_CLK>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
index 998f19f492b3..dfac1f18d16d 100644
--- a/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
+++ b/arch/arm64/boot/dts/intel/socfpga_agilex72_socdk.dts
@@ -22,6 +22,18 @@ memory@80000000 {
 	};
 };
 
+&cb_intosc_div2_clk {
+	clock-frequency = <500000000>;
+};
+
+&osc1 {
+	clock-frequency = <100000000>;
+};
+
+&f2s_free_clk {
+	clock-frequency = <100000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
-- 
2.43.7

