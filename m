Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8DBC433B4
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6281461041
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232941AbhDHS6A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 14:58:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhDHS6A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Apr 2021 14:58:00 -0400
Received: from mail-out.m-online.net (mail-out.m-online.net [IPv6:2001:a60:0:28:0:1:25:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A3E4C061760
        for <linux-clk@vger.kernel.org>; Thu,  8 Apr 2021 11:57:48 -0700 (PDT)
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4FGVrV6BKcz1s1JW;
        Thu,  8 Apr 2021 20:57:46 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4FGVrV55gFz1sP6L;
        Thu,  8 Apr 2021 20:57:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id LiaVNAZLBKFU; Thu,  8 Apr 2021 20:57:45 +0200 (CEST)
X-Auth-Info: mKSswWMJwBizmZOvUfcTfxruhPUJhso+JrJkQB+c8pk=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  8 Apr 2021 20:57:44 +0200 (CEST)
From:   Marek Vasut <marex@denx.de>
To:     linux-arm-kernel@lists.infradead.org
Cc:     Marek Vasut <marex@denx.de>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Patrick Delaunay <patrick.delaunay@foss.st.com>,
        Stephen Boyd <swboyd@chromium.org>, linux-clk@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 2/7] clk: stm32mp1: The dev is always NULL, replace it with np
Date:   Thu,  8 Apr 2021 20:57:26 +0200
Message-Id: <20210408185731.135511-3-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
References: <20210408185731.135511-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Instead of passing around $dev to all the registration functions, which
is always NULL, pass around struct device_node pointer $np. This way it
is possible to use of_clk_hw_register*() functions and/or register clock
with associated $np pointer.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Christophe Roullier <christophe.roullier@foss.st.com>
Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Patrice Chotard <patrice.chotard@foss.st.com>
Cc: Patrick Delaunay <patrick.delaunay@foss.st.com>
Cc: Stephen Boyd <swboyd@chromium.org>
Cc: linux-clk@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
To: linux-arm-kernel@lists.infradead.org
---
 drivers/clk/clk-stm32mp1.c | 56 +++++++++++++++++++-------------------
 1 file changed, 28 insertions(+), 28 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index a7c7f544ee5d..cf5a1d055c5a 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -317,7 +317,7 @@ struct clock_config {
 	int num_parents;
 	unsigned long flags;
 	void *cfg;
-	struct clk_hw * (*func)(struct device *dev,
+	struct clk_hw * (*func)(struct device_node *np,
 				struct clk_hw_onecell_data *clk_data,
 				void __iomem *base, spinlock_t *lock,
 				const struct clock_config *cfg);
@@ -377,14 +377,14 @@ struct stm32_composite_cfg {
 };
 
 static struct clk_hw *
-_clk_hw_register_gate(struct device *dev,
+_clk_hw_register_gate(struct device_node *np,
 		      struct clk_hw_onecell_data *clk_data,
 		      void __iomem *base, spinlock_t *lock,
 		      const struct clock_config *cfg)
 {
 	struct gate_cfg *gate_cfg = cfg->cfg;
 
-	return clk_hw_register_gate(dev,
+	return clk_hw_register_gate(NULL,
 				    cfg->name,
 				    cfg->parent_name,
 				    cfg->flags,
@@ -395,27 +395,27 @@ _clk_hw_register_gate(struct device *dev,
 }
 
 static struct clk_hw *
-_clk_hw_register_fixed_factor(struct device *dev,
+_clk_hw_register_fixed_factor(struct device_node *np,
 			      struct clk_hw_onecell_data *clk_data,
 			      void __iomem *base, spinlock_t *lock,
 			      const struct clock_config *cfg)
 {
 	struct fixed_factor_cfg *ff_cfg = cfg->cfg;
 
-	return clk_hw_register_fixed_factor(dev, cfg->name, cfg->parent_name,
+	return clk_hw_register_fixed_factor(NULL, cfg->name, cfg->parent_name,
 					    cfg->flags, ff_cfg->mult,
 					    ff_cfg->div);
 }
 
 static struct clk_hw *
-_clk_hw_register_divider_table(struct device *dev,
+_clk_hw_register_divider_table(struct device_node *np,
 			       struct clk_hw_onecell_data *clk_data,
 			       void __iomem *base, spinlock_t *lock,
 			       const struct clock_config *cfg)
 {
 	struct div_cfg *div_cfg = cfg->cfg;
 
-	return clk_hw_register_divider_table(dev,
+	return clk_hw_register_divider_table(NULL,
 					     cfg->name,
 					     cfg->parent_name,
 					     cfg->flags,
@@ -428,14 +428,14 @@ _clk_hw_register_divider_table(struct device *dev,
 }
 
 static struct clk_hw *
-_clk_hw_register_mux(struct device *dev,
+_clk_hw_register_mux(struct device_node *np,
 		     struct clk_hw_onecell_data *clk_data,
 		     void __iomem *base, spinlock_t *lock,
 		     const struct clock_config *cfg)
 {
 	struct mux_cfg *mux_cfg = cfg->cfg;
 
-	return clk_hw_register_mux(dev, cfg->name, cfg->parent_names,
+	return clk_hw_register_mux(NULL, cfg->name, cfg->parent_names,
 				   cfg->num_parents, cfg->flags,
 				   mux_cfg->reg_off + base, mux_cfg->shift,
 				   mux_cfg->width, mux_cfg->mux_flags, lock);
@@ -570,7 +570,7 @@ _get_stm32_gate(void __iomem *base,
 }
 
 static struct clk_hw *
-clk_stm32_register_gate_ops(struct device *dev,
+clk_stm32_register_gate_ops(struct device_node *np,
 			    const char *name,
 			    const char *parent_name,
 			    unsigned long flags,
@@ -598,7 +598,7 @@ clk_stm32_register_gate_ops(struct device *dev,
 
 	hw->init = &init;
 
-	ret = clk_hw_register(dev, hw);
+	ret = clk_hw_register(NULL, hw);
 	if (ret)
 		hw = ERR_PTR(ret);
 
@@ -606,7 +606,7 @@ clk_stm32_register_gate_ops(struct device *dev,
 }
 
 static struct clk_hw *
-clk_stm32_register_composite(struct device *dev,
+clk_stm32_register_composite(struct device_node *np,
 			     const char *name, const char * const *parent_names,
 			     int num_parents, void __iomem *base,
 			     const struct stm32_composite_cfg *cfg,
@@ -655,7 +655,7 @@ clk_stm32_register_composite(struct device *dev,
 		}
 	}
 
-	return clk_hw_register_composite(dev, name, parent_names, num_parents,
+	return clk_hw_register_composite(NULL, name, parent_names, num_parents,
 				       mux_hw, mux_ops, div_hw, div_ops,
 				       gate_hw, gate_ops, flags);
 }
@@ -863,7 +863,7 @@ static const struct clk_ops pll_ops = {
 	.is_enabled	= pll_is_enabled,
 };
 
-static struct clk_hw *clk_register_pll(struct device *dev, const char *name,
+static struct clk_hw *clk_register_pll(struct device_node *np, const char *name,
 				       const char *parent_name,
 				       void __iomem *reg,
 				       unsigned long flags,
@@ -889,7 +889,7 @@ static struct clk_hw *clk_register_pll(struct device *dev, const char *name,
 	element->lock = lock;
 
 	hw = &element->hw;
-	err = clk_hw_register(dev, hw);
+	err = clk_hw_register(NULL, hw);
 
 	if (err) {
 		kfree(element);
@@ -993,7 +993,7 @@ static const struct clk_ops timer_ker_ops = {
 
 };
 
-static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
+static struct clk_hw *clk_register_cktim(struct device_node *np, const char *name,
 					 const char *parent_name,
 					 unsigned long flags,
 					 void __iomem *apbdiv,
@@ -1021,7 +1021,7 @@ static struct clk_hw *clk_register_cktim(struct device *dev, const char *name,
 	tim_ker->timpre = timpre;
 
 	hw = &tim_ker->hw;
-	err = clk_hw_register(dev, hw);
+	err = clk_hw_register(NULL, hw);
 
 	if (err) {
 		kfree(tim_ker);
@@ -1035,14 +1035,14 @@ struct stm32_pll_cfg {
 	u32 offset;
 };
 
-static struct clk_hw *_clk_register_pll(struct device *dev,
+static struct clk_hw *_clk_register_pll(struct device_node *np,
 					struct clk_hw_onecell_data *clk_data,
 					void __iomem *base, spinlock_t *lock,
 					const struct clock_config *cfg)
 {
 	struct stm32_pll_cfg *stm_pll_cfg = cfg->cfg;
 
-	return clk_register_pll(dev, cfg->name, cfg->parent_name,
+	return clk_register_pll(np, cfg->name, cfg->parent_name,
 				base + stm_pll_cfg->offset, cfg->flags, lock);
 }
 
@@ -1051,25 +1051,25 @@ struct stm32_cktim_cfg {
 	u32 offset_timpre;
 };
 
-static struct clk_hw *_clk_register_cktim(struct device *dev,
+static struct clk_hw *_clk_register_cktim(struct device_node *np,
 					  struct clk_hw_onecell_data *clk_data,
 					  void __iomem *base, spinlock_t *lock,
 					  const struct clock_config *cfg)
 {
 	struct stm32_cktim_cfg *cktim_cfg = cfg->cfg;
 
-	return clk_register_cktim(dev, cfg->name, cfg->parent_name, cfg->flags,
+	return clk_register_cktim(np, cfg->name, cfg->parent_name, cfg->flags,
 				  cktim_cfg->offset_apbdiv + base,
 				  cktim_cfg->offset_timpre + base, lock);
 }
 
 static struct clk_hw *
-_clk_stm32_register_gate(struct device *dev,
+_clk_stm32_register_gate(struct device_node *np,
 			 struct clk_hw_onecell_data *clk_data,
 			 void __iomem *base, spinlock_t *lock,
 			 const struct clock_config *cfg)
 {
-	return clk_stm32_register_gate_ops(dev,
+	return clk_stm32_register_gate_ops(np,
 				    cfg->name,
 				    cfg->parent_name,
 				    cfg->flags,
@@ -1079,12 +1079,12 @@ _clk_stm32_register_gate(struct device *dev,
 }
 
 static struct clk_hw *
-_clk_stm32_register_composite(struct device *dev,
+_clk_stm32_register_composite(struct device_node *np,
 			      struct clk_hw_onecell_data *clk_data,
 			      void __iomem *base, spinlock_t *lock,
 			      const struct clock_config *cfg)
 {
-	return clk_stm32_register_composite(dev, cfg->name, cfg->parent_names,
+	return clk_stm32_register_composite(np, cfg->name, cfg->parent_names,
 					    cfg->num_parents, base, cfg->cfg,
 					    cfg->flags, lock);
 }
@@ -2020,7 +2020,7 @@ static const struct of_device_id stm32mp1_match_data[] = {
 	{ }
 };
 
-static int stm32_register_hw_clk(struct device *dev,
+static int stm32_register_hw_clk(struct device_node *np,
 				 struct clk_hw_onecell_data *clk_data,
 				 void __iomem *base, spinlock_t *lock,
 				 const struct clock_config *cfg)
@@ -2031,7 +2031,7 @@ static int stm32_register_hw_clk(struct device *dev,
 	hws = clk_data->hws;
 
 	if (cfg->func)
-		hw = (*cfg->func)(dev, clk_data, base, lock, cfg);
+		hw = (*cfg->func)(np, clk_data, base, lock, cfg);
 
 	if (IS_ERR(hw)) {
 		pr_err("Unable to register %s\n", cfg->name);
@@ -2077,7 +2077,7 @@ static int stm32_rcc_init(struct device_node *np,
 		hws[n] = ERR_PTR(-ENOENT);
 
 	for (n = 0; n < data->num; n++) {
-		err = stm32_register_hw_clk(NULL, clk_data, base, &rlock,
+		err = stm32_register_hw_clk(np, clk_data, base, &rlock,
 					    &data->cfg[n]);
 		if (err) {
 			pr_err("%s: can't register  %s\n", __func__,
-- 
2.30.2

