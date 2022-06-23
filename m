Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C51FCCA480
	for <linux-clk@archiver.kernel.org>; Thu, 23 Jun 2022 11:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbiFWLro (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 23 Jun 2022 07:47:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbiFWLrn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 23 Jun 2022 07:47:43 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5474CD6E
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 04:47:42 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id g12so16916019ljk.11
        for <linux-clk@vger.kernel.org>; Thu, 23 Jun 2022 04:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ylw+8hFWBGTG5if/KGltO0zJr3Y+Zkr0la0zkZDe1NA=;
        b=TusmLvK/VxAf4zzAPeFby7CSskXqt6YUq+iDuxlh/TCLpQBCfwvnLTzLirKWJ3SMDm
         10F25B3kjVqSgZt78IU0LOuP5477pBtiPzhy2QQ1Z83DnKEZ69vW/UDwf3Ilb1WZI6qH
         zIUnoSW0GQJp1LpYXXikaO1gYguBk0SDYWtxeEGPqqaAZG4N4+l/IwRIEeBjorNI1q/n
         zmzlWIX5yAtbS44xdbm0K0zs4wUk1egK4HU9LbPQtrlS0YcYVXBXWfNUw1fyfXbgpSsl
         Gry4Xpk6u9geaChPBDv4j8Ef8P0NWGTxZ/MZ0UniSM8VuWP8fzecyNfhOxOJFIsa20+E
         Jepw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ylw+8hFWBGTG5if/KGltO0zJr3Y+Zkr0la0zkZDe1NA=;
        b=eU3zoZThq0twgbK1K9QztpXz3kzqmjs3jbr/UhnxKd5A5/6g3A1F1wgoF2hUcql/st
         ZOiyNJzvGZda3FY3tRwihCXMMDN8qmnJfU+/p1krGGyIgO+8eKAGVBYKjDjU4I5yNyMT
         nxfdjRDmmjCllNtj4qtIy0/TYOIMIQzlLcldJHcN7Q6zbR6aUn66Qr1ruCd90sYJGRmx
         9LM0YX5wdAqwA7jM1ahIEVLq6YFREXyA7J9Lc/8ABIOoELJx21LlyXGWqo/+1qRMsAzl
         n+nT53VtDLnYKPeU7874KyIdggJ+HloDJkCXOJiOdY20BQtpXTPs7t3hjTuTz2gO3nyB
         7MYg==
X-Gm-Message-State: AJIora+TXGeVfeeADtlxU3x/3hUAvEdEAeiGYaIUF/3VhMOKPZmGaf8M
        y/QuBCaPRBuSFz9GsXaUVCza8mYAmKAQ8+pE
X-Google-Smtp-Source: AGRyM1tH60ZSzb0jyWtkWx3PmDJnzjIBYnJ8AHAOMky6H7UXE0wk6Cd34qeybVQOKNzE/SSChfCf+g==
X-Received: by 2002:a2e:a90c:0:b0:258:edc3:4d2b with SMTP id j12-20020a2ea90c000000b00258edc34d2bmr4563823ljq.225.1655984860511;
        Thu, 23 Jun 2022 04:47:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id x5-20020a056512078500b0047f77729723sm1369968lfr.43.2022.06.23.04.47.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jun 2022 04:47:40 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v1 3/4] clk: qcom: alpha-pll: add support for power off mode for lucid evo PLL
Date:   Thu, 23 Jun 2022 14:47:36 +0300
Message-Id: <20220623114737.247703-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
References: <20220623114737.247703-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

PLLs can be kept in standby (default configuration) or in off mode
when disabled during power collapse. Hence add support for pll
disable off mode for lucid evo PLL.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/clk-alpha-pll.c | 40 +++++++++++++++++++++++++++++---
 drivers/clk/qcom/clk-alpha-pll.h |  1 +
 2 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 4a2d91996ce6..493cde7964f8 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -2077,7 +2077,7 @@ static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 	return ret;
 }
 
-static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
+static void _alpha_pll_lucid_evo_disable(struct clk_hw *hw, bool reset)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	struct regmap *regmap = pll->clkr.regmap;
@@ -2106,9 +2106,12 @@ static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
 
 	/* Place the PLL mode in STANDBY */
 	regmap_write(regmap, PLL_OPMODE(pll), PLL_STANDBY);
+
+	if (reset)
+		regmap_update_bits(regmap, PLL_MODE(pll), PLL_RESET_N, 0);
 }
 
-static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
+static int _alpha_pll_lucid_evo_prepare(struct clk_hw *hw, bool reset)
 {
 	struct clk_alpha_pll *pll = to_clk_alpha_pll(hw);
 	struct clk_hw *p;
@@ -2128,11 +2131,31 @@ static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
 	if (ret)
 		return ret;
 
-	alpha_pll_lucid_evo_disable(hw);
+	_alpha_pll_lucid_evo_disable(hw, reset);
 
 	return 0;
 }
 
+static void alpha_pll_lucid_evo_disable(struct clk_hw *hw)
+{
+	_alpha_pll_lucid_evo_disable(hw, false);
+}
+
+static int alpha_pll_lucid_evo_prepare(struct clk_hw *hw)
+{
+	return _alpha_pll_lucid_evo_prepare(hw, false);
+}
+
+static void alpha_pll_reset_lucid_evo_disable(struct clk_hw *hw)
+{
+	_alpha_pll_lucid_evo_disable(hw, true);
+}
+
+static int alpha_pll_reset_lucid_evo_prepare(struct clk_hw *hw)
+{
+	return _alpha_pll_lucid_evo_prepare(hw, true);
+}
+
 static unsigned long alpha_pll_lucid_evo_recalc_rate(struct clk_hw *hw,
 						     unsigned long parent_rate)
 {
@@ -2179,3 +2202,14 @@ const struct clk_ops clk_alpha_pll_lucid_evo_ops = {
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
 EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_evo_ops);
+
+const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops = {
+	.prepare = alpha_pll_reset_lucid_evo_prepare,
+	.enable = alpha_pll_lucid_evo_enable,
+	.disable = alpha_pll_reset_lucid_evo_disable,
+	.is_enabled = clk_trion_pll_is_enabled,
+	.recalc_rate = alpha_pll_lucid_evo_recalc_rate,
+	.round_rate = clk_alpha_pll_round_rate,
+	.set_rate = alpha_pll_lucid_5lpe_set_rate,
+};
+EXPORT_SYMBOL_GPL(clk_alpha_pll_reset_lucid_evo_ops);
diff --git a/drivers/clk/qcom/clk-alpha-pll.h b/drivers/clk/qcom/clk-alpha-pll.h
index 0b7a6859ca2c..f2cc0de7313c 100644
--- a/drivers/clk/qcom/clk-alpha-pll.h
+++ b/drivers/clk/qcom/clk-alpha-pll.h
@@ -154,6 +154,7 @@ extern const struct clk_ops clk_alpha_pll_zonda_ops;
 #define clk_alpha_pll_postdiv_zonda_ops clk_alpha_pll_postdiv_fabia_ops
 
 extern const struct clk_ops clk_alpha_pll_lucid_evo_ops;
+extern const struct clk_ops clk_alpha_pll_reset_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_fixed_lucid_evo_ops;
 extern const struct clk_ops clk_alpha_pll_postdiv_lucid_evo_ops;
 
-- 
2.35.1

