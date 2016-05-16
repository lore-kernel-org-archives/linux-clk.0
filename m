Return-Path: <moinejf@free.fr>
Date: Mon, 16 May 2016 10:02:39 +0200
From: Jean-Francois Moine <moinejf@free.fr>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Chen-Yu Tsai <wens@csie.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Vishnu Patekar
 <vishnupatekar0510@gmail.com>, Andre Przywara <andre.przywara@arm.com>,
 Mike Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@codeaurora.org>, Hans de Goede <hdegoede@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 02/16] clk: sunxi-ng: Add common infrastructure
Message-Id: <20160516100239.a93a238b0d458b38a3689a95@free.fr>
In-Reply-To: <20160515183122.GA27618@lukather>
References: <1462737711-10017-1-git-send-email-maxime.ripard@free-electrons.com>
	<1462737711-10017-3-git-send-email-maxime.ripard@free-electrons.com>
	<CAGb2v67XWt6tjG_xXWgGatTaiN5uYQb2_Q6bgixMDUkHfVHLHg@mail.gmail.com>
	<20160515183122.GA27618@lukather>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Sun, 15 May 2016 20:31:22 +0200
Maxime Ripard <maxime.ripard@free-electrons.com> wrote:

> > > +void ccu_helper_wait_for_lock(struct ccu_common *common, u32 lock)
> > > +{
> > > +       u32 reg;
> > > +
> > > +       if (!(common->features & CCU_FEATURE_LOCK))
> > > +               return;
> > > +
> > > +       WARN_ON(readl_relaxed_poll_timeout(common->base + common->reg=
, reg,
> > > +                                          !(reg & lock), 0, 500));
> >=20
> >                                     no delay between reads? ^
>=20
> Yes, I intended it to be a simple busy waiting loop since I don't
> expect it to be very long. Do yu have any more data on how much time
> it usually takes?

I have a Soc in which the rate of the audio clock is stable after a
good second.

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
