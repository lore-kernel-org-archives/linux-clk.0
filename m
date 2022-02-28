Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC79BC433F5
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 12:03:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233424AbiB1MEa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 07:04:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236120AbiB1ME0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 07:04:26 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6AD51CB24
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:45 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id b9so20964814lfv.7
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OBnwU3nqmmc0u3iNZ0+MBmfjgblQfRJpOZDSvEQruOg=;
        b=i05nrjCxrgN8FvHYCF6iKI0dsy9+3J2s/ptUgJRS8cVA9cRct5A8vWwVGLHBTPkDIC
         BARdt02T5UoTZmr/pnwtLFHrTeW9ZLDEZS/yzHG2axdrgdZjU0mA4+tsKV5Xq8yH3tFb
         rnyk1Su+0KjoFhyzAxEJPmrMmzi0du/NuRIbjMrFLAR4sxAt6iZyLatkEBnIv/3yuMy2
         qB+VPCHVE8mxPfD/HBMHnA+Wf+AS+AAOFrDOL+K+zKulbgw05zftAxzOMy0jioaixtBo
         oxcVEC8UdUm76NqWbTDWAy5HqBRcSV3EWdWsW2lH4KElzAWLtOAOTEMm5OPERTIBXrRb
         jFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OBnwU3nqmmc0u3iNZ0+MBmfjgblQfRJpOZDSvEQruOg=;
        b=k7aMQW0FXkQErGhWp1z+LnTDOpgCvLoMqD0F/+k8rNJvgy6GNrdQpYHD3+oTcur8Ax
         hERycqEcZcumElKHIq7XxAFJR1faV/d2iESA9QOcC7w9hDP1RSH3yCwWym9Z3X7AkOxx
         Dk0fRE6ynWxvOiyCibw8zQp/QND6pigQsQnX9JPnGZt0axlr5AKZfAk+3oagT0YOiBRD
         eZijU5efzBISAEpl7c3e2tuQnvGyZX3MneP4CJgKiZZ/7dja9UWh90xpkLkfCt6vpVVl
         3KVT8h93bEhHA2hK4ASjdRjps+m84NscRP6PLo8jsVKZ0J4PpoErHtcwcYX8+SfR8hH4
         Axgw==
X-Gm-Message-State: AOAM533zFt/pmZ+0EF3Y1iHYx4u/zbWc5v6+o3pofI+moiA5YIcuQg8T
        xR5GvficOSwgRr3aNIWkPhn5Vw==
X-Google-Smtp-Source: ABdhPJyM2qFsSzts3EMaVVY9s3JYNSMpewvfEOiMkQv1z+iX+G/qkFeOL14++gLnlOSRXynVWWW5QQ==
X-Received: by 2002:a05:6512:a93:b0:43c:cf81:d848 with SMTP id m19-20020a0565120a9300b0043ccf81d848mr12863003lfu.538.1646049824287;
        Mon, 28 Feb 2022 04:03:44 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id t24-20020a19dc18000000b004433d7c87a6sm937511lfg.72.2022.02.28.04.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:03:43 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 7/8] clk: qcom: clk-alpha-pll: add rivian evo PLL configuration interfaces
Date:   Mon, 28 Feb 2022 14:03:42 +0200
Message-Id: <20220228120342.997142-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The change adds and exports rivian evo PLL configuration and control
functions to clock controller drivers.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 70 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  6 +++
 2 files changed, 76 insertions(+)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 54bad5277802..ab4f0fc15a48 100644
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
 
@@ -2179,3 +2191,61 @@ const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
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

