Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 950D9C48BE0
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 12:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74B59613D3
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jun 2021 12:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231180AbhFKMcu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jun 2021 08:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhFKMcu (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jun 2021 08:32:50 -0400
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6736BC061574
        for <linux-clk@vger.kernel.org>; Fri, 11 Jun 2021 05:30:52 -0700 (PDT)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed20:2411:a261:8fe2:b47f])
        by albert.telenet-ops.be with bizsmtp
        id FoWp2501Y25eH3q06oWpgr; Fri, 11 Jun 2021 14:30:50 +0200
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrgJF-00FfbY-Cn; Fri, 11 Jun 2021 14:30:49 +0200
Received: from geert by rox.of.borg with local (Exim 4.93)
        (envelope-from <geert@linux-m68k.org>)
        id 1lrgJE-00CiDD-Qd; Fri, 11 Jun 2021 14:30:48 +0200
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, Sergej Sawazki <ce3a@gmx.de>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] dt-bindings: clock: gpio-mux-clock: Convert to json-schema
Date:   Fri, 11 Jun 2021 14:30:47 +0200
Message-Id: <14cb3b4da446f26a4780e0bd1b58788eb6085d05.1623414619.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the simple GPIO clock multiplexer Device Tree binding
documentation to json-schema.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 .../bindings/clock/gpio-mux-clock.txt         | 19 --------
 .../bindings/clock/gpio-mux-clock.yaml        | 45 +++++++++++++++++++
 2 files changed, 45 insertions(+), 19 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/gpio-mux-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/gpio-mux-clock.txt b/Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
deleted file mode 100644
index 2be1e038ca62907a..0000000000000000
--- a/Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
+++ /dev/null
@@ -1,19 +0,0 @@
-Binding for simple gpio clock multiplexer.
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "gpio-mux-clock".
-- clocks: list of two references to parent clocks.
-- #clock-cells : from common clock binding; shall be set to 0.
-- select-gpios : GPIO reference for selecting the parent clock.
-
-Example:
-	clock {
-		compatible = "gpio-mux-clock";
-		clocks = <&parentclk1>, <&parentclk2>;
-		#clock-cells = <0>;
-		select-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
-	};
diff --git a/Documentation/devicetree/bindings/clock/gpio-mux-clock.yaml b/Documentation/devicetree/bindings/clock/gpio-mux-clock.yaml
new file mode 100644
index 0000000000000000..1e21f8b3a4ff42dc
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/gpio-mux-clock.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/gpio-mux-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Simple GPIO clock multiplexer
+
+maintainers:
+  - Sergej Sawazki <ce3a@gmx.de>
+
+properties:
+  compatible:
+    const: gpio-mux-clock
+
+  clocks:
+    items:
+      - description: First parent clock
+      - description: Second parent clock
+
+  '#clock-cells':
+    const: 0
+
+  select-gpios:
+    description: GPIO reference for selecting the parent clock.
+    maxItems: 1
+
+required:
+  - compatible
+  - clocks
+  - '#clock-cells'
+  - select-gpios
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    clock {
+            compatible = "gpio-mux-clock";
+            clocks = <&parentclk1>, <&parentclk2>;
+            #clock-cells = <0>;
+            select-gpios = <&gpio 1 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.25.1

