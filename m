Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 121E8C4167B
	for <linux-clk@archiver.kernel.org>; Sat, 17 Dec 2022 00:24:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229851AbiLQAYG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Dec 2022 19:24:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbiLQAXM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Dec 2022 19:23:12 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D766DF12
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:39 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id p36so5844101lfa.12
        for <linux-clk@vger.kernel.org>; Fri, 16 Dec 2022 16:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=38sD9lAcXD/ViMpbhtjgnGCJOyq79c/LMQxr36mulJI=;
        b=PkIUygObU/mD+L1UCxvKfgZJrGU17tlNUjzrjMucnROO5Rr1UyQTMR/Atiz4sP2nWe
         T4Zkyg88SAH59+UH2/POtlQIZkp3+/FeOmMVgZbjhZWctZj6tTzJ7byRozyi+mBNUqAM
         0jhp/kS92k7usuwRaJgzCqufjgQssTHctATiRicolG/+3PGGksjmRTLluLB2QW5xbttY
         pLjjtARRd9eo3+OqXAMPw/pLbXsJeDxvAaWv401n6cZYaPw8OFbjM9A5Y0dyYtcSR/Yf
         nFOSjatXhYwlHmKorbkkvR8XuV4nn+TRIU/6SkXlxpBSbeolNwBwFT3mLBtwmuJOjhFD
         0GBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=38sD9lAcXD/ViMpbhtjgnGCJOyq79c/LMQxr36mulJI=;
        b=wk0JyVS39HG/HR1iKHNB/6IBAfEHvzxFQUZAVhhg1dDhslxbMG229zq2pb9wxXBT11
         kMCQMvVXs6hJ67oKXcu6o9MTVRP5vuJrLpUhzr7DLfJMq4DIsnQW3/q+FOJzs0Ne83AR
         yeHp/nA8E8Zb5OVpxBbh5nmNh+FfXoupshmqIGX2gf56xC3YKqUzcRVI3/Anqs0fnVKe
         EUhv77vOaj6HQikT6B8L1jGlPiCcLb3OozTYNkQ52Ym8S1Fv2BKwe9/dQgbQZZXfsz4x
         gQvX3A0rttXFKP5RAP+/RdPyNF2hepjXbg6VnkVkViBlnTlvOKSa0s+lUZQ6esD04wJ/
         ry0A==
X-Gm-Message-State: ANoB5pmM09kvATAy0oYeDWkBLR8dhOCo8F75eGM3n6neaES493rrx9gg
        yflGhMyaCWtKaurmRDiGVy1tag==
X-Google-Smtp-Source: AA0mqf72F0cWwVcTyJ4f32Ywxz8aojYA3VB8jevhU/bje8MspWwB0i0hpBo/98EH3RLl5vCLue1wsA==
X-Received: by 2002:a05:6512:2985:b0:4b7:31c:7779 with SMTP id du5-20020a056512298500b004b7031c7779mr5380119lfb.4.1671236258758;
        Fri, 16 Dec 2022 16:17:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id c19-20020a056512325300b004b5adb59ed5sm341228lfr.297.2022.12.16.16.17.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 16:17:38 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 09/15] clk: qcom: gcc-qcs404: move PLL clocks up
Date:   Sat, 17 Dec 2022 02:17:24 +0200
Message-Id: <20221217001730.540502-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
References: <20221217001730.540502-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Move PLL clock declarations up, before clock parent tables, so that we
can use pll hw clock fields in the next commit.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-qcs404.c | 298 +++++++++++++++++-----------------
 1 file changed, 149 insertions(+), 149 deletions(-)

diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
index fb94c57a00af..5ae7a6b2a326 100644
--- a/drivers/clk/qcom/gcc-qcs404.c
+++ b/drivers/clk/qcom/gcc-qcs404.c
@@ -37,6 +37,155 @@ enum {
 	P_XO,
 };
 
+static struct clk_fixed_factor cxo = {
+	.mult = 1,
+	.div = 1,
+	.hw.init = &(struct clk_init_data){
+		.name = "cxo",
+		.parent_names = (const char *[]){ "xo-board" },
+		.num_parents = 1,
+		.ops = &clk_fixed_factor_ops,
+	},
+};
+
+static struct clk_alpha_pll gpll0_sleep_clk_src = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45008,
+		.enable_mask = BIT(23),
+		.enable_is_inverted = true,
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0_sleep_clk_src",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll0_out_main = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.flags = SUPPORTS_FSM_MODE,
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0_out_main",
+			.parent_names = (const char *[])
+					{ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll0_ao_out_main = {
+	.offset = 0x21000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.flags = SUPPORTS_FSM_MODE,
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(0),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll0_ao_out_main",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.flags = CLK_IS_CRITICAL,
+			.ops = &clk_alpha_pll_fixed_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll1_out_main = {
+	.offset = 0x20000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(1),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll1_out_main",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+/* 930MHz configuration */
+static const struct alpha_pll_config gpll3_config = {
+	.l = 48,
+	.alpha = 0x0,
+	.alpha_en_mask = BIT(24),
+	.post_div_mask = 0xf << 8,
+	.post_div_val = 0x1 << 8,
+	.vco_mask = 0x3 << 20,
+	.main_output_mask = 0x1,
+	.config_ctl_val = 0x4001055b,
+};
+
+static const struct pll_vco gpll3_vco[] = {
+	{ 700000000, 1400000000, 0 },
+};
+
+static struct clk_alpha_pll gpll3_out_main = {
+	.offset = 0x22000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.vco_table = gpll3_vco,
+	.num_vco = ARRAY_SIZE(gpll3_vco),
+	.clkr = {
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll3_out_main",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_alpha_pll gpll4_out_main = {
+	.offset = 0x24000,
+	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
+	.clkr = {
+		.enable_reg = 0x45000,
+		.enable_mask = BIT(5),
+		.hw.init = &(struct clk_init_data){
+			.name = "gpll4_out_main",
+			.parent_names = (const char *[]){ "cxo" },
+			.num_parents = 1,
+			.ops = &clk_alpha_pll_ops,
+		},
+	},
+};
+
+static struct clk_pll gpll6 = {
+	.l_reg = 0x37004,
+	.m_reg = 0x37008,
+	.n_reg = 0x3700C,
+	.config_reg = 0x37014,
+	.mode_reg = 0x37000,
+	.status_reg = 0x3701C,
+	.status_bit = 17,
+	.clkr.hw.init = &(struct clk_init_data){
+		.name = "gpll6",
+		.parent_names = (const char *[]){ "cxo" },
+		.num_parents = 1,
+		.ops = &clk_pll_ops,
+	},
+};
+
+static struct clk_regmap gpll6_out_aux = {
+	.enable_reg = 0x45000,
+	.enable_mask = BIT(7),
+	.hw.init = &(struct clk_init_data){
+		.name = "gpll6_out_aux",
+		.parent_names = (const char *[]){ "gpll6" },
+		.num_parents = 1,
+		.ops = &clk_pll_vote_ops,
+	},
+};
+
 static const struct parent_map gcc_parent_map_0[] = {
 	{ P_XO, 0 },
 	{ P_GPLL0_OUT_MAIN, 1 },
@@ -240,155 +389,6 @@ static const char * const gcc_parent_names_16[] = {
 	/* "gpll0_out_aux", */
 };
 
-static struct clk_fixed_factor cxo = {
-	.mult = 1,
-	.div = 1,
-	.hw.init = &(struct clk_init_data){
-		.name = "cxo",
-		.parent_names = (const char *[]){ "xo-board" },
-		.num_parents = 1,
-		.ops = &clk_fixed_factor_ops,
-	},
-};
-
-static struct clk_alpha_pll gpll0_sleep_clk_src = {
-	.offset = 0x21000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr = {
-		.enable_reg = 0x45008,
-		.enable_mask = BIT(23),
-		.enable_is_inverted = true,
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll0_sleep_clk_src",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll0_out_main = {
-	.offset = 0x21000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.flags = SUPPORTS_FSM_MODE,
-	.clkr = {
-		.enable_reg = 0x45000,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll0_out_main",
-			.parent_names = (const char *[])
-					{ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll0_ao_out_main = {
-	.offset = 0x21000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.flags = SUPPORTS_FSM_MODE,
-	.clkr = {
-		.enable_reg = 0x45000,
-		.enable_mask = BIT(0),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll0_ao_out_main",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.flags = CLK_IS_CRITICAL,
-			.ops = &clk_alpha_pll_fixed_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll1_out_main = {
-	.offset = 0x20000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr = {
-		.enable_reg = 0x45000,
-		.enable_mask = BIT(1),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll1_out_main",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-/* 930MHz configuration */
-static const struct alpha_pll_config gpll3_config = {
-	.l = 48,
-	.alpha = 0x0,
-	.alpha_en_mask = BIT(24),
-	.post_div_mask = 0xf << 8,
-	.post_div_val = 0x1 << 8,
-	.vco_mask = 0x3 << 20,
-	.main_output_mask = 0x1,
-	.config_ctl_val = 0x4001055b,
-};
-
-static const struct pll_vco gpll3_vco[] = {
-	{ 700000000, 1400000000, 0 },
-};
-
-static struct clk_alpha_pll gpll3_out_main = {
-	.offset = 0x22000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.vco_table = gpll3_vco,
-	.num_vco = ARRAY_SIZE(gpll3_vco),
-	.clkr = {
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll3_out_main",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-static struct clk_alpha_pll gpll4_out_main = {
-	.offset = 0x24000,
-	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
-	.clkr = {
-		.enable_reg = 0x45000,
-		.enable_mask = BIT(5),
-		.hw.init = &(struct clk_init_data){
-			.name = "gpll4_out_main",
-			.parent_names = (const char *[]){ "cxo" },
-			.num_parents = 1,
-			.ops = &clk_alpha_pll_ops,
-		},
-	},
-};
-
-static struct clk_pll gpll6 = {
-	.l_reg = 0x37004,
-	.m_reg = 0x37008,
-	.n_reg = 0x3700C,
-	.config_reg = 0x37014,
-	.mode_reg = 0x37000,
-	.status_reg = 0x3701C,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "gpll6",
-		.parent_names = (const char *[]){ "cxo" },
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap gpll6_out_aux = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(7),
-	.hw.init = &(struct clk_init_data){
-		.name = "gpll6_out_aux",
-		.parent_names = (const char *[]){ "gpll6" },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
 static const struct freq_tbl ftbl_apss_ahb_clk_src[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0_OUT_MAIN, 16, 0, 0),
-- 
2.35.1

