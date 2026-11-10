Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794316231;
	b=g8mPACB455lDq2K+hpNsyyl1n9+C6BLrY9/HzyarC/awIfOaglrnXZAUtULtMnTl094r
	 VHZztsEPS99Ia13jm7LmmDsrbKeUjAvXRtY1a2RTwVnkyBXsR2R2FXw9Qujrw9iItBpeu
	 5kMh8/ZlUWvKc38rV6PU7jAeQ+DNrns5we8rHylOnHr3+RduhR2Jfr2atHNhLKX1PE0Fu
	 27O86u9CS8OwyGKS/7g4jCVwZk3jMB7cSFlz7GQgOuv0e+fR9viVPsGA4POjZ5eBkQaXh
	 hjxAEZ/D92LVvCgtEdLlzyAvId6bahtWCe1HhUgRh9NdCEN3NWWotpDxu878CEgUHvg==
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
	bh=tGJSIuVkn8iHOfERY8I48T9rFQw68B6AkQttNHeM+NU=;
	b=19Ym7Kh7zqiqTzEMTWgL3RBFf31v7SrxHbaKMp7+7C6vcSNrmtQRyhqAcEMBjdmDoRx4
	 TEbXU7EVbGCjmsmm6bGR0HfkX7hbQjt4p1g3CYrSY6+mEhkxPcqtLGBTJCmnbqypmFhXF
	 KE5xXxGJYeE3NJ04RN5Jz7dcfjT2fjWPKMekUboH+CbGRoqHcQtbPlmxHdrgVdyAax3aq
	 Ldqh7Zx7Nr/W14Kcef5OlH+g8/BhKo9hYKpnKGq2dcQRiMC1qvJl/bL/4dPyNxNcHBttI
	 Cty/pX0duPV8X09KbawPRKCndu8p4FdVIRDhVYDKwxIQo1ote+nAnvW+9dbu6kBSB7g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=foss.st.com;
	spf=pass smtp.mailfrom=foss.st.com;
	dkim=pass header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=REbRW5qv;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.13
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013013.outbound.protection.outlook.com [40.107.159.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AA3606E45D;
	Tue, 10 Nov 2026 13:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 78AA3606E45D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=foss.st.com header.i=@foss.st.com header.a=rsa-sha256 header.s=selector2 header.b=REbRW5qv
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qOGKSLTqcr4XTXSCiYhBdJptpEYlvIeY+YKCmLPxU6ZF3LX0DYwBYNtzZhLg19CTQ2BsY2f7MOTflFGWIIwsxoFAlZpR3eAnQ1trpxHZrinVv8VkdLhngNpeCWtHL2Rw4jSDUaRcvbtqvS9iF7gzK6Ra3CaYcYlWrrpmL9QiMpnCjKO0/YSm3oMWW+6jxl7aEewO6WMb6FTd7SwdzjBG/IesQWZot1kdCJ18zkmyn5QNKkc6VA5uoc2NVZrJCygyYnGIL4ZJxhgmo5dTjDhrrEejpDRBn23V4pumehirV7N8UD8DJWkEwjoE1j/u8jYf/vh0MBtH5OLN4FNs0svovQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tGJSIuVkn8iHOfERY8I48T9rFQw68B6AkQttNHeM+NU=;
 b=c4MCU/HgCE+IIq5+mmm5ChJUsqmsUtBQyGrHxKd4+oET8toJ4bUP27f2hPErA2wLFssWyVe1DCPizGmVwp54UAaZez6Wr1AsoWaNzxg3V1fITA83fc2WBwlO1BEpWowTM0NefesdZvwvdTLLmDyAcs03vUshIuLUPTDx9HN0Is5Ik6T9fLqvEno/QJaAQdSOUFr9Dcn/8T4GMGOTfuJjIZp+jrAuWDQPxp8fvfmkVTpXDV3jLqS6IxRkv/FDQ8wiotAyPLqSVPiApIVY5/mCaoETfAGPfexLkp7gCaRpUD4InLHoFlYa9cBPEgV7bt618DI+RrvI2cJncx2PvbRfqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tGJSIuVkn8iHOfERY8I48T9rFQw68B6AkQttNHeM+NU=;
 b=REbRW5qvZuZWohPCZDg2QF6ud/ZaE0mcWBpdM1jONty5S+p2rBr1R8BD9jVEDhIfwTyDXrUcoh+KT1KT0W/Ak0Oiad80/fGiMAfftA5410xjROjZkrAupe3cIKxRX9ZsMEjWqgVX4grzVqNb7yzXfQyBfh8AGxlESLG29wm7wVm2enjPxRjKvD5kVphqZ4+iA6b6Ly5LsMw9268ETNLCc9BD0H/Evur5/UfKY2WOvirZDSpvldTpQGSj3CcvMpbp0T0xGkYUqFfariLcQu+ET47x/kGSe5TgyEbZxEDZXROiAa8Cm4aVcET6BAv5o31C2WpJhkOqTfAPOYo/rku0AQ==
Received: from DUZPR01CA0148.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bd::15) by DU4PR10MB8758.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:569::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.7; Tue, 10 Nov
 2026 13:10:23 +0000
Received: from DU2PEPF00028D10.eurprd03.prod.outlook.com
 (2603:10a6:10:4bd:cafe::87) by DUZPR01CA0148.outlook.office365.com
 (2603:10a6:10:4bd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.8 via Frontend Transport; Tue, 10
 Nov 2026 13:10:23 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=fail (sender IP
 is 164.130.1.59) smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D10.mail.protection.outlook.com (10.167.242.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Tue, 10 Nov 2026 13:10:23 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 10 Nov
 2026 14:11:03 +0100
Received: from localhost (10.48.87.14) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Tue, 10 Nov
 2026 14:10:22 +0100
From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Date: Tue, 10 Nov 2026 14:10:21 +0100
Subject: [PATCH v2 1/5] dt-bindings: clock: Add STM32MP25 SYSCFG clock
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
Message-ID: <20261110-ups_mp25_clk_syscfg-v2-1-624559bb8ec7@foss.st.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794316221; l=3828;
 i=gabriel.fernandez@foss.st.com; s=20261013; h=from:subject:message-id;
 bh=fy1KG8oAg37hjHf/FL9Sb7az6BL9hyVztYMzrK4RWTI=;
 b=2FaDRTC3duck1AluVG8oqe+wAOso/Je9aBozXTduMKDnkfEW2z3iBqyYBl9zjYfPBx+3852pJ
 vY54TZp69I5AhVAzKgR4M6OiXMiqeE2TIFtJ92+YSVvWyOqAZqyNykr
X-Developer-Key: i=gabriel.fernandez@foss.st.com; a=ed25519;
 pk=BVZE1QjIfcrviw9RyyOGQGGsg9CNbaxyjYn9pAlkNyQ=
X-ClientProxiedBy: ENXCAS1NODE2.st.com (10.75.128.138) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D10:EE_|DU4PR10MB8758:EE_
X-MS-Office365-Filtering-Correlation-Id: 6aee1eab-9a78-44a6-58df-08df3f2bfab9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700016|23010399003|261009223027099003|261102123227099003|261028144727099003|261022105027099003|261026140227099003|261021135927099003|261021121427099003|56012099006|11063799006|3023799007|261026121527099003|10067099003|13003099007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	h5/l5skgd/6/0OOHNmXf9/fGmIEmlMiDQ0b1fk+jDClZXrQuR8s0d/1nWrHvGbHDl7BJulH8iiad+YZ61ku75sevG6XOeRi5JvfVJjsCoZEvYTY0i9bagU+RxvU6UqynXYVvqcIhpeFcgEY/3RhngloYlw873UjLwYPg4QF3F9vX+w04eDxc17nij1NuSM0FMjFK447rr5W+iIqDV7Fu5OuYH5d4zBICBrNq2Ml/+am9OcHR5I5HlQs8lkkzQHB+Y7MCUbgZn3lyNzlGhoBhOkB2OTpnwhF8UaqMW/r1ncyXwOPro6OJLr0+bsorwxzWp/pbLDxlontBYFUI5OmtH8LSniWzedSbxD5lHKFOzIITyh/uizpWtEcBFH5UpsRJvZliWDiBWVKcS/rUzi6NFvRN4fCnKLwq3JjpQ74zZOugxWueFxLWYumsHhUlw2C/RjrSXieQtiCe5v0NW78siUAO0Yh0AJKnSJ/9ZjDIncGGRk3C6/W/a2m0sYDSimerFLKbLLzJzPiTJ6xKivGI8naH4KKVA7TgTVxLK9fQcAin/wuCFemCuVuWwcI6OpvFHvy4FB9sDSLZRT1zc0K+GqAPqt66vS/Gpah5qFeWo2SnHbf54hMYB8TXL79/jWEx1JzBpMzzOmRVWpVVMDsiAQ==
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700016)(23010399003)(261009223027099003)(261102123227099003)(261028144727099003)(261022105027099003)(261026140227099003)(261021135927099003)(261021121427099003)(56012099006)(11063799006)(3023799007)(261026121527099003)(10067099003)(13003099007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hbC3NbtPe3aSweNUTMtl3W7NlzQ2Gszy+vz2pZe37rdM6LV/VW7yDWSLq2dxMMjuYeSpuNcmVBTeVtsjYsdusNEt7x1NA/7G/D5ZkkVT9SAyDxKbQ2ZDbGXs9ejNAYNIzWp3ZMwgWJ0pnboDoXouKjamqG1jnD0kQi8P9C0Q6uGtcoToeSbkP4TupJqeqRiHO3peljdK4bqBttbIMceHp9hvEhz8WqmXFdMYPdwqm7B8qMunmML5gOxYZIyCEp+QmpuUFULFWdaXccacwSMccLmr821kTZlDooUXWjjFaTz3gq3FzPiMq1BXuOT1f7O0FJjNSXwfXxmCAU+yQbk6YFcl3PK9/NVOThDtxCkY2opS8YnEVENoMbMOqegFZ+KbcZNEbKUBsnimCtNihUAkDocG9cfeZPpE/OfV8KWH0oIx6GaJMsAAFNJ0TffUUNsv
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 13:10:23.1306
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aee1eab-9a78-44a6-58df-08df3f2bfab9
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D10.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8758

The SYSCFG of the STM32MP23x and STM32MP25x SoCs selects the LTDC pixel
clock among the LTDC kernel clock, the LVDS PHY pixel clock and the DSI
PHY byte lane clock.

Add the binding for this clock controller, described as a
clock-controller sub-node of the SYSCFG node, along with the header
defining the identifiers of the provided clocks.

A sub-node is needed since the inputs of the mux can't be described by
the "clocks" property of the SYSCFG node: the SYSCFG is a syscon, whose
first clock is taken as the clock of its registers and enabled around
each register access.

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

