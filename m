Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4793C433DB
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 11:26:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A25E264E81
	for <linux-clk@archiver.kernel.org>; Mon, 15 Mar 2021 11:26:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbhCOLZd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Mar 2021 07:25:33 -0400
Received: from gloria.sntech.de ([185.11.138.130]:33732 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229602AbhCOLZR (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 15 Mar 2021 07:25:17 -0400
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1lLlLT-0007LD-VY; Mon, 15 Mar 2021 12:25:12 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, zhangqing@rock-chips.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-rockchip@lists.infradead.org
Subject: [PATCH 2/2] clk: rockchip: drop MODULE_ALIAS from rk3399 clock controller
Date:   Mon, 15 Mar 2021 12:25:02 +0100
Message-Id: <20210315112502.343699-2-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315112502.343699-1-heiko@sntech.de>
References: <20210315112502.343699-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

As suggested by Stephen during the rk3568 clock review, the MOUDLE_ALIAS
doesn't serve any meaningful purpose, so drop it from the rk3399 as well.

Suggested-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3399.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clk/rockchip/clk-rk3399.c b/drivers/clk/rockchip/clk-rk3399.c
index 7df2f1e00347..5fe40a2b5d2e 100644
--- a/drivers/clk/rockchip/clk-rk3399.c
+++ b/drivers/clk/rockchip/clk-rk3399.c
@@ -1655,4 +1655,3 @@ builtin_platform_driver_probe(clk_rk3399_driver, clk_rk3399_probe);
 
 MODULE_DESCRIPTION("Rockchip RK3399 Clock Driver");
 MODULE_LICENSE("GPL");
-MODULE_ALIAS("platform:clk-rk3399");
-- 
2.29.2

