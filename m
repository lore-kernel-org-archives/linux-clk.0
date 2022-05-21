Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FECC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 21 May 2022 15:14:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244879AbiEUPOr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 May 2022 11:14:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244960AbiEUPOp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 May 2022 11:14:45 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E85556229
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 08:14:43 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id m6so12533186ljb.2
        for <linux-clk@vger.kernel.org>; Sat, 21 May 2022 08:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UwkwcGKoksv09GJQbCQ4l/+czpMeUCe0OFbPY533J+4=;
        b=d/TxhrfImNz5hVaB9J0qBolh/53XhZVIBisENi8rpOFJLetbWurTyn/8XbD8wtOkvM
         eJ66alCCmzDZ9AhH2QSaWfykM01ZysMcLFhyP2ccux+m+4P7W6ml2YSielJbaJNyF4Wd
         ZrT6glpjmDiYWXvodKresSKkabi3x/O03lOKKUGGX+1FAqjFVy8Q/B0w5xnVGApjl/DX
         GqEazPBAdihKCej+RpZ6SxZq7CA8AftU0aGrBK1oIYqa+X0UT/rRRtZEQRPNrQ8oATwa
         HGcHEu2b0vpeFandhZEETxj34v3CP2NyfZJkREise3CAKRpv2DVKjXzFOl6Dn2jjY/Ry
         MSbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UwkwcGKoksv09GJQbCQ4l/+czpMeUCe0OFbPY533J+4=;
        b=a1VHUQYG75rS7cEE5WxBuGvMwKXF0zTRsJeCUkt0HBDHlvVcs7E4pby2rTeof8TcmK
         5v3SlIsuFnqhDO2nFcjyhHoG8cNElNfHy0D+b5JwR+4E8Fx0lLbmQucp4tznjXtrkNTH
         IFhM3rh1l22Y5G7I3In1gI7LnqPGZNT1dM0mlMcWRfcybObVi3Za6vSI4ThntmZwkbO/
         7wPc7Ch7TFFGP62cHl/rGPNCAVDdblvXeoqdPGiu3yB1ME2dvuecFjtjaKAY3kmRDcdk
         42tJ/k+nYOGLLlQmWFOQ/wMr/oA/F1v1Mmiumk4B05K4LwSA1M3rBgVmCwyMylMZiuFt
         1UEA==
X-Gm-Message-State: AOAM531LQqiTOv4hgCSSBcLsGNVxXibm04UiOKWhmodNypWT/dZ3R0Ze
        Qmd1wYQC5Q/euilLVZOQCZSdcQ==
X-Google-Smtp-Source: ABdhPJxTvEP2E71Kg4FwVPHnJedh1yiQhNPMwH8JMw32maTSl42FHBWVjh8bAoRUzC5/nL8YDiE9tw==
X-Received: by 2002:a05:651c:510:b0:24f:545c:9362 with SMTP id o16-20020a05651c051000b0024f545c9362mr8436171ljp.263.1653146081931;
        Sat, 21 May 2022 08:14:41 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.156])
        by smtp.gmail.com with ESMTPSA id v22-20020a2e7a16000000b0024f3d1daedfsm716849ljc.103.2022.05.21.08.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 May 2022 08:14:41 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v6 1/4] dt-bindings: clock: qcom,gcc-apq8064: move msm8960 compat from gcc-other.yaml
Date:   Sat, 21 May 2022 18:14:34 +0300
Message-Id: <20220521151437.1489111-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
References: <20220521151437.1489111-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

MSM8960 shares the design (and the driver) of the global clock
controller with APQ8064. Move it from clock/qcom,gcc-other.yaml to
clock/qcom,gcc-apq8064.yaml.

As the example in gcc-other.yaml was using qcom,gcc-msm8960 compat string,
change it to qcom,gcc-msm8974.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-apq8064.yaml         | 6 ++++--
 Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml | 5 ++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
index 9fafcb080069..bd7b04c75e50 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-apq8064.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-apq8064.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller Binding for APQ8064
+title: Qualcomm Global Clock & Reset Controller Binding for APQ8064/MSM8960
 
 allOf:
   - $ref: qcom,gcc.yaml#
@@ -23,7 +23,9 @@ description: |
 
 properties:
   compatible:
-    const: qcom,gcc-apq8064
+    enum:
+      - qcom,gcc-apq8064
+      - qcom,gcc-msm8960
 
   nvmem-cells:
     minItems: 1
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index 142402f29d98..8c54af4ae6d2 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -47,7 +47,6 @@ properties:
       - qcom,gcc-msm8916
       - qcom,gcc-msm8939
       - qcom,gcc-msm8953
-      - qcom,gcc-msm8960
       - qcom,gcc-msm8974
       - qcom,gcc-msm8974pro
       - qcom,gcc-msm8974pro-ac
@@ -61,10 +60,10 @@ required:
 unevaluatedProperties: false
 
 examples:
-  # Example for GCC for MSM8960:
+  # Example for GCC for MSM8974:
   - |
     clock-controller@900000 {
-      compatible = "qcom,gcc-msm8960";
+      compatible = "qcom,gcc-msm8974";
       reg = <0x900000 0x4000>;
       #clock-cells = <1>;
       #reset-cells = <1>;
-- 
2.35.1

