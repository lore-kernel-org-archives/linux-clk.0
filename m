Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93A2C43462
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 20:16:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA9A36135A
	for <linux-clk@archiver.kernel.org>; Wed, 19 May 2021 20:16:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232480AbhESURW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 May 2021 16:17:22 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37570 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231193AbhESURV (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 19 May 2021 16:17:21 -0400
Received: from hq-00021.Speedport_W_724V_01011603_07_002 (p200300d83f181d7939130a2764e31627.dip0.t-ipconnect.de [IPv6:2003:d8:3f18:1d79:3913:a27:64e3:1627])
        by mail.bugwerft.de (Postfix) with ESMTPSA id CD4194E4071;
        Wed, 19 May 2021 20:15:59 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v2 2/3] dt-bindings: clock: cs2000-cp: Document aux-output-source
Date:   Wed, 19 May 2021 22:15:50 +0200
Message-Id: <20210519201551.690654-3-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519201551.690654-1-daniel@zonque.org>
References: <20210519201551.690654-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This new optional property can be used to control the function of the
auxiliary output pin. Introduce a new dt-bindings include file that
contains the numerical values.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../bindings/clock/cirrus,cs2000-cp.yaml           | 13 +++++++++++++
 include/dt-bindings/clock/cirrus,cs2000-cp.h       | 14 ++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 379a8bab49ca..72902192e084 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -37,6 +37,16 @@ properties:
   reg:
     maxItems: 1
 
+  cirrus,aux-output-source:
+    description:
+      Specfies the function of the auxililary clock output pin
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum:
+      - 0 # CS2000CP_AUX_OUTPUT_REF_CLK:  ref_clk input
+      - 1 # CS2000CP_AUX_OUTPUT_CLK_IN:   clk_in input
+      - 2 # CS2000CP_AUX_OUTPUT_CLK_OUT:  clk_out output
+      - 3 # CS2000CP_AUX_OUTPUT_PLL_LOCK: pll lock status
+
 required:
   - compatible
   - reg
@@ -48,6 +58,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/clock/cirrus,cs2000-cp.h>
+
     i2c@0 {
       reg = <0x0 0x100>;
       #address-cells = <1>;
@@ -59,5 +71,6 @@ examples:
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

