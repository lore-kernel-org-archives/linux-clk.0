Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F279DC05027
	for <linux-clk@archiver.kernel.org>; Mon, 23 Jan 2023 20:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231485AbjAWUSZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Jan 2023 15:18:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231848AbjAWUSY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Jan 2023 15:18:24 -0500
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BF4416AE6
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 12:18:22 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id h16so11925738wrz.12
        for <linux-clk@vger.kernel.org>; Mon, 23 Jan 2023 12:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cAE8c6dFz3FEq85yU3g0Xx5Oubt8sx5CHZhlIZdhMpA=;
        b=b4SkVTCR3zcq4w4TMiDfjUHVzmIXti4vErDIN2OtGrU0v4sjm4FMTfyocdliEMmdzZ
         QSpw6fD9bPpdIgt/3CjMwyE71U1hlty58Xojx7TShJ5snbVVqpE6qP+B79G7ZoFbnmJ/
         yrhLOI5nK75w1hOaiKLLE9ulTCN2Pva6g2uHHIVZsI32fpoifY52KQ4q1FlIWl2yRM4i
         mOiHYTtW856u+qRPI7zW92//0x7c2fOBeA6kYGxfE1ZxI8Vqzzk1fzUPDliUFAJ4dY4C
         4fU3yq5CEegb0/s8uuaP62Hmz7c5kDSXcWhK+C6xP1JTkD8jDobrC4MslJ3n5HRzpXQc
         IVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cAE8c6dFz3FEq85yU3g0Xx5Oubt8sx5CHZhlIZdhMpA=;
        b=xYzBmDtLT1kwQYnc+o3LmVGeAJIauBoRN+eaK9WlKwvsuOmOoiusfTC5WCsFLQrIL6
         n6f1ZULwfNtcNNIWhvNmy1ubhug4XYywqCCo/Km8U4XRoSt9V7Wcn1kQhhpzkG2A67r4
         UqWRmRuhv4Dhvx+il9VtFGnUgm4UfgAHs8ygCsUcf/lldwSqlS7yGra/SB/dfLpeGWoZ
         leiw8waBI015iUXlh0IFyWtzh5MY6ecwq7Tt2pL27BxFRcJeJbR0vSnwcDSUlPQjebHy
         wSVCb5wYqOxZ78S7uSqrdrh3pVwmoIBZTrvniVHs5ehoTgmzuz4b0oTQGFx0GagAg+Wc
         HX/g==
X-Gm-Message-State: AFqh2koRqm90hiPYHvyRuFgnM6Xv10jr0j/HCbj4pMd2UbV1rhAgBWsC
        UzEbZqT4wlhOWbW24dmf8KyADBbNXg7bBSN+
X-Google-Smtp-Source: AMrXdXtRQT561eClfu+WVsxcTSlAtfwnyVBDIpONayWNok3WlPg7TXKUcWvPpuKkAikgcfGfmXOsbg==
X-Received: by 2002:adf:fe03:0:b0:2be:516a:e6da with SMTP id n3-20020adffe03000000b002be516ae6damr12024505wrr.14.1674505100504;
        Mon, 23 Jan 2023 12:18:20 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id v1-20020a5d4b01000000b002be53aa2260sm210078wrq.117.2023.01.23.12.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:18:20 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 3/3] clk: qcom: rpmh: fix double RPMH_IPA_CLK assignment
Date:   Mon, 23 Jan 2023 21:18:12 +0100
Message-Id: <20230123201812.1230039-3-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
References: <20230123201812.1230039-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

RPMH_IPA_CLK is assigned twice:

  drivers/clk/qcom/clk-rpmh.c:578:35: error: initialized field overwritten [-Werror=override-init]

Fixes: aa055bf158cd ("clk: qcom: rpmh: define IPA clocks where required")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/clk/qcom/clk-rpmh.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-rpmh.c b/drivers/clk/qcom/clk-rpmh.c
index 393b83f6020e..45ee370f3307 100644
--- a/drivers/clk/qcom/clk-rpmh.c
+++ b/drivers/clk/qcom/clk-rpmh.c
@@ -575,7 +575,6 @@ static struct clk_hw *sc8280xp_rpmh_clocks[] = {
 	[RPMH_IPA_CLK]          = &clk_rpmh_ipa.hw,
 	[RPMH_PKA_CLK]          = &clk_rpmh_pka.hw,
 	[RPMH_HWKM_CLK]         = &clk_rpmh_hwkm.hw,
-	[RPMH_IPA_CLK]		= &clk_rpmh_ipa.hw,
 };
 
 static const struct clk_rpmh_desc clk_rpmh_sc8280xp = {
-- 
2.34.1

