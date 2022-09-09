Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0369C6FA82
	for <linux-clk@archiver.kernel.org>; Fri,  9 Sep 2022 10:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230119AbiIIKvq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Sep 2022 06:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229993AbiIIKvm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Sep 2022 06:51:42 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99607138802
        for <linux-clk@vger.kernel.org>; Fri,  9 Sep 2022 03:51:39 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id f9so1279711lfr.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Sep 2022 03:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=gbw4YPY/UE5fI4Q+qLfjeoElzvL/1uz1uKB0yEofjUA=;
        b=fyUrmttRmXy50H93vbI/2jrFZwcqcF/imFXjg6X3OTlg2ZCe8Gywr4IMJcXV4KZQxg
         ycnidsQYuzzDIYaGz1LgbXXrra3NZzPzcF5dDSe+rkUFn4iCoG/MUKVmDv/bWMHrusfD
         BRnCPhWq7uADXx1S9il5RYsNDQQceJYoc5JJdSUI9JE1sYb1a61cockNaw7G8JSfOu5b
         xxUHiqSZhlrqVLf9f7EGvOEmyUXIXItpoxRklZc2YjgR+RCAls/2JPDfpkKAF8/izM5U
         b3f3E/KF2EIcHQd+RfdZlNxWXwgYGH6lMUNDLURjOlDOEcJejLhcGdwwJ3UWlBvIjQrj
         vxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=gbw4YPY/UE5fI4Q+qLfjeoElzvL/1uz1uKB0yEofjUA=;
        b=TMKu69V4XOnpD5AWPziP3d3imLXgghmbIonfuMbkqMcoiYSWMMPl0Sm1+7nEg7dMUg
         mmKjxNNWUILZsOQWaZguO8aJY/I+lTzPy0R2+nZe+yikxacNelQtxa29GJwli3P5ojSX
         FQlLAWNH9N7u3DNaBFbvMrN8NA52PIlIif87hEhvT0AaLpYd6UfGeVGUA4Bgirz5Tb29
         zsJhZ9RgHsmeoUqAySPv50vv4KzljQBe3oW+PAY92xbGqXYOzd0d5PBArkQ+sPPJzpvr
         jYTEy6wJgxM/OcP8LxzR7JVnqov2vsQIRQv4tXFa8Of+l1OVjy1CCl9p7/DzMBgYaWwP
         sUZg==
X-Gm-Message-State: ACgBeo1X9LEm6ZKhqlhj4VOs8tT6h+F6MHhJkrfCEHZdRCiqIqglcCza
        ysAbghCSlkOynP715lmfL3CDtw==
X-Google-Smtp-Source: AA6agR7cJU18sVCXp1r12IwZOfr3/Vh+0MKLCeERxNE+TNX/eKfC/+rdw6/BlMETjTMU0AOYouWm1w==
X-Received: by 2002:a05:6512:1189:b0:494:b306:c16 with SMTP id g9-20020a056512118900b00494b3060c16mr4377886lfr.452.1662720697750;
        Fri, 09 Sep 2022 03:51:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u4-20020a05651220c400b004949903efdcsm25428lfr.287.2022.09.09.03.51.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 03:51:37 -0700 (PDT)
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
Subject: [PATCH v2 1/5] dt-bindings: clock: qcom,gcc-msm8660: separate GCC bindings for MSM8660
Date:   Fri,  9 Sep 2022 13:51:32 +0300
Message-Id: <20220909105136.3733919-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
References: <20220909105136.3733919-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Create a separate DT bindings for Global Clock Controller on MSM8660
platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../bindings/clock/qcom,gcc-msm8660.yaml      | 54 +++++++++++++++++++
 .../bindings/clock/qcom,gcc-other.yaml        |  3 --
 2 files changed, 54 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
new file mode 100644
index 000000000000..09b2ea60d356
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8660.yaml
@@ -0,0 +1,54 @@
+# SPDX-License-Identifier: GPL-2.0-only
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,gcc-msm8660.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8660
+
+maintainers:
+  - Stephen Boyd <sboyd@kernel.org>
+  - Taniya Das <quic_tdas@quicinc.com>
+
+description: |
+  Qualcomm global clock control module which supports the clocks and resets on
+  MSM8660
+
+  See also:
+  - dt-bindings/clock/qcom,gcc-msm8660.h
+  - dt-bindings/reset/qcom,gcc-msm8660.h
+
+allOf:
+  - $ref: "qcom,gcc.yaml#"
+
+properties:
+  compatible:
+    enum:
+      - qcom,gcc-msm8660
+
+  clocks:
+    maxItems: 2
+
+  clock-names:
+    items:
+      - const: pxo
+      - const: cxo
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  # Example for GCC for MSM8974:
+  - |
+    clock-controller@900000 {
+      compatible = "qcom,gcc-msm8660";
+      reg = <0x900000 0x4000>;
+      #clock-cells = <1>;
+      #reset-cells = <1>;
+      #power-domain-cells = <1>;
+      clocks = <&pxo_board>, <&cxo_board>;
+      clock-names = "pxo", "cxo";
+    };
+...
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 61b90e836b5b..aae83a22b5fb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -21,8 +21,6 @@ description: |
   - dt-bindings/clock/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8953.h
   - dt-bindings/reset/qcom,gcc-msm8939.h
-  - dt-bindings/clock/qcom,gcc-msm8660.h
-  - dt-bindings/reset/qcom,gcc-msm8660.h
   - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -40,7 +38,6 @@ properties:
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
-      - qcom,gcc-msm8660
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8974
-- 
2.35.1

