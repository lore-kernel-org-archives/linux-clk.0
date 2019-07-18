Return-Path: <SRS0=f356=VP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EADBC7618F
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jul 2019 18:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9E572208C0
	for <linux-clk@archiver.kernel.org>; Thu, 18 Jul 2019 18:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1563475391;
	bh=VBkTn+UPbfr861rCtiG3QiX2KUeWke+wNUnCFcuWlP0=;
	h=In-Reply-To:References:Subject:To:Cc:From:Date:List-ID:From;
	b=KRHCjIYnCL2a8j1IpSHYF3aj7mWl8asXxrOwyQ/fDTIp/GQUP6wzt7WRj6hV8Uogf
	 iuly8LJ2+FPJP2437fCwmjST4ZyJ6rasJauvUpbsH2KujE3U6eEzak2IzeFQdJ/t4d
	 xPjRTXmzgFNQWBu3jPlMYtceFSPbU8sfYC3FyfuY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728111AbfGRSnK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Jul 2019 14:43:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55714 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726649AbfGRSnK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 18 Jul 2019 14:43:10 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C8E24205F4;
        Thu, 18 Jul 2019 18:43:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563475388;
        bh=VBkTn+UPbfr861rCtiG3QiX2KUeWke+wNUnCFcuWlP0=;
        h=In-Reply-To:References:Subject:To:Cc:From:Date:From;
        b=GtkuohfGepI7F95w0kNLfJx59pmM2WlWA0K2xoMJqr03+LEvRyOYelYnS0KD++AGg
         rXmyhQkLK4//xdrw0Rc6RyLvmnbzPy8ix7/rSyt3YTtxEki4fPGOE+09HFdJ0wk3C0
         5yUxeaCyQS1GKnsDAmXfiDQisNTZ7/MivweFS5p4=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20190718174901.t6hlrdq6h3xhzlbj@shell.armlinux.org.uk>
References: <E1hhAN0-0007Jn-NP@rmk-PC.armlinux.org.uk> <20190718163809.9D25D217F4@mail.kernel.org> <20190718174901.t6hlrdq6h3xhzlbj@shell.armlinux.org.uk>
Subject: Re: [PATCH] ARM: sa1100: convert to common clock framework
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From:   Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date:   Thu, 18 Jul 2019 11:43:07 -0700
Message-Id: <20190718184308.C8E24205F4@mail.kernel.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Russell King - ARM Linux admin (2019-07-18 10:49:01)
> On Thu, Jul 18, 2019 at 09:38:08AM -0700, Stephen Boyd wrote:
> > Quoting Russell King (2019-06-29 03:14:10)
> > > Convert sa1100 to use the common clock framework.
> > >=20
> > > Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> > > ---
> > > Please ack; this is part of a larger series.  Thanks.
> >=20
> > Just a few minor comments but otherwise looks good to me.
> >=20
> > > diff --git a/arch/arm/mach-sa1100/clock.c b/arch/arm/mach-sa1100/cloc=
k.c
> > > index 6199e87447ca..523ef25618f7 100644
> > > --- a/arch/arm/mach-sa1100/clock.c
> > > +++ b/arch/arm/mach-sa1100/clock.c
> > > +static const char * const clk_tucr_parents[] =3D {
> > > +       "clk32768", "clk3686400",
> > >  };
> >=20
> > It would be great if you used the new way of specifying clk parents with
> > direct pointers instead of strings. See commit fc0c209c147f ("clk: Allow
> > parents to be specified without string names") for some details.
>=20
> I don't see at the moment how this is used with clk-mux.c - can you
> provide some hints?

In this case both the parents are clk_hw pointers I think so an array
where first element is the clk_hw pointer to clk32768 and the second
element is the clk_hw pointer to clk3686400 would be assigned to
clk_init_data's parent_hws member.


	struct clk_hw *clk_tucr_parents[] =3D {
		&clk32768_hw,=20
		&clk3686400_hw,
	};

	clk_tucr_init.parent_hws =3D clk_tucr_parents;

>=20
> > > =20
> > > -static void clk_gpio27_enable(struct clk *clk)
> > > -{
> > >         /*
> > >          * First, set up the 3.6864MHz clock on GPIO 27 for the SA-11=
11:
> > >          * (SA-1110 Developer's Manual, section 9.1.2.1)
> > >          */
> > > +       local_irq_save(flags);
> > >         GAFR |=3D GPIO_32_768kHz;
> > >         GPDR |=3D GPIO_32_768kHz;
> > > -       TUCR =3D TUCR_3_6864MHz;
> > > +       local_irq_restore(flags);
> > > +
> > > +       return 0;
> > >  }
> > > =20
> > > -static void clk_gpio27_disable(struct clk *clk)
> > > +static void clk_gpio27_disable(struct clk_hw *hw)
> > >  {
> > > -       TUCR =3D 0;
> > > +       unsigned long flags;
> > > +
> > > +       local_irq_save(flags);
> >=20
> > Why just disable irqs here?
>=20
> What do you mean?  Do you mean "why are you only disabling IRQs and not
> taking a spinlock" or do you mean "why are you disabling IRQs here" ?

I mean, why are you disabling irqs and not taking a spinlock? Must be
because there's already a spinlock in the clk framework?

>=20
> >=20
> > >         GPDR &=3D ~GPIO_32_768kHz;
> > >         GAFR &=3D ~GPIO_32_768kHz;
> > > +       local_irq_restore(flags);
> > >  }
> > > =20
> > > -static void clk_cpu_enable(struct clk *clk)
> > > -{
> > > -}
> > > +static const struct clk_ops clk_gpio27_ops =3D {
> > > +       .enable =3D clk_gpio27_enable,
> > > +       .disable =3D clk_gpio27_disable,
> > > +};
> > > =20
> > > -static void clk_cpu_disable(struct clk *clk)
> > > -{
> > > -}
> > > +static const char * const clk_gpio27_parents[] =3D {
> > > +       "tucr-mux",
> > > +};
> > > =20
> > > -static unsigned long clk_cpu_get_rate(struct clk *clk)
> > > +static const struct clk_init_data clk_gpio27_init_data __initconst =
=3D {
> > > +       .name =3D "gpio27",
> > > +       .ops =3D &clk_gpio27_ops,
> > > +       .parent_names =3D clk_gpio27_parents,
> > > +       .num_parents =3D ARRAY_SIZE(clk_gpio27_parents),
> > > +       .flags =3D CLK_IS_BASIC,
> >=20
> > CLK_IS_BASIC is gone. Please don't use it.
>=20
> The patch is against 5.1, and you're right, so that was removed for the
> version that ended up going upstream.

Oh did this get sent to Linus already? I guess I should have reviewed
this earlier.

>=20
> >=20
> > > +};
> > > +
> > > +/*
> > > + * Derived from the table 8-1 in the SA1110 manual, the MPLL appears=
 to
> > > + * multiply its input rate by 4 x (4 + PPCR).  This calculation gives
> > > + * the exact rate.  The figures given in the table are the rates rou=
nded
> > > + * to 100kHz.  Stick with sa11x0_getspeed() for the time being.
> > [...]
> > > +static const struct clk_init_data clk_mpll_init_data __initconst =3D=
 {
> > > +       .name =3D "mpll",
> > > +       .ops =3D &clk_mpll_ops,
> > > +       .parent_names =3D clk_mpll_parents,
> > > +       .num_parents =3D ARRAY_SIZE(clk_mpll_parents),
> > > +       .flags =3D CLK_IS_BASIC | CLK_GET_RATE_NOCACHE | CLK_IS_CRITI=
CAL,
> >=20
> > Please add a comment about these last two flags so we know why the rate
> > can't be cached and the clk is critical.
>=20
> Ok, I'll do that with a follow-up patch once the merge window is over.
>=20

Ok, thanks.
