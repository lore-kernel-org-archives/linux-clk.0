Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hermes.aosc.io ([199.195.250.187]:48387 "EHLO hermes.aosc.io"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932644AbeASXSj (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jan 2018 18:18:39 -0500
From: Icenowy Zheng <icenowy@aosc.io>
To: Maxime Ripard <maxime.ripard@free-electrons.com>,
        Chen-Yu Tsai <wens@csie.org>,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Linus Walleij <linus.walleij@linaro.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-sunxi@googlegroups.com,
        Icenowy Zheng <icenowy@aosc.io>
Subject: [RFC PATCH 5/9] clocksource/drivers/sun4i: register as sched_clock on suniv
Date: Sat, 20 Jan 2018 07:17:31 +0800
Message-Id: <20180119231735.61504-6-icenowy@aosc.io>
In-Reply-To: <20180119231735.61504-1-icenowy@aosc.io>
References: <20180119231735.61504-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The suniv chip (newer F-series Allwinner SoCs) is based on ARM926EJ-S
CPU, thus it has no architecture timer.

Register sun4i_timer as sched_clock on it.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 drivers/clocksource/sun4i_timer.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/sun4i_timer.c b/drivers/clocksource/sun4i_timer.c
index 88e09554ce7a..16dedf5ff0ca 100644
--- a/drivers/clocksource/sun4i_timer.c
+++ b/drivers/clocksource/sun4i_timer.c
@@ -186,7 +186,8 @@ static int __init sun4i_timer_init(struct device_node *node)
 	 */
 	if (of_machine_is_compatible("allwinner,sun4i-a10") ||
 	    of_machine_is_compatible("allwinner,sun5i-a13") ||
-	    of_machine_is_compatible("allwinner,sun5i-a10s"))
+	    of_machine_is_compatible("allwinner,sun5i-a10s") ||
+	    of_machine_is_compatible("allwinner,suniv"))
 		sched_clock_register(sun4i_timer_sched_read, 32,
 				     timer_of_rate(&to));
 
-- 
2.14.2

