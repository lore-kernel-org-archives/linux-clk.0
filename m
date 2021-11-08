Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F18B0C433EF
	for <linux-clk@archiver.kernel.org>; Mon,  8 Nov 2021 22:43:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D90656134F
	for <linux-clk@archiver.kernel.org>; Mon,  8 Nov 2021 22:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239019AbhKHWpq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Nov 2021 17:45:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbhKHWpp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Nov 2021 17:45:45 -0500
Received: from phobos.denx.de (phobos.denx.de [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9CF6C061570;
        Mon,  8 Nov 2021 14:43:00 -0800 (PST)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: marex@denx.de)
        by phobos.denx.de (Postfix) with ESMTPSA id 8950383381;
        Mon,  8 Nov 2021 23:42:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
        s=phobos-20191101; t=1636411376;
        bh=EvLma/u7gdWkEfsUrJnk07mqzvz6abhOMdeBQ27/A54=;
        h=From:To:Cc:Subject:Date:From;
        b=q+N/3O5yxOkw795DcE+XTVzyEpk508HdUiL5/noj2KMY0cEznM36O4JQaHsdp1dln
         YneZoLBwxyJCMfJFbA20fYc2oJHa0EsfDsEwDYkyozt4n7UXrwxqVbVa++m8gMXQz2
         z3OxZcaETJ5izeCBk2ojG7M/So+urQRmTmujxqNumEphv9nLJNDogVMX70xr1AGQef
         k/F8XeKtegcnHA/3ycWUfQjc5dr5vyZ95A7jK+nEqzKXgbl+BRCSDQg8Qy2XM5LIY7
         2EzkB7nTOUKKpekCcDsyDWCcFoX/6rQ2CLU5YUwdXWcxjqIYUBjU6jdpMZl2gaJBYP
         vVWvSkobjCKgg==
From:   Marek Vasut <marex@denx.de>
To:     linux-clk@vger.kernel.org
Cc:     Marek Vasut <marex@denx.de>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-power@fi.rohmeurope.com
Subject: [PATCH] [RFC] dt-bindings: clk: Introduce 'critical-clocks' property
Date:   Mon,  8 Nov 2021 23:42:42 +0100
Message-Id: <20211108224242.278128-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

NOTE: This is an RFC patch showing how this mechanism might be workable.

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

Thoughts (on the overall design, not code quality or patch splitting) ?

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: linux-power@fi.rohmeurope.com
To: linux-clk@vger.kernel.org
---
 .../bindings/clock/clock-bindings.txt         | 16 ++++++++++++
 drivers/clk/clk-bd718x7.c                     | 15 +++++++++++
 drivers/clk/clk.c                             | 25 +++++++++++++++++++
 include/linux/clk-provider.h                  |  2 ++
 4 files changed, 58 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/clock-bindings.txt b/Documentation/devicetree/bindings/clock/clock-bindings.txt
index f2ea53832ac63..d9a783c35c5a1 100644
--- a/Documentation/devicetree/bindings/clock/clock-bindings.txt
+++ b/Documentation/devicetree/bindings/clock/clock-bindings.txt
@@ -169,6 +169,22 @@ a shared clock is forbidden.
 Configuration of common clocks, which affect multiple consumer devices can
 be similarly specified in the clock provider node.
 
+==Critical clocks==
+
+Some platforms require clock to be always running, e.g. because those clock
+supply devices which are not otherwise attached to the system. One example
+is a system where the SoC serves as a crystal oscillator replacement for a
+programmable logic device. The critical-clock property of a clock controller
+allows listing clock which must never be turned off.
+
+   clock-controller@a000f000 {
+        compatible = "vendor,clk95;
+        reg = <0xa000f000 0x1000>
+        #clocks-cells = <1>;
+        ...
+        critical-clocks = <UART3_CLK>, <SPI5_CLK>;
+   };
+
 ==Protected clocks==
 
 Some platforms or firmwares may not fully expose all the clocks to the OS, such
diff --git a/drivers/clk/clk-bd718x7.c b/drivers/clk/clk-bd718x7.c
index a59bc57f13bc4..f40765e2860e4 100644
--- a/drivers/clk/clk-bd718x7.c
+++ b/drivers/clk/clk-bd718x7.c
@@ -70,10 +70,25 @@ static int bd71837_clk_is_enabled(struct clk_hw *hw)
 	return enabled & c->mask;
 }
 
+static int bd71837_match_clkspec(struct clk_hw *hw, struct of_phandle_args *clkspec)
+{
+	struct bd718xx_clk *c = container_of(hw, struct bd718xx_clk, hw);
+
+	/*
+	 * if (clk_hw == clkspec)
+	 *   return 0;
+	 * else
+	 *   return 1;
+	 */
+
+	return 0;
+}
+
 static const struct clk_ops bd71837_clk_ops = {
 	.prepare = &bd71837_clk_enable,
 	.unprepare = &bd71837_clk_disable,
 	.is_prepared = &bd71837_clk_is_enabled,
+	.match_clkspec = &bd71837_match_clkspec,
 };
 
 static int bd71837_clk_probe(struct platform_device *pdev)
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index f467d63bbf1ee..fa8e9ea446158 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3849,6 +3849,31 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->max_rate = ULONG_MAX;
 	hw->core = core;
 
+	struct of_phandle_args clkspec;
+	u32 clksize, clktotal;
+	int i, index;
+
+	if (np && core->ops->match_clkspec && !of_property_read_u32(np, "#clock-cells", &clksize)) {
+		if (clksize == 0) {
+			if (of_property_read_bool(np, "critical-clocks"))
+				core->flags |= CLK_IS_CRITICAL;
+			clktotal = 0;
+		} else {
+			clkspec.np = np;
+			clktotal = of_property_count_u32_elems(np, "critical-clocks");
+			clktotal /= clksize;
+			for (index = 0; index < clktotal; index++) {
+				for (i = 0; i < clksize; i++) {
+					ret = of_property_read_u32_index(np, "critical-clocks",
+									 (index * clksize) + i,
+									 &(clkspec.args[i]));
+				}
+				if (!core->ops->match_clkspec(hw, &clkspec))
+					core->flags |= CLK_IS_CRITICAL;
+			}
+		}
+	}
+
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index f59c875271a0e..766e93efb23c5 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -205,6 +205,7 @@ struct clk_duty {
  *		directory is provided as an argument.  Called with
  *		prepare_lock held.  Returns 0 on success, -EERROR otherwise.
  *
+ * @match_clkspec: Check whether clk_hw matches DT clock specifier
  *
  * The clk_enable/clk_disable and clk_prepare/clk_unprepare pairs allow
  * implementations to split any work between atomic (enable) and sleepable
@@ -252,6 +253,7 @@ struct clk_ops {
 	int		(*init)(struct clk_hw *hw);
 	void		(*terminate)(struct clk_hw *hw);
 	void		(*debug_init)(struct clk_hw *hw, struct dentry *dentry);
+	int		(*match_clkspec)(struct clk_hw *hw, struct of_phandle_args *clkspec);
 };
 
 /**
-- 
2.33.0

