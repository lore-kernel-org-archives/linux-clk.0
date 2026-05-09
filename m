Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013017.outbound.protection.outlook.com [40.107.162.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A383237B40E;
	Sat,  9 May 2026 02:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778295006; cv=fail; b=ETizY9kD57uLIiv+nTJjIp8wmHdQLXcobKRQfNhUtjJs2aGfOgpX4RmBPrk0e+4QAr1Gk66mHQYNN0j/F6e70tNOAoAgCSTiYQW5MGl8tjgbs25cMidOpn2uzE/KXPBSsXMhJhyZV0ZcE6m0GUom3urBIApGxdp/5dnGqyRChBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778295006; c=relaxed/simple;
	bh=x/1OGuXby+zO9mb+S3MTkG6QzVqS30H1EBvYADPsHxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DW1W920MMbIYqTuFJ2ONIpC94SC6uSzOeT7DJ3B9qrCTCHNzvvbB7so6UJVBOLEOLFVWEe1asaMs4KluLqSrYP+J9Nr3DE1boP0d0BTx1fNF6tqDdemDqkC+s6VojXsxbDedKq1pUOEOP1A9rSONBbx09Tc/psIKKNr5m+5h/Og=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=FQTaSnVQ; arc=fail smtp.client-ip=40.107.162.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="FQTaSnVQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F0IHUUE/d5FhWGLEeTiWGh8XYGjW6RGOKxu25h17Xbrr7aQUkI8Yn1B8AOWaOUDKBfvs8BT4yU1S3hfAQpaOz9sveBqmTf0aaWa/+wOsG9bR7UrMQQbYDb9gxaS5HBim7C+eifEfVYdhZXsnFJX/Y/ywmnpwM1T5NJ2/CPbKgBMRB/C4LeF6lQ62QdDrvk2n3b6bbobDzxickOE7gYvOttGviZuAzG0EkKT+z4xzXO6TTWVSbmNX8RJuNwKdfw+eIpfMf8AxHowvRuZYpruzFN/9Y9U4c2AaiJvN+ygqJ0lTMNFD7p5Xwfr0AWWQAijv9CHwNQ9/jbxYhMEkQzGcQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0YmRl8AjGgOYhvtXyWeq2w5nNUKE01OkzVGHg09HmkE=;
 b=ImABa4TsuQLUk8TurX4NzjN+4QZIv+J3Je416jR4lUz4O0+cWRcltEWYuEmrnIoTLY69FdqWGJeVUPIFIxkg0bKvYiOPtf+5n4gYAIKAkmyFj2EGkzUGqDpKfZQjLKZCNIRlOJ4XzNymkbqGYvr8gIhgK+kP1vjKcyd4vpV4NV/iTEWT6SvYUgtoNucn3Y+mDUzNCs1C1WCKGwu3BfDncVQYWfdGAUynlYne6r6iv2i+YLOV0+ARPYPSwRWL9wkmBG9iv64OMMgb92aWqgr1RGPdCF49br4nnpmSvkK2qCnJhD1SV/1MNlWZ8lOlFJFctcwL/byrZypgw7H8zT+f3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0YmRl8AjGgOYhvtXyWeq2w5nNUKE01OkzVGHg09HmkE=;
 b=FQTaSnVQC1FzgnsaF0RbNskGk4F44VkwpLQ74/xcs6mrhgYG6T9T8Q4YpD6m3KMHTWXdVDGqg/PoOirOBN0wxcRtVtTOVf5NA9JImXfR4Ozdynb+r9DLrz1ESYeRWt7uvUodr7XaAW1qwRZS/gZLSe0d57loykox7+M3XKw40RJn99BFZIYky116+9uXFqkoWYQLog3IEUzrqc0Ov9kQadlLqy8GZlt9hslafK3BhWWy6HOusm4RxBy6YOLqhwJq38y6b5mJJy2Bw3TqZqemsuGKCVTgvhYv2bo9baOQu8d2zRcFAOeT6z9MpZ36oTiF1xmaziXjWNe3Q4RrfmEe1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com (2603:10a6:20b:3ef::22)
 by VI0PR04MB11989.eurprd04.prod.outlook.com (2603:10a6:800:31f::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.20; Sat, 9 May
 2026 02:50:01 +0000
Received: from AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc]) by AM9PR04MB8353.eurprd04.prod.outlook.com
 ([fe80::46ae:f774:f04c:a1bc%5]) with mapi id 15.20.9870.023; Sat, 9 May 2026
 02:50:01 +0000
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
Subject: [PATCH 5/5] arm64: dts: freescale: Add common DTS overlay for IMX-AUD-IO daughter board
Date: Sat,  9 May 2026 11:48:46 +0900
Message-ID: <20260509024846.2094049-6-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 613277a3-247d-4a86-2d57-08dead75aa84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|52116014|376014|7416014|1800799024|18002099003|22082099003|13003099007|38350700014|56012099003|3023799003;
X-Microsoft-Antispam-Message-Info:
	N1n01ubTkHNBZUM4sWkDL/Cr+Srrvxpk0guWt0vZPEtf00liMq/pIlb1EjvGCZQUUayf/f+E4NQ3W2fCThxv1yc6Uk/RA2ZYnzp1byKiu5JQ2hRkI5G4N9e03TWv8A+7Zt9yYifyg6IXkaknG0NbQPJf8Cj+sIia/7IQ1/8MqueX7TJCVhn0juk+rzhW0n2YK+5JST2jFUHJ1n9Xyg6foDyPW/vx5PA7K7zxMovblrR1Acy4pT3Xk3J3NnmOJidDdiEH9o3WKWGge2bzGICMB0q0eakENa0qcQ1pzzTptIqKSL5EFmhCCoay81Ik+3GQefU/GbWyDwAGLZXI1F/lngM3ZnhyyuYtCpkRENG2KRtHc9fNFFbvqN4kOU+gcZleKRG9VC6IH5JpbeFYtU1xgkyE7SlR8JBP1qExVzlkPPCmFhu82GMc+fM6m3ktSJ20TSYY4QRQAo/xJjmWxKorsTQiUV3fAM44ftIs9KdZikiSQfoexo8mXA8MbamRrAVP4mN6jnQCZjGUI+r+pbpotmxY/pIk3uW8SBIWCwbaQfsdvpLIKT0jRd6ghUTUyrcHNdx9unJYVRencjwW1kaV03pyipIyMz7Ie2zCP4vSpMhkUK9eiMoD0RLbD/e11Xxy4S3k+bBGJnG4xTnfgfBYS7ZjzJYAcRRX5R/povCUCpcjmLL9DDGdTVVed07bZtyNRRBcHzvyH7KIkbfNZcpt1oxbdy68/eUTqw9yReBKLi5lh8notCtgD8W/pPdIP/dX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8353.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(52116014)(376014)(7416014)(1800799024)(18002099003)(22082099003)(13003099007)(38350700014)(56012099003)(3023799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bpjDJyIGYp8t/Vyy+3MZj5kyE6/GAJbYgSyH4zV8t//QqGZuP9QlGTnC8OXY?=
 =?us-ascii?Q?rCMgDMrKrqZSjMpg6O2sqPJoKpceCNVL1u8mQEP5DRPJz/nKSZJnDo7aOhyv?=
 =?us-ascii?Q?aTTDao4mJ/BUwYGmROVton7X08bsdEgFPv1Xjfu57R6FWyNmGis0mYSiuIRA?=
 =?us-ascii?Q?KU1ioyoPwSJGDDf/WT0WC/xFEFmlvCQjdQJpKrV9p5wJgXFZV9VOdlvC+Nmh?=
 =?us-ascii?Q?bOi9YJysEeaNnRRcOj2+gURMZ6E3qx+GGfgN6TwauJthg/GZx4CtdJpuzwOi?=
 =?us-ascii?Q?w3R3Hx3uyU+E7QyjGOe6JPPY5UCaom99fywi4Uuo3x0TmGMtbY380REsj4UH?=
 =?us-ascii?Q?qsCmiheoQWVm9RZcfENLCVZcYOmqz8AW61Pv36lbqSP7unuPYGAaHNJsaLbp?=
 =?us-ascii?Q?PZuwsiVH4XPjlf2RNeLMzLT64nIL6oT7kx12JOpT2AHg99tsI7mnnP05Alxm?=
 =?us-ascii?Q?pxIa5Q7Q8l8wkX8jRH+D6tDOk4F4uzux6QoX6xWxXjAD7Eyr6JpQqCfLOf6p?=
 =?us-ascii?Q?P65ub1lpWqgLPprfCH8K+qvz6A2GFQ2W6ymlj9UK7D3AGf0pn0eulPRYjtox?=
 =?us-ascii?Q?Rlo8uziJ4FPrQUb+5A9aeSFIAxjqJ4/+uJfVxOmkXHsV1muPvgVwSJUvW7H3?=
 =?us-ascii?Q?c52ehIfmbcLBOk5/0uBH5VeEA+FC+tHRgeC2jz8RWLGlqAC0ZY8qrPxwewbP?=
 =?us-ascii?Q?9Xoxd1Q7g4ObfVcSFnmpfcrQj8dRqpBaNjr61LgfXvLLyMdRaB6cwTHOOGAn?=
 =?us-ascii?Q?g9td3nwoyzYsuXcq4jwPjpc5aY32C4lcuYYHyPdoaqvUZCSm7fVVsTitb83g?=
 =?us-ascii?Q?9ySRMo+7WYWBH0c8TpR+JtMlDaPikEs9JpOJIBb29146pREwUyUOcfHh0zoh?=
 =?us-ascii?Q?PXFHbbX2xF5F0UjmO+nIKk8qxRZDmhABVjrBTAQf9qhm6BWl8Aekq/1a/iWf?=
 =?us-ascii?Q?NI/8ciujy8I7yBqoFjVK7dD0D6L7UoUHgmWRAXmVNuCYVtjVZvXtusaoZv85?=
 =?us-ascii?Q?7PCJhHXHd3ZUSUyzE41oD6/HUEsvBPe5lj1C08zH7BfYe/HAizvLwyKbfHQX?=
 =?us-ascii?Q?Qzs0sxxPdtSOPBLRa7kFcB9u0dul8BbABWhJ5voGELl4a6Fm4ZNj0CPmYfT6?=
 =?us-ascii?Q?UpBPNfLH9PNUyhxfTDhFJwHIAdcBI9PPXf3JkcvQfcMKWPsHsdOz8FpIzM/u?=
 =?us-ascii?Q?h3vVzteZmAdIz5snCS6hZEbC40Yqk5epHnN3wT9pargSd+S2DhVYrP75UCaN?=
 =?us-ascii?Q?OOrtE8nVHRqA2MrnBwZWMrI92L3Lu+3VTUOMcrnhEFIEcnu36Umo3GlqqAxB?=
 =?us-ascii?Q?nHECt0m0paMkpfqXoL2a3Pl9XcUNwpFwrP6HGa6XjkZAUTdJucVzDJIwKRrx?=
 =?us-ascii?Q?99xSCLU8XTjV01fDIZ/LDlZTMuRtk7coIb8Eqa/smbrkPr5eh6naZGjwrByv?=
 =?us-ascii?Q?lgQl0XplBcnZtHoUjOAH0GNL5dyYUpZdJpRp9aO7MZBsVry1KHiEHebN/DEu?=
 =?us-ascii?Q?l0/qKGSPHUOcQt+foTCrvIRNI6eeBgfSqhV6Thu9HYv1b8aH/jZcEezG4BHB?=
 =?us-ascii?Q?9jFK05Jyf59tBuNG40yEoEdaasuuFmfbJGUF18Qbzhodl6Wta7qqqnVtsMQq?=
 =?us-ascii?Q?7ArW/TDmBMcZ7pNd3Ecbh0ymoWZcQrHeR+cbaOW1Exs3bhc8xi7NvQVBWqTQ?=
 =?us-ascii?Q?oPPJK3GCBEqSYcTpKdeTSmo4z580EE8QuETxp7jhIbw5HDjRhGRhQmQpyMrh?=
 =?us-ascii?Q?04PQHZcWEw=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 613277a3-247d-4a86-2d57-08dead75aa84
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8353.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2026 02:50:01.7830
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zrx2L8mK+QJB78tZmTWO8afDsxNV7UJm3fPvMIVtfRaTwIsC7/0r5KUQlnxvy864UdScUqOcTW7b1znqGVxo4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB11989

Add common DTS overlay for the IMX-AUD-IO daughter board[1] which
connects to the base board through a PCIe X8 slot.

This board features a CS42888 codec providing 2 microphone inputs, 2
line inputs and 6 channels audio output capability.

[1]https://www.nxp.com/part/IMX-AUD-IO

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |  4 ++
 arch/arm64/boot/dts/freescale/imx-aud-io.dtso | 58 +++++++++++++++++++
 2 files changed, 62 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx-aud-io.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 0a4dabac5de4..7258740bfa23 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -545,11 +545,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
 imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
 imx95-19x19-evk-pcie1-ep-dtbs += imx95-19x19-evk.dtb imx-pcie1-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-pcie0-ep.dtb imx95-19x19-evk-pcie1-ep.dtb
+imx95-19x19-evk-aud-io-dtbs += imx95-19x19-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-aud-io.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-libra-rdk-fpsc.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-verdin-evk.dtb
 
 dtb-$(CONFIG_ARCH_MXC) += imx952-evk.dtb
+imx952-evk-aud-io-dtbs += imx952-evk.dtb imx-aud-io.dtbo
+dtb-$(CONFIG_ARCH_MXC) += imx952-evk-aud-io.dtb
 
 imx8mm-kontron-dl-dtbs			:= imx8mm-kontron-bl.dtb imx8mm-kontron-dl.dtbo
 imx8mm-kontron-bl-lte-dtbs		:= imx8mm-kontron-bl.dtb imx8mm-kontron-bl-lte.dtbo
diff --git a/arch/arm64/boot/dts/freescale/imx-aud-io.dtso b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
new file mode 100644
index 000000000000..77fd0aebd96b
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx-aud-io.dtso
@@ -0,0 +1,58 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Common Device Tree for the IMX-AUD-IO daughter board[1].
+ * It connects to the baseboard through a PCIe X8 slot.
+ *
+ * [1]https://www.nxp.com/part/IMX-AUD-IO
+ *
+ * Copyright 2026 NXP
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	aud-io-sound-cs42888 {
+		compatible = "fsl,imx-audio-card";
+		model = "imx-cs42888";
+
+		pri-dai-link {
+			link-name = "cs42888";
+			format = "i2s";
+			fsl,mclk-equal-bclk;
+
+			codec {
+				sound-dai = <&audio_io_codec>;
+			};
+
+			cpu {
+				sound-dai = <&aud_io_cpu>;
+			};
+
+		};
+	};
+};
+
+&aud_io_i2c {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	audio_io_codec: codec@48 {
+		compatible = "cirrus,cs42888";
+		reg = <0x48>;
+		clocks = <&aud_io_conn 0>;
+		clock-names = "mclk";
+		VA-supply = <&aud_io_reg_5v>;
+		VD-supply = <&aud_io_reg_3v3>;
+		VLS-supply = <&aud_io_reg_1v8>;
+		VLC-supply = <&aud_io_reg_1v8>;
+		#sound-dai-cells = <0>;
+		reset-gpios = <&aud_io_conn 0 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&aud_io_cpu {
+	status = "okay";
+};
-- 
2.50.1

