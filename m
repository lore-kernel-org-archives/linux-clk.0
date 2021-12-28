Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7D8C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 28 Dec 2021 04:54:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234787AbhL1Ey2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Dec 2021 23:54:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234792AbhL1Ey1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Dec 2021 23:54:27 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E67C5C061757
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:26 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id h21so16887329ljh.3
        for <linux-clk@vger.kernel.org>; Mon, 27 Dec 2021 20:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n6QTk4EYSkPPr0WQID0w8l1zkHAqcIkrp9aELlsqEJ8=;
        b=yTlEW/+fgUkDNGpUPhAN1O9jI4p8bJAox3FOu7gJEHk8JWsGbEy+hmGuPrA+TsJMJa
         WNkyYVQDbNbY0qOlSopuUb+1P+DHEttb3QrmgJ32RilZnTGsQ2tQffKcSNmKvcEqL29A
         aSf6PMOUpbLOfWhmQTb8Jp49Mnwvy/83RbjyT7aLD6vLe0GLPVz29zTB1JUPtMnq4vXp
         9RuD9v03ja53bA1f71t2RO/9cmAk2K7zhbzB4lKmZCroR0qI4rcNWUUT+T7VqDZVbl2W
         beHT6nWwOjFWBCwJwMMCdIIpnkOSmOjNk2V+M78Gbmz0Ewm/uB2hmnp6yf3oiZSX3M9I
         /7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n6QTk4EYSkPPr0WQID0w8l1zkHAqcIkrp9aELlsqEJ8=;
        b=tNNE6cb/3fz8szGY+V2iKFKQNvZGts7FBuUA/AHhod+Or85Kn5xpNoVbE8wR0lKps6
         GLUw1m2E8+1xXfIrOe7BvGlM8+ibxJ7ANKN8j25UHkEptbYNDlXB88e1GH+gpnx8+aMt
         p4XV8PBwNdJEdsSoqWe9/lLSmqwmcyITjYDQKLZUxeNReBoy+3lkOFcDsJ4iiVEgglo/
         yNArPciYIflJRGgD0m9SGrHUwRV0nyEisazK3WUPGvVixw+cre9Vr0MoW19gOWeayc6H
         vzTJgt8AXRDoWc9nSzEMXwjDPvC5a/BXNsdJ/R88S5yAp+g3cF+uJL3r7JJSLm3HKblC
         OzeQ==
X-Gm-Message-State: AOAM533GEIvydBARzFrI60mF1WnAezejqyo1aOLmVfFaMqR0acVuSfN7
        DOLuoysi/f7Yjbr4l3sgRMpT7w==
X-Google-Smtp-Source: ABdhPJwiE/2SKv+Vqs1/kG6A6meewfk+h6f152TOXBWA8DGjiGPQrA3rfj3mhwDhQQqO7mIsGFhdbw==
X-Received: by 2002:a2e:9183:: with SMTP id f3mr16150286ljg.277.1640667265212;
        Mon, 27 Dec 2021 20:54:25 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id cf3sm1822685lfb.22.2021.12.27.20.54.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Dec 2021 20:54:24 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v4 09/16] clk: qcom: camcc-sdm845: move clock parent tables down
Date:   Tue, 28 Dec 2021 07:54:08 +0300
Message-Id: <20211228045415.20543-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
References: <20211228045415.20543-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move clock parent tables down, after the PLL declrataions, so that we
can use pll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/camcc-sdm845.c | 32 ++++++++++++++++----------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/clk/qcom/camcc-sdm845.c b/drivers/clk/qcom/camcc-sdm845.c
index 6210b0fb7eac..fd01ea53a07f 100644
--- a/drivers/clk/qcom/camcc-sdm845.c
+++ b/drivers/clk/qcom/camcc-sdm845.c
@@ -25,22 +25,6 @@ enum {
 	P_CAM_CC_PLL3_OUT_EVEN,
 };
 
-static const struct parent_map cam_cc_parent_map_0[] = {
-	{ P_BI_TCXO, 0 },
-	{ P_CAM_CC_PLL2_OUT_EVEN, 1 },
-	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
-	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
-	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
-};
-
-static const char * const cam_cc_parent_names_0[] = {
-	"bi_tcxo",
-	"cam_cc_pll2_out_even",
-	"cam_cc_pll1_out_even",
-	"cam_cc_pll3_out_even",
-	"cam_cc_pll0_out_even",
-};
-
 static struct clk_alpha_pll cam_cc_pll0 = {
 	.offset = 0x0,
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
@@ -159,6 +143,22 @@ static struct clk_alpha_pll_postdiv cam_cc_pll3_out_even = {
 	},
 };
 
+static const struct parent_map cam_cc_parent_map_0[] = {
+	{ P_BI_TCXO, 0 },
+	{ P_CAM_CC_PLL2_OUT_EVEN, 1 },
+	{ P_CAM_CC_PLL1_OUT_EVEN, 2 },
+	{ P_CAM_CC_PLL3_OUT_EVEN, 5 },
+	{ P_CAM_CC_PLL0_OUT_EVEN, 6 },
+};
+
+static const char * const cam_cc_parent_names_0[] = {
+	"bi_tcxo",
+	"cam_cc_pll2_out_even",
+	"cam_cc_pll1_out_even",
+	"cam_cc_pll3_out_even",
+	"cam_cc_pll0_out_even",
+};
+
 static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
-- 
2.34.1

