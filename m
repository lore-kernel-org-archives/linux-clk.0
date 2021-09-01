Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32D09C25AF2
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 09:36:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AB5F61057
	for <linux-clk@archiver.kernel.org>; Wed,  1 Sep 2021 09:36:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243709AbhIAJhi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Sep 2021 05:37:38 -0400
Received: from mail.bugwerft.de ([46.23.86.59]:37098 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S243705AbhIAJhh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 1 Sep 2021 05:37:37 -0400
Received: from hq-00021.holoplot.net (unknown [194.162.236.226])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 3D4BF32D178;
        Wed,  1 Sep 2021 09:36:39 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Cc:     robh+dt@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH v5 8/9] clk: cs2000-cp: freeze config during register fiddling
Date:   Wed,  1 Sep 2021 11:36:30 +0200
Message-Id: <20210901093631.1403278-9-daniel@zonque.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210901093631.1403278-1-daniel@zonque.org>
References: <20210901093631.1403278-1-daniel@zonque.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Make sure to freeze the configuration of the chip during the programming
of 32-bit registers. This avoids the processing of invalid intermediate
states.

Signed-off-by: Daniel Mack <daniel@zonque.org>
---
 drivers/clk/clk-cs2000-cp.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/clk-cs2000-cp.c b/drivers/clk/clk-cs2000-cp.c
index 9f99e39b41f2..1baf0595ba59 100644
--- a/drivers/clk/clk-cs2000-cp.c
+++ b/drivers/clk/clk-cs2000-cp.c
@@ -52,6 +52,7 @@
 #define FRACNSRC_DYNAMIC	(1 << 0)
 
 /* GLOBAL_CFG */
+#define FREEZE		(1 << 7)
 #define ENDEV2		(0x1)
 
 /* FUNC_CFG1 */
@@ -335,6 +336,10 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 {
 	int ret;
 
+	ret = cs2000_bset(priv, GLOBAL_CFG, FREEZE, FREEZE);
+	if (ret < 0)
+		return ret;
+
 	ret = cs2000_select_ratio_mode(priv, rate, parent_rate);
 	if (ret < 0)
 		return ret;
@@ -347,6 +352,10 @@ static int __cs2000_set_rate(struct cs2000_priv *priv, int ch,
 	if (ret < 0)
 		return ret;
 
+	ret = cs2000_bset(priv, GLOBAL_CFG, FREEZE, 0);
+	if (ret < 0)
+		return ret;
+
 	priv->saved_rate	= rate;
 	priv->saved_parent_rate	= parent_rate;
 
-- 
2.31.1

