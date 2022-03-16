Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B0A2C4332F
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 12:31:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354945AbiCPMcO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 08:32:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236328AbiCPMcN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 08:32:13 -0400
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 228653C487;
        Wed, 16 Mar 2022 05:30:58 -0700 (PDT)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id A99538301E;
        Wed, 16 Mar 2022 13:30:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1647433857;
        bh=fEYvIWC6xo2xNf3PH8VNaMyulNlzE2HvVibuAfq7fWY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=aNUXy+r9rn0jIQQyMxmQqaJuHJY3NXy6YowSZ5h9bwVp0HDZiBu7oG8lo4i6Er37w
         HkRAlvBSxCgsyUgYJY/fohvBCgR5y3FDPNa1QKaCKUi4gctPJuVxN4NSlWt5vZ/mW2
         Yg0IFlu0lqaVh2XgIReESw+Ed/5L3KJKVGdnVFKZormLPfgRthGSfoNYFhz7aVZAX8
         qWb9OC0ltGB9F9q9z6QNxQebQIyCA/zaO5HM5QULR+tt08v+z65GStlPx2emJC3c4L
         TnClCdNMNC0HifTjV0X2E1E4wRJWCe9krp4F0GGWiH7CY1zfvdIeiAYKqvsegkdoB7
         Ogos+4yz4/uDw==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 2/2] clk: Introduce 'critical-clocks' property
Date:   Wed, 16 Mar 2022 13:30:34 +0100
Message-Id: <20220316123034.13465-2-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316123034.13465-1-marex@denx.de>
References: <20220316123034.13465-1-marex@denx.de>
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
index 6dc768a9674f4..8831c8f9e47c4 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3896,6 +3896,48 @@ static void clk_core_free_parent_map(struct clk_core *core)
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
@@ -3940,6 +3982,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->min_rate = 0;
 	core->max_rate = ULONG_MAX;
 
+	__clk_register_critical_clock(np, core, hw);
+
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 48d67574d4030..ad205d065c606 100644
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

