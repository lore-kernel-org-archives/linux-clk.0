Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BAFCC433EF
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 11:03:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345327AbiD1LGT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 07:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47194 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345329AbiD1LGC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 07:06:02 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A57AA0BC7;
        Thu, 28 Apr 2022 04:01:32 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.net.upcbroadband.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 48FBF80818;
        Thu, 28 Apr 2022 13:01:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1651143690;
        bh=OTJmCYIGJKDg2UvefjgUCbOf8Ly1kmvlDv+B3diiXHk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=z96GsWWeNjdfbcH5nsKdBF1L6fVKX+FcUwgl6T8itJC23WQS9JiFb1g1DDj3j9lqG
         OtOqY6XSWGX17ZK9rXtqokPMhXeRDN7DYePtKOm/7baoErM8LibeE8+7TbzswV7u8r
         ewMwR/9SGLqs1YtccHX9EPtSv2jn3lnqww/OMNfAvwbmfzEKPm32lkDspYlEZ4Jhiq
         XXqw6K9r60iNlXPkroZGbYUNKr0w7c0Xk1UMxL2JjUNlM+gdyjxl0VEEQIuSNbz33w
         ThKgkq8dc/fYTR/tNd+TwyPY1aPzSxMLKVK+3PbYXT8hFsUCPVqK5mAuvrihglXi7m
         AMRVZ6mq9TQjQ==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [RESEND][PATCH v2 2/2] clk: Introduce 'critical-clocks' property
Date:   Thu, 28 Apr 2022 13:01:07 +0200
Message-Id: <20220428110107.149524-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220428110107.149524-1-marex@denx.de>
References: <20220428110107.149524-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some platforms require select clock to be always running, e.g. because
those clock supply vital devices which are not otherwise attached to
the system and thus do not have a matching DT node and clock consumer.

An example is a system where the SoC serves as a crystal oscillator
replacement for a programmable logic device. The "critical-clocks"
property of a clock controller allows listing clock which must never
be turned off.

Clock listed in the "critical-clocks" property may have other consumers
in DT, listing the clock in "critical-clocks" only assures those clock
are never turned off, and none of these optional additional consumers
can turn the clock off either. This is achieved by adding CLK_IS_CRITICAL
flag to these critical clock.

This flag has thus far been added to select clock by hard-coding it in
various clock drivers, this patch provides generic DT interface to add
the flag to arbitrary clock that may be critical.

The implementation is modeled after "protected-clocks", except the protected
clock property is currently driver specific. This patch attempts to provide
a generic implementation of "critical-clocks" instead.

Unlike "assigned-clocks", the "critical-clocks" must be parsed much earlier
in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data .flags
field.

The new match_clkspec() callback is used to determine whether struct clk_hw
that is currently being registered matches the clock specifier in the DT
"critical-clocks" property, and if so, then the CLK_IS_CRITICAL is added to
these newly registered clock. This callback can only be driver specific.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
To: linux-clk@vger.kernel.org
---
V2: - Warn in case critical-clock field cannot be parsed and skip those clock
    - Use match_clkspec() only for non-zero clock-cells controllers
    - Pull the critical-clock code into __clk_register_critical_clock()
    - Update commit message
---
 drivers/clk/clk.c            | 44 ++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  3 +++
 2 files changed, 47 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f00d4c1158d7..a89c91dfa11b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3902,6 +3902,48 @@ static void clk_core_free_parent_map(struct clk_core *core)
 	kfree(core->parents);
 }
 
+static void
+__clk_register_critical_clock(struct device_node *np, struct clk_core *core,
+			      struct clk_hw *hw)
+{
+	struct of_phandle_args clkspec;
+	u32 clksize, clktotal;
+	int ret, i, index;
+
+	if (!np)
+		return;
+
+	if (of_property_read_u32(np, "#clock-cells", &clksize))
+		return;
+
+	/* Clock node with #clock-cells = <0> uses critical-clocks; */
+	if (clksize == 0) {
+		if (of_property_read_bool(np, "critical-clocks"))
+			core->flags |= CLK_IS_CRITICAL;
+		return;
+	}
+
+	if (!core->ops->match_clkspec)
+		return;
+
+	clkspec.np = np;
+	clktotal = of_property_count_u32_elems(np, "critical-clocks");
+	clktotal /= clksize;
+	for (index = 0; index < clktotal; index++) {
+		for (i = 0; i < clksize; i++) {
+			ret = of_property_read_u32_index(np, "critical-clocks",
+							 (index * clksize) + i,
+							 &(clkspec.args[i]));
+			if (ret) {
+				pr_warn("Skipping critical-clocks index %d (ret=%d)\n",
+					i, ret);
+			}
+		}
+		if (!core->ops->match_clkspec(hw, &clkspec))
+			core->flags |= CLK_IS_CRITICAL;
+	}
+}
+
 static struct clk *
 __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 {
@@ -3946,6 +3988,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->min_rate = 0;
 	core->max_rate = ULONG_MAX;
 
+	__clk_register_critical_clock(np, core, hw);
+
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e2..f65f6ef4e998 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -205,6 +205,8 @@ struct clk_duty {
  *		directory is provided as an argument.  Called with
  *		prepare_lock held.  Returns 0 on success, -EERROR otherwise.
  *
+ * @match_clkspec: Check whether clk_hw matches DT clock specifier.
+ *		Returns 0 on success, -EERROR otherwise.
  *
  * The clk_enable/clk_disable and clk_prepare/clk_unprepare pairs allow
  * implementations to split any work between atomic (enable) and sleepable
@@ -252,6 +254,7 @@ struct clk_ops {
 	int		(*init)(struct clk_hw *hw);
 	void		(*terminate)(struct clk_hw *hw);
 	void		(*debug_init)(struct clk_hw *hw, struct dentry *dentry);
+	int		(*match_clkspec)(struct clk_hw *hw, struct of_phandle_args *clkspec);
 };
 
 /**
-- 
2.35.1

