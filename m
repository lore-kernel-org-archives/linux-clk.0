Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795003175;
	b=yjzOXy1qpxnmGzIO9t484haMiX3AnVypiqegm8u0Fb6b/IlVcuM1Xfuaa9Cto81K/goC
	 s2svQiRMxr6/3g72HgD6uIx7Bgpqhhmy1O0UoqznH2CI692Xm24oIH3qH7aVSHsl7rclr
	 LCfg7JgK0jllFUvSxHgaP5Kfc36QoB63z+w4WsvD8/pgYA3MS3lmvROKP0aIA8OlewKYz
	 GRtx8n3dYxbSxZAXTJVZd4CO3/h/0pdMraw2esT0fT0A/nOlAmSaBkTjFwdBJtwr6Zbbp
	 Wd3JiaXtiRZVkunsZTMJFS1UROFVLpbgE4XVE45rlPLi2uwA0QWW9cy70ip+qhyQjSw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795003175;
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
	bh=Gbc7VoynWYlzI9ARjpuXW83LqxFtbNrif1zKI1HWFvM=;
	b=259n3hcHWAHU3T2BdCJ0zbGk4BDS6T4fOftMo6JPxTNUK6va1mqyksBdpT4xCIVaUZGp
	 slUMnLReipkZY6rVxO8ZmMtbUfCED+UB0mJK9KmTh635lS94Lb55mdIzN7p8Vw7kGMkvM
	 V0347PA6WlRKGxrUYWs+ilCND1UOWnv5ITajrAC0TQc9yKarceO7TYbdaAZMk0OARV20x
	 oF3/wBdVL9TglsyGGpRuBSnqeMPtJfSOFqFMEkNLEBoQKseZ12mRIjkLvQr8474k8dyQi
	 U5hdrfgLjB+iIWY6PBlKMX+mFxtnBE6Ae/7MVEjEjpLcF1uZJ7pBfHir1Mx2MXzByxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mVwGZKfh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.83.46
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013046.outbound.protection.outlook.com [52.101.83.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B064C60A2606;
	Wed, 18 Nov 2026 11:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B064C60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=mVwGZKfh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UOSKFGPhqE5KBu2Fc13nXf3toKDdRqkSj4G+b6/LJLtFgEDjBPHQLLze8uQ3IYzeyL/JbjPlrA2LEYpD/ZWIiGd0WvTgnUz9SjahnV1mx6VjnGCV4qANr1W0CU8puJy6B8TvTaaDxpV4g4Y5za0EnN2+Zkx4fDhnBRBnaxr1q4QA34uWIrzEWnjtlKOnpgaHMnSKqyeQSL7aicfrRe2tgKEQwf5t224bBVUoH1YigP0sNJK6J01g5+uQqNdEBfJjRM2w1CBzAQtx0QHXXetWyp6+czjeZbV4PH+5H+Lwa/3FUP6Nq9QUsB9LMi1BfsA+o+6pBLaDjHvMcwyCPlmRvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gbc7VoynWYlzI9ARjpuXW83LqxFtbNrif1zKI1HWFvM=;
 b=ko5DPLN7tyrk7M1szlNHuUvSyQFnYoG2kykkOxHUVNXCkbpSA3vMqyG+SNpiMDW/M66jJLLsGW1VjUlmGlr9mge46oN/q76lt+yC8+LO0sc8T289p+PaVZ6RVMtxWRy3QwqZ2QSF1PBjMctAGie9If1RE5UxzgejQiXc9nEWK/O24pVMU3tz9uct3CuvxueAUhP3UUYPQrRAR1p5EGjAkgVBWLmLmC9vXYRx+/gprtB5C4RHEeFAIM6qk69Zj8zFv0TYdL4oPnl2xssnb4Rp5nKC/qxc6zvJgK/QBbbcfqkIYzOvTP2Wh79FbyE9wATSK7Vbb/axZSSb3raGn6E21Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gbc7VoynWYlzI9ARjpuXW83LqxFtbNrif1zKI1HWFvM=;
 b=mVwGZKfh+Ldai629BY7pXFR5R9tKdRSrwr1LjpdrNYMLuxmC5T8hs1zHNmwYJ7O1mBSXqTbaf1Q/UTZQsTa2QI8YyrOGFZAG3Xv8W1cRaaWWinniDCC58A+qqFX6ga3XjXhh34ICxXxbju5bdx/QXP+Um4z7NDCyrF5OpD0Xbt0NV22ki30WR9EyNOmp+CyJGp/9jKmN4rmpTcP//OyqDW6P+eV8AspBbl4CgCywx9NdmVzTt9vEi+qsJsxudSKxj+IgbxxCxyM2fwA4JAihSvrniZXIiHTWiMAg2hSH4IzHLezJ/H5g3LUfPrHjXuEdHI4FZ7tL2lBLh41ThRhVdA==
Received: from MA3P292CA0066.ESPP292.PROD.OUTLOOK.COM (2603:10a6:250:49::11)
 by AM7PR10MB3317.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:103::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.8; Wed, 18 Nov
 2026 11:59:27 +0000
Received: from MAD0EPF000008B6.eurprd04.prod.outlook.com
 (2603:10a6:250:49:cafe::2b) by MA3P292CA0066.outlook.office365.com
 (2603:10a6:250:49::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.14 via Frontend Transport; Wed,
 18 Nov 2026 11:59:27 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 MAD0EPF000008B6.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Wed, 18 Nov 2026 11:59:27 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 18 Nov
 2026 13:00:22 +0100
Received: from localhost (10.252.6.76) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Wed, 18 Nov
 2026 12:59:20 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Wed, 18 Nov 2026 12:59:06 +0100
Subject: [PATCH v3 1/6] dt-bindings: arm: stm32: Add clock inputs to
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
Message-ID: <20261118-ups_mp25_clk_syscfg-v3-1-935de791a4ce@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795003158; l=2744;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=2d8WqizkwbFjjE744aYABlgMYG7n6eOoTYhhis8ejw0=;
 b=2iBFOTS5tlIZa3DvA6FNJpmi7A4ccYTNXptr9XW20TWQoFrqeeVmitnbAEid+jCOLy7wvkk7B
 8RiUJi0a9NJAfC8LO+Iz2qukyp80/SihrVnFNLczeN8CI4WD+4Jbfqe
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008B6:EE_|AM7PR10MB3317:EE_
X-MS-Office365-Filtering-Correlation-Id: 33c07036-a572-4fa6-e956-08df456b6578
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|23010399003|36860700016|261009223027099003|22082099003|18002099003|261021123027099003|261021121427099003|921020|261026121527099003|261102123227099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info:
	FyyMuxSD4HD2v7oDSJ8dCfGQ7D1h8r30GwUKvx2fITz9k+phv/VOAp7otZ/VHdAGaytPAra1RCvMhhLin5oWqBUCCLtxR0v1+7r1qCEysflZ/OvdrlQO+ooNgvmasOMz6jWHBVvLDgi4yYUkv+S4mwAJJFahc8+GBCJjsp2hY1145Q6uep+uVBeb2Xju1Zmv6UVhEROe21hNr18Mi9dPa81tsBHqLGBXA/e0jBAPDg3B63RTjltA7rHApJPe1d/9BK4taqXN8r/C84uqMvnP1FGN7YYcqMFvzRq2fTHJ7w9J1oK+wyAoz+zSMTEyFX8fDzZr80kFnhxNH3DMD9umjs4VOIHnoOYne9cQaBDaTCMMLX2LJCQ4NOrlUcQWd2E6H98ugDSF0C0s++aSHC/nB67fva5AYlHdfhJLqEqM2Z3qBhAtyWTBLiL/WvwN7qSl1YwW+1QV3edVLpdgOJM5uGL2itm/Gc+IOwDpa6qTvwsJR+PrucxgKXGilTG/UgU02qpZJvpVUk3jIwtU87JRH+9/yz895g8wdRW4iqnGffS0Iv3IVHbwP3mC2rhIuf7jqyQdIen3tzPS1fX5yobVT+vvrJA++/I/3HEN1DCUY4ERce2QGi6KR9DE7pfEjLuh6A6PouKfYjCnIY31Rkd+tmz/5EkYGDw6G1qJ0Nq+3RHyvJSSLJqy5RlgWdMT1+RgKs/HChfOTxGGv5I36VQS0pTOBFv75xQMFXsWWBBPzhJVuTt68EZ+yDdEMBUH8RFn
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(23010399003)(36860700016)(261009223027099003)(22082099003)(18002099003)(261021123027099003)(261021121427099003)(921020)(261026121527099003)(261102123227099003)(56012099006)(10067099003)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2D8SQzK/cTNt0PIr5IvGeJTSb9lsYz5kxYLCOYAyCKKzOYJIi9tkX8fjbQWJeihCf3FxiXzP1H/fBCIVtCWX3hodg5h2jrXolB185ml+QbCAe0uppZb0dU2vxX4c9rnamBl2L3L5n7rc82tVF+baBsW6oJnOUNtA+/I2k3CAAyTnQM5ibZzc7VYEESPgxU6d9KtIiQAwgLWM46C8gF0mwyxRzrTZf2ibCwxGt/RCesCA+ExVIW6yAuHtYZRNvGEU8TACBdgQZmaUlWONiZwn0FveMjj1XeGHNxdxt5jNS1e9dX/+3xjS4Nf89E9r+h90DiLDFoEwV+OLvXc+lIX1nRu62eIsgs4lXsuKETo05nM+IB9JrKTVWI+NCAvkk72WDZHwO/UHpEBskN0Cg4Zrs/khafbT5PiO8ddfcrjew097wnI0Cj+67a7r7+xSwo7l
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 11:59:27.5099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 33c07036-a572-4fa6-e956-08df456b6578
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008B6.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3317

The SYSCFG of the STM32MP23x and STM32MP25x SoCs is the provider of the
LTDC pixel clock, which it selects in its DISPLAYCLKCR register among
the LTDC kernel clock, the LVDS PHY pixel clock and the DSI PHY byte
lane clock.

Describe these inputs with the clocks and clock-names properties. The
LVDS and the DSI don't exist on STM32MP231/233 and STM32MP251/253, which
use the same SYSCFG compatibles as STM32MP235 and STM32MP255. So the
inputs are listed in the "ltdc", "lvds", "dsi" order, and the missing
ones are omitted at the end of the list.

The inputs are required, the LTDC kernel clock being always an input of
the mux. This doesn't break the users of existing devicetrees: no driver
registered the SYSCFG clock so far, and the clock driver doesn't need
these properties to probe.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../bindings/arm/stm32/st,stm32-syscon.yaml        | 28 +++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
index a559f8b03b84..e94d668d51e0 100644
--- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
+++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
@@ -34,7 +34,12 @@ properties:
     maxItems: 1
 
   clocks:
-    maxItems: 1
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    minItems: 1
+    maxItems: 3
 
   "#clock-cells":
     const: 0
@@ -62,6 +67,8 @@ allOf:
             enum:
               - st,stm32mp157-syscfg
               - st,stm32f4-gcan
+              - st,stm32mp23-syscfg
+              - st,stm32mp25-syscfg
     then:
       required:
         - clocks
@@ -76,10 +83,26 @@ allOf:
               - st,stm32mp23-syscfg
               - st,stm32mp25-syscfg
     then:
+      properties:
+        clocks:
+          minItems: 1
+          items:
+            - description: LTDC kernel clock
+            - description: LVDS PHY pixel clock
+            - description: DSI PHY byte lane clock
+
+        clock-names:
+          minItems: 1
+          items:
+            - const: ltdc
+            - const: lvds
+            - const: dsi
+
       required:
         - "#address-cells"
         - "#clock-cells"
         - "#size-cells"
+        - clock-names
         - phy@2400
         - phy@2800
     else:
@@ -87,6 +110,9 @@ allOf:
         '#address-cells': false
         '#clock-cells': false
         '#size-cells': false
+        clocks:
+          maxItems: 1
+        clock-names: false
         phy@2400: false
         phy@2800: false
 

-- 
2.43.0

