Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:33495 "EHLO
        out2-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1030283AbeFSSxm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Jun 2018 14:53:42 -0400
Date: Tue, 19 Jun 2018 14:53:39 -0400
From: David Rivshin <drivshin@awxrd.com>
To: Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>
Subject: dmtimer fclk regression in 4.16?
Message-ID: <20180619145339.08322293.drivshin@awxrd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

I think I've run across a regression in 4.16 that resulted from the TI clock 
infrastructure changes. A bisect pointed to [1] as the first breaking commit. 

Our use-case is a pwm-dmtimer-omap using timer7, with timer7_fck parented 
by clkdiv32k_ick (aka timer_32k_ck aka l4_per_cm:clk:0138:0). Starting with 
4.16 that parenting fails in omap_dm_timer_set_source(), called from 
pwm_omap_dmtimer_probe, at this check:
	if (clk_hw_get_num_parents(__clk_get_hw(timer->fclk)) < 2)
		return 0;
because timer->fclk is "l4_per_cm:clk:0068:0", whose only possible parent 
is "timer7_fck". 

It seemed to me that timer->fclk should instead be "timer7_fck" (which has 
the desired set of possible parents). I tried following the lead set in [2] 
and added "clocks" and "clock-names" properties on timer7. However, that 
resulted in omap_dm_timer_of_set_source(), called by omap_dm_timer_prepare(), 
failing when it tries to parent "timer7_fck" to itself. 

The following change in omap_dm_timer_prepare() does seem to work:
-		timer->fclk = clk_get(&timer->pdev->dev, "fck");
+		timer->fclk = clk_get_parent(clk_get(&timer->pdev->dev, "fck"));
but I'm very uncertain whether that's the right path. 
Should omap_dm_timer know that the clock returned is actually a child of the 
clock it's interested in? Or should clk_get(<timerN>,"fck") be returning the 
timerN_fck in the first place? Or is the problem something else entirely?

As I'm not sure how these pieces are all intended to fit together, any 
pointers would be appreciated.

Thanks,
David Rivshin

[1] df54bfc5502a ("clk: ti: am33xx: add clkctrl clock data") 
https://www.spinics.net/lists/linux-omap/msg139798.html
[2] 521f9e5e3f87 ("ARM: dts: am33xx: add fck under timers1/2")
https://www.spinics.net/lists/linux-omap/msg140605.html

