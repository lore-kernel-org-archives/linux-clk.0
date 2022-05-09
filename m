Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A97EC4167B
	for <linux-clk@archiver.kernel.org>; Mon,  9 May 2022 09:38:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238456AbiEIJjh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 May 2022 05:39:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237304AbiEIJGB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 May 2022 05:06:01 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8736B88F5C
        for <linux-clk@vger.kernel.org>; Mon,  9 May 2022 02:01:54 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id b32so7943100ljf.1
        for <linux-clk@vger.kernel.org>; Mon, 09 May 2022 02:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kmq0qX5rZBrOn+EiEOWlsQTnWTwLO0dKtKwWNOTxB2s=;
        b=lH/Y9vYhEjrL6lgdO6hFTDFkoQ5bKDeTGEOd5ROxIB3I5FQRZ6Fi6NruZ3wdVpT4Z6
         ZXjsMSI7pAwOXdozwuNKXW1fVlXgO2odfutrfs363XO/O/e/8xnBkYgtK41RhoaTNqG5
         ReQ4VQMA4d3MsZ70T4EPA90qWBG+yy1svPxdTIoeUwjZb8+xBYalFG/i1A5eJPTAuaNe
         dFAIDcf7FkjjBkKTR9eG+LEwYjdhAePMYHe83+IcjjEwJaL2LGvg9Cg7IsC15wGuaWze
         BhUaim001FFUe4UkYkhzbs6K7uSp2W5Vk5+tO8a5hnoLK7oQmGvxjXt118dHbOjXv2ql
         2QSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kmq0qX5rZBrOn+EiEOWlsQTnWTwLO0dKtKwWNOTxB2s=;
        b=zJ6ezYeFfZGibSUGIWHXlSJTftZMcZUqaiQOO3Q1ARpDnwClLI9KN9AjDY/qxGk7Cv
         6b1KEd122wH1SbPqyGFf1oUj5vEK1Pd2rt9isvu18sUCv4SOFCYzN2hZ8ksY0jVx8XTg
         v/AiInSxSPpawEbYm8jszIF0c+4gssWyNUMNxtWI8jj9XvCdakh3HaGT3V7J7E0HmknO
         FlxgAmPotoiAn+UpM5/+qx31qqtrMIO4eOzU0k/5kNB1ZsaoPsqhd0QiEqtiIVmmNiqB
         PCHKe3Bg84hS7W+e6e3Ryu2AVkSYY1USy5i14SbaOi81PkLKtimCM7vwwah+hI9NVmof
         +fCQ==
X-Gm-Message-State: AOAM532cdtbCyTrpV1PLOaEFddVeIT/448xYxMtevxLKu3vEG4Ovtofv
        d6bqtKVhdeCLo2dxMNwQ0WEgscqLR1QkIw==
X-Google-Smtp-Source: ABdhPJyXBaJaQe7Ppz6sFxeKtfyJxkJlRDvHlcLMC3lAiDKGPQVZPuR4UBoXsc7ndRpudlQOdYnbtg==
X-Received: by 2002:a2e:9949:0:b0:24f:140b:4319 with SMTP id r9-20020a2e9949000000b0024f140b4319mr10159843ljj.294.1652086910925;
        Mon, 09 May 2022 02:01:50 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-5672eb-224.dhcp.inet.fi. [86.114.235.224])
        by smtp.gmail.com with ESMTPSA id v13-20020a056512348d00b0047255d211ecsm1875785lfr.283.2022.05.09.02.01.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 May 2022 02:01:50 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v5 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Mon,  9 May 2022 12:01:48 +0300
Message-Id: <20220509090148.4141020-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
References: <20220509090059.4140941-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unify all exported PLL clock configuration functions and data structures
as GPL symbols.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v3 to v5:
* none.

Changes from v2 to v3:
* added Bjorn's reviewed-by tag

 drivers/clk/qcom/clk-alpha-pll.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/qcom/clk-alpha-pll.c b/drivers/clk/qcom/clk-alpha-pll.c
index 288692f0ea39..47879ee5a677 100644
--- a/drivers/clk/qcom/clk-alpha-pll.c
+++ b/drivers/clk/qcom/clk-alpha-pll.c
@@ -1823,7 +1823,7 @@ const struct clk_ops clk_alpha_pll_lucid_5lpe_ops = {
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = alpha_pll_lucid_5lpe_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_lucid_5lpe_ops);
 
 const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
 	.enable = alpha_pll_lucid_5lpe_enable,
@@ -1832,14 +1832,14 @@ const struct clk_ops clk_alpha_pll_fixed_lucid_5lpe_ops = {
 	.recalc_rate = clk_trion_pll_recalc_rate,
 	.round_rate = clk_alpha_pll_round_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_fixed_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_fixed_lucid_5lpe_ops);
 
 const struct clk_ops clk_alpha_pll_postdiv_lucid_5lpe_ops = {
 	.recalc_rate = clk_alpha_pll_postdiv_fabia_recalc_rate,
 	.round_rate = clk_alpha_pll_postdiv_fabia_round_rate,
 	.set_rate = clk_lucid_5lpe_pll_postdiv_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_postdiv_lucid_5lpe_ops);
 
 void clk_zonda_pll_configure(struct clk_alpha_pll *pll, struct regmap *regmap,
 			     const struct alpha_pll_config *config)
@@ -1992,7 +1992,7 @@ const struct clk_ops clk_alpha_pll_zonda_ops = {
 	.round_rate = clk_alpha_pll_round_rate,
 	.set_rate = clk_zonda_pll_set_rate,
 };
-EXPORT_SYMBOL(clk_alpha_pll_zonda_ops);
+EXPORT_SYMBOL_GPL(clk_alpha_pll_zonda_ops);
 
 static int alpha_pll_lucid_evo_enable(struct clk_hw *hw)
 {
-- 
2.33.0

