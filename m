Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81F5396D15
	for <linux-clk@vger.kernel.org>; Mon,  6 Jul 2026 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783350185; cv=none; b=anLaN4yaM+jxXPVaBtZoxSrbYqQDec/uJNQoONxWnvnhyXSdvRbLZ1qBqK5M/9Ua+sdTKWvTJenvJo93gkciWmJQc/KQArg7hbRz6rg1xGrluQT75El54SdOkTgvF0b6EgGPBhbkeNl6zDq/eAyiHPnJYaI1eef1hmO9nR8zKSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783350185; c=relaxed/simple;
	bh=oIr6Vm6uJCeF5fjiXKn75HDnWRdml/g8/xMcUJFwrx4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h1muitySo2VYQQNFjUQZkrBrmSfVPXhrpyGsloaabsMkYLvhOIgx+2hEiBIqWtIBl56AsCOk6v2zutIVU8Bq0WdY6ieAAofMlUKHxiBxKImqWP/5fw9qUOM+0tmo12wot7hvU2lNYZaX6ujcdtF+8lVH3GCkaft+Kz1xaU3BKpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UlSfK6gv; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UlSfK6gv"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47640541585so1960698f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 06 Jul 2026 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783350181; x=1783954981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+L0VpsGhGY/o4A3yhDDb9FR13waT1cgBjZY/lBa48nA=;
        b=UlSfK6gv6mGJAIjbj29EEwmaXN1vrl0K5WHgd6NGO+NV44njHbWIOAyECVx85nc8if
         ol2oQLhLf3dKbPnemmklpx8xFKcUwEimSB8BrTX1jYBhT2ybDe35Ir9GcEJzxwJvZpBo
         8FDI7zBSzYrh1mrPEwWg+2GuBNneswi8V2lBySYSHOC7I1XtAP/G1WoAaeo0RYFR5kys
         ScthYwSjw3G3H5gmUMQgyFDydTr4R5V2Y8HeUNg7p73HgCYX/Hm3bGx10jM8e6SOblIX
         0tuuWZcHaILbmbcam0D1JOiTs0q4dtp6t6G2D79FW5lbbAzPoAhAGuXSjaOzaxhBEOar
         WbLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783350181; x=1783954981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+L0VpsGhGY/o4A3yhDDb9FR13waT1cgBjZY/lBa48nA=;
        b=C6I0Qo/0K6TKJssZNqC6NpQv7Qsg1zyZLWHsgLKbRrPwGwW6KFxEP35xFkEZ7H8iVx
         +YsEpK93Ik2hWTmKE5R5OXx5LsaNUeeph/ApLU8XHWdQKxLXpSA9prGKTDZuIw9MBo8k
         LeUuRXfGPE7s9C7l3IeGBRUB+JNm+OlT+LrhJJulELvtPMtO4FB93n+T1RPvb40GJZG8
         g5AZpT5T3pC1f0rlUSE5a83/0z6TQAnN3FXCSxr35aaDDNOQ7r9FhjrbSwT/5tV/QeMB
         bUCbuLtYdloSdBhfpFv9hUFB34GatpdFLnyRcKakvSi7tdN/JfSk6FavYSKfJeaej1ie
         oSWQ==
X-Forwarded-Encrypted: i=1; AHgh+RrE6jC0y/PJaDPLyzEWXHOd5Wr9dKfKJ36Gdj2fMYFDZv6k03cXIyFuS8vWlRSl9aZuiX/p2Um21cc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxI03AKL90dbZ89nX/uHLj/MC9KEK/82S+2HjCG/mrvlIMwLecQ
	oGmc052Tb3Lz9y1sREQFFRYuZt+q4rOn5VAbTPSxbCC2hdNhBtQK0Jb9nU4FC7bAENg=
X-Gm-Gg: AfdE7cmkn1gWORG06jbJJhYe3fbR3zAnvbuJQjwNGGtMq9+odf/0liNxreuIu3rbDG+
	qzWUtwkXWZ2TRSBr9MMqNhw2cabuL3Xq607U2cE3omoFiurs6YemLBL1T3+oMTAgHOxrLq8Zh8W
	kPRIKxKzJh8WeNPU2bG/g1tn9CFU1keztg9AXexqXF0/+Vu/Rl8BHxez3KIJSoWovgCdtTnnTo1
	xtMy6UJlIuPq1VYSbfats3KB4T2cImESe/isyVUPzP2++b5aSOm/rStwVhsHPSmqnd6BASe7Ctm
	Qe+50nZwbL/dPRx22dmgQZ1qiH84WYsEQYNywt+4ZQf53WprmDVWpVaqa53IE+S9sOXXw2h7RlR
	fPVfibnFItfWSSxJfkWaj1ruhESV490AoemAh3LbiQdsvoP+NxJsWqPBMYInd0QwWQSPXy03Rtz
	aAqdGQfA2OSfi/JMs+tX0/J58o3Q==
X-Received: by 2002:a05:600c:628d:b0:490:e5c1:b8bf with SMTP id 5b1f17b1804b1-493df04a9ddmr10784375e9.13.1783350180095;
        Mon, 06 Jul 2026 08:03:00 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff24:7210:1bb5:914d:5d25:d048])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493c637568dsm397741625e9.4.2026.07.06.08.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 08:02:59 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 06 Jul 2026 17:02:15 +0200
Subject: [PATCH v2 08/12] clk: qcom: gcc-mdm9607: Drop incorrect BIMC PLL
 and related clocks
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-qcom-clk-mdm9607-fixes-v2-8-745565101869@linaro.org>
References: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
In-Reply-To: <20260706-qcom-clk-mdm9607-fixes-v2-0-745565101869@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>, 
 Shawn Guo <shengchao.guo@oss.qualcomm.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org
X-Mailer: b4 0.15.2

The gcc-mdm9607 driver was originally based on gcc-msm8916, but a closer
match nowadays is gcc-msm8909. Looking at the differences between
gcc-mdm9607 and gcc-msm8909, there is quite some confusion around the
definitions for the BIMC PLL.

It turns out the BIMC PLL on MDM9607 is actually an Alpha PLL just like on
MSM8909. We can vote for it using BIT(2), which explains why BIT(3) was
used for GPLL2.

In practice, the BIMC PLL is exclusively controlled by the RPM firmware and
Linux should not touch it. So far, it was defined to model the full clock
hierarchy, but even in read-only mode with CLK_GET_RATE_NOCACHE this is
problematic since the RPM will silently change the clock parents without
notifying Linux about it. The clock framework reads the clock parent only
once during boot, so the resulting rates will still be often wrong.

Follow the example of more recent SoCs and drop the BIMC PLL and all
remaining related clocks to avoid reporting stale status data. This means
we cannot determine the rate of these clocks anymore. This is not a big
problem in practice, since these are NoC-related clocks that are
independently managed through the interconnect subsystem.

Cc: stable@vger.kernel.org
Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/clk/qcom/gcc-mdm9607.c | 125 +----------------------------------------
 1 file changed, 1 insertion(+), 124 deletions(-)

diff --git a/drivers/clk/qcom/gcc-mdm9607.c b/drivers/clk/qcom/gcc-mdm9607.c
index c6abe93ce2e8..4b749c99586b 100644
--- a/drivers/clk/qcom/gcc-mdm9607.c
+++ b/drivers/clk/qcom/gcc-mdm9607.c
@@ -26,7 +26,6 @@
 
 enum {
 	P_XO,
-	P_BIMC,
 	P_GPLL0,
 	P_GPLL1,
 	P_GPLL2,
@@ -121,7 +120,7 @@ static struct clk_alpha_pll gpll2_early = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr = {
 		.enable_reg = 0x45000,
-		.enable_mask = BIT(3), /* Yeah, apparently it's not 2 */
+		.enable_mask = BIT(3), /* BIT(2) is used for BIMC PLL */
 		.hw.init = &(struct clk_init_data)
 		{
 			.name = "gpll2_early",
@@ -178,68 +177,6 @@ static struct clk_rcg2 apss_ahb_clk_src = {
 	},
 };
 
-static struct clk_pll bimc_pll = {
-	.l_reg = 0x23004,
-	.m_reg = 0x23008,
-	.n_reg = 0x2300c,
-	.config_reg = 0x23010,
-	.mode_reg = 0x23000,
-	.status_reg = 0x2301c,
-	.status_bit = 17,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll",
-		.parent_data = &(const struct clk_parent_data){
-			.fw_name = "xo",
-		},
-		.num_parents = 1,
-		.ops = &clk_pll_ops,
-	},
-};
-
-static struct clk_regmap bimc_pll_vote = {
-	.enable_reg = 0x45000,
-	.enable_mask = BIT(3),
-	.hw.init = &(struct clk_init_data){
-		.name = "bimc_pll_vote",
-		.parent_hws = (const struct clk_hw *[]){ &bimc_pll.clkr.hw },
-		.num_parents = 1,
-		.ops = &clk_pll_vote_ops,
-	},
-};
-
-static const struct parent_map gcc_xo_gpll0_bimc_map[] = {
-	{ P_XO, 0 },
-	{ P_GPLL0, 1 },
-	{ P_BIMC, 2 },
-};
-
-static const struct clk_parent_data gcc_xo_gpll0_bimc[] = {
-	{ .fw_name = "xo" },
-	{ .hw = &gpll0.clkr.hw },
-	{ .hw = &bimc_pll_vote.hw },
-};
-
-static const struct freq_tbl ftbl_pcnoc_bfdcd_clk_src[] = {
-	F(19200000, P_XO, 1, 0, 0),
-	F(50000000, P_GPLL0, 16, 0, 0),
-	F(100000000, P_GPLL0, 8, 0, 0),
-	{ }
-};
-
-static struct clk_rcg2 pcnoc_bfdcd_clk_src = {
-	.cmd_rcgr = 0x27000,
-	.freq_tbl = ftbl_pcnoc_bfdcd_clk_src,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "pcnoc_bfdcd_clk_src",
-		.parent_data = gcc_xo_gpll0_bimc,
-		.num_parents = ARRAY_SIZE(gcc_xo_gpll0_bimc),
-		.ops = &clk_rcg2_ops,
-		.flags = CLK_IS_CRITICAL,
-	},
-};
-
 static const struct freq_tbl ftbl_gcc_blsp1_qup1_6_i2c_apps_clk[] = {
 	F(19200000, P_XO, 1, 0, 0),
 	F(50000000, P_GPLL0, 16, 0, 0),
@@ -735,8 +672,6 @@ static struct clk_branch gcc_blsp1_ahb_clk = {
 		.enable_mask = BIT(10),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_blsp1_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1038,8 +973,6 @@ static struct clk_branch gcc_boot_rom_ahb_clk = {
 		.enable_mask = BIT(7),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_boot_rom_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1053,9 +986,6 @@ static struct clk_branch gcc_crypto_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1069,9 +999,6 @@ static struct clk_branch gcc_crypto_axi_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_crypto_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1145,9 +1072,6 @@ static struct clk_branch gcc_mss_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_cfg_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1175,9 +1099,6 @@ static struct clk_branch gcc_pdm_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_pdm_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1191,9 +1112,6 @@ static struct clk_branch gcc_prng_ahb_clk = {
 		.enable_mask = BIT(8),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_prng_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1206,9 +1124,6 @@ static struct clk_branch gcc_sdcc1_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc1_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1236,9 +1151,6 @@ static struct clk_branch gcc_sdcc2_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_sdcc2_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1259,19 +1171,6 @@ static struct clk_branch gcc_sdcc2_apps_clk = {
 	},
 };
 
-static struct clk_rcg2 bimc_ddr_clk_src = {
-	.cmd_rcgr = 0x32004,
-	.hid_width = 5,
-	.parent_map = gcc_xo_gpll0_bimc_map,
-	.clkr.hw.init = &(struct clk_init_data){
-		.name = "bimc_ddr_clk_src",
-		.parent_data = gcc_xo_gpll0_bimc,
-		.num_parents = 3,
-		.ops = &clk_rcg2_ops,
-		.flags = CLK_GET_RATE_NOCACHE,
-	},
-};
-
 static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 	.halt_reg = 0x49004,
 	.clkr = {
@@ -1279,9 +1178,6 @@ static struct clk_branch gcc_mss_q6_bimc_axi_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_mss_q6_bimc_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &bimc_ddr_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1295,8 +1191,6 @@ static struct clk_branch gcc_apss_tcu_clk = {
 		.enable_mask = BIT(1),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_tcu_clk",
-			.parent_hws = (const struct clk_hw *[]){ &bimc_ddr_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1310,9 +1204,6 @@ static struct clk_branch gcc_smmu_cfg_clk = {
 		.enable_mask = BIT(12),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_smmu_cfg_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1360,9 +1251,6 @@ static struct clk_branch gcc_usb_hs_phy_cfg_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_phy_cfg_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1375,9 +1263,6 @@ static struct clk_branch gcc_usb_hs_ahb_clk = {
 		.enable_mask = BIT(0),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_usb_hs_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1406,8 +1291,6 @@ static struct clk_branch gcc_apss_ahb_clk = {
 		.enable_mask = BIT(14),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_ahb_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1421,8 +1304,6 @@ static struct clk_branch gcc_apss_axi_clk = {
 		.enable_mask = BIT(13),
 		.hw.init = &(struct clk_init_data){
 			.name = "gcc_apss_axi_clk",
-			.parent_hws = (const struct clk_hw *[]){ &pcnoc_bfdcd_clk_src.clkr.hw },
-			.num_parents = 1,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -1435,10 +1316,6 @@ static struct clk_regmap *gcc_mdm9607_clocks[] = {
 	[GPLL1_VOTE] = &gpll1_vote,
 	[GPLL2] = &gpll2.clkr,
 	[GPLL2_EARLY] = &gpll2_early.clkr,
-	[BIMC_PLL] = &bimc_pll.clkr,
-	[BIMC_PLL_VOTE] = &bimc_pll_vote,
-	[BIMC_DDR_CLK_SRC] = &bimc_ddr_clk_src.clkr,
-	[PCNOC_BFDCD_CLK_SRC] = &pcnoc_bfdcd_clk_src.clkr,
 	[APSS_AHB_CLK_SRC] = &apss_ahb_clk_src.clkr,
 	[BLSP1_QUP1_I2C_APPS_CLK_SRC] = &blsp1_qup1_i2c_apps_clk_src.clkr,
 	[BLSP1_QUP1_SPI_APPS_CLK_SRC] = &blsp1_qup1_spi_apps_clk_src.clkr,

-- 
2.54.0

