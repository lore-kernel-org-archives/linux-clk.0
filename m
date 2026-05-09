Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011054.outbound.protection.outlook.com [40.107.130.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C5837B407;
	Sat,  9 May 2026 02:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778294998; cv=fail; b=IPvcba1LkaaTgY47zeoRu0PxkBCfSEXY8XAhI4w7BHZy2AXy0VTdb/A9qvfbW1ZwkIWBLHtCqTSH2Oyc6QhYPMU3debm+gryup2DKm11z1N5YO+Fjgey2U5REYuQ4hdHCG6dw+ll5V/PTGA/9/AlshPbkcBnHIUOMLS5zjjNrL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778294998; c=relaxed/simple;
	bh=mTBxCP7stTyvDFpFDgcD9dPo0iW3sVX6WK1yfZROVeg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CV0YcX1IJ6IyO/HctDXyunEU7GbXx2UE7OIvyMnzzgptDJQ8bCn+B43JHKnkV/6ePE1wtZwNUzMHNiSMN+4XGiPlxPPMOCxBWHWmScjeuaiWNCLgyF6O1KDQXJ7ukMLMVTjxiyCGepm4v+IEOy2PNR7DzyLR+HW2yfk3BfctGXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=n/s0UQVj; arc=fail smtp.client-ip=40.107.130.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="n/s0UQVj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eo9oRyKBA6/iqa0WKuoVeJ3Hxki5DKa0TW8br9X/WmyRoFFnRpmGWD3mvzfqUEcp/0GcuNIRteDb48Dmi4YQnj8pW6lGPEbpBY9Osi82FGYxFPEMMkoVLeIhrzFjMhCcbkfiIHDwygayh3WWN9n26zNo9ADmgvhaDRX/LRW/nm+fw6q81YOcizAfNmgv45YoGMpO2/zetTosVhf39F2Q0WYnMgFgB02qbCx6k5AqBW2LkeGin6E1OIFVAZAWcoJzikGin0YP8Pwrc4O0W7aMoEsdaGTIGWbz8aErHPbIFxPvqMK4kAv37JpckKpd1K94guJyh1wy3hRHXoh0vo62QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i0AqdTeK9hH6+7lU3+mCSDqH2nnMlIshWgV5L0wBxUk=;
 b=e4VJTG8cCty3dC0Tbnh3KpU7kJ55yUjr6FhmucCZz+W/fJrwcsJuw8BA1G2Tr9aU7iF2BeLd62SbUsXWV/CNseu5IboA1HvRSf6s67FS+F/ZMfSxckfKiTtXfYsiVnRrcz+J7+Kf8BPm/6NZ59d+JfPSTSvs8X5v82yj4IASL/okD/nAEKB50S2lt+eWqy39zBJZPr6uyLgnrPj2MLhrAvOraEd0rl2I9DJr5m3QJBHfEAoGRNfA8UxK9J5BGGSsB4Km6svEFOStZpqLpHf1o9BATLPHTlxvmsfsAg4XFctbbtS5Qm2xogmqUHvO2SUXRGAoYzZ+V4I8UZNK4l4b+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i0AqdTeK9hH6+7lU3+mCSDqH2nnMlIshWgV5L0wBxUk=;
 b=n/s0UQVjPgotUQZMMn/tR8WRU24+pCduHLjAWVM+xLXtAP9/FljOIG/H3Ug152M9tbEwDgcwErDBgxIIoTOlAxtroJRCudr9anDpi6PS34EJlwJ/riAs+h3yjBHeB1rLQh9SV+ahE+q0NJ54mtZUAHNHAFynlyfcTMe346SIPPb7bcHHfqXJQxSod/kZHeSFGgB7l8MZ11QoYaykE2osDbLGu8lQXsHr4h/SRZfprLmhJRC2aqfm+I+gpFCvlZv8u2xT7lR62U1i9g3xeTeO7BOVTVlBwcTn4SM9R49mkTV6GwynqNRlrADnugVyOb0TSv3Y80yJWBqTej6WWmZd2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB11989.eurprd04.prod.outlook.com (2603:10a6:800:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 02:49:52 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Sat, 9 May 2026
 02:49:52 +0000
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
Subject: [PATCH 3/5] arm64: dts: freescale: imx95-19x19-evk: Add IMX-AUD-IO board support
Date: Sat,  9 May 2026 11:48:44 +0900
Message-ID: <20260509024846.2094049-4-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 7300720a-245a-4456-ba94-08dead75a4f5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|18002099003|22082099003|38350700014|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	ViMetq4Qq5yiM8wMYKKHzZ0xrbJleAWtS8c9uVenxlyY3iToKEuDlspHQWTxIeObWqskxCGv/G9Jc2GJbd/t0v1quMqiGA38JzvrEkLYQ7h8GhBWm1obrNNx35F3z0UpMlQrF09/ho6cz+yypoQieXAvhEAmCOHLTM6SPd1UwXwc7T5eREI+SFWxEpBTwVbc7wJQAVPu4IpvmtlhCZqhE5SF8/Fbr9TGQnrR06PzlO7Af2GAt57a7qZosXbAhZSo5vGYK0iQgDkcbL1A2i+P5fnFmK4ubfIgHNmfbcvzCH+EJyFKsQvltQMZIOQLxderi+x7ULsFM6IrtVxlw/WpMUB32QuL2cIPV6oaiJii44bFuPKu/nMzS4/gNE6Uclk1vDBymVcPKuqu5tRT/DpFx2I1eprMaU9piPKWrBqDbBZfPeLD260C/Lrcp9aOyaqkftZAayh5fFISGuc2LAG3d42jvTZCjOL3ZDf+AwAUupYSN/MDyw0hQ6tGzU/Uhtx5LxvkDXGYzKbS+qJf4g+M4Gd0/q2DwtYsJdJ5SrjeUKaQDZUGf7IEDQQxvao2kZWV3K2SJbeEj7IcjryLkwW8ZcdoCEATiNWBSEs4xU5bSh1zMCM7meb1b2r1ZVE7lpC+IsBz7EPHbeyDIsJ+yZWNQTn7ux9RB/YBf0U1SKqYOWzVasFfrNarPft9K8avYm9WjXzCPtLXd3I1vz3y1pVdnMH2gvwsOsXq7a1fynARtGc3aCYCHZRZuzjQ26VTlzz1
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(18002099003)(22082099003)(38350700014)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?j3ei69n/ziybtxOPJMFFY2HlrS8N4by+8CwILOYhuqKqTw8j9lVou99D1Fmk?=
 =?us-ascii?Q?ZoR6XBiBR7Q8W1X9W3NvCjAcvLEEcCzA/woXBd0QlZSbdtqOeLzfTPAO8Yp2?=
 =?us-ascii?Q?zBDVm80A/9IQU2t/492/7gxxhEh+jT4e7fKhXvtQzho1HqSfpiJRCdMd3Mq7?=
 =?us-ascii?Q?AHN/PNtvi1+55yOGIpixhKegnzorhUw/pk80S2KSRbSEA7IYF2Q2GLfS06PX?=
 =?us-ascii?Q?VF4W2OGmOErtupnb7xG4Mt486w/ayKzg72J41lTQrJylBw7vRsOMYxBUsJxb?=
 =?us-ascii?Q?Nel1z8OFdvxJwpPVr8tIHFJkItU5nAWwFaDW3eYeC9hU5Mw68MizZhtHJyXc?=
 =?us-ascii?Q?zoB2C/wKexMC8fgozbu7swO+TMP6xHPGIm2vLlqQ8EOzSCXJhBvuzQnGLht6?=
 =?us-ascii?Q?I77IqadeyzakecqMTbsZP3KPxC0AEzx7Ho/FhBnNrP73DrNxl+chPln5/YA2?=
 =?us-ascii?Q?SLAB4RTsGDcx6IvYg0A3p3WoPGfJTFu1tbG4JhvMqsb1fBcZivMrsEgj058J?=
 =?us-ascii?Q?GbF13tCrq/pdhJmxk+qj1OMZ+/oRkk9gnbNanoLItgDyg96Yg0igCrQPAI+j?=
 =?us-ascii?Q?9E6KJGCiTQ7l4gWJGVG9oN490+ix8Dj8WDMcJ3aimH4JbldYTSRat8BkkyX8?=
 =?us-ascii?Q?jVuksjKLyLqIyQuKGkwm9LjHea9iw0o7NHpqToJzZcBCNfuOAlTDyaBSVX3D?=
 =?us-ascii?Q?5oCYa2NodW8ARA4KG0dt6A0ISyoWM76WV9Z3+R4Q4OIh1hb2/Y7+n8hekFFI?=
 =?us-ascii?Q?nDWYBu34U50CF+DcN+R2aAZMODFGAmR7d5WyIeix1SPyXpwcGOvGyYRm7TVo?=
 =?us-ascii?Q?FwbGU90XBR04BhLc7km5BpsboYih2PM6nJXYl1H0VzmYALpMxjUIieJhYb/u?=
 =?us-ascii?Q?DtnRDKPnLEjUK+oW677XCFnE3+uB18kyYKvtBF/KOrgdsBI6BA0dc9/jYcEu?=
 =?us-ascii?Q?Gl4f2QNWS3Pp/r9Yso3r/9RS4di60kwccszoA0fBCkSuEXz7exnrybs3fIjj?=
 =?us-ascii?Q?lS0kXIsmY9OmLVMpw4jasMF5CqOyJtamy3aWdEgxj1kkOJ9p6YbkvdxWsTka?=
 =?us-ascii?Q?RT+KcUUJldN1NzdfTyvd0rYj9vdRZJq8ZDlGIVvRyCZB8Xgw0HhEsIFJE/Rq?=
 =?us-ascii?Q?NvT4BGqpDXaJrqDJTbi9ckY3A+fEqANnhCL1RgccQQauFqrdKJLXERgqMljP?=
 =?us-ascii?Q?L88X8g5b92UY6nLwQVSJ9NJqKJXq+KDFkG47ssu9WtmJGNjbOH0Deow4SsTW?=
 =?us-ascii?Q?sXxfUqTmIHZgVPou2H0LD75vzxQQwfUoW+YvQRb8jtzG7Rk0Mos8NHt/2j+D?=
 =?us-ascii?Q?uX7udTcgaUbZHb2oAAidzniB/MccPJCX3qteCk9EkWPUpuLnKZ9m2w+Aw08l?=
 =?us-ascii?Q?z+u05XCw+anBNBEsrz8nYjDjBk8mR6+DgNGAsUBzdDc9wA7blp9r258YVigN?=
 =?us-ascii?Q?s0RIfhTmm2ushcM6csbMOc4wfZQuQ0l18rtgCfwU49Onrn5YK/P8dq/OxJF3?=
 =?us-ascii?Q?r/EL3+O2TXzkosMMsjBRIG5+AaBanbETnKLuMHia2gHQGCzbRpQdktImA//v?=
 =?us-ascii?Q?f2NTiORuNsEHx9VgOHoJ7lY9XN8lJ1sQjFGoPf8SRW96xmbtJeP7ghbsCqOC?=
 =?us-ascii?Q?qI7qMWHpowr/SVw4oKoqoPHDjAFF/6gNVOvBtKZmOwLWjiEUU4h6w2WT1YD8?=
 =?us-ascii?Q?zwsNhHwWGedtKhLtvNaUUyADl+5TNGNLNiwdUzv5M/rX9EBMZWf6giutZjh5?=
 =?us-ascii?Q?ho3CoPTErg=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7300720a-245a-4456-ba94-08dead75a4f5
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 02:49:52.4447
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rhxyk6sKk3i1JndjkfBwbzwE/h+c0h5wuohjdaPiVt/nQ17epX8cT4iTXev2ZZYWN1WGCFwL9nqByIG8tUtb3g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11989

IMX-AUD-IO is a daughter board which can be connected to i.MX95 19x19
EVK through a physical connector. This connector is described as a
fsl,io-connector connector to expose a constrained subset of GPIO and
clock resources to daughter board using fixed electrical wiring.

Also add required regulator, sound CPU DAI and I2C bus configuration to
support IMX-AUD-IO on this base board.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../boot/dts/freescale/imx95-19x19-evk.dts    | 53 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
index 041fd838fabb..f9b53df85396 100644
--- a/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
+++ b/arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts
@@ -43,6 +43,17 @@ aliases {
 		serial4 = &lpuart5;
 	};
 
+	aud_io_conn: aud-io-connector {
+		compatible = "fsl,io-connector";
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-map = <0 0 &i2c6_pcal6416 8 1>;
+		gpio-map-mask = <0xff 0x0>;
+		gpio-map-pass-thru = <0x0 0x1>;
+		#clock-cells = <1>;
+		clock-map = <0 &scmi_clk IMX95_CLK_SAI2>;
+	};
+
 	bt_sco_codec: audio-codec-bt-sco {
 		#sound-dai-cells = <1>;
 		compatible = "linux,bt-sco";
@@ -94,7 +105,7 @@ flexcan2_phy: can-phy1 {
 		standby-gpios = <&i2c4_gpio_expander_21 3 GPIO_ACTIVE_LOW>;
 	};
 
-	reg_vref_1v8: regulator-1p8v {
+	aud_io_reg_1v8: reg_vref_1v8: regulator-1p8v {
 		compatible = "regulator-fixed";
 		regulator-max-microvolt = <1800000>;
 		regulator-min-microvolt = <1800000>;
@@ -108,6 +119,22 @@ reg_3p3v: regulator-3p3v {
 		regulator-name = "+V3.3_SW";
 	};
 
+	aud_io_reg_3v3: regulator-aud-io-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-3v3";
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		gpio = <&i2c6_pcal6416 11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+
+	aud_io_reg_5v: regulator-aud-io-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "aud-io-5v";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+	};
+
 	reg_audio_pwr: regulator-audio-pwr {
 		compatible = "regulator-fixed";
 		regulator-name = "audio-pwr";
@@ -382,7 +409,7 @@ i2c5_pcal6408: gpio@21 {
 	};
 };
 
-&lpi2c6 {
+aud_io_i2c: &lpi2c6 {
 	clock-frequency = <100000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&pinctrl_lpi2c6>;
@@ -588,6 +615,28 @@ &sai1 {
 	status = "okay";
 };
 
+aud_io_cpu: &sai2 {
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	clocks = <&scmi_clk IMX95_CLK_BUSNETCMIX>, <&dummy>,
+		 <&scmi_clk IMX95_CLK_SAI2>, <&dummy>,
+		 <&dummy>, <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+		 <&scmi_clk IMX95_CLK_AUDIOPLL2>;
+	clock-names = "bus", "mclk0", "mclk1", "mclk2", "mclk3", "pll8k", "pll11k";
+	assigned-clocks = <&scmi_clk IMX95_CLK_AUDIOPLL1_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2_VCO>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL1>,
+			  <&scmi_clk IMX95_CLK_AUDIOPLL2>,
+			  <&scmi_clk IMX95_CLK_SAI2>;
+	assigned-clock-parents = <0>, <0>, <0>, <0>,
+				 <&scmi_clk IMX95_CLK_AUDIOPLL1>;
+	assigned-clock-rates = <3932160000>, <3612672000>,
+			       <393216000>, <361267200>, <12288000>;
+	fsl,sai-mclk-direction-output;
+	fsl,sai-asynchronous;
+};
+
 &sai3 {
 	#sound-dai-cells = <0>;
 	pinctrl-names = "default";
-- 
2.50.1

