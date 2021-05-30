Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52571C47093
	for <linux-clk@archiver.kernel.org>; Sun, 30 May 2021 16:50:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 34A4B61241
	for <linux-clk@archiver.kernel.org>; Sun, 30 May 2021 16:50:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229854AbhE3Qvg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 30 May 2021 12:51:36 -0400
Received: from aposti.net ([89.234.176.197]:33434 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229851AbhE3Qvg (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sun, 30 May 2021 12:51:36 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
        list@opendingux.net,
        =?UTF-8?q?=E5=91=A8=E7=90=B0=E6=9D=B0?= <zhouyanjie@wanyeetech.com>,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v2 3/6] clk: ingenic: Read bypass register only when there is one
Date:   Sun, 30 May 2021 17:49:20 +0100
Message-Id: <20210530164923.18134-4-paul@crapouillou.net>
In-Reply-To: <20210530164923.18134-1-paul@crapouillou.net>
References: <20210530164923.18134-1-paul@crapouillou.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Rework the clock code so that the bypass register is only read when
there is actually a bypass functionality.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/clk/ingenic/cgu.c | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/clk/ingenic/cgu.c b/drivers/clk/ingenic/cgu.c
index 0619d45a950c..7686072aff8f 100644
--- a/drivers/clk/ingenic/cgu.c
+++ b/drivers/clk/ingenic/cgu.c
@@ -99,13 +99,14 @@ ingenic_pll_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
 	od_enc = ctl >> pll_info->od_shift;
 	od_enc &= GENMASK(pll_info->od_bits - 1, 0);
 
-	ctl = readl(cgu->base + pll_info->bypass_reg);
+	if (!pll_info->no_bypass_bit) {
+		ctl = readl(cgu->base + pll_info->bypass_reg);
 
-	bypass = !pll_info->no_bypass_bit &&
-		 !!(ctl & BIT(pll_info->bypass_bit));
+		bypass = !!(ctl & BIT(pll_info->bypass_bit));
 
-	if (bypass)
-		return parent_rate;
+		if (bypass)
+			return parent_rate;
+	}
 
 	for (od = 0; od < pll_info->od_max; od++) {
 		if (pll_info->od_encoding[od] == od_enc)
@@ -225,11 +226,13 @@ static int ingenic_pll_enable(struct clk_hw *hw)
 	u32 ctl;
 
 	spin_lock_irqsave(&cgu->lock, flags);
-	ctl = readl(cgu->base + pll_info->bypass_reg);
+	if (!pll_info->no_bypass_bit) {
+		ctl = readl(cgu->base + pll_info->bypass_reg);
 
-	ctl &= ~BIT(pll_info->bypass_bit);
+		ctl &= ~BIT(pll_info->bypass_bit);
 
-	writel(ctl, cgu->base + pll_info->bypass_reg);
+		writel(ctl, cgu->base + pll_info->bypass_reg);
+	}
 
 	ctl = readl(cgu->base + pll_info->reg);
 
-- 
2.30.2

