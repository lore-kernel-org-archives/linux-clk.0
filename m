Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 338B7C49EA3
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1CB7A613E7
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jun 2021 19:09:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231379AbhFQTLg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jun 2021 15:11:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233080AbhFQTLa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jun 2021 15:11:30 -0400
Received: from mail.bugwerft.de (mail.bugwerft.de [IPv6:2a03:6000:1011::59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 66BC7C06175F;
        Thu, 17 Jun 2021 12:09:22 -0700 (PDT)
Received: from hq-00021.fritz.box (p57bc9ba2.dip0.t-ipconnect.de [87.188.155.162])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 153714C4957;
        Thu, 17 Jun 2021 19:09:21 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v3 7/9] clk: cs2000-cp: make clock skip setting configurable
Date:   Thu, 17 Jun 2021 21:09:10 +0200
Message-Id: <20210617190912.262809-8-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617190912.262809-1-daniel@zonque.org>
References: <20210617190912.262809-1-daniel@zonque.org>
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
index 791f088ec9aa..f3093d99c639 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -80,6 +80,7 @@ struct cs2000_priv {
 	struct clk *ref_clk;
 
 	bool lf_ratio;
+	bool clk_skip;
 
 	/* suspend/resume */
 	unsigned long saved_rate;
@@ -132,7 +133,7 @@ static int cs2000_enable_dev_config(struct cs2000_priv *priv, bool enable)
 		return ret;
 
 	ret = cs2000_bset(priv, FUNC_CFG1, CLKSKIPEN,
-			  enable ? CLKSKIPEN : 0);
+			  (enable && priv->clk_skip) ? CLKSKIPEN : 0);
 	if (ret < 0)
 		return ret;
 
@@ -462,6 +463,8 @@ static int cs2000_clk_register(struct cs2000_priv *priv)
 	if (ret < 0)
 		return ret;
 
+	priv->clk_skip = of_property_read_bool(np, "cirrus,clock-skip");
+
 	ref_clk_rate = clk_get_rate(priv->ref_clk);
 	ret = cs2000_ref_clk_bound_rate(priv, ref_clk_rate);
 	if (ret < 0)
-- 
2.31.1

