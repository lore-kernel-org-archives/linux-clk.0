Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49D24C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  2 Feb 2022 13:49:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344442AbiBBNtl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Feb 2022 08:49:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344452AbiBBNtl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Feb 2022 08:49:41 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6634C06173B
        for <linux-clk@vger.kernel.org>; Wed,  2 Feb 2022 05:49:40 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id s2-20020a17090ad48200b001b501977b23so6918710pju.2
        for <linux-clk@vger.kernel.org>; Wed, 02 Feb 2022 05:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AhwOTUu+Yd20QptHanrLUKzOx+jJe492GmL7ESL7vr4=;
        b=LNILHH+++jRLvWWQTkAQWqu97BJ7NWdeEpf3QQ/Nb02vGJIVrh4kamufWLTcQPTKPZ
         tDl3V7uaE75cuttLOlBPJkFDDrsRxIpcQvVmwsAUh/f/1nQcJkX867/Q0fy8qX2K9GEi
         dZwIOjBOZKpxDGxaALbpSKXrQ8vpOij/GCYTY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AhwOTUu+Yd20QptHanrLUKzOx+jJe492GmL7ESL7vr4=;
        b=GbmaX6kwt2TX+b/439J2Br3Y8qKhyvqkoYT1B4FeHLGLZQlEZha/XBgqq5m2AFs1Ur
         F+K2JnzUF4rt542kdkRDH48f24KeD/HHPmnYgXoXmr2p+MSSVc6yAVpViv5BAmsKa8/6
         ld7xQ3i9Tuixxb2ZWBd2ELJaYoI2R98l1DA9WmZciCWtMHrovv//MmDj9361Cn0IgpXY
         O+7tOz2HIUnN0CjC8MKlEihfI/TsyA3VQrerdgVe7c+pnCOwSqZ9jkX4nh/wkOw8kRyT
         G7FS8cJP4E1GNffElfws6O3gx+kv5VevAncQLqjg7gRIADjGObn5Vip1jMzMdnJwUYI1
         OWvQ==
X-Gm-Message-State: AOAM531vgiu5bvBJwHjs5iU1nEwxfOD58xk1l3Ev+oLoQHFaS8nxRlVM
        OcUTxrf3pVoNdOx2mh0V4o4/KQ==
X-Google-Smtp-Source: ABdhPJzEyx+/Bw2d/SVDspKOv5Ko/HfJV+vTaXfMFR6X4ILc47iPMqAsQ7piF3VBEKt9W04apdGYOQ==
X-Received: by 2002:a17:903:2352:: with SMTP id c18mr30838789plh.104.1643809780396;
        Wed, 02 Feb 2022 05:49:40 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:78b5:214c:c81:b9aa])
        by smtp.gmail.com with ESMTPSA id w19sm27335684pfu.47.2022.02.02.05.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Feb 2022 05:49:40 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        Miles Chen <miles.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 01/31] clk: mediatek: Use %pe to print errors
Date:   Wed,  2 Feb 2022 21:48:04 +0800
Message-Id: <20220202134834.690675-2-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc2.247.g8bbb082509-goog
In-Reply-To: <20220202134834.690675-1-wenst@chromium.org>
References: <20220202134834.690675-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

If %pe is used to print errors, a string representation of the error
would be printed instead of a number as with %ld. Also, all the sites
printing errors are deriving the error code from a pointer. Using %pe
is more straightforward.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Miles Chen <miles.chen@mediatek.com>
---
 drivers/clk/mediatek/clk-apmixed.c |  2 +-
 drivers/clk/mediatek/clk-cpumux.c  |  6 ++----
 drivers/clk/mediatek/clk-mtk.c     | 18 ++++++------------
 drivers/clk/mediatek/clk-mux.c     |  6 ++----
 drivers/clk/mediatek/clk-pll.c     |  3 +--
 drivers/clk/mediatek/reset.c       |  3 +--
 6 files changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
index caa9119413f1..a29339cc26c4 100644
--- a/drivers/clk/mediatek/clk-apmixed.c
+++ b/drivers/clk/mediatek/clk-apmixed.c
@@ -92,7 +92,7 @@ struct clk * __init mtk_clk_register_ref2usb_tx(const char *name,
 	clk = clk_register(NULL, &tx->hw);
 
 	if (IS_ERR(clk)) {
-		pr_err("Failed to register clk %s: %ld\n", name, PTR_ERR(clk));
+		pr_err("Failed to register clk %s: %pe\n", name, clk);
 		kfree(tx);
 	}
 
diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
index e188018bc906..cab5095416b6 100644
--- a/drivers/clk/mediatek/clk-cpumux.c
+++ b/drivers/clk/mediatek/clk-cpumux.c
@@ -87,8 +87,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 
 	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %ld\n", node,
-		       PTR_ERR(regmap));
+		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
 		return PTR_ERR(regmap);
 	}
 
@@ -97,8 +96,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
 
 		clk = mtk_clk_register_cpumux(mux, regmap);
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-			       mux->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
 			continue;
 		}
 
diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
index 8d5791b3f460..519a461cbb6f 100644
--- a/drivers/clk/mediatek/clk-mtk.c
+++ b/drivers/clk/mediatek/clk-mtk.c
@@ -70,8 +70,7 @@ void mtk_clk_register_fixed_clks(const struct mtk_fixed_clk *clks,
 					      rc->rate);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					rc->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", rc->name, clk);
 			continue;
 		}
 
@@ -97,8 +96,7 @@ void mtk_clk_register_factors(const struct mtk_fixed_factor *clks,
 				CLK_SET_RATE_PARENT, ff->mult, ff->div);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					ff->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", ff->name, clk);
 			continue;
 		}
 
@@ -122,8 +120,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 
 	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %ld\n", node,
-				PTR_ERR(regmap));
+		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
 		return PTR_ERR(regmap);
 	}
 
@@ -141,8 +138,7 @@ int mtk_clk_register_gates_with_dev(struct device_node *node,
 				gate->shift, gate->ops, gate->flags, dev);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					gate->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", gate->name, clk);
 			continue;
 		}
 
@@ -264,8 +260,7 @@ void mtk_clk_register_composites(const struct mtk_composite *mcs,
 		clk = mtk_clk_register_composite(mc, base, lock);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					mc->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", mc->name, clk);
 			continue;
 		}
 
@@ -293,8 +288,7 @@ void mtk_clk_register_dividers(const struct mtk_clk_divider *mcds,
 			mcd->div_width, mcd->clk_divider_flags, lock);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-				mcd->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", mcd->name, clk);
 			continue;
 		}
 
diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
index 6d3a50eb7d6f..89f23e111d91 100644
--- a/drivers/clk/mediatek/clk-mux.c
+++ b/drivers/clk/mediatek/clk-mux.c
@@ -175,8 +175,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 
 	regmap = device_node_to_regmap(node);
 	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %ld\n", node,
-		       PTR_ERR(regmap));
+		pr_err("Cannot find regmap for %pOF: %pe\n", node, regmap);
 		return PTR_ERR(regmap);
 	}
 
@@ -187,8 +186,7 @@ int mtk_clk_register_muxes(const struct mtk_mux *muxes,
 			clk = mtk_clk_register_mux(mux, regmap, lock);
 
 			if (IS_ERR(clk)) {
-				pr_err("Failed to register clk %s: %ld\n",
-				       mux->name, PTR_ERR(clk));
+				pr_err("Failed to register clk %s: %pe\n", mux->name, clk);
 				continue;
 			}
 
diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 60d7ffa0b924..f04f724e12e5 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -378,8 +378,7 @@ void mtk_clk_register_plls(struct device_node *node,
 		clk = mtk_clk_register_pll(pll, base);
 
 		if (IS_ERR(clk)) {
-			pr_err("Failed to register clk %s: %ld\n",
-					pll->name, PTR_ERR(clk));
+			pr_err("Failed to register clk %s: %pe\n", pll->name, clk);
 			continue;
 		}
 
diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
index ffe464ce7ff8..bcec4b89f449 100644
--- a/drivers/clk/mediatek/reset.c
+++ b/drivers/clk/mediatek/reset.c
@@ -100,8 +100,7 @@ static void mtk_register_reset_controller_common(struct device_node *np,
 
 	regmap = device_node_to_regmap(np);
 	if (IS_ERR(regmap)) {
-		pr_err("Cannot find regmap for %pOF: %ld\n", np,
-				PTR_ERR(regmap));
+		pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
 		return;
 	}
 
-- 
2.35.0.rc2.247.g8bbb082509-goog

