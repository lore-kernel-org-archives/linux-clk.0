Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F78CC433DB
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 14:34:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 375C6230FC
	for <linux-clk@archiver.kernel.org>; Tue, 26 Jan 2021 14:34:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391724AbhAZOdu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 26 Jan 2021 09:33:50 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:50457 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405831AbhAZOdq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 26 Jan 2021 09:33:46 -0500
X-Greylist: delayed 9570 seconds by postgrey-1.27 at vger.kernel.org; Tue, 26 Jan 2021 09:33:45 EST
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1l4PMI-0003n4-Qi; Tue, 26 Jan 2021 15:30:18 +0100
Received: from sha by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <sha@pengutronix.de>)
        id 1l4PMH-0003DS-Ns; Tue, 26 Jan 2021 15:30:17 +0100
Date:   Tue, 26 Jan 2021 15:30:17 +0100
From:   Sascha Hauer <sha@pengutronix.de>
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org
Subject: Re: [RFC] clk: Mark HW enabled clocks as enabled in core
Message-ID: <20210126143017.GF28722@pengutronix.de>
References: <1611660096-12381-1-git-send-email-abel.vesa@nxp.com>
 <20210126115105.GD28722@pengutronix.de>
 <20210126131239.uyolpawk2jfat7z4@fsr-ub1664-175>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210126131239.uyolpawk2jfat7z4@fsr-ub1664-175>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:54:26 up 55 days,  2:21, 98 users,  load average: 0.04, 0.07,
 0.09
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: sha@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 26, 2021 at 03:12:39PM +0200, Abel Vesa wrote:
> On 21-01-26 12:51:05, Sascha Hauer wrote:
> > On Tue, Jan 26, 2021 at 01:21:36PM +0200, Abel Vesa wrote:
> > > Some clocks are already enabled in HW even before the kernel
> > > starts to boot. So, in order to make sure that these clocks do not
> > > get disabled when clk_disable_unused call is done or when
> > > reparenting clocks, we enable them in core on clock registration.
> > > Such a clock will have to be registered with CLK_IGNORE_UNUSED flag
> > > and also needs to have the is_enabled ops implemented.
> > > 
> > > Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> > > ---
> > >  drivers/clk/clk.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > > index 3d751ae5bc70..26d55851cfa5 100644
> > > --- a/drivers/clk/clk.c
> > > +++ b/drivers/clk/clk.c
> > > @@ -3416,6 +3416,7 @@ static int __clk_core_init(struct clk_core *core)
> > >  	int ret;
> > >  	struct clk_core *parent;
> > >  	unsigned long rate;
> > > +	bool is_hw_enabled = false;
> > >  	int phase;
> > >  
> > >  	if (!core)
> > > @@ -3558,12 +3559,20 @@ static int __clk_core_init(struct clk_core *core)
> > >  		rate = 0;
> > >  	core->rate = core->req_rate = rate;
> > >  
> > > +	/*
> > > +	 * If the clock has the CLK_IGNORE_UNUSED flag set and it is already
> > > +	 * enabled in HW, enable it in core too so it won't get accidentally
> > > +	 * disabled when walking the orphan tree and reparenting clocks
> > > +	 */
> > > +	if (core->flags & CLK_IGNORE_UNUSED && core->ops->is_enabled)
> > > +		is_hw_enabled = clk_core_is_enabled(core);
> > > +
> > >  	/*
> > >  	 * Enable CLK_IS_CRITICAL clocks so newly added critical clocks
> > >  	 * don't get accidentally disabled when walking the orphan tree and
> > >  	 * reparenting clocks
> > >  	 */
> > > -	if (core->flags & CLK_IS_CRITICAL) {
> > > +	if (core->flags & CLK_IS_CRITICAL || is_hw_enabled) {
> > >  		unsigned long flags;
> > >  
> > >  		ret = clk_core_prepare(core);
> > 
> > This means that a bootloader enabled clock with CLK_IGNORE_UNUSED flag
> > can effectively never be disabled because the prepare/enable count is 1
> > without any user. This is the behaviour we want to have with critical
> > clocks, but I don't think this is desired for clocks with the
> > CLK_IGNORE_UNUSED flag.
> > 
> 
> Here is the way I see it. Critical clocks means the system can't work
> without, so do not ever disable/unprepare. The "ignore unused" flag
> tells the core to not do anything to this clock, even if it is unused.
> For now, it just leaves the clock alone, but the flag could be used for
> some other stuff in the future.
> 
> Now, the behavior is entirely different.
> 
> For the "critical" clock disable/unprepare, the core does nothing
> (returns without calling the disable/unprepare ops).
> 
> As for the "ignore unused", the clock can be disabled later on,
> which would decrement the prepare/enable counter.
> The imx earlycon serial driver could implement a late initcall,
> that takes the clocks from the devicetree uart node and disables
> them. The user doesn't even count in this situation.
> 
> Plus, there is no other reason someone would use the CLK_IGNORE_UNUSED,
> other than leaving a clock that is already enabled stay as is (at least,
> not with the current implementation). So why not mark it as enabled in 
> the core, if the HW says it is enabled ?

The CLK_IGNORE_UNUSED is there from the start of the clock framework, so
there is no commit message that tells what it shall be used for. AFAIR
the flag was thought for being used with clocks which should not be
disabled, but had no driver initially that used them.
Implementation of this flag was likely broken from the start as well,
because in this situation:

      a
     / \
    b   c (CLK_IGNORE_UNUSED)

When clk b is enabled/disabled then the parent of clock c is disabled as
well, so CLK_IGNORE_UNUSED doesn't help at all. In that sense your patch
really improves things, because the above example would be fixed.

Anyway, CLK_IGNORE_UNUSED is excessively used in the kernel, we have
over 1000 clocks that have this flag set. With your patch all of a
sudden all these clocks won't be disabled anymore and all these clocks
will require some fixup to finally disable them when desired. I don't
think this is a good idea.

Sascha


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
