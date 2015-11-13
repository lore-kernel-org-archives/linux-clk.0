Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wm0-f50.google.com ([74.125.82.50]:35775 "EHLO
	mail-wm0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933104AbbKMQaL (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Fri, 13 Nov 2015 11:30:11 -0500
Received: by wmdw130 with SMTP id w130so35979550wmd.0
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2015 08:30:09 -0800 (PST)
From: Neil Armstrong <narmstrong@baylibre.com>
Subject: [PATCH v2 2/4] clk: ti816x: Add missing dmtimer clkdev entries
To: Tony Lindgren <tony@atomide.com>, Paul Walmsley <paul@pwsan.com>,
	Tero Kristo <t-kristo@ti.com>
Cc: linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Brian Hutchinson <b.hutchman@gmail.com>,
	linux-clk@vger.kernel.org, fisaksen@baylibre.com
Message-ID: <56461006.5080309@baylibre.com>
Date: Fri, 13 Nov 2015 17:29:58 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Add missing clkdev dmtimer related entries for dm816x.
32Khz and ext sources were missing.

Cc: Brian Hutchinson <b.hutchman@gmail.com>
Acked-by: Tony Lindgren <tony@atomide.com>
Signed-off-by: Neil Armstrong <narmstrong@baylibre.com>
---
 drivers/clk/ti/clk-816x.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/ti/clk-816x.c b/drivers/clk/ti/clk-816x.c
index 1dfad0c..2a5d84f 100644
--- a/drivers/clk/ti/clk-816x.c
+++ b/drivers/clk/ti/clk-816x.c
@@ -20,6 +20,8 @@ static struct ti_dt_clk dm816x_clks[] = {
 	DT_CLK(NULL, "sys_clkin", "sys_clkin_ck"),
 	DT_CLK(NULL, "timer_sys_ck", "sys_clkin_ck"),
 	DT_CLK(NULL, "sys_32k_ck", "sys_32k_ck"),
+	DT_CLK(NULL, "timer_32k_ck", "sysclk18_ck"),
+	DT_CLK(NULL, "timer_ext_ck", "tclkin_ck"),
 	DT_CLK(NULL, "mpu_ck", "mpu_ck"),
 	DT_CLK(NULL, "timer1_fck", "timer1_fck"),
 	DT_CLK(NULL, "timer2_fck", "timer2_fck"),
-- 
1.9.1
