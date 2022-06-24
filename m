Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2A1C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jun 2022 12:00:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbiFXMAI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jun 2022 08:00:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbiFXMAG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jun 2022 08:00:06 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D09926F7A3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 05:00:04 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id j21so4121033lfe.1
        for <linux-clk@vger.kernel.org>; Fri, 24 Jun 2022 05:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=plNiI3oDyZpIsvYGpGc4Tdhg6uL7UgysJCNMjlKgt1M=;
        b=IM2iMgjiXxWFNsgQw2qKPTv8ufgAdmFi6Ln+XfYcY764c30jwyZRgt0E8LVLNs22om
         5OxmJEgrQziwg5HkOnC8AGIeo7z82c5zGOvWAnaReeuFNNJdk9k9OWM9ygutwK7VV8bJ
         b3XvoPRssZwNHp59iGfytf/burTf7MFMHHqJkAf3xBpRZyCSiZBS1tZPN39trgcjYq25
         DLD3vnN86rLGFa7k4BMSZMf00GnmPiYQ8cn7e2i2Narv1GbE7Z9eJKKf99ionlXTtNQs
         xQlQny6qRkE1ucQlBkSKSy/xva5cWvXeDpTVjyRAgikdjtXuyxjAuhAdPDpLKXo80aqd
         NHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=plNiI3oDyZpIsvYGpGc4Tdhg6uL7UgysJCNMjlKgt1M=;
        b=dVjip8b8rEeEPtDiA8dErLKVOa4D4wi7vBsAupOFwRYKixk87Skifhx9MPK2fX8zPw
         h1taf3GfSWOUz9Xta3Jz2tFGRhJdgrSUF0v0cPnGBGGQsli4mVkjLAWMJE1X+IHWzZLz
         1MEe4782T5Ko+3NtAIuu2LU5o8MxFFTq2nbaNaupfXwTa7VLRisE86oCdMEIHXEJleJF
         8JV3OrBmwfVk1ffJObTY8um1uo/I8kZ42k3SQyqd4fW3hwmtA1Z/QzjvEA6rtNe+hgrA
         uFjDpxKkD+oIC4w8j3JZxoJA3IBtCADeD4tkLFVLcoMtfHdsBSe6tfxGbNJea/IAnLym
         UWnw==
X-Gm-Message-State: AJIora9qfs11yWUcAxkfzLxPUukRQXsZs6ZoQ+7AC+xvLa0RHGAIIYbU
        WA8qDybtupbeyHydIWHDHZ8hvA==
X-Google-Smtp-Source: AGRyM1sFd/enWUXANLahy73Rdv94cXBJRg70QBVoRtxrTpKLIC2gfQGiLkyRItqB37Nn1s6E4eCtQw==
X-Received: by 2002:a05:6512:22c1:b0:479:54b6:8281 with SMTP id g1-20020a05651222c100b0047954b68281mr8925063lfu.291.1656072003143;
        Fri, 24 Jun 2022 05:00:03 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id 11-20020a05651c128b00b0025a67779931sm262869ljc.57.2022.06.24.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 05:00:02 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v8 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Fri, 24 Jun 2022 14:59:59 +0300
Message-Id: <20220624115959.2524911-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
References: <20220624115917.2524868-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unify all exported PLL clock configuration functions and data structures
as GPL symbols.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
Changes from v7 to v8:
* added Stephen's tag.

Changes from v3 to v7:
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

