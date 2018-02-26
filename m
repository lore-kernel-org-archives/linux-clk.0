Return-Path: <jernej.skrabec@siol.net>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime.ripard@bootlin.com>
Cc: wens@csie.org, airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, mturquette@baylibre.com, sboyd@kernel.org, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 01/15] clk: sunxi-ng: Add check for minimal rate to NM PLLs
Date: Mon, 26 Feb 2018 17:17:41 +0100
Message-ID: <2662255.10CUWtpM2s@jernej-laptop>
In-Reply-To: <20180226093800.uwbo54wrdcwmsyzh@flea.lan>
References: <20180224214545.3740-1-jernej.skrabec@siol.net> <20180224214545.3740-2-jernej.skrabec@siol.net> <20180226093800.uwbo54wrdcwmsyzh@flea.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
List-ID: <linux-clk.vger.kernel.org>

Hi,

Dne ponedeljek, 26. februar 2018 ob 10:38:00 CET je Maxime Ripard napisal(a):
> Hi,
> 
> On Sat, Feb 24, 2018 at 10:45:31PM +0100, Jernej Skrabec wrote:
> > Some NM PLLs doesn't work well when their output clock rate is set below
> > certain rate.
> > 
> > Add support for that constrain.
> 
> In such a case, you should round the rate to the minimum the clock can
> operate at, and not return an error.

OK.

Best regards,
Jernej
