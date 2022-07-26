Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 427E1C00144
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jul 2022 14:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239283AbiGZOYQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jul 2022 10:24:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239295AbiGZOYA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jul 2022 10:24:00 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F1E428E0D
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 07:23:56 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id j29-20020a05600c1c1d00b003a2fdafdefbso8263875wms.2
        for <linux-clk@vger.kernel.org>; Tue, 26 Jul 2022 07:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yFRXqBy/+1W0YIm2IlJSKLfGgpc43BOZxyaw3spU5i0=;
        b=fNixEhOHy/PwouHYz7bnf3Gy9gwTJNAFn86dWjsZCuL2LII/5slQeVIxdtl7Z82vDj
         O4292Fr9itnz8QMA/anj08+j1qf8i7sfh5F5bXA4rGXZ7i1zmFTHh5oltz+DpLdWzMAh
         3+i+muP3r01AAP7d2oUmbOzWAawKecuFTiJzRIPoquYvLZCYtx7UX3IKTlkyC82xX8e5
         efdexqWjNr5bW5QHxvvD6j97FGvFJLFvuw9vQK09UWas6/BUWfLYns7ilkjBfaUlJbK0
         q+SxQ8PjgUMevZ6ZQZXtJ5fZWhqaxnsjzV8RV19ala9165ctSlSzXPKXvoT6L++WJB6K
         aJ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yFRXqBy/+1W0YIm2IlJSKLfGgpc43BOZxyaw3spU5i0=;
        b=iO92Iu2sRFuzmekx8lZs9hHTjez/DOSbPNplhO2KuVp+ioZMBh8dxwPymk7Ui+2zWM
         /vP3Ebp8zId0Ov3/vEsReDSLFwpV5XGGCgzlC45TPdyDZmdxKdn2yjVzieTeVhn0j7kJ
         dmnfeMkYjXNpGn52b04UWglZj5W7h2mtBgOFKLzyL9Yh8wDQkZ6YK1p+rcS68Q/v/jac
         BxiE8/DN//gShj3pScqHAY8zt7yIOveBHdhwdqYkQXhqSpBHAeQuZz8/pY/1uv9o2k8l
         PnOoh++ONkBxK/+pK5Gv4hsA6RXQHetiSNmThXUd9Dv7aQ7q3HBKgocl3y3o1bLSM4Qh
         hMhQ==
X-Gm-Message-State: AJIora9V29eJusDRVUbM737ivMNCxP8/L+WJ8nYOWfPkpSAHnmmH0sMm
        uJJ0P2+HHS/SXfLkalqb4LFG5A==
X-Google-Smtp-Source: AGRyM1vC9zuhwsZVg1OwWSpQXRyY6MxKZLhzCNYgxre4rd3G0BvnxFVFaAjG8I51bohKh4oxUV53qA==
X-Received: by 2002:a05:600c:4fd4:b0:3a3:2c30:5749 with SMTP id o20-20020a05600c4fd400b003a32c305749mr12081040wmq.62.1658845434811;
        Tue, 26 Jul 2022 07:23:54 -0700 (PDT)
Received: from localhost.localdomain ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id t21-20020a1c7715000000b003a331c6bffdsm17017119wmi.47.2022.07.26.07.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Jul 2022 07:23:53 -0700 (PDT)
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>
Subject: [RFC 9/9] clk: qcom: gcc-sdm845: Switch to macros to collapse alpha-pll clocks definitions
Date:   Tue, 26 Jul 2022 17:23:03 +0300
Message-Id: <20220726142303.4126434-10-abel.vesa@linaro.org>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20220726142303.4126434-1-abel.vesa@linaro.org>
References: <20220726142303.4126434-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Switch from the expanded alpha-pll clocks definitions to the more compact
macros.

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/clk/qcom/gcc-sdm845.c | 54 +++--------------------------------
 1 file changed, 4 insertions(+), 50 deletions(-)

diff --git a/drivers/clk/qcom/gcc-sdm845.c b/drivers/clk/qcom/gcc-sdm845.c
index d9751d7e617c..ed85d3ba771a 100644
--- a/drivers/clk/qcom/gcc-sdm845.c
+++ b/drivers/clk/qcom/gcc-sdm845.c
@@ -34,40 +34,6 @@ enum {
 	P_SLEEP_CLK,
 };
 
-static struct clk_alpha_pll gpll0 = {
-	.offset = 0x0,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
-	.clkr = {
-		.enable_reg = 0x52000,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll0",
-			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo", .name = "bi_tcxo",
-			},
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_fixed_fabia_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll4 = {
-	.offset = 0x76000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
-	.clkr = {
-		.enable_reg = 0x52000,
-		.enable_mask = BIT(4),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll4",
-			.parent_data = &(const struct clk_parent_data){
-				.fw_name = "bi_tcxo", .name = "bi_tcxo",
-			},
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_fixed_fabia_ops,
-		},
-	},
-};
-
 static const struct clk_div_table post_div_table_fabia_even[] = {
 	{ 0x0, 1 },
 	{ 0x1, 2 },
@@ -76,22 +42,10 @@ static const struct clk_div_table post_div_table_fabia_even[] = {
 	{ }
 };
 
-static struct clk_alpha_pll_postdiv gpll0_out_even = {
-	.offset = 0x0,
-	.post_div_shift = 8,
-	.post_div_table = post_div_table_fabia_even,
-	.num_post_div = ARRAY_SIZE(post_div_table_fabia_even),
-	.width = 4,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_FABIA],
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll0_out_even",
-		.parent_hws = (const struct clk_hw*[]){
-			&gpll0.clkr.hw,
-		},
-		.num_parents = 1,
-		.ops = &clk_alpha_pll_postdiv_fabia_ops,
-	},
-};
+DEFINE_QCOM_CC_CLK(ALPHA_PLL, gpll0, 0x0, 0x52000, BIT(0), "bi_tcxo");
+DEFINE_QCOM_CC_CLK(ALPHA_PLL, gpll4, 0x76000, 0x52000, BIT(4), "bi_tcxo");
+
+DEFINE_QCOM_CC_CLK(ALPHA_PLL_POSTDIV, gpll0_out_even, 0x0, 8, post_div_table_fabia_even, 4, &gpll0.clkr.hw);
 
 static const struct parent_map gcc_parent_map_0[] = {
 	{ P_BI_TCXO, 0 },
-- 
2.34.3

