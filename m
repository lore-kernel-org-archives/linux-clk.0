Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ED44CDB47E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 08:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235445AbjJLIhf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Oct 2023 04:37:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235438AbjJLIhe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Oct 2023 04:37:34 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21DBF91
        for <linux-clk@vger.kernel.org>; Thu, 12 Oct 2023 01:37:33 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A5ABC433C7;
        Thu, 12 Oct 2023 08:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1697099852;
        bh=XaRKmK4FDdbeFhNUyPSbrwGIEcb50/D7kdzVDzEU3v0=;
        h=From:To:Cc:Subject:Date:From;
        b=pLrCfWF4Bu12tEJYoHE2TW0h99Di/I9SKHWk9hZ56HZh6HhIni5cZpRoXC0qwcalt
         3nMAAbD4NfaQWTYTdUoJOUZzSFVi/+zwjMP5FBrMSOqDDtpLFKaZFCwMJ1aKmYVFiN
         Z4iErLEa0zP78VpNXQN3FGucxq1XlvDflvSe5bGLn2oVK/+5eL3SlFJiyO8N4No593
         U3gX431ZJ6kaPvM2mC9yCWI0mXuPRHsiz7uT7rkicAwd0PfkwRbL+zrSQRQEeGUTrc
         4maklqYu+nsVnsqITaGlWfRv/Y7Gv/WEw1q+F86ZXqeqokZ16hjrWO/6tOPn+mA+Ah
         bz4O00CJUovWQ==
From:   Maxime Ripard <mripard@kernel.org>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dinh Nguyen <dinguyen@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Benedikt Spranger <b.spranger@linutronix.de>
Subject: [PATCH] clk: socfpga: gate: Account for the divider in determine_rate
Date:   Thu, 12 Oct 2023 10:37:29 +0200
Message-ID: <20231012083729.2148044-1-mripard@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Commit 9607beb917df ("clk: socfpga: gate: Add a determine_rate hook")
added a determine_rate implementation set to the
clk_hw_determine_rate_no_reparent, but failed to account for the
internal divider that wasn't used before anywhere but in recalc_rate.

This led to inconsistencies between the clock rate stored in
clk_core->rate and the one returned by clk_round_rate() that leverages
determine_rate().

Since that driver seems to be widely used (and thus regression-prone)
and not supporting rate changes (since it's missing a .set_rate
implementation), we can just report the current divider programmed in
the clock but not try to change it in any way.

This should be good enough to fix the issues reported, and if someone
ever wants to allow the divider to change then it should be easy enough
using the clk-divider helpers.

Link: https://lore.kernel.org/linux-clk/20231005095927.12398-2-b.spranger@linutronix.de/
Fixes: 9607beb917df ("clk: socfpga: gate: Add a determine_rate hook")
Reported-by: Benedikt Spranger <b.spranger@linutronix.de>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/clk/socfpga/clk-gate.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/socfpga/clk-gate.c b/drivers/clk/socfpga/clk-gate.c
index 8dd601bd8538..486a4d84e418 100644
--- a/drivers/clk/socfpga/clk-gate.c
+++ b/drivers/clk/socfpga/clk-gate.c
@@ -87,10 +87,8 @@ static int socfpga_clk_set_parent(struct clk_hw *hwclk, u8 parent)
 	return 0;
 }
 
-static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
-	unsigned long parent_rate)
+static u32 socfpga_clk_get_div(struct socfpga_gate_clk *socfpgaclk)
 {
-	struct socfpga_gate_clk *socfpgaclk = to_socfpga_gate_clk(hwclk);
 	u32 div = 1, val;
 
 	if (socfpgaclk->fixed_div)
@@ -105,12 +103,33 @@ static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
 			div = (1 << val);
 	}
 
+	return div;
+}
+
+static unsigned long socfpga_clk_recalc_rate(struct clk_hw *hwclk,
+					     unsigned long parent_rate)
+{
+	struct socfpga_gate_clk *socfpgaclk = to_socfpga_gate_clk(hwclk);
+	u32 div = socfpga_clk_get_div(socfpgaclk);
+
 	return parent_rate / div;
 }
 
+
+static int socfpga_clk_determine_rate(struct clk_hw *hw,
+				      struct clk_rate_request *req)
+{
+	struct socfpga_gate_clk *socfpgaclk = to_socfpga_gate_clk(hwclk);
+	u32 div = socfpga_clk_get_div(socfpgaclk);
+
+	req->rate = req->best_parent_rate / div;
+
+	return 0;
+}
+
 static struct clk_ops gateclk_ops = {
 	.recalc_rate = socfpga_clk_recalc_rate,
-	.determine_rate = clk_hw_determine_rate_no_reparent,
+	.determine_rate = socfpga_clk_determine_rate,
 	.get_parent = socfpga_clk_get_parent,
 	.set_parent = socfpga_clk_set_parent,
 };
-- 
2.41.0

