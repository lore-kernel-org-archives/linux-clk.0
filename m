Return-Path: <SRS0=U6aT=75=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D650FC433E0
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jun 2020 16:32:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AD02A208E4
	for <linux-clk@archiver.kernel.org>; Tue, 16 Jun 2020 16:32:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fpond.eu header.i=@fpond.eu header.b="EVOi2x8a"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730725AbgFPQcn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Jun 2020 12:32:43 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.165]:13171 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730611AbgFPQcn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Jun 2020 12:32:43 -0400
X-Greylist: delayed 359 seconds by postgrey-1.27 at vger.kernel.org; Tue, 16 Jun 2020 12:32:42 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1592325161;
        s=strato-dkim-0002; d=fpond.eu;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=5rLze8ETBM66W9eUWsBWbpRpC1OnX9lhrFGmWOBpeY8=;
        b=EVOi2x8arh6ZDQiGPNzyliblRASm0zuV/PqAnmQF7hTWEPsm3w52hxuTf4iQb+MfZk
        wvm77mDa+e1EJgSD8r0extsRQR+UEcoDuNuVJiQ+kHGICgvx5qmj3X64pP6DGLf+J1e0
        3v6P8Ykcv+9sFY8uN67diTVcuxZBevqfq6izM7xht+RA+LA3ChgvtJ8sw6FzkNkvVBsk
        y7mmC3pLO+H3dFpogScLVHmu1hOt1VgY5tZFkVhrtYeX3s/H5D6D4VtiKWUtj8NELyNg
        /HEUAupypg4oGBKSoNaRTF8lXsB/0uEfhnrtLadaPNielFspzh5LtagCiCw12F5JlTsv
        mbeA==
X-RZG-AUTH: ":OWANVUa4dPFUgKR/3dpvnYP0Np73dmm4I5W0/AvA67Ot4fvR8WdEaEuFwQ=="
X-RZG-CLASS-ID: mo00
Received: from groucho.site
        by smtp.strato.de (RZmta 46.10.4 DYNA|AUTH)
        with ESMTPSA id a0ab6bw5GGQbFwS
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 16 Jun 2020 18:26:37 +0200 (CEST)
From:   Ulrich Hecht <uli+renesas@fpond.eu>
To:     linux-renesas-soc@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, wsa@the-dreams.de, geert@linux-m68k.org,
        magnus.damm@gmail.com, Ulrich Hecht <uli+renesas@fpond.eu>
Subject: [PATCH v4 1/3] clk: renesas: cpg-mssr: mark clocks as critical only if on at boot
Date:   Tue, 16 Jun 2020 18:26:24 +0200
Message-Id: <20200616162626.27944-2-uli+renesas@fpond.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616162626.27944-1-uli+renesas@fpond.eu>
References: <20200616162626.27944-1-uli+renesas@fpond.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This allows us to add the RWDT clock to the list of critical clocks without
keeping it enabled needlessly if not used.

Changing the semantics of crit_mod_clks in this way is safe for the current
user (INTC-AP) because it is never off at boot time.

Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index dcb6e2706d37..4648a829db66 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -416,14 +416,6 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	init.name = mod->name;
 	init.ops = &cpg_mstp_clock_ops;
 	init.flags = CLK_SET_RATE_PARENT;
-	for (i = 0; i < info->num_crit_mod_clks; i++)
-		if (id == info->crit_mod_clks[i]) {
-			dev_dbg(dev, "MSTP %s setting CLK_IS_CRITICAL\n",
-				mod->name);
-			init.flags |= CLK_IS_CRITICAL;
-			break;
-		}
-
 	parent_name = __clk_get_name(parent);
 	init.parent_names = &parent_name;
 	init.num_parents = 1;
@@ -432,6 +424,15 @@ static void __init cpg_mssr_register_mod_clk(const struct mssr_mod_clk *mod,
 	clock->priv = priv;
 	clock->hw.init = &init;
 
+	for (i = 0; i < info->num_crit_mod_clks; i++)
+		if (id == info->crit_mod_clks[i] &&
+		    cpg_mstp_clock_is_enabled(&clock->hw)) {
+			dev_dbg(dev, "MSTP %s setting CLK_IS_CRITICAL\n",
+				mod->name);
+			init.flags |= CLK_IS_CRITICAL;
+			break;
+		}
+
 	clk = clk_register(NULL, &clock->hw);
 	if (IS_ERR(clk))
 		goto fail;
-- 
2.20.1

