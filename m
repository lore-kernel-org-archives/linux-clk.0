Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013054.outbound.protection.outlook.com [40.107.162.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D685D37B014;
	Sat,  9 May 2026 02:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778295001; cv=fail; b=R3TisN3l5QzOQwuZ+LXxDNQy6Np4bPL3GpvuzcATo+sUjB6VrajJ6izXWcbyPjAwL+WAJ1QOIcFSpDJz3UKSJNHCkgtraKT3mSprPWMtD/uuBz1cRIWWqC1XOopkT69sBM5Ym7UYIbA5zrzyd7EHhry3Mro7Oa98BK3zsF3FajE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778295001; c=relaxed/simple;
	bh=Zt9yMFpy9SZz5bbWQl+oZiIFy1b1mPAAbuVANX0eYQI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PHC6PvMxqRd93w1bjScAnS6q2eAWBasiY6siAYVYbQ7ZISGVsVq1PgtQUhSXYOvQYekUCtmmmm40JhlYpd8//mCuq98oBDB8qeOPGGCCFiENzxeFxq6ll1YvyYO1P5GeG3JJYgXR1w9wjXNBLSUKJ6DYjI9kxnkclnSn+crugbc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=oJud5EBr; arc=fail smtp.client-ip=40.107.162.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="oJud5EBr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HdI4G7nY2r9xOx8yze9Q4Y4SOPQ+uHzJGTGA9kCBsgV7LUkKk3Yul17DemQ/lRg+bY1gQ3NKin/M+W4Zb7+okLGfhs9Q2CyD897e2T92u0E9q9IAVWcJDDA/Hbcjgh9P9FWnFjNr4s38WqGP7g1/wohsOob5duxp0XvqIly2Cior/BiAYirRXBdnK6BH+rbJOsIo2Bqv4GiPxOyOtzFjUvApWO/4WzTGYN9UTCDpLx55fTbjrDBm60sweloK7BYYKwZmFz5PF3ycuKtsmt/TArZ7aOanKTFZ3zGKVcnRlVAcmjdgmppGzlJr4S4aBmfHa9IPGMBLzYSFCoKETJB4eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjESWcIR7a5wcSGUdsspakdEMtM2iERd8m/VoBNvxpk=;
 b=ZuVt+TvWYHDO2JZf65OENRf9rRV6tZDIn8T/A0Qby+AwU3q4R617nAOVEQN9dJSulYCYtMTBIYmR9HQ1Rw8JFIVcXmZUD/Qgv//8rfcTjec6XITDzq1l1JhjJIg8eKmy9sLLMNuBCLuEJ1FRH6oMxA/F1yLmuCllIbpHIu2XZQWO5xFcpT4tB7EkVlISgUkmdbkKmw49xCe2XCGe8nJW5sQYEVqBxeqQJUOAhaSQkiIaoFofVcZP8e9q2ZqMLTgtbQZh6hfMby0E2ujg9RRo10t4KkZZZJ/YVcXwZbpegwx0yeu+dxx2Ta4az0ToU1d6qj5JF4Zfa68ZVv7I2N4F0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjESWcIR7a5wcSGUdsspakdEMtM2iERd8m/VoBNvxpk=;
 b=oJud5EBr0U/hYoHmcPNoxzAJjvV3ZXBw1B4+lJPbUirxE2UIRc6aAsTxaf6LRGYxA2tgBiM25/RB0nQ8iBNZzj5m9c8m7dZdqcHqMGZwC/oYRs3IZnNKNoPEOtxloe1V5OklPCgXJ8eOabOMXrRVcSmCrOPqozYEfbfMo+J597VgDvpar404qwXD8ANV3idm+P0HeWC3DsboVXxjb51SDWqwbZLp7rWeDoOKqrUvOl4YvKstawBeGhpR0e+cv27fLqx0bijihEegFL8zBtaqu8qMyP4Fax4HGKnx0KakS7b+n09cX8A88wKIrJnBF3PTe25fh9zyV0Yp2YZLHHsYRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB11989.eurprd04.prod.outlook.com (2603:10a6:800:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 02:49:57 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Sat, 9 May 2026
 02:49:57 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Frank.Li@nxp.com,
	s.hauer@pengutronix.de,
	festevam@gmail.com,
	mturquette@baylibre.com,
	sboyd@kernel.org
Cc: kernel@pengutronix.de,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 4/5] arm64: dts: freescale: imx952-evk: Add IMX-AUD-IO board support
Date: Sat,  9 May 2026 11:48:45 +0900
Message-ID: <20260509024846.2094049-5-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260509024846.2094049-1-chancel.liu@nxp.com>
References: <20260509024846.2094049-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0106.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:3::21) To AM9PR04MB8353.eurprd04.prod.outlook.com
 (2603:10a6:20b:3ef::22)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8353:EE_|VI0PR04MB11989:EE_
X-MS-Office365-Filtering-Correlation-Id: 442b345c-41e1-4395-a3bc-08dead75a7b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|18002099003|22082099003|38350700014|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	1xC5b3mMGK5OjDq5gjtdwoozPvMu1yo3e0yUl/OFh2AhWwaksUD3J3+X9o5gLZUPt3NEN4P1OaSsIqp2yUI2gK3KvJ9TX1bqSl22jlQ2cYSEpdkd3dJKpM/JVFf/PQSHEEhtywLj+clD3ufJXI+ca6onBROqMpv6I+3U76lA7NNWsz/R1mExVauYmNbLLAR/cSQ60gHqxXVNlJ99jB3hrmcXj8VezGJR1KT6ftMV0v+ClM9lEvFkkqMTav6raNABiYFjieHv3A6RcVCN2y2zr0S9bgzdyRqgK1Hs68kd2K/uIsf/roGvxPYHMAlPqfv8SvM1h8qJQGDtjYY5+agbNhRqm+TV4VSI+H7gP5yXsDICIE34IpxnIqqUlJ0FDiFNhnnhDDxUJo35emFAfzSkoxYAhjqzptoLjVRBqyNc/JNlNOBtz21t4gglUPyPtoosPjt6CEkFt4gwXD22wMbUHuATbeP4OvUpRSbrlIiWTa29w9beol8T5WwQ2GPaSA63Vu7s4+FjhxF+kXH1Glpr+ftYINiMTpaz6AVJ26S2+vFG02whQ82nt+SJOWkHdWYgEpxXr0hHnlM1Pc2hgxkpPC0h10MN8ksWb+1g2ggMpFHzWhz7Ln8DHAmERQfhEo0T+u/x0FNbGuqKX/RwSjzPyIaC9/K6i4wOCwReFQHgsQ9rXasB+V8pEF+jF+D11zb14emt9SLnRJoqYnbAszh7Q5rRv8aXZLJ9nooxO3ROQXhZe60As1HHZwsdvJNDiZ13
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8vZzVZnNx8MdQ4M8SKnBRkq2fsos7ecDXfLcOvkY9rHLYPhm8BtTvHCxvFw6?=
 =?us-ascii?Q?g4RxcL8e8M5WYvZQC5Kv/ji7RlKAxPycCvx2N+4XcccKfkO4jG8225JLU6Eq?=
 =?us-ascii?Q?6ozGOxAeWuDqdf7iqebYZdT0WFm+NX60kWF49D803BT7lsWM4ESITZ+MENZE?=
 =?us-ascii?Q?KMMoSKlrBKRISPZEVBmOjuf6L9de999LBgCwhA7BIufNOmadmQs8u7gLRuFR?=
 =?us-ascii?Q?YAU6hq0QMkYxP+NOljs0iu0SBkiGMrFQdXbhRh/nkzo3x12tDY2FoLHOPLKe?=
 =?us-ascii?Q?15l7pu+N/KbBnMzS2d5XB6HsjzMwKi5/nJarN85cXOMx5uUDGJVOD/6XRR3n?=
 =?us-ascii?Q?bTEKyrKn9yqQSazqx7sa8kSQ3HlgP1W6cOGxFUj3q/nZsoMUYdc6JtC4x+SZ?=
 =?us-ascii?Q?RcesGMaKLy8iq/Mcq+zGvD5aDTQRrXqEuZFIZYucRBwezkExELN3ajuECtQc?=
 =?us-ascii?Q?797hMmBK857x3VJjGqDd7MsYeVe0NyQv/qIcWVVeDsElaCJuv/ClBwKESKKe?=
 =?us-ascii?Q?rl3fgqV/cuLg7ng2jYoeDjRh9nfE5BCZ6u/Jr96HBIG70XbXjwS2GasK0l95?=
 =?us-ascii?Q?XxL8nOmZbo94Ogx2SSCPIJT+P6N69tduwo/+3UE7wSWmAPiHByW/26BAYkjP?=
 =?us-ascii?Q?P5UisD8DaAR6B4e3Cnge2qml7x+z0lFMOpa0C6ZgX5I1Vi+keOP7uhAT/LwX?=
 =?us-ascii?Q?ASaR/3ROG/UruZeHOI8IwDXdFb4LNDAwip8xT4M5HP/B0JHUMId06IQtAMQO?=
 =?us-ascii?Q?l5kHG+k1FZ/2ECZWzorlNMu9btMkyOqVwEesi2Yb0xifqgSkEXN+QWJF/n6X?=
 =?us-ascii?Q?nTZcan0DZF1cYt4iWc54UnM1eHalrFBbcgc+U3ckLk6NCyAy/sf/HZIRIpN0?=
 =?us-ascii?Q?p7e5f+YqiwBP07e2kXtBRWG4FSkFjvMmPsQy6fLCzoFyFwbazKSRBrfmJ39H?=
 =?us-ascii?Q?f+AJyb0mbNjyqsNBdF/He+YBSOngp/Q7x7PF+Y6GqgdEes8PBVhiBZVTwjvY?=
 =?us-ascii?Q?XuJ4AtjM5bw9y0tmTL3SSwP/pxkveV8EUaPISOfvAEROzl/k8f7pewnlWe91?=
 =?us-ascii?Q?SzjAbc+RQtuqT3rGhGecRzhmB8fDhtCOLRjy4scGOuX0vQroi3t6Tn8DO+vc?=
 =?us-ascii?Q?uK36r7i1hCFd21TXJRbWTVDI3eO4LlUyDJHNi4qvCBMvDiwpmmQ2NIBYG5Fg?=
 =?us-ascii?Q?EEoo9LvZ0NNGeeoTpvDgqXue2I6uheMjsyygkBUDr4miIY7XtD+ZDhHyJ945?=
 =?us-ascii?Q?IxySCyjCgcWJpeT+sFWNjv3sFUH7M4AiE83gVyyJBDs9xQSmbN9mN8PtDr8o?=
 =?us-ascii?Q?R9UBYRstIb4eR1zyhHK3whQDFliu6KMEPrQij5bhsFw7nlNYm/2t+CYiVRXJ?=
 =?us-ascii?Q?KmAVj8HDlv0aMzuHl0LBXVz4SWuOCCUSgpEnHUZTjCAM9xhI2KJDs8y3KM1K?=
 =?us-ascii?Q?jtfm8hpzDnLTpG16bSXZTl44Fl6kC9fH1VH2x1Yr0E3phxwJWfvF7ZIC5v2l?=
 =?us-ascii?Q?C970nF/yIn9uinDNbA+tLTKMpzMseGwnxw2Aiq0IkAxmAKgA3Bc+ntgPqpbp?=
 =?us-ascii?Q?hl4y0duJxFWFH/7XNdYxuY1usmbRlWEg+Vpk6Wn9g8albi1GoKE0+G4kIULL?=
 =?us-ascii?Q?ss0t6voXjOUCxEktGwVSGbXKCYrpa6NZSCHWmrvtIvVViF4sfJjJS2Ii8vj+?=
 =?us-ascii?Q?Rrf3LPHAZSIMkLYIMYbgm1sC4ElzGNYoVl+ZpLN0Gm98NqSAo+f+LX5QFbub?=
 =?us-ascii?Q?pqG016Zc/w=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 442b345c-41e1-4395-a3bc-08dead75a7b8
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 02:49:57.1108
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 16CSqUUyUyAxtMFIypTgz7b2ythPkreE8nrQY9BI/T3JflKRm10oQ9Cr5VK0s1dY1wsmSg/bBTNL6v6KXW5+Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11989

IMX-AUD-IO is a daughter board which can be connected to i.MX952 EVK
through a physical connector. This connector is described as a
fsl,io-connector connector to expose a constrained subset of GPIO and
clock resources to daughter board using fixed electrical wiring.

Also add required regulator, sound CPU DAI and I2C bus configuration to
support IMX-AUD-IO on this base board.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/imx952-evk.dts | 68 +++++++++++++++++++-
 1 file changed, 66 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx952-evk.dts b/arch/arm64/boot/dts/freescale/imx952-evk.dts
index 62d1c1c7c501..bb1d8d5f5fcf 100644
--- a/arch/arm64/boot/dts/freescale/imx952-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx952-evk.dts
@@ -43,6 +43,17 @@ aliases {
 		spi6 = &lpspi7;
 	};
 
+	aud_io_conn: aud-io-connector {
+		compatible = "fsl,io-connector";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &pcal6416 8 1>;
+		gpio-map-mask = <0xff 0x0>;
+		gpio-map-pass-thru = <0x0 0x1>;
+		#clock-cells = <1>;
+		clock-map = <0 &scmi_clk IMX952_CLK_SAI2>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -114,13 +125,29 @@ reg_1p8v: regulator-1p8v {
 		regulator-name = "+V1.8_SW";
 	};
 
-	reg_vref_1v8: regulator-adc-vref {
+	aud_io_reg_1v8: reg_vref_1v8: regulator-adc-vref {
 		compatible = "regulator-fixed";
 		regulator-name = "vref_1v8";
 		regulator-min-microvolt = <1800000>;
 		regulator-max-microvolt = <1800000>;
 	};
 
+	aud_io_reg_3v3: regulator-aud-io-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&pcal6416 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aud_io_reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-5v";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
 	reg_audio_pwr: regulator-audio-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-pwr";
@@ -323,7 +350,7 @@ i2c4_pcal6408: gpio@21 {
 	};
 };
 
-&lpi2c6 {
+aud_io_i2c: &lpi2c6 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
@@ -468,6 +495,27 @@ &sai1 {
 	status = "okay";
 };
 
+aud_io_cpu: &sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	clocks = <&scmi_clk IMX952_CLK_BUSNETCMIX>, <&clk_dummy>,
+		 <&scmi_clk IMX952_CLK_SAI2>, <&clk_dummy>,
+		 <&clk_dummy>, <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX952_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX952_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX952_CLK_SAI2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX952_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-asynchronous;
+};
+
 &sai3 {
 	assigned-clocks = <&scmi_clk IMX952_CLK_AUDIOPLL1_VCO>,
 			  <&scmi_clk IMX952_CLK_AUDIOPLL2_VCO>,
@@ -688,6 +736,22 @@ IMX952_PAD_SAI1_TXD0__AONMIX_TOP_GPIO1_IO_13		0x51e
 		>;
 	};
 
+	pinctrl_sai2: sai2grp {
+		fsl,pins = <
+			IMX952_PAD_ENET2_MDIO__NETCMIX_TOP_SAI2_RX_BCLK		0x31e
+			IMX952_PAD_ENET2_MDC__NETCMIX_TOP_SAI2_RX_SYNC		0x31e
+			IMX952_PAD_ENET2_TD3__NETCMIX_TOP_SAI2_RX_DATA_0	0x31e
+			IMX952_PAD_ENET2_TD2__NETCMIX_TOP_SAI2_RX_DATA_1	0x31e
+			IMX952_PAD_ENET2_TXC__NETCMIX_TOP_SAI2_TX_BCLK		0x31e
+			IMX952_PAD_ENET2_TX_CTL__NETCMIX_TOP_SAI2_TX_SYNC	0x31e
+			IMX952_PAD_ENET2_RX_CTL__NETCMIX_TOP_SAI2_TX_DATA_0	0x31e
+			IMX952_PAD_ENET2_RXC__NETCMIX_TOP_SAI2_TX_DATA_1	0x31e
+			IMX952_PAD_ENET2_RD0__NETCMIX_TOP_SAI2_TX_DATA_2	0x31e
+			IMX952_PAD_ENET2_RD1__NETCMIX_TOP_SAI2_TX_DATA_3	0x31e
+			IMX952_PAD_ENET2_RD2__NETCMIX_TOP_SAI2_MCLK		0x31e
+		>;
+	};
+
 	pinctrl_sai3: sai3grp {
 		fsl,pins = <
 			IMX952_PAD_GPIO_IO17__WAKEUPMIX_TOP_SAI3_MCLK			0x31e
-- 
2.50.1

