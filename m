Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B59EC433F4
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 355B461A28
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbhCYLMi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:12:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230120AbhCYLL6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:58 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47A92C061760
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:58 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id y1so2546542ljm.10
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oEsz4OBuRIZ0O0Ytb61Eklfea0zi+sro1RS7feofbWM=;
        b=YcNeOZmhAmC324/TYGR6lxX9KqL0sWSyciqVxmt1VvljsX8T26TU7G2f6+ZHcqGkhn
         Ld23/EjAtmMsnVcNdsq2XKTSVhKANINdW58K/qP7pwCRwGJIwg1Ful32JffmIAsTKYf9
         U4JgYj6dDq1EG8tlh8aBEJj2vKZkMj4PGg7Pjc8Dm9B9Li3L+H0/CdSBdYvrISrJ4nZU
         zeZVAxd9gTqmzzXBFTB5obgIUf9Nt2/c9RT0jEgEyHSUGRr1rg/ikOqbWKIOJrMAoTg9
         ivt+IaEcM1iUiZBmkqGGlIip+pwpnPMuGjhCMLHi4exW3CIaJoiv3oOuTKwxdF0e5AsL
         xqAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oEsz4OBuRIZ0O0Ytb61Eklfea0zi+sro1RS7feofbWM=;
        b=dzQel1v2SYtKkoN7pBMp0HWOWZEeOs7JbGcILuZoRVU9dSh0fyoPVBD9t03PY954lw
         d1Ags7KL5I/hYgMpSvhKXgCSdAyGW75kFSwoMRFHMg7q47k4Zup4ylww71J/udVH/Vtc
         k86oNSmmVcr9Pac6c8+pyqYzmFDHRcaI2Dwo92z3hR5mpTd10tgADAPFdNbYckK2JUDq
         FWY8xyAw53UZzEes853Je+9UKVk42ObsDjOX7rPWFYxwBZhoNQDPSFNvto0NJBFAj6lA
         W8XF5rQRBZBMzFncxy2Y1wD9vlLa9ceJoCUnG8S/yrt5Vwe0bfHiXU1quLEYWYjB1CxC
         9PaA==
X-Gm-Message-State: AOAM531IkwPtOkoe4atcXljPO3oR8Qr7KLc9PgiNJ+mRWfKA5Whn05fD
        NnM1+z8ggtD8B0BqGDWu5gW+IQ==
X-Google-Smtp-Source: ABdhPJwoEnwEoQCyY1TDsM6UsR6a1mLp/+FIG735Rg7Zbj4XeP9+tcnShIsMFSH036KQOXX9K4YXCg==
X-Received: by 2002:a2e:8592:: with SMTP id b18mr5282807lji.155.1616670716845;
        Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v1 13/15] clk: qcom: videocc-sdm845: remove unsupported clock sources
Date:   Thu, 25 Mar 2021 14:11:42 +0300
Message-Id: <20210325111144.2852594-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

video_pll0_out_even/_odd are not supported neither in the upstream nor
in the downstream kernels, so drop those clock sources.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/videocc-sdm845.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/clk/qcom/videocc-sdm845.c b/drivers/clk/qcom/videocc-sdm845.c
index 5d6a7724a194..7153f044504f 100644
--- a/drivers/clk/qcom/videocc-sdm845.c
+++ b/drivers/clk/qcom/videocc-sdm845.c
@@ -21,24 +21,18 @@
 enum {
 	P_BI_TCXO,
 	P_CORE_BI_PLL_TEST_SE,
-	P_VIDEO_PLL0_OUT_EVEN,
 	P_VIDEO_PLL0_OUT_MAIN,
-	P_VIDEO_PLL0_OUT_ODD,
 };
 
 static const struct parent_map video_cc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
 	{ P_VIDEO_PLL0_OUT_MAIN, 1 },
-	{ P_VIDEO_PLL0_OUT_EVEN, 2 },
-	{ P_VIDEO_PLL0_OUT_ODD, 3 },
 	{ P_CORE_BI_PLL_TEST_SE, 4 },
 };
 
 static const char * const video_cc_parent_names_0[] = {
 	"bi_tcxo",
 	"video_pll0",
-	"video_pll0_out_even",
-	"video_pll0_out_odd",
 	"core_bi_pll_test_se",
 };
 
@@ -79,7 +73,7 @@ static struct clk_rcg2 video_cc_venus_clk_src = {
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "video_cc_venus_clk_src",
 		.parent_names = video_cc_parent_names_0,
-		.num_parents = 5,
+		.num_parents = 3,
 		.flags = CLK_SET_RATE_PARENT,
 		.ops = &clk_rcg2_shared_ops,
 	},
-- 
2.30.2

