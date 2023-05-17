Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B9F5C77B7A
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 07:35:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230029AbjEQHfP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 03:35:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229967AbjEQHei (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 03:34:38 -0400
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF9084487;
        Wed, 17 May 2023 00:34:28 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34H7YI9l011997;
        Wed, 17 May 2023 02:34:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1684308858;
        bh=9XO7ZFTOBmVgS5wVPw7iT0N1BbUDchcd1kg31gKYM1o=;
        h=From:Date:Subject:References:In-Reply-To:To:CC;
        b=kGc8XyLi5xXUp0eQdlDg8SgjpRS4JcfA339CfwFxJS7MOr4xeJImByXWGTjlk8xcP
         U8OW2JNmpgpubiioiwmdKtpv3jApqoGgPeYRzlomi151A+VNEmE0KKSdiczHpsentT
         HITGEPDf/O30EGR8befE1ouDuI4D8V6EPtOAB8zI=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34H7YImF025730
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 May 2023 02:34:18 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 17
 May 2023 02:34:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 17 May 2023 02:34:18 -0500
Received: from localhost (ileaxei01-snat2.itg.ti.com [10.180.69.6])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34H7YHai014979;
        Wed, 17 May 2023 02:34:17 -0500
From:   Jai Luthra <j-luthra@ti.com>
Date:   Wed, 17 May 2023 13:04:05 +0530
Subject: [PATCH 1/2] dt-bindings: clock: Add binding documentation for TI
 Audio REFCLK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20230515-refclk-v1-1-5e89f01d6733@ti.com>
References: <20230515-refclk-v1-0-5e89f01d6733@ti.com>
In-Reply-To: <20230515-refclk-v1-0-5e89f01d6733@ti.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>
CC:     Vignesh Raghavendra <vigneshr@ti.com>, <linux-clk@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jai Luthra <j-luthra@ti.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1507; i=j-luthra@ti.com;
 h=from:subject:message-id; bh=BubXVHygbUybZAeOGucfV4lt84XX6gTLRp9Y3aceZ6I=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBkZIN3z7tc7Q/0etkDb7awFW08DJhnDBy3u3K4c
 UU4j2rW5LOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZGSDdwAKCRBD3pH5JJpx
 RftwD/wMP2rF9Gq6N8CfAsvdKB0NbJtXuwmCJAUYAVcN+aQr3pVCfQyo5r93J7KEZlWy2Chk5tM
 wiOzpN2GJtlPCAmiagJsGMs5f/VavJCWIq2iXJrSkKySMIJXNFRPQZtxGPZkIiPDp8PdHbhhJnx
 8mPBlxbmBssTHvZp583LFu0E0OFg0wIn6nOTCNsslTKXKKcyFiMm8bQIY4F6b4SqpFpNWX4XGG0
 LXis9bUprbtLaSIwzOs//uYoqt4R6WuG059gDCfZa7+lEZsGio3LY+N4IWiV937dQl6z9iX7B9y
 wIoY0GXnBTFgAsiG1LZBrFsYbYFf3wL7dpsK7vSXRgwYHJUQPe23Wa6ZHm1YT9xr6hCZp/ZETDZ
 sp/+0KWLvC+P1wcgzc4600of9Fe/bR0LclawFcUv33Az1izMIFdmyVnMCw+K6r6K3r4Rw749pdQ
 /jBGTQ5j38yEnZEUGgtp7e0I6+e8BPpwVoTb6pjFMGotlRcAWibuZyCIxB4STIPeYBYotxGdly9
 ODPwxNJO19abSKZvnRypQZonqC0tGKEDYLEApr5M0C/gEmvgfcgs7FUm4qhPRNAOqVeUmJYUSWC
 GpUfZ7ZyO8ROSPqngYN3X/9pQKmd84kFYAAiShXmwS4ZWmVCNhb3C8VBEqKRVCyq3aSoaYLISIh
 K+gLBOUPqgt9eYg==
X-Developer-Key: i=j-luthra@ti.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add DT bindings for TI's audio reference clocks (REFCLK) present on AM62
SoC.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
---
 .../bindings/clock/ti,am62-audio-refclk.yaml       | 44 ++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
new file mode 100644
index 000000000000..7c4cf7abe007
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/ti,am62-audio-refclk.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/ti,am62-audio-refclk.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI Audio Reference Clock
+
+maintainers:
+  - Jai Luthra <j-luthra@ti.com>
+
+properties:
+  compatible:
+    items:
+      - const: ti,am62-audio-refclk
+      - const: syscon
+
+  "#clock-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - reg
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    audio_refclk0: clock@82e0 {
+        compatible = "ti,am62-audio-refclk", "syscon";
+        reg = <0x82e0 0x4>;
+        clocks = <&k3_clks 157 0>;
+        assigned-clocks = <&k3_clks 157 0>;
+        assigned-clock-parents = <&k3_clks 157 8>;
+        #clock-cells = <0>;
+    };

-- 
2.40.1

