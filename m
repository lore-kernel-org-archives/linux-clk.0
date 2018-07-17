Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.bootlin.com ([62.4.15.54]:59049 "EHLO mail.bootlin.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729973AbeGQXDE (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 17 Jul 2018 19:03:04 -0400
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: [PATCH 01/16] clk: at91: audio-pll: fix audio pmc type
Date: Wed, 18 Jul 2018 00:27:42 +0200
Message-Id: <20180717222757.10253-2-alexandre.belloni@bootlin.com>
In-Reply-To: <20180717222757.10253-1-alexandre.belloni@bootlin.com>
References: <20180717222757.10253-1-alexandre.belloni@bootlin.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The allocation for the audio pmc is using the size of struct clk_audio_pad
instead of struct clk_audio_pmc. This works fine because the former is
larger than the latter but it is safer to be correct.

Fixes: ("0865805d82d4 clk: at91: add audio pll clock drivers")
Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/clk/at91/clk-audio-pll.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/at91/clk-audio-pll.c b/drivers/clk/at91/clk-audio-pll.c
index da7bafcfbe70..b3eaf654fac9 100644
--- a/drivers/clk/at91/clk-audio-pll.c
+++ b/drivers/clk/at91/clk-audio-pll.c
@@ -509,7 +509,7 @@ static void __init of_sama5d2_clk_audio_pll_pad_setup(struct device_node *np)
 
 static void __init of_sama5d2_clk_audio_pll_pmc_setup(struct device_node *np)
 {
-	struct clk_audio_pad *apmc_ck;
+	struct clk_audio_pmc *apmc_ck;
 	struct clk_init_data init = {};
 
 	apmc_ck = kzalloc(sizeof(*apmc_ck), GFP_KERNEL);
-- 
2.18.0

