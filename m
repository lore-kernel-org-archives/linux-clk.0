Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69CCAC4332F
	for <linux-clk@archiver.kernel.org>; Fri,  1 Oct 2021 09:41:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5485C61881
	for <linux-clk@archiver.kernel.org>; Fri,  1 Oct 2021 09:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353200AbhJAJnj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Oct 2021 05:43:39 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46642
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353158AbhJAJnf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Oct 2021 05:43:35 -0400
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com [209.85.167.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 915E9402CD
        for <linux-clk@vger.kernel.org>; Fri,  1 Oct 2021 09:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633081310;
        bh=gDmftXMeUArh2TCL5iigzgu27m5LXLf7Nkl0/uBbmsg=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=SlaTTXsasJBlrI6LJqCP6pgzBfSxUKgFsKrwMxHwSTOHN0aQMlKrZ31dd7W3d2xL3
         lJT15EB2YNMjo2r1p6U9Fb/7ujRrUY8lICbiLuT0g2BriR+vbB5Pu9/tS0uYZa0DiZ
         AdkGC5nTjOOhbwQg+TELoT/l9KvG3IfcLJY4dBxIekUGr2VwoH+glWkTShWr7spVH3
         skryiq9rEuBDDLveqMhGzE0+urFiMumVpom6Fr3JIYDutkxPgOABzl9jj9nvDXRIjK
         oBC1vgTBnz0YTYWMfzUPfwyDBFkPB5Ep3tQljnSEk6yEluWVns5Yf2jO4tJ1IKkfoc
         QyeCA+DmkaVxg==
Received: by mail-lf1-f71.google.com with SMTP id n22-20020a0565120ad600b003fcc09af59fso8433161lfu.21
        for <linux-clk@vger.kernel.org>; Fri, 01 Oct 2021 02:41:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=gDmftXMeUArh2TCL5iigzgu27m5LXLf7Nkl0/uBbmsg=;
        b=jlVwid/J3sZbmxGl80qOxfPNmTDPca5akbcaOlDoMrzXloYUfwi/abZ+O/cLp5//Gr
         5mnrmi/DxEdHYdppfR8QYickwZOcA01Eb8qZxjPjcGq2uqWVGqkk/ZAYY4lamhMVD2Q4
         UEgQSLKAWdAhwm6WUQZMXjAr23UHshXDhUNCKvW3hxhqRLGnk1U+cB/MXZS2Y54sdWcu
         RWzBq3XKOcUvS/a72CupRphEGbDU6//ibCCTwKkYKcsBKhibl9hPAmj/75KWy7ah89y7
         IXRnYVcU1kS/I81pHSs+4KELwAVQcuD6XQbjl7ehnoJTzOSBVcGDdLoTtKkTYyb398Nn
         LWTg==
X-Gm-Message-State: AOAM532T3xE0cuM4NjmzZqjLCUu7SRc4EMx5dZ7y/cvIGaffxFHZHENu
        y++UoiEcAdGu5PhG/ySa40mx9lYD8y3cHXzA3e/tOkd4E/AXi1XVv2mPIiu1JhvosLKj5/hBgqS
        hXpsbc7My+pmTR0E4UoPPg7GhCzO+vWGAYVNrGg==
X-Received: by 2002:a2e:b707:: with SMTP id j7mr10277598ljo.297.1633081309747;
        Fri, 01 Oct 2021 02:41:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyK9Nk/LJqoRUkCncERWUjzz6vPJkoAGgguzFcpWdVVS0aPBAXzWAvbOt2yrm187e8Fsg5TtQ==
X-Received: by 2002:a2e:b707:: with SMTP id j7mr10277573ljo.297.1633081309419;
        Fri, 01 Oct 2021 02:41:49 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id g29sm673784lfj.212.2021.10.01.02.41.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 02:41:49 -0700 (PDT)
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
Subject: [PATCH v2 04/10] regulator: dt-bindings: samsung,s2m: convert to dtschema
Date:   Fri,  1 Oct 2021 11:41:00 +0200
Message-Id: <20211001094106.52412-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the regulators of Samsung
S2MPS11/S2MPS13/S2MPS14/S2MPS15/S2MPU02 family of PMICs to DT schema
format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/samsung,s2mps11.txt    | 102 ------------------
 .../bindings/regulator/samsung,s2mps11.yaml   |  52 +++++++++
 .../bindings/regulator/samsung,s2mps13.yaml   |  52 +++++++++
 .../bindings/regulator/samsung,s2mps14.yaml   |  52 +++++++++
 .../bindings/regulator/samsung,s2mps15.yaml   |  52 +++++++++
 .../bindings/regulator/samsung,s2mpu02.yaml   |  52 +++++++++
 MAINTAINERS                                   |   2 +-
 7 files changed, 261 insertions(+), 103 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
deleted file mode 100644
index 27a48bf1b185..000000000000
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.txt
+++ /dev/null
@@ -1,102 +0,0 @@
-Binding for Samsung S2M family regulator block
-==============================================
-
-This is a part of device tree bindings for S2M family multi-function devices.
-More information can be found in bindings/mfd/sec-core.txt file.
-
-The S2MPS11/13/14/15 and S2MPU02 devices provide buck and LDO regulators.
-
-To register these with regulator framework instantiate under main device node
-a sub-node named "regulators" with more sub-nodes for each regulator using the
-common regulator binding documented in:
- - Documentation/devicetree/bindings/regulator/regulator.txt
-
-
-Names of regulators supported by different devices:
-	- LDOn
-		  - valid values for n are:
-			- S2MPS11: 1 to 38
-			- S2MPS13: 1 to 40
-			- S2MPS14: 1 to 25
-			- S2MPS15: 1 to 27
-			- S2MPU02: 1 to 28
-		  - Example: LDO1, LDO2, LDO28
-	- BUCKn
-		  - valid values for n are:
-			- S2MPS11: 1 to 10
-			- S2MPS13: 1 to 10
-			- S2MPS14: 1 to 5
-			- S2MPS15: 1 to 10
-			- S2MPU02: 1 to 7
-		  - Example: BUCK1, BUCK2, BUCK9
-Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of device.
-
-
-Optional properties of the nodes under "regulators" sub-node:
- - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500,
-   25000 (default) or 50000.
-
-   Additionally S2MPS11 supports disabling ramp delay for BUCK{2,3,4,6}
-   by setting it to <0>.
-
-   Note: On S2MPS11 some bucks share the ramp rate setting i.e. same ramp value
-   will be set for a particular group of bucks so provide the same
-   regulator-ramp-delay value for them.
-   Groups sharing ramp rate:
-    - buck{1,6},
-    - buck{3,4},
-    - buck{7,8,10}.
-
- - samsung,ext-control-gpios: On S2MPS14 the LDO10, LDO11 and LDO12 can be
-   configured to external control over GPIO. To turn this feature on this
-   property must be added to the regulator sub-node:
-    - samsung,ext-control-gpios: GPIO specifier for one GPIO
-                                 controlling this regulator (enable/disable)
-  Example:
-	LDO12 {
-		regulator-name = "V_EMMC_2.8V";
-		regulator-min-microvolt = <2800000>;
-		regulator-max-microvolt = <2800000>;
-		samsung,ext-control-gpios = <&gpk0 2 0>;
-	};
-
-
-Example:
-
-	s2mps11_pmic@66 {
-		compatible = "samsung,s2mps11-pmic";
-		reg = <0x66>;
-
-		regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "VDD_ABB_3.3V";
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-			};
-
-			ldo2_reg: LDO2 {
-				regulator-name = "VDD_ALIVE_1.1V";
-				regulator-min-microvolt = <1100000>;
-				regulator-max-microvolt = <1100000>;
-				regulator-always-on;
-			};
-
-			buck1_reg: BUCK1 {
-				regulator-name = "vdd_mif";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-boot-on;
-			};
-
-			buck2_reg: BUCK2 {
-				regulator-name = "vdd_arm";
-				regulator-min-microvolt = <950000>;
-				regulator-max-microvolt = <1350000>;
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-ramp-delay = <50000>;
-			};
-		};
-	};
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
new file mode 100644
index 000000000000..44624815c8e6
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps11.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps11.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS11 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS11 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 38 LDOs
+  "^LDO([1-9]|[1-2][0-9]|3[0-8])$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
new file mode 100644
index 000000000000..6f5cd5cc8482
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps13.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps13.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS13 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS13 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 40 LDOs
+  "^LDO([1-9]|[1-3][0-9]|40)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
new file mode 100644
index 000000000000..227555b69fa1
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps14.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps14.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS14 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS14 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 25 LDOs
+  "^LDO([1-9]|[1][0-9]|2[0-5])$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 5 bucks
+  "^BUCK[1-5]$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
new file mode 100644
index 000000000000..f989f9ef999b
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mps15.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mps15.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPS15 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPS15 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 27 LDOs
+  "^LDO([1-9]|[1][0-9]|2[0-7])$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 10 bucks
+  "^BUCK([1-9]|10)$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
new file mode 100644
index 000000000000..2d0c00e3a54a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpu02.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpu02.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPU02 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPU02 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml for
+  additional information and example.
+
+patternProperties:
+  # 28 LDOs
+  "^LDO([1-9]|1[0-9]|2[0-8])$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single LDO regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+  # 7 bucks
+  "^BUCK[1-7]$":
+    type: object
+    $ref: regulator.yaml#
+    description:
+      Properties for single BUCK regulator.
+
+    properties:
+      regulator-name: true
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index 241fe78a3282..ee486357cf45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16601,7 +16601,7 @@ L:	linux-samsung-soc@vger.kernel.org
 S:	Supported
 F:	Documentation/devicetree/bindings/clock/samsung,s2mps11.yaml
 F:	Documentation/devicetree/bindings/mfd/samsung,sec-core.txt
-F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.txt
+F:	Documentation/devicetree/bindings/regulator/samsung,s2m*.yaml
 F:	Documentation/devicetree/bindings/regulator/samsung,s5m*.txt
 F:	drivers/clk/clk-s2mps11.c
 F:	drivers/mfd/sec*.c
-- 
2.30.2

