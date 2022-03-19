Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C556C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 19 Mar 2022 23:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244333AbiCSXCX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Mar 2022 19:02:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244332AbiCSXCV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Mar 2022 19:02:21 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC6A1A9C8E
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:57 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id h7so1908005lfl.2
        for <linux-clk@vger.kernel.org>; Sat, 19 Mar 2022 16:00:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AXrF/QUZIJ/g2tq/AcJFm/biPJJeGIWETKdd1rNt5eI=;
        b=cqlXmt5Nc44R8DWDgNIdEY3BvG4wY4BmsaHrg7RODK2oocUmqqKN/1AY5gIQCF3DCC
         6Y0D8jCAJ5tYjkOuDq3vZDCP2ITh+kSLEeJB+5KqPMbiWRN1jp+roNRD4kBVnGSWAS0r
         oALw9HPf0MgUw2xZZze2ivoCtprH/10aP2eh+xXy5YI6Y4FqFyUSZeEJNZAWQWFgQWR6
         Zj6R6wLYh3VibRF4BiBfyJiSlNlyvaPXiDxcL2VMWNz4yA59csIcrz7CAMrExZfoj58g
         nHTtVqHOjHHz8hTe/RO6btsQFccxsDzmGls81qiIb8U1c0IVRShsmykFYAKjDF9potKI
         2gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AXrF/QUZIJ/g2tq/AcJFm/biPJJeGIWETKdd1rNt5eI=;
        b=QFK/1DZ84sKAsYnNMH0nIjpSCMyl5L2L+r8t7Zv+9gTEwI8GKv7dFVsApidDhXg3oK
         XFRrzF5MojhFoP9tvSQm7lFx6Ypbr0Yvg6LYX4MADc9NUGPV0cJr5me4UMWJzbFqOnWl
         TRbmqi8JR++1Z1mwaFjYT8TCn7tHALWPr/4gKsUEcqGiCF61WWwJwSLrV2a/NCEaTYXI
         jrt9yCadnqyR0W6fxQt5wkzAF10V4yCPRolvnpxU4n6BZ1jLwcTEOByhTLG7nHLUyIXk
         EeH23/2GsyWZBWJWcVFJh3V1HAppt3u4SqVcatOePA/ETjo48KdwilTHwMPcgiGI9BRI
         o6/Q==
X-Gm-Message-State: AOAM533yksvmDv0VDW1wu0EOxYCilbpyYC1ypyCrfrxCtSsHdG0qbNw6
        GA3KOtXOr0/FnXeyH2NfYCa7wQ==
X-Google-Smtp-Source: ABdhPJwUPwgwr81PyPCK+OyrhmGexuF1Kz0ZZuAjp1gJuCFCvMQ/Ac2c9MkjLWR/odiCoqBsyOVvVA==
X-Received: by 2002:ac2:50d1:0:b0:44a:12e5:9d3e with SMTP id h17-20020ac250d1000000b0044a12e59d3emr4260369lfm.25.1647730855205;
        Sat, 19 Mar 2022 16:00:55 -0700 (PDT)
Received: from localhost.localdomain (c-fdcc225c.014-348-6c756e10.bbcust.telenor.se. [92.34.204.253])
        by smtp.gmail.com with ESMTPSA id z5-20020a196505000000b0044a12b953f9sm581520lfb.45.2022.03.19.16.00.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Mar 2022 16:00:54 -0700 (PDT)
From:   Linus Walleij <linus.walleij@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 5/5 v2] clk: ux500: Implement the missing CLKOUT clocks
Date:   Sat, 19 Mar 2022 23:51:56 +0100
Message-Id: <20220319225156.1451636-6-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220319225156.1451636-1-linus.walleij@linaro.org>
References: <20220319225156.1451636-1-linus.walleij@linaro.org>
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
 drivers/clk/ux500/clk-prcmu.c    | 115 +++++++++++++++++++++++++++++++
 drivers/clk/ux500/clk.h          |   5 ++
 drivers/clk/ux500/u8500_of_clk.c |  88 +++++++++++++++++++++--
 3 files changed, 201 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/ux500/clk-prcmu.c b/drivers/clk/ux500/clk-prcmu.c
index 4c1f3a6f5eb5..4c3ea84c9474 100644
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
@@ -284,3 +292,110 @@ struct clk_hw *clk_reg_prcmu_opp_volt_scalable(const char *name,
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
index 6aa89645f5fa..e855ce35db0e 100644
--- a/drivers/clk/ux500/u8500_of_clk.c
+++ b/drivers/clk/ux500/u8500_of_clk.c
@@ -17,6 +17,7 @@
 
 static struct clk *prcc_pclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
 static struct clk *prcc_kclk[(PRCC_NUM_PERIPH_CLUSTERS + 1) * PRCC_PERIPHS_PER_CLUSTER];
+static struct clk_hw *clkout_clk[2];
 
 #define PRCC_SHOW(clk, base, bit) \
 	clk[(base * PRCC_PERIPHS_PER_CLUSTER) + bit]
@@ -56,12 +57,78 @@ static struct clk_hw_onecell_data u8500_prcmu_hw_clks = {
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
 	struct device_node *child = NULL;
 	const char *sgaclk_parent = NULL;
 	struct clk *clk, *rtc_clk, *twd_clk;
+	struct clk_hw *hw;
 	u32 bases[CLKRST_MAX];
 	struct u8500_prcc_reset *rstc;
 	int i;
@@ -99,7 +166,17 @@ static void u8500_clk_init(struct device_node *np)
 		clk_reg_prcmu_gate("ddr_pll", NULL, PRCMU_PLLDDR,
 				   CLK_IGNORE_UNUSED);
 
-	/* FIXME: Add sys, ulp and int clocks here. */
+	/*
+	 * Read-only clocks that only return their current rate, only used
+	 * as parents to other clocks and not visible in the device tree.
+	 * clk38m_to_clkgen is the same as the SYSCLK, i.e. the root clock.
+	 */
+	hw = clk_reg_prcmu_rate("clk38m_to_clkgen", NULL, PRCMU_SYSCLK,
+				CLK_IGNORE_UNUSED);
+	hw = clk_reg_prcmu_rate("aclk", NULL, PRCMU_ACLK,
+				CLK_IGNORE_UNUSED);
+
+	/* TODO: add CLK009 if needed */
 
 	rtc_clk = clk_register_fixed_rate(NULL, "rtc32k", "NULL",
 				CLK_IGNORE_UNUSED,
@@ -223,12 +300,6 @@ static void u8500_clk_init(struct device_node *np)
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
@@ -526,6 +597,9 @@ static void u8500_clk_init(struct device_node *np)
 			of_clk_add_hw_provider(child, of_clk_hw_onecell_get,
 					       &u8500_prcmu_hw_clks);
 
+		if (of_node_name_eq(child, "clkout-clock"))
+			of_clk_add_hw_provider(child, ux500_clkout_get, NULL);
+
 		if (of_node_name_eq(child, "prcc-periph-clock"))
 			of_clk_add_provider(child, ux500_twocell_get, prcc_pclk);
 
-- 
2.35.1

