Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22DDCC433FE
	for <linux-clk@archiver.kernel.org>; Tue,  8 Feb 2022 13:17:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233761AbiBHNRF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 8 Feb 2022 08:17:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359151AbiBHMl5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 8 Feb 2022 07:41:57 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D192C03FECA
        for <linux-clk@vger.kernel.org>; Tue,  8 Feb 2022 04:41:56 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id i186so18704639pfe.0
        for <linux-clk@vger.kernel.org>; Tue, 08 Feb 2022 04:41:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0/UlhVOdAnU6SizqlzMjYxwU3c7ZqzxGr+vvCSOLKss=;
        b=Dt9AfISg1ZkV2/kJIuMU7nn3K/UEJs+AGGZj8+C5VXuJC8f63RU3oHLEdy9b8qg0Fg
         OIZGnUKyWeUx7BNKIzEk6KZpYCY/PaEfTafdqxdOo7NYXsCiZYdqCw2lTVTBCRUEluFk
         YpenvdzYfy2uJ64eQm34eHRCyq8MUrHb39Fz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0/UlhVOdAnU6SizqlzMjYxwU3c7ZqzxGr+vvCSOLKss=;
        b=RbiNTWMGbcP5hl18Po0tVyS4EY5o6ajmIA09b3e6Fllb41Y+6ht+vAyg98GHLAVrMX
         pwVtWVO+gf6GLGaMlqARV067lVKwvTy+2TXLg3C6U8ZWz44FGSVNjhwHLaBqQp0zk/kK
         W6tu9AGKjzhX7qrjeJ+SJ8+9f9aCFOMzrvUFOw7pIDHksNJSk3ud4zxvlWRSkimY8/bg
         iM23/UhKnbbw139IEsGt7AGCsmMWGtpwMs7xDxVN6iRDCxh4HtomTeO9GTyBKtqqGO6X
         nPQe5an8PElkrnlWjyMsDzXzJOxWJszupLtgnw6pQLKipP1+euxLjiiJFsVaQzq1bBHC
         NEWQ==
X-Gm-Message-State: AOAM5321CHOvWXQAvYvuZM0ry2yeUNmIh03ybztqdwvKlbtOWhh36nll
        ATV42BUrUK/wgd/dygOF5SNgPg==
X-Google-Smtp-Source: ABdhPJwhJLcvpb8S62B7N3C1BWrhd9hXr0mGHQTU2r1oJfFvkqMkkgu1//UJNeCPWx6z8TnlXiIHUA==
X-Received: by 2002:aa7:8bcf:: with SMTP id s15mr4185498pfd.16.1644324115911;
        Tue, 08 Feb 2022 04:41:55 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:41b6:813e:c823:609c])
        by smtp.gmail.com with ESMTPSA id h11sm15056939pfe.214.2022.02.08.04.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Feb 2022 04:41:55 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 31/31] clk: mediatek: Warn if clk IDs are duplicated
Date:   Tue,  8 Feb 2022 20:40:34 +0800
Message-Id: <20220208124034.414635-32-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.263.gb82422642f-goog
In-Reply-To: <20220208124034.414635-1-wenst@chromium.org>
References: <20220208124034.414635-1-wenst@chromium.org>
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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
2.35.0.263.gb82422642f-goog

