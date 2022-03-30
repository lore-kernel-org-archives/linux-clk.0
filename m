Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16DBC433F5
	for <linux-clk@archiver.kernel.org>; Wed, 30 Mar 2022 15:41:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348307AbiC3PnL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Mar 2022 11:43:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239041AbiC3PnK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Mar 2022 11:43:10 -0400
Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0B98033EAA;
        Wed, 30 Mar 2022 08:41:24 -0700 (PDT)
X-IronPort-AV: E=Sophos;i="5.90,223,1643641200"; 
   d="scan'208";a="115200239"
Received: from unknown (HELO relmlir6.idc.renesas.com) ([10.200.68.152])
  by relmlie5.idc.renesas.com with ESMTP; 31 Mar 2022 00:41:24 +0900
Received: from localhost.localdomain (unknown [10.226.92.121])
        by relmlir6.idc.renesas.com (Postfix) with ESMTP id 296B5400A6B8;
        Thu, 31 Mar 2022 00:41:21 +0900 (JST)
From:   Phil Edworthy <phil.edworthy@renesas.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Phil Edworthy <phil.edworthy@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH v2 04/13] dt-bindings: clock: renesas,rzg2l: Document RZ/V2M SoC
Date:   Wed, 30 Mar 2022 16:40:15 +0100
Message-Id: <20220330154024.112270-5-phil.edworthy@renesas.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220330154024.112270-1-phil.edworthy@renesas.com>
References: <20220330154024.112270-1-phil.edworthy@renesas.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Document the device tree binding for the Renesas RZ/V2M (r9a09g011) SoC.

Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 .../bindings/clock/renesas,rzg2l-cpg.yaml           | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
index bd3af8fc616b..b1145f9139d2 100644
--- a/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
+++ b/Documentation/devicetree/bindings/clock/renesas,rzg2l-cpg.yaml
@@ -4,14 +4,15 @@
 $id: "http://devicetree.org/schemas/clock/renesas,rzg2l-cpg.yaml#"
 $schema: "http://devicetree.org/meta-schemas/core.yaml#"
 
-title: Renesas RZ/{G2L,V2L} Clock Pulse Generator / Module Standby Mode
+title: Renesas RZ/{G2L,V2L,V2M} Clock Pulse Generator / Module Standby Mode
 
 maintainers:
   - Geert Uytterhoeven <geert+renesas@glider.be>
 
 description: |
   On Renesas RZ/{G2L,V2L} SoC, the CPG (Clock Pulse Generator) and Module
-  Standby Mode share the same register block.
+  Standby Mode share the same register block. On RZ/V2M, the functionality is
+  similar, but does not have Clock Monitor Registers.
 
   They provide the following functionalities:
     - The CPG block generates various core clocks,
@@ -25,6 +26,7 @@ properties:
     enum:
       - renesas,r9a07g044-cpg  # RZ/G2{L,LC}
       - renesas,r9a07g054-cpg  # RZ/V2L
+      - renesas,r9a09g011-cpg  # RZ/V2M
 
   reg:
     maxItems: 1
@@ -42,9 +44,10 @@ properties:
     description: |
       - For CPG core clocks, the two clock specifier cells must be "CPG_CORE"
         and a core clock reference, as defined in
-        <dt-bindings/clock/r9a07g*-cpg.h>
+        <dt-bindings/clock/r9a07g*-cpg.h> or <dt-bindings/clock/r9a09g011-cpg.h>
       - For module clocks, the two clock specifier cells must be "CPG_MOD" and
-        a module number, as defined in the <dt-bindings/clock/r9a07g0*-cpg.h>.
+        a module number, as defined in the <dt-bindings/clock/r9a07g0*-cpg.h> or
+        <dt-bindings/clock/r9a09g011-cpg.h>.
     const: 2
 
   '#power-domain-cells':
@@ -58,7 +61,7 @@ properties:
   '#reset-cells':
     description:
       The single reset specifier cell must be the module number, as defined in
-      the <dt-bindings/clock/r9a07g0*-cpg.h>.
+      the <dt-bindings/clock/r9a07g0*-cpg.h> or <dt-bindings/clock/r9a09g011-cpg.h>.
     const: 1
 
 required:
-- 
2.32.0

