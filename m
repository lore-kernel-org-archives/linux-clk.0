Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AF8EC2B9F4
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F1B25613EE
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233036AbhFQTLa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 15:11:30 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37026 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231379AbhFQTL3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 17 Jun 2021 15:11:29 -0400
Received: from hq-00021.fritz.box (p57bc9ba2.dip0.t-ipconnect.de [87.188.155.162])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 8315C4C087A;
        Thu, 17 Jun 2021 19:09:19 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 3/9] dt-bindings: clock: cs2000-cp: make clk_in optional
Date:   Thu, 17 Jun 2021 21:09:06 +0200
Message-Id: <20210617190912.262809-4-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617190912.262809-1-daniel@zonque.org>
References: <20210617190912.262809-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

CLK_IN is only used in dynamic mode and is hence optional.

Re-order the clocks so REF_CLK is specified first.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 .../devicetree/bindings/clock/cirrus,cs2000-cp.yaml   | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
index 79b90500f6ac..68efed8e5033 100644
--- a/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
+++ b/Documentation/devicetree/bindings/clock/cirrus,cs2000-cp.yaml
@@ -22,14 +22,15 @@ properties:
 
   clocks:
     description:
-      Common clock binding for CLK_IN, XTI/REF_CLK
-    minItems: 2
+      Common clock binding for XTI/REF_CLK, CLK_IN.
+      CLK_IN is optional and only used in dynamic mode.
+    minItems: 1
     maxItems: 2
 
   clock-names:
     items:
-      - const: clk_in
       - const: ref_clk
+      - const: clk_in
 
   '#clock-cells':
     const: 0
@@ -70,8 +71,8 @@ examples:
         #clock-cells = <0>;
         compatible = "cirrus,cs2000-cp";
         reg = <0x4f>;
-        clocks = <&rcar_sound 0>, <&x12_clk>;
-        clock-names = "clk_in", "ref_clk";
+        clocks = <&x12_clk>, <&rcar_sound 0>;
+        clock-names = "ref_clk", "clk_in";
         cirrus,aux-output-source = <CS2000CP_AUX_OUTPUT_CLK_OUT>;
       };
     };
-- 
2.31.1

