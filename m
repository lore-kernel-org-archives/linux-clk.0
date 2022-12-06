Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1C45C6370B
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 22:45:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiLFWp0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 17:45:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiLFWpZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 17:45:25 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EEB43FB8A
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 14:45:24 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id bj12so9822735ejb.13
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 14:45:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tNI2i3/QTr9mwnzcqdEPuyaMkTpSlzmqI4PslyM1ul8=;
        b=iTwAOWgL1wzIv3tLnUGKyAmdMRj1jN526teYp1qdotQsOYATNG9vDIAiDfFE5CTWDe
         4pEgVyRPvBO3neWP5pyVPFhE/40et1LEJS7tTUXUC09p2n2v+bQ0RZXsdC3/StgGpECy
         7lAQ2ZfU04RPQiqpjRZWbTX9Zpk4k/zxuQl3nae/HJDzSVtU8Rn/tRlnLcUm53Edk3Y4
         rdTJME4BNcfvkfJccsffUfN8cFJigAmAfX2aMhfjkJ90NEIWx4gulBnalYfVz+4Hpqc1
         Fgr9h7OVJJRjagqFQUb2J5nyungUFylwQTkISq8lhBE6IrU0Xq5ojRx4NVzkyhEYlnFg
         Qd9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tNI2i3/QTr9mwnzcqdEPuyaMkTpSlzmqI4PslyM1ul8=;
        b=L0f+CSErDqp08b6oQIO6Awr9n/PmhAPNUw6JmbriSoFv+8bXyjwDOYjLBvoxd04vvL
         pylj6j7gNqGMUdIhyE/FrwBJKgO6apeYi5dpknHpTSXdIUk1xmUbSPUk2Hq0jNkS6Xwb
         IkfsQrSAAOdfHERc/JX4S1DkRKNlOfjz9IWcPa6KuC3nkXAD7Gc4h3udvFkxly1LegZy
         BLSuzG9wt2QCfaoQZMLC8SXjMYztrXNX4TPPt9uJhn3bDHR6JpVb9AOCvAgNTHXaMfT+
         WBbexHP8wEaZttejUOza53ppbDrj27XAqk03CTGgprDjKQH+bYdbrfU83e0G2qF+ihO2
         +49Q==
X-Gm-Message-State: ANoB5pmg3wmpX9DcPQiFult1UsLXmgc/8eS8shzOF7wHdRp/+4Weyqgz
        WN2SEbBWit89zAem0VWzHAgV/g==
X-Google-Smtp-Source: AA0mqf5C0wxTDc9ZGRfLSZAnR4QlPssuwpgRnBUt8JjDVq2cVuqfDQ09xcvR8jbYpxUhtvOwAJRQKw==
X-Received: by 2002:a17:906:3c03:b0:7c1:9c6:aaa1 with SMTP id h3-20020a1709063c0300b007c109c6aaa1mr4583515ejg.583.1670366722767;
        Tue, 06 Dec 2022 14:45:22 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id r17-20020a1709061bb100b007c0985aa6b0sm7820772ejg.191.2022.12.06.14.45.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 14:45:22 -0800 (PST)
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
Subject: [PATCH v6 2/5] dt-bindings: clock: Add SM8550 TCSR CC clocks
Date:   Wed,  7 Dec 2022 00:45:12 +0200
Message-Id: <20221206224515.1495457-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206224515.1495457-1-abel.vesa@linaro.org>
References: <20221206224515.1495457-1-abel.vesa@linaro.org>
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
index 000000000000..2b72ab82041a
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

