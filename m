Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3894C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D30FB61029
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 11:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242163AbhJHLoy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Oct 2021 07:44:54 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:47760
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S243304AbhJHLnl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Oct 2021 07:43:41 -0400
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 113EF40009
        for <linux-clk@vger.kernel.org>; Fri,  8 Oct 2021 11:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633693219;
        bh=ot49W0BLovtQBZiy0mCJysagJRdZUZ8sfEESkGMXTWw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=ABdF9lW27fn1lpB4kFR2Un06XcY0EbUsfPIaj4oy8Nj0kXKk7o2phBvS2FNcMA/ye
         Eq6TB8keh3TJdR8M3e2JIWnaYIn0SuzEp2zSNbQ0yXf84pjozL5+p3jGmmyy28xWW7
         LfpHcQQWE/Z6C5tJoybjBx66e1G8/P1xO/2a3CKJy1+1PzCbpbTkCF4HmEeJEyH+6m
         09uJLRckJUtSDunFdhyxVc8bwe1hsBrQPYc7rQykiQL06XZA9ljjetaebLckg9geq7
         TPQZuLaDhxk/YTKSuBImKUiJhuoEBpM1o8F4X/oFM0f9L22EhocTqOZZxx7IqpbntI
         hBbHuSPGNG0LA==
Received: by mail-ed1-f72.google.com with SMTP id v2-20020a50f082000000b003db24e28d59so8941972edl.5
        for <linux-clk@vger.kernel.org>; Fri, 08 Oct 2021 04:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ot49W0BLovtQBZiy0mCJysagJRdZUZ8sfEESkGMXTWw=;
        b=hajE3rRO6PLkwGxVG8f6SwA9pdzWU54OK8RlKjEU2CCAHzLzhnb9RuWyBMsF4X9nCC
         Xr8AU5ciEdyAL9FEbwFm/M0GQMuCA1+TmGRA3dG9tdnvCZaUsjyvibGvg7yv8G0s7WiL
         8b8UtwbVffeiI6eTa4DX9F4/7FIbRu+ZPtqxCz2sel/G7Kc9t2luI8UKBrLDqYCprFQa
         yH+Vq/L5/QVu03tmIovr2aO5BpLCnBKksemEBqH4N51zRNBvE8ekKJAJfj0bTY4AdIEi
         qvu/9Y0idm7fIOra4e8bbQi9yxlBTBQt4rz85bdBsvabAsvagHFHVDjdhWJ6qze5KABe
         z+nw==
X-Gm-Message-State: AOAM533eF8NsQyS+7CE+llAWMjWSDQSGM5XG5/DeRRqWr0wREFFW7zGw
        lWhWbhcb1G8rsAKLqphuCN6JYeBR++KkheEz0eMU+jHo/v2f948GhH/T7DPou5QxePFclrI7Ow2
        +JXv/4JnHaILrDsFziJl2XuVow55iRlRGHP5MaQ==
X-Received: by 2002:a05:6402:485:: with SMTP id k5mr14153362edv.257.1633693218392;
        Fri, 08 Oct 2021 04:40:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4QuirGm9nppb97oQk+JI8N+A0wj7clDGbcRopxUW7YNhpFXnCX8Vk/nDDFlgNN8xc/QtNFQ==
X-Received: by 2002:a05:6402:485:: with SMTP id k5mr14153335edv.257.1633693218246;
        Fri, 08 Oct 2021 04:40:18 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id c17sm901437edu.11.2021.10.08.04.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 04:40:17 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Lee Jones <lee.jones@linaro.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 08/10] dt-bindings: mfd: samsung,s2mpa01: convert to dtschema
Date:   Fri,  8 Oct 2021 13:39:30 +0200
Message-Id: <20211008113931.134847-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
References: <20211008113723.134648-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Convert the MFD part of Samsung S2MPA01 PMIC to DT schema format.
Previously the bindings were mostly in mfd/samsung,sec-core.txt.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/mfd/samsung,s2mpa01.yaml         | 91 +++++++++++++++++++
 1 file changed, 91 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml

diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
new file mode 100644
index 000000000000..017befdf8adb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/samsung,s2mpa01.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/samsung,s2mpa01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung S2MPA01 Power Management IC
+
+maintainers:
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+
+description: |
+  This is a part of device tree bindings for S2M and S5M family of Power
+  Management IC (PMIC).
+
+  The Samsung S2MPA01 is a Power Management IC which includes voltage
+  and current regulators, RTC, clock outputs and other sub-blocks.
+
+properties:
+  compatible:
+    const: samsung,s2mpa01-pmic
+
+  interrupts:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    $ref: ../regulator/samsung,s2mpa01.yaml
+    description:
+      List of child nodes that specify the regulators.
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
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@66 {
+            compatible = "samsung,s2mpa01-pmic";
+            reg = <0x66>;
+
+            regulators {
+                ldo1_reg: LDO1 {
+                    regulator-name = "VDD_ALIVE";
+                    regulator-min-microvolt = <1000000>;
+                    regulator-max-microvolt = <1000000>;
+                };
+
+                ldo2_reg: LDO2 {
+                    regulator-name = "VDDQ_MMC2";
+                    regulator-min-microvolt = <2800000>;
+                    regulator-max-microvolt = <2800000>;
+                    regulator-always-on;
+                };
+
+                // ...
+
+                buck1_reg: BUCK1 {
+                    regulator-name = "vdd_mif";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1350000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                };
+
+                buck2_reg: BUCK2 {
+                    regulator-name = "vdd_arm";
+                    regulator-min-microvolt = <950000>;
+                    regulator-max-microvolt = <1350000>;
+                    regulator-always-on;
+                    regulator-boot-on;
+                    regulator-ramp-delay = <50000>;
+                };
+
+                // ...
+            };
+        };
+    };
-- 
2.30.2

