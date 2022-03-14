Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D53BC4707A
	for <linux-clk@archiver.kernel.org>; Mon, 14 Mar 2022 11:43:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239561AbiCNLpE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 14 Mar 2022 07:45:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240516AbiCNLoE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 14 Mar 2022 07:44:04 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6E3CB76
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:52 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id y17so4304609ljd.12
        for <linux-clk@vger.kernel.org>; Mon, 14 Mar 2022 04:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=X1kSt/cNOLlYSBXaFCcGxTofXAnfGn13whIIfArQmJc=;
        b=eSjLK1tRy0JVfWY3mY+Af8oxLMg6fsbPMIuhe4IzMSfTusyXUItQMA1qDRU+WG5Y3n
         YZYeAJNrF83kEiQzMqaFAHzSiOE+m/V+Jbjrp+4q6O08egFczatqZcaefwpSim2bry2f
         g+NyZnkiU1xKiSnz1bGCN5f1qBtooj8Cdf/p/pgeVBIVZvGxKH0HV+sssF91YRO9C08J
         ibVkXhZ9IKS5DKp3uWquwfVGoOR4M/p75gqeiagb+GhK/LZp3/QJDFszBkUgNrmGg5C2
         xp0opcd5VetzqBBdOIzZEvM3j2v2dVSShAQiQzwjUIp9o/QdOtWePEZH6pwqOSFpVrRM
         Cjiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=X1kSt/cNOLlYSBXaFCcGxTofXAnfGn13whIIfArQmJc=;
        b=CJvLKX2YAqwyI4N2ICxldsIFulIRlXVBrgqpHnFPUK82DfRLn9cEULi7f9iX/4WWd7
         hsW/NklGzf2ChCEQlLybelcBP5HruT0PBy57gcdwM+lbhDYcwKcxmmuBVetfZ20I5XTc
         MbyF3oZlnIbeVqYGRURlft09FQFEniLBPZUwjmpPU/zgPD7MuLz318Xe36yKNgsN0PUF
         ibM4+grDc8D/mmQH7Wni5TX5dQueQG0Q0NAIfC4XrD3aTfzR00rHslU80a+mNrHyRtLI
         +EPhXwE7KN6S8WJdmtbKlrbmwSV9AYjs0D2XidD9aY/xy8FtJBszHjox7liQTOd6ufuk
         bW8w==
X-Gm-Message-State: AOAM532orPa2Zyf/dmWcoE2MLLyXfugnCdm3DWztlt+Mq7JaYKMrsMsi
        LZs6imm611h9wsEgMh9gx+ycDg==
X-Google-Smtp-Source: ABdhPJxtf648Anu8+WQLwnefbc8tfID+CS39yck6gidPtDuLGqwclTyXEfQC2d24Q/jYTtnAsWDcsg==
X-Received: by 2002:a2e:2a44:0:b0:243:6b73:1c0 with SMTP id q65-20020a2e2a44000000b002436b7301c0mr14138309ljq.376.1647258170940;
        Mon, 14 Mar 2022 04:42:50 -0700 (PDT)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id h5-20020a197005000000b00448287d1275sm3223847lfc.298.2022.03.14.04.42.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Mar 2022 04:42:50 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 5/7] clk: qcom: clk-alpha-pll: export lucid evo PLL configuration interfaces
Date:   Mon, 14 Mar 2022 13:42:49 +0200
Message-Id: <20220314114249.1636641-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
References: <20220314114211.1636574-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The change exports lucid evo PLL configuration and control functions
to clock controller drivers.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 65 ++++++++++++++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.h |  5 ++-
 2 files changed, 69 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 47879ee5a677..54bad5277802 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -191,8 +191,10 @@ EXPORT_SYMBOL_GPL(clk_alpha_pll_regs);
 #define LUCID_5LPE_ENABLE_VOTE_RUN	BIT(21)
 
 /* LUCID EVO PLL specific settings and offsets */
+#define LUCID_EVO_PCAL_NOT_DONE		BIT(8)
 #define LUCID_EVO_ENABLE_VOTE_RUN       BIT(25)
 #define LUCID_EVO_PLL_L_VAL_MASK        GENMASK(15, 0)
+#define LUCID_EVO_PLL_CAL_L_VAL_SHIFT	16
 
 /* ZONDA PLL specific */
 #define ZONDA_PLL_OUT_MASK	0xf
@@ -1994,6 +1996,33 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 
+void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				 const struct alpha_pll_config *config)
+{
+	clk_alpha_pll_write_config(regmap, PLL_L_VAL(pll), config->l |
+			(TRION_PLL_CAL_VAL << LUCID_EVO_PLL_CAL_L_VAL_SHIFT));
+
+	clk_alpha_pll_write_config(regmap, PLL_ALPHA_VAL(pll), config->alpha);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL(pll), config->config_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U(pll), config->config_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_CONFIG_CTL_U1(pll), config->config_ctl_hi1_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL(pll), config->user_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_USER_CTL_U(pll), config->user_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL(pll), config->test_ctl_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U(pll), config->test_ctl_hi_val);
+	clk_alpha_pll_write_config(regmap, PLL_TEST_CTL_U1(pll), config->test_ctl_hi1_val);
+
+	/* Disable PLL output */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_OUTCTRL, 0);
+
+	/* Set operation mode to STANDBY */
+	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	/* Place the PLL in STANDBY mode */
+	regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, PLL_RESET_N);
+}
+EXPORT_SYMBOL_GPL(clk_lucid_evo_pll_configure);
+
 static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
@@ -2079,6 +2108,31 @@ static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
 	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
 }
 
+static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
+{
+	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
+	struct clk_hw *p;
+	u32 val = 0;
+	int ret;
+
+	/* Return early if calibration is not needed. */
+	regmap_read(pll->clkr.regmap, PLL_MODE(pll), &val);
+	if (!(val & LUCID_EVO_PCAL_NOT_DONE))
+		return 0;
+
+	p = clk_hw_get_parent(hw);
+	if (!p)
+		return -EINVAL;
+
+	ret = alpha_pll_lucid_evo_enable(hw);
+	if (ret)
+		return ret;
+
+	alpha_pll_lucid_evo_disable(hw);
+
+	return 0;
+}
+
 static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw,
 						     unsigned long parent_rate)
 {
@@ -2114,3 +2168,14 @@ const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops = {
 	.set_rate = clk_lucid_evo_pll_postdiv_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_evo_ops);
+
+const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
+	.prepare = alpha_pll_lucid_evo_prepare,
+	.enable = alpha_pll_lucid_evo_enable,
+	.disable = alpha_pll_lucid_evo_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = alpha_pll_lucid_5lpe_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_evo_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 6e9907deaf30..0b7a6859ca2c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -152,6 +152,8 @@ extern const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops;
 
 extern const struct clk_ops clk_alpha_pll_zonda_ops;
 #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
+
+extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 
@@ -168,6 +170,7 @@ void clk_agera_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config);
-
+void clk_lucid_evo_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
+				 const struct alpha_pll_config *config);
 
 #endif
-- 
2.33.0

