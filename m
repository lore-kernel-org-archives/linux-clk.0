Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62C9FC64E7D
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 07:28:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21FEF246EB
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 07:28:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bCJ2/X4L"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726474AbgKSH1p (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 02:27:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbgKSH1p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 02:27:45 -0500
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FFA1C0613D4
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 23:27:45 -0800 (PST)
Received: by mail-pg1-x52e.google.com with SMTP id 62so3420942pgg.12
        for <linux-clk@vger.kernel.org>; Wed, 18 Nov 2020 23:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=m3XotQOk87a4kAvLRDiyEWEDwxHpOHBfSxHxZXtLnV0=;
        b=bCJ2/X4L5ZkDVWqS1qzwO97RTakQ4n78LJvu9Sogy2cz8zVooCQvUXdq5mQEXHYSMT
         RG2/zIfA3IsNuL4u+hVj9RIk6zn2wq/EYsBlS2AADML2y2nMnSNtFua1JN5AcvY2U8ZL
         jvgd1+vpwWrQvghCXws8vqmNULcYtauMulvUkyxe5LtrcpSr24M3Fstufn12BENCgdyg
         GEeJePAsP4q5OBLtMjWwgaNXmxxCUuIRXCZUSU5545d3AaEfbSHg1SUpwL6BAZ5c21la
         4Soupv0esGjEYgTEEV1RpfyLcjkFrrmFUAfE3hZbj8kIkc/Df6KXgpvKNcon/PlB0kFK
         lD5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=m3XotQOk87a4kAvLRDiyEWEDwxHpOHBfSxHxZXtLnV0=;
        b=Ewysk3XekDX5cB/VAUyGfNANwr0dn6zHMXWNOncWXTAfrGE7YCkVYZ1APL2ZUwe9p8
         YfOkukou43AAlnZHEHoiMviVlT8yk0Bsh3LuWD7jSHLYyRbfm2N+VvvU6VraFwj77tEc
         if+hY72j0D3shSxyS1VwnS6JOQtxN/zZpr0RfI5kIdCKAiO/tcQ20vdZ0ZyhR2suJK1E
         87bR2/eTOhErA9hRfNJKISjdXUNguKpM+7Gsgwh9DExpYWpsR//dJcs05trTHSDP4/MQ
         hj7AycBIEaTeEcRVpQecR1pObeWfuORUPcazHQ2SH7U9Uif6O0bYwy1DOrAT1X9YpEzk
         LimQ==
X-Gm-Message-State: AOAM530RTrQb46xwRA+YiTK5gCI2+V4cZNyhQJCaZF0zPrHvY+404ump
        GN8ICfbNkNivfeS6UrhMUILj
X-Google-Smtp-Source: ABdhPJz2TtkiCTHozbfVFbuW6f4ME7P6hu/HfrOZ5VB8NZmgem3fue/CsMkn+/6yivYpNtG1P/M0Gw==
X-Received: by 2002:a63:3c10:: with SMTP id j16mr11689718pga.140.1605770864612;
        Wed, 18 Nov 2020 23:27:44 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id a8sm26802923pfa.132.2020.11.18.23.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:27:44 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, vkoul@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 3/4] dt-bindings: clock: Introduce RPMHCC bindings for SDX55
Date:   Thu, 19 Nov 2020 12:57:13 +0530
Message-Id: <20201119072714.14460-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
References: <20201119072714.14460-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Vinod Koul <vkoul@kernel.org>

Add compatible for SDX55 RPMHCC and DT include.

Signed-off-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml | 1 +
 include/dt-bindings/clock/qcom,rpmh.h                    | 1 +
 2 files changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
index a46a3a799a70..a54930f111ba 100644
--- a/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,rpmhcc.yaml
@@ -19,6 +19,7 @@ properties:
     enum:
       - qcom,sc7180-rpmh-clk
       - qcom,sdm845-rpmh-clk
+      - qcom,sdx55-rpmh-clk
       - qcom,sm8150-rpmh-clk
       - qcom,sm8250-rpmh-clk
 
diff --git a/include/dt-bindings/clock/qcom,rpmh.h b/include/dt-bindings/clock/qcom,rpmh.h
index 2e6c54e65455..cd806eccb7dd 100644
--- a/include/dt-bindings/clock/qcom,rpmh.h
+++ b/include/dt-bindings/clock/qcom,rpmh.h
@@ -21,5 +21,6 @@
 #define RPMH_IPA_CLK				12
 #define RPMH_LN_BB_CLK1				13
 #define RPMH_LN_BB_CLK1_A			14
+#define RPMH_QPIC_CLK				15
 
 #endif
-- 
2.17.1

