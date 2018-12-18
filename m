Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A22FC43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 11:20:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C817F21850
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 11:20:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="mpAwMMAp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbeLRLUv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 06:20:51 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:20662 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726379AbeLRLUv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 18 Dec 2018 06:20:51 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 43JwX96CXdzHb;
        Tue, 18 Dec 2018 12:19:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1545131961; bh=jycAhEYzEBtnnZoIZGaZbJ1DFaTdDSu9LD2wajM16/g=;
        h=Date:From:Subject:To:Cc:From;
        b=mpAwMMApmN8uoG4xh979VO7RlITGhfUDRY4C/AYkXJ4K5BZJ+OXay+LL5POTqAbt3
         0UjdSzIyA+0uzA/4evpexUK/07teX32fw4L+Ll43r6z5VojB6RnFDx0veErQ9FZSBN
         F4B4p6Zlk/NTjDTozhBvqVkQV/f5vMK43eVZKfAD6Q+XAs8n9nlTYmHeAlYh/HDNPq
         naA4jx9CCdiEDQialJIy4tJxjKMbqG00nbLPNiLlNi0BGFnwUP7EVTG8mZr7zBAOqr
         OqGBX50kCJVHjIgsjtwfslt7Y9KwbkjD/iVENEEpvTP/qG40zbH6JrwVLnlgXDHt/f
         lqioPEpTnFUmw==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.2 at mail
Date:   Tue, 18 Dec 2018 12:20:48 +0100
Message-Id: <70db24a03b552ca553e6435306d895644fb08545.1545131728.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH v3] clk: at91: optimize clk_round_rate() for AUDIO_PLL
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
To:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Stop the search for parent rate when exact match is found.

This makes for 3 clk_round_rate() calls instead of 64 of them on
SAMA5D2-based board when searching for 12.288MHz clock.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 v2: rebased on v4.20-rc7
 v3: formatting and commit description changes
---
 drivers/clk/at91/clk-audio-pll.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-audio-pll.c b/drivers/clk/at91/clk-audio-pll.c
index 36d77146a3bd..3cc4a82f4e9f 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -340,7 +340,12 @@ static long clk_audio_pll_pmc_round_rate(struct clk_hw *hw, unsigned long rate,
 	pr_debug("A PLL/PMC: %s, rate = %lu (parent_rate = %lu)\n", __func__,
 		 rate, *parent_rate);
 
-	for (div = 1; div <= AUDIO_PLL_QDPMC_MAX; div++) {
+	if (!rate)
+		return 0;
+
+	best_parent_rate = clk_round_rate(pclk->clk, 1);
+	div = max(best_parent_rate / rate, 1UL);
+	for (; div <= AUDIO_PLL_QDPMC_MAX; div++) {
 		best_parent_rate = clk_round_rate(pclk->clk, rate * div);
 		tmp_rate = best_parent_rate / div;
 		tmp_diff = abs(rate - tmp_rate);
@@ -350,6 +355,8 @@ static long clk_audio_pll_pmc_round_rate(struct clk_hw *hw, unsigned long rate,
 			best_rate = tmp_rate;
 			best_diff = tmp_diff;
 			tmp_qd = div;
+			if (!best_diff)
+				break;	/* got exact match */
 		}
 	}
 
-- 
2.19.2

