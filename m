Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09362C6FA90
	for <linux-clk@archiver.kernel.org>; Wed, 28 Sep 2022 14:56:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbiI1O4h (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 28 Sep 2022 10:56:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234383AbiI1O43 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 28 Sep 2022 10:56:29 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ACAA9C2C7
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 07:56:13 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id g20so14618830ljg.7
        for <linux-clk@vger.kernel.org>; Wed, 28 Sep 2022 07:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=WNvCU5BgP4cLQ1KOWwPdEXpzkinKzwkXxiYmcUxdJA8=;
        b=GdI/dJdD9k6/mJPUiQ3XGPbO4ayqezDXa2hlljGMU8eUyxmyCbCywtDxLq72TSTNN5
         YG0RtXoIpJfr825wiKb1BLEPNq7j2I4TCv+FWsdv2tu0QI7+9RuRj0iLkccSfCsD92sZ
         n064bcPA+GLxhu8aHIn62eiBGWbjPdQXrlEb8Hzyib3bO7hKSd5QgHAko3FGohUl9IJS
         LusBAZFxpz9hGfa5O64BvvPHOj9j2Lf1Vg1nqjeSBh+10syliuaNnHnkRT5a40UJcrVi
         IRHtQq5Y3M+zBxupBPWGKeI8fT9HDOw1WjeNrampTRusyXeMyXLBeoCjPSCi69ADUwU6
         O+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=WNvCU5BgP4cLQ1KOWwPdEXpzkinKzwkXxiYmcUxdJA8=;
        b=qIfvWNhu+6DtdHuoEe08ia2+QzsutTg50M+hwHO9DUrta8Ow1c6GkmceGwlLkGBCWe
         ppkoxmmOOX5zCQv2IOUTkJVvHcmIId7VWHl880ZPcdjywm8C9cJpHwG4t/ojgbXqAVat
         XwQqfYw5E8T9uXU1rogEJGvuzu9YndaN4YD/MC0UBN0IwXogQfVY0vI4yc/K3P+mYUqH
         PXUyYgmgGj4b41F9cNMAhffsifarCd0z1tjpAxOYiInB2lXw5uMNTTN6caLLEj/cqOUd
         Oo5OHQcoAcy7vBBzZ3QdtT5vORzgXcXRj3yspwj7aRQELuRhvZ3nYekvOto3y3Aj06rn
         b0RQ==
X-Gm-Message-State: ACrzQf2cKzIDMVu7J88RCGP6+eoywUEZ9OyMvWH9qJACmUOMIzog3QJW
        mhl7+5+R8YnrFvRy2hUFnpXulQ==
X-Google-Smtp-Source: AMsMyM7tTmymw6eXquT9dnrNh1y8Bs9UycM0h+950vViQDtRpWYwcw9CKRsCGRaRzUdnEpd0u/UMOg==
X-Received: by 2002:a2e:a602:0:b0:264:5132:f59 with SMTP id v2-20020a2ea602000000b0026451320f59mr12405974ljp.0.1664376971585;
        Wed, 28 Sep 2022 07:56:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o6-20020a05651238a600b0048b256bb005sm498094lft.49.2022.09.28.07.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Sep 2022 07:56:11 -0700 (PDT)
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
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Subject: [PATCH 1/3] dt-bindings: clock: move qcom,gcc-msm8939 to qcom,gcc-msm8916.yaml
Date:   Wed, 28 Sep 2022 17:56:07 +0300
Message-Id: <20220928145609.375860-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
References: <20220928145609.375860-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The MSM8939 GCC bindings are fully comptible with MSM8916, the clock
controller requires the same parent clocks, move MSM8939 GCC compatible
to qcom,msm8916.yaml

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,gcc-msm8916.yaml   | 11 ++++++++---
 .../devicetree/bindings/clock/qcom,gcc-other.yaml     |  3 ---
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
index 564aa764b17b..2ceb1e501ef9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-msm8916.yaml
@@ -4,7 +4,7 @@
 $id: http://devicetree.org/schemas/clock/qcom,gcc-msm8916.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Global Clock & Reset Controller Binding for MSM8916
+title: Qualcomm Global Clock & Reset Controller Binding for MSM8916 and MSM8939
 
 maintainers:
   - Stephen Boyd <sboyd@kernel.org>
@@ -12,14 +12,19 @@ maintainers:
 
 description: |
   Qualcomm global clock control module which supports the clocks, resets and
-  power domains on MSM8916.
+  power domains on MSM8916 or MSM8939.
 
   See also:
   - dt-bindings/clock/qcom,gcc-msm8916.h
+  - dt-bindings/clock/qcom,gcc-msm8939.h
+  - dt-bindings/reset/qcom,gcc-msm8916.h
+  - dt-bindings/reset/qcom,gcc-msm8939.h
 
 properties:
   compatible:
-    const: qcom,gcc-msm8916
+    enum:
+      - qcom,gcc-msm8916
+      - qcom,gcc-msm8939
 
   clocks:
     items:
diff --git a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
index aae83a22b5fb..76988e04c7db 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gcc-other.yaml
@@ -18,9 +18,7 @@ description: |
   - dt-bindings/clock/qcom,gcc-ipq4019.h
   - dt-bindings/clock/qcom,gcc-ipq6018.h
   - dt-bindings/reset/qcom,gcc-ipq6018.h
-  - dt-bindings/clock/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8953.h
-  - dt-bindings/reset/qcom,gcc-msm8939.h
   - dt-bindings/clock/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/reset/qcom,gcc-msm8974.h (qcom,gcc-msm8226 and qcom,gcc-msm8974)
   - dt-bindings/clock/qcom,gcc-mdm9607.h
@@ -38,7 +36,6 @@ properties:
       - qcom,gcc-ipq6018
       - qcom,gcc-mdm9607
       - qcom,gcc-msm8226
-      - qcom,gcc-msm8939
       - qcom,gcc-msm8953
       - qcom,gcc-msm8974
       - qcom,gcc-msm8974pro
-- 
2.35.1

