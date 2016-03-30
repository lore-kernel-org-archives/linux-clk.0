Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:43640 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752708AbcC3O7b (ORCPT <rfc822;linux-clk@vger.kernel.org>);
	Wed, 30 Mar 2016 10:59:31 -0400
From: Wolfram Sang <wsa@the-dreams.de>
To: linux-clk@vger.kernel.org
Cc: Wolfram Sang <wsa@the-dreams.de>,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2 4/5] clk: renesas: r8a7795: add stop for R clk
Date: Wed, 30 Mar 2016 16:58:21 +0200
Message-Id: <1459349902-13243-5-git-send-email-wsa@the-dreams.de>
In-Reply-To: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
References: <1459349902-13243-1-git-send-email-wsa@the-dreams.de>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

From: Wolfram Sang <wsa+renesas@sang-engineering.com>

Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
---

No change since V1.

 drivers/clk/renesas/r8a7795-cpg-mssr.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/renesas/r8a7795-cpg-mssr.c b/drivers/clk/renesas/r8a7795-cpg-mssr.c
index 19b02645771876..6af7f5b6e8240b 100644
--- a/drivers/clk/renesas/r8a7795-cpg-mssr.c
+++ b/drivers/clk/renesas/r8a7795-cpg-mssr.c
@@ -151,6 +151,7 @@ static const struct mssr_mod_clk r8a7795_mod_clks[] __initconst = {
 	DEF_MOD("usb3-if0",		 328,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac0",		 330,	R8A7795_CLK_S3D1),
 	DEF_MOD("usb-dmac1",		 331,	R8A7795_CLK_S3D1),
+	DEF_MOD("rwdt0",		 402,	R8A7795_CLK_R),
 	DEF_MOD("intc-ex",		 407,	R8A7795_CLK_CP),
 	DEF_MOD("intc-ap",		 408,	R8A7795_CLK_S3D1),
 	DEF_MOD("audmac0",		 502,	R8A7795_CLK_S3D4),
-- 
2.7.0

