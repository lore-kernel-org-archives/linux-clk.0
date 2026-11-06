Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793928927;
	b=ljf0qH2CcKj+rN+nbz5K6qOEySYouzWhRdOfUt0EBiEnY/9HJ9ysx3en/xtq6SouCO0b
	 ZC8P5JgS3IQ+ZX8IA3SIcMlaX/+VZ+PCuvStIVqxHZABGZeqRiVfI9QjHUZfLfiScySYy
	 HF0bu6gLLb1ettdV1PEGx6rvUaGuDVKQXtK9bchQbq47sacv7mlYf+B0QvwVuuEP4WbbT
	 iBZy2SV1Z4FHcJfDVXOgfjmNFo54fRQsciD6D1+/AULQrfmIH1JfOJGsVC96E5+b6HUCu
	 XEZY0D1T+RgNCeYWn0ho67w/j42NysY0K7hfVaY/Rsp/+8c4l3A9EngUOvzx+aU5CHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793928927;
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
	b=Mf81UHs7u7BHjeNKn2Mdicfr7UchXA2YYxHq7f9MEkeaokLWCoEvDUGk98F+5hcJmA5/
	 Ut1csnbyWrgxdljGHzpfkqBIPX5A1mzFlY9MhHow5SVD3xFiH/qG38wonMAvTOuVW7+rG
	 kqeBEIvqjTm0ljOD1xd9TamtvqNZJT1dg5zDrK4DPuCSPyCquEg3fDbfwHWAnnUgYz0fW
	 mgK9KCHFL1XlEiqflDDjHKc13jBX70UzUN1sjHQCR20hWt0Qn9upwS847hu2/usnjvOaa
	 8eCgpG3DwD3dIJV8w4BFiys5x1zUPkwKbjS5Y0uHZuX6ApNaPHcIhW5DW1AH2Ci9rJw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.116
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023116.outbound.protection.outlook.com [40.107.44.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B4A5606A328;
	Fri,  6 Nov 2026 01:35:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9B4A5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Is7lazxH+6VvWQ3k/s4CNP0urufAOFr6+DHtw+rkasIhY9KWvJzOoD3Ow7NnLnf4WI7v6AILRVGePIUkBP0NIL0igTc2Y96TDfjTM4UnKU9dE4faVVnfcLbp7tY7N5MQpnu/d3NZSrUOjiDwibIspIi2TSmdHuRHXhJM3JCYCQ8DEAfN2POBJbvCS5UVcaF9kPM85QmUt+Ut2eZUcFdsBvWI7LZJlUO0is3KZGzdQb65zbMNHbdTCoLWqiTZZlCMQwhcQ68IyEBSdKXLMTPlbeZTTbXci4wtcwhqsxm12wQNkfytl2mk2DbwyaC49KpJah3snRkgkPyPOAz1wMseaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SESczS/q1YLMBZXT3cKcd36pJ1CvkoXdN2+do27f3Ww=;
 b=ikWxtEgVyiu8D95ZNDN5VYilBnMqVf9Bngqwn/X/8cvy8xl+GkiBftKPMmAYCohPnEHdeBPiREC8KBGhxC8bT4Yqc4kDVpfk53xVmknXXbwXNUioSvp2QZm7xBBV3G4F0R7bxIBUHsfTh5Gz1CfG13TrQUAujxDZIo3tqapAwMzYAwW77gp7gDKzRse3eKw7MADNoLOAkd8q32pClRImFtBLHHZFdHv/kScDADWusbUzF3jaLR49M4iMOkLYomiqQF+8KEAqgHX6hLlQ7Y4cSAqvzfj7xhnwVnaa4R/WMDYItTKbjMmvg5f0opD7r+VpPB1GP0NwEkGw7uPs0vULug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from OS7PR01CA0131.jpnprd01.prod.outlook.com (2603:1096:604:24e::19)
 by KUXPR06MB9059.apcprd06.prod.outlook.com (2603:1096:d10:67::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Fri, 6 Nov 2026
 01:35:22 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:604:24e:cafe::97) by OS7PR01CA0131.outlook.office365.com
 (2603:1096:604:24e::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Fri, 6
 Nov 2026 01:35:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Fri, 6 Nov 2026 01:35:22 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 2539E4102E68;
	Fri,  6 Nov 2026 09:35:21 +0800 (CST)
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
Subject: [PATCH v3 1/5] dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
Date: Fri,  6 Nov 2026 09:35:16 +0800
Message-ID: <20261106013520.1134450-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
References: <20261106013520.1134450-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KUXPR06MB9059:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 9e0913fd-1a7c-4109-94e4-08df3ba63981
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|1800799024|376014|7416014|261009223027099003|261028144727099003|261026121527099003|261102123227099003|261022105027099003|56012099006|261021123027099003|261026140227099003|261021121427099003|6133799003|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	8YdyaEJxD2VIWZZSr2N53w8a9pl709f/78oHacmllZ2LbqPXBcPfvz1Sa1RQNoDnQnQrPi+e2BqYTLAm2RucduSYhxLlYeJF7BRjFSs42oqNL16pXV9OC1c00LF6c/lENzrMx7LnqwmhvWDH2XtjbXhEwqJiIJKzGjgGAkyAd/E29g4GJSUdJQNwQkKdTaQx6VUTMErdlr2GEtteCdul3AAWvs08HNZ9JP3+h/ulXaOtcozrio7qjiqCLYP7Cq7z63KxaB/fykqrnQPmm46iDj+9msMbkdSBQ32aXfQkh+VR3uvCvqajpfvjpsLvCyPlsOgEgS7g9a0HGsGvniVwCzq+pKBGzzw6eaoI+i3JFXaeODlvyzeubSbYcFqxAGeA6ICsT02w+lZmJ9wXuHfhUibKakcwcTrgiy00zC5Zl57gO78xz/GNbTTJk19s4FvLqQ9h6CUsPsPFgK8bACIjgCxcPlzEzz+5i1h2rkbXRv7t2A3mxPKqv8/+Bbll+iSh6wLlbJZMWyHuc3BUyaHa7Z091c7f19WQXkwogd4XMw4vZIdfPLatU+A9qFAlqYfhR6jp2aKgYRCSQ7bxgH7yZcxaavwRC85Ct8w1k3b+St0LirIhahRPIlu6hpTU4Uxin/AImzZmlsUHiKnGAJo2PbVFhZqcCOysTya7BMBHOXixIsShkFqLLAFk8VdQ+d8mhQYcN+CM3cc9nnJDPB4Eeg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(1800799024)(376014)(7416014)(261009223027099003)(261028144727099003)(261026121527099003)(261102123227099003)(261022105027099003)(56012099006)(261021123027099003)(261026140227099003)(261021121427099003)(6133799003)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	sLkoCad3blkLvzM+0TL1BLK5tDet9RqRXRv0AWZ3Pylf1vgL/16ZoCkHGMRHPJjdIGDUUCXhSxFqavGDk3Qu2WkKrsvQFJ9Jdg/7jhaianwtAH0/73CDOFMFRI3N7CvQ5/UvwQ0a/e8CBNK5ZXjdLn6QnDnsF4AtGaL2lrMNZ0dlEfap4o4Q8FtVoawBQ+G4NOM8Ftrn1FthWaAa1dKE7OmQhnDB+0W5IGfRMwURrSAkmqWS8MH3KxoZu0e+JaboQgWeLpKcTlwFl9eWbsf5DbeANRlhzjihrNy5QuJYVhkmy/EV61mTihSHtVjmx5uTvwrCqOLW0f1I8dXhEHZgWLE/Onsmr1nO4QCPOAL9KFtippxtRDmdjpTgOHwbCghqoK3IrjvjAf7hrpQ1D3pi7QBP+4EAcHGQza3qw+tk0i+zzafM1RdNiyZzCJTYDHR0
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2026 01:35:22.3026
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e0913fd-1a7c-4109-94e4-08df3ba63981
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB9059

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

