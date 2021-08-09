Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74299C4320E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 59ED160EC0
	for <linux-clk@archiver.kernel.org>; Mon,  9 Aug 2021 13:11:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235370AbhHINLt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Aug 2021 09:11:49 -0400
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121]:49038
        "EHLO smtp-relay-canonical-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235344AbhHINLs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Aug 2021 09:11:48 -0400
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPS id 2365840672
        for <linux-clk@vger.kernel.org>; Mon,  9 Aug 2021 13:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1628514687;
        bh=Q3Bw+lxFxrrX2xzHWCqOWv7XU5mwkZpCcX6GjIggRT8=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=su5grzLWD7qQF82PPWDsY3TFl0u1D0r6P9KWtcwIS/SKY/E1D9XEpdsan2rXHNAmf
         yw3IACfennnoECdkCJ47sHWOTjFIzG94VMSqLB6ke6YxLVXmVejqHj4HpIRzOR5ADA
         Fi7QIcnWydi8vdxqOhtqXbtUGJjuB/xkXO8M2wLxn3prRYImCChB0VtcYuIySPheDr
         /MczywsGJ+anfNFmzoKNdHfQlYjkpWZb4P7Doueze+0JLo0USsSxfUj3gyFsBODJq6
         GlI+gmfSzsR/GKBTRmvT4bCUSqjHaAVdmTThJK1y+Tf6sAOiy3QSEyGwULcdE1813B
         vi5WOYCyLfjwQ==
Received: by mail-ed1-f71.google.com with SMTP id u4-20020a50eac40000b02903bddc52675eso8677363edp.4
        for <linux-clk@vger.kernel.org>; Mon, 09 Aug 2021 06:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q3Bw+lxFxrrX2xzHWCqOWv7XU5mwkZpCcX6GjIggRT8=;
        b=AHoEPWulfFAXMye/Q5oc455AvSgwXkFoM+BunB+P2KAYvGzYswWJ3grpL77HyZsKn+
         +seDdzVQtcD+JAWYVo+pzl95PUCSQzkC3VTPDtKym2brSENlG4e5ng9ID1PAIyGFI3B5
         XOgHNPHKDm2el6sLGoMrEZqtRUxHT+EIfW1+DUb3Magdygqr3wEBTEuah8rcwZJ9j3vv
         4S7uGOMreQV3VZBgk5Yr0G9VkfXUrnfqII8rhP2naylmthvDDb3vmk9KfveUeRXfr8E4
         CZqSUbyRa7lvqAdx8Zx7c3py+LGOaP00Mx1QU+sFpGeIezZxZPveL/5+PrAppi4T+tT5
         9YVA==
X-Gm-Message-State: AOAM531pf9bZDTtXnCI5oVsyvfLfW1CHp4WtmjSjHgKheKDsPcgCo6dO
        KtEy5wFAbTm26KSDY9zrBXVvDtQJ90O1N2jUsZuNza4O1d4oUpmKkoGEYrrGrh9Z5Vlm48sFjKK
        jz4WiX+HgjbGU0VJhzCw+3HSu9A3K8402XwP6xw==
X-Received: by 2002:a17:906:22db:: with SMTP id q27mr23111082eja.185.1628514686844;
        Mon, 09 Aug 2021 06:11:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybSchna5koo5BSMcwlS2b99488zRmUUchDhwHgpuhhR9riU1kR8tGvPwqqboVfzr6VMzyE/w==
X-Received: by 2002:a17:906:22db:: with SMTP id q27mr23111047eja.185.1628514686658;
        Mon, 09 Aug 2021 06:11:26 -0700 (PDT)
Received: from localhost.localdomain ([86.32.42.198])
        by smtp.gmail.com with ESMTPSA id cf16sm8023425edb.92.2021.08.09.06.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 06:11:26 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] dt-bindings: clock: samsung: convert Exynos4 to dtschema
Date:   Mon,  9 Aug 2021 15:09:35 +0200
Message-Id: <20210809130935.80565-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210809130935.80565-1-krzysztof.kozlowski@canonical.com>
References: <20210809130935.80565-1-krzysztof.kozlowski@canonical.com>
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
 .../bindings/clock/samsung,exynos-clock.yaml  | 29 ++++++-
 2 files changed, 28 insertions(+), 87 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/exynos4-clock.txt

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
index c7b07fcd3fa1..ea73201f259b 100644
--- a/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/samsung,exynos-clock.yaml
@@ -23,6 +23,9 @@ properties:
           - samsung,exynos3250-cmu
           - samsung,exynos3250-cmu-dmc
           - samsung,exynos3250-cmu-isp
+          - samsung,exynos4210-clock
+          - samsung,exynos4412-clock
+          - samsung,exynos4412-isp-clock
           - samsung,exynos5250-clock
           - samsung,exynos5420-clock
           - samsung,exynos5800-clock
@@ -35,11 +38,18 @@ properties:
   assigned-clocks: true
   assigned-clock-parents: true
   assigned-clock-rates: true
-  clocks: true
+  clocks:
+    description: |
+      For samsung,exynos4412-isp-clock, the input clocks should be CLK_ACLK200
+      and CLK_ACLK400_MCUISP from the main clock controller.
+
+  clock-names: true
 
   "#clock-cells":
     const: 1
 
+  power-domains: true
+
   reg:
     maxItems: 1
 
@@ -50,6 +60,23 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: samsung,exynos4412-isp-clock
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: aclk200
+            - const: aclk400_mcuisp
+      required:
+        - clocks
+        - clock-names
+        - power-domains
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>
-- 
2.30.2

