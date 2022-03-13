Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 457B2C433EF
	for <linux-clk@archiver.kernel.org>; Sun, 13 Mar 2022 23:32:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233313AbiCMXdG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 13 Mar 2022 19:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234564AbiCMXdD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 13 Mar 2022 19:33:03 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 767429FF7
        for <linux-clk@vger.kernel.org>; Sun, 13 Mar 2022 16:31:53 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 17so17435387lji.1
        for <linux-clk@vger.kernel.org>; Sun, 13 Mar 2022 16:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fS9P1J8XAgQrefHK4KhCGZ3S5037lPIlS4bra/w17VM=;
        b=BjhAU0M45eLrGFkEE1RfZx2aC7eDYVICpcfIZkoEoWEeC4jlIgX96Y5qnACl0axU7q
         QwPhp8FG9zmttcF61En6OdCCV02KoW3vazqBHe4645nhrtCg4gfXcVfy+DCAwT03Umag
         JG7q4A9nrDk9JJnt//ZvOzOlBQevVMgOcmCovXeF8H7Z0aFxLaMbsagqC1tEa3JV01jz
         c3o6nlZyZZY6S9G8qN0BY5/Y4veNe2FduWkXUEfIq946gguRXHcD4ihQX4HvLDKQo+Wd
         olNNrbrXlLD0RM/vFMg476iGn1vyskOriSbrp2sPs49ncxx3UjdxQ3csecVoIBh2qess
         qRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fS9P1J8XAgQrefHK4KhCGZ3S5037lPIlS4bra/w17VM=;
        b=Y6zlOtJJKuQcvU8EZG4N5lUiPiUTMqV6CaFV4SUfXJF8iDA9zhHI1AcgmcT4HmxwX1
         M+6l/FfX9uejSpvPceyeYwHy04dQ35axERQ5meiF4Naypkd+zNDQ9Hxd8vnnnhODR79R
         WJd7lx9Z5NbLnpemloqaCmDgWFyp6a2ca+tDFUsS9R1ASsUHCp+p67/MRhhnAxb0oOvj
         fvDGHUIHusyysKHvYX+ZSh0J0zY3VU9nfXekoPhSFwxJgdExJBXbyeqCX4wMf5/aNXax
         QgCBNNbhEUlMEb8X3rRDbyBA8zDrwbtGv50fdfo/VX/KwmXSI3T25IJTr5S092+PQiH9
         k99A==
X-Gm-Message-State: AOAM532Rv2VmKw0+FMYBrV3XbGMs3fEZ4X9yjrMlMuJwyh/opicPnWfc
        9/qSFh3GOvEhZ/PaiColpRVDU89yVlwseg==
X-Google-Smtp-Source: ABdhPJxrmfddi6p56JT7LZI1KbtXx1Bco30juluFwkWW+zh/pomb3uaWOlgZuDA3BX3nwlNu2D8WxA==
X-Received: by 2002:a2e:824b:0:b0:246:1246:d830 with SMTP id j11-20020a2e824b000000b002461246d830mr12864713ljh.267.1647214311759;
        Sun, 13 Mar 2022 16:31:51 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id i16-20020a2e5410000000b0024647722a4asm3496408ljb.29.2022.03.13.16.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Mar 2022 16:31:51 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 2/2] clk: ux500: Implement the missing CLKOUT clocks
Date:   Mon, 14 Mar 2022 00:29:26 +0100
Message-Id: <20220313232926.1004842-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220313232926.1004842-1-linus.walleij@linaro.org>
References: <20220313232926.1004842-1-linus.walleij@linaro.org>
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

Cc: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
 drivers/clk/ux500/clk-prcmu.c    | 151 +++++++++++++++++++++++++++++++
 drivers/clk/ux500/clk.h          |   4 +
 drivers/clk/ux500/u8500_of_clk.c |  89 ++++++++++++++++--
 3 files changed, 237 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 937b6bb82b30..e6a27c917126 100644
--- a/drivers/clk/ux500/clk-prcmu.c
+++ b/drivers/clk/ux500/clk-prcmu.c
@@ -14,6 +14,7 @@
 #include "clk.h"
 
 #define to_clk_prcmu(_hw) container_of(_hw, struct clk_prcmu, hw)
+#define to_clk_prcmu_clkout(_hw) container_of(_hw, struct clk_prcmu_clkout, hw)
 
 struct clk_prcmu {
 	struct clk_hw hw;
@@ -23,6 +24,15 @@ struct clk_prcmu {
 	int opp_requested;
 };
 
+struct clk_prcmu_clkout {
+	struct clk_hw hw;
+	u8 clkout_id;
+	u8 source;
+	u8 divider;
+	int is_prepared;
+	int is_enabled;
+};
+
 /* PRCMU clock operations. */
 
 static int clk_prcmu_prepare(struct clk_hw *hw)
@@ -344,3 +354,144 @@ struct clk *clk_reg_prcmu_opp_volt_scalable(const char *name,
 	return clk_reg_prcmu(name, parent_name, cg_sel, rate, flags,
 			&clk_prcmu_opp_volt_scalable_ops);
 }
+
+/* The clkout (external) clock is special and need special ops */
+
+static int clk_prcmu_clkout_prepare(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+	int ret;
+
+	ret = prcmu_config_clkout(clk->clkout_id, clk->source, clk->divider);
+	if (!ret)
+		clk->is_prepared = 1;
+
+	return ret;
+}
+
+static void clk_prcmu_clkout_unprepare(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+	int ret;
+
+	/* The clkout clock is disabled by dividing by 0 */
+	ret = prcmu_config_clkout(clk->clkout_id, clk->source, 0);
+	if (!ret)
+		clk->is_prepared = 0;
+}
+
+static int clk_prcmu_clkout_is_prepared(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+	return clk->is_prepared;
+}
+
+static int clk_prcmu_clkout_enable(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+	clk->is_enabled = 1;
+	return 0;
+}
+
+static void clk_prcmu_clkout_disable(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+	clk->is_enabled = 0;
+}
+
+static int clk_prcmu_clkout_is_enabled(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+	return clk->is_enabled;
+}
+
+static unsigned long clk_prcmu_clkout_recalc_rate(struct clk_hw *hw,
+						  unsigned long parent_rate)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+
+	if (!clk->divider)
+		return 0;
+	return (parent_rate / clk->divider);
+}
+
+static u8 clk_prcmu_clkout_get_parent(struct clk_hw *hw)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+	return clk->source;
+}
+
+static int clk_prcmu_clkout_set_parent(struct clk_hw *hw, u8 index)
+{
+	struct clk_prcmu_clkout *clk = to_clk_prcmu_clkout(hw);
+
+	clk->source = index;
+	/* Make sure the change reaches the hardware immediately */
+	if (clk->is_prepared)
+		return clk_prcmu_clkout_prepare(hw);
+	return 0;
+}
+
+static const struct clk_ops clk_prcmu_clkout_ops = {
+	.prepare = clk_prcmu_clkout_prepare,
+	.unprepare = clk_prcmu_clkout_unprepare,
+	.is_prepared = clk_prcmu_clkout_is_prepared,
+	.enable = clk_prcmu_clkout_enable,
+	.disable = clk_prcmu_clkout_disable,
+	.is_enabled = clk_prcmu_clkout_is_enabled,
+	.recalc_rate = clk_prcmu_clkout_recalc_rate,
+	.get_parent = clk_prcmu_clkout_get_parent,
+	.set_parent = clk_prcmu_clkout_set_parent,
+};
+
+struct clk *clk_reg_prcmu_clkout(const char *name,
+				 const char **parent_names, int num_parents,
+				 u8 source, u8 divider)
+
+{
+	struct clk_prcmu_clkout *clk;
+	struct clk_init_data clk_prcmu_clkout_init;
+	struct clk *clk_reg;
+	u8 clkout_id;
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
+	clk->is_prepared = 1;
+	clk->is_enabled = 1;
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
+	clk_reg = clk_register(NULL, &clk->hw);
+	if (IS_ERR_OR_NULL(clk_reg))
+		goto free_clkout;
+
+	return clk_reg;
+free_clkout:
+	kfree(clk);
+	pr_err("clk_prcmu_clkout: %s failed to register clk\n", __func__);
+	return ERR_PTR(-ENOMEM);
+}
diff --git a/drivers/clk/ux500/clk.h b/drivers/clk/ux500/clk.h
index 40cd9fc95b8b..0a656a7212ae 100644
--- a/drivers/clk/ux500/clk.h
+++ b/drivers/clk/ux500/clk.h
@@ -59,6 +59,10 @@ struct clk *clk_reg_prcmu_opp_volt_scalable(const char *name,
 					    unsigned long rate,
 					    unsigned long flags);
 
+struct clk *clk_reg_prcmu_clkout(const char *name,
+				 const char **parent_names, int num_parents,
+				 u8 source, u8 divider);
+
 struct clk *clk_reg_sysctrl_gate(struct device *dev,
 				 const char *name,
 				 const char *parent_name,
diff --git a/drivers/clk/ux500/u8500_of_clk.c b/drivers/clk/ux500/u8500_of_clk.c
index e86ed2eec3fd..dfe8794b3e78 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -18,6 +18,7 @@
 static struct clk *prcmu_clk[PRCMU_NUM_CLKS];
 static struct clk *prcc_pclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
 static struct clk *prcc_kclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
+static struct clk *clkout_clk[2];
 
 #define PRCC_SHOW(clk, base, bit) \
 	clk[(base * PRCC_PERIPHS_PER_CLUSTER) + bit]
@@ -46,6 +47,70 @@ static struct clk *ux500_twocell_get(struct of_phandle_args *clkspec,
 	return PRCC_SHOW(clk_data, base, bit);
 }
 
+/* Essentially names for the first PRCMU_CLKSRC_* defines */
+static const char *u8500_clkout_parents[] = {
+	"clk38m_to_clkgen",
+	"aclk",
+	"sysclk",
+	"lcdclk",
+	"sdmmcclk",
+	"tvclk",
+	"timclk",
+	/* CLK009 is not implemented, add it if you need it */
+	"clk009",
+};
+
+static struct clk *ux500_clkout_get(struct of_phandle_args *clkspec,
+				    void *data)
+{
+	int id, source, divider;
+	struct clk *clkout;
+
+	if (clkspec->args_count != 3)
+		return  ERR_PTR(-EINVAL);
+
+	id = clkspec->args[0];
+	source = clkspec->args[1];
+	divider = clkspec->args[2];
+
+	if (id < 0 || id > 1) {
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
+	if ((divider == 0) || (divider > 63)) {
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
@@ -89,7 +154,19 @@ static void u8500_clk_init(struct device_node *np)
 				CLK_IGNORE_UNUSED);
 	prcmu_clk[PRCMU_PLLDDR] = clk;
 
-	/* FIXME: Add sys, ulp and int clocks here. */
+	/*
+	 * Read-only clocks that only return their current rate, only used
+	 * as parents to other clocks and not visible in the device tree.
+	 * clk38m_to_clkgen is the same as the SYSCLK, i.e. the root clock.
+	 */
+	clk = clk_reg_prcmu_rate("clk38m_to_clkgen", NULL, PRCMU_SYSCLK,
+				 CLK_IGNORE_UNUSED);
+	clk = clk_reg_prcmu_rate("aclk", NULL, PRCMU_ACLK,
+				 CLK_IGNORE_UNUSED);
+	clk = clk_reg_prcmu_rate("sysclk", NULL, PRCMU_SYSCLK,
+				 CLK_IGNORE_UNUSED);
+
+	/* TODO: add CLK009 if needed */
 
 	rtc_clk = clk_register_fixed_rate(NULL, "rtc32k", "NULL",
 				CLK_IGNORE_UNUSED,
@@ -247,12 +324,6 @@ static void u8500_clk_init(struct device_node *np)
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
@@ -553,6 +624,10 @@ static void u8500_clk_init(struct device_node *np)
 			clk_data.clk_num = ARRAY_SIZE(prcmu_clk);
 			of_clk_add_provider(child, of_clk_src_onecell_get, &clk_data);
 		}
+
+		if (of_node_name_eq(child, "clkout-clock"))
+			of_clk_add_provider(child, ux500_clkout_get, NULL);
+
 		if (of_node_name_eq(child, "prcc-periph-clock"))
 			of_clk_add_provider(child, ux500_twocell_get, prcc_pclk);
 
-- 
2.35.1

