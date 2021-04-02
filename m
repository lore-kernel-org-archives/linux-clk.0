Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13287C433B4
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2ED6610FC
	for <linux-clk@archiver.kernel.org>; Fri,  2 Apr 2021 02:21:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234335AbhDBCVd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Apr 2021 22:21:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234311AbhDBCVd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Apr 2021 22:21:33 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38C91C06178A
        for <linux-clk@vger.kernel.org>; Thu,  1 Apr 2021 19:21:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id w28so5648467lfn.2
        for <linux-clk@vger.kernel.org>; Thu, 01 Apr 2021 19:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/26/DeuK2iBKRkm1YoFMZThfwYKKG7fSeEl+F4AH58o=;
        b=kXj4O+l95TTVeBSQlmyDtWTnATZMd4f/CsbH6r/KssppSRNn/QNvPCEWWsYnyUrRN+
         G10rxgg+OtBhTvbJ8LbKYw7rZnBcmNZr5lWSiYQrrJ6eFWcC8v6H6HrPCKf1MPrDCBEb
         erODF3Tz/38fZSIKxRla7JDE9KLDCmAva5v7jDilr2ygO76gPNuGnhOnJN7zpSFgkNd+
         lzsKrtm/d22cN2yTpzJGtqnoOEZ1Ylv8N75pFHrZMcfnufQVK6xpxKfEgjgog7m1+7VF
         sDQmQjQDJhQTksl5XucBEemZBEAiG2Gp4VnmlhSO8rGS0c4V5aQ9H3+dpZKtcaI+A+aK
         P36w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/26/DeuK2iBKRkm1YoFMZThfwYKKG7fSeEl+F4AH58o=;
        b=DnBrdLGEi3PpTarThYviSkYs1DiLDFtpdPWXtoG63XVco3/rG6lglcO/mTr7EdleuL
         knvKXrb9+WSDvco339kFFKkFKk56jtcry0FuAUWTtTkeDZ1rSUAbuqawqdr44pkFknGj
         C+shVHiaivE1myqkSQVxUuEVltWnknSzXirngSwi+867BMrAbGgg3w4VKQmEkMTq2owY
         IW0QfJwtVV9eBzdjuGFnEPlzkn5/qVFhfcp97gos+icfegGMe/m/RfoKjPzbhPvcz37+
         lWbdlcGZG8uriJ3tkhxpFR2UvEbt/fAGWPoFyTUlOkYJyGcSTbVFSDBbbRIw4HixLRaU
         kH7A==
X-Gm-Message-State: AOAM531ku3pR/WVXHumUihHzY0/UPBSXq+BxGZIolhblJouT+2WwS+5a
        COHndGX2z4J1G0pa0ckAPfpRSQ==
X-Google-Smtp-Source: ABdhPJxT9O7FT04DUmDxExRbiG6B+J5hKhuCTqVnEBbK9otO7C8x5V0DcpsIyTRXr4ETjSP3O+2tcw==
X-Received: by 2002:a05:6512:ac9:: with SMTP id n9mr7450086lfu.186.1617330082750;
        Thu, 01 Apr 2021 19:21:22 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x74sm713634lff.145.2021.04.01.19.21.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 19:21:22 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v2 16/16] clk: qcom: videocc-sdm845: get rid of the test clock
Date:   Fri,  2 Apr 2021 05:21:08 +0300
Message-Id: <20210402022108.4183114-17-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
References: <20210402022108.4183114-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/videocc-sdm845.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 7f3a93efa928..1997e1460e18 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -20,7 +20,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
 	P_VIDEO_PLL0_OUT_ODD,
@@ -51,7 +50,6 @@ static const struct parent_map video_cc_parent_map_0[] = {
 	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
 	{ P_VIDEO_PLL0_OUT_EVEN, 2 },
 	{ P_VIDEO_PLL0_OUT_ODD, 3 },
-	{ P_CORE_BI_PLL_TEST_SE, 4 },
 };
 
 static const struct clk_parent_data video_cc_parent_data_0[] = {
@@ -59,7 +57,6 @@ static const struct clk_parent_data video_cc_parent_data_0[] = {
 	{ .hw = &video_pll0.clkr.hw },
 	{ .name = "video_pll0_out_even" },
 	{ .name = "video_pll0_out_odd" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_video_cc_venus_clk_src[] = {
@@ -81,7 +78,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_data = video_cc_parent_data_0,
-		.num_parents = 5,
+		.num_parents = 4,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.30.2

