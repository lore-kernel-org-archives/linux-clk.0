Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49CA8C43216
	for <linux-clk@archiver.kernel.org>; Fri, 27 Aug 2021 12:02:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3007260E77
	for <linux-clk@archiver.kernel.org>; Fri, 27 Aug 2021 12:02:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244780AbhH0MDV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 27 Aug 2021 08:03:21 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37072 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231191AbhH0MDU (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 27 Aug 2021 08:03:20 -0400
X-Greylist: delayed 484 seconds by postgrey-1.27 at vger.kernel.org; Fri, 27 Aug 2021 08:03:20 EDT
Received: from hq-00021.fritz.box (p57bc979a.dip0.t-ipconnect.de [87.188.151.154])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 73744327D0B;
        Fri, 27 Aug 2021 11:54:28 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v4 7/9] clk: cs2000-cp: make clock skip setting configurable
Date:   Fri, 27 Aug 2021 13:54:18 +0200
Message-Id: <20210827115420.3052019-8-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210827115420.3052019-1-daniel@zonque.org>
References: <20210827115420.3052019-1-daniel@zonque.org>
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
index c869bc692dfb..2c555a0e72b1 100644
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
 
@@ -467,6 +468,8 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	if (ret < 0)
 		return ret;
 
+	priv->clk_skip = of_property_read_bool(np, "cirrus,clock-skip");
+
 	ref_clk_rate = clk_get_rate(priv->ref_clk);
 	ret = cs2000_ref_clk_bound_rate(priv, ref_clk_rate);
 	if (ret < 0)
-- 
2.31.1

