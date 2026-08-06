Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013060.outbound.protection.outlook.com [40.93.196.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2745243302C;
	Thu,  6 Aug 2026 09:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786008347; cv=fail; b=VItmuOBnLA2WTo7eZqgv8H9I7tJE8BhDjUVdQyNuLl+g4ThILptSc1KhzQ9J8YWnTLraipxmoSiGOW4kGymkJb0mbmMFV9JIe4PlNZORMhXHpoLCEHQ8SgYauzu+0wngBvBiaQuDgRrXb3bZDUq9/bhfhBWgZwNNRP9VmlqX/Uo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786008347; c=relaxed/simple;
	bh=Ks8rVHBKbm+kgTfQvmOMExD3pCtIa4Ha/LZ4z8tlXZA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bAfOpbi+Dgo83h0ewLcoGPX5oW5JiXyvbmTnXYzAyDT6WrfV5JDGMa6TdVryRW/cwmXkx93j3StAwjWF5bwWEs8hCW4OM5CaYZhEZThpfvMVP7Lh0i7tIDMdp+Pm00v5CV9HqJ5v/5jmT5np1AUsyLogVaHY7RRjzm+LWERCCgY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com; spf=pass smtp.mailfrom=altera.com; dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b=YX7hiKF9; arc=fail smtp.client-ip=40.93.196.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=altera.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altera.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=altera.com header.i=@altera.com header.b="YX7hiKF9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CQqBpsLbiYVSNYjEhU4VpPXyhqXCtMoV22p7rczuXqvfhGm0qKK40DN4x2MJd+ISHkFAa4ivWD2DsbycvyMkonXnu5qOTsQ7gAYPgj9qo/8ONT58NhRggwfTmCGUHlD8vkFhnvjWyZieg/V7MYhMydOX4jQeyfjlLmqt8XZVSYLKQpB50FbPSvPpLpks3GEa5pcUQtj9yERXn2wDPD2ckRDvpgMBxc8IsSZnXJFZLtDI7jiDU0XQbyfhs8f33bFYtHGkbIQDm9zhWrhWfLqGypOPgyyRDMnT52QHiwFquaMHM64wCA44fensLmDHZJPlAVKtqiNuKd7AKr3DnwcsVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AV4Ulrm8jnxDoBndvE97zLHQbpkh1wyJP53NajXmZVM=;
 b=PbL0NBbG0e+6/FPnrU1hPDsVJUBwW8PpTLKwmeX6hvKDIfgcwFxCJDEGLE8AcKvOEe0gz8bmZh9C3jfL3kSqdxkQThwdYCuzEFfp3edckJ93BzkOKGAxRK6Zd71PE85rnncTvTkRCW8uLdCrR6glfinG7nkb201RLvfxmSbUzWesBrzdBrTsi49sy/HZRdqM4ZPiaYNnvnYXMyu8ccPDGJ8hmQDfOOkE0XbDRbUEzYd0x0gsMRYOM5ms20GsKM/VJuhZQPkj1HW+sixDwJo2L+ShXjV91pARbs9+K2SEeckLApBlRcqclP/Q1MMh6hHm+ma+lZaR0E0+LoMYu7Bc2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=altera.com; dmarc=pass action=none header.from=altera.com;
 dkim=pass header.d=altera.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=altera.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AV4Ulrm8jnxDoBndvE97zLHQbpkh1wyJP53NajXmZVM=;
 b=YX7hiKF94wD3NWYPlmOpa5eyxBF9OMHU1JDzJIvQnmdYQi0o8dxGJKOx11m0KFvG5As10TLvDaehvV9nBAKVza1va7rO+1w1IJ7jcGPDKV/GfdC7Wfuk6BVF802BwlPAJc2uVZeogRBtd0sXOq4HzX4Yym60vnIeT2dJmB6ZuV6GjS6fA7No1AHvkSG/WRkmldO6h1ttLfBLAGny3nG5jhnFv0fIQM2JMihRLnizruEiYiEUfYqMKQhzQXApl+OtuNRa/5KMJ5lSLVmhW3osY91dP122GwqPuSneEc9OWq25PZTN9A3AG3lTBV0cnv/tX1CSkyBoSKQvgtbsg+Pq3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=altera.com;
Received: from DM4PR03MB6192.namprd03.prod.outlook.com (2603:10b6:5:39c::23)
 by CH2PR03MB5285.namprd03.prod.outlook.com (2603:10b6:610:9c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.20; Thu, 6 Aug
 2026 09:25:42 +0000
Received: from DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b]) by DM4PR03MB6192.namprd03.prod.outlook.com
 ([fe80::b75b:5c92:1e9d:514b%4]) with mapi id 15.21.0292.019; Thu, 6 Aug 2026
 09:25:42 +0000
From: evon.chiam@altera.com
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Lothar Rubusch <l.rubusch@gmail.com>,
	Ng Tze Yee <tzeyee.ng@altera.com>,
	Nazim Amirul <muhammad.nazim.amirul.nazle.asmade@altera.com>,
	Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>,
	Brian Masney <bmasney@redhat.com>,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/5] arm64: dts: altera: agilex72: add clock manager support
Date: Thu,  6 Aug 2026 17:25:05 +0800
Message-ID: <394c5838c535f939361da220ad94c9aec7fea973.1786006669.git.evon.chiam@altera.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <cover.1786006669.git.evon.chiam@altera.com>
References: <cover.1786006669.git.evon.chiam@altera.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::32) To DM4PR03MB6192.namprd03.prod.outlook.com
 (2603:10b6:5:39c::23)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR03MB6192:EE_|CH2PR03MB5285:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ff602e7-a8bd-452a-9d2d-08def39caf6b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|56012099006|11063799006|10067099003|18002099003|55112099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	LABcBKg0O1snwKp6FS82yL7pXE9Cap4cvpNbOeO18PbGpxJmE5BH9JKtWtLMJhYuRAofxrJZy7xL2TNuBYZ463bdszXz2GW+vfrmtp9f5MKzCqkfVaX4vZXFDYGTZpF92vjqT7BvJpY9TZYqmIF2YeStNU6rWkjc9EnYrqYesM2ZDosEyhjyT2ulFVVT0+LrRw6IOoe6dRVQJyBXZsATVSCoooiSsGQ1u8VxS5v7X0srTF25AFata5g2ltRaEkQdAX7jdCygdsw5SAxk2cdKd5815pyCaCZH29xfMt0zFHdCXZLgkVBZieGbM42eSpb4MHQ5mBxulPt+Wqd4uTg4I84YiyLJ6W+fw554gavU7IQXELUL5bGkK0yvMd1h9I2iTrHvJZCyjU/2TS9DJeV2LdbEdE/Sx9aOjMiwFhCPtxbPiMywsbRP/tkibo7oEBp/FxrviJm2QAS/tiK8zmPnesxJw2c1TcDsj8Ce/0tNYmLbXI5byBeI5PM8scAo3I0wLPh6lpIixMMyumtI+zUNGLU70Y5CGiTnnicbI1BN2oRiqRMC9jWljIcuQYrgIuqX9sQ5bT1O7QqiByEtqR7MRXH6Ll2MdSuyW5mi6r8iY1MP3ey674GDW54YM9JndqR0lmM9I7QMKSj7Lyk/MoUU5mdFiI7Whnh0MB8tUB3Nqsg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR03MB6192.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(56012099006)(11063799006)(10067099003)(18002099003)(55112099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QlNcN8hlc5/CYPQry4bI4rp4M3KmjcjQKXfaQI3JNO4enZkAgVc1qfZGI81/?=
 =?us-ascii?Q?bvr/DouW5rBikcFqFSxQuqVV/dE9ODV5LSHgHH1wqNVtjM50wVUES1794bGt?=
 =?us-ascii?Q?Jq+1oMe046LwKRkakqp3DlUqYtMCZIzItFu4lPMKzVBtiHaDZVmkezVmkfHo?=
 =?us-ascii?Q?x6ju1kHzryAHJZn5RNGIJCXkGOXZZNpkz95Yd1gtx88pJXXQ4qNoYlSmys2k?=
 =?us-ascii?Q?rDe6quPpDUdHGmsHrYHt6gRGXd4vIcs+ajgnisikR4kufUdJqnDYtSzL0Ef0?=
 =?us-ascii?Q?c1asrMCMDB3mWBw0S4wxAy3izNrlhmr8CSZHxba14YnI2LlvK/xnkDXqgBqd?=
 =?us-ascii?Q?s32MSP4jbQuzCgHdpKR1r3yf24juX+c2q/llRidMDrxspapmapg5HB2uww7z?=
 =?us-ascii?Q?VTeXS5VfJYnPXXxZ3o9tWR2uKig1HQM6Cc9BzmwSlmVy/KBFwoqaeLfGaiCB?=
 =?us-ascii?Q?y2ZuZiHo/awogxP2BUwnlzs/123lsmwMy6VwXpJR/NAfmTOFvpd9se2rJJcM?=
 =?us-ascii?Q?ILqnLvhTjfnusHUFoFpeJgoDidQqIcWqSgcDpRVdTOnvMntxJaekYfZ1TgiH?=
 =?us-ascii?Q?8/sWqSQvZjoMZIaP21RQRpwwLaUKhhACeEM3ArlJFe2csl6f8Jgo9wuqkWxX?=
 =?us-ascii?Q?pXh/xZT7fWopnRXRCyPaypjhVQdfIFOjEsNUPoc36AeNZytkU/lzsBR8Rsvo?=
 =?us-ascii?Q?SBt1CF4xnJllWFp8WW0K3ni28pMctc7kRCqIrFbBRUHiDp5OKF7fwTvrULPE?=
 =?us-ascii?Q?JiuFlznnKV6nGpI7eypc6Nlv1LQCDE0TG3ec1I4/2s/N5dKykDCniKMJAo/E?=
 =?us-ascii?Q?tPYa45n2GX4J18N/Qk59VqNH9uZm9zz+G75OhgDguReUDHrVifBw+67HJBpe?=
 =?us-ascii?Q?2gWMnGvrDB6vzsohAoUbAQjNzstVl8YKYjLbH0NbpBg9qDx86MoTCRdv1lSw?=
 =?us-ascii?Q?zg6mFcI7b1pgtR+eZvzCpY+/caDwG9D9wYNk/wgM0x+jCj74m3LDEyAVe28l?=
 =?us-ascii?Q?OtC61FUbn6bakRg7p1bJlOBqPvWiJETdYf261/KEFfV5qk+PhUvvawKQBGGd?=
 =?us-ascii?Q?w1P9C5GaqI3tG0u6HxZ3Zr+1/G+WYgFtndnGUvCwUl6bhSjcW1vXvMWhU+sD?=
 =?us-ascii?Q?sjF+79zHZOcelSMgDC4FWRNe+qgLfc42h5mzhZCI76U6N5n+m1VVlRGWdSmE?=
 =?us-ascii?Q?Ylwvw8omC9ID0IemhgML8iaTmnMH8v0dOdGoQu5qblUpkqQ9o0tswjPRd1v4?=
 =?us-ascii?Q?7FrVajdcwterdRThh7bgKJBZB2bQCAs9xWG2Y2139o/uRSVMxHvU7cjuxn4O?=
 =?us-ascii?Q?9GFyx0jqT0pH4VZPOELPiF8oAHEE2AM0a9qJ2/XjqY6kNU/N8bOuT4oAV7gE?=
 =?us-ascii?Q?ngSeuxBzykDrEnOjgdIc6cHgNVozDmGBQvukcb1ZUb1Nex11dJADoIej4FQU?=
 =?us-ascii?Q?9IPECRmwoIiVhleGJKYqOnFSMlv84czZhO+1E9hCrC8x+eXxzhqqm+HZgBr6?=
 =?us-ascii?Q?M0RBjtwAgLENjQVwbkWdBooVBZG1Djc2JsigHFjxcRveFGIfk2GnOF7qmnDe?=
 =?us-ascii?Q?VTTU4wWM0z23okRKKZUC5uqLFD3BriJ7C7EjWsKbNK5hbnOjgBTarlNHbs4V?=
 =?us-ascii?Q?QjZY8BF9XR29csImYCc0Rw7Zq35Il4YoVTurl2xWDyqeCwOfFuByqe0OjPo9?=
 =?us-ascii?Q?BC3Wnu0lOqee/BrukKzMWTiqiRUgHBeZwp4RvQqDsOyISF4Jdr7TPvcdXoI7?=
 =?us-ascii?Q?7+4vrX4TqA=3D=3D?=
X-OriginatorOrg: altera.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ff602e7-a8bd-452a-9d2d-08def39caf6b
X-MS-Exchange-CrossTenant-AuthSource: DM4PR03MB6192.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 09:25:41.9650
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fbd72e03-d4a5-4110-adce-614d51f2077a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DVaaOzn18+YVXCtrF+IUSkXGC2A99U3vzT/Q8AwWf00shbBf4Mz5W+quKawrtVYqPavR1fHMwlldldmMfRLJ+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR03MB5285

From: "Chiam, Evon" <evon.chiam@altera.com>

Add the Agilex72 clock manager node and input reference clocks, and
wire the UART clocks through the clock manager instead of a fixed
clock. Set the SoCDK board-specific input clock frequencies.

Signed-off-by: Chiam, Evon <evon.chiam@altera.com>
---
 .../boot/dts/altera/socfpga_agilex72.dtsi     | 46 +++++++++++++++++--
 .../dts/altera/socfpga_agilex72_socdk.dts     | 12 +++++
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
index 354c775f577b..dfc0cfce3d8c 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex72.dtsi
@@ -5,6 +5,7 @@
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/altr,agilex72-clkmgr.h>
 
 / {
 	compatible = "altr,socfpga-agilex72";
@@ -64,11 +65,38 @@ cpu3: cpu@300 {
 		};
 	};
 
+	/* Clock tree 5 main sources */
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
+		};
+
+		sdm_xspi_clk: sdm-xspi-clk {
+			#clock-cells = <0>;
+			compatible = "fixed-clock";
+			clock-frequency = <200000000>;
 		};
 	};
 
@@ -133,13 +161,23 @@ ocram: sram@0 {
 			#size-cells = <1>;
 		};
 
+		clkmgr: clock-controller@915c000 {
+			compatible = "altr,agilex72-clkmgr";
+			reg = <0x915c000 0x1000>,
+			      <0x915e000 0x1000>,
+			      <0x915f000 0x1000>,
+			      <0x9160000 0x1000>;
+			reg-names = "clkmgr", "gppll0", "gppll1", "gppll2";
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
 
@@ -149,7 +187,7 @@ uart1: serial@9039000 {
 			interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;
 			reg-shift = <2>;
 			reg-io-width = <4>;
-			clocks = <&uart_clk>;
+			clocks = <&clkmgr AGILEX72_LSP_SP_CLK>;
 			status = "disabled";
 		};
 	};
diff --git a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts b/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
index 0959850cff66..697e694db603 100644
--- a/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
+++ b/arch/arm64/boot/dts/altera/socfpga_agilex72_socdk.dts
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

