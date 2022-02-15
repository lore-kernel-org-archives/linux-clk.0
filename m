Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D882C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 15 Feb 2022 08:44:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234596AbiBOIou (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Feb 2022 03:44:50 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:53526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234609AbiBOIot (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Feb 2022 03:44:49 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3FDE0111F8F;
        Tue, 15 Feb 2022 00:44:40 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 6581F810EC;
        Tue, 15 Feb 2022 09:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1644914678;
        bh=+gsN6CS5cyJLY35Hog/hYyWdo7/b8jO3oJkqkV1ZkA8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=xaqXWGPta6BEfycX+/MshsKf11jMwd3ffznruP5GZhr+URixgBLqemD4DwJywwZ5I
         CP6AL2c2s8hm04SiHFq5tLQliPkwjP6fLOHybyuIRtWj53N/ki8sN5Q1OYngfNcv6k
         NUW0obIycWlbeh0xdRSWKVjG82l1j0bsC9OQZ4zfxDoFR/GmH/AQLYnpQOgfErchAW
         45KEw1MQ53EcPypVhkvs1hJz9NYnaHDQl1z91F/FuNObiMz0k+l9H11k3IQ+ph3YPT
         3UGi1QxCJ3/cEWiMXyMdgUXSTTleSAFIeFFxGgEyvKdQKfsCjVtxIIQ0qZ397BL5bw
         eN8UEp1hmHLIg==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: [PATCH 2/3] clk: Introduce 'critical-clocks' property
Date:   Tue, 15 Feb 2022 09:44:11 +0100
Message-Id: <20220215084412.8090-2-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215084412.8090-1-marex@denx.de>
References: <20220215084412.8090-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Some platforms require clock to be always running, e.g. because those clock
supply devices which are not otherwise attached to the system. One example
is a system where the SoC serves as a crystal oscillator replacement for a
programmable logic device. The critical-clock property of a clock controller
allows listing clock which must never be turned off.

The implementation here is similar to "protected-clock", except protected
clock property is currently driver specific. This patch attempts to make
a generic implementation of "critical-clock" instead.

Unlike "assigned-clocks", the "critical-clock" must be parsed much earlier
in __clk_register() to assign CLK_IS_CRITICAL flag to clk_init_data .flags
field. The parsing code obviously need to be cleaned up and factor out into
separate function.

The new match_clkspec() callback is used to determine whether struct clk_hw
that is currently being registered matches the clock specifier in the DT
"critical-clock" property, and if so, then the CLK_IS_CRITICAL is added to
these newly registered clock. This callback is currently driver specific,
although I suspect a common and/or generic version of the callback could
be added. Also, this new callback could possibly be used to replace (*get)
argument of of_clk_add_hw_provider() later on too.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-power@fi.rohmeurope.com
To: linux-clk@vger.kernel.org
---
 drivers/clk/clk.c            | 41 ++++++++++++++++++++++++++++++++++++
 include/linux/clk-provider.h |  3 +++
 2 files changed, 44 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8de6a22498e70..1e1686fa76e01 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3872,6 +3872,45 @@ static void clk_core_free_parent_map(struct clk_core *core)
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
+	if (!core->ops->match_clkspec)
+		return;
+
+	if (of_property_read_u32(np, "#clock-cells", &clksize))
+		return;
+
+	/* Clock node with #clock-cells = <0> uses critical-clocks; */
+	if (clksize == 0) {
+		if (of_property_read_bool(np, "critical-clocks") &&
+		    !core->ops->match_clkspec(hw, &clkspec))
+			core->flags |= CLK_IS_CRITICAL;
+		return;
+	}
+
+	clkspec.np = np;
+	clktotal = of_property_count_u32_elems(np, "critical-clocks");
+	clktotal /= clksize;
+	for (index = 0; index < clktotal; index++) {
+		for (i = 0; i < clksize; i++) {
+			ret = of_property_read_u32_index(np, "critical-clocks",
+							 (index * clksize) + i,
+							 &(clkspec.args[i]));
+		}
+		if (!core->ops->match_clkspec(hw, &clkspec))
+			core->flags |= CLK_IS_CRITICAL;
+	}
+}
+
 static struct clk *
 __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 {
@@ -3916,6 +3955,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->min_rate = 0;
 	core->max_rate = ULONG_MAX;
 
+	__clk_register_critical_clock(np, core, hw);
+
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 2faa6f7aa8a87..8bc0eedfeb2fd 100644
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
2.34.1

