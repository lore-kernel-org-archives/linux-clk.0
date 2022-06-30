Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F0D9C43334
	for <linux-clk@archiver.kernel.org>; Thu, 30 Jun 2022 08:20:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233167AbiF3IUf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Jun 2022 04:20:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233319AbiF3IUJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Jun 2022 04:20:09 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E4CA43ACB
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 01:18:33 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id s10so22059062ljh.12
        for <linux-clk@vger.kernel.org>; Thu, 30 Jun 2022 01:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=S765N0yh4u0q6qQwvu4izL5C5qF4o7NDpynFn4EXhT8=;
        b=bmvmK7rvRBTCENgJNfdIILOu8PE/7NFphuDms+VRVxUtiZbcvXFJ90lmInIhiR2wov
         qRG8Id0JiBcMBCArDGISF/zzy3SCBiy2zZsq8iRcR7EEDnlwHLUppAVj4hyelOzNTPAh
         DIzvjkDdwijZV5PTG5b1KUf+MxXebnMRoPalb9gkbv4BHRRHRXT1B16iziflNFH1Wt9D
         d07mpWzqqNq72hWYpmoC7GeDC/Ns3a+o5leXDRctN3UauNfQ2DZp300xnOi//7fEEvDT
         PJmTGuj/OypkEQ30tfs7zroZB3+6LSLdpkBGY3ct9rWXBva+ylJeJcl7hGLWolWijutv
         9nVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=S765N0yh4u0q6qQwvu4izL5C5qF4o7NDpynFn4EXhT8=;
        b=8GbnIVS8Q1WuU4nOvNpl1jAyrxCg/R8ghb9afAbfK3Tx3ClGw+Bfu7ekk8O98b23k7
         vaXS8A2/6Y8iNJrxtXWS0dTFlAZNVvAaGBZPzv1lPeOVy6Hyjr8tZJJIFZ9Jrl6IPWqt
         Z7zfZ/b9NYNaGKkl02LnHaRnHioqieYvFXotM+y93mlutU2k4Dr5DO2aAT37Dk5nJBx1
         I2Qz0b7RaSEcZWOdSZKBXA5Q83SIv8tuQ/te2TfuDbfpc3+ajNfSTYQriIt/kob2tjIl
         Tp4TPeXpL0H0u6YNJuKIZ1OAcPTcpyQ/P3IuZNZc5buXfMMprJ2O3U7gcSUugyLyyc7U
         3k8w==
X-Gm-Message-State: AJIora/gedmdHlpg3SYIYiFKScw9XJT4Vs3+qiQSJeG4wTg/CBvBcSLo
        EzZiflAwtnCHa4LxB6hRY8llIsOHifdXkA==
X-Google-Smtp-Source: AGRyM1tEOZiWQpctGynVh/AvrAHByT89QkyaRn996fAvEEc5E9CrUM3swFfHUco6M9/UXR2rnR58wg==
X-Received: by 2002:a2e:b5d1:0:b0:25a:9f46:6791 with SMTP id g17-20020a2eb5d1000000b0025a9f466791mr3990602ljn.465.1656577111492;
        Thu, 30 Jun 2022 01:18:31 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id q17-20020a0565123a9100b0047f70a14c95sm2972032lfu.42.2022.06.30.01.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jun 2022 01:18:30 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v9 6/7] clk: qcom: clk-alpha-pll: add Rivian EVO PLL configuration interfaces
Date:   Thu, 30 Jun 2022 11:18:28 +0300
Message-Id: <20220630081828.2554088-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
References: <20220630081742.2554006-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add and export Rivian EVO PLL configuration and control functions to
clock controller drivers.

Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v8 to v9:
* none.

Changes from v7 to v8:
* Corrected a comment and added a local variable to improve readability.

Changes from v1 to v7:
* none.

 drivers/clk/qcom/clk-alpha-pll.c | 70 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  6 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index cdb1035ae3ed..b42684703fbb 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -154,6 +154,18 @@ const u8 clk_alpha_pll_regs[][PLL_OFF_MAX_REGS] = {
 		[PLL_OFF_TEST_CTL_U] = 0x30,
 		[PLL_OFF_TEST_CTL_U1] = 0x34,
 	},
+	[CLK_ALPHA_PLL_TYPE_RIVIAN_EVO] = {
+		[PLL_OFF_OPMODE] = 0x04,
+		[PLL_OFF_STATUS] = 0x0c,
+		[PLL_OFF_L_VAL] = 0x10,
+		[PLL_OFF_USER_CTL] = 0x14,
+		[PLL_OFF_USER_CTL_U] = 0x18,
+		[PLL_OFF_CONFIG_CTL] = 0x1c,
+		[PLL_OFF_CONFIG_CTL_U] = 0x20,
+		[PLL_OFF_CONFIG_CTL_U1] = 0x24,
+		[PLL_OFF_TEST_CTL] = 0x28,
+		[PLL_OFF_TEST_CTL_U] = 0x2c,
+	},
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 
@@ -2178,3 +2190,61 @@ const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_evo_ops);
+
+void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				  const struct alpha_pll_config *config)
+{
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
+
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	regmap_update_bits(regmap, PLL_MODE(pll),
+			   PLL_RESET_N | PLL_BYPASSNL | PLL_OUTCTRL,
+			   PLL_RESET_N | PLL_BYPASSNL);
+}
+EXPORT_SYMBOL_GPL(clk_rivian_evo_pll_configure);
+
+static unsigned long clk_rivian_evo_pll_recalc_rate(struct clk_hw *hw,
+						    unsigned long parent_rate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	u32 l;
+
+	regmap_read(pll->clkr.regmap, PLL_L_VAL(pll), &l);
+
+	return parent_rate * l;
+}
+
+static long clk_rivian_evo_pll_round_rate(struct clk_hw *hw, unsigned long rate,
+					  unsigned long *prate)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	unsigned long min_freq, max_freq;
+	u32 l;
+	u64 a;
+
+	rate = alpha_pll_round_rate(rate, *prate, &l, &a, 0);
+	if (!pll->vco_table || alpha_pll_find_vco(pll, rate))
+		return rate;
+
+	min_freq = pll->vco_table[0].min_freq;
+	max_freq = pll->vco_table[pll->num_vco - 1].max_freq;
+
+	return clamp(rate, min_freq, max_freq);
+}
+
+const struct clk_ops clk_alpha_pll_rivian_evo_ops = {
+	.enable = alpha_pll_lucid_5lpe_enable,
+	.disable = alpha_pll_lucid_5lpe_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = clk_rivian_evo_pll_recalc_rate,
+	.round_rate = clk_rivian_evo_pll_round_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_rivian_evo_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0b7a6859ca2c..447efb82fe59 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -18,6 +18,7 @@ enum {
 	CLK_ALPHA_PLL_TYPE_AGERA,
 	CLK_ALPHA_PLL_TYPE_ZONDA,
 	CLK_ALPHA_PLL_TYPE_LUCID_EVO,
+	CLK_ALPHA_PLL_TYPE_RIVIAN_EVO,
 	CLK_ALPHA_PLL_TYPE_MAX,
 };
 
@@ -157,6 +158,9 @@ extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 
+extern const struct clk_ops clk_alpha_pll_rivian_evo_ops;
+#define clk_alpha_pll_postdiv_rivian_evo_ops clk_alpha_pll_postdiv_fabia_ops
+
 void clk_alpha_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_fabia_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
@@ -172,5 +176,7 @@ void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
 void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 				 const struct alpha_pll_config *config);
+void clk_rivian_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				  const struct alpha_pll_config *config);
 
 #endif
-- 
2.33.0

