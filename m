Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E0C7E7C4E4
	for <linux-clk@archiver.kernel.org>; Wed,  4 Oct 2023 16:19:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243290AbjJDQTE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Oct 2023 12:19:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243292AbjJDQTE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2023 12:19:04 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03112A7
        for <linux-clk@vger.kernel.org>; Wed,  4 Oct 2023 09:19:00 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-405524e6768so23262805e9.2
        for <linux-clk@vger.kernel.org>; Wed, 04 Oct 2023 09:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696436338; x=1697041138; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8kJj48FPoSiHN0b8I4rQ0e7cODuoEICg7m3/mlHsxs=;
        b=p64OTIzum01hpspYWarAPpSb/UKK29ql39YL1OaNCd1vxvSQihSOkmuCAJJ5yJYv30
         nv9JTeAr5o8n8tH5i0NLmqSMTMzXQOph9tGeSF5PusAjmitFwIplaZgd7zvbbTVyR1vu
         iI+Ll2JgpPwRMAqLma4c1fYQRoBJn/vFAbkd+uuyhVUdJDE5sdpiyJqZtUtvS7C8ZwYj
         CZRAT7/wErcr4siWuwQuiI0Vuq8Krgwcbk/Wi//2AJFhLnoD3d/KE4r7CatpxDSAoGqF
         vxxqfmIK9fRcH/93OZQQeE7J3IKmSpljThRvJhdyNQmXWbgNZPmBKNnPJTfBwo9ieq9u
         9RGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696436338; x=1697041138;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8kJj48FPoSiHN0b8I4rQ0e7cODuoEICg7m3/mlHsxs=;
        b=kZHU3NQ7mexogNBbk3oiCqLm6r0tTbS6iBs1GfTxvuyVHO94vFlRsESsxD5E+KlAg3
         unQF9g2ivuCKp4MruYsiezEM4kTQsaD+7yzb4VtjRpajMZdDh6JlWGl2oeIEiMkK2QS3
         /2RBibsf/ciEJr78LE3rjp2ezI2AgHTLotJjWaqTu5Q55U64uIW8Aq49g6jRVWiwAFMf
         X0rRVDkGYt5lm5SG7RujLbTZuySWdGpxODPspg4278y+McZhQQuHQEup7Z3UyjowpcGU
         AKfwm0QcYe5ffa/8iiKWbE2j61sVbY6vIvKfzPdfkvbTViemoOZE9+8nEOkJxnhB81qx
         Xekg==
X-Gm-Message-State: AOJu0YwLORCZ0UvQy77vzo2Q/zjG6Uw1vhEhhc2XX/AEhNqNWtfH/auh
        w0cSCg8t58AnF/4ssW+LPuYuTg==
X-Google-Smtp-Source: AGHT+IFjtc8DdBhWcU7rWIb1XSrN6qvo7/xDol6J4BDNjChLjJAgFa/Omiw4RT8V0KLM4GHrdMu86g==
X-Received: by 2002:adf:fdc7:0:b0:31f:f982:5395 with SMTP id i7-20020adffdc7000000b0031ff9825395mr2649418wrs.35.1696436338405;
        Wed, 04 Oct 2023 09:18:58 -0700 (PDT)
Received: from x13s-linux.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id r5-20020adfe685000000b003177074f830sm4366940wrm.59.2023.10.04.09.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 09:18:58 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     andersson@kernel.org, agross@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        dmitry.baryshkov@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        jonathan@marek.ca, quic_tdas@quicinc.com,
        vladimir.zapolskiy@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        bryan.odonoghue@linaro.org
Subject: [PATCH v3 1/4] dt-bindings: clock: Use gcc.yaml for common clock properties
Date:   Wed,  4 Oct 2023 17:18:50 +0100
Message-Id: <20231004161853.86382-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004161853.86382-1-bryan.odonoghue@linaro.org>
References: <20231004161853.86382-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Various of the camcc bindings are repeated serially. We can use
qcom,gcc.yaml to encapsulate the generic repeated patterns.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/clock/qcom,camcc-sm8250.yaml      | 18 ++++--------------
 .../bindings/clock/qcom,sc7180-camcc.yaml      | 18 ++++--------------
 .../bindings/clock/qcom,sc7280-camcc.yaml      | 18 ++++--------------
 .../bindings/clock/qcom,sdm845-camcc.yaml      | 18 ++++--------------
 .../bindings/clock/qcom,sm8450-camcc.yaml      | 18 ++++--------------
 5 files changed, 20 insertions(+), 70 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
index 426335a2841c..3fd3dc1069fb 100644
--- a/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,camcc-sm8250.yaml
@@ -15,6 +15,9 @@ description: |
 
   See also:: include/dt-bindings/clock/qcom,camcc-sm8250.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     const: qcom,sm8250-camcc
@@ -33,15 +36,6 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   power-domains:
     items:
       - description: MMCX power domain
@@ -56,14 +50,10 @@ properties:
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
index 2dfc2a4f1918..c7fe6400ea13 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
@@ -15,6 +15,9 @@ description: |
 
   See also:: include/dt-bindings/clock/qcom,camcc-sc7180.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     const: qcom,sc7180-camcc
@@ -31,28 +34,15 @@ properties:
       - const: iface
       - const: xo
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
index 01feef1cab0a..dcef8de3a905 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-camcc.yaml
@@ -15,6 +15,9 @@ description: |
 
   See also:: include/dt-bindings/clock/qcom,camcc-sc7280.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     const: qcom,sc7280-camcc
@@ -31,28 +34,15 @@ properties:
       - const: bi_tcxo_ao
       - const: sleep_clk
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
index 91d1f7918037..810b852ae371 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sdm845-camcc.yaml
@@ -15,6 +15,9 @@ description: |
 
   See also:: include/dt-bindings/clock/qcom,camcc-sm845.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     const: qcom,sdm845-camcc
@@ -27,28 +30,15 @@ properties:
     items:
       - const: bi_tcxo
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - reg
   - clocks
   - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
diff --git a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
index dc3c18e4ead7..6915498deacf 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,sm8450-camcc.yaml
@@ -17,6 +17,9 @@ description: |
     include/dt-bindings/clock/qcom,sm8450-camcc.h
     include/dt-bindings/clock/qcom,sm8550-camcc.h
 
+allOf:
+  - $ref: qcom,gcc.yaml#
+
 properties:
   compatible:
     enum:
@@ -40,29 +43,16 @@ properties:
     description:
       A phandle to an OPP node describing required MMCX performance point.
 
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
   reg:
     maxItems: 1
 
 required:
   - compatible
-  - reg
   - clocks
   - power-domains
   - required-opps
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.40.1

