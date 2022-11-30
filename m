Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D835DC4708C
	for <linux-clk@archiver.kernel.org>; Wed, 30 Nov 2022 11:29:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230326AbiK3L3W (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Nov 2022 06:29:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbiK3L3U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Nov 2022 06:29:20 -0500
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C980F1583A
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 03:29:18 -0800 (PST)
Received: by mail-ej1-x630.google.com with SMTP id e27so40566074ejc.12
        for <linux-clk@vger.kernel.org>; Wed, 30 Nov 2022 03:29:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rbpQaf4g+r4gt9AxpFOseMq1ZYh9Lq0nCyM5eOF1Zm8=;
        b=djdyFg8ldNxDjJLVlAxmIpIXm1fVQ4yaKrIAHEIVQKRFYPrtxJuYwjpdUtIPGPfKMR
         N64I+SJJJqwoWuGTWn4OR8oBGarBEDZ1AQEVLjvV6JBfDP5S3Npjj4ey1kl3xj9ylsTJ
         2ciS7HB9RFkyInlhrTy9liMj7EJ9HooSLeTELhM/YbLzo0gJvHlcjQa9R0koWXj8YiEu
         3MivVtC8X7alBueGsiUyQlaJSxKVDqQu0+eNusAb+scNM2Dv+lN55N/TuXLrpWcVJ4SQ
         9/0WfImFrgwMUC9kix6Nz2af9YZ0l0ZjTsDl0aRmqULkSKhqAzPoFuFSz2gre6RX+nSy
         yAeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rbpQaf4g+r4gt9AxpFOseMq1ZYh9Lq0nCyM5eOF1Zm8=;
        b=DEhseH6lbgij8hzVyOfztuR4ak72CjdLYhiJQFdIga4wLtDqDPPAsv74FMgqaEJr1p
         soqavn+JOx8ROgP87WRPBiazo/AwCQBRqHKcc9zQfmXW7p7Rvf5lVwBDavUAENcanQtt
         BUHd+P7cCi6wIhWepSzF8/5aWWShxjYhSGFLknVxIFXwBVze9CGKQnb0Gmsk1cnr3UVD
         57VzVxf2qrFFCLlpY+aiwW0DHxEyFyjQO0crS+EDQEad7kpPAbn+UwpaceIFf0v+b6dF
         SRWSok9q1WkTkWcSGiBwdU7uO3F0fNFiEdTiJAKsWWzLk1u9WXAiH379JTyHNAbsXvKp
         LdmQ==
X-Gm-Message-State: ANoB5pl6Lyt1Pq5IlRJFhgSQuTD6eygpTSD+21Aj2/CMckNFJc8lhuNB
        nrbpycC2o1nUXPDPgsnCFCUlTg==
X-Google-Smtp-Source: AA0mqf4QUeFq+uy491MEOyOBxjO9ZGN7xPAoRi/DfXddjJ7wV9wxfWjHWaIfuoHW3tuAT56Y6MK8Ng==
X-Received: by 2002:a17:906:7119:b0:7c0:a181:90c7 with SMTP id x25-20020a170906711900b007c0a18190c7mr1430401ejj.632.1669807757283;
        Wed, 30 Nov 2022 03:29:17 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id x10-20020a1709060a4a00b007c073be0127sm521593ejf.202.2022.11.30.03.29.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Nov 2022 03:29:16 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/9] dt-bindings: clock: Add SM8550 TCSR CC clocks
Date:   Wed, 30 Nov 2022 13:28:45 +0200
Message-Id: <20221130112852.2977816-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130112852.2977816-1-abel.vesa@linaro.org>
References: <20221130112852.2977816-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings documentation for clock TCSR driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/clock/qcom,sm8550-tcsrcc.yaml    | 45 +++++++++++++++++++
 .../dt-bindings/clock/qcom,sm8550-tcsrcc.h    | 18 ++++++++
 2 files changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml
 create mode 100644 include/dt-bindings/clock/qcom,sm8550-tcsrcc.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml
new file mode 100644
index 000000000000..b2de251328e4
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8550-tcsrcc.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,sm8550-tcsrcc.yaml#
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
+  See also:: include/dt-bindings/clock/qcom,sm8550-tcsrcc.h
+
+properties:
+  compatible:
+    const: qcom,sm8550-tcsrcc
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
+
+additionalProperties: false
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
diff --git a/include/dt-bindings/clock/qcom,sm8550-tcsrcc.h b/include/dt-bindings/clock/qcom,sm8550-tcsrcc.h
new file mode 100644
index 000000000000..091cb76f953a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,sm8550-tcsrcc.h
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

