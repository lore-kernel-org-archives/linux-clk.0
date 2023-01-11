Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9796C54EBE
	for <linux-clk@archiver.kernel.org>; Wed, 11 Jan 2023 08:24:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbjAKIX5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 03:23:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235912AbjAKIXm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 03:23:42 -0500
Received: from andre.telenet-ops.be (andre.telenet-ops.be [IPv6:2a02:1800:120:4::f00:15])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0022A2738
        for <linux-clk@vger.kernel.org>; Wed, 11 Jan 2023 00:23:40 -0800 (PST)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d992:2e67:38c1:3ab7])
        by andre.telenet-ops.be with bizsmtp
        id 7LPe2900m22nSWd01LPe4X; Wed, 11 Jan 2023 09:23:39 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan.of.borg with esmtp (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pFWOX-001YSm-3h;
        Wed, 11 Jan 2023 09:23:39 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
        (envelope-from <geert@linux-m68k.org>)
        id 1pFWOY-003Boo-Tq;
        Wed, 11 Jan 2023 09:23:38 +0100
From:   Geert Uytterhoeven <geert+renesas@glider.be>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chris Brandt <chris.brandt@renesas.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] clk: renesas: cpg-mssr: Remove superfluous check in resume code
Date:   Wed, 11 Jan 2023 09:23:34 +0100
Message-Id: <144a3e66d748c0c17f3524ac8fa6ece5bf5b6f1e.1673425314.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When the code flow arrives at printing the error message in
cpg_mssr_resume_noirq(), we know for sure that we are not running on an
RZ/A Soc, as the code checked for that before.

Fixes: ace342097768e35f ("clk: renesas: cpg-mssr: Fix STBCR suspend/resume handling")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be queued in renesas-clk for v6.3.
---
 drivers/clk/renesas/renesas-cpg-mssr.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
index 1a0cdf001b2f27ca..be16fb3ce1659260 100644
--- a/drivers/clk/renesas/renesas-cpg-mssr.c
+++ b/drivers/clk/renesas/renesas-cpg-mssr.c
@@ -943,9 +943,8 @@ static int cpg_mssr_resume_noirq(struct device *dev)
 		}
 
 		if (!i)
-			dev_warn(dev, "Failed to enable %s%u[0x%x]\n",
-				 priv->reg_layout == CLK_REG_LAYOUT_RZ_A ?
-				 "STB" : "SMSTP", reg, oldval & mask);
+			dev_warn(dev, "Failed to enable SMSTP%u[0x%x]\n", reg,
+				 oldval & mask);
 	}
 
 	return 0;
-- 
2.34.1

