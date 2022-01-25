Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE92C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jan 2022 09:50:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236702AbiAYJty (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jan 2022 04:49:54 -0500
Received: from mail.bugwerft.de ([46.23.86.59]:53016 "EHLO mail.bugwerft.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234461AbiAYJm0 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 25 Jan 2022 04:42:26 -0500
Received: from hq-00021.fritz.box (p57bc97b3.dip0.t-ipconnect.de [87.188.151.179])
        by mail.bugwerft.de (Postfix) with ESMTPSA id 1A26C5015AD;
        Tue, 25 Jan 2022 09:33:46 +0000 (UTC)
From:   Daniel Mack <daniel@zonque.org>
To:     mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
        Daniel Mack <daniel@zonque.org>
Subject: [PATCH RESEND v4 8/9] clk: cs2000-cp: freeze config during register fiddling
Date:   Tue, 25 Jan 2022 10:33:35 +0100
Message-Id: <20220125093336.226787-9-daniel@zonque.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220125093336.226787-1-daniel@zonque.org>
References: <20220125093336.226787-1-daniel@zonque.org>
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

