Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74B5FC282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:59:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 423E1222C9
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 17:59:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391667AbfBMR7P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 12:59:15 -0500
Received: from muru.com ([72.249.23.125]:38650 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729522AbfBMR7O (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 13 Feb 2019 12:59:14 -0500
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id 6CBA280AE;
        Wed, 13 Feb 2019 17:59:23 +0000 (UTC)
Date:   Wed, 13 Feb 2019 09:59:10 -0800
From:   Tony Lindgren <tony@atomide.com>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>, linux-clk@vger.kernel.org,
        linux-omap@vger.kernel.org,
        Misael Lopez Cruz <misael.lopez@ti.com>,
        Peter Ujfalusi <peter.ujfalusi@ti.com>
Subject: Re: [PATCH] clk: clk-twl6040: Fix imprecise external abort for pdmclk
Message-ID: <20190213175910.GY5720@atomide.com>
References: <20190211225907.38511-1-tony@atomide.com>
 <155008032870.115909.10773814001430389227@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <155008032870.115909.10773814001430389227@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

* Stephen Boyd <sboyd@kernel.org> [190213 17:52]:
> Quoting Tony Lindgren (2019-02-11 14:59:07)
> > I noticed that modprobe clk-twl6040 can fail after a cold boot with:
> > abe_cm:clk:0010:0: failed to enable
> > ...
> > Unhandled fault: imprecise external abort (0x1406) at 0xbe896b20
> > 
> > WARNING: CPU: 1 PID: 29 at drivers/clk/clk.c:828 clk_core_disable_lock+0x18/0x24
> > ...
> > (clk_core_disable_lock) from [<c0123534>] (_disable_clocks+0x18/0x90)
> > (_disable_clocks) from [<c0124040>] (_idle+0x17c/0x244)
> > (_idle) from [<c0125ad4>] (omap_hwmod_idle+0x24/0x44)
> > (omap_hwmod_idle) from [<c053a038>] (sysc_runtime_suspend+0x48/0x108)
> > (sysc_runtime_suspend) from [<c06084c4>] (__rpm_callback+0x144/0x1d8)
> > (__rpm_callback) from [<c0608578>] (rpm_callback+0x20/0x80)
> > (rpm_callback) from [<c0607034>] (rpm_suspend+0x120/0x694)
> > (rpm_suspend) from [<c0607a78>] (__pm_runtime_idle+0x60/0x84)
> > (__pm_runtime_idle) from [<c053aaf0>] (sysc_probe+0x874/0xf2c)
> > (sysc_probe) from [<c05fecd4>] (platform_drv_probe+0x48/0x98)
> > 
> > After searching around for a similar issue, I came across an earlier fix
> > that never got merged upstream in the Android tree for glass-omap-xrr02.
> > There is patch "MFD: twl6040-codec: Implement PDMCLK cold temp errata"
> > by Misael Lopez Cruz <misael.lopez@ti.com>.
> > 
> > Based on my observations, this fix is also needed when cold booting
> > devices, and not just for deeper idle modes. Since we now have a clock
> > driver for pdmclk, let's fix the issue in twl6040_pdmclk_prepare().
> > 
> > Cc: Misael Lopez Cruz <misael.lopez@ti.com>
> > Cc: Peter Ujfalusi <peter.ujfalusi@ti.com>
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> 
> Should this be backported to stable trees?

Yes please, I think that's a good idea.

Regards,

Tony
