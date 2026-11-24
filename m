Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795527704;
	b=d9VUqtb1+vDnh949IdOpxgLtW4dhYvZK0njzQR4ThElJWesuReUvxHFU5ZN19uGE0f6A
	 ZZbTotnrzZA2yrBl+VMw7SsiuHMNwfjMKwjRbXFx/qsjIc3RN97kn4kiMMmM1RkFs9XUY
	 HPekuwW4hWojy0JcpYjQiJI+kvffZa8UhAWTdvLqErphmdZ+X5o1ByS8U0ROE4f2f07m9
	 rGcNrVMgrQMysM1fVaIxbzwlVQ/vE33T2C8IkCbKidz0n8GrE7Wb+ufsCErvXUmxx3osr
	 tOO0izomJANEHVO1rFPYWH3qwgt2oesWIO5ZYfHvNDFEQUwSTtjRPlnEzV+iMFCTlDw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527704;
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
	bh=08MzTx5X/iowrnK9g17kfK/ztUokokZyxvz2Psh3IJQ=;
	b=s2QDBTkq635AtcuUNXNfMiH1Nh+nzL+cGDsiPtGL3x+3j0c+zQfyW8p/ZjpvxsJNQ8jo
	 SZDnqtx2siHqsEq4ZyjXj1jW8Km9mz/kLgOoVHBGx5WgfBhSruSJLhXW8vilN3SL+sbJp
	 gcXT9OPTvTyXZJr9LYg1ySyGG+fLSaMNrhVAwCflwCPIJixREgHEd6oXoi9vtfaWPGAoy
	 FOeqHO5KTq0NvQgNYrOQ6S/3mjvbDjnAYSrsBKgmCrlKNdy8F5ojcSnc9q/w1m4yv09Sp
	 JYjy4ZkW3rtgGjf9EyEG5zH8kfnOuhbF4+QeIn2Qs4Cp1xjjnGxgAx+dvZvKR5Ft+FQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b="Jy8d/FKu";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.46
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 649BE606A31E;
	Tue, 24 Nov 2026 13:41:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 649BE606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=Jy8d/FKu
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nRDNXNybPP7bEjvItIdrKdRX0fBPG04Kh1+lxkeqVZV3I3aLDr4m91/9zcXHOi9y9A8tR5yD6myhynjnwCLfgN+3a0BPRQ2UMNcTwzieUcTRwQFPaA5cZBSjGY3uteSEnt7lnQar2eLPofYG3KmOg9pPzSasirpvop0DylyBATHEGypvurjwzQvbpyszWR/2qsWJSAwxtWcVnD4VfzF79OMIAeRlcRa3vUTRU77l61l+5Jc4kW11v+hHHBwmSiKljwfIrS4nILpxZ+mFkvPYCWcDENT/ZfV7XTsiEF2MGKv2QKFJk+J8J3+glVR1+SfgIt/O+H10YEKMJ6zQ4eaFEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=08MzTx5X/iowrnK9g17kfK/ztUokokZyxvz2Psh3IJQ=;
 b=W2hvJPp9nFaVHuMBzKBcUrTr3Sd/09rh7IkTUm/WPP7gFb5Lip2Xm3EDMi2ef+HiO4cgKvXbSpdeEd45wdGkWUxY41sF9/I+50ud2Bvzmpe2D4MHEujmrPYs8tqamliIb5TgeNSXiGwAGzsEWIyf+UOxdZHhu9PDjzmJjO90/0T2vHESyAkR7MlyEs1kqPLCJb66FaIgn3QTYt4bZ+VaeeqHxciHWGia0hsEY2AkF3ku4CUzquWV2DBk68z0Hpfm9cZZhjmM5LegSmp2mMIQD9PZHQ7lUjLoiq5NsuiVue1WbIxi7tN6GfHy9surC3ujS35wKCAtfxwzm9Z/THWRHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=08MzTx5X/iowrnK9g17kfK/ztUokokZyxvz2Psh3IJQ=;
 b=Jy8d/FKumMypSkVl9aZ2ZmRVIyew8t2NTMG4KWHgoNz7R9rbnXHmMqn5ffPEdKRBABuaaoUbJe+QejmZ3XZFhlw7OLFXQg85KnauHVM7iNYhE9daGG5cRoJ8WVicIUy5Z0z+0bG/hNadO+WKxGCh8CEtQWqmuPe7X2VhDlkfAbUJNU5Ncu03kPUyv15WzgcUyMD9OE3r3HQUDT5KZLP8DhmX8Rb7smk6xxZ+kX5u8k2yJc9R3VDZGzvp14cNd84AzQB+v3qigOqIIp8C+Eb+pqKX9lYW7vN8jXi1X4b6Ka80JzNDt2zKnPKRstKryzYBBDXjnBeMEBfudeEdRnL5Zw==
Received: from AS4P195CA0012.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:5e2::18)
 by MI9PR10MB992257.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:290:ce::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.3; Tue, 24 Nov
 2026 13:41:39 +0000
Received: from DB1PEPF000509F3.eurprd02.prod.outlook.com
 (2603:10a6:20b:5e2:cafe::20) by AS4P195CA0012.outlook.office365.com
 (2603:10a6:20b:5e2::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.5 via Frontend Transport; Tue, 24
 Nov 2026 13:41:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F3.mail.protection.outlook.com (10.167.242.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.662.3 via Frontend Transport; Tue, 24 Nov 2026 13:41:38 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 14:42:42 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 24 Nov
 2026 14:41:37 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 24 Nov 2026 14:41:07 +0100
Subject: [PATCH v4 1/5] dt-bindings: arm: stm32: Add clock inputs to
 STM32MP2 SYSCFG
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
Message-ID: <20261124-ups_mp25_clk_syscfg-v4-1-894d95dffec4@foss.st.com>
References: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
In-Reply-To: <20261124-ups_mp25_clk_syscfg-v4-0-894d95dffec4@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795527696; l=3211;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=+ZlgxL749Bm9ez3tJRHBFvNdUqQAD5PgPBgRy9KKboA=;
 b=26/xXb7Pzcb1qG24ufZSywfjYdKF2uDIJeqp8kTHf7EKZObZQ60b5i8vn9k/aB2S1O0AwTB33
 lOO3vmDRQj5Aa5GuL4o6sW6j0/3mn4Ho3XzBRaE9svCJSlgsJwDWgsU
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F3:EE_|MI9PR10MB992257:EE_
X-MS-Office365-Filtering-Correlation-Id: fe63b41e-a376-42df-9594-08df4a30aa40
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|7416014|1800799024|23010399003|22082099003|18002099003|261026140227099003|56012099006|261028144727099003|261021123027099003|261021121427099003|261022105027099003|261102123227099003|261009223027099003|261026121527099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	uARhekjMHJls6WqB2Zqvsho+Hxuy9uJZp9bznXy09q4dqC4Ge+9fasgbSVFKziS/IGm6AwfTEOqhyn9CoIFIzcs1cPg0NAW1s0Bh3nmVyjvfWq1O5PJe4zi7FMISd2l27Rk2BK/5vrnrCWTNoMbFbuTRCklFOaAhY/fhbgVo7vUSV71M4seAh8efkN2GZ+Ki7Jr3r9FeYZAQBvXDvbC6jalUbYu9ffef0D1OLi4o8MVIFPtlRKNLhBANfguRn3SK0oQRP0KiNflGeApKQzoD6xwId3dNM4Tdou2gfC+QF4vtkvMD506U/t77CUcm/K4ImZcrOuGuqFEBCyiHDIdLc6camyGhNWEi1cq1/kxR6bH1lhs0GtADGk5d/E/PNISZh2cjlZAh/gBrDris4WbvMI96iT3xCS43GRwjzBlpcKXHgRDrNJ3qtlICo/4mx5zdEC0VyGt61RMKyg+340iQODSht9vxc4ZBexie50L3HlDFUuvWQn+aAeDAbcRDMmHiEZKpd/M4rrGV5Z1q0rCfoflZElIIBVQRhTusndo6E327EGWbmXUDFoiFAguhAh0J2RgxX1GqmrhJGB+yK0WDCFJBfm7gf6G+xJrnnNoLTlGgpLw+AG7MCKIRPHIkmjQbRuYHsaTsHSEZhF5+A2jh5Qeabr0RFYE/xKc1UiQR1LwkJk04y+mzCvjTMpvaV2WOhFPcLxTd6TXkpGFQOD0cFw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(7416014)(1800799024)(23010399003)(22082099003)(18002099003)(261026140227099003)(56012099006)(261028144727099003)(261021123027099003)(261021121427099003)(261022105027099003)(261102123227099003)(261009223027099003)(261026121527099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r0lNeMebbLCVUHmA1qS/BqWEceQjp6f/rGCTQVSPWksnUmqLSuKKJ94bNPQ85TbdbfH027RJY6Q8NqPW0ttCGgOmyZRsiWOyqxUR86W8YbNwxvaZQC/mWk9jsjkOt+8i5NTeibsU511Z8Wd77hFv0clsaWifjj8aqU/Bqx38HYXH3MjoWACizF6XdS0bp7uKzs55qX5Pf3l27AjA1EksPHBm31Hf7+Nz0d6bMx8suYmyv5639T//qsMm0IVgQClzKeDwx7NrfsT4JeGeONQC5cde7hPHf0zz0hmS/PToQvbS9IXP19UsPMJb/Wc8ItAvLDjoEtlnZ3sRjonRm2OkCvQrEo8IOyqPtHwHrFR8VJLONOn62FZYAXiT+iWtO9snh9oDvKCgITnUa3CKn9jtki3oCzio8WpnkHkYMiJwfJ6WtgSk4/I/tkTI8PmY+70A
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 13:41:38.3006
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fe63b41e-a376-42df-9594-08df4a30aa40
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F3.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MI9PR10MB992257

The SYSCFG of the STM32MP23x and STM32MP25x SoCs is the provider of the
LTDC pixel clock, which it selects in its DISPLAYCLKCR register among
the LTDC kernel clock, the LVDS PHY pixel clock and the DSI PHY byte
lane clock.

This clock is only used on STM32MP235 and STM32MP255, which have the
LVDS and the DSI: the LTDC of STM32MP231/233 and STM32MP251/253 takes
the LTDC kernel clock directly. As the SYSCFG compatibles are shared by
all the SoCs of a family, add the "st,stm32mp235-syscfg" and
"st,stm32mp255-syscfg" compatibles, with the family ones as fallback, as
done for the LVDS of these SoCs.

Describe the three inputs of the mux with the clocks and clock-names
properties, required with these compatibles only. The existing
devicetrees thus remain valid.

The LTDC kernel clock comes first: the SYSCFG node being a syscon, the
syscon core takes its first clock as the clock of the SYSCFG registers,
and the RCC always provides this one, while the LVDS may be disabled,
which would defer all the SYSCFG users.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 40 +++++++++++++++++++++-
 1 file changed, 39 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index a559f8b03b84..2a3c0ce90391 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -25,6 +25,14 @@ properties:
               - st,stm32mp23-syscfg
               - st,stm32mp25-syscfg
           - const: syscon
+      - items:
+          - const: st,stm32mp235-syscfg
+          - const: st,stm32mp23-syscfg
+          - const: syscon
+      - items:
+          - const: st,stm32mp255-syscfg
+          - const: st,stm32mp25-syscfg
+          - const: syscon
       - items:
           - const: st,stm32-tamp
           - const: syscon
@@ -34,7 +42,14 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: ltdc
+      - const: lvds
+      - const: dsi
 
   "#clock-cells":
     const: 0
@@ -62,12 +77,35 @@ allOf:
             enum:
               - st,stm32mp157-syscfg
               - st,stm32f4-gcan
+              - st,stm32mp235-syscfg
+              - st,stm32mp255-syscfg
     then:
       required:
         - clocks
     else:
       properties:
         clocks: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - st,stm32mp235-syscfg
+              - st,stm32mp255-syscfg
+    then:
+      properties:
+        clocks:
+          items:
+            - description: LTDC kernel clock
+            - description: LVDS PHY pixel clock
+            - description: DSI PHY byte lane clock
+      required:
+        - clock-names
+    else:
+      properties:
+        clocks:
+          maxItems: 1
+        clock-names: false
   - if:
       properties:
         compatible:

-- 
2.43.0

