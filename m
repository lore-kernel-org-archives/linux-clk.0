Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62A1BC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  1 Oct 2021 09:42:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E64B61881
	for <linux-clk@archiver.kernel.org>; Fri,  1 Oct 2021 09:42:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353182AbhJAJno (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 1 Oct 2021 05:43:44 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:57052
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1353179AbhJAJng (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 1 Oct 2021 05:43:36 -0400
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com [209.85.167.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 07761402D9
        for <linux-clk@vger.kernel.org>; Fri,  1 Oct 2021 09:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633081312;
        bh=TZ6Uu0tQCz5AyCqqeh9+i4Gj324NP6x0s8pC2ot1SVM=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=gvL35wwJ63VxsCh5BRX1Qe0tkuXCSbzdoII9Q2ypzs/MplAjPyksUMQOsgm2sk+k/
         lUA/z3KTA70oRsC7znboQ4FkWarW3qfuTZHFYCBWZAA1XTSctEUjg1IYiz+75ugT7w
         J6m+SqIjJnte/Ir25HUjvOojOI871iW+sS2T15vBs4P3tH4tlbFwdbKH3dqIDE+jZC
         wXnEKquiuVBob8fX+UjyGK4dNo8f+vyjEOQck2GndqgICEKJQeFw47RmBrLa/I8JWG
         16KvDAPpWBYupg3uACu/nS6G0e/K5IWV/3cXbws+LlLMGmvvWE1vP93/9b/U9anDTM
         vG1lRhnbmJU0w==
Received: by mail-lf1-f69.google.com with SMTP id a28-20020a056512021c00b003f5883dcd4bso8417946lfo.1
        for <linux-clk@vger.kernel.org>; Fri, 01 Oct 2021 02:41:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TZ6Uu0tQCz5AyCqqeh9+i4Gj324NP6x0s8pC2ot1SVM=;
        b=3bRDUyZOrFWNyspC2DcmlxZlU+qvxcxK1se4W5+D1WWHWMEyMz45FJky3b0ldO0i3x
         xT1b4n46rgdgL3rzSgy65+xt/4Jwwxf4ZmSVm3l5doi3qiHUkjaYObcF/0kovFd2Nuo1
         T8SM/TH9vun9RYA/eq1mBB5/AKKxLxmL3AoFMX06ffDMv6yTcP8x7n1wAY4aGS57VGFz
         7KX/nyI60611ChMhJMxRG2kA2L4YNYby9x6ARqvZvsa7tzxJiXNG9KW8K9zaXcTHWv+4
         hp4PuQGLbIiVVpGy6vX8MOOgkiFv2YGYjdRzmJmpIfxzuC9uPKkAGzHUgMTBOqdVSnvz
         lZfQ==
X-Gm-Message-State: AOAM532YbGgz7AIhHMaIkyYHEGq+hbqvvv8WVXjInUiKENw+jQYtWDEG
        FZgGDK+aBDiPyuLyY83gi+PoEBLO/0B7elZ4DDCtrer+IEjOb2slmDq9vDIrV/2KH43Jj9XRy2O
        Zwc/9+z2NogVVxKhuQf+BvCb0qdnVNmGYxlWc8A==
X-Received: by 2002:a05:651c:150b:: with SMTP id e11mr11058559ljf.289.1633081311382;
        Fri, 01 Oct 2021 02:41:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz8DFSSkH9pun7EehxFnzVkDd8WtPr7R2JloziLR29SV8ZyYnpho2qh+jVlRgyD0gd++M4Tdg==
X-Received: by 2002:a05:651c:150b:: with SMTP id e11mr11058538ljf.289.1633081311121;
        Fri, 01 Oct 2021 02:41:51 -0700 (PDT)
Received: from localhost.localdomain ([193.178.187.25])
        by smtp.gmail.com with ESMTPSA id g29sm673784lfj.212.2021.10.01.02.41.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 02:41:50 -0700 (PDT)
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
Subject: [PATCH v2 05/10] regulator: dt-bindings: samsung,s2mpa01: convert to dtschema
Date:   Fri,  1 Oct 2021 11:41:01 +0200
Message-Id: <20211001094106.52412-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
References: <20211001094106.52412-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the regulators of Samsung S2MPA01 PMIC to DT schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/regulator/samsung,s2mpa01.txt    | 79 -------------------
 .../bindings/regulator/samsung,s2mpa01.yaml   | 69 ++++++++++++++++
 2 files changed, 69 insertions(+), 79 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
 create mode 100644 Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml

diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
deleted file mode 100644
index bae3c7f838cf..000000000000
--- a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.txt
+++ /dev/null
@@ -1,79 +0,0 @@
-Binding for Samsung S2MPA01 regulator block
-===========================================
-
-This is a part of device tree bindings for S2M family multi-function devices.
-More information can be found in bindings/mfd/sec-core.txt file.
-
-The S2MPA01 device provide buck and LDO regulators.
-
-To register these with regulator framework instantiate under main device node
-a sub-node named "regulators" with more sub-nodes for each regulator using the
-common regulator binding documented in:
- - Documentation/devicetree/bindings/regulator/regulator.txt
-
-
-Names of regulators supported by S2MPA01 device:
-	- LDOn
-		  - valid values for n are 1 to 26
-		  - Example: LDO1, LD02, LDO26
-	- BUCKn
-		  - valid values for n are 1 to 10.
-		  - Example: BUCK1, BUCK2, BUCK9
-Note: The 'n' in LDOn and BUCKn represents the LDO or BUCK number
-as per the datasheet of device.
-
-
-Optional properties of buck regulator nodes under "regulators" sub-node:
- - regulator-ramp-delay: ramp delay in uV/us. May be 6250, 12500
-   (default), 25000, or 50000. May be 0 for disabling the ramp delay on
-   BUCK{1,2,3,4}.
-
-   In the absence of the regulator-ramp-delay property, the default ramp
-   delay will be used.
-
-   Note: Some bucks share the ramp rate setting i.e. same ramp value
-   will be set for a particular group of bucks so provide the same
-   regulator-ramp-delay value for them.
-   Groups sharing ramp rate:
-    - buck{1,6},
-    - buck{2,4},
-    - buck{8,9,10}.
-
-Example:
-
-	s2mpa01_pmic@66 {
-		compatible = "samsung,s2mpa01-pmic";
-		reg = <0x66>;
-
-		regulators {
-			ldo1_reg: LDO1 {
-				regulator-name = "VDD_ALIVE";
-				regulator-min-microvolt = <1000000>;
-				regulator-max-microvolt = <1000000>;
-			};
-
-			ldo2_reg: LDO2 {
-				regulator-name = "VDDQ_MMC2";
-				regulator-min-microvolt = <2800000>;
-				regulator-max-microvolt = <2800000>;
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
diff --git a/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
new file mode 100644
index 000000000000..f2c39d183263
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/samsung,s2mpa01.yaml
@@ -0,0 +1,69 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/samsung,s2mpa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPA01 Power Management IC regulators
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The S2MPA01 provides buck and LDO regulators.
+
+  See also Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml for
+  additional information and example.
+
+patternProperties:
+  # 26 LDOs
+  "^LDO([1-9]|1[0-9]|2[0-6])$":
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
+      regulator-ramp-delay:
+        enum: [0, 6250, 12500, 25000, 50000]
+        default: 12500
+        description: |
+          May be 0 for disabling the ramp delay on BUCK{1,2,3,4}.
+
+          In the absence of the regulator-ramp-delay property, the default ramp
+          delay will be used.
+
+          Note: Some bucks share the ramp rate setting i.e. same ramp value
+          will be set for a particular group of bucks so provide the same
+          regulator-ramp-delay value for them.
+          Groups sharing ramp rate:
+            * buck{1,6},
+            * buck{2,4},
+            * buck{8,9,10}.
+
+    required:
+      - regulator-name
+
+    unevaluatedProperties: false
+
+additionalProperties: false
-- 
2.30.2

