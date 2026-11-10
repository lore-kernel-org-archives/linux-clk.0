Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316239;
	b=RABi8B9FcAHXIV2jlg5zzxRtGbDvQKaENA2oWh13qcB1xPCY9ryIgTLVKD97vblLEz0d
	 HGTcWbJekWr9K5JnuVNO31bUhabJQqDrUFegbr4WU97lNz4vh17r22vU6chAOr9DlOTBO
	 GcC6kn5PWLrd5qbIVqUQzpVWLEeauVTi2/weWU6zlfvTCfu6ZUGtF9Y/Dve5dyNa0dnNy
	 PnU6c7InBATL/3awtcmUgGAhE6T/aN1HFfeHpPhBn6XarZWXzvFOVGz4TPKf7cd3ZXhJ9
	 iobb6ae7pZZVP+9qg9nJAXP6rIASFvm0vTytBr2+JtfElVPZH7+r3kdp74UI1QJDxTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794316239;
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
	bh=zTYAkvEmLyeerTI7MVTbkhwC64035xp5K6FKPBICv5Q=;
	b=frU/JVCSutne0LI7ipQiaodueYxXL5YDRb4nad4CewytwAavjlBEbSxI9+sYZlxxQDj6
	 xb/sduRuig//u3CPGSX5i0RzFQOk8YN5nb0Wha2YLE+yOzK/cqVfwNadC+ZguEEtBSabB
	 wGuoE2aA9dpYiUO+SSNtYn19xh4V3gk2xts8ZhcEdGHWYFr39bKPlnXTfQhVrQHGHGG0f
	 SHO5u1BFOZwYtHvd1uuhLDgAjLxiZk0IZE0GkB+LlkMwhvnVaKmkSOaCaPrMfazdrQFWu
	 yz6q2wVE0VHlTmloSlVxssdi604ULuaQZRyuirp/BgwN68XT6K1nUB80IF5tHG22rhQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=JQcJM2BF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.27
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010027.outbound.protection.outlook.com [52.101.84.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76A9560A2621;
	Tue, 10 Nov 2026 13:10:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76A9560A2621
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=JQcJM2BF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mkRc94e1BjGh+zrjLiXrf4c6/XT4CzBrFrp254CPwQhDtsVhwsuW+TiH/FplKk2r3mk9E5mi6DGuJ3lboP+lcpdt9c3GfTxaUZS6DU3OqvuknifSjowT26jDLHoMaecOF7WPIgWHDkykqLa2M+hHMDdwwfCIf9m+/AGXSlhTFtUMaPaVtMiYqoMS36D7gbEkAfVfwlVOZg5+hjM3nEG5o2cUiXf8J2L6UH1fcvPP68r0nH9sCqI1e86cUKeiCBJOHO80yznBv9XexBjdQu6fghRT2unI3RPjR49keFVznQBvF17EcCGnZYj8dQBS72AtDHm6AmOTV7yrRwcJkKkWUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTYAkvEmLyeerTI7MVTbkhwC64035xp5K6FKPBICv5Q=;
 b=TzbqmO0kdzpgWIPmmgoPZkZNG7JfmuxKH3IQARE1hxwsjGD1xaMAB0Ldnp6c/y5X3xxFW/xR21Rv17LTPf9hnSDsmnwqQw3MaNdlw1h07LAoD2oHNeng6LPXQLES5+9lcF0omjFBnoCP8KZSgw8i2VrPm32tCeQbUyVdGKI8JN6VMda3nnhKTOmTcF1tsK6gpEOWZyZuH88eulU+93EbSMpJOq1EYFYN6vUmc7xXhYDYTwDi7/4NJl2GH02QoQ+66ytpQ0vvLTP9tH9+mFNGpYKlISEr/hTWqamO0glzl7PP/sCDKMGm2zhiFZzqJwlGA3ByZf9dkPjuB5iQ2G0lYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTYAkvEmLyeerTI7MVTbkhwC64035xp5K6FKPBICv5Q=;
 b=JQcJM2BFOUAGx8bPuZjyHZztSeEpVi7Pad48Eb3zh9ldZ/0sulCkGyouyMBhhkbkWBjk+leAO47/wG+dDW5Z6Y6kPG5p1iO/3mgcO9+q/e4JVoYb79IG4AesAcjyBHODgY3deoU4gAfSeVE+7Y0OgHNHfMdhF83hDYwIIfsYLuPDlGV/8oN2O9xTglV4qlzk843JLnGZX8p0zff/ZAoPR2mve/5wqSfwCNxC+/uuOPSrPyF4rAZvVvqDUTR5bL6TEGxDuu9P2clSD5cL77/vFChqLCb7TjJujFmvvt9bw4t1X4AhTp7JAn0qRJDsJSO2hrROLZjPx7ewoAvT7grVkA==
Received: from DUZPR01CA0319.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4ba::18) by AS2PR10MB6427.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:546::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 13:10:30 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:4ba:cafe::5d) by DUZPR01CA0319.outlook.office365.com
 (2603:10a6:10:4ba::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 13:10:26 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 13:10:25 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 14:11:06 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 14:10:25 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 14:10:25 +0100
Subject: [PATCH v2 5/5] arm64: dts: st: add LTDC pixel clock controller on
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
Message-ID: <20261110-ups_mp25_clk_syscfg-v2-5-624559bb8ec7@foss.st.com>
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
 bh=Tzb5sNPI0J+nQs51D07/6E51im5s63BGs9nZS7k8hCc=;
 b=8JfDsR8PHNeYGDvs2QhFInKo0UWJA9GY9aCGNTL/qjcVdBAGNzXl66m1qzkoIvq1/ivui6/pQ
 FmD2U/Ng+tRArA+Ej4AoITj5f3uLpnzNgpYLGaeVcdMd1TDXhxcCcUg
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|AS2PR10MB6427:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ef597dd-e26f-43b5-c823-08df3f2bfc61
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|11063799006|56012099006|10067099003|261022105027099003|261021121427099003|261021123027099003|261021135927099003|261028144727099003|261102123227099003|261009223027099003|261026140227099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	68NtCNIZPbuhuET0oezet+U7uVFKee6Y89Dcmnkek39NlTN7BTw7XE+rgoX/ktyvMrPMbrJ4FUQ8bSxkeM24oyrULcxZWJMpl4wsCa6yRxwTYET67nra1I3a1mux8b5S9WSKbpHW3pATlbjA1N5Q9oAomy4p2kN310Btg+CdVvDITGWZQvIAf9FrL8eaZWkoHe50pX9EWKf2Mz+He6cO9UkvH1w7RAg3pphVOMr76ytN7LQmKZHG+mE1JD6/8/xqmwBGznLPtCHQB7soqzKtV2vJ3s2HiHsvg3WoAc8vYNxr3IhMNi2bvyxN06OTpxqXrgk/9HEnTGvFtRJi1Qfwr4IidUO7x3qhImmOpy0YhgC3RC+RwzI2sTclFdNj2FG+r6+FRRnTiLO/wtsS0AqOEaD4ltma8CXWP91pD5umDieNsuU6ZYKSDfWojDedFAiGe37f8pmVPXM3IefGSWv+JNoVQXLG2lxrjlkcxHC0BWO2JfIe2J+B8txRiA0E8H2JmLd8Xkmg8o3hbpZnx08mWQxIkGG9uTugPHNRpBx8S1PRSWLBAVD84w3lFnqeb/gZD64b/s+Cfyn0gg4kW409nWnWDg/lvLcjcSr0hPH1FRb9gm1TWSjTgfJVkwQeuA5XIYn2ZWGbyed8vvp7ahVRGccl27d/voIbqY88UgxsbhhTbM/5HRr97mALkGL2fThlmWrhePF6vEb+UuUP2gwoPQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(11063799006)(56012099006)(10067099003)(261022105027099003)(261021121427099003)(261021123027099003)(261021135927099003)(261028144727099003)(261102123227099003)(261009223027099003)(261026140227099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	FxIE5GQeVVDkh//TKsaSOsZUROUQBnLqvvCueLUNOaIDlR5VIP1JkrSbtOCVz5Wr7/J6FAe5wbaCBpXcFFBVa1+eDj9+jUN+F6KOlTTDXJtVbvmz2BL3/Vxszxv32xAvDR2JH5XAxuN2M7SnZX9t/vpiq9+X+irBjlwb8HPreWoVkJ1BPgQFXNBr2GqJvvcNhgztTgeXdfLBMUAWHGhO0+AW4YSCK6KUfWMjnBtcsz+Mz+tOoJErhVwaaKPYGA2xulorYQxHDgNqgmxes6LjSWb1rDnNSm7y361wnTtdkaln6ZOiu/JbpHy4k35QCO66ANJmizQkixphcyI3ZQyjXcWe4Cb9KpuTkjnR146tmIYhd5NrsTaAVHf0AeZlyAHDypAdcMTSiZeWKEpyXgKIfUTirFTePzxIvFRgbUs7eqx+g+Es8wlphwuBwHE1O50z
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:10:25.9186
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ef597dd-e26f-43b5-c823-08df3f2bfc61
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB6427

Describe the LTDC pixel clock multiplexer of the SYSCFG as a
clock-controller sub-node and use it as the LTDC "ref" clock instead of
the SYSCFG node itself, whose deprecated "#clock-cells" property is
removed.

Only the LTDC kernel clock is available as parent on STM32MP251; the
LVDS and DSI clocks are added on STM32MP255.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 9 ++++++++-
 arch/arm64/boot/dts/st/stm32mp255.dtsi | 8 +++++++-
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index dac3d2d23ff0..8d644153dbcb 100644
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
@@ -2076,10 +2077,16 @@ exti1: interrupt-controller@44220000 {
 		syscfg: syscon@44230000 {
 			compatible = "st,stm32mp25-syscfg", "syscon";
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

