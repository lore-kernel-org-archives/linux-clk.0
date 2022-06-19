Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F93ECCA47E
	for <linux-clk@archiver.kernel.org>; Sun, 19 Jun 2022 21:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237348AbiFSV1m (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 19 Jun 2022 17:27:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233624AbiFSV1l (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 19 Jun 2022 17:27:41 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BED5AE4E
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:27:39 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id y32so14397612lfa.6
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 14:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JOBjrXoPoH1ofPIXqu96DbxIuUW2WoHytXZVgEy9tqQ=;
        b=MO5lHwmYa3IFl+fJuRRPxaGwclmb5GcNz8UBoBeCP+/0nGfGdzjRQV1gXyiysyJys8
         VRq/0j3nVEiHWk+1yJRcIUhfmWS1Y4Hd7KsyWZVYx+XVV2hCk8J2S+ZzyC4MWZF2A8CH
         wtxmlHwVIRb+3zOCrwuT6F+Z5roD9qidjVqxm8oWvhOjKpA5Sh2zL+aAWy6bdNeRWsX6
         L7VOBoCVTaH6H3Etrvf2IxdtXkgzgl0sPz3CC2MYhe4daj8CXv2E25r2EEKWAPYkFx/I
         l33Z+mv5lmOXZVe7K2tOV3L07rEUHESTVF/clrnt36je3277kA9brComaJd5LJBANZEr
         kBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JOBjrXoPoH1ofPIXqu96DbxIuUW2WoHytXZVgEy9tqQ=;
        b=e1hhmg+a6fdXwiF5HWjzLZA8ZmVVE1YWMouHegVS9K8L0GHEhnwKiuC513a4B+CCor
         SZY+7dvOBo48CExbIPHbu/N+vpIGAI8WlpxSGuEvl0TbZy6VUD7ojUnCfKj2ry2LMJc5
         LUerp7k7SehRIZEjKOU1nTovVNvB6Z2LqOVmvJbaT9yC6+hFj6OEgaooGOU5prp0LyLR
         PKW2S5aI8sC5x7MgU3zrmWDFJgc5WE5kELhg9DspiwtW8/Jxvya7VoWxXRxjYl6gNOvE
         8e/OYTmWM7CX7xRkyuEoj3IX1y6igSaoH067eU9kFDQ+5mg6fmLmstLa9215lnkdphcd
         Qoqw==
X-Gm-Message-State: AJIora8xdNJGKe+yCNbD3xFUiO3Rz3N4JP0D6xPk1Z0iskYKhg5jKy+/
        gI49KH6Fl1EEJGo08+E3QOXFJQ==
X-Google-Smtp-Source: AGRyM1vwXUqK6yxld9+Kj0Qx9SM+AAzV6MrAksBkHLkaI9+QlLV86hYQ51Eus6mp9Dsy4PTjS5K0rg==
X-Received: by 2002:a05:6512:1050:b0:47d:c714:10ba with SMTP id c16-20020a056512105000b0047dc71410bamr11539324lfb.165.1655674057695;
        Sun, 19 Jun 2022 14:27:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s19-20020a056512215300b004796a17246esm649078lfr.252.2022.06.19.14.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 14:27:37 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: [PATCH v3 1/7] dt-bindings: clk: qcom,gcc-*: use qcom,gcc.yaml
Date:   Mon, 20 Jun 2022 00:27:29 +0300
Message-Id: <20220619212735.1244953-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
References: <20220619212735.1244953-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use qcom,gcc.yaml which contains a set of properties common to most
Qualcomm GCC bindings.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8976.yaml      | 21 +++-------------
 .../bindings/clock/qcom,gcc-msm8994.yaml      | 21 +++-------------
 .../bindings/clock/qcom,gcc-msm8996.yaml      | 25 +++----------------
 .../bindings/clock/qcom,gcc-msm8998.yaml      | 25 +++----------------
 .../bindings/clock/qcom,gcc-qcm2290.yaml      | 25 +++----------------
 .../bindings/clock/qcom,gcc-sc7180.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sc7280.yaml       | 21 +++-------------
 .../bindings/clock/qcom,gcc-sc8180x.yaml      | 25 +++----------------
 .../bindings/clock/qcom,gcc-sc8280xp.yaml     | 21 +++-------------
 .../bindings/clock/qcom,gcc-sdm845.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sdx55.yaml        | 21 +++-------------
 .../bindings/clock/qcom,gcc-sdx65.yaml        | 21 +++-------------
 .../bindings/clock/qcom,gcc-sm6115.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm6125.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm6350.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm8150.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm8250.yaml       | 25 +++----------------
 .../bindings/clock/qcom,gcc-sm8350.yaml       | 21 +++-------------
 .../bindings/clock/qcom,gcc-sm8450.yaml       | 21 +++-------------
 19 files changed, 76 insertions(+), 367 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
index f3430b159caa..4b7d69518371 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8976.yaml
@@ -45,29 +45,16 @@ properties:
     description:
       Phandle to voltage regulator providing power to the GX domain.
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
   - vdd_gfx-supply
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
index 22e67b238bb6..7b9fef6d9b23 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8994.yaml
@@ -32,28 +32,15 @@ properties:
       - const: xo
       - const: sleep
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
index 5a5b2214f0ca..70f7d3101bd3 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8996.yaml
@@ -33,30 +33,13 @@ properties:
       - const: cxo2
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
index 8151c0a05649..544a2335cf05 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8998.yaml
@@ -37,32 +37,15 @@ properties:
       - const: core_bi_pll_test_se # Optional clock
     minItems: 2
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
index 5de9c8263138..aec37e3f5e30 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-qcm2290.yaml
@@ -30,32 +30,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
index a404c8fbee67..e4d490e65d14 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7180.yaml
@@ -33,32 +33,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
index 5693b8997570..ea61367e5abc 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc7280.yaml
@@ -44,28 +44,15 @@ properties:
       - const: ufs_phy_tx_symbol_0_clk
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
index f03ef96e57fa..30b5d1215fa8 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8180x.yaml
@@ -32,32 +32,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
index 0bcdc69c6f89..e33dea86fb9e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sc8280xp.yaml
@@ -56,30 +56,17 @@ properties:
       - description: First EMAC controller reference clock
       - description: Second EMAC controller reference clock
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
   protected-clocks:
     maxItems: 389
 
 required:
   - compatible
   - clocks
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
index d902f137ab17..2b8a35d8739e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm845.yaml
@@ -37,30 +37,13 @@ properties:
       - const: pcie_0_pipe_clk
       - const: pcie_1_pipe_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   # Example for GCC for SDM845:
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
index b0d1c65aa354..13ffa16e0833 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx55.yaml
@@ -35,28 +35,15 @@ properties:
       - const: core_bi_pll_test_se # Optional clock
     minItems: 2
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
index 16c4cdc7b4d6..8a1419c4d465 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdx65.yaml
@@ -20,9 +20,6 @@ properties:
   compatible:
     const: qcom,gcc-sdx65
 
-  reg:
-    maxItems: 1
-
   clocks:
     items:
       - description: Board XO source
@@ -43,25 +40,15 @@ properties:
       - const: core_bi_pll_test_se # Optional clock
     minItems: 5
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
index 26050da844d5..bb81a27a1b16 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6115.yaml
@@ -30,32 +30,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
index ab12b391effc..03e84e15815c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6125.yaml
@@ -30,32 +30,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
index 20926cd8293e..cbe98c01c085 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm6350.yaml
@@ -32,32 +32,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
index 12766a866625..0333ccb07d8d 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8150.yaml
@@ -31,32 +31,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
index 80bd6caf5bc9..4e2a9cac0a91 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8250.yaml
@@ -31,32 +31,15 @@ properties:
       - const: bi_tcxo
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-  protected-clocks:
-    description:
-      Protected clock specifier list as per common clock binding.
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
index 1122700dcc2b..3edbeca70a9c 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8350.yaml
@@ -54,28 +54,15 @@ properties:
       - const: usb3_uni_phy_sec_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
   - clocks
   - clock-names
-  - reg
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
index 58d98a766de6..102ce6862e24 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sm8450.yaml
@@ -46,28 +46,15 @@ properties:
       - const: usb3_phy_wrapper_gcc_usb30_pipe_clk # Optional clock
     minItems: 2
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.35.1

