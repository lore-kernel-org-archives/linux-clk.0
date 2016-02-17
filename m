Return-Path: <ricard.wanderlof@axis.com>
Date: Wed, 17 Feb 2016 15:18:57 +0100
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Mark Brown <broonie@kernel.org>
CC: Peter Ujfalusi <peter.ujfalusi@ti.com>, alsa-devel
	<alsa-devel@alsa-project.org>, Stephen Boyd <sboyd@codeaurora.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jyri Sarha
	<jsarha@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, "Kristo,  Tero"
	<t-kristo@ti.com>, <linux-clk@vger.kernel.org>, Michael Turquette
	<mturquette@baylibre.com>
Subject: Re: [alsa-devel] [PATCH 4/4] ASoC: simple-card: Support for	selecting
 system clocks by ID
In-Reply-To: <20160216191346.2278.725@quark.deferred.io>
Message-ID: <alpine.DEB.2.02.1602171516260.10339@lnxricardw1.se.axis.com>
References: <1455545495-20292-1-git-send-email-peter.ujfalusi@ti.com> <1455545495-20292-5-git-send-email-peter.ujfalusi@ti.com> <20160215152635.GN18988@sirena.org.uk> <56C2F00C.8080809@ti.com> <20160216134233.GN18327@sirena.org.uk>
 <20160216191346.2278.725@quark.deferred.io>
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-15"
List-ID: <linux-clk.vger.kernel.org>


Quoting Mark Brown (2016-02-16 05:42:33)
> On Tue, Feb 16, 2016 at 11:46:52AM +0200, Peter Ujfalusi wrote:
> 
> > As for codecs, tlv320aic3106 is also pretty simple device from the outside, it
> > can receive it's reference clock via:
> > MCLK pin, GPIO2 pin or it can use the BCLK from the bus. Based on the incoming
> > frequency it can use it directly or it needs to use the internal PLL to
> > generate the cocks.
> > It can output generated clock via GPIO1
> 
> That already sounds like there is room for configuration and hooking
> into a wider clock tree - we've got three different source options and
> an output plus a PLL that can presumably take in non-audio rates.

It makes sense to use an already existing clock framework, but I'm 
wondering, how do we model the clock select function? Using a clock mux? 
Somewhere, somehow, something needs to look at the setup and decide which 
pin on the codec should be the clock source (e.g. MCLK, GPIO2, or BCLK in 
the case of the tlv320aic3106).

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
