Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.29
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307353;
	b=QY5/kQcVrYIicIZJ9xPSI2hCnEW6W3UyLAS5KyKDIJvkZ0KUgfQlLYNd+Fmi53ZGlb1M
	 JmY7WZQpRqadKsDfNtp2Fj03eOnntANNBXdD7nU5MRQfx4rP7h83GN/YFa/QrzNlJXwfy
	 AkzL8llcKiHxWTSfQHpBhLWKYIs/gyEeDFOu5YpVvkzRb0zm0XYcU6QWPrPNC2MCB9ofP
	 mSFkUXXgmLvTkVzk7b4i3dHmusco8qJUW/PyQ/rJmuHLQoYdvUukAJKEpPFTPAjJFZJ7c
	 ctjBwWJZfsU7fw1TM9AIdc8e8OeMPeAiR4Z2EmWCQLgn26j3xVqQw94B4NdAYzNsd5w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307353;
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
	bh=zEaCTHAQkQOG0tekvZcAlt/kaNxWUKO7bFyaM8mOxNg=;
	b=fhZomQPC8/H6JNWqGk2uxbW4aEmtu/8BR6B8oYoBG1+1UHHSwibeOqnBGsh2y9x0OD6u
	 b3Mp72fUqzdR5fClMz1SuUCAOCN75hnsSLneGeJzZgcZUUdvlur3GB8nFkJ0DW2cyg5P0
	 WW35r8ZvE5jXZDK4Z1aOi72vIArUwCKzaK1EDBvHxcVa9xS9PHLV62FCdoMP6XJmaw0l8
	 jk7Su4TtiMgRy+5F+ei4by0F5DxuV1DjcSj48uPxx8+/z9lT998u+LVaUhoOgX4emfTJV
	 nK9O4KFWA77L+/tucQA1XUJBDJY3SEFlrU8AlPmMg4Grs+1FX5kfpg0tDsbtVlcd9WQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=WevM0AVv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.65.29
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011029.outbound.protection.outlook.com [52.101.65.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE253606A331;
	Tue, 10 Nov 2026 10:42:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AE253606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=WevM0AVv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lbuddj1CGIovTl7zlF5q/QQsxAAt1aRvRHrv3YyMCzbCMHkMhTaiKVuvZdihTg9vbJ3JItkJVd/nkZG4BQtn51zefYSQumdDo1eVw99vfMc4p034ZPC2nn/r9pupS3X/U0X+trsOtitBDZOmJJoDuisSzXcI/gbfETnWHI5WssW32Y5yvjRqIzUJqLYjvmM0s5JELgijBcq1bRBFf0LAIwVYMETrtqhGHniEBmL0upoSYj8MotMaPYe+gPnUIIxcCuB5DXM/0V4jJswYb5D4of90bv8TLwNvOCEUK2uDvW+K0vaFTOHS7QGTBOosedMKuUQq8/WgVtLdB0QXprxtug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEaCTHAQkQOG0tekvZcAlt/kaNxWUKO7bFyaM8mOxNg=;
 b=FmxzpwfY4VJ/F5BZ2vbKpdF0OTKQJayak1yccMDnWagE2rPq98PZ6R7Vno3MrXS1TYmjEg0VqofMiE4dyqqYyxCJ2tGhI2fbCsNFcBeKvlKteP/D47EMGIyasEESS5Z6VIZROyEkozOC6Fej2nFX0V9Gzwbh+mqqPc5I97NVcRNKQiAdByLCNpnRHTLHFEIeMBPbvE0ivpHcqkiyQi8OXAxPK7E3ZDLzS6nbVDMxMpREtm6lmFclfGEE+eCMRKhoFrMYvb8Nvm4LY+PHra/efAiBbIT+b/lR/vsoro7FpYUhXKn+HtPfdyLKBtKPc+VLX+Xk+v9NH1fnYI1npvfGmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zEaCTHAQkQOG0tekvZcAlt/kaNxWUKO7bFyaM8mOxNg=;
 b=WevM0AVvpaH+C7WkeKcf40cESuN6pSZxPQnkL+lIrhANPa9IwALAMaWmlF5gC2SPARzsRauP4EBkuIvsiesGTN4npyLFaXHnHl1JdmUel5BzkWqxPN6Ec8I7d37zlZBqxJXTNzTjWK2Q9FfUF+vNi0jZNQ1+byQY8XJ6NVS1iVcT65NWTCKkztRMGINofq1MLeikuTZD6z5psrm2gEoJE70ZjS8AyHFpBGlba4UkoBtZwb5mHbATyWsYSQsM2QQheO4aIlsk1t02mXSVayL5RjNlwKduOjD5nfbiKtqGeQH90hTK1qHn1DLkWocTvvmH2nZXLdiI3TuEXD1DtG/0Yg==
Received: from DU7P250CA0011.EURP250.PROD.OUTLOOK.COM (2603:10a6:10:54f::26)
 by PAVPR10MB7033.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:302::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:42:29 +0000
Received: from DU2PEPF00028CFF.eurprd03.prod.outlook.com
 (2603:10a6:10:54f:cafe::49) by DU7P250CA0011.outlook.office365.com
 (2603:10a6:10:54f::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 10:42:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028CFF.mail.protection.outlook.com (10.167.242.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 10:42:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 11:43:05 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 11:42:24 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 11:42:20 +0100
Subject: [PATCH 5/5] arm64: dts: st: add LTDC pixel clock controller on
 stm32mp25
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
Message-ID: <20261110-ups_mp25_clk_syscfg-v1-5-667829cd290a@foss.st.com>
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
 bh=ZrZvnOE5VRxN1QWnA4AKRo7mOba6l5hS1vBBZd6Hh9o=;
 b=z1OldJCJLNWmo3ObSySZ9zKPFnnYhnuOOtAJpoMkSVq6hmsx62VRgB6k5PMwcsz45L9zLORkv
 b9EO6Q/a4zIBicJF4koEjtgTJpPptPygdSrW3k7AzcJHqbaonZ4PLhB
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028CFF:EE_|PAVPR10MB7033:EE_
X-MS-Office365-Filtering-Correlation-Id: 8abb4904-fc43-4f8c-e58e-08df3f175154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|7416014|376014|1800799024|22082099003|18002099003|11063799006|56012099006|10067099003|261028144727099003|261102123227099003|261009223027099003|261021121427099003|261021123027099003|261021135927099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	7PXz+MvooaUZHy1Il9vboW2bv3SMNMpzkeD1bQMTw7gL+PieZYmZJ302MVcrqrf3f2HT9OPYI/5KJYJJGWWBmMMOe9Ha4LaMsEAqaMnHRSighVpqkhKvOgjK2PNou6jYLt++hL9IiigEbelgK5hNBB1BAfa30lVDKksggdYZPnY4lHywOQSadTIl7CPxr+M1wZcvWYit1iZUshJfZLr38NtKnawGpDYcwORLVgDb5JEJHIYQ1X1P1NyyJHnUqFlk8hQ4muMGOye7FyCofbGfprg4ZqyqABxi+AbNQf3OuXR3TrHkvXmzV/LD49cFzUa942r/k+AGYRHZKcidYSgtAVFFFiEUG98uSMtFl/Hbwc5v2AjcquI0FwUU4t8fKEjdh9yVzlpFhicg1tQeeKm/AQ8D3t5vzBy62iCQ4HBHSjFaH+Q0dXVzb4vvEfhAIdPcv/kKsHZQoLOyxpZ3eEHapiZVx3yj3RE5oPwx7JeYi7ykcgtqACAuhn4LgnhZBQ8YFyR+VdB1RK+gj/wmXqK5fD/nEi/r6SnnWloiDSaCKUmk10yU1MgCdWdbzAb/736oU/o+veTfdzP0Mrj4DCPInDKwIAdC+NSc7IVE2P33erOlz2pdghTAspiLg/Byl31fCgIapAQ6iJUTK9CUjlXG8gd7hJLrsuEADoUYBbHorExS3NglubbdDCquMuVa9Agfujn1ETnumw14M6Mc4mmUwA==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(7416014)(376014)(1800799024)(22082099003)(18002099003)(11063799006)(56012099006)(10067099003)(261028144727099003)(261102123227099003)(261009223027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	VNjVxdlVHXHBYtYKL8Odn97FgA3R3/ckRKwnUXCN+q0mzRmRLm1jiwJMNgX1RIfNHH6RRQuC7GmGs7zz7f99JfU7FT/owxLB+ckJtPnZY71Yd8rEWrbbM89qb6ENmGOXqJ0ymVk9GU8OwcJtj87tI2K3h0ds8a97NbTnF1dKjRh6+hQQWzpxzy5xv378TWcnPNpLxg779YlSYsG13clEnEUDS6sPVPzAO/i9YCPKjgdQO4z9CK5NC6XANNiVclHgVSMMIpU3EeLJuH9mM0CmnuaRzqMNu32CqY8bUi1Q26Ab19wVCzVFCGRegloQm+5ATrHy6DxJqgJxqWH7ngER+ROhGyCXv57eJURNUTfjPrP3aAcAwgcZVYTd9yKlwIEBRrToQDjZdBcm33aUGsHZfI5fj8c/XSEeTId5PcVBxioRJjPbKV05xdybygD5Sz0O
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:42:29.0004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8abb4904-fc43-4f8c-e58e-08df3f175154
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028CFF.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7033

Describe the LTDC pixel clock multiplexer of the SYSCFG as a
clock-controller sub-node and use it as the LTDC "ref" clock instead of
the SYSCFG node itself.

Only the LTDC kernel clock is available as parent on STM32MP251; the
LVDS and DSI clocks are added on STM32MP255.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 8 ++++++++
 arch/arm64/boot/dts/st/stm32mp255.dtsi | 8 +++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..eec976e28dbd 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -4,6 +4,7 @@
  * Author: Alexandre Torgue <alexandre.torgue@foss.st.com> for STMicroelectronics.
  */
 #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+#include <dt-bindings/clock/st,stm32mp25-syscfg-clk.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/reset/st,stm32mp25-rcc.h>
 #include <dt-bindings/regulator/st,stm32mp25-regulator.h>
@@ -2080,6 +2081,13 @@ syscfg: syscon@44230000 {
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
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..08cbc383af20 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
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

