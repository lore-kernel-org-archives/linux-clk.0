Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C14C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7E1261075
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238904AbhJFN0s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:26:48 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38140
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238652AbhJFN0W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 09:26:22 -0400
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A5EA73FFFF
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526651;
        bh=kRxVWEyjL7cPmkr2JbKcgLN9H0IFsWJIuHqScYAzcd0=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=J55/tiNqLsLumKHPgDl8N4oHEt1ExdOFA9gN7iVmHJ8tOzP0NoHmNJ17fKOYDMqGH
         l41XtfEwEDw2gmNBcbkoBMyE+XVoynVOg4W4nT5IqCAO3t+5wtFhDVKvPsUGt4RBuE
         UyOuVT9jfuv6vJk/LgkCfjLyN8QZbWnN2CKpibUkUungds319NpwHBZNGAfGv5lmBr
         pBtOMYzzumLHV4v3dpgCXOBU93pkznyoTsH5yfyOkzlFaFF/qZXGJoJNaUUZGNFUpI
         BzLtr+PTbdkF0s0rhrfmN6aD+UlKB5I7MsbeosvhUKVBF4Z+Ii/Sycb/3NQMRK8FDD
         sj3q3Ov8QaYtA==
Received: by mail-lf1-f70.google.com with SMTP id v2-20020ac25582000000b003fd1c161a31so1956292lfg.15
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 06:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kRxVWEyjL7cPmkr2JbKcgLN9H0IFsWJIuHqScYAzcd0=;
        b=vQQsaxU8SPqdTSKBYvd+cOoalYEo0rL3SmoOxbUGFPaWNUEuARpZ1iQzJ3Wp0VKOgH
         eaoBKUQTPIZNpl6DyXIOFVtELh4wgTJhwqKb8YrEcay02GVUsERVgGMuiJ6mCyCNzra2
         U4mat8FcfwFEC3oXtGBvAvQqvIg5ZgRDBmVqpmCEY62FUyynlf0ZGWD3cJqXoDXqpT5n
         GxAqL1WqaVDDNiFw3wHADeYrf6eeGBC5TqR7+AYInU716DdpWGTOQTwcAqN82fAfb/bw
         oMI4VpJysnWtWxE6Av5h7EOJEuGEHGQI6XrzmXmVYSVKkfB2dAkCMXoxic5/xUSoWtjK
         uVOA==
X-Gm-Message-State: AOAM531jNQyRy68Fh+kNnAh46JCxGmQGClv3zrHtlE3ASVK/TpVPPo0l
        Iku/5Y9wN6n4utLRvt9+exGZia59u3cac0HrA4FihgtaBkfXMX4/lS/8JkBQa/BWKlXPA0MxFYG
        2R51VrAVC3wk8wjqMk99OrJM40181OryuWsDZBw==
X-Received: by 2002:a2e:6c14:: with SMTP id h20mr28187802ljc.519.1633526650909;
        Wed, 06 Oct 2021 06:24:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxE//SRcZIo3mS76IvE4T1Xkqs/oD/0x6Va1KYxm0Bu/Jxw0AxzoiwVy8R9uVy1jAhwqIXzuA==
X-Received: by 2002:a2e:6c14:: with SMTP id h20mr28187649ljc.519.1633526649171;
        Wed, 06 Oct 2021 06:24:09 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:24:08 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v3 07/10] dt-bindings: mfd: samsung,s2mps11: convert to dtschema
Date:   Wed,  6 Oct 2021 15:23:21 +0200
Message-Id: <20211006132324.76008-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the MFD part of Samsung S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02
family of PMICs to DT schema format.  Previously the bindings were
mostly in mfd/samsung,sec-core.txt.

The conversion copies parts of description from existing bindings
therefore the license is not changed from GPLv2.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/samsung,s2mps11.yaml         | 267 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 268 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
new file mode 100644
index 000000000000..771b3f16da96
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
@@ -0,0 +1,267 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mps11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS11/13/14/15 and S2MPU02 Power Management IC
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The Samsung S2MPS11/13/14/15 and S2MPU02 is a family of Power Management IC
+  which include voltage and current regulators, RTC, clock outputs and other
+  sub-blocks.
+
+properties:
+  compatible:
+    enum:
+      - samsung,s2mps11-pmic
+      - samsung,s2mps13-pmic
+      - samsung,s2mps14-pmic
+      - samsung,s2mps15-pmic
+      - samsung,s2mpu02-pmic
+
+  clocks:
+    $ref: ../clock/samsung,s2mps11.yaml
+    description:
+      Child node describing clock provider.
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    description:
+      List of child nodes that specify the regulators.
+
+  samsung,s2mps11-acokb-ground:
+    description: |
+      Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
+      the PMIC must manually set PWRHOLD bit in CTRL1 register to turn off the
+      power. Usually the ACOKB is pulled up to VBATT so when PWRHOLD pin goes
+      low, the rising ACOKB will trigger power off.
+    type: boolean
+
+  samsung,s2mps11-wrstbi-ground:
+    description: |
+      Indicates that WRSTBI pin of PMIC is pulled down. When the system is
+      suspended it will always go down thus triggerring unwanted buck warm
+      reset (setting buck voltages to default values).
+    type: boolean
+
+  wakeup-source: true
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps11-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mps11.yaml
+        samsung,s2mps11-wrstbi-ground: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps13-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mps13.yaml
+        samsung,s2mps11-acokb-ground: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps14-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mps14.yaml
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mps15-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mps15.yaml
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,s2mpu02-pmic
+    then:
+      properties:
+        regulators:
+          $ref: ../regulator/samsung,s2mpu02.yaml
+        samsung,s2mps11-acokb-ground: false
+        samsung,s2mps11-wrstbi-ground: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "samsung,s2mps11-pmic";
+            reg = <0x66>;
+
+            interrupt-parent = <&gpx0>;
+            interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+            pinctrl-names = "default";
+            pinctrl-0 = <&s2mps11_irq>;
+            samsung,s2mps11-acokb-ground;
+            wakeup-source;
+
+            clocks {
+                compatible = "samsung,s2mps11-clk";
+                #clock-cells = <1>;
+                clock-output-names = "s2mps11_ap", "s2mps11_cp", "s2mps11_bt";
+            };
+
+            regulators {
+                LDO1 {
+                    regulator-name = "vdd_ldo1";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                    regulator-always-on;
+                };
+
+                LDO4 {
+                    regulator-name = "vdd_adc";
+                    regulator-min-microvolt = <1800000>;
+                    regulator-max-microvolt = <1800000>;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                // ....
+
+                BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1300000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                BUCK2 {
+                    regulator-name = "vdd_arm";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1500000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-coupled-with = <&buck3_reg>;
+                    regulator-coupled-max-spread = <300000>;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                BUCK3 {
+                    regulator-name = "vdd_int";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1400000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-coupled-with = <&buck2_reg>;
+                    regulator-coupled-max-spread = <300000>;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                // ...
+            };
+        };
+    };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "samsung,s2mps14-pmic";
+            reg = <0x66>;
+
+            interrupt-parent = <&gpx0>;
+            interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+            wakeup-source;
+
+            clocks {
+                compatible = "samsung,s2mps14-clk";
+                #clock-cells = <1>;
+                clock-output-names = "s2mps14_ap", "unused", "s2mps14_bt";
+            };
+
+            regulators {
+                LDO1 {
+                    regulator-name = "VLDO1_1.0V";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                    regulator-always-on;
+
+                    regulator-state-mem {
+                        regulator-on-in-suspend;
+                    };
+                };
+
+                // ...
+
+                BUCK1 {
+                    regulator-name = "VBUCK1_1.0V";
+                    regulator-min-microvolt = <800000>;
+                    regulator-max-microvolt = <1000000>;
+                    regulator-always-on;
+
+                    regulator-state-mem {
+                        regulator-off-in-suspend;
+                    };
+                };
+
+                // ...
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 7967f735b2e7..ff613a2de8f0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16600,6 +16600,7 @@ L:	linux-kernel@vger.kernel.org
 L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
+F:	Documentation/devicetree/bindings/mfd/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
 F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.yaml
-- 
2.30.2

