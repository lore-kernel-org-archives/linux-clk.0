Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C62CC43217
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59E3D61075
	for <linux-clk@archiver.kernel.org>; Wed,  6 Oct 2021 13:24:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238404AbhJFN0s (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 6 Oct 2021 09:26:48 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:38182
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238845AbhJFN0W (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Oct 2021 09:26:22 -0400
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com [209.85.167.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 486AB3FFF6
        for <linux-clk@vger.kernel.org>; Wed,  6 Oct 2021 13:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633526651;
        bh=ot49W0BLovtQBZiy0mCJysagJRdZUZ8sfEESkGMXTWw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=cFhBn7f8Zc5RheouS0w9GCrGxIY7zdUSAhsn6twZbVnxXSphO42tE9S61H/y6S8Qt
         CYInvLghXYy34oWZfElvLPlLwIO0S8Yo9YsdruTvu2Ao0qVKjy5DhGb/lPPFkVn2QJ
         X3AALXzM9t9hpA6JjDcSwgaWh5nxLxUkkZAYjFe7ZMIVKo+WEsvJfj4COsQbl58mII
         JCaH5P07vsVgvKcMJEin+0BvokieXcF1DB1IS/+XqBXY85uwB2OKnxUkap5cbFwKJq
         GCaGckxut0JB24WKxI5BmITe4xfRU1p+OWtjtwt3gI1kPYMIdMT+dF0evcO/pJnB1T
         jH9B2nkd7U2Sg==
Received: by mail-lf1-f72.google.com with SMTP id t14-20020ac24c0e000000b003fd392f9a5eso1970727lfq.13
        for <linux-clk@vger.kernel.org>; Wed, 06 Oct 2021 06:24:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ot49W0BLovtQBZiy0mCJysagJRdZUZ8sfEESkGMXTWw=;
        b=wa/+eK8N4dBg6AEbs023fw7J+bVm7PiKk6G30bPMjXNTzMcK4dbqJsxYvUnjlaD16P
         167QiB0NJIgPesWs5uYTfBdvszNuK2oilbhPTenZ7VlXRb8VGCymaMyzJsvFKezuiDi5
         RNrfEkkNdEB1sJ9A25gjKzER/FMDIb64eq2oNt02eKfoUxol9xbHYAvVcj58dXW/+IO8
         ahEf/KVhfZdxZ7LQp/PdDyaa0/0IWq4JaUSZc21EgsC0Ibn4AcUUirSpQJXKxtZFTFzz
         bf2p5KkdF0aM0hKq9lajtaSvl8uww7UO4ki+yws4QE5odRDSvUny3Hu//JyqWXnOrrPg
         LGOA==
X-Gm-Message-State: AOAM53371UNNrHL5xnYbzFkULlP+KYvI3K5y8c7lBXyPj6YzGRNc5h4g
        0r8YcqPq+iwQlc4/FTyyi8TQE06dUliImFlUZ2qde8FjLtVThWWjOjWgkyJm/4hfBP88OZxq60d
        ZKzfwGNbpNPRHhUCb19CyEZpFg3PGGwylcDcl0Q==
X-Received: by 2002:ac2:4e6b:: with SMTP id y11mr10008317lfs.439.1633526650530;
        Wed, 06 Oct 2021 06:24:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxRxWfeaApDlIsaaR/SPlEtiRdyXJSqfeqYb5MncOtQ/2qAc4kIZjgn5flRv4cH2XjMqUQOKw==
X-Received: by 2002:ac2:4e6b:: with SMTP id y11mr10008289lfs.439.1633526650353;
        Wed, 06 Oct 2021 06:24:10 -0700 (PDT)
Received: from localhost.localdomain (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id y12sm2002819lfg.115.2021.10.06.06.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 06:24:09 -0700 (PDT)
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
Subject: [PATCH v3 08/10] dt-bindings: mfd: samsung,s2mpa01: convert to dtschema
Date:   Wed,  6 Oct 2021 15:23:22 +0200
Message-Id: <20211006132324.76008-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
References: <20211006132324.76008-1-krzysztof.kozlowski@canonical.com>
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

