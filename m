Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11272C433ED
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E313461181
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 20:58:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235567AbhDBU60 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Apr 2021 16:58:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235279AbhDBU6U (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Apr 2021 16:58:20 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA307C0617A7
        for <linux-clk@vger.kernel.org>; Fri,  2 Apr 2021 13:58:18 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id u20so6666450lja.13
        for <linux-clk@vger.kernel.org>; Fri, 02 Apr 2021 13:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h9JY7IrTHCDLMbAo3dIfcTpZXH88SFqfgnI8RYiC/oc=;
        b=usmHbpGLs8w2Ajl975+5yfUrX765ZpmJA35RjhBNFNEXDBpx0GwCfipO4lhuxjtLxU
         49cNbvOMT7IW+OBIMlg3H2cMSGwiKqqbS4kYQutigF3SZnXndwzWy6J7qRxU+RWulwmG
         /i6gsf/oXkzZsMkVldk7B1aqleoXixQzI1xfrBzmLRQil3gkh+PXbLZwc0ED5Ygk9tfb
         Y9/QlHf0yQq3/io0jl0zzoyRYIq1zGZC3E1jJSVJD1T88b139S06U05aFcvqQp0oX3WE
         Yi9OFGfXNko7WQ8Z+7dWKFgjmiw8CyjfCvFMxrSmRmK5cZS+jjhcZEM7XhqpeUEp0gzA
         CYEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h9JY7IrTHCDLMbAo3dIfcTpZXH88SFqfgnI8RYiC/oc=;
        b=m6XB4vmdva2FFLHjrZvKblhjMyncf3jHCCn+YZ+flcGhWdlN/64ljL9oIa1QpYDnTv
         obwUaHt88sCVX8R39yAf5LfQFYTgdVPLGfi9eMmjdq8BgNf2s5+/7tKTTVHxyHlKfThU
         ipa07mEUlm4pBQThySupdWwgKIIYXlPOH0906KJYt07roxqG+bLE5WnKXJiJTUo6Q7mr
         T42wDZkPRD8uQz6BO4P/Vs7Uo5E7g0ybfqSpS0iq3haBqaLm31Cjyoyh37/VHbrVmPhY
         YDm9BCngG30wJfhm9A2scQYkYjzZeB8X0sDcoUvt+tSCY8uHhdCFGXus794FJjaSaej9
         gWQg==
X-Gm-Message-State: AOAM530eR3OstWdHK9NGcscpmK/T2vZOFHkWmb1aeCC9raHwGpiqzitb
        pKeY7sY+E4zenS8oGenrR7uvMg==
X-Google-Smtp-Source: ABdhPJwYStG/VEymZrM4GZgAbWSvR8QKlanYDnRBEqyT8Bc4NAnfkVspVa0lOQF/eofHBZSFJGYrSA==
X-Received: by 2002:a2e:9758:: with SMTP id f24mr9037292ljj.404.1617397097351;
        Fri, 02 Apr 2021 13:58:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id b17sm959076lfi.57.2021.04.02.13.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Apr 2021 13:58:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v3 14/16] clk: qcom: gpucc-sdm845: get rid of the test clock
Date:   Fri,  2 Apr 2021 23:58:02 +0300
Message-Id: <20210402205804.96507-15-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
References: <20210402205804.96507-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The test clock isn't in the bindings and apparently it's not used by
anyone upstream.  Remove it.

Suggested-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gpucc-sdm845.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/gpucc-sdm845.c b/drivers/clk/qcom/gpucc-sdm845.c
index 44039fd2abf2..621ad03fe154 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -27,7 +27,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL1_OUT_MAIN,
@@ -58,7 +57,6 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
 	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
 	{ P_GPLL0_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_MAIN_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_0[] = {
@@ -66,7 +64,6 @@ static const struct clk_parent_data gpu_cc_parent_data_0[] = {
 	{ .hw = &gpu_cc_pll1.clkr.hw },
 	{ .fw_name = "gcc_gpu_gpll0_clk_src", .name = "gcc_gpu_gpll0_clk_src" },
 	{ .fw_name = "gcc_gpu_gpll0_div_clk_src", .name = "gcc_gpu_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
@@ -85,7 +82,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpu_cc_gmu_clk_src",
 		.parent_data = gpu_cc_parent_data_0,
-		.num_parents = 5,
+		.num_parents = 4,
 		.ops = &clk_rcg2_shared_ops,
 	},
 };
-- 
2.30.2

