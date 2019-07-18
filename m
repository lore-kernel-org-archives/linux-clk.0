Return-Path: <SRS0=f356=VP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F4AC76195
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jul 2019 17:49:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2284E2173B
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jul 2019 17:49:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="06E/D9xS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbfGRRtI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Jul 2019 13:49:08 -0400
Received: from pandora.armlinux.org.uk ([78.32.30.218]:37270 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727685AbfGRRtI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Jul 2019 13:49:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=92pp11O0w/KygeJfU6KKGXI60apu6fEQZEzEHiKx8AI=; b=06E/D9xSxeTyEkX282S8AJCHr
        jlsqmlbJjKEnRJO2K+WRb4bLh3dDu3Ysr85Nuu6aCgpOWauBUGRi/eeI1+SsoldJN3BnoGVeCFkLT
        jglWEMcIJmSVzXjiDc5OyPGuU7w7HlSwwo3CcXNdq3f45tU5t6B1KvOt//kDuEs/vPkAKhqan8KZg
        3JxUQKvhBvhw0iJmoM7Ls63K5LpHODzQ41UjKlnr4isPiD4I/xXLDckYUheivrj6jUC77FrdP+BHG
        2AR2wK696zW+t+K2e0bxiNYaq5yGHQef3xXcqtQBw/AAeQ2ombwAHa3V6mxpbTQVd5sB9xnxTx/ai
        R55qKMzwQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60468)
        by pandora.armlinux.org.uk with esmtpsa (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256)
        (Exim 4.90_1)
        (envelope-from <linux@armlinux.org.uk>)
        id 1hoAWd-0008Hp-Ri; Thu, 18 Jul 2019 18:49:04 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.89)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1hoAWb-0002kb-Qn; Thu, 18 Jul 2019 18:49:01 +0100
Date:   Thu, 18 Jul 2019 18:49:01 +0100
From:   Russell King - ARM Linux admin <linux@armlinux.org.uk>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: sa1100: convert to common clock framework
Message-ID: <20190718174901.t6hlrdq6h3xhzlbj@shell.armlinux.org.uk>
References: <E1hhAN0-0007Jn-NP@rmk-PC.armlinux.org.uk>
 <20190718163809.9D25D217F4@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190718163809.9D25D217F4@mail.kernel.org>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jul 18, 2019 at 09:38:08AM -0700, Stephen Boyd wrote:
> Quoting Russell King (2019-06-29 03:14:10)
> > Convert sa1100 to use the common clock framework.
> > 
> > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > ---
> > Please ack; this is part of a larger series.  Thanks.
> 
> Just a few minor comments but otherwise looks good to me.
> 
> > diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/clock.c
> > index 6199e87447ca..523ef25618f7 100644
> > --- a/arch/arm/mach-sa1100/clock.c
> > +++ b/arch/arm/mach-sa1100/clock.c
> > +static const char * const clk_tucr_parents[] = {
> > +       "clk32768", "clk3686400",
> >  };
> 
> It would be great if you used the new way of specifying clk parents with
> direct pointers instead of strings. See commit fc0c209c147f ("clk: Allow
> parents to be specified without string names") for some details.

I don't see at the moment how this is used with clk-mux.c - can you
provide some hints?

> 
> >  
> > -struct clk {
> > -       const struct clkops     *ops;
> > -       unsigned int            enabled;
> > -};
> > -
> > -#define DEFINE_CLK(_name, _ops)                                \
> > -struct clk clk_##_name = {                             \
> > -               .ops    = _ops,                         \
> > -       }
> > -
> > -static DEFINE_SPINLOCK(clocks_lock);
> > -
> > -/* Dummy clk routine to build generic kernel parts that may be using them */
> > -long clk_round_rate(struct clk *clk, unsigned long rate)
> > -{
> > -       return clk_get_rate(clk);
> > -}
> > -EXPORT_SYMBOL(clk_round_rate);
> > -
> > -int clk_set_rate(struct clk *clk, unsigned long rate)
> > -{
> > -       return 0;
> > -}
> > -EXPORT_SYMBOL(clk_set_rate);
> > -
> > -int clk_set_parent(struct clk *clk, struct clk *parent)
> > -{
> > -       return 0;
> > -}
> > -EXPORT_SYMBOL(clk_set_parent);
> > +static DEFINE_SPINLOCK(tucr_lock);
> >  
> > -struct clk *clk_get_parent(struct clk *clk)
> > +static int clk_gpio27_enable(struct clk_hw *hw)
> >  {
> > -       return NULL;
> > -}
> > -EXPORT_SYMBOL(clk_get_parent);
> > +       unsigned long flags;
> >  
> > -static void clk_gpio27_enable(struct clk *clk)
> > -{
> >         /*
> >          * First, set up the 3.6864MHz clock on GPIO 27 for the SA-1111:
> >          * (SA-1110 Developer's Manual, section 9.1.2.1)
> >          */
> > +       local_irq_save(flags);
> >         GAFR |= GPIO_32_768kHz;
> >         GPDR |= GPIO_32_768kHz;
> > -       TUCR = TUCR_3_6864MHz;
> > +       local_irq_restore(flags);
> > +
> > +       return 0;
> >  }
> >  
> > -static void clk_gpio27_disable(struct clk *clk)
> > +static void clk_gpio27_disable(struct clk_hw *hw)
> >  {
> > -       TUCR = 0;
> > +       unsigned long flags;
> > +
> > +       local_irq_save(flags);
> 
> Why just disable irqs here?

What do you mean?  Do you mean "why are you only disabling IRQs and not
taking a spinlock" or do you mean "why are you disabling IRQs here" ?

> 
> >         GPDR &= ~GPIO_32_768kHz;
> >         GAFR &= ~GPIO_32_768kHz;
> > +       local_irq_restore(flags);
> >  }
> >  
> > -static void clk_cpu_enable(struct clk *clk)
> > -{
> > -}
> > +static const struct clk_ops clk_gpio27_ops = {
> > +       .enable = clk_gpio27_enable,
> > +       .disable = clk_gpio27_disable,
> > +};
> >  
> > -static void clk_cpu_disable(struct clk *clk)
> > -{
> > -}
> > +static const char * const clk_gpio27_parents[] = {
> > +       "tucr-mux",
> > +};
> >  
> > -static unsigned long clk_cpu_get_rate(struct clk *clk)
> > +static const struct clk_init_data clk_gpio27_init_data __initconst = {
> > +       .name = "gpio27",
> > +       .ops = &clk_gpio27_ops,
> > +       .parent_names = clk_gpio27_parents,
> > +       .num_parents = ARRAY_SIZE(clk_gpio27_parents),
> > +       .flags = CLK_IS_BASIC,
> 
> CLK_IS_BASIC is gone. Please don't use it.

The patch is against 5.1, and you're right, so that was removed for the
version that ended up going upstream.

> 
> > +};
> > +
> > +/*
> > + * Derived from the table 8-1 in the SA1110 manual, the MPLL appears to
> > + * multiply its input rate by 4 x (4 + PPCR).  This calculation gives
> > + * the exact rate.  The figures given in the table are the rates rounded
> > + * to 100kHz.  Stick with sa11x0_getspeed() for the time being.
> [...]
> > +static const struct clk_init_data clk_mpll_init_data __initconst = {
> > +       .name = "mpll",
> > +       .ops = &clk_mpll_ops,
> > +       .parent_names = clk_mpll_parents,
> > +       .num_parents = ARRAY_SIZE(clk_mpll_parents),
> > +       .flags = CLK_IS_BASIC | CLK_GET_RATE_NOCACHE | CLK_IS_CRITICAL,
> 
> Please add a comment about these last two flags so we know why the rate
> can't be cached and the clk is critical.

Ok, I'll do that with a follow-up patch once the merge window is over.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
