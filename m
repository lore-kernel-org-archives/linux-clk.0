Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196BCC001DE
	for <linux-clk@archiver.kernel.org>; Mon, 31 Jul 2023 20:34:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229737AbjGaUeW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 31 Jul 2023 16:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjGaUeV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 31 Jul 2023 16:34:21 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1D72100;
        Mon, 31 Jul 2023 13:33:48 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4fba8f2197bso7699603e87.3;
        Mon, 31 Jul 2023 13:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690835597; x=1691440397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RTESAFSkB0aaTymk9sxX1oQrfsO89OgDrbMH+b9wXKI=;
        b=k6K2wgh3cLroSZ7rkX5zecFUGoyQr4ZcsKQes8piwSc9OW4vllgkPsrPsTMCRypdAv
         EDVqrFEPoiKudDLG0BMtgDrAh/cyuVIgV4+178iHXq6Y0GPKu6LAhabc/Hy/lfcAU7Ss
         kJuoX5cdMD4c7TQOe+gBtJkGsVdx1yqAin0uz2yTbLvC+ruN0CDrZqHiq0ruAKyyDMCL
         2Xz38c8cnwmDYdPgpaKixYQvbO1xng0xXSA7CySEMFAL/nVV7YZ2gd2RONymozVpzRVl
         KKiWwTeDb/OKGZSPFTnNK0TS3QFAMy9RQ1B3RXlNzhnn9fP2WgG3v01HFjxbYfj+buj0
         MS3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690835597; x=1691440397;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RTESAFSkB0aaTymk9sxX1oQrfsO89OgDrbMH+b9wXKI=;
        b=bGRkZ7l6XTxD61kuYR03VzZfck9N0jwpE/YbYcT2lQmgYLCwWt/3kIpI/JkjepaqtZ
         71CHjY5L7l7XZ+LSfGoxq/OJg+uh0vx1s5F3TEztoC9YCjaW5Yf7n5BLcG9wqslSwBuz
         AbLrxENqoDcNYhGoRlYwPqiXc+6+RRvR/h2y21DacmYgOfvAypzZ0XwBQebxhzujHoRU
         E/p7TY4p07U0khd1kfoo2JXrtUSCt91W7Lf+7mHEFDFQ80Zk+uf+KtfqkZw3LjLJ02cc
         K4PNPqCKaFCs9PLrzTxuGG0oYI2UZXwtiPgOFhbGXr4VrOV+r2MvFiz2X/mh5g0N6KW1
         7g1g==
X-Gm-Message-State: ABy/qLarY430XGL6F/YdJ6z45bmDKEruaYyD074OopwRtjblbT6ntETy
        zJyqwxMDsFPQdIUSUFTyceA=
X-Google-Smtp-Source: APBJJlHP0ft40ST4BERPBedmBxMjCZP12iUZ41sRbo2wacYzr+hd4R94uIVyD8sEPpzIiUZdJIZ9CQ==
X-Received: by 2002:a19:6554:0:b0:4f9:5d2a:e0f6 with SMTP id c20-20020a196554000000b004f95d2ae0f6mr586041lfj.14.1690835597023;
        Mon, 31 Jul 2023 13:33:17 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id w9-20020a056512098900b004fb761ed781sm2233800lft.109.2023.07.31.13.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 13:33:16 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Lee Jones <lee@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: mfd/clock: YAML for Broadcom PMU with ILP clock
Date:   Mon, 31 Jul 2023 22:33:09 +0200
Message-Id: <20230731203309.30278-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

BCM53573 SoC has ILP clock that is part of the PMU block. So far PMU
itself didn't have a proper binding and ILP wasn't converted to
json-schema. Fix it up.

Add custom binding for Broadcom's BCM53573 PMU and include ILP's
properties there (it's trivial and non-reusable binding).

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/clock/brcm,bcm53573-ilp.txt      | 36 ----------
 .../bindings/mfd/brcm,bcm53573-pmu.yaml       | 67 +++++++++++++++++++
 2 files changed, 67 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
 create mode 100644 Documentation/devicetree/bindings/mfd/brcm,bcm53573-pmu.yaml

diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
deleted file mode 100644
index 2ebb107331dd..000000000000
--- a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
+++ /dev/null
@@ -1,36 +0,0 @@
-Broadcom BCM53573 ILP clock
-===========================
-
-This binding uses the common clock binding:
-    Documentation/devicetree/bindings/clock/clock-bindings.txt
-
-This binding is used for ILP clock (sometimes referred as "slow clock")
-on Broadcom BCM53573 devices using Cortex-A7 CPU.
-
-ILP's rate has to be calculated on runtime and it depends on ALP clock
-which has to be referenced.
-
-This clock is part of PMU (Power Management Unit), a Broadcom's device
-handing power-related aspects. Its node must be sub-node of the PMU
-device.
-
-Required properties:
-- compatible: "brcm,bcm53573-ilp"
-- clocks: has to reference an ALP clock
-- #clock-cells: should be <0>
-- clock-output-names: from common clock bindings, should contain clock
-		      name
-
-Example:
-
-pmu@18012000 {
-	compatible = "simple-mfd", "syscon";
-	reg = <0x18012000 0x00001000>;
-
-	ilp {
-		compatible = "brcm,bcm53573-ilp";
-		clocks = <&alp>;
-		#clock-cells = <0>;
-		clock-output-names = "ilp";
-	};
-};
diff --git a/Documentation/devicetree/bindings/mfd/brcm,bcm53573-pmu.yaml b/Documentation/devicetree/bindings/mfd/brcm,bcm53573-pmu.yaml
new file mode 100644
index 000000000000..5b0a12bf4fe4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/brcm,bcm53573-pmu.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/brcm,bcm53573-pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom PMU
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  Broadcom PMU ("Power Management Unit"?) is a hardware block grouping smaller
+  blocks. It contains few clocks and some shared registers (used to power
+  control more than 1 block).
+
+properties:
+  compatible:
+    items:
+      - const: brcm,bcm53573-pmu
+      - const: simple-mfd
+      - const: syscon
+
+  reg:
+    maxItems: 1
+
+  clock-controller-ilp:
+    description: ILP clock (sometimes referred as "slow clock")
+    type: object
+    allOf:
+      - $ref: /schemas/clock/clock.yaml
+      - properties:
+          compatible:
+            const: brcm,bcm53573-ilp
+          clocks:
+            description: ALP clock
+            maxItems: 1
+          clock-output-names:
+            const: ilp
+          "#clock-cells":
+            const: 0
+        required:
+          - compatible
+          - clocks
+          - clock-output-names
+          - "#clock-cells"
+    unevaluatedProperties: false
+
+additionalProperties: false
+
+required:
+  - reg
+  - clock-controller-ilp
+
+examples:
+  - |
+    pmu@18012000 {
+        compatible = "brcm,bcm53573-pmu", "simple-mfd", "syscon";
+        reg = <0x18012000 0x00001000>;
+
+        clock-controller-ilp {
+            compatible = "brcm,bcm53573-ilp";
+            clocks = <&alp>;
+            clock-output-names = "ilp";
+            #clock-cells = <0>;
+        };
+    };
-- 
2.35.3

