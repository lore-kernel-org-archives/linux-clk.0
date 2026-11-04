Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793796624;
	b=gPDMbC0Zutk0gY1d7lRN8H9A9cAqaxEK/N5VQFr1X0VfXq/qA2r8+p6o/K9nImT4+zBO
	 k9iJR7yFXYyNBlec51zRoLMcipzZSShb4qSg0TF6kI8HfeDZ4hHKvpBmsDyXCYP6fne1q
	 E22gR+mfAE9/+54IWrx7fFAsmjJurXU2S4TBKKgMSR0eHXcUsMqHJ037U6sFxiN8LLI/I
	 CqlBFSrTW1sd0Mj0yl/WlygTiPm3Ld4IMll8uMPQfe/++eczxXxOXG5NSOUBRP/xfq3yh
	 HnnuPYuCcs9WDBNnQd3jMxqqre13ST1Bl3cD7b7ZjtDZnty6UXBrQ3/aJR22GCsYiAA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793796624;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:Content-Type:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=SESczS/q1YLMBZXT3cKcd36pJ1CvkoXdN2+do27f3Ww=;
	b=3KKIbM2YnAxQVMMreRui0wzyeB6dX2sxwazbMiDgB7bob5hjrPv2szLdnSFqcpRqiX5+
	 c4qQZFYdgEKOHgeJ88QEBlzxs5B+PEIOZs7fVsrjbbYxtZgfoD418D4JQ1b2aJewYtyll
	 I22xT9QzfrSC838suj91KqgWqZOE2HvKv7p4JUgtQGGC3jDEqMNQl4op8P/H6n3MOqPkd
	 mkCgWgmfrY1vSRNciDhA44x3X+BvAJkqWDHu7vF3OCGSUmF2p8FYGEjUxSFz7ZWE19L20
	 6dBPKk03YrxARfze90pRnH1uVL8uH7OexCpr2bJoUpmjHcVTck62DxN3uDRjzAlxEYQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.75.116
Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022116.outbound.protection.outlook.com [40.107.75.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C4A606A33C;
	Wed,  4 Nov 2026 12:50:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40C4A606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mm1IkyH4vsSAzvD2XMkzprEXIPC1ciaQXhV0o562l1mOSNmuJbs2J2AJeh0bpcRKYrwNo8GhX+riiSLygxqj2NBztIXKQ+JEdO2XiHyjOFrOLMyCREJuvjLyZ0dv3EUikW3oElPrhWuOPlqh8+frRLWrX60MO8NYqePQwJXM+gRtzCcH2EuhFgVYHtHnHJQ8d6LxR7SXJA2YT6KVHXwQle1frnMwgEdJaFeb5yfzCLoTqdV8U9MVhtoey4lUOsH0+dPDxSm4sjw0iXWNdYMGqm5zqaJ2giVdw0jDF4Yl957iUu0zQanNwd7IhXzsni4IUa8n6KezHL4E+f8qiTDC3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SESczS/q1YLMBZXT3cKcd36pJ1CvkoXdN2+do27f3Ww=;
 b=Y8X1k5l4n6IaCQyBugmEGZiaPafa3/SCitxbjOIkA8GsDjJA6ijx4edWbJht3J98ojwnA5O3+AOda4sZ7FHkg2Vmty9GqDi28FGdbQbAGOHy5ia/A1YNkygo5W/K6++DMIeO4v9znYCSSpuHdmhr7sZ+XUfzeBZM3IOz3A3CxTeXs6HySwFjRcB60KqRUaPDzop7mW7TSV8Isb/BnUq3RvTL9F00DfvnCau88/vVGo8dyHZ81/IBhLEbuMJ5U0yx5cqawn80T83bfiBmDyyLmZEWWfUyr3UXZtRHZhdbq8SJUx/t328x5mNvSqWBUqITdgFsyynq0b/bq56sZH9Cgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2P153CA0010.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::13) by
 TY1PPF4A2CDB296.apcprd06.prod.outlook.com (2603:1096:408::910) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.9; Wed, 4 Nov 2026 12:50:20 +0000
Received: from SG1PEPF000082E6.apcprd02.prod.outlook.com
 (2603:1096:4:140:cafe::1c) by SI2P153CA0010.outlook.office365.com
 (2603:1096:4:140::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Wed, 4
 Nov 2026 12:50:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E6.mail.protection.outlook.com (10.167.240.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Wed, 4 Nov 2026 12:50:20 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 872BF40920F7;
	Wed,  4 Nov 2026 20:44:38 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com
Subject: [PATCH v2 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
Date: Wed,  4 Nov 2026 20:44:33 +0800
Message-ID: <20261104124437.296753-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
References: <20261104124437.296753-1-Jelly.Jia@cixtech.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E6:EE_|TY1PPF4A2CDB296:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 7a7c5198-9c1d-42a4-4940-08df3a722f3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|82310400026|36860700016|56012099006|261021121427099003|261021123027099003|261009223027099003|261026140227099003|261102123227099003|261022105027099003|261026121527099003|261028144727099003|10067099003|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	DekKW72KU2SYPJngJK7BT+FCZs8PCAzz+jhbC1VyXdPZZzAwQLNrUYPk5jGZuXd+0w8o8Q0eJw3kf38/4vsp97gsMwFrrUAuRuXZfOw6Ev7Wr2uizloTaERnGoC4llah3ILNk9lH9sDisOqVoX8KK1bhtYhg2aOUeLQEQqgopQaK3jQ3YuXT9vCGdUZlneQkPdLVHX3ZcttIXTatiamcdf+PsKgva+pDWyfHwNAAISxbRxhSUDClghlmLOzZ5PrJdA8Lsjh836z3R3uyElH8i7S5JwDmMAht+Psq0ld/ZsC08jXO12rz8pCFfiOjUOlMQOiZEjWIjd6edKw7T2/PMI/qL0isuPgyKr9ixP/8Qc1LygKbm1gxpqjtebIxZa2rjikgfhD/4KtgWrwQFeGY73u1cN+xIoLQ3knZD51C5Q59GpIRFREWHJiA8yf+tBUAUnZeHRFlmQokr5nubHU683I06Dwau4rqEljblVYoJOVNkHWu152VFyWMONKZHLvn45atT2lhbZtz48OGMtuE+DyBDWg+0dlKx2Nk3eCv1vXNjBC6L9flL8hIc/fpL+ofq1U2cUUlqEAcGqz/JLRoxfa//lsge1PpcauaFn2eAplT93xsdV0nBq/TXKg8FlO0k3hSY4lYWe7leHkXSIu7PeKtv7TxGea5Zun8vi5RiPLLs2SQcq1uErGSi+n+XdEj9G40wCqOsGP2ubGJe6BfMA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(82310400026)(36860700016)(56012099006)(261021121427099003)(261021123027099003)(261009223027099003)(261026140227099003)(261102123227099003)(261022105027099003)(261026121527099003)(261028144727099003)(10067099003)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lAqKGEuoRhhmSrBONapvi1VFQFUgRzokd8hCK6KL/mId09ojcqGmN9TbkHt+SCP0rfhMhVgxnUzK1M/ADXnLfswIbNcvw/yr+s/4b0Bf/wdBf9wqj0XnGMQlj5BMIb8LV1JyYikEg/wE1GEfMjb1Yqjr1A0L6fynYKDGGdWcN40+0tYTyWd3UCKR7gz2QB2FlUka7u7LJZ06kKXXm8O4FHrnsnBLQoJyS4syCH/61sqesNlSwhomJ6fIrwUMWt0siaonraTx5wMgttNUCeRlr9+lw0y5qEgveXb8d+EDdXSywPPhRwNkvC9I8JIsvD4R7zHAHq7hD8G5jqQDpD+2lE165ghW47/0HGQx/YJSKRYcD0qCaOFjEe2rrQSSHtKocKwe44XSVP/DA5pUn8v1agXokRcysQpcEva8ZNnTWDzCuTmzHRnjz+72CFcDZC6M
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 12:50:20.1380
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a7c5198-9c1d-42a4-4940-08df3a722f3d
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E6.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PPF4A2CDB296

The AUDSS CRU contains a separate AP interrupt gate for each of the eight
DMA-350 channels. The enabled inputs are combined onto one GIC interrupt.
These gates are part of the CRU register block, not the DMA controller.

Describe the CRU as an interrupt-controller in addition to its clock and
reset functions. A child interrupt specifier contains the DMA channel
index, matching the corresponding gate bit; the parent interrupt is the
combined GIC line.

Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
index 50dd0593e1d9..aa0c557abec0 100644
--- a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
+++ b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
@@ -28,6 +28,12 @@ description: |
   The SoC syscon NoC (or bus) reset is described via resets. The audio
   subsystem power domain is described via power-domains.
 
+  The same register block contains the eight DMA-350 channel interrupt
+  gates at offset 0x54. When the node is an interrupt-controller, the
+  cell is the DMA channel index (0 through 7). The corresponding gate
+  bit is unmasked while that interrupt is requested, and the eight
+  inputs are combined onto the parent GIC interrupt.
+
 properties:
   compatible:
     const: cix,sky1-audss-cru
@@ -45,6 +51,18 @@ properties:
     description:
       Reset indices are defined in include/dt-bindings/reset/cix,sky1-audss-cru.h.
 
+  interrupt-controller: true
+
+  '#interrupt-cells':
+    const: 1
+    description:
+      The cell is the DMA-350 channel index, 0 through 7.
+
+  interrupts:
+    maxItems: 1
+    description:
+      Combined DMA-350 channel interrupt after the CRU gates.
+
   clocks:
     items:
       - description: I2S parent clock for sampling rates multiple of 8kHz.
@@ -75,18 +93,33 @@ required:
   - power-domains
   - resets
 
+allOf:
+  - if:
+      required:
+        - interrupt-controller
+    then:
+      required:
+        - '#interrupt-cells'
+        - interrupts
+
 additionalProperties: false
 
 examples:
   - |
-    audss_cru: clock-controller@7110000 {
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    clock-controller@7110000 {
         compatible = "cix,sky1-audss-cru";
         reg = <0x7110000 0x10000>;
         #clock-cells = <1>;
-        #reset-cells = <1>;
         clocks = <&scmi_clk 76>, <&scmi_clk 78>,
                  <&scmi_clk 70>, <&scmi_clk 71>;
         clock-names = "x8k", "x11k", "sys", "48m";
+        #interrupt-cells = <1>;
+        interrupt-controller;
+        interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH 0>;
         power-domains = <&smc_devpd 0>;
+        #reset-cells = <1>;
         resets = <&s5_syscon 31>;
     };
-- 
2.54.0

