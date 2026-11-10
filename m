Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794307345;
	b=ok82Zc2aa2CilFG6u9Qync4AX2Jsb1tLDXQMmt46HRDM1HTcuhA4sFub7tJ2aJ1xfqN5
	 JhAopfQliP+2kwiH2cg8GKa5Q2nYDvY/iXcO/k3eLbXf+KV4ZuleWTBPoPjqaKZD6IHcj
	 RnO2Fys2YzI1F7BZ1t2V3XHvY/1x5CGlGCRtb+G+hR00yclvXjJ5Nh7bAjhQD5YSF5GWD
	 bNvJgxT/mahpIqVBQY33oh1SwZhFJPfk/hCnTQMzkaDPJK6qIpOlXJrLQNOyYZphEOSzo
	 KsExD40brurYvA9QeWYD8ZsD5QH/4lww9NAcEMy5UnG0ryLxswqsfJQNscrdPg8Y3fw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794307345;
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
	bh=8nzNZ+7DFggSD6/70h/NqH84134knfrrcaEjFtbNDRA=;
	b=PxlbSnfr3OG9HGodkH71Y+z0+K+HF7ZivfNnAi5akwGjyqSbeSXV4CXlttLhkOfepR+O
	 eMm0mbQqhtgZhg/SsTBT+8EDw2/hmrGw9pn8qTC1s3SLKzpuw0MEk/JqhY8AyrMf2gG/s
	 GabqtnsYSpARLi2mVw/x21YJcvbPWAUWeFM9rAYw4NqquYcTouXFypaEv64l/MGoNFH0v
	 q6Gfyo090mgOdB6f/mqZ+UKHbT/N7x0PM6U605qfXkmRTA45d6jKOEgRUNcHPPzMmKsW1
	 5/pJRBF8FBClLJ9Stfa3pDwdvNsLIGkoRTf3OZunHV4lBsHxRmA2uLDJGTrb2wl3e3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=m06SWyFB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.44
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012044.outbound.protection.outlook.com [52.101.66.44])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167B3606A321;
	Tue, 10 Nov 2026 10:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 167B3606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=m06SWyFB
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U4s+U+qgNqDtKqZzHTkA+GNFJd2On3KAn2bOubfCkckRHkAnQWZshvH71jB8I5hZrJY0A9+jVGEUIwSfns8EDo0GeW4zzpAYjH3IrwG+mXIr4YJDRWHLuw+w5GfOa04xOt5gBfUZfLZy/lT+3CrrqhuYfcLCzh+ArydgNu74ZQbH5ju3MbWVDtHOWqO2Jj9VOh0OXzh+sAyBdZOkNgy936ZHfQHCuXfCNQfnpRZORlGfJZoZZDAt+tJnICLFmES0fOFyi4qSm7eZDRDLmVC+melnQpvPGd1AKTxwRG76KuM5ihFeCHolvbosu8vM2GkmoxgBRqZ+9Zwkx1pKPTzSUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nzNZ+7DFggSD6/70h/NqH84134knfrrcaEjFtbNDRA=;
 b=nFEjH8uAWyyGrjExRHCG/dZ8MKvt8UHNuVt1avH2csWOxqk4Ml7qR6rnMN4xF4C4ErIE9zMtarUF/E9Xsa+W9OzFitjYagjd2ByYIsaJ3J8SZWSQBnlHPM5nt+sVXJSuNQ9qQG11qSlDo7BvnWTq/WUGjQ8m6Qovzrd09btSLprcPdObPY3/ySDnnfTO1SyrVFtiQd2mHngBHvlGq9Kv6zm1J0TFOc7+jt0eZRxMXgF7BMOskANJeSSuRr6IhjzQdaa2PUYM/omwdJpG41peIQpSCjmogEAju/fa9MeSsgzO3hRvHEHbnMesBWSYF1lificR4vAFhQwASAYhfaVl+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nzNZ+7DFggSD6/70h/NqH84134knfrrcaEjFtbNDRA=;
 b=m06SWyFB0KiJGmH25KdBLXk7II2S/B+XWDUieBisPu4mTaa33754VDJvfvspdftNNP6EDyjpnYZ5kA3eOyVdzVtDMX6QC1V/0SZuR6+nZOqt84qEuGF2SZAN2p3Z16pG72kGizICrWa5dNDK7EWdxcGwkN1WHnCEX5RVFkQDMxH+uYWll0oe6cqyud+VCdQdW8D8fQfFIdKapFJru62MDRMW7pjsO/zU1YUvYsLfiyvmdwZMMd3MDnUao/hqZjujHWbpnQQamRXnatZ9hIa5Z6Z+u4eHm3SUYrUnnfdFL6Qgz0P7eFlDIdFVJnpcA9DAXeaYGIWdDZRfgLccTUWhNg==
Received: from DU7PR01CA0039.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:50e::12) by BR0PR10MB867675.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:2c8:5f::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 10:42:22 +0000
Received: from DU2PEPF00028D0E.eurprd03.prod.outlook.com
 (2603:10a6:10:50e:cafe::55) by DU7PR01CA0039.outlook.office365.com
 (2603:10a6:10:50e::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 10:42:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.60) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D0E.mail.protection.outlook.com (10.167.242.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 10:42:22 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 11:43:18 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 11:42:21 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 11:42:16 +0100
Subject: [PATCH 1/5] dt-bindings: clock: Add STM32MP25 SYSCFG clock
 controller
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
Message-ID: <20261110-ups_mp25_clk_syscfg-v1-1-667829cd290a@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794307340; l=3587;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=nTh0J6mc25gfI4XOsNXAFWvP3bq2c9SPrzMjHFRT7us=;
 b=hmmo43WPjTim+pW4OYq+VlKhfUy5z+SMlz/B6RTl9L2Bm9xmyAPZybwBDKcO9F5K/4begwiFV
 4UZw8XyhRs/AL6h+JKfw6pRT3zRiH6mfIylIVJLjp+ZZRhKlWvyOSJN
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0E:EE_|BR0PR10MB867675:EE_
X-MS-Office365-Filtering-Correlation-Id: d2fbc012-7616-450a-114b-08df3f174d47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|376014|7416014|1800799024|82310400026|11063799006|56012099006|261021135927099003|261021121427099003|261022105027099003|261026140227099003|261026121527099003|261009223027099003|261028144727099003|261102123227099003|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	U5YYNQTnjVHGbre5i336cclgxwUeQ7CngMgCP/KWXWYWWaNnmMYMr6udWCGTQPvcNEQ6KYKdcn0mS0cmIhKYrmVl+8IxXK8ZvbBtcHP4xM1Z6y55ngANj2aCTjWNdT0BugfZ7tSgwL8COlXjsLskD1eqC+uozH1bEsjPy9EYx6O4oufOnAspZPp+H5STCXKaWKqiINRsor3p+VX1fy11QQWu2+XBRVVSllI7Vqi2XBy35nhMfK7YGPpJa4cqXEtBDwmubNFI+wZUcz5eaZT7VJKnjFFYxv5AFk4sKYAo+8jsUEZLDO/SSkW0+Ca8V0H2UMdCpR6oJ9Mj2He/U1w5WrUgmNXIeZhDdF/RpD9EkoAs9K7P0phSa9xfqTh2qfzeIuqz9utyJkrxUl2JtFosNVZGqGog7PacGos9E22WEpaEnx5f+9SuDp3E5lVy8qlub/CLxXFgpQxgNVhSWmkcroLszouX+5FoHDZlEIdGPvwrwixTMMycJ05N2AMAL0An6M72O8zjlm1MmdR3LMj60/GKv+yBYhObeUyYq5ctqSOcFr2365ebkVnAeblKif+yhpLhPtVrWaxqVd6GqYgpb3P1UAGdMxY0jTWlvwmJPG9fo4EX2OnE8YfLN9ExFB0BsfGzzA2r6qEO5jgmPP2pvw==
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(376014)(7416014)(1800799024)(82310400026)(11063799006)(56012099006)(261021135927099003)(261021121427099003)(261022105027099003)(261026140227099003)(261026121527099003)(261009223027099003)(261028144727099003)(261102123227099003)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GBUU3/WYzAFzwENCnSxNTinlrMbfLcHt4/MppZGOdlZP21rkGPGRk1Hr6Zv93vON63v+93twQACH9OHyNLPjby1t03jSqVr4ZJtBoXh2Za9TmiLE99/5XWHdNpzdu6VLL8I8gwwajjPN45i9Uta16ZUqpjXdLnToVXpW/mD7ZlNcVwHo2KG44SVYOifJsqYkguC4peNtPU/Y7qGYGAs2Yr36G/2lfcl/XySqZzt/wrm3FnYXw62ot4mEPMMjAaMPVLZSEz4DfIZ7JG4VyM06RF/mpesW6DkqQGySkTTmc5MA9IaFilBVfyWoUXDUj3si3kJBcFyUNtc3WiPbIhaMDd9z1Wl0V+ezOtSH5vtpDEaW3MQ9YQJDXs6/eXfXgcCjNNwPOHZD72pwnCTEM6sgbzKEeyFaiDaxy7pUjklE2rGeuANVg98pztt31Z12C548
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 10:42:22.2004
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2fbc012-7616-450a-114b-08df3f174d47
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0E.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BR0PR10MB867675

The SYSCFG of the STM32MP23x and STM32MP25x SoCs selects the LTDC pixel
clock among the LTDC kernel clock, the LVDS PHY pixel clock and the DSI
PHY byte lane clock.

Add the binding for this clock controller, described as a
clock-controller sub-node of the SYSCFG node, along with the header
defining the identifiers of the provided clocks.

The inputs are listed in the "ltdc", "lvds", "dsi" order so that the
ones missing on a SoC (no LVDS nor DSI on STM32MP231/233 and
STM32MP251/253) can be omitted at the end of the list. "#clock-cells"
is 1 so that the other clocks of the SYSCFG can be added later without
changing the binding.

Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
---
 .../bindings/clock/st,stm32mp25-syscfg-clk.yaml    | 61 ++++++++++++++++++++++
 .../dt-bindings/clock/st,stm32mp25-syscfg-clk.h    | 12 +++++
 2 files changed, 73 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
new file mode 100644
index 000000000000..027d14f28b0c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/st,stm32mp25-syscfg-clk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics STM32MP2 SYSCFG clock controller
+
+maintainers:
+  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
+
+description: |
+  The SYSCFG of the STM32MP23x and STM32MP25x SoCs provides clocks, described
+  by a clock controller sub-node of the SYSCFG node.
+
+  The provided clocks are identified by the macros defined in
+  include/dt-bindings/clock/st,stm32mp25-syscfg-clk.h:
+    - CK_SYSCFG_PIX_LTDC: LTDC pixel clock, selected in the DISPLAYCLKCR
+      register among the LTDC kernel clock, used by the RGB parallel output,
+      the LVDS PHY pixel clock and the DSI PHY byte lane clock.
+
+properties:
+  compatible:
+    const: st,stm32mp25-syscfg-clk
+
+  "#clock-cells":
+    const: 1
+
+  clocks:
+    minItems: 1
+    items:
+      - description: LTDC kernel clock
+      - description: LVDS PHY pixel clock
+      - description: DSI PHY byte lane clock
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: ltdc
+      - const: lvds
+      - const: dsi
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
+
+    clock-controller {
+        compatible = "st,stm32mp25-syscfg-clk";
+        #clock-cells = <1>;
+        clocks = <&rcc CK_KER_LTDC>, <&lvds>, <&dsi>;
+        clock-names = "ltdc", "lvds", "dsi";
+    };
+...
diff --git a/include/dt-bindings/clock/st,stm32mp25-syscfg-clk.h b/include/dt-bindings/clock/st,stm32mp25-syscfg-clk.h
new file mode 100644
index 000000000000..74673942898c
--- /dev/null
+++ b/include/dt-bindings/clock/st,stm32mp25-syscfg-clk.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) STMicroelectronics 2026 - All Rights Reserved
+ * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_ST_STM32MP25_SYSCFG_CLK_H_
+#define _DT_BINDINGS_CLOCK_ST_STM32MP25_SYSCFG_CLK_H_
+
+#define CK_SYSCFG_PIX_LTDC	0
+
+#endif /* _DT_BINDINGS_CLOCK_ST_STM32MP25_SYSCFG_CLK_H_ */

-- 
2.43.0

