Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7AC2C77B7C
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 21:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240438AbjELVSH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 17:18:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240413AbjELVSF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 17:18:05 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7C121FDF
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 14:17:36 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f00d41df22so55455304e87.1
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 14:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683926251; x=1686518251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5iW3mmY96sQxjUKo34y7+XwQg6+9i3DKhyWyNobWBts=;
        b=c+hBGrHAL/Vr6QNx4UsVxn0VAsBldOO3qdSo8XsrqwozOMB7tjn1TPbxK4ZCkU6+Lq
         VzwWpas0PbKxMMpoFQdBb0ZyfNuw/JPvjBYaKLRNf1FVESWpjpr0KHezR6dfRWdCBiUw
         Vg/ifMp3aF3cB3evCSeEAmdPHqT5DI8NLNThzjYLJr+SpXL3F1tRVjt1+83D0N6CyGwR
         UcrwZNt39bHxm1bzpi8sdE8HP9zoLx7QtcmQfyrFEtkg6LWagNG72v20eDXwtPpYcOEQ
         wGvB6jO3wdtp6mqHO7witmnkVlWikzR/8xB9sqXKro/DWtgzBm0EDwAUxW5Q0wIGkGrN
         fyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683926251; x=1686518251;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5iW3mmY96sQxjUKo34y7+XwQg6+9i3DKhyWyNobWBts=;
        b=WpcxAymAeViCq8C4sPF+NDWUswbKvVQEW74LnU2Uf0BQFimyXem03+TXftskkrljQ8
         16y7FZ2sjIVKeWrKxJcyvbQFrrU1uIbaW/D2VZuuuZd78/vqsMOK7ks9qd5bSMskaYUx
         0MaRIFgn6S3YK97Zk86Q9clGeVVR1Vp3f7Nsiy3zvwlv0LTwbxtxkOhnyIVoq9Fh6g3C
         fGq7YEyY5pZ8gje5SmSslE6FelvRZ7YGnsrSYj+I5it4++dLWQR035Us/MuTYh6K6xMR
         jcivJcE5WOv1TyrZIV+PszPrlCM7jbjmNsOiCfYrJOWyNFEVlqzeR27+V1yghKog9rra
         K0Fw==
X-Gm-Message-State: AC+VfDw8c9SbOAu/g8B0K2AI/PiKsBAtIvBIYud41BCBGyKFLgZhGjuw
        8KyfeO2jrFZqp9f7gRmPt1joBw==
X-Google-Smtp-Source: ACHHUZ7kfO15yetan79qVIXVhbfKZgEauqkdd2EqASeHmdnEoPs6ok7tJwWeOZIU+wIrd5IgRve2zA==
X-Received: by 2002:ac2:4d03:0:b0:4ef:ebbb:2cf5 with SMTP id r3-20020ac24d03000000b004efebbb2cf5mr4678925lfi.17.1683926251414;
        Fri, 12 May 2023 14:17:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id w4-20020ac254a4000000b004edafe3f8dbsm1590363lfk.11.2023.05.12.14.17.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 14:17:30 -0700 (PDT)
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
Subject: [PATCH v3 03/10] dt-bindings: clock: provide separate bindings for qcom,gcc-mdm9615
Date:   Sat, 13 May 2023 00:17:20 +0300
Message-Id: <20230512211727.3445575-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
References: <20230512211727.3445575-1-dmitry.baryshkov@linaro.org>
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
 .../bindings/clock/qcom,gcc-mdm9615.yaml      | 47 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  3 --
 2 files changed, 47 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
new file mode 100644
index 000000000000..69162ac4a0da
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-mdm9615.yaml
@@ -0,0 +1,47 @@
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

