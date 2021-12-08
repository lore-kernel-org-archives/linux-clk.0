Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D53CC433EF
	for <linux-clk@archiver.kernel.org>; Wed,  8 Dec 2021 17:54:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238323AbhLHR6L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Dec 2021 12:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33794 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238299AbhLHR6K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Dec 2021 12:58:10 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06D2CC061746
        for <linux-clk@vger.kernel.org>; Wed,  8 Dec 2021 09:54:38 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bu18so7269172lfb.0
        for <linux-clk@vger.kernel.org>; Wed, 08 Dec 2021 09:54:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZiwaLMnCFLRwsgdDOR+fYtp7VqIVS3d6M0yTLi0vOfA=;
        b=cw41zKPEtnX5X4vHMLjQG+o7mduJTmAcdxBcaTa3aswXm1wb1AqBLl8ST7p5HXDXGn
         hSTcsy59z4GGnr81a6hc7gIhdUkxcV1Vif77QCW9KXXTuuf9/Qa9RDpKbRCxVkUDSgSm
         PTH7Yertf2gT3vl7hKTMAEIunh0HMLZbBVtqfOLiTVyyktoZ9JKOeQGulKIsL15hrrbZ
         U9YDsh+1P3J5DhDUndjAx0N9J/GAD2BfQlcRWvpl6Nde0Ve7lCnJxxfxXDev6emb0KV2
         dHYYLhb/j2F+RW/+HMSfBifDVpGSLhDui1YQNijADJZPz14SzPL7TEMRSTboW30JdRN6
         lkxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZiwaLMnCFLRwsgdDOR+fYtp7VqIVS3d6M0yTLi0vOfA=;
        b=rkgAl+dIwrw4o2W3YyEpT+fOsmyJVg09XY2kHD9HtYmmvCN48cfzN4NghEdkbKnXwh
         7HDQOHS7IP3w434Pna8yvhD/Zs+3yQ9zs2pS44+6qZcje+ZZskBkA0KTukuSCNovhLEu
         HDEBf5pqs4fR3BVDcivQQj1YlFR9Y50zvyw/o6qyTZTiouSMt/3PeFMraMZ3lfrXLdhE
         qoNudLNcnnRvjiqGJhPVI2BfWbMrmd3HVnW242+qc0kRoDRBk0rowQim39iGqDx2OiLG
         uNZyFvi7wBQ8p7UQ8QKpduCERCg6PuZgNNDbZrEqJsFizcBBaDDLH0wiOmCt5J3dPxXH
         lwOA==
X-Gm-Message-State: AOAM532KYBHN9deys1x5zE31BAK+GhgW3bfMUGETO7DLvlwWv8u+4tGB
        BJlrAhciZducVLnPqrmgxxiGAg==
X-Google-Smtp-Source: ABdhPJxzdNIFG4mqmZCXHI531bdGTy49A4/zoEGQFbxPAyOjpbibVphblJxY6mIVo33O6OVy8Da9EA==
X-Received: by 2002:a05:6512:31cd:: with SMTP id j13mr889790lfe.586.1638986076327;
        Wed, 08 Dec 2021 09:54:36 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id f23sm388903ljg.90.2021.12.08.09.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Dec 2021 09:54:35 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 04/11] clk: qcom: camcc-sdm845: get rid of the test clock
Date:   Wed,  8 Dec 2021 20:54:23 +0300
Message-Id: <20211208175430.1333594-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
References: <20211208175430.1333594-1-dmitry.baryshkov@linaro.org>
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
 drivers/clk/qcom/camcc-sdm845.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 1b2cefef7431..545c288a7f98 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -23,7 +23,6 @@ enum {
 	P_CAM_CC_PLL1_OUT_EVEN,
 	P_CAM_CC_PLL2_OUT_EVEN,
 	P_CAM_CC_PLL3_OUT_EVEN,
-	P_CORE_BI_PLL_TEST_SE,
 };
 
 static const struct parent_map cam_cc_parent_map_0[] = {
@@ -32,7 +31,6 @@ static const struct parent_map cam_cc_parent_map_0[] = {
 	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
 	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
 	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-	{ P_CORE_BI_PLL_TEST_SE, 7 },
 };
 
 static const char * const cam_cc_parent_names_0[] = {
@@ -41,7 +39,6 @@ static const char * const cam_cc_parent_names_0[] = {
 	"cam_cc_pll1_out_even",
 	"cam_cc_pll3_out_even",
 	"cam_cc_pll0_out_even",
-	"core_bi_pll_test_se",
 };
 
 static struct clk_alpha_pll cam_cc_pll0 = {
-- 
2.33.0

