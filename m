Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D21AAC433F1
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4A6B61A28
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 11:13:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229626AbhCYLMf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 07:12:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230100AbhCYLL5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 25 Mar 2021 07:11:57 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8E52C061760
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u4so2578338ljo.6
        for <linux-clk@vger.kernel.org>; Thu, 25 Mar 2021 04:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WRdbjkyuvxdjQ/ZLpYlbOrxHP3k+OVVlBOCYuojvEgw=;
        b=DU8Dbv/1l/ZYTrO8WKwANiosj4AhHkr5ZiS9d49RG8g+uY5MR7aild8kH46zVqsTKu
         xDQ+tWPjFs9B6mNm3lVEByxa74L7FWLkcFzpeejZ4gNx4EwyPCDgoibLcV0Qjui5RN3X
         5UBOHVIQeSaT0AJM6MYXF3I7HGYQMc0Lz5ahLZXhbBPGhaoJTXWtp673zRpls4/Yu9Cz
         F/aR6nNPqVnvE4+HbQET2MnQkdSQ2AII1ZeNw1KtJUf9vzql+h+kZeSn78sxPF8u0+5d
         tfP7Zid9ei/wJiZjVYbBpBicJ810KIOQTT8xlnz3Y0I/J7NPF2Nrt90bE6LrkE1JSHrz
         VzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WRdbjkyuvxdjQ/ZLpYlbOrxHP3k+OVVlBOCYuojvEgw=;
        b=r3U0cvZX9QCf/vEwykvmui6xqOKGWLl1q9eFEzHej/XF63ZZmzJ4VcImmdGCvg5Dow
         YZV4LQjX6V+4yBFACxbOirI+EvjO8EEB/gxVJrPXnriCRdX2r2c0fCauBOOIpCw0pnLf
         U3/Soq7vie/9quSyJKo1nkMOsSyYAdT5sO/gXmkNggChSTLZ3QNH2qeRjTSDLVcaAj3M
         GBsOzr4BASFFau9yBr1BmPTSwL5YiZdrX8IGOyYF4Uwub3iYJN6TZkwOm7QK9MNzHRkK
         9dP1ZGyRE8tuLSVbTXhnuxbyGp8AmJ5a6YyTR27TDcn1wFmg3No+z45qmEigz8cdHQs6
         6p/Q==
X-Gm-Message-State: AOAM533meT+XOXFR0UjbHyzwKDNEqQ5X2GyvYAwkYU+rqApXEPJGTvqw
        pvB3pH1M+QzjnkM56O//PtyJdw==
X-Google-Smtp-Source: ABdhPJwxhtQtdENBk6/Dgyn2ME9STSxc+oX16qDyVYa6DGrwtM+BNm2hBuQO4hhXE1BjyFM3XEV8FA==
X-Received: by 2002:a2e:87d5:: with SMTP id v21mr5146623ljj.195.1616670715340;
        Thu, 25 Mar 2021 04:11:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id t22sm715191ljj.94.2021.03.25.04.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Mar 2021 04:11:54 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v1 11/15] clk: qcom: gpucc-sdm845: get rid of the test clock
Date:   Thu, 25 Mar 2021 14:11:40 +0300
Message-Id: <20210325111144.2852594-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
References: <20210325111144.2852594-1-dmitry.baryshkov@linaro.org>
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
index 2d637b113ac8..6f53c6b4c6ed 100644
--- a/drivers/clk/qcom/gpucc-sdm845.c
+++ b/drivers/clk/qcom/gpucc-sdm845.c
@@ -27,7 +27,6 @@
 
 enum {
 	P_BI_TCXO,
-	P_CORE_BI_PLL_TEST_SE,
 	P_GPLL0_OUT_MAIN,
 	P_GPLL0_OUT_MAIN_DIV,
 	P_GPU_CC_PLL1_OUT_EVEN,
@@ -60,7 +59,6 @@ static const struct parent_map gpu_cc_parent_map_0[] = {
 	{ P_GPU_CC_PLL1_OUT_MAIN, 3 },
 	{ P_GPLL0_OUT_MAIN, 5 },
 	{ P_GPLL0_OUT_MAIN_DIV, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const struct clk_parent_data gpu_cc_parent_data_0[] = {
@@ -68,7 +66,6 @@ static const struct clk_parent_data gpu_cc_parent_data_0[] = {
 	{ .hw = &gpu_cc_pll1.clkr.hw },
 	{ .fw_name = "gcc_gpu_gpll0_clk_src", .name = "gcc_gpu_gpll0_clk_src" },
 	{ .fw_name = "gcc_gpu_gpll0_div_clk_src", .name = "gcc_gpu_gpll0_div_clk_src" },
-	{ .fw_name = "core_bi_pll_test_se", .name = "core_bi_pll_test_se" },
 };
 
 static const struct freq_tbl ftbl_gpu_cc_gmu_clk_src[] = {
@@ -87,7 +84,7 @@ static struct clk_rcg2 gpu_cc_gmu_clk_src = {
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

