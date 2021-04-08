Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A399C433ED
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 271D161041
	for <linux-clk@archiver.kernel.org>; Thu,  8 Apr 2021 18:57:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232942AbhDHS6C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Apr 2021 14:58:02 -0400
Received: from mail-out.m-online.net ([212.18.0.9]:33355 "EHLO
        mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231676AbhDHS6B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Apr 2021 14:58:01 -0400
Received: from frontend01.mail.m-online.net (unknown [192.168.8.182])
        by mail-out.m-online.net (Postfix) with ESMTP id 4FGVrX3fPHz1qs3X;
        Thu,  8 Apr 2021 20:57:48 +0200 (CEST)
Received: from localhost (dynscan1.mnet-online.de [192.168.6.70])
        by mail.m-online.net (Postfix) with ESMTP id 4FGVrX3FwZz1sP6L;
        Thu,  8 Apr 2021 20:57:48 +0200 (CEST)
X-Virus-Scanned: amavisd-new at mnet-online.de
Received: from mail.mnet-online.de ([192.168.8.182])
        by localhost (dynscan1.mail.m-online.net [192.168.6.70]) (amavisd-new, port 10024)
        with ESMTP id yKdnRZjQGlhH; Thu,  8 Apr 2021 20:57:46 +0200 (CEST)
X-Auth-Info: cl6Qrnir4ogKBLWSnkIvFaukjculI3dZHSOpLRTSF1A=
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.mnet-online.de (Postfix) with ESMTPSA;
        Thu,  8 Apr 2021 20:57:46 +0200 (CEST)
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
Subject: [PATCH 3/7] clk: stm32mp1: Register clock with device_node pointer
Date:   Thu,  8 Apr 2021 20:57:27 +0200
Message-Id: <20210408185731.135511-4-marex@denx.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210408185731.135511-1-marex@denx.de>
References: <20210408185731.135511-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Use of_clk_hw_register() where applicable to associate device_node with
the newly registered clock, elsewhere use functions which permit passing
the device node to newly registered clock.

There are two exceptions, _clk_hw_register_fixed_factor() does not pass
the device_node pointer to new fixed factor clock and neither does
clk_stm32_register_composite(), because there is so far no way to do
that.

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
NOTE: But if this patch is acceptable, the _clk_hw_register_fixed_factor()
      and clk_stm32_register_composite() can be easily fixed up too.
---
 drivers/clk/clk-stm32mp1.c | 44 ++++++++++++++++----------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/clk/clk-stm32mp1.c b/drivers/clk/clk-stm32mp1.c
index cf5a1d055c5a..85bba1ee5fbd 100644
--- a/drivers/clk/clk-stm32mp1.c
+++ b/drivers/clk/clk-stm32mp1.c
@@ -384,14 +384,11 @@ _clk_hw_register_gate(struct device_node *np,
 {
 	struct gate_cfg *gate_cfg = cfg->cfg;
 
-	return clk_hw_register_gate(NULL,
-				    cfg->name,
-				    cfg->parent_name,
-				    cfg->flags,
-				    gate_cfg->reg_off + base,
-				    gate_cfg->bit_idx,
-				    gate_cfg->gate_flags,
-				    lock);
+	return __clk_hw_register_gate(NULL, np, cfg->name, cfg->parent_name,
+				      NULL, NULL, cfg->flags,
+				      gate_cfg->reg_off + base,
+				      gate_cfg->bit_idx,
+				      gate_cfg->gate_flags, lock);
 }
 
 static struct clk_hw *
@@ -415,16 +412,12 @@ _clk_hw_register_divider_table(struct device_node *np,
 {
 	struct div_cfg *div_cfg = cfg->cfg;
 
-	return clk_hw_register_divider_table(NULL,
-					     cfg->name,
-					     cfg->parent_name,
-					     cfg->flags,
-					     div_cfg->reg_off + base,
-					     div_cfg->shift,
-					     div_cfg->width,
-					     div_cfg->div_flags,
-					     div_cfg->table,
-					     lock);
+	return __clk_hw_register_divider(NULL, np, cfg->name, cfg->parent_name,
+					 NULL, NULL, cfg->flags,
+					 div_cfg->reg_off + base,
+					 div_cfg->shift, div_cfg->width,
+					 div_cfg->div_flags, div_cfg->table,
+					 lock);
 }
 
 static struct clk_hw *
@@ -435,10 +428,11 @@ _clk_hw_register_mux(struct device_node *np,
 {
 	struct mux_cfg *mux_cfg = cfg->cfg;
 
-	return clk_hw_register_mux(NULL, cfg->name, cfg->parent_names,
-				   cfg->num_parents, cfg->flags,
-				   mux_cfg->reg_off + base, mux_cfg->shift,
-				   mux_cfg->width, mux_cfg->mux_flags, lock);
+	return __clk_hw_register_mux(NULL, np, cfg->name, cfg->num_parents,
+				     cfg->parent_names, NULL, NULL, cfg->flags,
+				     mux_cfg->reg_off + base, mux_cfg->shift,
+				     BIT(mux_cfg->width) - 1,
+				     mux_cfg->mux_flags, NULL, lock);
 }
 
 /* MP1 Gate clock with set & clear registers */
@@ -598,7 +592,7 @@ clk_stm32_register_gate_ops(struct device_node *np,
 
 	hw->init = &init;
 
-	ret = clk_hw_register(NULL, hw);
+	ret = of_clk_hw_register(np, hw);
 	if (ret)
 		hw = ERR_PTR(ret);
 
@@ -889,7 +883,7 @@ static struct clk_hw *clk_register_pll(struct device_node *np, const char *name,
 	element->lock = lock;
 
 	hw = &element->hw;
-	err = clk_hw_register(NULL, hw);
+	err = of_clk_hw_register(np, hw);
 
 	if (err) {
 		kfree(element);
@@ -1021,7 +1015,7 @@ static struct clk_hw *clk_register_cktim(struct device_node *np, const char *nam
 	tim_ker->timpre = timpre;
 
 	hw = &tim_ker->hw;
-	err = clk_hw_register(NULL, hw);
+	err = of_clk_hw_register(np, hw);
 
 	if (err) {
 		kfree(tim_ker);
-- 
2.30.2

