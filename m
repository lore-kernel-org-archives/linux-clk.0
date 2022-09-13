Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8126EC54EE9
	for <linux-clk@archiver.kernel.org>; Tue, 13 Sep 2022 10:22:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229968AbiIMKWD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Sep 2022 06:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231497AbiIMKWB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Sep 2022 06:22:01 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A43D456BB7
        for <linux-clk@vger.kernel.org>; Tue, 13 Sep 2022 03:21:59 -0700 (PDT)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY334-0002vk-TH; Tue, 13 Sep 2022 12:21:46 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
        by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY335-000TmK-In; Tue, 13 Sep 2022 12:21:46 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
        (envelope-from <mfe@pengutronix.de>)
        id 1oY333-004prz-BM; Tue, 13 Sep 2022 12:21:45 +0200
From:   Marco Felsch <m.felsch@pengutronix.de>
To:     krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        abelvesa@kernel.org, abel.vesa@linaro.org, mturquette@baylibre.com,
        sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, festevam@gmail.com
Cc:     linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
        linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: [RFC PATCH 1/2] clk: add support for critical always-on clocks
Date:   Tue, 13 Sep 2022 12:21:40 +0200
Message-Id: <20220913102141.971148-2-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220913102141.971148-1-m.felsch@pengutronix.de>
References: <20220913102141.971148-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add support to mark specific clocks as always-on (critical), like the
regulator-alawys-on property. So the platform integrators can specify
the property on a per device basis by specifying it within the firmware
and not only within the driver. Unlike the regulator framework the clock
framework uses a 1:n matching, which means 1 firmware node can provide
up to n clock providers. Therefore the binding uses a string-array so we
can specify n clock providers as critical.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 drivers/clk/clk.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 7fc191c15507..c3651bf96f90 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3825,6 +3825,22 @@ static int clk_cpy_name(const char **dst_p, const char *src, bool must_exist)
 	return 0;
 }
 
+static void clk_core_check_critical(struct clk_core *core)
+{
+	struct fwnode_handle *fwnode = of_fwnode_handle(core->of_node);
+	const char *prop = "clocks-always-on";
+	int ret;
+
+	/* Very early added clocks don't have a fwnode */
+	if (!fwnode || !fwnode_property_present(fwnode, prop))
+		return;
+
+	/* Mark clock as critical if listed within the clocks-always-on array */
+	ret = fwnode_property_match_string(fwnode, prop, core->name);
+	if (!ret)
+		core->flags |= CLK_IS_CRITICAL;
+}
+
 static int clk_core_populate_parent_map(struct clk_core *core,
 					const struct clk_init_data *init)
 {
@@ -3946,6 +3962,8 @@ __clk_register(struct device *dev, struct device_node *np, struct clk_hw *hw)
 	core->min_rate = 0;
 	core->max_rate = ULONG_MAX;
 
+	clk_core_check_critical(core);
+
 	ret = clk_core_populate_parent_map(core, init);
 	if (ret)
 		goto fail_parents;
-- 
2.30.2

