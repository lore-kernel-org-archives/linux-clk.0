Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC7DC43219
	for <linux-clk@archiver.kernel.org>; Tue, 14 Dec 2021 12:19:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230149AbhLNMS7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 14 Dec 2021 07:18:59 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:48162 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230085AbhLNMS6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 14 Dec 2021 07:18:58 -0500
Received: from hq-00021.fritz.box (p57bc964a.dip0.t-ipconnect.de [87.188.150.74])
        by mail.bugwerft.de (Postfix) with ESMTPSA id CCA9F4ECA1C;
        Tue, 14 Dec 2021 12:09:38 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH RESEND v4 7/9] clk: cs2000-cp: make clock skip setting configurable
Date:   Tue, 14 Dec 2021 13:09:27 +0100
Message-Id: <20211214120929.2829705-8-daniel@zonque.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211214120929.2829705-1-daniel@zonque.org>
References: <20211214120929.2829705-1-daniel@zonque.org>
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

