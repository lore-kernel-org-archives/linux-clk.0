Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C854BC32793
	for <linux-clk@archiver.kernel.org>; Wed, 18 Jan 2023 13:52:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjARNw0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Jan 2023 08:52:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230322AbjARNvm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Jan 2023 08:51:42 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F08F31E2E
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:23:01 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id tz11so18787963ejc.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Jan 2023 05:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qd5f8hzZm5qMEoqR4g+4cAWjwGfAnZ3T8KmzKwoOA5o=;
        b=WsBANPIb/MSdauDOF3I1Cwh7/TeK7qJ7AeqGW3ZSNUpH8GfOH/c3JFn2WMxTRj2Z3T
         BK0Nh81P6QcLQFzaW9A5aAnV53te9rmMSyqgNs1Kd5sU2un5YEbBWO59Zsu8bi/aE3EF
         KpSJk3qJ3+kpfCsj4Xf8DvGW+t0vkNIazvkqspeW5oa081KI4JdvUPLQDP0fptUibCNV
         Ul/9yQRGToJfmrERGayAr0sMZJ5kbZ5t2IcA6naE03IUoED9r6g5iBttjsTI4WCtiQk+
         B03lzUsWoPhWoqevcJZ4t/XyYIXnnVRyexuwPraWyDjI0q+QtoFLZCWNkHUEzyEGcVb+
         L5UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qd5f8hzZm5qMEoqR4g+4cAWjwGfAnZ3T8KmzKwoOA5o=;
        b=ZbF3weZThTVHl3Gws50dbqkkOVBBI/ocXs623GJIQ6Lp28MAXDWMlAXvC7HaRCLDPC
         QbI/BfTrXdmsomaRePsuIpPo6JvGnRf+mQHRhgh8ld4+GY96jZl7XTxm9YkopAt1Mgj0
         A29JcFx2gfOUEjm48rBq85jNK3PMY5R45Q9zbO7iThxCowmn6zLkyIUDN3nIuuGAO+2k
         MtXL0v9zlrs2IExfVIGKl26G638SAUQn77Sj6p6A3jHqhad8CcUYwEajJKcjeZ1WwPlx
         z6grZw529t1yuJ1ZuOPfsqYP6HjI60HAcV9PEeTEMpjTy3HrsSNyzLU/En6k+mRzGfdK
         SrXg==
X-Gm-Message-State: AFqh2kpD7ganrfev0aztb8jLmyhzjOlXHyWndQj8ZU7lBaVNA7pzA545
        xQBz9QqhvcXd41VoauL0zpWFnw==
X-Google-Smtp-Source: AMrXdXujj5F9K3yswBHwGPwac2uPaJDZZt4vRzzKOpqsN79uy1jIzXyd9Ml4Gc5huOXZpaqZkejJbw==
X-Received: by 2002:a17:906:5a5f:b0:86f:3c6b:f7c6 with SMTP id my31-20020a1709065a5f00b0086f3c6bf7c6mr7134674ejc.64.1674048179800;
        Wed, 18 Jan 2023 05:22:59 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id u2-20020a1709061da200b0083f91a32131sm14633831ejh.0.2023.01.18.05.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jan 2023 05:22:59 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>,
        Jassi Brar <jassisinghbrar@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/7] dt-bindings: mailbox: qcom: correct the list of platforms using clocks
Date:   Wed, 18 Jan 2023 15:22:50 +0200
Message-Id: <20230118132254.2356209-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
References: <20230118132254.2356209-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The schema incorrectly lists some of the platforms in the statement
requiring clocks/clock-names. Correct this by moving platforms not
requiring additional clocks to the separate clause.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 26 +++++++++++++------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index ecc286ab49ef..5f7770036fed 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -72,15 +72,7 @@ allOf:
         compatible:
           enum:
             - qcom,msm8916-apcs-kpss-global
-            - qcom,msm8994-apcs-kpss-global
-            - qcom,msm8996-apcs-hmss-global
-            - qcom,msm8998-apcs-hmss-global
             - qcom,qcs404-apcs-apps-global
-            - qcom,sc7180-apss-shared
-            - qcom,sdm660-apcs-hmss-global
-            - qcom,sdm845-apss-shared
-            - qcom,sm6125-apcs-hmss-global
-            - qcom,sm8150-apss-shared
     then:
       properties:
         clocks:
@@ -124,6 +116,24 @@ allOf:
           items:
             - const: pll
             - const: xo
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,msm8994-apcs-kpss-global
+            - qcom,msm8996-apcs-hmss-global
+            - qcom,msm8998-apcs-hmss-global
+            - qcom,sc7180-apss-shared
+            - qcom,sdm660-apcs-hmss-global
+            - qcom,sdm845-apss-shared
+            - qcom,sm6125-apcs-hmss-global
+            - qcom,sm8150-apss-shared
+    then:
+      properties:
+        clocks: false
+        clock-names: false
+
   - if:
       properties:
         compatible:
-- 
2.39.0

