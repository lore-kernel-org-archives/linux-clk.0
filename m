Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46E33C4332F
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:51:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344686AbiBBNvD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:51:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344684AbiBBNuy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:50:54 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16322C0613E5
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:50:41 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id b15so18316943plg.3
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DcodRynrZT4K1y4jFzGbVCT5AiqDNSLFELqoGf2FUNM=;
        b=iIh9m3/8GG896qPnlmsQHULgkIHYDJcdsWz+nMJrvSJew/rLC3HQRQflstPh10xlAg
         dhP4UV0Zb63srMjtRR2v/nFrif8CIVfmRsy0a6+ObfGGx/gdIM+PYAAKglJ050u9A+Lu
         Sbu6o6Ob59qEGUExWBcJRttXXVb/TNfPjbQPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DcodRynrZT4K1y4jFzGbVCT5AiqDNSLFELqoGf2FUNM=;
        b=ZlmHmy60Nza9Lfb2Uikd8InfkVq16DyWm3j4ecl2ggB+xijq5kJ34laz2ggoEhKr10
         LfKd0VC3lcOE/Z3q1LJ+O9XS3eqssbSvw5GUa+YCiNrhrVpgP8D+FGe0waxh2xmO0NmW
         3oNbJeQe9IMES9QSKM3oPCxsKeT0JyXHP8sJrx/j8D9Def9+jvygvKxs5XbUdoRSdm9F
         Q8afq77lKRJcO70g2FVEJprM/NDvoNJQra7mJv6BVrJylKYJgdfzEpLPeR1K0VBg/uaL
         ErwAwltiWYeg6CMimXF1CIsjhrKa9bxQlsUZe9eacrDx+3VpejaCJj1YugjShpWOWxPX
         eGHA==
X-Gm-Message-State: AOAM532CEdxHjSkfpps/bpU9JMd6c4QUimU+sk9ps/naFiw8jqzCVxoC
        1ceH4+b5/bonhvRZzWsBX4kLQg==
X-Google-Smtp-Source: ABdhPJxUF7/m48cLrDNij/awsAkaEf+fHj9Xq5ZY2PYGHzKoDTTstU5XgjxnLPMvsSdd4WIDdcInHw==
X-Received: by 2002:a17:90b:f10:: with SMTP id br16mr8206870pjb.57.1643809840655;
        Wed, 02 Feb 2022 05:50:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:50:40 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 31/31] clk: mediatek: Warn if clk IDs are duplicated
Date:   Wed,  2 Feb 2022 21:48:34 +0800
Message-Id: <20220202134834.690675-32-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The Mediatek clk driver library handles duplicate clock IDs in two
different ways: either ignoring the duplicate entry, or overwriting
the old clk. Either way may cause unexpected behavior, and the latter
also causes an orphan clk that cannot be cleaned up.

Align the behavior so that later duplicate entries are ignored, and
a warning printed. The warning will also aid in making the issue
noticeable.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-cpumux.c |  6 ++++++
 drivers/clk/mediatek/clk-gate.c   |  5 ++++-
 drivers/clk/mediatek/clk-mtk.c    | 18 ++++++++++++++----
 drivers/clk/mediatek/clk-mux.c    |  5 ++++-
 drivers/clk/mediatek/clk-pll.c    |  6 ++++++
 5 files changed, 34 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index 499c60432280..c11b3fae622e 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -120,6 +120,12 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 	for (i = 0; i < num; i++) {
 		const struct mtk_composite *mux = &clks[i];
 
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
+				node, mux->id);
+			continue;
+		}
+
 		clk = mtk_clk_register_cpumux(mux, regmap);
 		if (IS_ERR(clk)) {
 			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
diff --git a/drivers/clk/mediatek/clk-gate.c b/drivers/clk/mediatek/clk-gate.c
index 631ff170b7b9..da52023f8455 100644
--- a/drivers/clk/mediatek/clk-gate.c
+++ b/drivers/clk/mediatek/clk-gate.c
@@ -224,8 +224,11 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 	for (i = 0; i < num; i++) {
 		const struct mtk_gate *gate = &clks[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[gate->id])) {
+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
+				node, gate->id);
 			continue;
+		}
 
 		clk = mtk_clk_register_gate(gate->name, gate->parent_name,
 					    regmap,
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 0e027be0d5fc..b4063261cf56 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -65,8 +65,10 @@ int mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_clk *rc = &clks[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[rc->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n", rc->id);
 			continue;
+		}
 
 		clk = clk_register_fixed_rate(NULL, rc->name, rc->parent, 0,
 					      rc->rate);
@@ -128,8 +130,10 @@ int mtk_clk_register_factors(const struct mtk_fixed_factor *clks, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_fixed_factor *ff = &clks[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[ff->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n", ff->id);
 			continue;
+		}
 
 		clk = clk_register_fixed_factor(NULL, ff->name, ff->parent_name,
 				CLK_SET_RATE_PARENT, ff->mult, ff->div);
@@ -305,8 +309,11 @@ int mtk_clk_register_composites(const struct mtk_composite *mcs, int num,
 	for (i = 0; i < num; i++) {
 		const struct mtk_composite *mc = &mcs[i];
 
-		if (clk_data && !IS_ERR_OR_NULL(clk_data->clks[mc->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[mc->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n",
+				mc->id);
 			continue;
+		}
 
 		clk = mtk_clk_register_composite(mc, base, lock);
 
@@ -368,8 +375,11 @@ int mtk_clk_register_dividers(const struct mtk_clk_divider *mcds, int num,
 	for (i = 0; i <  num; i++) {
 		const struct mtk_clk_divider *mcd = &mcds[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[mcd->id])) {
+			pr_warn("Trying to register duplicate clock ID: %d\n",
+				mcd->id);
 			continue;
+		}
 
 		clk = clk_register_divider(NULL, mcd->name, mcd->parent_name,
 			mcd->flags, base +  mcd->div_reg, mcd->div_shift,
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index f51e67650f03..21ad5a4afd65 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -208,8 +208,11 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 	for (i = 0; i < num; i++) {
 		const struct mtk_mux *mux = &muxes[i];
 
-		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id]))
+		if (!IS_ERR_OR_NULL(clk_data->clks[mux->id])) {
+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
+				node, mux->id);
 			continue;
+		}
 
 		clk = mtk_clk_register_mux(mux, regmap, lock);
 
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 817a80293bfc..ccaa2085ab4d 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -394,6 +394,12 @@ int mtk_clk_register_plls(struct device_node *node,
 	for (i = 0; i < num_plls; i++) {
 		const struct mtk_pll_data *pll = &plls[i];
 
+		if (!IS_ERR_OR_NULL(clk_data->clks[pll->id])) {
+			pr_warn("%pOF: Trying to register duplicate clock ID: %d\n",
+				node, pll->id);
+			continue;
+		}
+
 		clk = mtk_clk_register_pll(pll, base);
 
 		if (IS_ERR(clk)) {
-- 
2.35.0.rc2.247.g8bbb082509-goog

