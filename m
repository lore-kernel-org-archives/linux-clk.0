Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7B39C63703
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 12:57:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234586AbiLFM5A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 07:57:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234696AbiLFM4u (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 07:56:50 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CF0127CD0
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 04:56:43 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id n20so6082525ejh.0
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 04:56:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyTsVNX7Hzgy2yuFXUB0FPuyNnjByEWV/KA5BFtfNhA=;
        b=Qd/GL1MHeXgLbMYyUrp+KBSyKHgcTmuslNeiJrh5b+znPB3XYt63cr/RFYF+WuF7rZ
         OEHIlFQ69Ace+DlLbnFut+BIZEqRWKnZmMEz9bmMWf3256ta1OlfM+lHa7apP0mi5wzO
         Tsm6MHmFHRnH4mjAJbKkX/7m8wsxAoWAVCEdua69zcgLjsSeFafVJJp1RZPZhy9qkBPJ
         kkgf3ydJjFpeeYFgObKDZrcC5RHeQYIxzuHMgJ7xnMvCUhdvzpf6uXK9yWPcrsyxoMIb
         m47WvKOCFwIWUN6NFZYt9mA5j0RglquttEcdDKT9D5wKpU7kfjO3V+39MB1wIAtAIumB
         CjVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyTsVNX7Hzgy2yuFXUB0FPuyNnjByEWV/KA5BFtfNhA=;
        b=khxPH/pm1Wfy98/MWbxyDEq4hjyOFDHAdU3woZ883VpCnJK36QU2Sf/XlhuD1ixqru
         fjsrp0GeirS7oR8mb6smEuGocJUmBgfvYNRgCfCcsLDdmHVArm2h22H6qltYxnrbKDmP
         Wi6Xe/c6NEvbr4H5QsBkUp1Fh52Dclyot2Y/PFAn4E1o5u7p+KwWz7JFWFz5C2HpgpFn
         4gyKkBqfJrZzeZBiwrpVfAArLk/YCgZqMp/afUA1zUzNNZJ0d6FnQo0vI55Bf7yhqdiM
         loCAdqbLhJ/N5Ek1DvM/bSMHl2AL6gR2L/+/Pvx+rYRcuOHbXsas1wWX8QJNOMiXz0I7
         JoBg==
X-Gm-Message-State: ANoB5pm6ykvtOzD2r15ADAqQ9iWN6DnxEuYwB35rIqJO0k1h1fqlJSui
        yunq8z5r9R75BuyiEYVDOOb2ZQ==
X-Google-Smtp-Source: AA0mqf7rdk8nLt+qOEFE34vE9G05Qz+fl3SvjUNHtgAkNNEApCI1VSmLWrYBpqMjvO2Tq4Gyan0erA==
X-Received: by 2002:a17:906:1484:b0:7ae:6746:f270 with SMTP id x4-20020a170906148400b007ae6746f270mr23036100ejc.728.1670331401625;
        Tue, 06 Dec 2022 04:56:41 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7cd4f000000b0046150ee13besm932991edw.65.2022.12.06.04.56.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 04:56:41 -0800 (PST)
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
Subject: [PATCH v5 1/5] dt-bindings: clock: Add SM8550 TCSR CC clocks
Date:   Tue,  6 Dec 2022 14:56:31 +0200
Message-Id: <20221206125635.952114-2-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206125635.952114-1-abel.vesa@linaro.org>
References: <20221206125635.952114-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings documentation for clock TCSR driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm8550-tcsr.yaml      | 53 +++++++++++++++++++
 include/dt-bindings/clock/qcom,sm8550-tcsr.h  | 18 +++++++
 2 files changed, 71 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsr.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
new file mode 100644
index 000000000000..15176b0457d1
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsr.yaml
@@ -0,0 +1,53 @@
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
+    const: qcom,sm8550-tcsr
+
+  clocks:
+    items:
+      - description: Board XO source
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
+      compatible = "qcom,sm8550-tcsr";
+      reg = <0x1fc0000 0x30000>;
+      clocks = <&rpmhcc RPMH_CXO_PAD_CLK>;
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

