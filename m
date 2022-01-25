Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 40F81C43217
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 09:49:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232822AbiAYJtR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 04:49:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234422AbiAYJmU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jan 2022 04:42:20 -0500
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7924EC06177F;
        Tue, 25 Jan 2022 01:42:20 -0800 (PST)
Received: from hq-00021.fritz.box (p57bc97b3.dip0.t-ipconnect.de [87.188.151.179])
        by mail.bugwerft.de (Postfix) with ESMTPSA id A10365015B0;
        Tue, 25 Jan 2022 09:33:45 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH RESEND v4 7/9] clk: cs2000-cp: make clock skip setting configurable
Date:   Tue, 25 Jan 2022 10:33:34 +0100
Message-Id: <20220125093336.226787-8-daniel@zonque.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125093336.226787-1-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clock skip function of this chip is not necessarily desirable in
all hardware appliances. This patch makes the feature configurable
through a device-tree property.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/clk-cs2000-cp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index bd030e156d65..9f99e39b41f2 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -81,6 +81,7 @@ struct cs2000_priv {
 
 	bool dynamic_mode;
 	bool lf_ratio;
+	bool clk_skip;
 
 	/* suspend/resume */
 	unsigned long saved_rate;
@@ -133,7 +134,7 @@ static int cs2000_enable_dev_config(struct cs2000_priv *priv, bool enable)
 		return ret;
 
 	ret = cs2000_bset(priv, FUNC_CFG1, CLKSKIPEN,
-			  enable ? CLKSKIPEN : 0);
+			  (enable && priv->clk_skip) ? CLKSKIPEN : 0);
 	if (ret < 0)
 		return ret;
 
@@ -464,6 +465,8 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	if (ret < 0)
 		return ret;
 
+	priv->clk_skip = of_property_read_bool(np, "cirrus,clock-skip");
+
 	ref_clk_rate = clk_get_rate(priv->ref_clk);
 	ret = cs2000_ref_clk_bound_rate(priv, ref_clk_rate);
 	if (ret < 0)
-- 
2.31.1

