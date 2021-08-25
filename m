Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA0DC43216
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 13:41:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C851D610FC
	for <linux-clk@archiver.kernel.org>; Wed, 25 Aug 2021 13:41:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241420AbhHYNmj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Aug 2021 09:42:39 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:58676
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241431AbhHYNmd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Aug 2021 09:42:33 -0400
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1B03F3F322
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 13:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1629898907;
        bh=IrN4+nU4lMGaS+vyV9i4h1/xLb98LhHY+RVy2Oj75+I=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=VnruKEL1yodwfZP+bmx/1LdG+hREjPK5nv0TbJgq/HaOjhFkJUpCrrKbznVNYI+sB
         n9X8A545dCnXk+J/HpBjUsVK9/ZwGujKjK1CI3sRsHYYkKIwkSnTBqH2nfq1sksmfZ
         lK8TKghdUuXID5XRsNGJLedT5TM7GMw1iF1dmdwwHuSH/wxQ3M2Z2lNHlrkjPSZu0g
         MWzNJPiAXv7mzIqP0+CBSjnChVxYKLwdU0wfLMmSJ+r9Vc4ducu/k206mHMKIZxcs7
         M5pyW80Khuw4TuhAFc2FprvUNMxIsTuFScHzo4lXURDzb2kwOJYcv1bUgNiHMIP5TC
         lsL3x8DrfpfEA==
Received: by mail-wm1-f72.google.com with SMTP id 201-20020a1c01d2000000b002e72ba822dcso2856472wmb.6
        for <linux-clk@vger.kernel.org>; Wed, 25 Aug 2021 06:41:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IrN4+nU4lMGaS+vyV9i4h1/xLb98LhHY+RVy2Oj75+I=;
        b=UFckhIodfAmkhDsYpqn76c8cuFcBk8SjU6BkMS6iA2+rrHHEXFzioRFkAwkudVvm4Y
         y4d2A08ZhnYjjv6hUb9SmPYAylL8a4D45HZ80KaMLLzmvZbJinuXY0/S0+YRoA0ma+w9
         wa4on0Zlv9z2QsvzX2oZyvn9OKqprBzXBjJV0cpK2kr6Kn7KEQAXAbGLFxjyK8RFrsdD
         0kc3auzoWP8E4JpDqL0IA19sTcO8l2SNgXLE73/sEuTWBBKnRWvU/tuGZSUwnkH/TpOK
         p5QfYAzw0dRDIF8/wK3asLCiFaRSu5uUGQAcfAsIkYgJRlXfWCC1kXeuFL1tOSUc/L/J
         DQQA==
X-Gm-Message-State: AOAM530vOewas6C8YD0BCN0kJeZdoqHSKYcjmJNkOo4newjnV/aDbFNy
        8W3EcP82Ie28jnFbenZj+4XGCV6JzwNXw9ShDPWjTu4WaGwzn13o6wF+AwLktMuVjyEso7WEchT
        K+NZ9NBFTyYuypfsUHdgirILT33VYPgCUAKf8PQ==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr25271414wrw.357.1629898905521;
        Wed, 25 Aug 2021 06:41:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhShroR75PloeyFHsNShLECWamJ9vH6n30fQzG+3+m1+9wVzDhGFfRZcC4zbk8+SmckSvdaQ==
X-Received: by 2002:a5d:674b:: with SMTP id l11mr25271386wrw.357.1629898905292;
        Wed, 25 Aug 2021 06:41:45 -0700 (PDT)
Received: from localhost.localdomain ([79.98.113.233])
        by smtp.gmail.com with ESMTPSA id g5sm7185861wrq.80.2021.08.25.06.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 06:41:44 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Sam Protsenko <semen.protsenko@linaro.org>
Subject: [PATCH v3 5/8] dt-bindings: clock: samsung: convert Exynos4 to dtschema
Date:   Wed, 25 Aug 2021 15:40:53 +0200
Message-Id: <20210825134056.219884-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
References: <20210825134056.219884-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Merge Exynos4210 and Exynos4412 clock controller bindings to existing DT
schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/clock/exynos4-clock.txt          | 86 -------------------
 .../bindings/clock/samsung,exynos-clock.yaml  |  3 +
 .../clock/samsung,exynos4412-isp-clock.yaml   | 64 ++++++++++++++
 3 files changed, 67 insertions(+), 86 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml

diff --git a/Documentation/devicetree/bindings/clock/exynos4-clock.txt b/Documentation/devicetree/bindings/clock/exynos4-clock.txt
deleted file mode 100644
index 17bb11365354..000000000000
--- a/Documentation/devicetree/bindings/clock/exynos4-clock.txt
+++ /dev/null
@@ -1,86 +0,0 @@
-* Samsung Exynos4 Clock Controller
-
-The Exynos4 clock controller generates and supplies clock to various controllers
-within the Exynos4 SoC. The clock binding described here is applicable to all
-SoC's in the Exynos4 family.
-
-Required Properties:
-
-- compatible: should be one of the following.
-  - "samsung,exynos4210-clock" - controller compatible with Exynos4210 SoC.
-  - "samsung,exynos4412-clock" - controller compatible with Exynos4412 SoC.
-
-- reg: physical base address of the controller and length of memory mapped
-  region.
-
-- #clock-cells: should be 1.
-
-Each clock is assigned an identifier and client nodes can use this identifier
-to specify the clock which they consume.
-
-All available clocks are defined as preprocessor macros in
-dt-bindings/clock/exynos4.h header and can be used in device
-tree sources.
-
-Example 1: An example of a clock controller node is listed below.
-
-	clock: clock-controller@10030000 {
-		compatible = "samsung,exynos4210-clock";
-		reg = <0x10030000 0x20000>;
-		#clock-cells = <1>;
-	};
-
-Example 2: UART controller node that consumes the clock generated by the clock
-	   controller. Refer to the standard clock bindings for information
-	   about 'clocks' and 'clock-names' property.
-
-	serial@13820000 {
-		compatible = "samsung,exynos4210-uart";
-		reg = <0x13820000 0x100>;
-		interrupts = <0 54 0>;
-		clocks = <&clock CLK_UART2>, <&clock CLK_SCLK_UART2>;
-		clock-names = "uart", "clk_uart_baud0";
-	};
-
-Exynos4412 SoC contains some additional clocks for FIMC-ISP (Camera ISP)
-subsystem. Registers for those clocks are located in the ISP power domain.
-Because those registers are also located in a different memory region than
-the main clock controller, a separate clock controller has to be defined for
-handling them.
-
-Required Properties:
-
-- compatible: should be "samsung,exynos4412-isp-clock".
-
-- reg: physical base address of the ISP clock controller and length of memory
-  mapped region.
-
-- #clock-cells: should be 1.
-
-- clocks: list of the clock controller input clock identifiers,
-  from common clock bindings, should point to CLK_ACLK200 and
-  CLK_ACLK400_MCUISP clocks from the main clock controller.
-
-- clock-names: list of the clock controller input clock names,
-  as described in clock-bindings.txt, should be "aclk200" and
-  "aclk400_mcuisp".
-
-- power-domains: a phandle to ISP power domain node as described by
-  generic PM domain bindings.
-
-Example 3: The clock controllers bindings for Exynos4412 SoCs.
-
-	clock: clock-controller@10030000 {
-		compatible = "samsung,exynos4412-clock";
-		reg = <0x10030000 0x18000>;
-		#clock-cells = <1>;
-	};
-
-	isp_clock: clock-controller@10048000 {
-		compatible = "samsung,exynos4412-isp-clock";
-		reg = <0x10048000 0x1000>;
-		#clock-cells = <1>;
-		power-domains = <&pd_isp>;
-		clocks = <&clock CLK_ACLK200>, <&clock CLK_ACLK400_MCUISP>;
-		clock-names = "aclk200", "aclk400_mcuisp";
-	};
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
index 9af77bdee12d..4e8062860986 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -23,6 +23,8 @@ properties:
           - samsung,exynos3250-cmu
           - samsung,exynos3250-cmu-dmc
           - samsung,exynos3250-cmu-isp
+          - samsung,exynos4210-clock
+          - samsung,exynos4412-clock
           - samsung,exynos5250-clock
       - items:
           - enum:
@@ -31,6 +33,7 @@ properties:
           - const: syscon
 
   clocks:
+    minItems: 1
     maxItems: 4
 
   "#clock-cells":
diff --git a/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
new file mode 100644
index 000000000000..7b405bcd6fef
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos4412-isp-clock.yaml
@@ -0,0 +1,64 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/samsung,exynos4412-isp-clock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos4412 SoC ISP clock controller
+
+maintainers:
+  - Chanwoo Choi <cw00.choi@samsung.com>
+  - Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
+  - Sylwester Nawrocki <s.nawrocki@samsung.com>
+  - Tomasz Figa <tomasz.figa@gmail.com>
+
+description: |
+  Clock controller for Samsung Exynos4412 SoC FIMC-ISP (Camera ISP)
+  All available clocks are defined as preprocessor macros in
+  dt-bindings/clock/ headers.
+
+properties:
+  compatible:
+    const: samsung,exynos4412-isp-clock
+
+  clocks:
+    items:
+      - description: CLK_ACLK200 from the main clock controller
+      - description: CLK_ACLK400_MCUISP from the main clock controller
+
+  clock-names:
+    items:
+      - const: aclk200
+      - const: aclk400_mcuisp
+
+  "#clock-cells":
+    const: 1
+
+  power-domains:
+    maxItems: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - "#clock-cells"
+  - clocks
+  - clock-names
+  - power-domains
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/exynos4412.h>
+    clock-controller@10048000 {
+        compatible = "samsung,exynos4412-isp-clock";
+        reg = <0x10048000 0x1000>;
+        #clock-cells = <1>;
+        power-domains = <&pd_isp>;
+        clocks = <&clock CLK_ACLK200>, <&clock CLK_ACLK400_MCUISP>;
+        clock-names = "aclk200", "aclk400_mcuisp";
+    };
+
-- 
2.30.2

