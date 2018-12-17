Return-Path: <SRS0=zTeK=O2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 873F0C43612
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4F67D206A2
	for <linux-clk@archiver.kernel.org>; Mon, 17 Dec 2018 19:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=rere.qmqm.pl header.i=@rere.qmqm.pl header.b="dWKECi2D"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726758AbeLQThI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:37:08 -0500
Received: from rere.qmqm.pl ([91.227.64.183]:56286 "EHLO rere.qmqm.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733040AbeLQThI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 17 Dec 2018 14:37:08 -0500
Received: from remote.user (localhost [127.0.0.1])
        by rere.qmqm.pl (Postfix) with ESMTPSA id 43JWbH4RLgz9F;
        Mon, 17 Dec 2018 20:35:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=rere.qmqm.pl; s=1;
        t=1545075339; bh=/56MsxFwaSjwK7/mt/Tkx+PibwmttCvRGbZJTSeRTC8=;
        h=Date:From:Subject:To:Cc:From;
        b=dWKECi2DpPxPmwe+wJ7l63SbcBQYpFyVnoM+YgPT2DyXaKDn+BQJ6XvRcv4/hn1Y+
         eO9zTdGOiWfVVMb45afiKDgkaZ45GXaX1PZ9BHh6UmZthlr1nRGoQ6QLkbRDqvYZqx
         hJ7WrfPbrPhoVi8aY/B6DwV2I8ZkfhhBkefm1uS+tiIZp9OhlBx5gB7kjGXccdFYew
         wO/4OzAYVyH+OlL9zByDpTjIELlnbhn9GveJGqIreFEpz3rZ+jG69EbuC4DdVB5RBe
         QzOEQQTxIP+MeVWbcNYkO186MDJHh57ZOrBpT64sM9JIkqTj59iCpFGXCOweuG3c9k
         VayOJwZR/nISQ==
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.100.2 at mail
Date:   Mon, 17 Dec 2018 20:37:05 +0100
Message-Id: <772b3869cc992d894d8c1b4296f21100bcbed30d.1545075103.git.mirq-linux@rere.qmqm.pl>
From:   =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Subject: [PATCH] clk: at91: optimize clk_round_rate() for AUDIO_PLL
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

This makes for 3 clk_round_rate() calls instead of 64 of them on
SAMA5D2-based board when searching for 12.288MHz clock.

Signed-off-by: Michał Mirosław <mirq-linux@rere.qmqm.pl>
---
 drivers/clk/at91/clk-audio-pll.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-audio-pll.c b/drivers/clk/at91/clk-audio-pll.c
index 36d77146a3bd..3a358282784e 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -340,7 +340,11 @@ static long clk_audio_pll_pmc_round_rate(struct clk_hw *hw, unsigned long rate,
 	pr_debug("A PLL/PMC: %s, rate = %lu (parent_rate = %lu)\n", __func__,
 		 rate, *parent_rate);
 
-	for (div = 1; div <= AUDIO_PLL_QDPMC_MAX; div++) {
+	if (!rate)
+		return 0;
+
+	best_parent_rate = clk_round_rate(pclk->clk, 1);
+	for (div = max(best_parent_rate / rate, 1ul); div <= AUDIO_PLL_QDPMC_MAX; div++) {
 		best_parent_rate = clk_round_rate(pclk->clk, rate * div);
 		tmp_rate = best_parent_rate / div;
 		tmp_diff = abs(rate - tmp_rate);
@@ -350,6 +354,8 @@ static long clk_audio_pll_pmc_round_rate(struct clk_hw *hw, unsigned long rate,
 			best_rate = tmp_rate;
 			best_diff = tmp_diff;
 			tmp_qd = div;
+			if (!best_diff)
+				break;	/* got exact match */
 		}
 	}
 
-- 
2.19.2

