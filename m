Return-Path: <moinejf@free.fr>
Date: Tue, 2 Feb 2016 20:02:21 +0100
From: Jean-Francois Moine <moinejf@free.fr>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Dave Airlie <airlied@linux.ie>, Chen-Yu Tsai <wens@csie.org>, Emilio
 =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] drm: sunxi: Add a basic DRM driver for Allwinner
 DE2
Message-Id: <20160202200221.514518980dcd1a75c262355f@free.fr>
In-Reply-To: <56B0E6B5.5040708@arm.com>
References: <cover.1452876522.git.moinejf@free.fr>
	<4c40052b27f74df1342e631cb0f9ed5993861a54.1452876522.git.moinejf@free.fr>
	<569F6C1E.8000006@arm.com>
	<20160202181949.d59e84a040a980abcdd69d32@free.fr>
	<56B0E6B5.5040708@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2 Feb 2016 17:26:13 +0000
Andre Przywara <andre.przywara@arm.com> wrote:

> Can you sketch (or point me to) what I need to do? Just a
> simple-framebuffer DT node?
> I take it that the driver does not depend on any kind of U-Boot
> initialisation, but instead takes care of this itself?
>=20
> And would this pave the way for fbturbo also?

In my site (http://moinejf.free.fr/opi2/), you may find:
- the HDMI driver - to be built out of tree
- the DT files (sun8i-h3.dtsi and sun8i-h3-orangepi-plus.dts)
  which should be close enough to the A64
- my .config (config-4.5.txt)

The driver has no video overlay and no acceleration.
The frame buffer (console) works (with a blinking cursor!).
X11 works fine with the standard modesetting driver (default).

There is just a problem with the HDMI driver.
For unknown reason, sometimes, the EDID cannot be read (timeout -
this problem also exists with the kernel 3.4).
The remedy is power off / power on (of the board, not of the screen!).

I am using the u-boot from Allwinner. This one activates the video
engine, but everything is reset at kernel start time.

About the GPU/VPU, I have no need of them, so I will let this job to
specialists and, instead, have a look at audio...

--=20
Ken ar c'henta=F1	|	      ** Breizh ha Linux atav! **
Jef		|		http://moinejf.free.fr/
