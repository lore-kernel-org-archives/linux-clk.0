Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA56C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 17 Jun 2022 14:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1382912AbiFQOrZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Jun 2022 10:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382858AbiFQOrV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Jun 2022 10:47:21 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02264563A0
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 07:47:19 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id a29so7315307lfk.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Jun 2022 07:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lKNSfqs482tz3aom3PVOglBcA5rFfyneP88JdNzFj5I=;
        b=WkzeNoA/+hnbiFjzcZ11OtsNEOP6i5uug9GmPOQXRMmCUUngle5RPg9gD7bAsAp0xQ
         OGz0PvNm5xuRBj2uNb5RgsiYTwT2apZCKawrU8C0uk6/WJynUKTSeZoZwSj2cnaXX8Ff
         c+QE3SqQ2FhCU6nVYLhNnnMl3Rnx2P8gc+sO2b7XirGdz6TJJN45/yDLjis0ZnG4bMFP
         CIgoC58TqRmo7n6Hv5wcbU28iv/4lCuzyT72HSjx8UMDEnbtdpJVKIvsbFea7iynYE+3
         ShGVVUuQ++lnD6ULaX3MTCfJzk7rWfKPdiEsonoqWrfW0cqHOAiQKKnxGOy6fVc3WNTM
         n1eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lKNSfqs482tz3aom3PVOglBcA5rFfyneP88JdNzFj5I=;
        b=zMV33+ma6D48eIPdP6rokqMgoD9gKxpN7Zy46q0UsPZAPgd81saxRLwBYEZGZddjy1
         9I25vzTbj6k8Kx1c8YnjJ/ORjV7N0+quTAuyHsjSwMUedNSkneVrZtS1M0NTObsq09ov
         /ERtMhLU/3cmDpQc44S+QlbbAINRMbKbOPCgmkhx51ZPxRyZHkfy5kQgROoHnykEvqOi
         M7JriJGwGz53mkzP+Jdi+iSsAFKpW5DxPG9npsEufiwwdXLtgw1wyJRMRcAQiq7bxfgI
         w5sC26eJqA+q/01h2fn6lQsRP0/xJgs+DHmLQuBauQJKWrYRIjRa6EMbusC0ucoEKZOD
         pYdA==
X-Gm-Message-State: AJIora8rjuF2EA3jjXTVA1pwV1ye2aDhtZxNy7mWHETKMB5H0SDhJnpn
        4RwDq7NAhaD7vaUNcXs8ZuGxrWb4eTdDi/4M
X-Google-Smtp-Source: AGRyM1tgCJF8DH7CSqafI/BALcZVeNX7UrslxomQbPxmIkKxWz8RosmjXLMmdM/QpQwZdDlugOaJUg==
X-Received: by 2002:a05:6512:3a5:b0:47d:a3ac:3bc5 with SMTP id v5-20020a05651203a500b0047da3ac3bc5mr6058828lfp.193.1655477238104;
        Fri, 17 Jun 2022 07:47:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020a2eb165000000b002553ab60e17sm571867ljm.122.2022.06.17.07.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jun 2022 07:47:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 2/7] dt-bindings: clock: separate bindings for MSM8916 GCC device
Date:   Fri, 17 Jun 2022 17:47:09 +0300
Message-Id: <20220617144714.817765-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
References: <20220617144714.817765-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Separate bindings for GCC on Qualcomm MSM8916 platforms. This adds new
clocks/clock-names properties to be used for clock links.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8916.yaml      | 61 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  1 -
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
new file mode 100644
index 000000000000..564aa764b17b
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on MSM8916.
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8916.h
+
+properties:
+  compatible:
+    const: qcom,gcc-msm8916
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+      - description: DSI phy instance 0 dsi clock
+      - description: DSI phy instance 0 byte clock
+      - description: External MCLK clock
+      - description: External Primary I2S clock
+      - description: External Secondary I2S clock
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+      - const: dsi0pll
+      - const: dsi0pllbyte
+      - const: ext_mclk
+      - const: ext_pri_i2s
+      - const: ext_sec_i2s
+
+required:
+  - compatible
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@300000 {
+      compatible = "qcom,gcc-msm8916";
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      reg = <0x300000 0x90000>;
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 6c45e0f85494..d3e591495b41 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -41,7 +41,6 @@ properties:
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
       - qcom,gcc-msm8660
-      - qcom,gcc-msm8916
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8960
-- 
2.35.1

