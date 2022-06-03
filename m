Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC731CCA480
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jun 2022 08:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237349AbiFCIBK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jun 2022 04:01:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239936AbiFCIBH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jun 2022 04:01:07 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47F193630B
        for <linux-clk@vger.kernel.org>; Fri,  3 Jun 2022 01:01:02 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id a15so11392537lfb.9
        for <linux-clk@vger.kernel.org>; Fri, 03 Jun 2022 01:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IZl7paYkTKo4fY2sp2imSp5yjmN9MMo/zuQtzAijVqw=;
        b=yn2zvRyzuK29pP7fUjVVwwEoBNuCcN7OWLocHsjIe5KRvWj4ZM+KE1Tq8SRcmkQnnf
         6XbOQCt+h1xJEFUXOZwK1hFnur5mknEVSA6VFSq3xavu1PcLeZAl2ZEhehR09OH1sQNh
         IDWKxflA1K5J3agI5UnP0IFuPAOAcAEQwj0PMCXiTFN5Zb0LMIiwE1PMp9b9iQOfGXiO
         LZe2tb7cZKjj7z/94Ek5mdoDQYRGWSERuEgfcO0OPN701DliULsgi3Ac1U4aEViZH/He
         oBRFTsyAR52wPLdist5W8pltsINXedT7oJMb5RBvFvrRw3Sw5C9A6F0+HB8UI020aS3Z
         4tMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IZl7paYkTKo4fY2sp2imSp5yjmN9MMo/zuQtzAijVqw=;
        b=Bxg3vAdGkIDGxDCNtus15U32RjFG4VLp3w6b59F9iqR1zGOjkjVRx1FlgbHVn9dB7y
         yWIFOtOVbL/rl96UN01ImV2gllPql8fXCtLmfzGR3Oy/ig4ePTzEnaeeuYvtf8RFUJtS
         APS4rkXhwyGtEfT5fecJh5g45Wp7GxuQZ1fA2aifL8AURzggkb8ciTGi0Z/BzzxGYKzG
         +tm7W5OMrDfz5GfV8feVNy5hOHLyL1q3iYRkeGhfdxk0Cbz15RfjYisB0uiGPydXgaTD
         Vbn+/JDVEWFQTq4vemRVqNIJUi96IZUOn09RjDmbdamorW3FJYR1GQssPDJcbI0bbtS1
         H5Bw==
X-Gm-Message-State: AOAM532h7RNpEagufNQYXLYA7sGF955Lv+ywIfhz0SZ5Uw34RYOssmR4
        p4lCqj8XABg+SJVrO9YrWWwghA==
X-Google-Smtp-Source: ABdhPJyTuHP0IDJnYRoxDkGQV6XbjTo1LwiWBagYZBYYYs4JYEgRQBkaG0GNRszbqrFy2xuq2tbvbQ==
X-Received: by 2002:a05:6512:1319:b0:44a:c200:61e5 with SMTP id x25-20020a056512131900b0044ac20061e5mr6155361lfu.550.1654243261441;
        Fri, 03 Jun 2022 01:01:01 -0700 (PDT)
Received: from localhost.localdomain (88-112-131-206.elisa-laajakaista.fi. [88.112.131.206])
        by smtp.gmail.com with ESMTPSA id d23-20020ac244d7000000b00477c1172063sm1446439lfm.165.2022.06.03.01.01.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 01:01:01 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v6 4/7] clk: qcom: clk-alpha-pll: limit exported symbols to GPL licensed code
Date:   Fri,  3 Jun 2022 11:00:58 +0300
Message-Id: <20220603080058.2251809-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
References: <20220603080019.2251764-1-vladimir.zapolskiy@linaro.org>
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
Changes from v3 to v6:
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

