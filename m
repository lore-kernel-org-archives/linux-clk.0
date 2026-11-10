Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.62
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316231;
	b=JmfZWf1mDabhd/yMeNsH2OewKl19gIbEM93O9czDxoi5WWh0XaS0eqUgOpywN33V0mHr
	 Abci7YXCBSonqvpsJ0I2s1ucJeL/qoCW1WvUNEe9AGtSqwu4Le7zdATnr2WsFJlf8I1b+
	 ONmiEfHRAhUr3nd84iJzZoHGJWwn6vmnK3ZppTc3bbNtgS176c3fkCIzwlrgeJP/piGX6
	 /K3fShoLT2fQd3BXWsw5J5bwnyer6NMcwTMfiiRxi6AfqLe2JKStzzUliKiJ5D2ncf8EK
	 fGyVidL8i9auZ8amzPdLjhp+HPckZfy+UfwCrw9vZFgHW2sCPbqa5lh45JjnRKSdUSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316231;
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
	bh=8JnYM2B1vVlKg2fb0z5/TwJuKWxuGmgSTBU82PD85gw=;
	b=2z/9bP/uY8LqL37EGDx04Ozp5wIn2jc2Qp9vZIACl1lW4hp0s62FQWFr7GKaIOAAkynP
	 eCk9CJXARPXj9+UAz0put2QPA3czoeuEPyojHkxnEfiBtuUCzmIcoe79n58ZXdbjnJCVT
	 R6lTfO6ldHJSEEyLyJ6Zkl5a0/pfDbVCX5L+KmDbu3RbYtcfLcY8Ff/5XR91qgqXbAOta
	 u4dsIuQMYiqz34mFYJBboiUum8ojmWg5fLtw2C+hXYEKw88UOQgpUa1n93sapFflJlgD/
	 Vzto1QPB/X/gd1okcL/ZCcXBAIu77Tc51Zkp97vudtgFDHHq4wvz9Bxtekz9gZ1N3sQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nc5us+5V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.70.62
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011062.outbound.protection.outlook.com [52.101.70.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97D19606E45E;
	Tue, 10 Nov 2026 13:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97D19606E45E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=nc5us+5V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uVr6BniGqJGv0CkKmol5L3u2AyYlSO+sQNEF+1uHnwlmzreKkjUojfH0XVJ1cBWxpX7OSgBAJSuD/bO56rW5INyrgcxv3wDYgQCtxa/8/4O99bbbk6x2DJilHfm8CQ5sick6/Uga1Q8n1baJ1qKroWB8Ft1gOy88rEkjmisjGx0v6EmAgBf9//2fnwHQCFj66yLEGTg2trZnObOTfsxq8ZOLhbfO55+J9P6QwnUX05pMLS50ZX2qS8+vYZg+rUTkQlYMBqw0B0Fi5i3hhqs6omMpLeC3Q/u7vBISffXY45d6IaKD2qGGDzWqA3/iBxX/8P66A1LU3I5QI/GHBIbJ2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8JnYM2B1vVlKg2fb0z5/TwJuKWxuGmgSTBU82PD85gw=;
 b=S5WTCNLOQyrThTsWXqs9lxJEYwYN18Q1kPfaL0gimW7GynZFv55yy9XFsUTz09aOjpNGEG6LvMiOhcGQ6/OeJLo2gtosVAGBZy5fNHcTTtFR1Js9/95fIqWgHU7ZNdvNJZZemraTJte1cvSUzn2OORtZKMbvHoRHUo1O4OPub98Tw4HLQK/druj7lHTzTQ1/NfyfXjWjnG+OekzSGIN7kUjGbI4sIYdVK2tWXclP/tGo4lsy0AQMIgIBki3zDhagLDcbVOumvQP/ct3w7+8Xd7k88WJRO5Vfs+F9xT8GGXBpKb/LpN+pQ5g8/zdSQU2O76e5k50c7Cx7a28AWLyA8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8JnYM2B1vVlKg2fb0z5/TwJuKWxuGmgSTBU82PD85gw=;
 b=nc5us+5V5CZ7afhfCqY+KbRhLb3aPz7Bi1nRe+oPmwCbYjjlkY+4LLCKLwPHVWD/CrRhe7YyC4YTffFAZQdl/jgcdYHT8JzFiYTC4lzJUlVp/cJsCTM02MQE9KuADfrsUmMm1+LDWxChkEf0DcUeTpGL6aEGbNBreyZQCHEKVTdgI/2JXi/k6hF2Q4jLIO97SjypvZmk0WJyUpSqAZ3+zDarJ8RRQUFtV9bVUj7Wdl3b7JjCeaKtvci9mIXCV0Kx3ZzPAl5r+/VHN0WekbeuCfeu+xrQI5CN1d0SCDYTPBz3J++7Sxyyrua2OFjp2XT9n19dJ1UB01qZv7UP7ImpSA==
Received: from DUZPR01CA0047.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::16) by DB8PR10MB3800.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:167::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:10:25 +0000
Received: from DU2PEPF00028D04.eurprd03.prod.outlook.com
 (2603:10a6:10:469:cafe::53) by DUZPR01CA0047.outlook.office365.com
 (2603:10a6:10:469::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 13:10:25 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D04.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 13:10:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 14:11:21 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 14:10:24 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 14:10:24 +0100
Subject: [PATCH v2 4/5] arm64: dts: st: add LTDC pixel clock controller on
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
Message-ID: <20261110-ups_mp25_clk_syscfg-v2-4-624559bb8ec7@foss.st.com>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316221; l=2481;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=J3VoNyzLZYqMQiYBHkizPxPBu93SdONk+DBtz+5ogUY=;
 b=25y0vmUISgKDTFsY0ZcE+jYqxi+ywrdHrdlttKk3nOsHAq6bGuarSHYj6zs7Wr9Ug+/9NUFsc
 yMvxorMOnlQAb04zbGD+LLQvvkm0RnD0aU62JHibiv5Y+S06uGjP10Y
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D04:EE_|DB8PR10MB3800:EE_
X-MS-Office365-Filtering-Correlation-Id: 10e4e4cb-7e32-43d9-a343-08df3f2bfbfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|376014|7416014|1800799024|22082099003|18002099003|10067099003|11063799006|261102123227099003|261022105027099003|261026140227099003|261021123027099003|261021135927099003|261021121427099003|261009223027099003|56012099006|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	237G31NBytgSTkKiGFKJS1Zt4bOojILF04bQ+L7T5KW3H2OzBIDUpJ/QNmM4Fr+bC7XK2XITscOSLnxAOxPpMGWplaK4brd1IJhlvUFwElGKn/7miiX/GS3tyZnnvChZKjBfkhbIk78xAaqQoiZ8vsIGfQSwaHbvq17LvJbr5iz9Z1X9Csu6xwWjQinv1Ij75CysT+otSsbqA2do9kk6pK8IpXhvDpBV8dh0iADzIfEcfgn9LGTHF8DzwqQoV11nbwchZHCpByG3ZpREC5XEIRO2njr/kNARWnr0XdR+aL9YRLUpeaI6qT7MI9giwM9C4gQd4Yv3ULQoRVib+IV8fJ4QuIcOdlRgt01fgB8sCb/+MAP1WW15oxySl+rzHMgOrIzkQ5zW7G2iF2GVUnA/jCgIdssjsipcnirrE4Je3cf6ClJ0pZ/WAAnQtXLkSOtwwyuh1vwvQqsNwdUScUMfnAm0sHMIEcL0tmLa8CRCE/O6V64Oxw19OmkVHjd2UiAQIEX8SDaXBB9Rd2DjSRAmW/PE7JtVCIYI0yv7ukV1sm4iGiydLymfgiKOHRkznOaMBFGbr3uSO8V8BIpapmsFknhnjuD0ucBcfthxsvZuXYSyj5luuxkLtDMd7rGeHzO8vJfLptwsi7ibAmSZYJSnp8H2NxEMKBFBxDcFukX4Ow9qye8L6T1u79iK2mkTdnyYbjsWOIk4CyUlq0gg7N5nYQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(376014)(7416014)(1800799024)(22082099003)(18002099003)(10067099003)(11063799006)(261102123227099003)(261022105027099003)(261026140227099003)(261021123027099003)(261021135927099003)(261021121427099003)(261009223027099003)(56012099006)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	IS5r25kMWPEBmPtpsiF/+7M+fSmk1zB/vDaBbhHijfFi9HMbl04iIg1Ti8Sjs8YymV+HzIJ/72smwZYGSZs6MDm3NdLA+l3sWRxkCfzcPMTgR3JVU2E+BBo+mgQBXUoc9mhkOtiszwF5Q2HBKVSKyyPsZhqfZrs2kRMiwsHmKRPDi5gtmNHS8lQ6nThczwlXHePYRPZL4wzMUfTBz+q8qIPHiUZJPnT6iUlW9A/4J0W//cVmmP0dArGCk4HSozyUR0lKcIcLOIcAYxu8lzbX4cEAG4BhueTv6ap1jv9woPQIvsdnRGXXLUrKpxonWkZuROtiotqQb1UGvnqO3BQElVXpSf7sTiGjTZ7/UDrK2zCEb0CBomz4RG3D2iZTqC57ZFU0RbfbGOFo0yJNCPYW+TvAxoeT1Pi4ik3vNitRqRLGfRpGXxYf24Buc0dmp1Jj
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:10:25.2558
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 10e4e4cb-7e32-43d9-a343-08df3f2bfbfc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D04.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR10MB3800

Describe the LTDC pixel clock multiplexer of the SYSCFG as a
clock-controller sub-node and use it as the LTDC "ref" clock instead of
the SYSCFG node itself, whose deprecated "#clock-cells" property is
removed.

Only the LTDC kernel clock is available as parent on STM32MP231; the
LVDS and DSI clocks are added on STM32MP235.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 9 ++++++++-
 arch/arm64/boot/dts/st/stm32mp235.dtsi | 8 +++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index fefbf6f4f153..df446f0c1539 100644
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
@@ -1121,10 +1122,16 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp23-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
-			#clock-cells = <0>;
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

