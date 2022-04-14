Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC030C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 14 Apr 2022 22:20:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346961AbiDNWXW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Apr 2022 18:23:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53586 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234101AbiDNWXW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Apr 2022 18:23:22 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8477D91ADB
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:20:55 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id a8so7487900ljq.5
        for <linux-clk@vger.kernel.org>; Thu, 14 Apr 2022 15:20:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3HbuRj0T+tIJkgh4UbgpPRnyRrBkRLgd0haqwdkhzus=;
        b=b59zANb6DbCjtjKvzaPBYCVzIAfsMZ9TvmVEbU4K2JJLlEj31z9nlmbQsuOeBqro5O
         5bPhzSDx7Jh0iFcAuap3UkeSiDqtBvLcWAlijup37VlpMvgTVheekpphN/4YxpC6Vtyj
         +C1ChWrP/sZ9CcsOOm8CMJwYgjSdQfEuphjdfyiN6fINjJSj0yMJTVJAOz4TvC6glO21
         fPJy2M8M13Eu7RGEh9HbNJQ1pNcp5ax69sDg5Q0RuzIPD4UTOSfMb/pbfDN6n7p0ZJwt
         iwYqc/vgkJvqFRO9OrSt1CCCHwMVTmeFdgj+xlzp/jmgd6w3NZoJEcWvXf37apLbrwwU
         Lyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3HbuRj0T+tIJkgh4UbgpPRnyRrBkRLgd0haqwdkhzus=;
        b=jYmNEWq+h2Lz+INrxe1Jo1EUGd+SZKpLCH7xf9fEQOoUERLM2D+dbPbjEBRzYDYRsV
         6tEqIwoQ46OzVBIUP8hytRb8rB1RQndX1RA/GlOQ3v56KYe3Z9mkwwPYYSp51VAs4+DQ
         VYhxn/aQeweLnfugZFAlbQx10FiYS+KVCof+LO4tUtzqyiHSperLWicRniRKwNGoQ7kJ
         Mt++UcDVMdgKZC03ROLKANSR5tLYknn4bSG5gcs/K9tDfxJGo+BwavVwHKLhsxPxThAu
         F8tT7Ou3LcBebOdNe0A7KLtYITr4mhFiS8b0tZKSbS2tKnbNuszMyc4WqhUwfvtzIJ7+
         Sbgg==
X-Gm-Message-State: AOAM530iAIsMEqq9rCR8wX+UR+QDiKBedDhk8HtaJDb2j9keKIcvQChP
        o8pGJPXIwX1d5fezx3GZAGVGsp5r84fEZA==
X-Google-Smtp-Source: ABdhPJxQ5li2xHJoiQp/uvzRj3Bj5OQJJo6krgFiCHgSl3PDUTST9Qj3z8H43LySp+14KEmOkfZBWw==
X-Received: by 2002:a05:651c:550:b0:24c:84ce:dcb3 with SMTP id q16-20020a05651c055000b0024c84cedcb3mr2818513ljp.516.1649974853737;
        Thu, 14 Apr 2022 15:20:53 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id j18-20020a056512029200b0046b9ba1c0edsm125169lfp.224.2022.04.14.15.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 15:20:53 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 5/5 v3] clk: ux500: Implement the missing CLKOUT clocks
Date:   Fri, 15 Apr 2022 00:17:51 +0200
Message-Id: <20220414221751.323525-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414221751.323525-1-linus.walleij@linaro.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This implements the two missing CLKOUT clocks for the ux500
(well really U8500/DB8500) SoC.

The clocks are initialized using a specific parent and
divider and these are specified in the device tree, see
the separate binding patch.

The implementation is a bit different in that it will only
create the clock in the clock framework if a user appears
in the device tree, rather than it being registered upfront
like most of the other clocks. This is because the clock
needs parameters for source and divider from the consumer
phandle for the clock to be set up properly when the clock
is registered.

There could be more than one user of a CLKOUT clock, but
we have not seen this in practice. If this happens the
framework prints and info and returns the previously
registered clock.

Using the clocks requires also muxing the CLKOUT1 or
CLKOUT2 to the appropriate pad. In practice this is
achived in a pinctrl handle in the DTS node for the device
using the CLKOUT clock, so this muxing is done separately
from the clock itself. Example:

  haptic@49 {
    compatible = "immersion,isa1200";
    reg = <0x49>;
    (...)
    /* clkout1 from ACLK divided by 8 */
    clocks = <&clkout_clk DB8500_CLKOUT_1 DB8500_CLKOUT_SRC_ACLK 8>;
    pinctrl-names = "default";
    pinctrl-0 = <&isa1200_janice_default>;
  };

  isa1200_janice_default: isa1200_janice {
    /* Bring out clkout1 on pin GPIO227 pin AH7 */
    janice_mux {
      function = "clkout";
      groups = "clkout1_a_1";
    };
    janice_cfg1 {
      pins = "GPIO227_AH7";
      ste,config = <&out_lo>;
    };
  (...)

This was tested successfully with the Immersion ISA1200
haptic feedback unit on the Samsung Galaxy S Advance GT-I9070
(Janice) mobile phone.

As the CLKOUT clocks need some undefined fixed rate parent
clocks that are currently missing from the PRCMU clock
implementation, the three simplest are added in this patch:
clk38m_to_clkgen, aclk and sysclk. The only parent not yet
available in the implementation is clk009, which is a kind
of special muxed and divided clock which isn't even
implemented in the vendor clock driver.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
ChangeLog v2->v3:
- Drop assigned but unused hw variable.
- Drop check for a zero divider in clkout_recalc_rate(): the core
  will check for this.
- Pick up Ulf's ACK.
- Rebase on v5.18-rc1
ChangeLog v1->v2:
- Drop the custom software .is_enabled tracking.
- Drop the custom software .is_prepared tracking.
- Use clk_hw_* calls and struct clk_hw all over.
- Fix const-correctness with const * const on the parent
  table
- Use u32 for the DT cell values, drop pointless < 0 check
- Reference ab8500_sysclk rather than creating a second
  instance of sysclk
- Drop extra paranthesis around expressions in
   if ((divider == 0) || (divider > 63))
---
 drivers/clk/ux500/clk-prcmu.c    | 114 +++++++++++++++++++++++++++++++
 drivers/clk/ux500/clk.h          |   5 ++
 drivers/clk/ux500/u8500_of_clk.c |  87 +++++++++++++++++++++--
 3 files changed, 199 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 4c1f3a6f5eb5..4deb37f19a7c 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -14,6 +14,7 @@
 #include "clk.h"
 
 #define to_clk_prcmu(_hw) container_of(_hw, struct clk_prcmu, hw)
+#define to_clk_prcmu_clkout(_hw) container_of(_hw, struct clk_prcmu_clkout, hw)
 
 struct clk_prcmu {
 	struct clk_hw hw;
@@ -21,6 +22,13 @@ struct clk_prcmu {
 	int opp_requested;
 };
 
+struct clk_prcmu_clkout {
+	struct clk_hw hw;
+	u8 clkout_id;
+	u8 source;
+	u8 divider;
+};
+
 /* PRCMU clock operations. */
 
 static int clk_prcmu_prepare(struct clk_hw *hw)
@@ -284,3 +292,109 @@ struct clk_hw *clk_reg_prcmu_opp_volt_scalable(const char *name,
 	return clk_reg_prcmu(name, parent_name, cg_sel, rate, flags,
 			&clk_prcmu_opp_volt_scalable_ops);
 }
+
+/* The clkout (external) clock is special and need special ops */
+
+static int clk_prcmu_clkout_prepare(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+
+	return prcmu_config_clkout(clk->clkout_id, clk->source, clk->divider);
+}
+
+static void clk_prcmu_clkout_unprepare(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+	int ret;
+
+	/* The clkout clock is disabled by dividing by 0 */
+	ret = prcmu_config_clkout(clk->clkout_id, clk->source, 0);
+	if (ret)
+		pr_err("clk_prcmu: %s failed to disable %s\n", __func__,
+		       clk_hw_get_name(hw));
+}
+
+static unsigned long clk_prcmu_clkout_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+
+	return (parent_rate / clk->divider);
+}
+
+static u8 clk_prcmu_clkout_get_parent(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+
+	return clk->source;
+}
+
+static int clk_prcmu_clkout_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+
+	clk->source = index;
+	/* Make sure the change reaches the hardware immediately */
+	if (clk_hw_is_prepared(hw))
+		return clk_prcmu_clkout_prepare(hw);
+	return 0;
+}
+
+static const struct clk_ops clk_prcmu_clkout_ops = {
+	.prepare = clk_prcmu_clkout_prepare,
+	.unprepare = clk_prcmu_clkout_unprepare,
+	.recalc_rate = clk_prcmu_clkout_recalc_rate,
+	.get_parent = clk_prcmu_clkout_get_parent,
+	.set_parent = clk_prcmu_clkout_set_parent,
+};
+
+struct clk_hw *clk_reg_prcmu_clkout(const char *name,
+				    const char * const *parent_names,
+				    int num_parents,
+				    u8 source, u8 divider)
+
+{
+	struct clk_prcmu_clkout *clk;
+	struct clk_init_data clk_prcmu_clkout_init;
+	u8 clkout_id;
+	int ret;
+
+	if (!name) {
+		pr_err("clk_prcmu_clkout: %s invalid arguments passed\n", __func__);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (!strcmp(name, "clkout1"))
+		clkout_id = 0;
+	else if (!strcmp(name, "clkout2"))
+		clkout_id = 1;
+	else {
+		pr_err("clk_prcmu_clkout: %s bad clock name\n", __func__);
+		return ERR_PTR(-EINVAL);
+	}
+
+	clk = kzalloc(sizeof(*clk), GFP_KERNEL);
+	if (!clk)
+		return ERR_PTR(-ENOMEM);
+
+	clk->clkout_id = clkout_id;
+	clk->source = source;
+	clk->divider = divider;
+
+	clk_prcmu_clkout_init.name = name;
+	clk_prcmu_clkout_init.ops = &clk_prcmu_clkout_ops;
+	clk_prcmu_clkout_init.flags = CLK_GET_RATE_NOCACHE;
+	clk_prcmu_clkout_init.parent_names = parent_names;
+	clk_prcmu_clkout_init.num_parents = num_parents;
+	clk->hw.init = &clk_prcmu_clkout_init;
+
+	ret = clk_hw_register(NULL, &clk->hw);
+	if (ret)
+		goto free_clkout;
+
+	return &clk->hw;
+free_clkout:
+	kfree(clk);
+	pr_err("clk_prcmu_clkout: %s failed to register clk\n", __func__);
+	return ERR_PTR(-ENOMEM);
+}
diff --git a/drivers/clk/ux500/clk.h b/drivers/clk/ux500/clk.h
index b443c3f257b1..91003cf8003c 100644
--- a/drivers/clk/ux500/clk.h
+++ b/drivers/clk/ux500/clk.h
@@ -60,6 +60,11 @@ struct clk_hw *clk_reg_prcmu_opp_volt_scalable(const char *name,
 					       unsigned long rate,
 					       unsigned long flags);
 
+struct clk_hw *clk_reg_prcmu_clkout(const char *name,
+				    const char * const *parent_names,
+				    int num_parents,
+				    u8 source, u8 divider);
+
 struct clk *clk_reg_sysctrl_gate(struct device *dev,
 				 const char *name,
 				 const char *parent_name,
diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
index 6aa89645f5fa..8e2f6c65db2a 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -17,6 +17,7 @@
 
 static struct clk *prcc_pclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
 static struct clk *prcc_kclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
+static struct clk_hw *clkout_clk[2];
 
 #define PRCC_SHOW(clk, base, bit) \
 	clk[(base * PRCC_PERIPHS_PER_CLUSTER) + bit]
@@ -56,6 +57,71 @@ static struct clk_hw_onecell_data u8500_prcmu_hw_clks = {
 	.num = PRCMU_NUM_CLKS,
 };
 
+/* Essentially names for the first PRCMU_CLKSRC_* defines */
+static const char * const u8500_clkout_parents[] = {
+	"clk38m_to_clkgen",
+	"aclk",
+	/* Just called "sysclk" in documentation */
+	"ab8500_sysclk",
+	"lcdclk",
+	"sdmmcclk",
+	"tvclk",
+	"timclk",
+	/* CLK009 is not implemented, add it if you need it */
+	"clk009",
+};
+
+static struct clk_hw *ux500_clkout_get(struct of_phandle_args *clkspec,
+				       void *data)
+{
+	u32 id, source, divider;
+	struct clk_hw *clkout;
+
+	if (clkspec->args_count != 3)
+		return  ERR_PTR(-EINVAL);
+
+	id = clkspec->args[0];
+	source = clkspec->args[1];
+	divider = clkspec->args[2];
+
+	if (id > 1) {
+		pr_err("%s: invalid clkout ID %d\n", __func__, id);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (clkout_clk[id]) {
+		pr_info("%s: clkout%d already registered, not reconfiguring\n",
+			__func__, id + 1);
+		return clkout_clk[id];
+	}
+
+	if (source > 7) {
+		pr_err("%s: invalid source ID %d\n", __func__, source);
+		return ERR_PTR(-EINVAL);
+	}
+
+	if (divider == 0 || divider > 63) {
+		pr_err("%s: invalid divider %d\n", __func__, divider);
+		return ERR_PTR(-EINVAL);
+	}
+
+	pr_debug("registering clkout%d with source %d and divider %d\n",
+		 id + 1, source, divider);
+
+	clkout = clk_reg_prcmu_clkout(id ? "clkout2" : "clkout1",
+				      u8500_clkout_parents,
+				      ARRAY_SIZE(u8500_clkout_parents),
+				      source, divider);
+	if (IS_ERR(clkout)) {
+		pr_err("failed to register clkout%d\n",  id + 1);
+		return ERR_CAST(clkout);
+	}
+
+	clkout_clk[id] = clkout;
+
+	return clkout;
+}
+
 static void u8500_clk_init(struct device_node *np)
 {
 	struct prcmu_fw_version *fw_version;
@@ -99,7 +165,17 @@ static void u8500_clk_init(struct device_node *np)
 		clk_reg_prcmu_gate("ddr_pll", NULL, PRCMU_PLLDDR,
 				   CLK_IGNORE_UNUSED);
 
-	/* FIXME: Add sys, ulp and int clocks here. */
+	/*
+	 * Read-only clocks that only return their current rate, only used
+	 * as parents to other clocks and not visible in the device tree.
+	 * clk38m_to_clkgen is the same as the SYSCLK, i.e. the root clock.
+	 */
+	clk_reg_prcmu_rate("clk38m_to_clkgen", NULL, PRCMU_SYSCLK,
+			   CLK_IGNORE_UNUSED);
+	clk_reg_prcmu_rate("aclk", NULL, PRCMU_ACLK,
+			   CLK_IGNORE_UNUSED);
+
+	/* TODO: add CLK009 if needed */
 
 	rtc_clk = clk_register_fixed_rate(NULL, "rtc32k", "NULL",
 				CLK_IGNORE_UNUSED,
@@ -223,12 +299,6 @@ static void u8500_clk_init(struct device_node *np)
 	twd_clk = clk_register_fixed_factor(NULL, "smp_twd", "armss",
 				CLK_IGNORE_UNUSED, 1, 2);
 
-	/*
-	 * FIXME: Add special handled PRCMU clocks here:
-	 * 1. clkout0yuv, use PRCMU as parent + need regulator + pinctrl.
-	 * 2. ab9540_clkout1yuv, see clkout0yuv
-	 */
-
 	/* PRCC P-clocks */
 	clk = clk_reg_prcc_pclk("p1_pclk0", "per1clk", bases[CLKRST1_INDEX],
 				BIT(0), 0);
@@ -526,6 +596,9 @@ static void u8500_clk_init(struct device_node *np)
 			of_clk_add_hw_provider(child, of_clk_hw_onecell_get,
 					       &u8500_prcmu_hw_clks);
 
+		if (of_node_name_eq(child, "clkout-clock"))
+			of_clk_add_hw_provider(child, ux500_clkout_get, NULL);
+
 		if (of_node_name_eq(child, "prcc-periph-clock"))
 			of_clk_add_provider(child, ux500_twocell_get, prcc_pclk);
 
-- 
2.35.1

