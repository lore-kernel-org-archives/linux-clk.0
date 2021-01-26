Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF55AC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:15:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90B392311C
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 13:15:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404137AbhAZNN5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 08:13:57 -0500
Received: from inva020.nxp.com ([92.121.34.13]:58738 "EHLO inva020.nxp.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404098AbhAZNNh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 26 Jan 2021 08:13:37 -0500
Received: from inva020.nxp.com (localhost [127.0.0.1])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id EE95C1A0D28;
        Tue, 26 Jan 2021 14:12:39 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
        by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id E1DDB1A021C;
        Tue, 26 Jan 2021 14:12:39 +0100 (CET)
Received: from localhost (fsr-ub1664-175.ea.freescale.net [10.171.82.40])
        by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id CE06E2034A;
        Tue, 26 Jan 2021 14:12:39 +0100 (CET)
Date:   Tue, 26 Jan 2021 15:12:39 +0200
From:   Abel Vesa <abel.vesa@nxp.com>
To:     Sascha Hauer <sha@pengutronix.de>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [RFC] clk: Mark HW enabled clocks as enabled in core
Message-ID: <20210126131239.uyolpawk2jfat7z4@fsr-ub1664-175>
References: <1611660096-12381-1-git-send-email-abel.vesa@nxp.com>
 <20210126115105.GD28722@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126115105.GD28722@pengutronix.de>
User-Agent: NeoMutt/20180622
X-Virus-Scanned: ClamAV using ClamSMTP
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-01-26 12:51:05, Sascha Hauer wrote:
> On Tue, Jan 26, 2021 at 01:21:36PM +0200, Abel Vesa wrote:
> > Some clocks are already enabled in HW even before the kernel
> > starts to boot. So, in order to make sure that these clocks do not
> > get disabled when clk_disable_unused call is done or when
> > reparenting clocks, we enable them in core on clock registration.
> > Such a clock will have to be registered with CLK_IGNORE_UNUSED flag
> > and also needs to have the is_enabled ops implemented.
> > 
> > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > ---
> >  drivers/clk/clk.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 3d751ae5bc70..26d55851cfa5 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -3416,6 +3416,7 @@ static int __clk_core_init(struct clk_core *core)
> >  	int ret;
> >  	struct clk_core *parent;
> >  	unsigned long rate;
> > +	bool is_hw_enabled = false;
> >  	int phase;
> >  
> >  	if (!core)
> > @@ -3558,12 +3559,20 @@ static int __clk_core_init(struct clk_core *core)
> >  		rate = 0;
> >  	core->rate = core->req_rate = rate;
> >  
> > +	/*
> > +	 * If the clock has the CLK_IGNORE_UNUSED flag set and it is already
> > +	 * enabled in HW, enable it in core too so it won't get accidentally
> > +	 * disabled when walking the orphan tree and reparenting clocks
> > +	 */
> > +	if (core->flags & CLK_IGNORE_UNUSED && core->ops->is_enabled)
> > +		is_hw_enabled = clk_core_is_enabled(core);
> > +
> >  	/*
> >  	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
> >  	 * don't get accidentally disabled when walking the orphan tree and
> >  	 * reparenting clocks
> >  	 */
> > -	if (core->flags & CLK_IS_CRITICAL) {
> > +	if (core->flags & CLK_IS_CRITICAL || is_hw_enabled) {
> >  		unsigned long flags;
> >  
> >  		ret = clk_core_prepare(core);
> 
> This means that a bootloader enabled clock with CLK_IGNORE_UNUSED flag
> can effectively never be disabled because the prepare/enable count is 1
> without any user. This is the behaviour we want to have with critical
> clocks, but I don't think this is desired for clocks with the
> CLK_IGNORE_UNUSED flag.
> 

Here is the way I see it. Critical clocks means the system can't work
without, so do not ever disable/unprepare. The "ignore unused" flag
tells the core to not do anything to this clock, even if it is unused.
For now, it just leaves the clock alone, but the flag could be used for
some other stuff in the future.

Now, the behavior is entirely different.

For the "critical" clock disable/unprepare, the core does nothing
(returns without calling the disable/unprepare ops).

As for the "ignore unused", the clock can be disabled later on,
which would decrement the prepare/enable counter.
The imx earlycon serial driver could implement a late initcall,
that takes the clocks from the devicetree uart node and disables
them. The user doesn't even count in this situation.

Plus, there is no other reason someone would use the CLK_IGNORE_UNUSED,
other than leaving a clock that is already enabled stay as is (at least,
not with the current implementation). So why not mark it as enabled in 
the core, if the HW says it is enabled ?
