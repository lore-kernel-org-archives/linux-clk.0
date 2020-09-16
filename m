Return-Path: <SRS0=aoxw=CZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26F4BC35263
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 20:48:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAF19221E5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Sep 2020 20:48:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600289325;
	bh=dSNpGQ0mWKF9wKmXD2Ucm0zykyxGN3p0wNIaxZJV8Io=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=KY3qX3BL4MAtNEtxQGh5urXkOgIBf79EJMgXQ5dtlWFGM8LHMXYHwApQQrB+b+vYV
	 h5zXCjuTd0rKOXW2eKvdSIXTeUwKoBJqBqRvQjGHK6EkZz/ICvF4f8stm35UgdX5I+
	 d/bJ55RLS4bfdvMsCsUgR5YoRwHdsmVTuYIXTCFU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728462AbgIPUsp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:48:45 -0400
Received: from mail.kernel.org ([198.145.29.99]:55592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726691AbgIPRAx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 16 Sep 2020 13:00:53 -0400
Received: from kozik-lap.mshome.net (unknown [194.230.155.191])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BAC1F22597;
        Wed, 16 Sep 2020 16:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600273079;
        bh=dSNpGQ0mWKF9wKmXD2Ucm0zykyxGN3p0wNIaxZJV8Io=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=viVZyB+wDRwY1ciL2+gA9+KgFhjlpQqg/W9lnYVB4gOk7RbmAAAvaQ27FGmrqlW7/
         +I1NXf4LQ0ffvZem9VB5Mv/1cUPkVduhsDrViP689a7qii1kL3VwuxeOOQb1sRqNPp
         m1gB5VYdy2ohl3tc7TCDiPae8Dxc3vYgU6hDJ19c=
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        David Lechner <david@lechnology.com>,
        Sekhar Nori <nsekhar@ti.com>, Heiko Stuebner <heiko@sntech.de>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org
Cc:     Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH 4/6] clk: mmp: pxa1928: drop unused 'clk' variable
Date:   Wed, 16 Sep 2020 18:17:38 +0200
Message-Id: <20200916161740.14173-4-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200916161740.14173-1-krzk@kernel.org>
References: <20200916161740.14173-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

'clk' is assigned but never read:

  drivers/clk/mmp/clk-of-pxa1928.c: In function ‘pxa1928_pll_init’:
  drivers/clk/mmp/clk-of-pxa1928.c:71:14: warning: variable ‘clk’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/mmp/clk-of-pxa1928.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/mmp/clk-of-pxa1928.c b/drivers/clk/mmp/clk-of-pxa1928.c
index cede7b4ca3b9..998fc4207b0e 100644
--- a/drivers/clk/mmp/clk-of-pxa1928.c
+++ b/drivers/clk/mmp/clk-of-pxa1928.c
@@ -68,7 +68,6 @@ static struct mmp_clk_factor_tbl uart_factor_tbl[] = {
 
 static void pxa1928_pll_init(struct pxa1928_clk_unit *pxa_unit)
 {
-	struct clk *clk;
 	struct mmp_clk_unit *unit = &pxa_unit->unit;
 
 	mmp_register_fixed_rate_clks(unit, fixed_rate_clks,
@@ -77,7 +76,7 @@ static void pxa1928_pll_init(struct pxa1928_clk_unit *pxa_unit)
 	mmp_register_fixed_factor_clks(unit, fixed_factor_clks,
 					ARRAY_SIZE(fixed_factor_clks));
 
-	clk = mmp_clk_register_factor("uart_pll", "pll1_416",
+	mmp_clk_register_factor("uart_pll", "pll1_416",
 				CLK_SET_RATE_PARENT,
 				pxa_unit->mpmu_base + MPMU_UART_PLL,
 				&uart_factor_masks, uart_factor_tbl,
-- 
2.17.1

