Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA53DC433F5
	for <linux-clk@archiver.kernel.org>; Tue,  3 May 2022 13:06:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235852AbiECNJi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 3 May 2022 09:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235872AbiECNIm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 3 May 2022 09:08:42 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6605839145
        for <linux-clk@vger.kernel.org>; Tue,  3 May 2022 06:05:05 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b24so19770065edu.10
        for <linux-clk@vger.kernel.org>; Tue, 03 May 2022 06:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K0SBCr7UtqnGTe/v3toP46qKZcKN+CT+jT8gh91QnOI=;
        b=FpFzDemp5JAOfv7feq0gNrbwAphBwtF86TL1CKRNuwxEeRgcVfl/mFHV2no7999C4e
         aZWaXxGCYMbf7yRcOt/v+EhsQz93NVJWmaSykBFpZYTC9xwKmQhuKY/xyuTF1yV8l+dq
         EsoU6dx8qc6MJZKHi/Jxc8SUT8v3S5Ot3QUwfYoqHzr8Vcu3E8DjCIM2IWrTsep+VHRn
         F1uU1Y7/7iDM4Twmh4xraXgEpz0QdSbEsj7MBHFcCEOR9qZSGs+zu8svkopyH/y/s5IE
         8c8AXCpn3Uowesjm8Nfn18S6SX2yG9KYWiBsXfyHyI6JRPQparEvbl0VtwJpokWHsSii
         4HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K0SBCr7UtqnGTe/v3toP46qKZcKN+CT+jT8gh91QnOI=;
        b=ATeKK3zwMqZK2yiMOTEGEiqY6GocVm+L7wIAsH5M+IrIJ+IAZlhKMZhvmhbGxL36oo
         /xk5WED3Ju6QxoA3BYjtlLjdeGBH3URraRWIgG3z2tZ685cPpqFHNXjiQqDccE+IJfcg
         /wPQLUPuWjHiQ1n3/QyV2M4lgOJtlxtuIafP8MnfaE3lye8L/2qt2hLyIQ+sOoCiRktA
         bbDFhiGvQVgAlWsz4R/6flaKOJaa0fNnJ2re90cq/+Aakm01e8AKBbwQNnBjO7giEV0+
         md01rr+NnMertmFluHAesJkO+ohSr5ZW8nd4rne4yMYNdcx6sOf8nMdpYW5xAOuMTo4/
         /uYw==
X-Gm-Message-State: AOAM530QafcfmMoqKJox5jOOSAQJ8g/rixw6hQ8M0bXMnMgB9E2Rjt0w
        sk92X2ocidHJutquiIMyRSMK5A==
X-Google-Smtp-Source: ABdhPJx0ChXIobPkGkhWdTTODEQzyFRu77Glvj8BqeOTzzb17aBc4FJAO3qzbzS6sVFzqDCv9ox9fQ==
X-Received: by 2002:a05:6402:4251:b0:427:bbac:e1ee with SMTP id g17-20020a056402425100b00427bbace1eemr11658858edb.374.1651583103417;
        Tue, 03 May 2022 06:05:03 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id y13-20020aa7cccd000000b0042617ba639asm7868782edt.36.2022.05.03.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 06:05:02 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        anischal@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v2 7/8] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Tue,  3 May 2022 15:04:47 +0200
Message-Id: <20220503130448.520470-7-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503130448.520470-1-robert.foss@linaro.org>
References: <20220503130448.520470-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml       | 6 ++++--
 include/dt-bindings/clock/qcom,dispcc-sm8350.h              | 1 +
 2 files changed, 5 insertions(+), 2 deletions(-)
 create mode 120000 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 31497677e8de..7a8d375e055e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,18 +4,19 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
 
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SM8150 and SM8250.
+  power domains on SM8150/SM8250/SM8350.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sm8150.h
     dt-bindings/clock/qcom,dispcc-sm8250.h
+    dt-bindings/clock/qcom,dispcc-sm8350.h
 
 properties:
   compatible:
@@ -23,6 +24,7 @@ properties:
       - qcom,sc8180x-dispcc
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
+      - qcom,sm8350-dispcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
new file mode 120000
index 000000000000..0312b4544acb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
@@ -0,0 +1 @@
+qcom,dispcc-sm8250.h
\ No newline at end of file
-- 
2.34.1

