Return-Path: <SRS0=f356=VP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 465E5C7618F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jul 2019 22:41:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 028DC21850
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jul 2019 22:41:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="p8RLhlmg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728135AbfGRWlh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Jul 2019 18:41:37 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:40522 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727950AbfGRWlh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jul 2019 18:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=36BZtPLq/CaxSXzOtJxH8ypuKReHxIuhr0TFBrP0Uh4=; b=p8RLhlmg/xEimAbs3PuIbdPLk
        ti/Ji+4uUHPFAtQNzyvMbUf+8EbZXMAtSBGVIrJ8Us+hdJmthrLfVz+H7yOMPUGvpAXrIdosqLUdP
        FTl/m9APcimgYRv+tIza3tfLutBluv06M9/GD+12M2ovVj/OS8NYX+ZSsUXhaVm6cnWhF7KXhA+e2
        AjlpljDfZfnEYw1R8fyOOQeZYIUoYV+cEW9iqVEzj0mPrKTaVqh1bhLudvI7jxsNcosU1etBMcfGv
        zV0pqK8/XXFRhChP6hg/cx8frSi/KxkkpXy9MX6HCLrx7cj7lcXnEvJoTpwUlk0jpN1BvbJn092QH
        2/BXCrN5A==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60470)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hoF5h-0000zq-F0; Thu, 18 Jul 2019 23:41:33 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hoF5c-0002uC-ID; Thu, 18 Jul 2019 23:41:28 +0100
Date:   Thu, 18 Jul 2019 23:41:28 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: sa1100: convert to common clock framework
Message-ID: <20190718224128.bm7zfq3pg6psfai4@shell.armlinux.org.uk>
References: <E1hhAN0-0007Jn-NP@rmk-PC.armlinux.org.uk>
 <20190718163809.9D25D217F4@mail.kernel.org>
 <20190718174901.t6hlrdq6h3xhzlbj@shell.armlinux.org.uk>
 <20190718184308.C8E24205F4@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718184308.C8E24205F4@mail.kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 18, 2019 at 11:43:07AM -0700, Stephen Boyd wrote:
> Quoting Russell King - ARM Linux admin (2019-07-18 10:49:01)
> > On Thu, Jul 18, 2019 at 09:38:08AM -0700, Stephen Boyd wrote:
> > > Quoting Russell King (2019-06-29 03:14:10)
> > > > Convert sa1100 to use the common clock framework.
> > > > 
> > > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > > ---
> > > > Please ack; this is part of a larger series.  Thanks.
> > > 
> > > Just a few minor comments but otherwise looks good to me.
> > > 
> > > > diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
> > > > index 6199e87447ca..523ef25618f7 100644
> > > > --- a/arch/arm/mach-sa1100/clock.c
> > > > +++ b/arch/arm/mach-sa1100/clock.c
> > > > +static const char * const clk_tucr_parents[] = {
> > > > +       "clk32768", "clk3686400",
> > > >  };
> > > 
> > > It would be great if you used the new way of specifying clk parents with
> > > direct pointers instead of strings. See commit fc0c209c147f ("clk: Allow
> > > parents to be specified without string names") for some details.
> > 
> > I don't see at the moment how this is used with clk-mux.c - can you
> > provide some hints?
> 
> In this case both the parents are clk_hw pointers I think so an array
> where first element is the clk_hw pointer to clk32768 and the second
> element is the clk_hw pointer to clk3686400 would be assigned to
> clk_init_data's parent_hws member.
> 
> 
> 	struct clk_hw *clk_tucr_parents[] = {
> 		&clk32768_hw, 
> 		&clk3686400_hw,
> 	};
> 
> 	clk_tucr_init.parent_hws = clk_tucr_parents;

Thanks.

> > > > -static void clk_gpio27_enable(struct clk *clk)
> > > > -{
> > > >         /*
> > > >          * First, set up the 3.6864MHz clock on GPIO 27 for the SA-1111:
> > > >          * (SA-1110 Developer's Manual, section 9.1.2.1)
> > > >          */
> > > > +       local_irq_save(flags);
> > > >         GAFR |= GPIO_32_768kHz;
> > > >         GPDR |= GPIO_32_768kHz;
> > > > -       TUCR = TUCR_3_6864MHz;
> > > > +       local_irq_restore(flags);
> > > > +
> > > > +       return 0;
> > > >  }
> > > >  
> > > > -static void clk_gpio27_disable(struct clk *clk)
> > > > +static void clk_gpio27_disable(struct clk_hw *hw)
> > > >  {
> > > > -       TUCR = 0;
> > > > +       unsigned long flags;
> > > > +
> > > > +       local_irq_save(flags);
> > > 
> > > Why just disable irqs here?
> > 
> > What do you mean?  Do you mean "why are you only disabling IRQs and not
> > taking a spinlock" or do you mean "why are you disabling IRQs here" ?
> 
> I mean, why are you disabling irqs and not taking a spinlock? Must be
> because there's already a spinlock in the clk framework?

Nope - it's because there's no point taking a spinlock on something
that is fundamentally only a uniprocessor architecture.  There's never
going to be a SA11x0 compatible SoC that has more than one core.

> > > >         GPDR &= ~GPIO_32_768kHz;
> > > >         GAFR &= ~GPIO_32_768kHz;
> > > > +       local_irq_restore(flags);
> > > >  }
> > > >  
> > > > -static void clk_cpu_enable(struct clk *clk)
> > > > -{
> > > > -}
> > > > +static const struct clk_ops clk_gpio27_ops = {
> > > > +       .enable = clk_gpio27_enable,
> > > > +       .disable = clk_gpio27_disable,
> > > > +};
> > > >  
> > > > -static void clk_cpu_disable(struct clk *clk)
> > > > -{
> > > > -}
> > > > +static const char * const clk_gpio27_parents[] = {
> > > > +       "tucr-mux",
> > > > +};
> > > >  
> > > > -static unsigned long clk_cpu_get_rate(struct clk *clk)
> > > > +static const struct clk_init_data clk_gpio27_init_data __initconst = {
> > > > +       .name = "gpio27",
> > > > +       .ops = &clk_gpio27_ops,
> > > > +       .parent_names = clk_gpio27_parents,
> > > > +       .num_parents = ARRAY_SIZE(clk_gpio27_parents),
> > > > +       .flags = CLK_IS_BASIC,
> > > 
> > > CLK_IS_BASIC is gone. Please don't use it.
> > 
> > The patch is against 5.1, and you're right, so that was removed for the
> > version that ended up going upstream.
> 
> Oh did this get sent to Linus already? I guess I should have reviewed
> this earlier.

Generally, SA11x0 stuff doesn't interest people, and patches I send out
don't attract comments - so I tend to wait a couple of weeks before
queuing them for merging.

It hasn't yet been merged, but is in the queue - arm-soc has taken it
into their late merges, but those haven't yet been sent.

> > > > +};
> > > > +
> > > > +/*
> > > > + * Derived from the table 8-1 in the SA1110 manual, the MPLL appears to
> > > > + * multiply its input rate by 4 x (4 + PPCR).  This calculation gives
> > > > + * the exact rate.  The figures given in the table are the rates rounded
> > > > + * to 100kHz.  Stick with sa11x0_getspeed() for the time being.
> > > [...]
> > > > +static const struct clk_init_data clk_mpll_init_data __initconst = {
> > > > +       .name = "mpll",
> > > > +       .ops = &clk_mpll_ops,
> > > > +       .parent_names = clk_mpll_parents,
> > > > +       .num_parents = ARRAY_SIZE(clk_mpll_parents),
> > > > +       .flags = CLK_IS_BASIC | CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL,
> > > 
> > > Please add a comment about these last two flags so we know why the rate
> > > can't be cached and the clk is critical.
> > 
> > Ok, I'll do that with a follow-up patch once the merge window is over.
> > 
> 
> Ok, thanks.
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
