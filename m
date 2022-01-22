Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37BE7C433FE
	for <linux-clk@archiver.kernel.org>; Sat, 22 Jan 2022 09:17:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233953AbiAVJRu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 22 Jan 2022 04:17:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233959AbiAVJRr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 22 Jan 2022 04:17:47 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F23DC06173B
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:17:47 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id s61-20020a17090a69c300b001b4d0427ea2so15446083pjj.4
        for <linux-clk@vger.kernel.org>; Sat, 22 Jan 2022 01:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cKhWG1UlZ1wmUfPV0n39xCAO+4j4+uvVlQIR68vv/e4=;
        b=DykrC2EFeANQsQVnVW4/ohuox0aeS5K+ZzQ1uNXadn0yUKbkohFjVmkJyce7NXleiV
         3YiJS4JglUP6TPz9Kh+yPXtyBt1Q8SaCr+tiHYvM+i0i+8BMGzrzE4HJy/Bmlu2NLAtl
         JzKF8/zsI3047BtH7bx5csKm1PrYyylE3FzPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cKhWG1UlZ1wmUfPV0n39xCAO+4j4+uvVlQIR68vv/e4=;
        b=nQ4WQ9tsgcb0ML55o7v0Jgl0TLm671bLODUu4wMnxSR/BpgKZOX3XvWsEOFV+rkhOt
         40vcILUf50Ix2Tiz/RSwjxRas4QHmvthaOoPmNELhXh1Aq2dMnwi9Ui9xOF1qyB6vOiw
         HlR80JuUnhnVekAbVtoVjw05QZ0vUpjqaRXdzjvL4KRjxRA/CM3Hotvl15IrHLJeSg1f
         Hi5CPH1n3cKojFMUrmPI8BFY31QunOO+lrWF/HdSzdYVuCcPScdrsDM00LMrKaZEnG+w
         XUeYBdtVYw+MRFYO6rlfrRts07VFCNWvHEW8FCxBkd3pB/YVkVISzjtOrCXjlNqsu/+b
         9UjA==
X-Gm-Message-State: AOAM5319WpVFABJL8j1JJfmQ4dFz86iR85LuaDCKabrlOOFsJlsmeFZH
        45VjtGp/EYhqS6PK/mpHm8KVpw==
X-Google-Smtp-Source: ABdhPJwsOZbFGXu/nP9ymuPfgGkL2eYRhlwXkc/6m/4AM7H2Snn11NfFQ3CnBQ/MwQdKOi6J4JuWOw==
X-Received: by 2002:a17:902:7c93:b0:14a:ec87:5044 with SMTP id y19-20020a1709027c9300b0014aec875044mr7118525pll.31.1642843066874;
        Sat, 22 Jan 2022 01:17:46 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:349f:9373:45d9:eb26])
        by smtp.gmail.com with ESMTPSA id s1sm1608100pjn.42.2022.01.22.01.17.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 22 Jan 2022 01:17:46 -0800 (PST)
From:   Chen-Yu Tsai <wenst@chromium.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Matthias Brugger <matthias.bgg@gmail.com>
Cc:     Chen-Yu Tsai <wenst@chromium.org>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 01/31] clk: mediatek: Use %pe to print errors
Date:   Sat, 22 Jan 2022 17:17:01 +0800
Message-Id: <20220122091731.283592-2-wenst@chromium.org>
X-Mailer: git-send-email 2.35.0.rc0.227.g00780c9af4-goog
In-Reply-To: <20220122091731.283592-1-wenst@chromium.org>
References: <20220122091731.283592-1-wenst@chromium.org>
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
2.35.0.rc0.227.g00780c9af4-goog

