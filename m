Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309E9C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Mar 2022 23:01:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244332AbiCSXCX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Mar 2022 19:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234512AbiCSXCV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Mar 2022 19:02:21 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5E201A9C82
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:55 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id bn33so15599721ljb.6
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dfsKKhofUU0oxE9bz8stUr+16bmhZiDH24dwYU6qJoI=;
        b=XMjZFfWMQpU8vgemfFvGd/h/cW3Q1tvGvbhIFdXegk9EeJxpRfqACnkvJcsbmS6S4q
         8KbAJRcvyXwhwGwgDW0Ul7NJxOTcOvUoW/nP6QNxmgzQPfMz4F9N7nrzWfc96Nfx9gr4
         8lcpMWwv6f/rO00h0Mvy03Vqrn1IPU8VmZUqJCJ/bSMLuArz2TQj5LcJcGWk+kjyG2Vj
         f1NVIWB5C6+WwSyoR4mjL4//HiT+ikzvz7AoqaBh9blVcaJvRIYcV60+cCp5o79moiUh
         FkcrdFOkXW9Q5mDEEtuTxNi5flGVVLvGjVuxhpDcGIp3Zu7M+Mm6J14AblPqhlFhtHju
         f54Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dfsKKhofUU0oxE9bz8stUr+16bmhZiDH24dwYU6qJoI=;
        b=OS1GWHmHIpbApyt5sKMOqpJlwKupz1KQXfH7T0QFjG3VRUBHKmCLm9lngbxHTg5fz/
         Mthe+FLfpyt8iB/DldPexzl2hMvOt+6CYRZT22+V6SkgGV44Ztsx+igBjmLQNx/l7oVM
         900ciJ9pF9/Qjno9NJJDmd7nqFKUagK1hlYy0hI32Wi4EGl+L2lraedE6tThbWtO88be
         +eo8kKKxk45y6p8rtPl4lyAcXH/NLGig0Di3fkc0l7uOZ2D9ess0CEzhA3JFGZgbXMow
         mTBAiKrVeM7OGGff/FmaqVW3rR6LDQlmfqUWoKII4IvrHahTk152ZqBWHHDHZowyz2Fh
         2tFw==
X-Gm-Message-State: AOAM532eoCRSpGJo7sBMiS/K+DaahvuHEttAGlTIuibG2PJDSULpFAfd
        mhtgvCwrHUlXGMTkoZuZJbpinA==
X-Google-Smtp-Source: ABdhPJyO7yVZ9uHEtyVNXJbneDwVVIbQfuFEx8SH0daPBwxWhkCgfnLEE7xoxRNCepfEIPYf+h9o2w==
X-Received: by 2002:a05:651c:11c4:b0:249:80fe:d5f4 with SMTP id z4-20020a05651c11c400b0024980fed5f4mr600438ljo.185.1647730853908;
        Sat, 19 Mar 2022 16:00:53 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z5-20020a196505000000b0044a12b953f9sm581520lfb.45.2022.03.19.16.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 16:00:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 4/5 v2] clk: ux500: Rewrite PRCMU clocks to use clk_hw_*
Date:   Sat, 19 Mar 2022 23:51:55 +0100
Message-Id: <20220319225156.1451636-5-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319225156.1451636-1-linus.walleij@linaro.org>
References: <20220319225156.1451636-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This rewrites all the u8500 PRCMU clocks and helper functions to
handle clocks using struct clk_hw rather than struct clk, as is
normal for modern clock drivers.

Use clk_hw_register(), of_clk_add_hw_provider() and stack all the
clocks into a compile-time dynamic array of
struct clk_hw_onecell_data.

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/ux500/clk-prcmu.c    |  74 ++++-----
 drivers/clk/ux500/clk.h          |  55 +++----
 drivers/clk/ux500/u8500_of_clk.c | 263 ++++++++++++++-----------------
 3 files changed, 183 insertions(+), 209 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 6627ed1ef37e..4c1f3a6f5eb5 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -183,16 +183,16 @@ static const struct clk_ops clk_prcmu_opp_volt_scalable_ops = {
 	.set_rate = clk_prcmu_set_rate,
 };
 
-static struct clk *clk_reg_prcmu(const char *name,
-				 const char *parent_name,
-				 u8 cg_sel,
-				 unsigned long rate,
-				 unsigned long flags,
-				 const struct clk_ops *clk_prcmu_ops)
+static struct clk_hw *clk_reg_prcmu(const char *name,
+				    const char *parent_name,
+				    u8 cg_sel,
+				    unsigned long rate,
+				    unsigned long flags,
+				    const struct clk_ops *clk_prcmu_ops)
 {
 	struct clk_prcmu *clk;
 	struct clk_init_data clk_prcmu_init;
-	struct clk *clk_reg;
+	int ret;
 
 	if (!name) {
 		pr_err("clk_prcmu: %s invalid arguments passed\n", __func__);
@@ -216,11 +216,11 @@ static struct clk *clk_reg_prcmu(const char *name,
 	clk_prcmu_init.num_parents = (parent_name ? 1 : 0);
 	clk->hw.init = &clk_prcmu_init;
 
-	clk_reg = clk_register(NULL, &clk->hw);
-	if (IS_ERR_OR_NULL(clk_reg))
+	ret = clk_hw_register(NULL, &clk->hw);
+	if (ret)
 		goto free_clk;
 
-	return clk_reg;
+	return &clk->hw;
 
 free_clk:
 	kfree(clk);
@@ -228,58 +228,58 @@ static struct clk *clk_reg_prcmu(const char *name,
 	return ERR_PTR(-ENOMEM);
 }
 
-struct clk *clk_reg_prcmu_scalable(const char *name,
-				   const char *parent_name,
-				   u8 cg_sel,
-				   unsigned long rate,
-				   unsigned long flags)
+struct clk_hw *clk_reg_prcmu_scalable(const char *name,
+				      const char *parent_name,
+				      u8 cg_sel,
+				      unsigned long rate,
+				      unsigned long flags)
 {
 	return clk_reg_prcmu(name, parent_name, cg_sel, rate, flags,
 			&clk_prcmu_scalable_ops);
 }
 
-struct clk *clk_reg_prcmu_gate(const char *name,
-			       const char *parent_name,
-			       u8 cg_sel,
-			       unsigned long flags)
+struct clk_hw *clk_reg_prcmu_gate(const char *name,
+				  const char *parent_name,
+				  u8 cg_sel,
+				  unsigned long flags)
 {
 	return clk_reg_prcmu(name, parent_name, cg_sel, 0, flags,
 			&clk_prcmu_gate_ops);
 }
 
-struct clk *clk_reg_prcmu_scalable_rate(const char *name,
-					const char *parent_name,
-					u8 cg_sel,
-					unsigned long rate,
-					unsigned long flags)
+struct clk_hw *clk_reg_prcmu_scalable_rate(const char *name,
+					   const char *parent_name,
+					   u8 cg_sel,
+					   unsigned long rate,
+					   unsigned long flags)
 {
 	return clk_reg_prcmu(name, parent_name, cg_sel, rate, flags,
 			&clk_prcmu_scalable_rate_ops);
 }
 
-struct clk *clk_reg_prcmu_rate(const char *name,
-			       const char *parent_name,
-			       u8 cg_sel,
-			       unsigned long flags)
+struct clk_hw *clk_reg_prcmu_rate(const char *name,
+				  const char *parent_name,
+				  u8 cg_sel,
+				  unsigned long flags)
 {
 	return clk_reg_prcmu(name, parent_name, cg_sel, 0, flags,
 			&clk_prcmu_rate_ops);
 }
 
-struct clk *clk_reg_prcmu_opp_gate(const char *name,
-				   const char *parent_name,
-				   u8 cg_sel,
-				   unsigned long flags)
+struct clk_hw *clk_reg_prcmu_opp_gate(const char *name,
+				      const char *parent_name,
+				      u8 cg_sel,
+				      unsigned long flags)
 {
 	return clk_reg_prcmu(name, parent_name, cg_sel, 0, flags,
 			&clk_prcmu_opp_gate_ops);
 }
 
-struct clk *clk_reg_prcmu_opp_volt_scalable(const char *name,
-					    const char *parent_name,
-					    u8 cg_sel,
-					    unsigned long rate,
-					    unsigned long flags)
+struct clk_hw *clk_reg_prcmu_opp_volt_scalable(const char *name,
+					       const char *parent_name,
+					       u8 cg_sel,
+					       unsigned long rate,
+					       unsigned long flags)
 {
 	return clk_reg_prcmu(name, parent_name, cg_sel, rate, flags,
 			&clk_prcmu_opp_volt_scalable_ops);
diff --git a/drivers/clk/ux500/clk.h b/drivers/clk/ux500/clk.h
index 40cd9fc95b8b..b443c3f257b1 100644
--- a/drivers/clk/ux500/clk.h
+++ b/drivers/clk/ux500/clk.h
@@ -13,6 +13,7 @@
 #include <linux/types.h>
 
 struct clk;
+struct clk_hw;
 
 struct clk *clk_reg_prcc_pclk(const char *name,
 			      const char *parent_name,
@@ -26,38 +27,38 @@ struct clk *clk_reg_prcc_kclk(const char *name,
 			      u32 cg_sel,
 			      unsigned long flags);
 
-struct clk *clk_reg_prcmu_scalable(const char *name,
-				   const char *parent_name,
-				   u8 cg_sel,
-				   unsigned long rate,
-				   unsigned long flags);
+struct clk_hw *clk_reg_prcmu_scalable(const char *name,
+				      const char *parent_name,
+				      u8 cg_sel,
+				      unsigned long rate,
+				      unsigned long flags);
 
-struct clk *clk_reg_prcmu_gate(const char *name,
-			       const char *parent_name,
-			       u8 cg_sel,
-			       unsigned long flags);
+struct clk_hw *clk_reg_prcmu_gate(const char *name,
+				  const char *parent_name,
+				  u8 cg_sel,
+				  unsigned long flags);
 
-struct clk *clk_reg_prcmu_scalable_rate(const char *name,
-					const char *parent_name,
-					u8 cg_sel,
-					unsigned long rate,
-					unsigned long flags);
+struct clk_hw *clk_reg_prcmu_scalable_rate(const char *name,
+					   const char *parent_name,
+					   u8 cg_sel,
+					   unsigned long rate,
+					   unsigned long flags);
 
-struct clk *clk_reg_prcmu_rate(const char *name,
-			       const char *parent_name,
-			       u8 cg_sel,
-			       unsigned long flags);
+struct clk_hw *clk_reg_prcmu_rate(const char *name,
+				  const char *parent_name,
+				  u8 cg_sel,
+				  unsigned long flags);
 
-struct clk *clk_reg_prcmu_opp_gate(const char *name,
-				   const char *parent_name,
-				   u8 cg_sel,
-				   unsigned long flags);
+struct clk_hw *clk_reg_prcmu_opp_gate(const char *name,
+				      const char *parent_name,
+				      u8 cg_sel,
+				      unsigned long flags);
 
-struct clk *clk_reg_prcmu_opp_volt_scalable(const char *name,
-					    const char *parent_name,
-					    u8 cg_sel,
-					    unsigned long rate,
-					    unsigned long flags);
+struct clk_hw *clk_reg_prcmu_opp_volt_scalable(const char *name,
+					       const char *parent_name,
+					       u8 cg_sel,
+					       unsigned long rate,
+					       unsigned long flags);
 
 struct clk *clk_reg_sysctrl_gate(struct device *dev,
 				 const char *name,
diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
index e86ed2eec3fd..6aa89645f5fa 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -15,7 +15,6 @@
 #include "prcc.h"
 #include "reset-prcc.h"
 
-static struct clk *prcmu_clk[PRCMU_NUM_CLKS];
 static struct clk *prcc_pclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
 static struct clk *prcc_kclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
 
@@ -46,6 +45,17 @@ static struct clk *ux500_twocell_get(struct of_phandle_args *clkspec,
 	return PRCC_SHOW(clk_data, base, bit);
 }
 
+static struct clk_hw_onecell_data u8500_prcmu_hw_clks = {
+	.hws = {
+		/*
+		 * This assignment makes sure the dynamic array
+		 * gets the right size.
+		 */
+		[PRCMU_NUM_CLKS] = NULL,
+	},
+	.num = PRCMU_NUM_CLKS,
+};
+
 static void u8500_clk_init(struct device_node *np)
 {
 	struct prcmu_fw_version *fw_version;
@@ -77,17 +87,17 @@ static void u8500_clk_init(struct device_node *np)
 	}
 
 	/* Clock sources */
-	clk = clk_reg_prcmu_gate("soc0_pll", NULL, PRCMU_PLLSOC0,
-				CLK_IGNORE_UNUSED);
-	prcmu_clk[PRCMU_PLLSOC0] = clk;
+	u8500_prcmu_hw_clks.hws[PRCMU_PLLSOC0] =
+		clk_reg_prcmu_gate("soc0_pll", NULL, PRCMU_PLLSOC0,
+				   CLK_IGNORE_UNUSED);
 
-	clk = clk_reg_prcmu_gate("soc1_pll", NULL, PRCMU_PLLSOC1,
-				CLK_IGNORE_UNUSED);
-	prcmu_clk[PRCMU_PLLSOC1] = clk;
+	u8500_prcmu_hw_clks.hws[PRCMU_PLLSOC1] =
+		clk_reg_prcmu_gate("soc1_pll", NULL, PRCMU_PLLSOC1,
+				   CLK_IGNORE_UNUSED);
 
-	clk = clk_reg_prcmu_gate("ddr_pll", NULL, PRCMU_PLLDDR,
-				CLK_IGNORE_UNUSED);
-	prcmu_clk[PRCMU_PLLDDR] = clk;
+	u8500_prcmu_hw_clks.hws[PRCMU_PLLDDR] =
+		clk_reg_prcmu_gate("ddr_pll", NULL, PRCMU_PLLDDR,
+				   CLK_IGNORE_UNUSED);
 
 	/* FIXME: Add sys, ulp and int clocks here. */
 
@@ -113,136 +123,102 @@ static void u8500_clk_init(struct device_node *np)
 	}
 
 	if (sgaclk_parent)
-		clk = clk_reg_prcmu_gate("sgclk", sgaclk_parent,
-					PRCMU_SGACLK, 0);
+		u8500_prcmu_hw_clks.hws[PRCMU_SGACLK] =
+			clk_reg_prcmu_gate("sgclk", sgaclk_parent,
+					   PRCMU_SGACLK, 0);
 	else
-		clk = clk_reg_prcmu_gate("sgclk", NULL, PRCMU_SGACLK, 0);
-	prcmu_clk[PRCMU_SGACLK] = clk;
-
-	clk = clk_reg_prcmu_gate("uartclk", NULL, PRCMU_UARTCLK, 0);
-	prcmu_clk[PRCMU_UARTCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("msp02clk", NULL, PRCMU_MSP02CLK, 0);
-	prcmu_clk[PRCMU_MSP02CLK] = clk;
-
-	clk = clk_reg_prcmu_gate("msp1clk", NULL, PRCMU_MSP1CLK, 0);
-	prcmu_clk[PRCMU_MSP1CLK] = clk;
-
-	clk = clk_reg_prcmu_gate("i2cclk", NULL, PRCMU_I2CCLK, 0);
-	prcmu_clk[PRCMU_I2CCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("slimclk", NULL, PRCMU_SLIMCLK, 0);
-	prcmu_clk[PRCMU_SLIMCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("per1clk", NULL, PRCMU_PER1CLK, 0);
-	prcmu_clk[PRCMU_PER1CLK] = clk;
-
-	clk = clk_reg_prcmu_gate("per2clk", NULL, PRCMU_PER2CLK, 0);
-	prcmu_clk[PRCMU_PER2CLK] = clk;
-
-	clk = clk_reg_prcmu_gate("per3clk", NULL, PRCMU_PER3CLK, 0);
-	prcmu_clk[PRCMU_PER3CLK] = clk;
-
-	clk = clk_reg_prcmu_gate("per5clk", NULL, PRCMU_PER5CLK, 0);
-	prcmu_clk[PRCMU_PER5CLK] = clk;
-
-	clk = clk_reg_prcmu_gate("per6clk", NULL, PRCMU_PER6CLK, 0);
-	prcmu_clk[PRCMU_PER6CLK] = clk;
-
-	clk = clk_reg_prcmu_gate("per7clk", NULL, PRCMU_PER7CLK, 0);
-	prcmu_clk[PRCMU_PER7CLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("lcdclk", NULL, PRCMU_LCDCLK, 0,
-				CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_LCDCLK] = clk;
-
-	clk = clk_reg_prcmu_opp_gate("bmlclk", NULL, PRCMU_BMLCLK, 0);
-	prcmu_clk[PRCMU_BMLCLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("hsitxclk", NULL, PRCMU_HSITXCLK, 0,
-				CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_HSITXCLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("hsirxclk", NULL, PRCMU_HSIRXCLK, 0,
-				CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_HSIRXCLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("hdmiclk", NULL, PRCMU_HDMICLK, 0,
-				CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_HDMICLK] = clk;
-
-	clk = clk_reg_prcmu_gate("apeatclk", NULL, PRCMU_APEATCLK, 0);
-	prcmu_clk[PRCMU_APEATCLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("apetraceclk", NULL, PRCMU_APETRACECLK, 0,
-				CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_APETRACECLK] = clk;
-
-	clk = clk_reg_prcmu_gate("mcdeclk", NULL, PRCMU_MCDECLK, 0);
-	prcmu_clk[PRCMU_MCDECLK] = clk;
-
-	clk = clk_reg_prcmu_opp_gate("ipi2cclk", NULL, PRCMU_IPI2CCLK, 0);
-	prcmu_clk[PRCMU_IPI2CCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("dsialtclk", NULL, PRCMU_DSIALTCLK, 0);
-	prcmu_clk[PRCMU_DSIALTCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("dmaclk", NULL, PRCMU_DMACLK, 0);
-	prcmu_clk[PRCMU_DMACLK] = clk;
-
-	clk = clk_reg_prcmu_gate("b2r2clk", NULL, PRCMU_B2R2CLK, 0);
-	prcmu_clk[PRCMU_B2R2CLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("tvclk", NULL, PRCMU_TVCLK, 0,
-				CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_TVCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("sspclk", NULL, PRCMU_SSPCLK, 0);
-	prcmu_clk[PRCMU_SSPCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("rngclk", NULL, PRCMU_RNGCLK, 0);
-	prcmu_clk[PRCMU_RNGCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("uiccclk", NULL, PRCMU_UICCCLK, 0);
-	prcmu_clk[PRCMU_UICCCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("timclk", NULL, PRCMU_TIMCLK, 0);
-	prcmu_clk[PRCMU_TIMCLK] = clk;
-
-	clk = clk_reg_prcmu_gate("ab8500_sysclk", NULL, PRCMU_SYSCLK, 0);
-	prcmu_clk[PRCMU_SYSCLK] = clk;
-
-	clk = clk_reg_prcmu_opp_volt_scalable("sdmmcclk", NULL, PRCMU_SDMMCCLK,
-					100000000, CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_SDMMCCLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("dsi_pll", "hdmiclk",
-				PRCMU_PLLDSI, 0, CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_PLLDSI] = clk;
-
-	clk = clk_reg_prcmu_scalable("dsi0clk", "dsi_pll",
-				PRCMU_DSI0CLK, 0, CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_DSI0CLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("dsi1clk", "dsi_pll",
-				PRCMU_DSI1CLK, 0, CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_DSI1CLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("dsi0escclk", "tvclk",
-				PRCMU_DSI0ESCCLK, 0, CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_DSI0ESCCLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("dsi1escclk", "tvclk",
-				PRCMU_DSI1ESCCLK, 0, CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_DSI1ESCCLK] = clk;
-
-	clk = clk_reg_prcmu_scalable("dsi2escclk", "tvclk",
-				PRCMU_DSI2ESCCLK, 0, CLK_SET_RATE_GATE);
-	prcmu_clk[PRCMU_DSI2ESCCLK] = clk;
-
-	clk = clk_reg_prcmu_scalable_rate("armss", NULL,
-				PRCMU_ARMSS, 0, CLK_IGNORE_UNUSED);
-	prcmu_clk[PRCMU_ARMSS] = clk;
+		u8500_prcmu_hw_clks.hws[PRCMU_SGACLK] =
+			clk_reg_prcmu_gate("sgclk", NULL, PRCMU_SGACLK, 0);
+
+	u8500_prcmu_hw_clks.hws[PRCMU_UARTCLK] =
+		clk_reg_prcmu_gate("uartclk", NULL, PRCMU_UARTCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_MSP02CLK] =
+		clk_reg_prcmu_gate("msp02clk", NULL, PRCMU_MSP02CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_MSP1CLK] =
+		clk_reg_prcmu_gate("msp1clk", NULL, PRCMU_MSP1CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_I2CCLK] =
+		clk_reg_prcmu_gate("i2cclk", NULL, PRCMU_I2CCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_SLIMCLK] =
+		clk_reg_prcmu_gate("slimclk", NULL, PRCMU_SLIMCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_PER1CLK] =
+		clk_reg_prcmu_gate("per1clk", NULL, PRCMU_PER1CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_PER2CLK] =
+		clk_reg_prcmu_gate("per2clk", NULL, PRCMU_PER2CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_PER3CLK] =
+		clk_reg_prcmu_gate("per3clk", NULL, PRCMU_PER3CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_PER5CLK] =
+		clk_reg_prcmu_gate("per5clk", NULL, PRCMU_PER5CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_PER6CLK] =
+		clk_reg_prcmu_gate("per6clk", NULL, PRCMU_PER6CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_PER7CLK] =
+		clk_reg_prcmu_gate("per7clk", NULL, PRCMU_PER7CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_LCDCLK] =
+		clk_reg_prcmu_scalable("lcdclk", NULL, PRCMU_LCDCLK, 0,
+				       CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_BMLCLK] =
+		clk_reg_prcmu_opp_gate("bmlclk", NULL, PRCMU_BMLCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_HSITXCLK] =
+		clk_reg_prcmu_scalable("hsitxclk", NULL, PRCMU_HSITXCLK, 0,
+				       CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_HSIRXCLK] =
+		clk_reg_prcmu_scalable("hsirxclk", NULL, PRCMU_HSIRXCLK, 0,
+				       CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_HDMICLK] =
+		clk_reg_prcmu_scalable("hdmiclk", NULL, PRCMU_HDMICLK, 0,
+				       CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_APEATCLK] =
+		clk_reg_prcmu_gate("apeatclk", NULL, PRCMU_APEATCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_APETRACECLK] =
+		clk_reg_prcmu_scalable("apetraceclk", NULL, PRCMU_APETRACECLK, 0,
+				       CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_MCDECLK] =
+		clk_reg_prcmu_gate("mcdeclk", NULL, PRCMU_MCDECLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_IPI2CCLK] =
+		clk_reg_prcmu_opp_gate("ipi2cclk", NULL, PRCMU_IPI2CCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_DSIALTCLK] =
+		clk_reg_prcmu_gate("dsialtclk", NULL, PRCMU_DSIALTCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_DMACLK] =
+		clk_reg_prcmu_gate("dmaclk", NULL, PRCMU_DMACLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_B2R2CLK] =
+		clk_reg_prcmu_gate("b2r2clk", NULL, PRCMU_B2R2CLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_TVCLK] =
+		clk_reg_prcmu_scalable("tvclk", NULL, PRCMU_TVCLK, 0,
+				       CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_SSPCLK] =
+		clk_reg_prcmu_gate("sspclk", NULL, PRCMU_SSPCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_RNGCLK] =
+		clk_reg_prcmu_gate("rngclk", NULL, PRCMU_RNGCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_UICCCLK] =
+		clk_reg_prcmu_gate("uiccclk", NULL, PRCMU_UICCCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_TIMCLK] =
+		clk_reg_prcmu_gate("timclk", NULL, PRCMU_TIMCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_SYSCLK] =
+		clk_reg_prcmu_gate("ab8500_sysclk", NULL, PRCMU_SYSCLK, 0);
+	u8500_prcmu_hw_clks.hws[PRCMU_SDMMCCLK] =
+		clk_reg_prcmu_opp_volt_scalable("sdmmcclk", NULL,
+						PRCMU_SDMMCCLK, 100000000,
+						CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_PLLDSI] =
+		clk_reg_prcmu_scalable("dsi_pll", "hdmiclk",
+				       PRCMU_PLLDSI, 0, CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_DSI0CLK] =
+		clk_reg_prcmu_scalable("dsi0clk", "dsi_pll",
+				       PRCMU_DSI0CLK, 0, CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_DSI1CLK] =
+		clk_reg_prcmu_scalable("dsi1clk", "dsi_pll",
+				       PRCMU_DSI1CLK, 0, CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_DSI0ESCCLK] =
+		clk_reg_prcmu_scalable("dsi0escclk", "tvclk",
+				       PRCMU_DSI0ESCCLK, 0, CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_DSI1ESCCLK] =
+		clk_reg_prcmu_scalable("dsi1escclk", "tvclk",
+				       PRCMU_DSI1ESCCLK, 0, CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_DSI2ESCCLK] =
+		clk_reg_prcmu_scalable("dsi2escclk", "tvclk",
+				       PRCMU_DSI2ESCCLK, 0, CLK_SET_RATE_GATE);
+	u8500_prcmu_hw_clks.hws[PRCMU_ARMSS] =
+		clk_reg_prcmu_scalable_rate("armss", NULL,
+					    PRCMU_ARMSS, 0, CLK_IGNORE_UNUSED);
 
 	twd_clk = clk_register_fixed_factor(NULL, "smp_twd", "armss",
 				CLK_IGNORE_UNUSED, 1, 2);
@@ -546,13 +522,10 @@ static void u8500_clk_init(struct device_node *np)
 	PRCC_KCLK_STORE(clk, 6, 0);
 
 	for_each_child_of_node(np, child) {
-		static struct clk_onecell_data clk_data;
+		if (of_node_name_eq(child, "prcmu-clock"))
+			of_clk_add_hw_provider(child, of_clk_hw_onecell_get,
+					       &u8500_prcmu_hw_clks);
 
-		if (of_node_name_eq(child, "prcmu-clock")) {
-			clk_data.clks = prcmu_clk;
-			clk_data.clk_num = ARRAY_SIZE(prcmu_clk);
-			of_clk_add_provider(child, of_clk_src_onecell_get, &clk_data);
-		}
 		if (of_node_name_eq(child, "prcc-periph-clock"))
 			of_clk_add_provider(child, ux500_twocell_get, prcc_pclk);
 
-- 
2.35.1

