Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E995AC6FA8E
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 14:58:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234487AbiI1O61 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 10:58:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234522AbiI1O6Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 10:58:24 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DFAA9C7C4
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 07:58:21 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id g20so14625712ljg.7
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 07:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=znEaxKi9Hq+9I4axphJS3UE1HcHocTZ4nn1PUPffflc=;
        b=Sn2kvlZu4A7zYhw8ZfgSjbaqrOFB9s6i2cUocqQAQebbF0npqwdJHRE7Z07QVc9aCY
         m/r8hGcp3bf6Qk8Pmn2QWcwmvrultt8DBdRdJAJV1strqzOHJdKg1Hju5sIdK1Su4wFv
         8LN6P5gUfLZrLj8qeJzwvsKLwiJhQZBjITtLKSqsxeEtKaI92W0eIpVGIApe0MzRWidF
         xUZfad80ZnHe7rrx8VXabqOAQsQWO7fbWsn/lQXh9RrEBe4rcweL1rMJAm+oGj/ZUNp8
         DH5WYvAOVjSz5RIvkichXMTulm72mPg0O1QdrRzMz2Ua3Q2R/KA+tsLX1iAWh62tEcV9
         tuFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=znEaxKi9Hq+9I4axphJS3UE1HcHocTZ4nn1PUPffflc=;
        b=LGmGUvwtEjY7/1918IomXWx7A+ggdxaAgl1rroYI1tIlgKMb6ESgJND6ZysPZQtcmV
         P14Ls8B2fvbUFcFLM0SbUqKb+nBlcbWCgXFyzXv8rjSlq5hemzM2Dh7b+PlZLNt5MoEb
         LPU3TpJLf4Pl2tIW3T33sgmn3lai972cB5qu1mY/wa4o8wxfPnoIzqf9CrCZ8MDtqwPJ
         fv5j2wa7C7VnGgT0Vvav2gRH2NDWv2uqxteMH+f11teK5VbSZPBunXqhKe7IxqbyHrtz
         7tO7LZTqN0ub6YTRBbO7aMY2C8vXcK7QyRmAnSPRXlhXsAtARZiQ31zIJTFk3Gr/AkvE
         HfLg==
X-Gm-Message-State: ACrzQf1sZpmLXyxXDqwK+cJz8ysgfpBNEBfAUR43XgdKh3SmCjvkwNpB
        IuGHqO02R1iuXbcNhxGH4yZgWQ==
X-Google-Smtp-Source: AMsMyM70L8CrpU4FQfCZ2v1yNKDfFY2pXHAHgriczG3PWzjnZvNhEYRPR4b6ZflZyViiw//kTc98mQ==
X-Received: by 2002:a2e:8643:0:b0:26c:40b7:a89a with SMTP id i3-20020a2e8643000000b0026c40b7a89amr11586380ljj.504.1664377099322;
        Wed, 28 Sep 2022 07:58:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5-20020ac25e65000000b00499b57032c1sm493300lfr.144.2022.09.28.07.58.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:58:18 -0700 (PDT)
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
        devicetree@vger.kernel.org
Subject: [PATCH] dt-bindings: clock: split qcom,gcc-sdm660 to the separate file
Date:   Wed, 28 Sep 2022 17:58:18 +0300
Message-Id: <20220928145818.376250-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move schema for the GCC on SDM630/SDM636/SDM660 to a separate file to be
able to define device-specific clock properties.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
index 000000000000..a39f28d37387
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-sdm660.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-sdm660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for SDM660/SDM630/SDM636
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <tdas@codeaurora.org>
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
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+        reg = <0x00100000 0x94000>;
+
+        clock-names = "xo", "sleep_clk";
+        clocks = <&xo_board>,
+                 <&sleep_clk>;
+    };
+...
-- 
2.35.1

