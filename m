Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7734BC433EF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jun 2022 08:01:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242694AbiFCIBJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jun 2022 04:01:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242200AbiFCIBI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jun 2022 04:01:08 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADDBC36B4B
        for <linux-clk@vger.kernel.org>; Fri,  3 Jun 2022 01:01:03 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id l30so11408973lfj.3
        for <linux-clk@vger.kernel.org>; Fri, 03 Jun 2022 01:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=92h+xS0S7U/GCtJqbNeL9psANLQOdO1D44wv+Muryeg=;
        b=n5rO0+cA24MQdayWipnfIoooXRy67sqMp9htPwhQL6puMrJtkBR99yUe2ekmO4swWy
         7P7cbIXVWROWHTnEJt15ctIJp13vEMotKFzyabGmSD3azl3X+v2Dmz1nezJWV7e173HD
         V02fJ/A7Z46FtZ+snSop4o93WEMFl20/xgAzoKOlgKUIQWqT5aH71Ka2SjNogg8ndEDL
         Scmbfhjoj2sbyV6b5k2Vt41jpldICc9RQl7pzqNOv9TeqRJerrCi02WUPIO4CQVE3i+D
         2IHovrTvtmdq1h8JcsAxMCXR1cHy45inmk4GzYUHUE6mLXQuTzZ8hJcmpTzqP2J320x/
         T4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=92h+xS0S7U/GCtJqbNeL9psANLQOdO1D44wv+Muryeg=;
        b=Pyst6A3E3OEA78a97i6pZS1GMKDnqlQ6h483GdPtuO7Y9B7shuAa/dGf8ziVljP6WU
         ve94VxLLHNo21lHaRANT+Bl046deA9Ru1KKkpSctjG33dYHQkUv/5KYJXuM4o0IhLgWB
         haDR3hRsvyAe5NkToWMqkeW+yZuM4+15EVUPOgoUHiYA6lDrU1vyb6xbCTJaMO1XZ1/S
         vmRZNUQaB2fVS9a+twXjAYveIMStaB7y4n+9mf4qw9pxAlr6tjJa9XinQzUeCLTQoLP/
         6VWrawBTp7y0G7r2WKjJqFtwI8uLl1vR7TaZFURABYnN+2wig85Pipeq7+DHJkhZ7ueL
         WTKQ==
X-Gm-Message-State: AOAM532j10/5w6SegzsjSxdIS31nr9kEzwqm2Gtnm1CjxynzrbKZgdp/
        gWdmtdMZOIc2fswaubxqNzSmsw==
X-Google-Smtp-Source: ABdhPJwQ47yFKb8+4vTrT/DyFt307+4IjfD6BDGHeYIXt2kQ7DZX3hHeQZ4IuHKqRKlyC7XQ+UuemQ==
X-Received: by 2002:ac2:5d22:0:b0:478:9e46:ae85 with SMTP id i2-20020ac25d22000000b004789e46ae85mr6127811lfb.126.1654243263231;
        Fri, 03 Jun 2022 01:01:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id d10-20020a19e60a000000b0047255d21205sm1434462lfh.308.2022.06.03.01.01.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:01:02 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v6 5/7] clk: qcom: clk-alpha-pll: add Lucid EVO PLL configuration interfaces
Date:   Fri,  3 Jun 2022 11:01:01 +0300
Message-Id: <20220603080101.2251828-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The change adds controls for Lucid EVO PLL configuration and exports
control functions to clock controller drivers.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v3 to v6:
* none.

Changes from v2 to v3:
* improved commit subject and description per ask from Bjorn.

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

