Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1639EC433E0
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 04:13:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DB142223E4
	for <linux-clk@archiver.kernel.org>; Mon, 18 Jan 2021 04:13:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732115AbhARENp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Jan 2021 23:13:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732101AbhARENl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Jan 2021 23:13:41 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E3C9C061796
        for <linux-clk@vger.kernel.org>; Sun, 17 Jan 2021 20:12:36 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id i7so10145474pgc.8
        for <linux-clk@vger.kernel.org>; Sun, 17 Jan 2021 20:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SajeAnD/bM3T+Qtfi1lyQyoeSgIHCjSTfGa4G04tdEU=;
        b=C03eLdzTC8yp1Gau/ZSxf+IRYVt5U4z483XV1CHyli2tAa8QDkftqwbvma3j9dpbVL
         1EN+rejAmkLtuZ/PPtV2u9V8mTAPzRsSoNoC8UWjxsgQjXWLSyBAg4k+VqvG5LtIHNgZ
         3Hfb8WDEha2d9eTfPCfcmUMTCNoAoG/ZbunD74bFfIaI0K774XBUa7vYFkq+urjO1WDM
         Gmu2wL1XFW3q9DXQuIz6tiQeOPFJxyI2hGWfLEulHzvw0LtMSjiMYzvJHnWU/tmWLIBV
         TabM2X5eVPoVm1SLPRqnzY4Eg17lGf1ERfgpTS/iv86pcBLAgt4vA5b0L+f3/L48rBnD
         hVjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SajeAnD/bM3T+Qtfi1lyQyoeSgIHCjSTfGa4G04tdEU=;
        b=doVsHAC1MwcERYfVzTtmXuShR9N0mVV0ZUw+EXrYtdJEB357k9+zw8jdP4Lowuffr1
         Bf5e7gJONu5YmbCOSr3Nrh3SRrv77dTE3qejIQsMXA43n9Bqd/+kGtGC64Fu3Abgys/3
         pdCjlqL+S0WTkiUfsL7su78ZIiZmExiBPPPRtB2wD0wniuDSv731wMRzMgouRMZ/Wx5L
         2PQnpbFj9d68xavmTm+rbjLDrhv+6VW3m6d8c2SANMbsTlJ2Hf8INIBF7zlZdcHCAGOr
         IET6pgfc4FQd1Op8cXOY8ui6TFFGwYWgDSeGp5iJ840xGkhr+LLOwHbZa5yS/fdwpPuT
         ZFPg==
X-Gm-Message-State: AOAM531BHSziDPZmWxyvlnmqvh1dkidezglh7P1CHY2j5BBUHmSE3KiG
        NWV1x6VW8ZGbuovgzy5LkJBb
X-Google-Smtp-Source: ABdhPJw4926kqojiehh7sKxQnSVQDNFboJxACl+ctCL71e7hu5cMhEIzVGp1inNWucqpUFr4kV1Psw==
X-Received: by 2002:aa7:85d2:0:b029:1a2:73fe:5c28 with SMTP id z18-20020aa785d20000b02901a273fe5c28mr24296279pfn.40.1610943155657;
        Sun, 17 Jan 2021 20:12:35 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.182])
        by smtp.gmail.com with ESMTPSA id h15sm6727319pja.4.2021.01.17.20.12.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jan 2021 20:12:35 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/5] dt-bindings: clock: Add Qualcomm A7 PLL binding
Date:   Mon, 18 Jan 2021 09:41:54 +0530
Message-Id: <20210118041156.50016-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
References: <20210118041156.50016-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add devicetree YAML binding for Cortex A7 PLL clock in Qualcomm
platforms like SDX55.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../devicetree/bindings/clock/qcom,a7pll.yaml | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,a7pll.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
new file mode 100644
index 000000000000..8666e995725f
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,a7pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm A7 PLL Binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description:
+  The A7 PLL on the Qualcomm platforms like SDX55 is used to provide high
+  frequency clock to the CPU.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sdx55-a7pll
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 0
+
+  clocks:
+    items:
+      - description: board XO clock
+
+  clock-names:
+    items:
+      - const: bi_tcxo
+
+required:
+  - compatible
+  - reg
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    a7pll: clock@17808000 {
+        compatible = "qcom,sdx55-a7pll";
+        reg = <0x17808000 0x1000>;
+        clocks = <&rpmhcc RPMH_CXO_CLK>;
+        clock-names = "bi_tcxo";
+        #clock-cells = <0>;
+    };
-- 
2.25.1

