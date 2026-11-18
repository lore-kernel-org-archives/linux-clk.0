Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.64
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003170;
	b=N3lY7WvCYHlmeAP8i7IYexME7MThUGHX9f7Tte6g2qDhceQyYdWDSZCjIjKqYBZFk1sH
	 492Gp2c3tHFUwo14X3ITC9IRv8zuQOsds4lI0MC6U9xnxsWV4dfPR22MA0Dct3pyK9pR0
	 utsRnN/+TDNGRc3Osng3CWgyWqtpqLEs3Ol/ejrkzgj6CGip2aUrucNgEq58ZYq2yHw4G
	 lQjQuCU5NMlM5X1Ej+Pb8shJTWUvaHpWDOh/YWp0dq2CTzgqJO3S19BNWcyqUAyQf/4QU
	 x7DWGze02lTWXgsCm/6xp05GErU+LwEh9o6wnumH9cwhs/VmrSHG0R83Dam3+KgCLQQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003170;
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
	bh=V8y8uyklrzp/tIyfPpbUSMfiF42PsKOnC0d86vjJPe8=;
	b=gP/6ka1iSSDVJEEedjJ/L1ezm9/GqZLyHxfUHlX4UgSsYGGngBd8Y0yV9pCAcSIXtEU1
	 W+6D3ibpKqGDHBNSSdN7aVe8rrZ1g6i6d4AopqN9LYAapJ8XqBTTore39qISSeF5SiT3S
	 bPD6u8e6tMogte72uvkqFJA3q2ra6zMutncz3DVNq1UPEOFQok/aH87U6UkjnYkVNZI8y
	 4Jx7KCS3ac1isID5ijp+M32uYa0l02+qaFh7Kwq6hlJEI91doJD9Rpu/N1pDqlTmEF4Zu
	 TEUAJ0n2mV7OQ1E0Func0YrLhf7BTVtcEPCxEqkhUCpamVp7yrkV1EqaNVhruZAiS/w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=RoudCvML;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.162.64
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013064.outbound.protection.outlook.com [40.107.162.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B681606A330;
	Wed, 18 Nov 2026 11:59:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1B681606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=RoudCvML
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIcutvCkHPpMukVk3GPfwib7whmPcdVTnUhK12sUcPc4ldbi+9aI89dKXiJmPBOwJNI++/wl1dsXi2Pi2sDcRWI+91Z3p/5K2rqwA20e2Ehunde3oBYTKMdFodl7ekBoCNX9PRJcpq80NFLG0SJXg4CiKbgKmpOGzfEPMeDQvvE7T7KsUqxz1/YBEt+CzaNk9kFq524IZjBLOoCux2MZlPjv+8Z2gmV9LlZFyJ/Xj0w5jUdJV3K/r144LO0bzTAlSBsxh9qVYCVG0jleWADPzpNvZwYLg7tG0ItoWHmTuXD01TufS+edgynQ51LSmoLS2BldtgCeAvN6+0lz38UORw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V8y8uyklrzp/tIyfPpbUSMfiF42PsKOnC0d86vjJPe8=;
 b=KBfnGvoHPFE8t9QjJnAFgMc6N0k/pRqtChgIHOUAk5OTZIfC8n4S0S12dPp6yJr305AM+QM5oMBnIujN7NU6+Cw2/fvRN3DYEaEN0FP+hEolqUTNuYAvS6QBiLctn6S1ZJqFqzudmGqXyZ5Syrc+VdeKS7Dt6sVEy+GgYme9lwZXAwyufqz0wx6XN8w2StPF0/KSG1PKDWoy2zBpMQ7lK9iMY5pewPlnny5zUMMs/tmjG1uvShLFf/VppG+mvdYXha+hRXL0Hqp1gJ7whVy408ZxtEMNpdJQL6A1iAZerkTsXSjHVEQz5/z2dUH8z/aFcL+eN04HnuP80YZ133K93Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V8y8uyklrzp/tIyfPpbUSMfiF42PsKOnC0d86vjJPe8=;
 b=RoudCvMLpuHUeBxcmassklELjaT+IqcvxZmfHcXi69aH5CcrWOKptU1TgpLu7aIphtGVlC40zjvoaG7Al83EkNc0FM7QOKvR5N+OxWV6sEv6iMGq+RmJBHQALmkq8DdhNLlqwWzz1RLDrqrY3aJZQYyQ8kRRbtJM+cd52//SO4gkksewj/BQSjYVd44hRBlV5tz2XosWU+i1wmXq6VY7iGJ3Jt/n6vssa81BZN6VpSCXguf+X+W7UDYH2mh5BFuXRLZybhJWBu7H+7ikUwkH6PYuGeuJNPVy1mABLCtfEp6V502BcBDE9NGOZGGOxdoq0KalljmZb60OGZVnxq0mUg==
Received: from DU7P194CA0006.EURP194.PROD.OUTLOOK.COM (2603:10a6:10:553::15)
 by PA3PR10MB9312.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4d5::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.4; Wed, 18 Nov
 2026 11:59:26 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:553:cafe::37) by DU7P194CA0006.outlook.office365.com
 (2603:10a6:10:553::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:26 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:10 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:25 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 18 Nov 2026 12:59:11 +0100
Subject: [PATCH v3 6/6] arm64: dts: st: add LTDC pixel clock mux inputs on
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
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-6-935de791a4ce@foss.st.com>
References: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
In-Reply-To: <20261118-ups_mp25_clk_syscfg-v3-0-935de791a4ce@foss.st.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
	<alexandre.torgue@foss.st.com>, Christophe Roullier
	<christophe.roullier@foss.st.com>, <patrick.delaunay@foss.st.com>,
	<yannick.fertre@foss.st.com>
CC: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-stm32@st-md-mailman.stormreply.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=1510;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=2vG7JRKnOw8O7I8F1WBdWWK6arSZYCWApn/mtQdKBWs=;
 b=MM7vP/goYAZK8ahqjNbNHn18xAh0w8iQ16KIXs0vrVUhKZIgqIJYFfVYDRGCW6ziXpX+BBDiZ
 iQfXRXwk1SvCHj84wgIIDhTRgYTSLiwBX9txNRjkX9dcBV7nE0Tj0H9
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|PA3PR10MB9312:EE_
X-MS-Office365-Filtering-Correlation-Id: 91d4f1a8-253d-4488-31ae-08df456b649b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|36860700016|1800799024|921020|261102123227099003|56012099006|11063799006|261026140227099003|10067099003|261022105027099003|261021123027099003|261028144727099003|261021121427099003|261009223027099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	XdOo5JM0t8QGWDrMWft4ErGypWF9cTNkz9NuGOVwgIRF9vyA+gBJDqQkgu0ZFqgTZANrX2Gis07zvNO1KswBuXYi5c5rky1iLR1Izuz+hqgo2giWuyJWMJgeEY5k3DZ/wv0h3k/yGM43bizZtpkE1KYgeKckW1fvdNDNqXjCGmqVvzeAOsDk+XQNh0Y0Ez4dAAufryjOoGzuRLY4jd2LUMSNmHzmExUHhwMnWEcd4+hWxGcQbEQRZ6ibczV+eTh8Ak2HL7O1RhG32e9FU8QBOxPhAFW6Ew0I+fRGit5TbEGXc8/9OvKBVvnVwU3kVvIT6PHu/Miq26QSfG3k0eRO5unAbX93cAPLTD6ApzytixSJgPtnx/0phwb9gdjRtmQj2NcqLiANEf656Oew5HhdGH3NtYbyAHD7PHsTSfibcR9a+XJYRTE19Y5s7R2Cs3yeKlQBdp9w3QXrqas9akE+fHtux1ss9+Ig3J0J9hQ/2w8XS9PdoZmKLBP57zpYjOJk713LzG+VY3f5j+uEkQTB44uE6FsMQYtBAc+Jf6Xa3PCMOMDHN87KACOH+23OaYU/rA8ebF63h27/+F8vw0jJnfP7eJtI/70U1wyrZdzrmeZ+iQepBVHyV4Y+QlPHm82s1tqhbOc06KUOqIy19PnIJ4pyZTks5SInqwEX7p2szCN9MNx67WHQCEOUjayicN6SmzZqpsLg+QJ2qrm/jJvytJNXAmr9mkwk5Sx8H0aKqsHt7eWloWljv90Ypg9gUgJo
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(36860700016)(1800799024)(921020)(261102123227099003)(56012099006)(11063799006)(261026140227099003)(10067099003)(261022105027099003)(261021123027099003)(261028144727099003)(261021121427099003)(261009223027099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	atS4A25y6LxvS0BRVR11X/pF5viVoENdoI/wwVc9oInKm4S/fkvAlD2VzAF7dN2z/Fmp3zgBNkHD9571fc7Py0RD0k8kyCywyyq5QAEbJigZcMpRnnKtbgsTV2RkNFqklU6VJ4U3LjpXEz2/abUzTiL73HMVmaLIx7v9pgssCEXFGjuquxoT87BTnW+WaUZ4FKBIwmDyTPIwk962QQC/6nY+JUSDu54AopohF3YQYlsAMjz1WEOPINkanPe47uZ2jvJFp7oF6YoaRm4u1f2hZ3qEn7G9evy2AnMN8vFqKgs5kn7yVXaFryFqojxgi0C2CQGpRrPhuzTiNhgflWjuWKaKCRj/sQRx8sMq8PVKKhGdIHOwr6ATKf11suDY5Pf4X877Fem49UFbqnlHvMyu5o/2cuXb9kKRTp+Gtt4RAkl5S51re71nks958JzXPY20
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:26.0319
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91d4f1a8-253d-4488-31ae-08df456b649b
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9312

Describe the inputs of the LTDC pixel clock mux in the SYSCFG node,
which is the provider of the LTDC "ref" clock.

Only the LTDC kernel clock is available on STM32MP251; the LVDS and DSI
clocks are added on STM32MP255.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 2 ++
 arch/arm64/boot/dts/st/stm32mp255.dtsi | 7 ++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..7a91c29309fe 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -2076,6 +2076,8 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
 			reg = <0x44230000 0x10000>;
+			clocks = <&rcc CK_KER_LTDC>;
+			clock-names = "ltdc";
 			#clock-cells = <0>;
 			#address-cells = <1>;
 			#size-cells = <1>;
diff --git a/arch/arm64/boot/dts/st/stm32mp255.dtsi b/arch/arm64/boot/dts/st/stm32mp255.dtsi
index 7a598f53a2a0..e9c8ed9882c9 100644
--- a/arch/arm64/boot/dts/st/stm32mp255.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp255.dtsi
@@ -40,4 +40,9 @@ venc: venc@480e0000 {
 		clocks = <&rcc CK_BUS_VENC>;
 		access-controllers = <&rifsc 90>;
 	};
-};
\ No newline at end of file
+};
+
+&syscfg {
+	clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&clk_dsi_txbyte>;
+	clock-names = "ltdc", "lvds", "dsi";
+};

-- 
2.43.0

