Return-Path: <jernej.skrabec@siol.net>
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@siol.net>
To: Maxime Ripard <maxime.ripard@free-electrons.com>
Cc: airlied@linux.ie, robh+dt@kernel.org, mark.rutland@arm.com, wens@csie.org, architt@codeaurora.org, a.hajda@samsung.com, Laurent.pinchart@ideasonboard.com, mturquette@baylibre.com, sboyd@codeaurora.org, Jose.Abreu@synopsys.com, narmstrong@baylibre.com, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 02/12] clk: sunxi-ng: Change formula for NKMP PLLs
Date: Thu, 18 Jan 2018 17:17:45 +0100
Message-ID: <4724479.MCcHYbe7Bl@jernej-laptop>
In-Reply-To: <20180118105841.73rwj3he2exd7pno@flea.lan>
References: <20180117201421.25954-1-jernej.skrabec@siol.net> <20180117201421.25954-3-jernej.skrabec@siol.net> <20180118105841.73rwj3he2exd7pno@flea.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi,

Dne =C4=8Detrtek, 18. januar 2018 ob 11:58:41 CET je Maxime Ripard napisal(=
a):
> Hi,
>=20
> On Wed, Jan 17, 2018 at 09:14:11PM +0100, Jernej Skrabec wrote:
> > This commit changes formula from this:
> >=20
> > Freq =3D (parent_freq * N * K) / (M * P)
> >=20
> > to this:
> >=20
> > Freq =3D (parent_freq / M) * N * K / P
> >=20
> > This improves situation when N is in the range 1-255. PLL parent clock
> > is almost always 24 MHz, which means that for N >=3D 180 original formu=
la
> > overflows and result becomes useless. Situation can be improved if M is
> > used as predivider as it can be seen in the second formula. That way at
> > least M > 1 is considered, but it still leaves small gap for wrong resu=
lt
> > when M =3D 1 and N >=3D 180.
> >=20
> > Using M as predivider shouldn't cause any issue, because it is in range
> > 1-4 at most, so there is no or only minimal rounding error.
> >=20
> > Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>
>=20
> I'd really prefer to stick to the formula documented and that we've
> used so far. NKMP clocks are most notably used for the CPU PLLs and
> I've debugged way too many cpufreq bugs already :)
>=20
> What about using long long types for the parent * n * k result?

Yes, using long long is the best possible solution and covers all cases=20
whereas this patch does not.

I thought that do_div() would cause a lot of overhead, but I noticed that i=
t's=20
not big if both numbers fit in 32 bit, which in our case is true most of th=
e=20
time.

I will make a helper function for calculating rate, since using long long=20
needs more than one line of code.

Best regards,
Jernej
