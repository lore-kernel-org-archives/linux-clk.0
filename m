Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1544C43334
	for <linux-clk@archiver.kernel.org>; Tue,  5 Jul 2022 11:27:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229941AbiGEL1l (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Jul 2022 07:27:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230254AbiGEL1k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Jul 2022 07:27:40 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECDE0165A0
        for <linux-clk@vger.kernel.org>; Tue,  5 Jul 2022 04:27:38 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id l7so13364966ljj.4
        for <linux-clk@vger.kernel.org>; Tue, 05 Jul 2022 04:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DDOZfRd1HTqUfm1HeVAgnUymdGTbLswrOs88vTN4QwU=;
        b=KnittvwjoD6wTylEJR+FVKmbiJWKBGYF0KtsQR67sEUF6MI5n/As97A1unfRFQVnUy
         lAzBz2OUD5MtUMhyveONvrNjnhdR453DHLrLRVYbWSdzeGLljfIrkKQRWhvIU8hequFQ
         hL7Hhf1I0l/WyUn3Tw8e+CLI14yGt13azsEDC7L18cPdh26v4k4y5Z1Z/U3uzq8NfooZ
         OxiUeIHnKX7mUT3JBmbq15bkFySHG64GALQAj/LBHHqt0YZ7zr2p6MlqcHKW57fNpaUZ
         iMTekVOSj/ynir2E4UD4bMwCSm4TyTK6a9QvABu7enL9EgwQgyIawdomXiDUACeh43rx
         hBgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DDOZfRd1HTqUfm1HeVAgnUymdGTbLswrOs88vTN4QwU=;
        b=CEGLXFchOBmnAbKNgdrLWHL4NU3B3XnVG1xxj3XhVdRkC8TZf/zfmUr1aUT6PFp883
         FV3Y+dSfRwyNQPLTbZHzfUpeWrydL4gY7M1lD3KqJpU1hPK7woOFBeMAfrpuONWl7UL7
         yJZJyjprY77LxikUu/yVyyT1yv/lUVQiu5nTYTkBw8uirkFgsbN0BxVvwYoD8bmmIXh4
         VWDB3JsynRUd5dNHh0Jj3uY3KLqx06ug4uTniOllUffT8+9Hs06D8Nry+OLgVbXV7E3i
         KY6mXYesu6A9je28TFZgeEW21p0ViVaZR1/1Vf1ldGE9xU7GiPT/+JgmHPAewLStePm7
         j5IQ==
X-Gm-Message-State: AJIora9T7fBO5LDMVi937sxBhTJbdh+gUDVNv9eZ+qqujOhQmJup3JsU
        rE+3fgyKEQBlco5ZheE4dwo7cg==
X-Google-Smtp-Source: AGRyM1sFuaESAD0zDBaKLRbw6D6wO86fb2NUssGM2f0sC3fhxnRE/GmFYDp1v2FyhaUkJhT4Y9JzIQ==
X-Received: by 2002:a2e:8888:0:b0:25b:f2f6:ea60 with SMTP id k8-20020a2e8888000000b0025bf2f6ea60mr17799095lji.298.1657020457101;
        Tue, 05 Jul 2022 04:27:37 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id k26-20020a05651c10ba00b0025a736f5a41sm5525449ljn.9.2022.07.05.04.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Jul 2022 04:27:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 2/2] dt-bindings: clock: qcom,mmcc: define clocks/clock-names for MSM8996
Date:   Tue,  5 Jul 2022 14:27:34 +0300
Message-Id: <20220705112734.1323355-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
References: <20220705112734.1323355-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Define clock/clock-names properties of the MMCC device node to be used
on MSM8996 platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,mmcc.yaml  | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
index 6b831730a914..ef6736198451 100644
--- a/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,mmcc.yaml
@@ -31,11 +31,11 @@ properties:
       - qcom,mmcc-sdm660
 
   clocks:
-    minItems: 9
+    minItems: 8
     maxItems: 10
 
   clock-names:
-    minItems: 9
+    minItems: 8
     maxItems: 10
 
   '#clock-cells':
@@ -113,6 +113,35 @@ allOf:
             - const: dsi1pllbyte
             - const: hdmipll
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: qcom,mmcc-msm8996
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Board XO source
+            - description: Global PLL 0 clock
+            - description: MMSS NoC AHB clock
+            - description: DSI phy instance 0 dsi clock
+            - description: DSI phy instance 0 byte clock
+            - description: DSI phy instance 1 dsi clock
+            - description: DSI phy instance 1 byte clock
+            - description: HDMI phy PLL clock
+
+        clock-names:
+          items:
+            - const: xo
+            - const: gpll0
+            - const: gcc_mmss_noc_cfg_ahb_clk
+            - const: dsi0pll
+            - const: dsi0pllbyte
+            - const: dsi1pll
+            - const: dsi1pllbyte
+            - const: hdmipll
+
   - if:
       properties:
         compatible:
-- 
2.35.1

