Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5723EB64D9
	for <linux-clk@archiver.kernel.org>; Fri,  7 Jul 2023 13:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230503AbjGGNDe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229872AbjGGNDd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Jul 2023 09:03:33 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DCAE6E;
        Fri,  7 Jul 2023 06:03:31 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f122ff663eso2995370e87.2;
        Fri, 07 Jul 2023 06:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688735010; x=1691327010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZNacMOqwrhoL0QSaaiHdPXWMGR4rvtaSe1YyMK5/gt0=;
        b=eR+s2fW2xs3EO4TlaA1eYSdVmAulIqsy36Tr2su/5sjz0E5/bfDpIzuvkHK4lNo0XV
         ZWEFPpoGI9IX4/cqCBnuXKcdudiDSjwIEDW6i2SEyeuGZkIZnu97uYi8G8XN4LrCFehp
         JoBxCmT136XBTThmhHl692EUeWFpbvVqzS7/lzx9N01af/29sevplxnndMm08/zvur/W
         /hSVFzlb9uxJf0IH8dZ09FWZzhueFA6g0NCmdpsfo7qx332iksCUEa3F69J0AwZnSE2U
         IYu75OU8icCnsZzFWQIAA0K57PdhME6M4c7qay1UM+z2AN8O+hg6xhlXisSHU21Fmxqg
         xxtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688735010; x=1691327010;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNacMOqwrhoL0QSaaiHdPXWMGR4rvtaSe1YyMK5/gt0=;
        b=Kcfw2ZCC28NwUkj4HGsjtA0MuykzCRksJPzX8hXrKxZrqTFC4cfaGnFxVuBAK1fa2j
         vXMGi8YVNwhvDi8FCTcEq0oGMm/prz4xVmnc7t6jE5TsELCvQy8bObxmMYC3WMk6bXTF
         aM44sKkOL5TC1rF502b1Voc+appxP23i49QYH5EB4w4df0tSEaEcwJdR9k9R1Z9lExyK
         TXD8sr32+O3hZ1snKn1MdPmQMyGNnelJYel2iDBSh0HX23X8VfjFYOwh+vixS/JZ9N3m
         /ZR6KgY2+BWNVRX6c8k77epk6bSi64XUSWGW7DHmoyYWEFoi9w477ApLvEbGNG67j7Sk
         U4/Q==
X-Gm-Message-State: ABy/qLZz8e/+XNJ48foIHQFHHGPWBxPvqnAS6M8doTLrAbw/WAWm0G6n
        a7t+qSFRrYyLVxl0p6lkQX7ztPDa5LM=
X-Google-Smtp-Source: APBJJlG0erWh4WOpt6vWO8lqZlYD8q2047PFQ9rlt2+E2nswRsagjKyLwqtF07VPmkXEtQdlAuWJ2Q==
X-Received: by 2002:a05:6512:39ca:b0:4f9:58bd:9e5a with SMTP id k10-20020a05651239ca00b004f958bd9e5amr4677188lfu.27.1688735009648;
        Fri, 07 Jul 2023 06:03:29 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id d5-20020ac24c85000000b004fa35167729sm673090lfl.159.2023.07.07.06.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:03:29 -0700 (PDT)
From:   =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] dt-bindings: clock: convert BCM53573 ILP clock to the json-schema
Date:   Fri,  7 Jul 2023 15:03:22 +0200
Message-Id: <20230707130322.9375-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Rafał Miłecki <rafal@milecki.pl>

This helps validating DTS files.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../bindings/clock/brcm,bcm53573-ilp.txt      | 36 -------------
 .../bindings/clock/brcm,bcm53573-ilp.yaml     | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 36 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.txt
 create mode 100644 Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml

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
diff --git a/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml
new file mode 100644
index 000000000000..648f68a53119
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/brcm,bcm53573-ilp.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/brcm,bcm53573-ilp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Broadcom BCM53573 ILP clock
+
+maintainers:
+  - Rafał Miłecki <rafal@milecki.pl>
+
+description: |
+  This binding is used for ILP clock (sometimes referred as "slow clock")
+  on Broadcom BCM53573 devices using Cortex-A7 CPU.
+
+  ILP's rate has to be calculated on runtime and it depends on ALP clock
+  which has to be referenced.
+
+  This clock is part of PMU (Power Management Unit), a Broadcom's device
+  handing power-related aspects. Its node must be sub-node of the PMU
+  device.
+
+properties:
+  compatible:
+    const: brcm,bcm53573-ilp
+
+  clocks:
+    description: ALP clock
+    maxItems: 1
+
+  "#clock-cells":
+    const: 0
+
+  clock-output-names:
+    const: ilp
+
+required:
+  - clocks
+  - "#clock-cells"
+  - clock-output-names
+
+additionalProperties: false
+
+examples:
+  - |
+    ilp {
+      compatible = "brcm,bcm53573-ilp";
+      clocks = <&alp>;
+      #clock-cells = <0>;
+      clock-output-names = "ilp";
+    };
-- 
2.35.3

