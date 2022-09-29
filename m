Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D04D6C6FA82
	for <linux-clk@archiver.kernel.org>; Thu, 29 Sep 2022 09:13:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235693AbiI2JNF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Sep 2022 05:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235705AbiI2JMl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Sep 2022 05:12:41 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47EE6142E3A
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 02:12:21 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id t16so855626ljh.3
        for <linux-clk@vger.kernel.org>; Thu, 29 Sep 2022 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=If8WOilQ9PzmMBmCqzzeUtE56VOBe3wtjVI48jlzs/U=;
        b=nWVITn6MkSynkIPZNerlsTMujNQYa8/JraQutVhVjiY8LzbTFTSD8NfyrFH75yMqhk
         ThIRmlZTnsUxTUqcdrvsj1VPw9p0bK/82X5zchEr0Mms264hC/326I5d64nuPm/e5Ros
         EDKngR5zzdhtZwPo2kqzvLf+gsoe8AQuVoJkOR6ackTyRD+ONS1qS0uTKzxKqHqRvBtU
         kN2gYH8IVsiFBtgJfWaZpfwY4xBHtFDSScMTDD3RSeBV43rxmMHBfSgODAIkvTVC8evu
         at7noYgsclEqzh6JXqMD5m07swrmI5VkegpACxkmlJe5pLo0FJJoSZyYygTMtf9xfuZb
         udpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=If8WOilQ9PzmMBmCqzzeUtE56VOBe3wtjVI48jlzs/U=;
        b=1r4/mtfbcQUZXUeMBcaVhrlE8OYxZNTP/ZoCnm0Adg2GbtBwbmSFoTQ3wxjzMY8ufg
         z1fYb9A1fBuY94boRDW6MJNPPiwr6Dp65gXYLrWDT9hkvyh+D3HtIFR29B4733gbujou
         bMRtBH2M/m87Rs0f8y7rvVMgcOJosEfGHL8OCxNnwgLPrTUPUo+EfByMF2mP49Yjqfur
         CNIAmIeCVqcjwVdYFYFJEGvkgdt4GojlmxntzFXKbTvo39rihTUlqclkHUXQwfnRCw1L
         qwF89CkAUX3Ksf4Tgp/GOW6i/vDv7CxvrrLOLE9kHRNUuN9qc2kbTgCkDT9QJAjShskq
         JmKg==
X-Gm-Message-State: ACrzQf28440r0Qk9gSQ4W1vxvwSaw61j1VutJPbHk/HAAWIJCa6fjVkl
        +T00s/zBJMYhl16BoxEdnPqUZQ==
X-Google-Smtp-Source: AMsMyM5T8mjrHe0bl5/PGa1YKRjs5ZRA7sfUC3ddKYz2Wz1+BysRQoX8eim+Qe9RjdABamkS62DdBg==
X-Received: by 2002:a2e:a601:0:b0:26c:4149:251a with SMTP id v1-20020a2ea601000000b0026c4149251amr749232ljp.348.1664442737761;
        Thu, 29 Sep 2022 02:12:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k4-20020a05651239c400b0048b143c09c2sm725091lfu.259.2022.09.29.02.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 02:12:17 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2] dt-bindings: clock: split qcom,gcc-sdm660 to the separate file
Date:   Thu, 29 Sep 2022 12:12:16 +0300
Message-Id: <20220929091216.471136-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move schema for the GCC on SDM630/SDM636/SDM660 to a separate file to be
able to define device-specific clock properties.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes since v1:
- Change license to GPL-2.0 & BSD-2-Clause
- Fix Taniya's email
- Reword the bindings title as suggested by Krzysztof
---
 .../bindings/clock/qcom,gcc-other.yaml        |  3 -
 .../bindings/clock/qcom,gcc-sdm660.yaml       | 61 +++++++++++++++++++
 2 files changed, 61 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 76988e04c7db..35fc22a19000 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -24,7 +24,6 @@ description: |
   - dt-bindings/clock/qcom,gcc-mdm9607.h
   - dt-bindings/clock/qcom,gcc-mdm9615.h
   - dt-bindings/reset/qcom,gcc-mdm9615.h
-  - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
 
 allOf:
   - $ref: "qcom,gcc.yaml#"
@@ -41,8 +40,6 @@ properties:
       - qcom,gcc-msm8974pro
       - qcom,gcc-msm8974pro-ac
       - qcom,gcc-mdm9615
-      - qcom,gcc-sdm630
-      - qcom,gcc-sdm660
 
 required:
   - compatible
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
new file mode 100644
index 000000000000..68f47174b1b7
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SDM660/SDM630/SDM636 Global Clock & Reset Controller
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks, resets and
+  power domains on SDM630, SDM636 and SDM660
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-sdm660.h  (qcom,gcc-sdm630 and qcom,gcc-sdm660)
+
+$ref: qcom,gcc.yaml#
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-sdm630
+      - qcom,gcc-sdm660
+
+  clocks:
+    items:
+      - description: XO source
+      - description: Sleep clock source
+
+  clock-names:
+    items:
+      - const: xo
+      - const: sleep_clk
+
+  power-domains:
+    maxItems: 1
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  # Example for GCC for SDM660:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    clock-controller@100000 {
+        compatible = "qcom,gcc-sdm660";
+        reg = <0x00100000 0x94000>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+
+        clock-names = "xo", "sleep_clk";
+        clocks = <&xo_board>,
+                 <&sleep_clk>;
+    };
+...
-- 
2.35.1

