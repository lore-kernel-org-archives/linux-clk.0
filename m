Return-Path: <SRS0=pf3n=S3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AE99C282E1
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 10:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 646102084B
	for <linux-clk@archiver.kernel.org>; Thu, 25 Apr 2019 10:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729225AbfDYKk6 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Apr 2019 06:40:58 -0400
Received: from mx.socionext.com ([202.248.49.38]:5348 "EHLO mx.socionext.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730396AbfDYKk6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Apr 2019 06:40:58 -0400
Received: from unknown (HELO kinkan-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 25 Apr 2019 19:40:56 +0900
Received: from mail.mfilter.local (m-filter-1 [10.213.24.61])
        by kinkan-ex.css.socionext.com (Postfix) with ESMTP id 0E2FE180C0C;
        Thu, 25 Apr 2019 19:40:56 +0900 (JST)
Received: from 172.31.9.51 (172.31.9.51) by m-FILTER with ESMTP; Thu, 25 Apr 2019 19:40:56 +0900
Received: from yuzu.css.socionext.com (yuzu [172.31.8.45])
        by kinkan.css.socionext.com (Postfix) with ESMTP id 93A4F1A04E0;
        Thu, 25 Apr 2019 19:40:55 +0900 (JST)
Received: from M20VSDK.e01.socionext.com (unknown [10.213.118.34])
        by yuzu.css.socionext.com (Postfix) with ESMTP id 74147121BD0;
        Thu, 25 Apr 2019 19:40:55 +0900 (JST)
From:   Sugaya Taichi <sugaya.taichi@socionext.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     Takao Orito <orito.takao@socionext.com>,
        Kazuhiro Kasai <kasai.kazuhiro@socionext.com>,
        Shinji Kanematsu <kanematsu.shinji@socionext.com>,
        Jassi Brar <jaswinder.singh@linaro.org>,
        Masami Hiramatsu <masami.hiramatsu@linaro.org>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Sugaya Taichi <sugaya.taichi@socionext.com>
Subject: [PATCH v3 1/3] dt-bindings: clock: milbeaut: add Milbeaut clock description
Date:   Thu, 25 Apr 2019 19:41:00 +0900
Message-Id: <1556188862-22546-2-git-send-email-sugaya.taichi@socionext.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com>
References: <1556188862-22546-1-git-send-email-sugaya.taichi@socionext.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add DT bindings document for Milbeaut clock.

Signed-off-by: Sugaya Taichi <sugaya.taichi@socionext.com>
---
 .../devicetree/bindings/clock/milbeaut-clock.yaml  | 73 ++++++++++++++++++++++
 1 file changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/milbeaut-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/milbeaut-clock.yaml b/Documentation/devicetree/bindings/clock/milbeaut-clock.yaml
new file mode 100644
index 0000000..5cf0b81
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/milbeaut-clock.yaml
@@ -0,0 +1,73 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/bindings/clock/milbeaut-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Milbeaut SoCs Clock Controller Binding
+
+maintainers:
+  - Taichi Sugaya <sugaya.taichi@socionext.com>
+
+description: |
+  Milbeaut SoCs Clock controller is an integrated clock controller, which
+  generates and supplies to all modules.
+
+  This binding uses common clock bindings
+  [1] Documentation/devicetree/bindings/clock/clock-bindings.txt
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - socionext,milbeaut-m10v-ccu
+  clocks:
+    maxItems: 1
+    description: external clock
+
+  '#clock-cells':
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+examples:
+  # Clock controller node:
+  - |
+    m10v-clk-ctrl@1d021000 {
+        compatible = "socionext,milbeaut-m10v-clk-ccu";
+        reg = <0x1d021000 0x4000>;
+        #clock-cells = <1>;
+        clocks = <&clki40mhz>;
+    };
+
+  # Required an external clock for Clock controller node:
+  - |
+    clocks {
+        clki40mhz: clki40mhz {
+            compatible = "fixed-clock";
+            #clock-cells = <0>;
+            clock-frequency = <40000000>;
+        };
+        /* other clocks */
+    };
+
+  # The clock consumer shall specify the desired clock-output of the clock
+  # controller as below by specifying output-id in its "clk" phandle cell.
+  # 2: uart
+  # 4: 32-bit timer
+  # 7: UHS-I/II
+  - |
+    serial@1e700010 {
+        compatible = "socionext,milbeaut-usio-uart";
+        reg = <0x1e700010 0x10>;
+        interrupts = <0 141 0x4>, <0 149 0x4>;
+        interrupt-names = "rx", "tx";
+        clocks = <&clk 2>;
+    };
+
+...
-- 
1.9.1

