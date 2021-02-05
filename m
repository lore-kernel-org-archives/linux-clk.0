Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C680C43381
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 11:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C5D9364F9F
	for <linux-clk@archiver.kernel.org>; Fri,  5 Feb 2021 11:08:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231934AbhBELIU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Feb 2021 06:08:20 -0500
Received: from gloria.sntech.de ([185.11.138.130]:42278 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231941AbhBELFv (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 5 Feb 2021 06:05:51 -0500
Received: from ip5f5aa64a.dynamic.kabel-deutschland.de ([95.90.166.74] helo=phil.lan)
        by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <heiko@sntech.de>)
        id 1l7yvC-0001Ja-BO; Fri, 05 Feb 2021 12:05:06 +0100
From:   Heiko Stuebner <heiko@sntech.de>
To:     heiko@sntech.de
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
Subject: [PATCH 5/5] clk: rockchip: fix DPHY gate locations on rk3368
Date:   Fri,  5 Feb 2021 12:05:02 +0100
Message-Id: <20210205110502.1850669-5-heiko@sntech.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205110502.1850669-1-heiko@sntech.de>
References: <20210205110502.1850669-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>

Fix the register and bits of the DPHY gate locations.

Signed-off-by: Heiko Stuebner <heiko.stuebner@theobroma-systems.com>
---
 drivers/clk/rockchip/clk-rk3368.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/rockchip/clk-rk3368.c b/drivers/clk/rockchip/clk-rk3368.c
index 61413be48d1a..9a0dab9448db 100644
--- a/drivers/clk/rockchip/clk-rk3368.c
+++ b/drivers/clk/rockchip/clk-rk3368.c
@@ -818,8 +818,8 @@ static struct rockchip_clk_branch rk3368_clk_branches[] __initdata = {
 	 * pclk_vio gates
 	 * pclk_vio comes from the exactly same source as hclk_vio
 	 */
-	GATE(PCLK_DPHYRX, "pclk_dphyrx", "hclk_vio", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(14), 8, GFLAGS),
-	GATE(PCLK_DPHYTX0, "pclk_dphytx0", "hclk_vio", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(14), 8, GFLAGS),
+	GATE(PCLK_DPHYRX, "pclk_dphyrx", "hclk_vio", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(22), 11, GFLAGS),
+	GATE(PCLK_DPHYTX0, "pclk_dphytx0", "hclk_vio", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(22), 10, GFLAGS),
 
 	/* pclk_pd_pmu gates */
 	GATE(PCLK_PMUGRF, "pclk_pmugrf", "pclk_pd_pmu", CLK_IGNORE_UNUSED, RK3368_CLKGATE_CON(23), 5, GFLAGS),
-- 
2.29.2

