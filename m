Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.97
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795152937;
	b=QASNVJAiT+BrSLzqZKP2de9k3YBeDteFitxrYJLbcA2y3rhVeMNTdOm3Y3DZNBW2ZBmZ
	 PymLyK1DaspvyiMotUIWvdbwoDEkZkmvXqtYLr71s34kovXQ3jeALef2+QY0eHOm/fC0d
	 MnOdyMiymzdCq3KVm7BHFC2oejE5Mfk26v2jIThSViGC+UoLZqhFJn3l2povTA3hT9lNL
	 VO1ndtaeewd3yJzPBnzvi6z7U+t/1tV4SmnltNglNP3pPw4G3NPau1w3VlsIcLbOIbs4S
	 SYyyUo+W9pEBb2xTu0xOmJwSKGQ5nUkEfY85A5sAOb/zG+PhiAz7IkSSfq8EOpyFDVQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795152937;
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
	bh=mWfstaRer0RTfn2VrC9V9A/Lzibw8SdWkutm1jijA/Y=;
	b=BcVLgW+jb7+gfAvyaVTavgc85Xm+6/4hU+BTRVBtuLdz+xZ9oIzsDiaC+6V0DtLRk6/E
	 Z1F8XiiU4toq7nWXr2EXfzJeXX2TnmEYt6hgt/hRN+xYFSPlWfQqDx/BtqcM9MALtKrDV
	 B3xtJr6UcavIwXf0wswxSV4ntiWgqM8vdkXOhjJkj1mNRfifiO4D/M/AdYlQXBJx2i77o
	 m4CgvK8Ssb9EnRkGWFOwhonS2cHepXMYzkXveMd9ZBpl8iHJl6w01LhLFkh9H3tOihLAh
	 gV6Y7WAGTMiahNArIOWOcJaeppBBNzLSx33jsB3JqbrmpiwYOTHr0+6izAgg6yCcJrg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.44.97
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023097.outbound.protection.outlook.com [40.107.44.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2F6606A336;
	Fri, 20 Nov 2026 05:35:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D2F6606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnzNUa0zGoJ5jKtqLvxhasNfVJ4pj/54Lglej+/WasnKeE4pRMje3QDXLIPo5OlxEUBleL3/tsWL6XrShxtIaySPRim4RlnHZ3ylsXqxv9IeaSgCuBFAncqzFjVhT82QEAa/Y+0M6lvmFnpkfGkpFqknkkRr7a0TLBSC0NphmzdDQIycDAVOzIFF0oM4rNj1iUU4IVrCeX2jHuR29iAGv38r6GK0Ct/DiH/VHIPAfteEUjr50mphnsY2QefqCv844JNJNpTlmJObVpVnacfGMcUxXniK1yf5HnR+dlBt3j89CHzAlLEj7iHd5kil3mC+bJ2ZCsaqMA9HJee2f8KrPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mWfstaRer0RTfn2VrC9V9A/Lzibw8SdWkutm1jijA/Y=;
 b=eAY89L5GCQHvcK+pzkK07NtNmv5x/+6h+CtA0AmAMa/c9QCYOGn8aZ3CNxOaheFjjAoLl3IDRVHKW1heh3bDhc/CIv4eTj96tvSSF9n4XXNUJVyHToFCWbB+krgfZOch1pLjltlGzXc6BO9jIvfRF8GSSxPVJI+BtvdY8s6rKJ23dWzKZxrZdx8rpP6kSaYNtrXAS73nhjC0qQk0SwEBXAQMl5FLRTyA5gOAI/uhSxERij8u8IwCO5x1WtTPT22vP+i38bd1b5JQ4vfFLgJFbuvJEsJ+x4LOjjBJ0ZC65Rqpcvo2D9lrPO7kLyQtuPfyghN6nyKFhMvxjz0uhGCG3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SG2P153CA0017.APCP153.PROD.OUTLOOK.COM (2603:1096::27) by
 OSNPR06MB9292.apcprd06.prod.outlook.com (2603:1096:604:481::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 05:35:33 +0000
Received: from SG1PEPF000082E4.apcprd02.prod.outlook.com
 (2603:1096::cafe:0:0:1) by SG2P153CA0017.outlook.office365.com
 (2603:1096::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.662.2 via Frontend Transport; Fri, 20
 Nov 2026 05:35:32 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 SG1PEPF000082E4.mail.protection.outlook.com (10.167.240.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.639.5 via Frontend Transport; Fri, 20 Nov 2026 05:35:32 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 0996A427EFC4;
	Fri, 20 Nov 2026 13:35:30 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	Frank.Li@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	tglx@kernel.org
Cc: devicetree@vger.kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com,
	linux-clk@vger.kernel.org,
	joakim.zhang@cixtech.com,
	radu@rendec.net
Subject: [PATCH v5 1/6] dt-bindings: soc: cix: Describe the Sky1 AUDSS DMA IRQ controller
Date: Fri, 20 Nov 2026 13:35:24 +0800
Message-ID: <20261120053529.371923-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
References: <20261120053529.371923-1-Jelly.Jia@cixtech.com>
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
X-MS-TrafficTypeDiagnostic: SG1PEPF000082E4:EE_|OSNPR06MB9292:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 28250cdb-452c-443f-dd61-08df46c81825
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|7416014|376014|1800799024|82310400026|921020|10067099003|261022105027099003|56012099006|261026121527099003|261026140227099003|261028144727099003|261021121427099003|261021123027099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	nCBeLKKX7KAJ2PPqXF82Gob7Rd4RVXbR/zEIlysa4PlWr6Ss2367LN9BX48bnN5nHxUY9QZecuBo1azo0kmr4iEqvVtg3ERML44qIxXphYa/PM8ypdO4n5zvnFxQfaKWGMRQgwBLeqDTCK0W2gX+aHzBUokjYiN1/6WesjEBW2T1mTrq8iV8jAaaODYkUAHpjOpB9bY0kIPg9cM/1MbKvxa7j7iwFF6S7Q/zsDWrfZT1nL77mRN4O/JpmexuvGEamkSmeVQZMZ13Kmawu2f+uHzikS25getd0E6X1/5mKJbnK+R8jHiONFtKsOdgmW/behFNjbj/pgvJJfhEFO+IIXouKZmypvLHTZ0KaCunLlqR7lOwYsoNg8i/leQiUdy72FLNbW6TgADtQ1UqrOLxwtYr7/NwfS7L/94Ho/S2H2zEwtMgbRLFcCw1+heTlIuUdPs6ZYlVHydITq/hfucR8JdZ0a/KBdXsaq6qPM/PYgnInOWVwHa1dqz+tBPXkuLAQHMnKRAUE3YJkeTNaOd7WzSbCAgkt7cSsKT7XFmr0K3kZSj4z5q1L5FBfxOJRAJ0ooXmEodHE/hq16NC1JcaIRhWpozhAHzmf6AaaYdYnJ7t54ZD934F1ru3XhJAw0zpq2ESwCI924CDd9yPz7a9ZLqWuyiqTEnqrWURp7KBmd4lYLhoqfKkfLvqp+sLj7wlVIJV1VMgWlaMPx+oWAAF2CXSBFRX7oJCQiJ7QjQNizdSyYGvMEV/1XFCsuo6wpoR
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(7416014)(376014)(1800799024)(82310400026)(921020)(10067099003)(261022105027099003)(56012099006)(261026121527099003)(261026140227099003)(261028144727099003)(261021121427099003)(261021123027099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	7HK6h7Bf4eCK3YQThsZRo8CLCPZyvsBlQGArCC0D8pTT49tQ8cp/o7oeJ6oatwS5sCCV/BxIrMKeui0lJt6XcyTeWnVTBgqdrnnEqT1KKL0JyhXXLYvZ+drXs/gWLL3X0CsL7UK6k3UhyLzUtnm16kCN7m9I0V0kSja2FVcq3iW7iZ8CxY2N4x6OosILQPwyPK7ZrnIAgWS6hkCf6YTNy7fPeRuc7rfsqdNZegtJC5GWdPDX/cFRzwpxfqz8wthNdZ4g3zXtgaYc5EOY4G6ts35AKoe3tfEtXW7BliAP6xCPnhQoGOjYjJLfXIvQzftiQqfz6U1B/xnD2luUMSPchh/ygIJ+MSNnvWL7+kcqF4L6kD7qLta7CgUbyi8udsyPRmHo9S/5dE7JX6fBzg1fbEEZha0p+XXgvXI4ED4cqt5Ae9+oaTMSTEivgYJ9Qe5p
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2026 05:35:32.0760
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28250cdb-452c-443f-dd61-08df46c81825
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SG1PEPF000082E4.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB9292

The AUDSS CRU contains a separate AP interrupt gate for each of the eight
DMA-350 channels. The enabled inputs are combined onto one GIC interrupt.
These gates are part of the CRU register block, not the DMA controller.

Describe the CRU as an interrupt-controller in addition to its clock and
reset functions. A child interrupt specifier contains the DMA channel
index, matching the corresponding gate bit; the parent interrupt is the
combined GIC line.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 .../bindings/soc/cix/cix,sky1-audss-cru.yaml  | 31 +++++++++++++++++--
 1 file changed, 29 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml b/Documentation/devicetree/bindings/soc/cix/cix,sky1-audss-cru.yaml
index 50dd0593e1d9..01fa22a5dd72 100644
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
@@ -75,18 +93,27 @@ required:
   - power-domains
   - resets
 
+dependentRequired:
+  interrupt-controller: [ interrupts ]
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

