Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1CF6C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 11:09:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE2F0610E5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 11:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238235AbhJFLLL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 07:11:11 -0400
Received: from mx.socionext.com ([202.248.49.38]:52853 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238167AbhJFLLK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 6 Oct 2021 07:11:10 -0400
Received: from unknown (HELO iyokan2-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 06 Oct 2021 20:09:17 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by iyokan2-ex.css.socionext.com (Postfix) with ESMTP id 083042058B40;
        Wed,  6 Oct 2021 20:09:17 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Wed, 6 Oct 2021 20:09:17 +0900
Received: from plum.e01.socionext.com (unknown [10.212.243.119])
        by kinkan2.css.socionext.com (Postfix) with ESMTP id 673D7B62B7;
        Wed,  6 Oct 2021 20:09:16 +0900 (JST)
From:   Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Masami Hiramatsu <mhiramat@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
Subject: [PATCH v2 4/5] dt-bindings: clock: uniphier: Add clock binding for SoC-glue
Date:   Wed,  6 Oct 2021 20:09:14 +0900
Message-Id: <1633518555-8195-5-git-send-email-hayashi.kunihiko@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1633518555-8195-1-git-send-email-hayashi.kunihiko@socionext.com>
References: <1633518555-8195-1-git-send-email-hayashi.kunihiko@socionext.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Update binding document for clocks implemented in SoC-glue.

Signed-off-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
---
 .../bindings/clock/socionext,uniphier-clock.yaml         | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/socionext,uniphier-clock.yaml b/Documentation/devicetree/bindings/clock/socionext,uniphier-clock.yaml
index ee8d16a8019e..05a9d1f89756 100644
--- a/Documentation/devicetree/bindings/clock/socionext,uniphier-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/socionext,uniphier-clock.yaml
@@ -46,6 +46,9 @@ properties:
           - socionext,uniphier-ld20-peri-clock
           - socionext,uniphier-pxs3-peri-clock
           - socionext,uniphier-nx1-peri-clock
+      - description: SoC-glue clock
+        enum:
+          - socionext,uniphier-pro4-sg-clock
 
   "#clock-cells":
     const: 1
@@ -95,3 +98,16 @@ examples:
 
         // other nodes ...
     };
+
+  - |
+    soc-glue@5f800000 {
+        compatible = "socionext,uniphier-sysctrl", "simple-mfd", "syscon";
+        reg = <0x5f800000 0x2000>;
+
+        clock {
+            compatible = "socionext,uniphier-pro4-sg-clock";
+            #clock-cells = <1>;
+        };
+
+        // other nodes ...
+    };
-- 
2.7.4

