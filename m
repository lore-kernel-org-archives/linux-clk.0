Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87EB3C4708C
	for <linux-clk@archiver.kernel.org>; Tue,  6 Dec 2022 12:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234754AbiLFM5B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 6 Dec 2022 07:57:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234810AbiLFM44 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Dec 2022 07:56:56 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A806300
        for <linux-clk@vger.kernel.org>; Tue,  6 Dec 2022 04:56:44 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id fc4so5896276ejc.12
        for <linux-clk@vger.kernel.org>; Tue, 06 Dec 2022 04:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhLdyy64MSy62j2GfoCPYL31V7FQmGy5yzQrHHdIKxE=;
        b=g6HBJJPsPgFds3XaK3M7z/BvudPRUcwGtnL+oGDlDvXOtEkoMuNAqHl3OMAzl4fuFe
         TFqtqcUHNJqrvW0ZA42/LTF/SV0ohoD7HOMyLWBwm6XocA19Vm6l25myvfDRxNZoKoNa
         9WDR/piOmCw7M1LLk08FMGO3Uo+ZvUZJutsmGw434YVhQcm2FglR3oNHQ9TEKJvahZZf
         dP44i+6tzmLQ/BCxGD+TBocovqirmlrTmW0+C/7EOacWibFe/K/jOelXVFa3ruLNhKCL
         tbgfDobKu9xi/qtChY3A2RiBWKdNl52/0ldEvKFk8oBsCtUK/4U1hhcWZ036wI//F0UH
         8FEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhLdyy64MSy62j2GfoCPYL31V7FQmGy5yzQrHHdIKxE=;
        b=QMK+uStaaVCFKdRGr36Ye7qwFORgkBWoW7m397ZWrn2cJSGBwZFSjFM5rs/qIqZfv1
         oKqMSwqMbDEWzzzLgP3+/GM9wnS5Dulb+UAWnZzfc8O5OuFUCxWcSiwSTAgIkZTU72Zk
         e2SduRyskgeD4Z9dBtIwyD/h84CTRf1QtmkLc4R6xM/XbCQP3KwM5vpB6UuGxss9rTBb
         BO5JLDjzUU6Gyws5uHKY2yoawGpflGUWRF8SgNRfKfFgy0mQ7zRnMuIjsDlWUoTit9MA
         KoF2JftNxsQUWLkLQtZjpeFMkF44+WVCVFLt+wdU3p9/dCC3pK9d3Ys+/NgnzhP0zFG6
         FuAQ==
X-Gm-Message-State: ANoB5plX+AJe211SqcNfOelClTgoZlz8pYUHQrAFz/9JM3ZbTYqSRSYo
        RKtsmzEO5sJ9OajoQwfvhTHbWg==
X-Google-Smtp-Source: AA0mqf784LtVQVhnatJbwdOS+3gZ3Qlr9+4yvGwMeDmOskexJXEozG/+Iq3YbBEwyWqDF7HqnySd+w==
X-Received: by 2002:a17:906:2cd3:b0:7bf:b675:ffdd with SMTP id r19-20020a1709062cd300b007bfb675ffddmr33116400ejr.610.1670331403050;
        Tue, 06 Dec 2022 04:56:43 -0800 (PST)
Received: from hackbox.lan ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id v15-20020aa7cd4f000000b0046150ee13besm932991edw.65.2022.12.06.04.56.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 04:56:42 -0800 (PST)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 2/5] dt-bindings: clock: Add RPMHCC for SM8550
Date:   Tue,  6 Dec 2022 14:56:32 +0200
Message-Id: <20221206125635.952114-3-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206125635.952114-1-abel.vesa@linaro.org>
References: <20221206125635.952114-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add bindings and update documentation for clock rpmh driver on SM8550.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index fccb91e78e49..b405da7700be 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -31,6 +31,7 @@ properties:
       - qcom,sm8250-rpmh-clk
       - qcom,sm8350-rpmh-clk
       - qcom,sm8450-rpmh-clk
+      - qcom,sm8550-rpmh-clk
 
   clocks:
     maxItems: 1
-- 
2.34.1

