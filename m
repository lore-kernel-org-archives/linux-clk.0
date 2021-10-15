Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A1F2C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7324E61181
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 14:53:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230471AbhJOOz5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 10:55:57 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:57812 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236248AbhJOOz4 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Oct 2021 10:55:56 -0400
Received: from hq-00021.fritz.box (p57bc9963.dip0.t-ipconnect.de [87.188.153.99])
        by mail.bugwerft.de (Postfix) with ESMTPSA id D0A9148E45A;
        Fri, 15 Oct 2021 14:53:48 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH RESEND v4 2/9] dt-bindings: clock: cs2000-cp: document aux-output-source
Date:   Fri, 15 Oct 2021 16:53:19 +0200
Message-Id: <20211015145326.1018458-3-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211015145326.1018458-1-daniel@zonque.org>
References: <20211015145326.1018458-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This new optional property can be used to control the function of the
auxiliary output pin. Introduce a new dt-bindings include file that
contains the numerical values.

Signed-off-by: Daniel Mack <daniel@zonque.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/cirrus,cs2000-cp.yaml           | 14 ++++++++++++++
 include/dt-bindings/clock/cirrus,cs2000-cp.h       | 14 ++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 379a8bab49ca..79b90500f6ac 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -37,6 +37,17 @@ properties:
   reg:
     maxItems: 1
 
+  cirrus,aux-output-source:
+    description:
+      Specifies the function of the auxiliary clock output pin
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # CS2000CP_AUX_OUTPUT_REF_CLK:  ref_clk input
+      - 1 # CS2000CP_AUX_OUTPUT_CLK_IN:   clk_in input
+      - 2 # CS2000CP_AUX_OUTPUT_CLK_OUT:  clk_out output
+      - 3 # CS2000CP_AUX_OUTPUT_PLL_LOCK: pll lock status
+    default: 0
+
 required:
   - compatible
   - reg
@@ -48,6 +59,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/cirrus,cs2000-cp.h>
+
     i2c@0 {
       reg = <0x0 0x100>;
       #address-cells = <1>;
@@ -59,5 +72,6 @@ examples:
         reg = <0x4f>;
         clocks = <&rcar_sound 0>, <&x12_clk>;
         clock-names = "clk_in", "ref_clk";
+        cirrus,aux-output-source = <CS2000CP_AUX_OUTPUT_CLK_OUT>;
       };
     };
diff --git a/include/dt-bindings/clock/cirrus,cs2000-cp.h b/include/dt-bindings/clock/cirrus,cs2000-cp.h
new file mode 100644
index 000000000000..fe3ac71750a8
--- /dev/null
+++ b/include/dt-bindings/clock/cirrus,cs2000-cp.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (C) 2021 Daniel Mack
+ */
+
+#ifndef __DT_BINDINGS_CS2000CP_CLK_H
+#define __DT_BINDINGS_CS2000CP_CLK_H
+
+#define CS2000CP_AUX_OUTPUT_REF_CLK	0
+#define CS2000CP_AUX_OUTPUT_CLK_IN	1
+#define CS2000CP_AUX_OUTPUT_CLK_OUT	2
+#define CS2000CP_AUX_OUTPUT_PLL_LOCK	3
+
+#endif /* __DT_BINDINGS_CS2000CP_CLK_H */
-- 
2.31.1

