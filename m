Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B524C54EF0
	for <linux-clk@archiver.kernel.org>; Wed,  4 Jan 2023 09:36:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239020AbjADJfz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Jan 2023 04:35:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239140AbjADJfa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jan 2023 04:35:30 -0500
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2B091743B
        for <linux-clk@vger.kernel.org>; Wed,  4 Jan 2023 01:35:05 -0800 (PST)
Received: by mail-wm1-x332.google.com with SMTP id ay40so25145714wmb.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Jan 2023 01:35:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lXD5KP0HciAVDXVl730AdYcSTAHkVJnjRo0Wy80qdxE=;
        b=MXRDp/ieAfqPeox19GoHBLah+mKqBI9r/PIV/vow4UvE+KRPKmMNBsURC8D8jg0fig
         AjcS8d/JMfAL17xMbd5YTnrdzQOrPUC2T3WfGT+BfZzmdBWSh6xb12q9B42iXCMObTpv
         yAMFFjBXyvRl2844bAIhVpKGNRK/nLYrrL0wmFY07dlf/hM0r++lMVwXhVK6fvbKzAcu
         a7t3F/QB2A7xzIlmBDxf/Du7uEckiV7ruhVb4VgKRVEVzjjMo2bmrrnv+FQBwt+X3/Kl
         rzrgTWsOTSadENxycH85H0q3pPyo8l+/uZa32O7xiZLUQVYcOxOeAgzH1PsisIF5ylWs
         2HBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXD5KP0HciAVDXVl730AdYcSTAHkVJnjRo0Wy80qdxE=;
        b=q4pvf0pF2xTl6o0GPKQoy1m9tJ8dVxaub8xFGa6n4CtkuMDicFngQRa5aMqV1ET/YH
         Atk9zbOaUWpyExJiuDy83EXollLri2JGZr9rQMwbvlFDx3WXOi7mrRfgU+6YcZi5UQuC
         SBIBvsmxcFli00xZQq6iRY8GtwVbWZM/+CifkHSmcf62SKE9ooZWxYVklUHHh7XHBpDS
         GtpGSc6zkvOuZ3EegYeD3eVka9A0MFyAZbAayBifJpDc58R/Yif169pUVZhRZudL9NKU
         8XPvNQ9mrYEz0ycNEL7u1CTqtnBRrPYMCvyDUOan9qRZbG6hKDdxV96IOAFNRJpOswu0
         0Tpg==
X-Gm-Message-State: AFqh2kqR5XtXAwHcDKDLncgUu10UPC/EIL3kzA+rLKGihxruFXoUUtKJ
        gRgpzEMKJB37T5Q0NGrOGGDCSA==
X-Google-Smtp-Source: AMrXdXtX0pSOlG6C+UCgk6KAt7OzjBEBdKhV6wYdX3WFtO2zlezmmuk76YUzkUWk5zF1vNzCyVpZsw==
X-Received: by 2002:a05:600c:3845:b0:3d1:caf1:3f56 with SMTP id s5-20020a05600c384500b003d1caf13f56mr37558566wmr.9.1672824904282;
        Wed, 04 Jan 2023 01:35:04 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b22-20020a05600c4e1600b003c6d21a19a0sm45561452wmq.29.2023.01.04.01.35.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:35:03 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v8 1/4] dt-bindings: clock: Add SM8550 TCSR CC clocks
Date:   Wed,  4 Jan 2023 11:34:47 +0200
Message-Id: <20230104093450.3150578-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230104093450.3150578-1-abel.vesa@linaro.org>
References: <20230104093450.3150578-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings documentation for clock TCSR driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml      | 55 +++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8550-tcsr.h  | 18 ++++++
 2 files changed, 73 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
new file mode 100644
index 000000000000..1bf1a41fd89c
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -0,0 +1,55 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller on SM8550
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description: |
+  Qualcomm TCSR clock control module provides the clocks, resets and
+  power domains on SM8550
+
+  See also:: include/dt-bindings/clock/qcom,sm8550-tcsr.h
+
+properties:
+  compatible:
+    items:
+      - const: qcom,sm8550-tcsr
+      - const: syscon
+
+  clocks:
+    items:
+      - description: TCXO pad clock
+
+  reg:
+    maxItems: 1
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+required:
+  - compatible
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+
+    clock-controller@1fc0000 {
+      compatible = "qcom,sm8550-tcsr", "syscon";
+      reg = <0x1fc0000 0x30000>;
+      clocks = <&rpmhcc RPMH_CXO_CLK>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,sm8550-tcsr.h b/include/dt-bindings/clock/qcom,sm8550-tcsr.h
new file mode 100644
index 000000000000..091cb76f953a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8550-tcsr.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
+
+/* TCSR CC clocks */
+#define TCSR_PCIE_0_CLKREF_EN					0
+#define TCSR_PCIE_1_CLKREF_EN					1
+#define TCSR_UFS_CLKREF_EN					2
+#define TCSR_UFS_PAD_CLKREF_EN					3
+#define TCSR_USB2_CLKREF_EN					4
+#define TCSR_USB3_CLKREF_EN					5
+
+#endif
-- 
2.34.1

