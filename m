Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FB1EC4332F
	for <linux-clk@archiver.kernel.org>; Wed, 16 Nov 2022 11:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233291AbiKPLAB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Nov 2022 06:00:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233337AbiKPK7Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Nov 2022 05:59:24 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B03D429A9
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 02:47:50 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id o4so29102131wrq.6
        for <linux-clk@vger.kernel.org>; Wed, 16 Nov 2022 02:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bqj14+L6wdPnBz6T0oVqLW81gC5yVGp113SLh//BQYI=;
        b=xOkYtqh6Bl5JzNc7V3YRj/0E2PYSYdLe/tJFi9ca0LBYndz74OvhRYwhlvFV4pKJyN
         NfHTomr9fxL6FlQllcmhmdwkG3xCj/1y3AzbXrMjjRCapWZaMVWahqndDxLYFLlBgGVt
         583lnykBZpEGsDbqCIMDX2xet6fJlGpkChKA5FAH08MHVnc3JSzUmLJcSKfcRRT3cGUn
         wIkCAm4UMxjhgNGJ/AeWWG5HZMFzGQB2aE+XvgXDUF1VeD8kzWgFS56gBBxAEVOuSsKU
         EepycxCiBnCZyNVabhfcquV1+qr4Pil04dRPUch/dWI1eL4SowhcR9CFnRWK9RFmw4iU
         sfug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bqj14+L6wdPnBz6T0oVqLW81gC5yVGp113SLh//BQYI=;
        b=x5YpxkSoK0DASIf/1Y3zew9S/cEoBwes3JUVT1zib9oz5ymRS2s2QX4Ql2rwAColuL
         k7zs7+ODdelGZ5AlvBBruMWKnZVGmK40034wXjjHT+rdZUrC/yqubuRutGzMH9esV+zZ
         s8pwx65vF2E1rJKtabVLQAuH9Pv8jA/dkWLi0NQTJOlSTYie4Zqe9MMfIWXqokhj/2dc
         po3nqkMfQ43x5f6GFmLVJR+QU28uf/zPUbJM82gxte8tnqruwUz6YmGVahsvNo8qiORQ
         rcJkVu+176zBvsFgiN369z+f1xthmTLUVXidbbjOfvLcq8lNEW7b/2DDL2OyxqfJCnYl
         QEzA==
X-Gm-Message-State: ANoB5pkLgmq1FwFYAkKeXKTRjiMcHu7iAu7XQ0al0/TQGpC7UgexhZD9
        9Wj6ZHHCJJeq12xtogt2wGZQYQ==
X-Google-Smtp-Source: AA0mqf7tUMzzQCjkI/aYStOQx/zXAnKBT79x8VDlvphHG9gTZImDP6E9ruWZXn6GzruLw9At1zgvWw==
X-Received: by 2002:a5d:6dc2:0:b0:22e:4864:ee11 with SMTP id d2-20020a5d6dc2000000b0022e4864ee11mr13051107wrz.488.1668595669967;
        Wed, 16 Nov 2022 02:47:49 -0800 (PST)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id b3-20020adff903000000b002366fb99cdasm14674206wrr.50.2022.11.16.02.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 02:47:49 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: [PATCH 8/9] dt-bindings: clock: Add SM8550 TCSR CC clock bindings
Date:   Wed, 16 Nov 2022 12:47:15 +0200
Message-Id: <20221116104716.2583320-9-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116104716.2583320-1-abel.vesa@linaro.org>
References: <20221116104716.2583320-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings documentation for clock TCSR driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 .../bindings/clock/qcom,tcsrcc-sm8550.yaml    | 46 +++++++++++++++++++
 .../dt-bindings/clock/qcom,tcsrcc-sm8550.h    | 18 ++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,tcsrcc-sm8550.yaml
 create mode 100644 include/dt-bindings/clock/qcom,tcsrcc-sm8550.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,tcsrcc-sm8550.yaml b/Documentation/devicetree/bindings/clock/qcom,tcsrcc-sm8550.yaml
new file mode 100644
index 000000000000..7d7bacb23610
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,tcsrcc-sm8550.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,tcsrcc-sm8550.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm TCSR Clock Controller Binding for SM8550
+
+maintainers:
+  - Bjorn Andersson <andersson@kernel.org>
+
+description: |
+  Qualcomm TCSR clock control module which supports the clocks,
+  resets and power domains on SM8550
+
+  See also:
+  - dt-bindings/clock/qcom,tcsrcc-sm8550.h
+
+properties:
+  compatible:
+    const: qcom,sm8550-tcsrcc
+
+  '#clock-cells':
+    const: 1
+
+  '#reset-cells':
+    const: 1
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    clock-controller@1fc0000 {
+      compatible = "qcom,sm8550-tcsrcc";
+      reg = <0x1fc0000 0x30000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,tcsrcc-sm8550.h b/include/dt-bindings/clock/qcom,tcsrcc-sm8550.h
new file mode 100644
index 000000000000..eda360e84f0a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,tcsrcc-sm8550.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2022, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
+#define _DT_BINDINGS_CLK_QCOM_TCSR_CC_SM8550_H
+
+/* GCC clocks */
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

