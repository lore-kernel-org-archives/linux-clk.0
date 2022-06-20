Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CEFC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 08:05:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238339AbiFTIFJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 04:05:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237663AbiFTIFI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 04:05:08 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DEDF0C
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:05:07 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a13so6097706lfr.10
        for <linux-clk@vger.kernel.org>; Mon, 20 Jun 2022 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bE48RbRziw6wh6f5dFGSQa/Uf6Ukc2JO5uYeJgs1cWs=;
        b=K8y9ZTfMsDIMABKhnvNbS+HCun1oCfFgMzuKsKL3F+uhWMW6rlw3QvmG0i/JQhJYLh
         4V9jTqgKF/dCUQb0s1lCatRws3wQmk0LtkKthHyJ22wP1zPGkth4ZgF68tQLPpg2odqd
         C6IjaSkdkEvp1cXWKrJh64g2PJt1QNtButWQZo/YDyjM2e/SvuruA0oAWU8zMbdMJpxN
         6uKmW6PbJgSFuyQiHFeVfM7iHVpjTqXNCL71BSx7DC1aGEMDW0MVbXivnvpWrQa6CQlM
         wZnq4eps5dGnO6oJH7h9pEfNvJaoT4RVoVq3xVYBMZ2PohpzdxkZ2hxHbPxkxAcgXB4E
         Tx/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bE48RbRziw6wh6f5dFGSQa/Uf6Ukc2JO5uYeJgs1cWs=;
        b=Sc2mkMdS4hpunjce6VqkpugD9bXDZ8mNgP27PfgrLvUt0ZoADblrz0enJB9YVB/TCC
         Yxq5Exx0hcB+ZWgDozRX3sgqsoHG1CqsQkodKagZsSYhhx06n7ybcEPhfTscDGg8YvYB
         vSw6g6WBZyXvBPrvR3S9ArneL+9KKzMz+uIuWikevGFRbo41CP+X8MSZi/cP+zT2RP7W
         PKChF9dAB82scLxfnPjpOPTo9QGsxIHq2znkQ4kN9gXsLN0U/Ka8w26vizRfvFKLB9hF
         m+XckqZmvcEFowSrcc6fQnIbQNH+kznaRWTN1TLhGfat0qAGWm2Nb7EvTdNaF40VODYZ
         Z4Og==
X-Gm-Message-State: AJIora91avI/w3VM6QuPltjpi1U9j0+oGEiZWp6EX261RC1J1Ba8j8OB
        PWgw/phrJsI55IM7tCQ4T9BldPsFHdId8CNR
X-Google-Smtp-Source: AGRyM1u7EeQRYIZa5WGY9+0pF5xUtgsrvjnXSzgboqVIi7X/ft8Hfjty3ErYOHEMofjKK/9zFdl5nw==
X-Received: by 2002:a05:6512:2282:b0:479:7a60:5e16 with SMTP id f2-20020a056512228200b004797a605e16mr13005397lfu.101.1655712306161;
        Mon, 20 Jun 2022 01:05:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j10-20020a056512344a00b0047939239567sm1668706lfr.240.2022.06.20.01.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jun 2022 01:05:05 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <quic_tdas@quicinc.com>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH] clk: qcom: gcc-msm8994: use parent_hws for gpll0/4
Date:   Mon, 20 Jun 2022 11:05:05 +0300
Message-Id: <20220620080505.1573948-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use parent_hws for two remaining clocks in gcc-msm8994 that used
parent_names.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/clk/qcom/gcc-msm8994.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/gcc-msm8994.c b/drivers/clk/qcom/gcc-msm8994.c
index 6b702cdacbf2..0f52c48e89d8 100644
--- a/drivers/clk/qcom/gcc-msm8994.c
+++ b/drivers/clk/qcom/gcc-msm8994.c
@@ -52,7 +52,9 @@ static struct clk_alpha_pll_postdiv gpll0 = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll0",
-		.parent_names = (const char *[]) { "gpll0_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll0_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 	},
@@ -81,7 +83,9 @@ static struct clk_alpha_pll_postdiv gpll4 = {
 	.regs = clk_alpha_pll_regs[CLK_ALPHA_PLL_TYPE_DEFAULT],
 	.clkr.hw.init = &(struct clk_init_data){
 		.name = "gpll4",
-		.parent_names = (const char *[]) { "gpll4_early" },
+		.parent_hws = (const struct clk_hw*[]){
+			&gpll4_early.clkr.hw
+		},
 		.num_parents = 1,
 		.ops = &clk_alpha_pll_postdiv_ops,
 	},
-- 
2.35.1

