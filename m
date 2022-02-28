Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B683BC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 12:03:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234241AbiB1MEX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 07:04:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236102AbiB1MEW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 07:04:22 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 912BF1CB24
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:40 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so21059316lfb.0
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 04:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qq9dTW6gbLY/ve5ehTRpDEnNxOPOXDUjIljMGUur/vM=;
        b=aN/fbfvJYkMaQ6JZsaQplTCNBbqYo/36NQ1agdTDibMAY9McVKtjS4P2feFAtBg6ko
         o2+1FTh/60giuzyFw+f7pr6/XVul/fmtHyOb+dh39T6cVetTqx/vV/eh833MLGU26EIj
         yZMyCYb/gW88BpWIqjHKWn3ZkCfAlcvNt6VaaJT6rajeJjN1lWQtRBtiyiMMcCscYClW
         it313JJX/COllsAesyCOwpZO5fRVvsIHrQzCCCK1sYFjaPcC1hMjX4EOdhmHTD1bIM9t
         tASbS3tOWTqYh0+7+ZG9BYjywO+2GEgvMJ/xeXlVLIF86ouxWpG1pMMDKiIkl8lLdKNW
         kgOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qq9dTW6gbLY/ve5ehTRpDEnNxOPOXDUjIljMGUur/vM=;
        b=hkTAqaZpe9xH+NGaM8M2X3ogczakidb7nFkq1dw/2xNj4HOXaWreyyXOalPF1grEy1
         1op9lmvepK+u56sGrDVWWIVfffJBbFKumTjApYNPEXqLH5jVGXVphtBXOnFDaOsbg8aC
         M5slT0qQS2dFXEdX1OKvKUXNZF0YdbOqzzwAUme8CIXUlz0GHWABtQo+OWqPGDYpQnnd
         Qi+469k2VKU+nhzXrUjRaE+Eme2Smz3awcsnAy8SoNAtapxz/rLlT5ZtH52WY/dIbYyc
         YjkYYe+xCYT4QHJHRR1bjVeotzH4GIsfNFc4uExojYSD/CL5FmUpb2TIt1EPALw3Pa4o
         jqHg==
X-Gm-Message-State: AOAM532T6huSubx4vVk9V2GqUh6SE2AeU4gWXOu25rimra4GUFFw/AYK
        MF3D9I1BZ8Ro5noI3BHYYDdeuA==
X-Google-Smtp-Source: ABdhPJzDzsXT3v6dRlixV+zSbvGbPhlqakW8MzcoPsYwLdv+t1kIvHsN654An7b6c+N1KHIuvxBz4w==
X-Received: by 2002:ac2:5963:0:b0:442:eff6:4219 with SMTP id h3-20020ac25963000000b00442eff64219mr12520251lfp.56.1646049818978;
        Mon, 28 Feb 2022 04:03:38 -0800 (PST)
Received: from localhost.localdomain (88-113-46-102.elisa-laajakaista.fi. [88.113.46.102])
        by smtp.gmail.com with ESMTPSA id g23-20020ac24d97000000b004433c8459a6sm928146lfe.157.2022.02.28.04.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 04:03:38 -0800 (PST)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 4/8] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Mon, 28 Feb 2022 14:03:37 +0200
Message-Id: <20220228120337.997079-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
References: <20220228120258.997027-1-vladimir.zapolskiy@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Unify all exported PLL clock configuration functions and data structures
as GPL symbols.

Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
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

