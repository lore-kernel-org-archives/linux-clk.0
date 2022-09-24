Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB494C32771
	for <linux-clk@archiver.kernel.org>; Sat, 24 Sep 2022 17:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbiIXRpk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 24 Sep 2022 13:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233632AbiIXRpj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 24 Sep 2022 13:45:39 -0400
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32B1939121;
        Sat, 24 Sep 2022 10:45:37 -0700 (PDT)
Received: from tr.lan (ip-86-49-12-201.bb.vodafone.cz [86.49.12.201])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 7B3A48495E;
        Sat, 24 Sep 2022 19:45:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1664041534;
        bh=qIFcIezrXrOHgIKdBiMre65MVCrmMAuokY8XP9IA3QY=;
        h=From:To:Cc:Subject:Date:From;
        b=l2sntq8+avmTZwb2QfTd1HLnpjNAjdeE385kuI1i3e1oLezZvlZnGAXMockwLliad
         WMH1YRm+zqUW3ZBsArSSIZBK/Bzyyt96/Oi44xmX7nUEWrDwXU7Q0bxdPcuTm9FqMc
         ZqQbtIkRQrQMixS3LscMS1sqnRBh23JI+elCxdT9JioiK1YElR7vghy3Htd9v0tdZ5
         I1ELhZDZE7iY/s1ZW3rrfkO7VUVjzAGXY1o06ahLmy6KyVmFjEmY73y6IVoU/W9q7a
         e/iIadleVpjigeMs6ZfSRKl17kY/t8uxUU9m7Qzx+m3bPX67lZQ5hd6sIssr4dQe1M
         LnCmoAq8xYHKw==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v4] clk: Introduce 'always-on-clocks' property
Date:   Sat, 24 Sep 2022 19:45:17 +0200
Message-Id: <20220924174517.458657-1-marex@denx.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some platforms require select clock to be always running, e.g. because
those clock supply vital devices which are not otherwise attached to
the system and thus do not have a matching DT node and clock consumer.

An example is a system where the SoC serves as a crystal oscillator
replacement for a programmable logic device. The "always-on-clocks"
property of a clock controller allows listing clock which must never
be turned off.

Clock listed in the "always-on-clocks" property may have other consumers
in DT, listing the clock in "always-on-clocks" only assures those clock
are never turned off, and none of these optional additional consumers
can turn the clock off either. This is achieved by adding CLK_IS_CRITICAL
flag to these critical clock.

This flag has thus far been added to select clock by hard-coding it in
various clock drivers, this patch provides generic DT interface to add
the flag to arbitrary clock that may be critical.

The implementation is modeled after "protected-clocks", except the protected
clock property is currently driver specific. This patch attempts to provide
a generic implementation of "always-on-clocks" instead.

Unlike "assigned-clocks", the "always-on-clocks" must be parsed much earlier
in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data .flags
field.

The new match_clkspec() callback is used to determine whether struct clk_hw
that is currently being registered matches the clock specifier in the DT
"always-on-clocks" property, and if so, then the CLK_IS_CRITICAL is added to
these newly registered clock. This callback can only be driver specific.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Andrew Morton <akpm@linux-foundation.org>
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
V3: - Pick np from clk_core->of_node
V4: - Rename DT property critical-clocks to always-on-clocks
---
 drivers/clk/clk.c            | 44 ++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  3 +++
 2 files changed, 47 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index b70769d0db99f..6b07f1a086277 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3900,6 +3900,48 @@ static void clk_core_free_parent_map(struct clk_core *core)
 	kfree(core->parents);
 }
 
+static void
+__clk_register_critical_clock(struct clk_core *core, struct clk_hw *hw)
+{
+	struct device_node *np = core->of_node;
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
+	/* Clock node with #clock-cells = <0> uses always-on-clocks; */
+	if (clksize == 0) {
+		if (of_property_read_bool(np, "always-on-clocks"))
+			core->flags |= CLK_IS_CRITICAL;
+		return;
+	}
+
+	if (!core->ops->match_clkspec)
+		return;
+
+	clkspec.np = np;
+	clktotal = of_property_count_u32_elems(np, "always-on-clocks");
+	clktotal /= clksize;
+	for (index = 0; index < clktotal; index++) {
+		for (i = 0; i < clksize; i++) {
+			ret = of_property_read_u32_index(np, "always-on-clocks",
+							 (index * clksize) + i,
+							 &(clkspec.args[i]));
+			if (ret) {
+				pr_warn("Skipping always-on-clocks index %d (ret=%d)\n",
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
@@ -3944,6 +3986,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->min_rate = 0;
 	core->max_rate = ULONG_MAX;
 
+	__clk_register_critical_clock(core, hw);
+
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index dec1bcae43790..e02a66dc482be 100644
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

