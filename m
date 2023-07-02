Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94FC5C00528
	for <linux-clk@archiver.kernel.org>; Sun,  2 Jul 2023 17:43:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230025AbjGBRnR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Jul 2023 13:43:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229707AbjGBRmy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Jul 2023 13:42:54 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8080E6D
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 10:42:52 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b5c231f842so54007081fa.2
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 10:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688319771; x=1690911771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ca1lCqRiuB+dn4eD6wRvmXrlOFXjwi+eXsVfOaPlfrY=;
        b=DPMhhKcZnrCduJPLNWHXheMbw7Qk2BfD0Mvx5n4qijgodlZFH85ezf1bROG6mH1wtf
         +JHLyWt3bKfN+I7tNR8bXCzAbileB0OoYtqC7BsDb1oPlHfW3gcgu5v0PajvfQEtsBRG
         P7NnagoCNXmvYRlmgXowc+V2hu6Rt3pGyHxWljqrziuxfv5IHsQQRC1I+onZVN2/FXyk
         vcmLLmoQ849XjqvLKfLF6JR7GGeltkEGJTEg8wub3V3BDy+zcVUdkIbfDjsPDEpaIgBb
         YuX6P/kIz5SpXfqvJev+KJMZ8SmPnyqhufhHb52gVA+gfCkJ2OqQmMKYLKUuUqI0y8DO
         G9Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688319771; x=1690911771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ca1lCqRiuB+dn4eD6wRvmXrlOFXjwi+eXsVfOaPlfrY=;
        b=CkmHwAnx2iensCek5Bh41rTnAS/jGGs0l/qsfr/suDwHquQASUpv9Xm1YW2WVjqEQr
         iylyPIXZuCm7lkV/zqZ9arXwfiedtDR2FoIWAFmjNpXER1oz/JpKub6kHxthUnF/BkzE
         J1Q0WLMszpJ/cNe3EKk3XvoWCkoA2yqYoBON5wOlt+2oDppaSkezqZN0w0eQGT0KRhH/
         H9OInn4ElmIJpJ+1jbxcITUTPG9f7ZGobAfv+UJEmwze1iMj/NlnkqEDTkmuXmDIwdZm
         ByE/iY01EWOWEwgeW2TOQcPlPdTQF56AxkN4Uk6Y6s4hAR1jkefCCtQ71ryQNV/k20Dl
         P+Sw==
X-Gm-Message-State: ABy/qLZ0Anazv6odBPcA1RNgIjQKHHH0LCCz9ea6/RHD4FR5AqePv6R1
        QzqfBS9AiHdqSEvwtDLhf0o9Jw==
X-Google-Smtp-Source: APBJJlGPpV/Nu2PasXCj/Q9XCsLgZPwbLMR/bJ2WY4I57bygugelB6693qEcO8IQs5TtREEuiX7Kow==
X-Received: by 2002:a2e:9d03:0:b0:2b6:e623:7b57 with SMTP id t3-20020a2e9d03000000b002b6e6237b57mr897118lji.25.1688319770837;
        Sun, 02 Jul 2023 10:42:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id v23-20020a2e9917000000b002b6daa3fa2csm1372550lji.69.2023.07.02.10.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 10:42:50 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 03/28] dt-bindings: soc: qcom: qcom,saw2: define optional regulator node
Date:   Sun,  2 Jul 2023 20:42:21 +0300
Message-Id: <20230702174246.121656-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The SAW2 device can optionally provide a voltage regulator supplying the
CPU core, cluster or L2 cache. Change the boolean 'regulator' property
into a proper regulator description. This breaks schema compatibility
for the sake of properly describing the regulator.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/soc/qcom/qcom,saw2.yaml   | 15 ++++++++++++++-
 1 file changed, 14 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
index 84b3f01d590c..a2d871ba8c45 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,saw2.yaml
@@ -47,7 +47,7 @@ properties:
     minItems: 1
 
   regulator:
-    type: boolean
+    $ref: /schemas/regulator/regulator.yaml#
     description: Indicates that this SPM device acts as a regulator device
       device for the core (CPU or Cache) the SPM is attached to.
 
@@ -96,4 +96,17 @@ examples:
         reg = <0x17912000 0x1000>;
     };
 
+  - |
+    /*
+     * Example 3: SAW2 with the bundled regulator definition.
+     */
+    power-manager@2089000 {
+        compatible = "qcom,apq8064-saw2-v1.1-cpu", "qcom,saw2";
+        reg = <0x02089000 0x1000>, <0x02009000 0x1000>;
+
+        regulator {
+            regulator-min-microvolt = <850000>;
+            regulator-max-microvolt = <1300000>;
+        };
+    };
 ...
-- 
2.39.2

