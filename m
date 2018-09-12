Return-Path: <wens213@gmail.com>
Return-Path: <wens213@gmail.com>
MIME-Version: 1.0
References: <20180902072643.4917-1-jernej.skrabec@siol.net>
 <20180902072643.4917-3-jernej.skrabec@siol.net> <CAGb2v65y1W=52SAFFqyCOnHd80nx+oPHUDeysHWBy7o8_g=eeQ@mail.gmail.com>
 <9915D9F1-1C60-4AEF-9074-CE040FCD7BF0@aosc.io>
In-Reply-To: <9915D9F1-1C60-4AEF-9074-CE040FCD7BF0@aosc.io>
From: Chen-Yu Tsai <wens@csie.org>
Date: Wed, 12 Sep 2018 22:49:12 +0800
Message-ID: <CAGb2v64t40yTbrnkg33N2=jBdnvV45H1XSCF8U230LGAyuVySw@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH 02/27] arm64: allwinner: h6: add system
 controller device tree node
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, Rob Herring <robh+dt@kernel.org>,
	Maxime Ripard <maxime.ripard@bootlin.com>, Mark Rutland <mark.rutland@arm.com>,
	Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@linux.ie>, Archit Taneja <architt@codeaurora.org>,
	Andrzej Hajda <a.hajda@samsung.com>, devicetree <devicetree@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>, linux-clk <linux-clk@vger.kernel.org>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Tue, Sep 4, 2018 at 4:44 PM Icenowy Zheng <icenowy@aosc.io> wrote:
>
>
>
> =E4=BA=8E 2018=E5=B9=B49=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=884=
:40:56, Chen-Yu Tsai <wens@csie.org> =E5=86=99=E5=88=B0:
> >On Sun, Sep 2, 2018 at 3:27 PM Jernej Skrabec <jernej.skrabec@siol.net>
> >wrote:
> >>
> >> From: Icenowy Zheng <icenowy@aosc.io>
> >>
> >> As we have already binding for the H6 system controller, add its node
> >> to the device tree.
> >>
> >> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> >> [fixed compatible string]
> >> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
> >
> >Reviewed-by: Chen-Yu Tsai <wens@csie.org>
>
> By the way can these patches be applied first? (patches
> related to syscon).
>
> They're also needed for EMAC.

Applied.

BTW, the H6 system control EMAC register also has the internal PHY
related controls seen on H3/H5. IIRC you previously mentioned that
they have no effect?

ChenYu
