Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307350;
	b=ETkBov8p6b8HZqO79ee7UB7sBASLksk45Tqo+JJOMqWlSpvLKYCXRqdHsnZtbp5MEMRl
	 voGBgLbxmLuGnoDhaxt7T2v++HERjyABIPBjKk5Asjw5RjT0XX+0YkfRvp2yLGj+enZAy
	 DBd7nnxTXv+4cj8jablrgQ55dL/3DP9cXdwr6EiSqHwHj2WACGfRRitHMbtzlnG512l8J
	 jDOdhuK1mxXIp5nb/wKKVKfONGk6aIzQlOdwTwbMM5na7DKU7YRMDKV+oQ/XWzjTmX0xq
	 iem+eDMkKL5E/fyFiPpabLonGugrsF3MRJaZSu0acUrmSzLUz6Qzal34K9Nlq1xEdQA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307350;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Originating-IP:
	 X-ClientProxiedBy:X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=L0bGkbGeIvuxUX70mF5SlyXEQjWBuBOwtdHm5KZpMgE=;
	b=sWrAccLfmpdo5wtJ8iFvZCZiEwuqoNVOOlrf9wu+10TUWSH9WiL82dyzvendkvf/nTTp
	 A/k8aroSliCCNGKh8TY6C9jiFjfZ5GJ6fzU6mmjU796/muE/iKGUN1NDa3NWQ58Qk0dTQ
	 ujJAkObRvtWdjCJr/u6F9Bkhw4z1mV3Hmovcd4yJWzbq13h/HYsv39ZWVzS77rhLcT9xM
	 EC0QwpQUX2fT/jywDubvMyJFbMFW999DsAazSwqyhwjANWcQSrWjDpNc7LIo3KdHVvc4I
	 bMWKE53AVj7abWoWQMOezzfZCKEzIVAhFwGY6IrGCW+MgjW64AcPB22xcJM7c2xoawg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=BldW+qqo;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.57
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5059606A325;
	Tue, 10 Nov 2026 10:42:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5059606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=BldW+qqo
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SVoUgW4JVcq6Mih5e3y4I2jsJrZ4KFEYM4oKaUV48+2cGyL5D+byeYjZO8EiTGs2sj3kbcBm7nmLrFwge56pZkoFQGWY1h4IsHq9vfZa9Db8Nm/rCodm8ta7zK2VUMM39NOELtpRsFW19aAoZIIT5RYshVAwLd4RpT3N3MEmVbQqt+5t3b/q7PMTrtv5V7Uk06dCLmkyWjWJFy+bXTEe9QQdea0VU1y3wCOGZEAEZ15tUgMR2/gIF+NE+cuZxQrEZUK6wBBtrcq1g80D8PO3c8C5dzPWkZo8zcavlLpRGLLTewlnlwrz0r0jXykkxQn0e0DaAYIr2OWC4x63bwzrXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0bGkbGeIvuxUX70mF5SlyXEQjWBuBOwtdHm5KZpMgE=;
 b=I6MgerRe1I/9OxiAzMx/PacOf5kXtUPFdo8H1glY0t9WW1HkoXwRKYfWpxA43S9AoPtVvO0yHMkHm+vd3y9rf+b/o6TTESK3NKfs8fxJ4QHvuLz+35AU7tJbpaJ5H4SHllH6LTMUZvF2VSH95RC0VCW+VG18L/8msnWIN/fxFPOrm36NI02NulfCJxWa7e89HGCRe8sDHXjLVMEjKvh+yUavW113uzE1WuL5YkxqmzNhBsRmzOHsbfV76MtzIWurxdvlDoFAYeasCCIIDwmZSQCbPzHE1HwKmstoqygrfqfFCn70rsZcYUdX5S6tPRnI2ryLvUFNrfGNixZvQrdL2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0bGkbGeIvuxUX70mF5SlyXEQjWBuBOwtdHm5KZpMgE=;
 b=BldW+qqoDPk+F+EfdIs0cUcTYNN8vVXGxbIs0VIkmAPSe1t1UoHDr/mWOL8Jl9/ObyeeuPRPlM09wl6gMLdganmfGgXctI2tkOPFmHtet1a5fP+K1BZwmajR3lYQ1vixq6SsEb7AOLr5YKNQQp4yvwQg8rNbGGc42CgrTcyUKR93ZyAR5f+ycSItWRQjKXcGJPZ/pjwLJu/tCxCDFwXFWgPAdwQku1TPrHQHeo4btgCYvmiR0XzatrahddIqVNkCc9ZGs9Izey1xxLlSiGy6Q2A0U6Ip1qHgFH/RCRR8rRXVHguSR2NMZORuTepvcgECBWTRDVeSDQj66AJ9O2XVVQ==
Received: from DU2PR04CA0308.eurprd04.prod.outlook.com (2603:10a6:10:2b5::13)
 by DU4PR10MB8832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:560::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:42:24 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:2b5:cafe::89) by DU2PR04CA0308.outlook.office365.com
 (2603:10a6:10:2b5::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.13 via Frontend Transport; Tue,
 10 Nov 2026 10:42:24 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 10:42:24 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 11:43:20 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 11:42:23 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 11:42:19 +0100
Subject: [PATCH 4/5] arm64: dts: st: add LTDC pixel clock controller on
 stm32mp23
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261110-ups_mp25_clk_syscfg-v1-4-667829cd290a@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v1-0-667829cd290a@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307340; l=2272;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=6OFWiWSYZKy5BEsuoWQKkDZVLDFdfknKWkI7Fl3zvMA=;
 b=aBqjGI37Egg8dIUl/WgxOfNCkSdnA7I15KP9dJkGIIckMLvHxBmaHUFFCyHxk5SF1ZMuOQ99W
 ldb1aVc/7kZDx7F+uwkBnAVKbAJcAOShsTWGCys3hEGMpHgCTmVSchn
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|DU4PR10MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: db88d393-4bd2-4e79-d45f-08df3f174e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700016|82310400026|376014|23010399003|22082099003|18002099003|10067099003|261009223027099003|261021123027099003|11063799006|56012099006|261102123227099003|261028144727099003|261022105027099003|261021135927099003|261021121427099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	NpFJ33qFdBjLORJTl4YUsmDKFYtzU35iKBFL5Dd0IaWnuHRGossS/ZBG5vlbaNdzuTqXWW/rG27YERbqCcEbo1gEHNsFqByE19buNoGWW3Wxd3+6V4qNX7d3VriY0+SIY7kwKIlnUiR5IN9cVteuTp0JELYZ8peA5+VAfBns4IT390AvdorrtqiY8soccMPOXJmtf1lVPkwQfEipFighLKpmkSmWRXMjAlgGJTHvT5HRofxYFd7vWXJg2F94dAXF74QYq6vEgbqR0HWxZwaurVtTomE6enWiJPvLF1czT7fkWk6Fq9aV0pBniERbwSKnPDZaXbMsTZy/1RSeaN4GUa9J0+7XYtuKiEN33JEPWBDaHpm4gfiFyMawrtZlC/Pl3OYYJLd9WU3LqXW2ffRxOIansaLICxArC3+wrxgCS+VDEJvsZ7lG6+SXI/d6KkeJ9EZy9CrkzjllxJ94PHe7hIjU2dVAVUO6gfDyrUXcsQejP2WqGhjUy2Jov5GAKJJRK6+hFVjUhvRGpFphwwcftS01CvPpsxx2IJMAq28C4R8xW1SnuczcjaUFf2BMEiNCL6N5nZua+afzWPVijVGDduje3Aibf80Nr9fC11EEYwOMtKucLwvmdjlaBSpkJUT+M5xcuuGtCIyCaEkOFsaZztmEQ4DF45Oe3t07Q6gv+nreHyxI6cw7Hbl+JiZf8oRhHynqhuan3fDeRlwviP+Oxg==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(22082099003)(18002099003)(10067099003)(261009223027099003)(261021123027099003)(11063799006)(56012099006)(261102123227099003)(261028144727099003)(261022105027099003)(261021135927099003)(261021121427099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	4J/rVf8efV9M9z22ID8QZ7t2gTTBIB3MEw7/8qx+EbAacWkzNAGzRIVCa6YWDmZ9doU+4kxp+bl1vzeEIl0vEo8FQeX+qkXI5GjKQzE3ZmEJg0XQbGUmtZoyJi48I4ENMwVLrb0k9ZyoHkYXMZ6vBdvzlQF+E53kMznrHn1XcDEEOmT86iPiLfeMrTgh14Nwv/FfJzLjFIISYLvRpw2e1HWB0iZ/Dy1kWniyz12hzLHathhb8Qon0g/JGCzKEYKLHybQitvp9U77UdbH8Y3ADyh49zZCnH86mCa7ZhZpYkms7Qg6WsZXtT/q0llPnF2GzBy7vZt2J8m5nuEG38ukukpG2VyYy+5hryaOCrGvJDbJXPlfdbW8jLeWPRNubxWe8BDESfMn686lQA42YuGq8SvXC7Pi81vPQmMzdsQskbVdIFxJbpFGe9CbMvCRJMvZ
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:42:24.2339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db88d393-4bd2-4e79-d45f-08df3f174e7c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8832

Describe the LTDC pixel clock multiplexer of the SYSCFG as a
clock-controller sub-node and use it as the LTDC "ref" clock instead of
the SYSCFG node itself.

Only the LTDC kernel clock is available as parent on STM32MP231; the
LVDS and DSI clocks are added on STM32MP235.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 8 ++++++++
 arch/arm64/boot/dts/st/stm32mp235.dtsi | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..6b6b4aa2bb5d 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -4,6 +4,7 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
@@ -1125,6 +1126,13 @@ syscfg: syscon@44230000 {
 			#address-cells = <1>;
 			#size-cells = <1>;
 
+			syscfg_clk: clock-controller {
+				compatible = "st,stm32mp25-syscfg-clk";
+				#clock-cells = <1>;
+				clocks = <&rcc CK_KER_LTDC>;
+				clock-names = "ltdc";
+			};
+
 			usb2_phy1: phy@2400 {
 				compatible = "st,stm32mp25-usb2phy1";
 				reg = <0x2400 0x24>;
diff --git a/arch/arm64/boot/dts/st/stm32mp235.dtsi b/arch/arm64/boot/dts/st/stm32mp235.dtsi
index 7a87c344a4fe..0ef5f2cdd18e 100644
--- a/arch/arm64/boot/dts/st/stm32mp235.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp235.dtsi
@@ -7,10 +7,16 @@
 
 &ltdc {
 	compatible = "st,stm32mp255-ltdc";
-	clocks = <&clk_flexgen_27_fixed>, <&rcc CK_BUS_LTDC>, <&syscfg>, <&lvds>;
+	clocks = <&clk_flexgen_27_fixed>, <&rcc CK_BUS_LTDC>,
+		 <&syscfg_clk CK_SYSCFG_PIX_LTDC>, <&lvds>;
 	clock-names = "lcd", "bus", "ref", "lvds";
 };
 
+&syscfg_clk {
+	clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
+	clock-names = "ltdc", "lvds", "dsi";
+};
+
 &rifsc {
 	lvds: lvds@48060000 {
 		compatible = "st,stm32mp255-lvds", "st,stm32mp25-lvds";

-- 
2.43.0

