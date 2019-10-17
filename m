Return-Path: <SRS0=WJPE=YK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA7F3FA372A
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 10:53:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ACBE220869
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 10:53:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405959AbfJQKxz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Oct 2019 06:53:55 -0400
Received: from imap1.codethink.co.uk ([176.9.8.82]:52131 "EHLO
        imap1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389929AbfJQKxz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Oct 2019 06:53:55 -0400
Received: from [167.98.27.226] (helo=rainbowdash.codethink.co.uk)
        by imap1.codethink.co.uk with esmtpsa (Exim 4.84_2 #1 (Debian))
        id 1iL3Pi-0002GS-6V; Thu, 17 Oct 2019 11:53:50 +0100
Received: from ben by rainbowdash.codethink.co.uk with local (Exim 4.92.2)
        (envelope-from <ben@rainbowdash.codethink.co.uk>)
        id 1iL3Ph-00026m-KM; Thu, 17 Oct 2019 11:53:49 +0100
From:   "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
To:     linux-kernel@lists.codethink.co.uk
Cc:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Heiko Stuebner <heiko@sntech.de>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH] clk: rockchip: make clk_half_divider_ops static
Date:   Thu, 17 Oct 2019 11:53:48 +0100
Message-Id: <20191017105348.8061-1-ben.dooks@codethink.co.uk>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The clk_half_divider_ops is not used outside or declared
outside of drivers/clk/rockchip/clk-half-divider.c so make
it static to avoid the following warning:

drivers/clk/rockchip/clk-half-divider.c:142:22: warning: symbol 'clk_half_divider_ops' was not declared. Should it be static?

Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
---
Cc: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>
Cc: linux-clk@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/clk/rockchip/clk-half-divider.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-half-divider.c b/drivers/clk/rockchip/clk-half-divider.c
index ba9f00dc9740..b333fc28c94b 100644
--- a/drivers/clk/rockchip/clk-half-divider.c
+++ b/drivers/clk/rockchip/clk-half-divider.c
@@ -139,12 +139,11 @@ static int clk_half_divider_set_rate(struct clk_hw *hw, unsigned long rate,
 	return 0;
 }
 
-const struct clk_ops clk_half_divider_ops = {
+static const struct clk_ops clk_half_divider_ops = {
 	.recalc_rate = clk_half_divider_recalc_rate,
 	.round_rate = clk_half_divider_round_rate,
 	.set_rate = clk_half_divider_set_rate,
 };
-EXPORT_SYMBOL_GPL(clk_half_divider_ops);
 
 /**
  * Register a clock branch.
-- 
2.23.0

