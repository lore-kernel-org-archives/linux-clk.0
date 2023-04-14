Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2461CC77B6E
	for <linux-clk@archiver.kernel.org>; Fri, 14 Apr 2023 11:26:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230096AbjDNL0S (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 14 Apr 2023 07:26:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229996AbjDNL0R (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 14 Apr 2023 07:26:17 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CDA9D8A65
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 04:26:13 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id bx15so16607912ljb.7
        for <linux-clk@vger.kernel.org>; Fri, 14 Apr 2023 04:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681471572; x=1684063572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hZACr2qT1r+Pq/JG1rFFm+OjlMblwToTQZN+UEc9YSE=;
        b=YLnQYGCJFK1sjLKyNQ3cuARkxKXbepwbwtmbk6Oo/go3HDUl2YF1+mnWdBNd1NKgkT
         LsGxhTuYvED38/uLsGvXOX4CqmaairbS10svzUdBeY5cc6C4/p53Nt5XPJLxquAkoNGI
         nJeBcH7ndpb+f6xcQvVQjlWt6rVXxTE3JuIRvO/yWDjIDPbotvSz/ZoTHC+NTKq3H+cv
         BhMslCfWXY2i1U+jnjj1AL71PRvODqoAKqAIvOGksN9j9GSzJGvwLIKwP1KXEqfOXBeG
         grVfTdsAMSSe4oc5LCUxf8RABsiS7Y2Zt7/tWy+qzOnyke8tJ66U/DoAM2AL/ziBSaSJ
         FUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681471572; x=1684063572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hZACr2qT1r+Pq/JG1rFFm+OjlMblwToTQZN+UEc9YSE=;
        b=PdfOy7Tl/hXlsMtPM8eqsbTkgLKbNkpThPj6z938OMDyyAhUWGrdr8AcvYXKqXAmEx
         QyMq7iVQK9Glc1vWalAlHUGk6SsIpdpNfIwEUUMLcx8bi6/NSA28/cfcwEfg2ZglkUCH
         Ty0zU9x0ONAPqUOAac13z7TZn7F5tVD0aVEg/j4PtDPtQdV4Wplt1jrXdtEyeCyc1cZz
         AmVrBNQh1QE8BhQQpN1opQrPRCpIyWMcaWBXqcdliCvIKlBvxNpuhCypn6Y7PqbXFYTT
         Echpe4bNSqwbNGu00IBoaA53n9TjldPEkQ7OwDiqAWtUIFZ7KzYhhLQfBYUZ3G7/QJNi
         ORYw==
X-Gm-Message-State: AAQBX9diPYWK/7PSDstR0T9O2/GHRd7jZ7gUpsihHi0ZAOFzhUZmfHFQ
        +h5HSvmLW38NHLtLQ8h29B7J9A==
X-Google-Smtp-Source: AKy350aP/+UPWzkbCS3EJKDnIrjBwYL8ESv1As/svYi+jJohuIuHiK7x28QNSm3RUICN4+G1fmht+Q==
X-Received: by 2002:a2e:9d84:0:b0:295:d7a8:559b with SMTP id c4-20020a2e9d84000000b00295d7a8559bmr1615180ljj.10.1681471571922;
        Fri, 14 Apr 2023 04:26:11 -0700 (PDT)
Received: from [192.168.1.101] (abyl123.neoplus.adsl.tpnet.pl. [83.9.31.123])
        by smtp.gmail.com with ESMTPSA id f2-20020a19ae02000000b004ecb06acbb3sm738430lfc.281.2023.04.14.04.26.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Apr 2023 04:26:11 -0700 (PDT)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Date:   Fri, 14 Apr 2023 13:26:08 +0200
Subject: [PATCH v2 1/2] dt-bindings: clock: qcom,videocc: Add SM8350
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230413-topic-lahaina_vidcc-v2-1-f721d507e555@linaro.org>
References: <20230413-topic-lahaina_vidcc-v2-0-f721d507e555@linaro.org>
In-Reply-To: <20230413-topic-lahaina_vidcc-v2-0-f721d507e555@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Taniya Das <tdas@codeaurora.org>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1681471569; l=4559;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yDNgI5vaFDUinUfBBr+IuGY3i/nybTj/plx2VvRXMcU=;
 b=vV8EFqIf+B1ySfObURnPZtaBo/OlDkvqpZX27ubloRTsoJGr+N0Ng8rwMNamtZEWSJOPy4ITzFpR
 cyJ0ULJMDKcIlEfFlIf8OO9N/VkRMeKeJOggAYg0MdLkoDOMNByE
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

SM8350, like most recent higher-end chips has a separate clock
controller block just for the Venus IP. Document it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml    | 29 +++++++++++++++++-
 include/dt-bindings/clock/qcom,sm8350-videocc.h    | 35 ++++++++++++++++++++++
 include/dt-bindings/reset/qcom,sm8350-videocc.h    | 18 +++++++++++
 3 files changed, 81 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 2b07146161b4..6d892b0f2306 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -19,6 +19,8 @@ description: |
     include/dt-bindings/clock/qcom,videocc-sdm845.h
     include/dt-bindings/clock/qcom,videocc-sm8150.h
     include/dt-bindings/clock/qcom,videocc-sm8250.h
+    include/dt-bindings/clock/qcom,videocc-sm8350.h
+    include/dt-bindings/reset/qcom,videocc-sm8350.h
 
 properties:
   compatible:
@@ -28,6 +30,7 @@ properties:
       - qcom,sdm845-videocc
       - qcom,sm8150-videocc
       - qcom,sm8250-videocc
+      - qcom,sm8350-videocc
 
   clocks:
     minItems: 1
@@ -63,7 +66,6 @@ required:
   - compatible
   - reg
   - clocks
-  - clock-names
   - '#clock-cells'
   - '#reset-cells'
   - '#power-domain-cells'
@@ -85,6 +87,9 @@ allOf:
           items:
             - const: bi_tcxo
 
+      required:
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -101,6 +106,9 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
 
+      required:
+        - clock-names
+
   - if:
       properties:
         compatible:
@@ -119,6 +127,25 @@ allOf:
             - const: bi_tcxo
             - const: bi_tcxo_ao
 
+      required:
+        - clock-names
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sm8350-videocc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Board active XO source
+            - description: Board sleep clock
+
+      required:
+        - power-domains
+
 additionalProperties: false
 
 examples:
diff --git a/include/dt-bindings/clock/qcom,sm8350-videocc.h b/include/dt-bindings/clock/qcom,sm8350-videocc.h
new file mode 100644
index 000000000000..b6945a448676
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8350-videocc.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8350_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8350_H
+
+/* Clocks */
+#define VIDEO_CC_AHB_CLK_SRC					0
+#define VIDEO_CC_MVS0_CLK					1
+#define VIDEO_CC_MVS0_CLK_SRC					2
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				3
+#define VIDEO_CC_MVS0C_CLK					4
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				5
+#define VIDEO_CC_MVS1_CLK					6
+#define VIDEO_CC_MVS1_CLK_SRC					7
+#define VIDEO_CC_MVS1_DIV2_CLK					8
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				9
+#define VIDEO_CC_MVS1C_CLK					10
+#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC				11
+#define VIDEO_CC_SLEEP_CLK					12
+#define VIDEO_CC_SLEEP_CLK_SRC					13
+#define VIDEO_CC_XO_CLK_SRC					14
+#define VIDEO_PLL0						15
+#define VIDEO_PLL1						16
+
+/* GDSCs */
+#define MVS0C_GDSC						0
+#define MVS1C_GDSC						1
+#define MVS0_GDSC						2
+#define MVS1_GDSC						3
+
+#endif
diff --git a/include/dt-bindings/reset/qcom,sm8350-videocc.h b/include/dt-bindings/reset/qcom,sm8350-videocc.h
new file mode 100644
index 000000000000..df7a808720ee
--- /dev/null
+++ b/include/dt-bindings/reset/qcom,sm8350-videocc.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_RESET_QCOM_VIDEO_CC_SM8350_H
+#define _DT_BINDINGS_RESET_QCOM_VIDEO_CC_SM8350_H
+
+#define CVP_VIDEO_CC_INTERFACE_BCR				0
+#define CVP_VIDEO_CC_MVS0_BCR					1
+#define VIDEO_CC_MVS0C_CLK_ARES					2
+#define CVP_VIDEO_CC_MVS0C_BCR					3
+#define CVP_VIDEO_CC_MVS1_BCR					4
+#define VIDEO_CC_MVS1C_CLK_ARES					5
+#define CVP_VIDEO_CC_MVS1C_BCR					6
+
+#endif

-- 
2.40.0

