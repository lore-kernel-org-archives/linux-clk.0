Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E4E4C00A5A
	for <linux-clk@archiver.kernel.org>; Tue, 17 Jan 2023 22:44:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjAQWod (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 17 Jan 2023 17:44:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbjAQWnG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Jan 2023 17:43:06 -0500
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDCD66CC3
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:19 -0800 (PST)
Received: by mail-ej1-x629.google.com with SMTP id ud5so78948506ejc.4
        for <linux-clk@vger.kernel.org>; Tue, 17 Jan 2023 14:30:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eion5X6q0VGOUxLUpNxKDysfDIqbYrJk68bo85TaH+Q=;
        b=VoyIsv4dph5cVUhjhEFt5ShuNiAHmXfJfanoTfOyckl1ni8SujS/8QgYx0Qo5hSiVy
         VkldYfJOuMGyp0mw70ptCMM7d8jWbnu3X5r7l6C2aynym5UxDG6JfUDi7lewFgTIcLUh
         153j7dSvhNDfZhIwT9rwIKvgJSfgkLxpv156cqqvhCQYVkMCIeytGDC+y3dlo/pvleSh
         r3xyQxuEsmRzIT8gLNA7aK1RevD4OMIZz6U0JQYKF5jHayVpxFYd7qZeCmSFWGIS1G9v
         b/dGCAr/LSciZHAvcqbzmTJrg9rVXabuJKgYNZ6H9k1x1e384qbGc8iQnHEJPdm4vbHw
         ePGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eion5X6q0VGOUxLUpNxKDysfDIqbYrJk68bo85TaH+Q=;
        b=VZedLxYyKHpKkiUbPxrd0BW/TTcuYKA2Ig4dY2nPAmDj4C94k5jNKBjpAxdpfk7KHz
         t7UAj5LAITXD1Ta2C/6leH++wRXMEJCzYCJ8ptW3RHW+PiL6Cv6t58XjUx2SDDxBaw9z
         7MQvHX2reNEU9W93qV4UvFxeRLtNHiNRKYjyQ6qM3vZTFcYBU218DWaFyqwdR2DSv7LH
         8UvLT5KZycwuhSzHItfzHIIrEWOSjy+bgH3gjG4eYlo2hqxQf1w5qbMJ4C70rM9+ItGC
         GFoKt1B6ASxNFRoJADFRhjNm48vQ2DZDbAoEeCGTj9RYMuweVC8+ac8m2kBGFFrTbnF9
         RAzg==
X-Gm-Message-State: AFqh2ko6oBPkrdolbjSpSmaKaWUm1EB780oJROatnF750MwoX4cj9lDb
        ZaNGX8uidfEJhAvrty2/qa4fYQ==
X-Google-Smtp-Source: AMrXdXsVPq4w7cMK7zZzgZlY54dTlW+FD5LbTIjkx3OGzdQPjeGc7eDqOrmlrhG0fRBorpGJTUkB3g==
X-Received: by 2002:a17:907:a80b:b0:86f:220e:94af with SMTP id vo11-20020a170907a80b00b0086f220e94afmr13486876ejc.56.1673994617996;
        Tue, 17 Jan 2023 14:30:17 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id ec20-20020a170906b6d400b007c0f5d6f754sm13835189ejb.79.2023.01.17.14.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 14:30:17 -0800 (PST)
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
Subject: [PATCH v3 3/6] dt-bindings: mailbox: qcom: correct the list of platforms using clocks
Date:   Wed, 18 Jan 2023 00:30:10 +0200
Message-Id: <20230117223013.1545026-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
References: <20230117223013.1545026-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Only three platforms require `pll' and `aux' clocks: msm8916, msm8939
and qcs404. Correct the list of platforms in the corresponding clause.

Fixes: 0d17014e9189 ("dt-bindings: mailbox: Add binding for SDX55 APCS")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 33 ++++++++++++++-----
 1 file changed, 25 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index ecc286ab49ef..7d8de7a16984 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -72,15 +72,8 @@ allOf:
         compatible:
           enum:
             - qcom,msm8916-apcs-kpss-global
-            - qcom,msm8994-apcs-kpss-global
-            - qcom,msm8996-apcs-hmss-global
-            - qcom,msm8998-apcs-hmss-global
+            - qcom,msm8939-apcs-kpss-global
             - qcom,qcs404-apcs-apps-global
-            - qcom,sc7180-apss-shared
-            - qcom,sdm660-apcs-hmss-global
-            - qcom,sdm845-apss-shared
-            - qcom,sm6125-apcs-hmss-global
-            - qcom,sm8150-apss-shared
     then:
       properties:
         clocks:
@@ -124,6 +117,30 @@ allOf:
           items:
             - const: pll
             - const: xo
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,msm8953-apcs-kpss-global
+            - qcom,msm8976-apcs-kpss-global
+            - qcom,msm8994-apcs-kpss-global
+            - qcom,msm8996-apcs-hmss-global
+            - qcom,msm8998-apcs-hmss-global
+            - qcom,qcm2290-apcs-hmss-global
+            - qcom,sc7180-apss-shared
+            - qcom,sc8180x-apss-shared
+            - qcom,sdm660-apcs-hmss-global
+            - qcom,sdm845-apss-shared
+            - qcom,sm4250-apcs-hmss-global
+            - qcom,sm6115-apcs-hmss-global
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

