Return-Path: <SRS0=Myif=3D=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331D7C33C9E
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jan 2020 16:07:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EA76124656
	for <linux-clk@archiver.kernel.org>; Tue, 14 Jan 2020 16:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1579018055;
	bh=bm8WjMR9OPtWmnOUnb/Lb1owPhFfaLdKfnxExvp3rk4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=YerRfEiNAaMwJbdaWy49OrHJacTzOQYf/6zMBQmbf+Z6eLlrjkE/CqStSeZXo8PG0
	 xA/SAS+wqGXMZwfcZ+kWul50uFE7pxIS4BdpqGHKNG3p8or/Sqcad7AJ/S9laIY0GW
	 /eXjVmpGk9o3awrzNb1XFj71Qe0We1+2wmXUA5IE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726270AbgANQHe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Jan 2020 11:07:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60298 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726121AbgANQHe (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Jan 2020 11:07:34 -0500
Received: from localhost.localdomain (cpe-70-114-128-244.austin.res.rr.com [70.114.128.244])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id F079724658;
        Tue, 14 Jan 2020 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579018053;
        bh=bm8WjMR9OPtWmnOUnb/Lb1owPhFfaLdKfnxExvp3rk4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=i4WnCBQuDeesZEOX2QhrHLPYbIow+aDFZ5KCBbHo+F6D4AVt47Xd7q2CKGJ6GcDEp
         JAXA57F06ZNn2T9yicXKmUF2pQ1hkCB8gvrwnGKuftDHuwA//gf0fShwIWmTWx5NdT
         3i6bNkY5KR0o58qXFB1RnnmFGFM3/HnI7idA+yo0=
From:   Dinh Nguyen <dinguyen@kernel.org>
To:     sboyd@kernel.org
Cc:     dinguyen@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org
Subject: [PATCH 2/2] clk: socfpga: stratix10: simplify paramter passing
Date:   Tue, 14 Jan 2020 10:07:26 -0600
Message-Id: <20200114160726.19771-2-dinguyen@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200114160726.19771-1-dinguyen@kernel.org>
References: <20200114160726.19771-1-dinguyen@kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Just pass the clock pointer structure to the various register functions.

Signed-off-by: Dinh Nguyen <dinguyen@kernel.org>
---
 drivers/clk/socfpga/clk-gate-s10.c   | 40 +++++++++++---------------
 drivers/clk/socfpga/clk-periph-s10.c | 42 ++++++++++++++--------------
 drivers/clk/socfpga/clk-pll-s10.c    | 13 +++++----
 drivers/clk/socfpga/clk-s10.c        | 29 +++----------------
 drivers/clk/socfpga/stratix10-clk.h  | 25 ++++++-----------
 5 files changed, 57 insertions(+), 92 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate-s10.c b/drivers/clk/socfpga/clk-gate-s10.c
index 54a464fa63e0..8be4722f6064 100644
--- a/drivers/clk/socfpga/clk-gate-s10.c
+++ b/drivers/clk/socfpga/clk-gate-s10.c
@@ -65,54 +65,49 @@ static const struct clk_ops dbgclk_ops = {
 	.get_parent = socfpga_gate_get_parent,
 };
 
-struct clk *s10_register_gate(const char *name, const char *parent_name,
-			      const char * const *parent_names,
-			      u8 num_parents, unsigned long flags,
-			      void __iomem *regbase, unsigned long gate_reg,
-			      unsigned long gate_idx, unsigned long div_reg,
-			      unsigned long div_offset, u8 div_width,
-			      unsigned long bypass_reg, u8 bypass_shift,
-			      u8 fixed_div)
+struct clk *s10_register_gate(const struct stratix10_gate_clock *clks, void __iomem *regbase)
 {
 	struct clk *clk;
 	struct socfpga_gate_clk *socfpga_clk;
 	struct clk_init_data init;
+	const char * const *parent_names = clks->parent_names;
+	const char *parent_name = clks->parent_name;
 
 	socfpga_clk = kzalloc(sizeof(*socfpga_clk), GFP_KERNEL);
 	if (!socfpga_clk)
 		return NULL;
 
-	socfpga_clk->hw.reg = regbase + gate_reg;
-	socfpga_clk->hw.bit_idx = gate_idx;
+	socfpga_clk->hw.reg = regbase + clks->gate_reg;
+	socfpga_clk->hw.bit_idx = clks->gate_idx;
 
 	gateclk_ops.enable = clk_gate_ops.enable;
 	gateclk_ops.disable = clk_gate_ops.disable;
 
-	socfpga_clk->fixed_div = fixed_div;
+	socfpga_clk->fixed_div = clks->fixed_div;
 
-	if (div_reg)
-		socfpga_clk->div_reg = regbase + div_reg;
+	if (clks->div_reg)
+		socfpga_clk->div_reg = regbase + clks->div_reg;
 	else
 		socfpga_clk->div_reg = NULL;
 
-	socfpga_clk->width = div_width;
-	socfpga_clk->shift = div_offset;
+	socfpga_clk->width = clks->div_width;
+	socfpga_clk->shift = clks->div_offset;
 
-	if (bypass_reg)
-		socfpga_clk->bypass_reg = regbase + bypass_reg;
+	if (clks->bypass_reg)
+		socfpga_clk->bypass_reg = regbase + clks->bypass_reg;
 	else
 		socfpga_clk->bypass_reg = NULL;
-	socfpga_clk->bypass_shift = bypass_shift;
+	socfpga_clk->bypass_shift = clks->bypass_shift;
 
-	if (streq(name, "cs_pdbg_clk"))
+	if (streq(clks->name, "cs_pdbg_clk"))
 		init.ops = &dbgclk_ops;
 	else
 		init.ops = &gateclk_ops;
 
-	init.name = name;
-	init.flags = flags;
+	init.name = clks->name;
+	init.flags = clks->flags;
 
-	init.num_parents = num_parents;
+	init.num_parents = clks->num_parents;
 	init.parent_names = parent_names ? parent_names : &parent_name;
 	socfpga_clk->hw.hw.init = &init;
 
@@ -121,6 +116,5 @@ struct clk *s10_register_gate(const char *name, const char *parent_name,
 		kfree(socfpga_clk);
 		return NULL;
 	}
-
 	return clk;
 }
diff --git a/drivers/clk/socfpga/clk-periph-s10.c b/drivers/clk/socfpga/clk-periph-s10.c
index 1a191eeeebba..dd6d4056e9de 100644
--- a/drivers/clk/socfpga/clk-periph-s10.c
+++ b/drivers/clk/socfpga/clk-periph-s10.c
@@ -73,26 +73,27 @@ static const struct clk_ops peri_cnt_clk_ops = {
 	.get_parent = clk_periclk_get_parent,
 };
 
-struct clk *s10_register_periph(const char *name, const char *parent_name,
-				const char * const *parent_names,
-				u8 num_parents, unsigned long flags,
-				void __iomem *reg, unsigned long offset)
+struct clk *s10_register_periph(const struct stratix10_perip_c_clock *clks,
+				void __iomem *reg)
 {
 	struct clk *clk;
 	struct socfpga_periph_clk *periph_clk;
 	struct clk_init_data init;
+	const char *name = clks->name;
+	const char *parent_name = clks->parent_name;
+	const char * const *parent_names = clks->parent_names;
 
 	periph_clk = kzalloc(sizeof(*periph_clk), GFP_KERNEL);
 	if (WARN_ON(!periph_clk))
 		return NULL;
 
-	periph_clk->hw.reg = reg + offset;
+	periph_clk->hw.reg = reg + clks->offset;
 
 	init.name = name;
 	init.ops = &peri_c_clk_ops;
-	init.flags = flags;
+	init.flags = clks->flags;
 
-	init.num_parents = num_parents;
+	init.num_parents = clks->num_parents;
 	init.parent_names = parent_names ? parent_names : &parent_name;
 
 	periph_clk->hw.hw.init = &init;
@@ -105,38 +106,37 @@ struct clk *s10_register_periph(const char *name, const char *parent_name,
 	return clk;
 }
 
-struct clk *s10_register_cnt_periph(const char *name, const char *parent_name,
-				    const char * const *parent_names,
-				    u8 num_parents, unsigned long flags,
-				    void __iomem *regbase, unsigned long offset,
-				    u8 fixed_divider, unsigned long bypass_reg,
-				    unsigned long bypass_shift)
+struct clk *s10_register_cnt_periph(const struct stratix10_perip_cnt_clock *clks,
+				    void __iomem *regbase)
 {
 	struct clk *clk;
 	struct socfpga_periph_clk *periph_clk;
 	struct clk_init_data init;
+	const char *name = clks->name;
+	const char *parent_name = clks->parent_name;
+	const char * const *parent_names = clks->parent_names;
 
 	periph_clk = kzalloc(sizeof(*periph_clk), GFP_KERNEL);
 	if (WARN_ON(!periph_clk))
 		return NULL;
 
-	if (offset)
-		periph_clk->hw.reg = regbase + offset;
+	if (clks->offset)
+		periph_clk->hw.reg = regbase + clks->offset;
 	else
 		periph_clk->hw.reg = NULL;
 
-	if (bypass_reg)
-		periph_clk->bypass_reg = regbase + bypass_reg;
+	if (clks->bypass_reg)
+		periph_clk->bypass_reg = regbase + clks->bypass_reg;
 	else
 		periph_clk->bypass_reg = NULL;
-	periph_clk->bypass_shift = bypass_shift;
-	periph_clk->fixed_div = fixed_divider;
+	periph_clk->bypass_shift = clks->bypass_shift;
+	periph_clk->fixed_div = clks->fixed_divider;
 
 	init.name = name;
 	init.ops = &peri_cnt_clk_ops;
-	init.flags = flags;
+	init.flags = clks->flags;
 
-	init.num_parents = num_parents;
+	init.num_parents = clks->num_parents;
 	init.parent_names = parent_names ? parent_names : &parent_name;
 
 	periph_clk->hw.hw.init = &init;
diff --git a/drivers/clk/socfpga/clk-pll-s10.c b/drivers/clk/socfpga/clk-pll-s10.c
index 8d7b1d0c4664..a301bb22f36c 100644
--- a/drivers/clk/socfpga/clk-pll-s10.c
+++ b/drivers/clk/socfpga/clk-pll-s10.c
@@ -110,19 +110,20 @@ static struct clk_ops clk_boot_ops = {
 	.prepare = clk_pll_prepare,
 };
 
-struct clk *s10_register_pll(const char *name, const char * const *parent_names,
-				    u8 num_parents, unsigned long flags,
-				    void __iomem *reg, unsigned long offset)
+struct clk *s10_register_pll(const struct stratix10_pll_clock *clks,
+			     void __iomem *reg)
 {
 	struct clk *clk;
 	struct socfpga_pll *pll_clk;
 	struct clk_init_data init;
+	const char *name = clks->name;
+	const char * const *parent_names = clks->parent_names;
 
 	pll_clk = kzalloc(sizeof(*pll_clk), GFP_KERNEL);
 	if (WARN_ON(!pll_clk))
 		return NULL;
 
-	pll_clk->hw.reg = reg + offset;
+	pll_clk->hw.reg = reg + clks->offset;
 
 	if (streq(name, SOCFPGA_BOOT_CLK))
 		init.ops = &clk_boot_ops;
@@ -130,9 +131,9 @@ struct clk *s10_register_pll(const char *name, const char * const *parent_names,
 		init.ops = &clk_pll_ops;
 
 	init.name = name;
-	init.flags = flags;
+	init.flags = clks->flags;
 
-	init.num_parents = num_parents;
+	init.num_parents = clks->num_parents;
 	init.parent_names = parent_names;
 	pll_clk->hw.hw.init = &init;
 
diff --git a/drivers/clk/socfpga/clk-s10.c b/drivers/clk/socfpga/clk-s10.c
index 993f3a73c71e..dea7c6c7d269 100644
--- a/drivers/clk/socfpga/clk-s10.c
+++ b/drivers/clk/socfpga/clk-s10.c
@@ -177,9 +177,7 @@ static int s10_clk_register_c_perip(const struct stratix10_perip_c_clock *clks,
 	int i;
 
 	for (i = 0; i < nums; i++) {
-		clk = s10_register_periph(clks[i].name, clks[i].parent_name,
-					  clks[i].parent_names, clks[i].num_parents,
-					  clks[i].flags, base, clks[i].offset);
+		clk = s10_register_periph(&clks[i], base);
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
@@ -198,14 +196,7 @@ static int s10_clk_register_cnt_perip(const struct stratix10_perip_cnt_clock *cl
 	int i;
 
 	for (i = 0; i < nums; i++) {
-		clk = s10_register_cnt_periph(clks[i].name, clks[i].parent_name,
-					      clks[i].parent_names,
-					      clks[i].num_parents,
-					      clks[i].flags, base,
-					      clks[i].offset,
-					      clks[i].fixed_divider,
-					      clks[i].bypass_reg,
-					      clks[i].bypass_shift);
+		clk = s10_register_cnt_periph(&clks[i], base);
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
@@ -225,16 +216,7 @@ static int s10_clk_register_gate(const struct stratix10_gate_clock *clks,
 	int i;
 
 	for (i = 0; i < nums; i++) {
-		clk = s10_register_gate(clks[i].name, clks[i].parent_name,
-					clks[i].parent_names,
-					clks[i].num_parents,
-					clks[i].flags, base,
-					clks[i].gate_reg,
-					clks[i].gate_idx, clks[i].div_reg,
-					clks[i].div_offset, clks[i].div_width,
-					clks[i].bypass_reg,
-					clks[i].bypass_shift,
-					clks[i].fixed_div);
+		clk = s10_register_gate(&clks[i], base);
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
@@ -254,10 +236,7 @@ static int s10_clk_register_pll(const struct stratix10_pll_clock *clks,
 	int i;
 
 	for (i = 0; i < nums; i++) {
-		clk = s10_register_pll(clks[i].name, clks[i].parent_names,
-				    clks[i].num_parents,
-				    clks[i].flags, base,
-				    clks[i].offset);
+		clk = s10_register_pll(&clks[i], base);
 		if (IS_ERR(clk)) {
 			pr_err("%s: failed to register clock %s\n",
 			       __func__, clks[i].name);
diff --git a/drivers/clk/socfpga/stratix10-clk.h b/drivers/clk/socfpga/stratix10-clk.h
index e8e121907952..fcabef42249c 100644
--- a/drivers/clk/socfpga/stratix10-clk.h
+++ b/drivers/clk/socfpga/stratix10-clk.h
@@ -60,21 +60,12 @@ struct stratix10_gate_clock {
 	u8			fixed_div;
 };
 
-struct clk *s10_register_pll(const char *, const char *const *, u8,
-			     unsigned long, void __iomem *, unsigned long);
-
-struct clk *s10_register_periph(const char *, const char *,
-				const char * const *, u8, unsigned long,
-				void __iomem *, unsigned long);
-struct clk *s10_register_cnt_periph(const char *, const char *,
-				    const char * const *, u8,
-				    unsigned long, void __iomem *,
-				    unsigned long, u8, unsigned long,
-				    unsigned long);
-struct clk *s10_register_gate(const char *, const char *,
-			      const char * const *, u8,
-			      unsigned long, void __iomem *,
-			      unsigned long, unsigned long,
-			      unsigned long, unsigned long, u8,
-			      unsigned long, u8, u8);
+struct clk *s10_register_pll(const struct stratix10_pll_clock *,
+			     void __iomem *);
+struct clk *s10_register_periph(const struct stratix10_perip_c_clock *,
+				void __iomem *);
+struct clk *s10_register_cnt_periph(const struct stratix10_perip_cnt_clock *,
+				    void __iomem *);
+struct clk *s10_register_gate(const struct stratix10_gate_clock *,
+			      void __iomem *);
 #endif	/* __STRATIX10_CLK_H */
-- 
2.17.1

