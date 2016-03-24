Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:54140 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757364AbcCXNBx (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Thu, 24 Mar 2016 09:01:53 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 4/5] clk: shmobile: r8a7795: add stop for R clk
Date: Thu, 24 Mar 2016 14:00:41 +0100
Message-Id: <1458824442-20279-5-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
References: <1458824442-20279-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

Since RFC, rebased and added ack.

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index c260da5e70e116..22ba841d7f88b8 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -148,6 +148,7 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("usb3-if0",		 328,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac0",		 330,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac1",		 331,	R8A7795_CLK_S3D1),
+	DEF_MOD("rwdt0",		 402,	R8A7795_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A7795_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D4),
-- 
2.7.0

