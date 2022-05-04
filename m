Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF39EC433FE
	for <linux-clk@archiver.kernel.org>; Wed,  4 May 2022 12:27:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349523AbiEDMbY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 May 2022 08:31:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349497AbiEDMbQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 May 2022 08:31:16 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B56FA31203
        for <linux-clk@vger.kernel.org>; Wed,  4 May 2022 05:27:39 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id bv19so2560556ejb.6
        for <linux-clk@vger.kernel.org>; Wed, 04 May 2022 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=H2qfFZN2tCgIDN03JaLwKupUYJB4a9Vy4hlFglpucfc=;
        b=qmNBjzLWxn/FaOppFTsUlNInVHhDH+G7IDJZhA0f/PlZYD8ScHr1DXG+qowifHjmsN
         qDX4Nym8VzaXEfBpRqBrTQvE+Uqv5ZW0OKmyZ6ofe2EkxLJGjjDMcFW8mWSPMkm4gHVk
         UyoOlZG4/VkEiJ1ag9DkZlY84M3qLZ0043TovmccE0ZsWka+Xmwa591oEShWj0upNQ+1
         J1AjIKn32BRNjXztaCOxQHtPrktC1aWQjNtLeljVww1Hlosm+J9aGcWdBZkigfF6CLhg
         vr3FvfpwQCGPdlCQCDVZ1Jsha6iAn0QzowhaRAqVDomGaKg9WWe6smOmaDyWxjwtYkmM
         spJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=H2qfFZN2tCgIDN03JaLwKupUYJB4a9Vy4hlFglpucfc=;
        b=cnVG/jhvElDqE1NFjIHK4DP1MDClQSButOHudCUchQCPFtVq3ZhJMqSnzd0/45ht1D
         cJ/ylu8QS01KKtxiVVigXxRoqEBfZq0ehpF1XXd5sF+kN7Wbs5IxCn7q8Nfx8nZNuXxR
         83ApvVcM9jWpNbFBpdsgHVM3E0Yo5wQvePwcJfvqJ2L8EjPF5rSexgJp1YskZMe6ZLKw
         jR3Ava14afMNJntmwp5smCN+XA9c7HnOnenrA7Tt0Y2k7Q4NWJentjnOTkYb3mA9joNR
         hmW7o4WIXw1dwPX8M6lG5kyGAo76b2jQE8aiNz+pbsH6I5bMlGrp7GiQq2fDW4MG/Jlq
         ac4w==
X-Gm-Message-State: AOAM530iLtiStnihxMqut8DBx5l1R62aRAW6LOsL0CH0APblG68xOVqC
        ReKMVb89C72mWT9OQ9TP7+f70w==
X-Google-Smtp-Source: ABdhPJww9C5vYIZ6G9qj30ymWqYoCBVmAzC8gODT3nVu5g2jqCKHSngzU7GGIm457Nc/jtF5zR/sdQ==
X-Received: by 2002:a17:906:3082:b0:6e0:111f:8986 with SMTP id 2-20020a170906308200b006e0111f8986mr19551734ejv.677.1651667258070;
        Wed, 04 May 2022 05:27:38 -0700 (PDT)
Received: from prec5560.. (freifunk-gw.bsa1-cpe1.syseleven.net. [176.74.57.43])
        by smtp.gmail.com with ESMTPSA id mm30-20020a170906cc5e00b006f3ef214e06sm5675557ejb.108.2022.05.04.05.27.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 May 2022 05:27:37 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzk+dt@kernel.org, jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>, Rob Herring <robh@kernel.org>
Subject: [PATCH v3 5/6] dt-bindings: clock: Add Qcom SM8350 DISPCC bindings
Date:   Wed,  4 May 2022 14:27:24 +0200
Message-Id: <20220504122725.179262-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220504122725.179262-1-robert.foss@linaro.org>
References: <20220504122725.179262-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Jonathan Marek <jonathan@marek.ca>

Add sm8350 DISPCC bindings, which are simply a symlink to the sm8250
bindings. Update the documentation with the new compatible.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Robert Foss <robert.foss@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

Changes since v2
 - Add my SoB - Bjorn


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

