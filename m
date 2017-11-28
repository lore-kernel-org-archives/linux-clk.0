Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailoutvs3.siol.net ([213.250.19.136]:49601 "EHLO mail.siol.net"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752523AbdK1V4f (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 28 Nov 2017 16:56:35 -0500
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: Daniel Vetter <daniel.vetter@intel.com>,
        David Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        plaes@plaes.org, icenowy@aosc.io,
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: [PATCH v2 05/18] drm/sun4i: Force the mixer rate at 150MHz
Date: Tue, 28 Nov 2017 22:56:31 +0100
Message-ID: <2326800.o3FEWRaSfH@jernej-laptop>
In-Reply-To: <20171128085826.snmflonvbic5put3@flea.home>
References: <cover.d89f3ea4e1698f9343aef4852977c80edc75f21a.1511797218.git-series.maxime.ripard@free-electrons.com> <9630064.mDmGGWOQGt@jernej-laptop> <20171128085826.snmflonvbic5put3@flea.home>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi!

Dne torek, 28. november 2017 ob 09:58:26 CET je Maxime Ripard napisal(a):
> On Mon, Nov 27, 2017 at 05:07:04PM +0100, Jernej Škrabec wrote:
> > Hi Maxime,
> > 
> > Dne ponedeljek, 27. november 2017 ob 16:41:29 CET je Maxime Ripard 
napisal(a):
> > > It seems like the mixer can only run properly when clocked at 150MHz. In
> > > order to have something more robust than simply a fire-and-forget
> > > assigned-clocks-rate, let's put that in the code.
> > > 
> > > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
> > > ---
> > > 
> > >  drivers/gpu/drm/sun4i/sun8i_mixer.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > b/drivers/gpu/drm/sun4i/sun8i_mixer.c index cb193c5f1686..c0cdccf772a2
> > > 100644
> > > --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> > > @@ -315,6 +315,13 @@ static int sun8i_mixer_bind(struct device *dev,
> > > struct
> > > device *master, }
> > > 
> > >  	clk_prepare_enable(mixer->mod_clk);
> > > 
> > > +	/*
> > > +	 * It seems that we need to enforce that rate for whatever
> > > +	 * reason for the mixer to be functional. Make sure it's the
> > > +	 * case.
> > > +	 */
> > > +	clk_set_rate(mixer->mod_clk, 150000000);
> > > +
> > 
> > H3 mixer works at much higher rate and if we want to support tv out, it
> > must be dividable by 432 MHz, so either 432 MHz or maybe even 864 MHz.
> > 
> > We talked about that few months ago.
> > 
> > I guess this should be read from mixer configuration structure.
> 
> That works for me. Actually, I didn't need it at all for the LVDS
> output on the A83t, the default seems to work just fine. Do you know
> what it's related to? Maybe we can make that a bit more dynamic?

There doesn't seem to be any rule to determine which frequency is best, except 
on H3. Obviously, it must be high enough to process data for current 
resolution, which means 150 MHz should be just enough for 1920x1080@60Hz. I 
guess we should just check BSP configuration and use same rate since AW 
engineers may know something we don't.

Best regards,
Jernej

> 
> Maxime
> 
> --
> Maxime Ripard, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


