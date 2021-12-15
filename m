Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB16DC43217
	for <linux-clk@archiver.kernel.org>; Wed, 15 Dec 2021 00:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238688AbhLOAzA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 19:55:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238687AbhLOAy6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 14 Dec 2021 19:54:58 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51931C06173E
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 16:54:58 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id 207so30841014ljf.10
        for <linux-clk@vger.kernel.org>; Tue, 14 Dec 2021 16:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k0ce96TstsYTrbqj0IC60xk9afyHKUuCVQ7+9L71RNk=;
        b=ZXsf3cufSuOiAaD7yd8wOf+OwL55oAMdTXR6e8kx440S4uMYF4YavvgotWU87tLtet
         1O4WtrMADEMSXBuLdJdASGHArDFWHitZzvPEVlOq/KPLi6Z6TQvP8LVc/CRTNkPYtdzC
         CusD8O+2HkSB0o0KBe/56Vj3UBTjqT201ViszZP7aJJlHcfQHTdDfaWCd8xQEyPN6oTF
         HzTPA6u3uXYsIkyRdHR8GYfDyIlotPQ0y46Sl/0lH9wGtwD9XqrIeQlNWQDgDA4UfRud
         y9zlAdhTeBvhl62FO7Q+0Z40K8LyW/9f0fOA0T3qsd1Lwq1Dj0VtY2Br1C8P7iL+9tEY
         m2Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k0ce96TstsYTrbqj0IC60xk9afyHKUuCVQ7+9L71RNk=;
        b=osfAViiHNUEcVbA9Gy2rjKKbjV0H+EQALnoljEjZjrQOXibc0RI5cM8yvjpr7cdi/n
         7qgtG81m/nNyGtKFhrXhj4hooxOjtbJ4K25ac0TOugQ/AmVHRkJr149ZorPe3tga4iAl
         5jYcKMZbk0BOCuwhPSLujLj6u+jq/z4xPsaeaK85wg/Mp3g17gqAcEgRsKAH8KZKjSkY
         HAVsFexN9NrpkXBAT9KUF1A3mD8oJ/LLDpRKdRgxqq3W7PwyT0Dmv3e+4hDqpgpOz/WF
         OBoA5uVVBhEASCJMJe9T0fMKfHFEFjy7UWqtbEqYTT9Xc0gXhQ7VkQRzfqvPMTRbwBi1
         DSBQ==
X-Gm-Message-State: AOAM531eS1AoWc8xx0w2r+5BIPZu8Jn6xb+eTdYzbmksGmPYcW3kcwSg
        l4s91ZLws5eVGtIh0JjTAiSGfg==
X-Google-Smtp-Source: ABdhPJyh1ku3OlGmEGFW/enyG3onTT+fFDBKY/9W/Xzh8Vj8Hh5ZG8CYd0IG+livKdZ8OV9AI+nmRQ==
X-Received: by 2002:a2e:874b:: with SMTP id q11mr7862082ljj.194.1639529696618;
        Tue, 14 Dec 2021 16:54:56 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id b12sm53022lfb.146.2021.12.14.16.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Dec 2021 16:54:56 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 08/15] clk: qcom: camcc-sdm845: move clock parent tables down
Date:   Wed, 15 Dec 2021 03:54:16 +0300
Message-Id: <20211215005423.2114261-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
References: <20211215005423.2114261-1-dmitry.baryshkov@linaro.org>
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
index 545c288a7f98..f5b43dce3295 100644
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
+static const struct clk_parent_data cam_cc_parent_data_0[] = {
+	{ .fw_name = "bi_tcxo", .name = "bi_tcxo" },
+	{ .hw = &cam_cc_pll2_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll1_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll3_out_even.clkr.hw },
+	{ .hw = &cam_cc_pll0_out_even.clkr.hw },
+};
+
 static const struct freq_tbl ftbl_cam_cc_bps_clk_src[] = {
 	F(19200000, P_BI_TCXO, 1, 0, 0),
 	F(100000000, P_CAM_CC_PLL0_OUT_EVEN, 6, 0, 0),
-- 
2.33.0

