Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6747DC63797
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 19:15:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238964AbjAKTPH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 14:15:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234282AbjAKTO6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 14:14:58 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 157193D9E2
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:14:57 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id f21so12624989ljc.7
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 11:14:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tvetCGKgjl4TOcgsE3HW1CpjBzYScqI9QN0WXqkeGn4=;
        b=UqhKEmCNju2kbHfZHKTxtm3c5czCKHVZOHbWKFfA+y3BQABbnOEAaQAEtZu8Hw6ODL
         g9Ela4PeWz2KlODeCwSpZJBLxWlZIPCzzQEbanxbIN4Z4IG4eQmhLIxp+g7YecT2ic6H
         +7RNb+lfTiQKcHE7PWJTmBaDXxPcrBDkfy0l58IsOlKnH76wTZFBDZuC6DlozB0dIr94
         T1IuhM40k4s0FtYwrzxXSwJtz2y/SenTuLSY+yT6vBmELKmgZQ8qKYJxQriZbm9h4+x2
         uEEqrNDKI2ujs8QPx4GkmXo8zb5Dinv8G9XgN/xBYxDLuovutltK4GiGZIz7dZYL693w
         g5/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tvetCGKgjl4TOcgsE3HW1CpjBzYScqI9QN0WXqkeGn4=;
        b=dWrCi5ttaXlbiYz8Euhx4HAOY8Hq9EPAiAo0HnQyozuP502JwIb3GuUThBrbXnKMtZ
         aL4IhMsJ5tQU6VBVd9PXMauvRCVyMaVNh/6oGfxKlcpPt4hQmlv7/tX8TXkT6YWgtzmG
         x9kxTZCVpdnwjjw2ntjPqcHFTvjgCpkJ+4KN5xv2bVUuynx5bMGpvCQvUbO5azQLB/am
         fBwMC8nW0rxbYFxnWXgLYV4m7a9J2sWbv3C6s8N+XCej04y+USP36OQP54mbn1cy2aDP
         pTAyGaayMfJAW4p0V6JsBdGmQXKZPpyDQqKFp6lODJ6PQgMYCOGc5nRr+ocVCAbaPLTv
         N5Nw==
X-Gm-Message-State: AFqh2kpkhyPHqKQt+AXWA5ppW0V/XELqu9df5p56AEcGMSNLlINedFtV
        7beyARWODtbNQpkyp9HstejP6g==
X-Google-Smtp-Source: AMrXdXtRgrWhdT6cEv/zJaSMKYCkCBZoQwGdm6GxhA/zjl8LuIh8iSWnzd6HzUuMcQR0F2lo0Jyjig==
X-Received: by 2002:a2e:8e67:0:b0:281:17f6:eeb9 with SMTP id t7-20020a2e8e67000000b0028117f6eeb9mr5621561ljk.8.1673464495502;
        Wed, 11 Jan 2023 11:14:55 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id r7-20020a2e8e27000000b00289873cce0bsm76343ljk.14.2023.01.11.11.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jan 2023 11:14:55 -0800 (PST)
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
Subject: [PATCH 1/4] dt-bindings: mailbox: qcom: correct the list of platforms using clocks
Date:   Wed, 11 Jan 2023 22:14:50 +0300
Message-Id: <20230111191453.2509468-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230111191453.2509468-1-dmitry.baryshkov@linaro.org>
References: <20230111191453.2509468-1-dmitry.baryshkov@linaro.org>
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
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml          | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index 943f9472ae10..b8a44ef0540f 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -71,15 +71,8 @@ allOf:
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
-- 
2.30.2

