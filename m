Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0629FC77B7F
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 00:32:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239657AbjELAcj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 20:32:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239647AbjELAch (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 20:32:37 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E7F55B1
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:35 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-4effb818c37so10585649e87.3
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 17:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683851554; x=1686443554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EozoSLIyO4NfUjrGfpaN6BKAXGeLSjYSJ3pwKwjmBi4=;
        b=fmJ3l+NLPeVuw3mHmaKKlmCDF1oygH//kfOCUo0x2x9J8e6JreXzT4Io6KVLJEaZOu
         iB2g1RUCMOwSidlq+Re2W/jBIxFLA9NEfCi66NGuuKpD5dKBrj4XSNRRftrvgaX1bNjy
         1Rkgzbam73a0un779/651pgGxOJObACaF3/TL85D23nuCKdudw9/Q0CmMoRMgn/CyLZi
         QGlO/qJvKUj5wPqV3sya1xWAbnVmhyBejRT/UdvoAvxpy1mRcn5DaUitJ/nJyViKsX1R
         ha4C450uKUOOoiTHJ6v2lQskGlad9i84fuWeCg90BaeBGNL34Va0QStBcondmknwIGZ1
         IFNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683851554; x=1686443554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EozoSLIyO4NfUjrGfpaN6BKAXGeLSjYSJ3pwKwjmBi4=;
        b=dORfV9Qt5pM47j7p8M2H7CsU8SVTTjUIuuazkzhUJNv1mVuXKo9lbzrJWeAz3gdi4w
         vWIUgKeuIglANt3uARAEpLJh3w9y+VZ3HYHk3x1SXzdQy5CyApireo8iGZp9DkBADv+S
         nU79fMaitBzIwBd3Tcgn9r2ZAuA1ULUo1dd/he4wTNB4sL7XQXrMbcz3j7As4eUm25qZ
         vIWo6gqUNr7ASaXokiIh64igrJS+dRC/+bmyp0cy71jf/nw+8pgQURlz4GrZuXwj/U4N
         ectvTpG/XeDGVlFTspV7JTzBvXRlewn0YsjeXm8bwA0gFbJa6fwiUXNCcyLY2HuB53af
         BaFA==
X-Gm-Message-State: AC+VfDxKiGhs0mroT4BErgfJN4MCocLorg6VZRSGJmsSIyKFZeyrYZgv
        7lPkDzjyBZHWVOM4kWJsfAdMnQ==
X-Google-Smtp-Source: ACHHUZ4N71DdELopXh1zMv1kYRYvmezMBX/4CQBjDd13hKVI7irqoPl1yDlGUsHceriqjinYWN4vqQ==
X-Received: by 2002:ac2:4944:0:b0:4ef:d4ee:1a6a with SMTP id o4-20020ac24944000000b004efd4ee1a6amr2979215lfi.44.1683851553858;
        Thu, 11 May 2023 17:32:33 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id i7-20020a056512006700b004f13cd61ebbsm1282708lfo.175.2023.05.11.17.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 17:32:33 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 03/10] dt-bindings: clock: provide separate bindings for qcom,gcc-mdm9615
Date:   Fri, 12 May 2023 03:32:23 +0300
Message-Id: <20230512003230.3043284-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
References: <20230512003230.3043284-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The global clock controller on MDM9615 uses external CXO and PLL7
clocks. Split the qcom,gcc-mdm9615 to the separate schema file.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-mdm9615.yaml      | 48 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  3 --
 2 files changed, 48 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
new file mode 100644
index 000000000000..bc9786f2c1d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-mdm9615.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller on MDM9615
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module provides the clocks, resets and power
+  domains on MDM9615.
+
+  See also::
+    include/dt-bindings/clock/qcom,gcc-mdm9615.h
+    include/dt-bindings/reset/qcom,gcc-mdm9615.h
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    const: qcom,gcc-mdm9615
+
+  clocks:
+    maxItems: 2
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,lcc-msm8960.h>
+    clock-controller@900000 {
+      compatible = "qcom,gcc-mdm9615";
+      reg = <0x00900000 0x4000>;
+      #power-domain-cells = <1>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      clocks = <&cxo_board>, <&lcc PLL4>;
+      clock-names = "cxo", "pll4";
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index ae01e7749534..b6e260755a21 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -19,8 +19,6 @@ description: |
     include/dt-bindings/reset/qcom,gcc-ipq6018.h
     include/dt-bindings/clock/qcom,gcc-msm8953.h
     include/dt-bindings/clock/qcom,gcc-mdm9607.h
-    include/dt-bindings/clock/qcom,gcc-mdm9615.h
-    include/dt-bindings/reset/qcom,gcc-mdm9615.h
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -31,7 +29,6 @@ properties:
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8953
-      - qcom,gcc-mdm9615
 
 required:
   - compatible
-- 
2.39.2

