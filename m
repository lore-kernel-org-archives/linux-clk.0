Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7655CC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 15:26:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 624BF61059
	for <linux-clk@archiver.kernel.org>; Fri,  3 Sep 2021 15:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349785AbhICP1X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Sep 2021 11:27:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:54054 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1349852AbhICP1U (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 3 Sep 2021 11:27:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 16AF960462;
        Fri,  3 Sep 2021 15:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630682780;
        bh=ID2soslmA8nSKnDgbFk6tcnuXu/CknafPNMTTv6oleA=;
        h=From:To:Cc:Subject:Date:From;
        b=jGP8jtf0agfCoY++xBl8SED7Ql9tDY+5ijGaQYAYrtgGdzcA6YuQvGIWeZjGqjUcj
         56vRdQmY8zQnp1j9wGm0F0rZqCBePilhYyOHf1TUyZ+4zSg3RhlEP+UNSZ4yVhyKEH
         /Y2/vS3146V82K1h7hOObuyPoZeXw0K+VhaBATOIMTpTsrotP3rm0JWgxrYwLc2k9X
         YigTUD2WpJlUbsIVb3/nw2O9vxxZ3wlSPXPWAG++0JvSrYwMymoqd1V/pFpi3OaoFq
         PY/E7te0PujntBSwfdl0couXZdGHwcpvslNjUU/mvo0cF894xD5F137wNYjEuApFRo
         Cmv70bglGAb9Q==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jan Kotas <jank@cadence.com>, robh+dt@kernel.org,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] dt-bindings: clk: fixed-mmio-clock: Convert to YAML
Date:   Fri,  3 Sep 2021 17:26:15 +0200
Message-Id: <20210903152615.31453-1-kabel@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the binding documentatoin for fixed-mmio-clock to YAML.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 .../bindings/clock/fixed-mmio-clock.txt       | 24 ----------
 .../bindings/clock/fixed-mmio-clock.yaml      | 47 +++++++++++++++++++
 2 files changed, 47 insertions(+), 24 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
deleted file mode 100644
index c359367fd1a9..000000000000
--- a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.txt
+++ /dev/null
@@ -1,24 +0,0 @@
-Binding for simple memory mapped io fixed-rate clock sources.
-The driver reads a clock frequency value from a single 32-bit memory mapped
-I/O register and registers it as a fixed rate clock.
-
-It was designed for test systems, like FPGA, not for complete, finished SoCs.
-
-This binding uses the common clock binding[1].
-
-[1] Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-Required properties:
-- compatible : shall be "fixed-mmio-clock".
-- #clock-cells : from common clock binding; shall be set to 0.
-- reg : Address and length of the clock value register set.
-
-Optional properties:
-- clock-output-names : From common clock binding.
-
-Example:
-sysclock: sysclock@fd020004 {
-	#clock-cells = <0>;
-	compatible = "fixed-mmio-clock";
-	reg = <0xfd020004 0x4>;
-};
diff --git a/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
new file mode 100644
index 000000000000..1453ac849a65
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/fixed-mmio-clock.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/fixed-mmio-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Binding for simple memory mapped IO fixed-rate clock sources
+
+description:
+  This binding describes a fixed-rate clock for which the frequency can
+  be read from a single 32-bit memory mapped I/O register.
+
+  It was designed for test systems, like FPGA, not for complete,
+  finished SoCs.
+
+maintainers:
+  - Jan Kotas <jank@cadence.com>
+
+properties:
+  compatible:
+    const: fixed-mmio-clock
+
+  reg:
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#clock-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    sysclock: sysclock@fd020004 {
+      compatible = "fixed-mmio-clock";
+      #clock-cells = <0>;
+      reg = <0xfd020004 0x4>;
+      clock-output-names = "sysclk";
+    };
+...
-- 
2.32.0

