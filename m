Return-Path: <jdelvare@suse.de>
Date: Tue, 10 Jan 2017 13:03:00 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Andreas =?UTF-8?B?RsOkcmJlcg==?= <afaerber@suse.de>
Cc: linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, James Liao <jamesjj.liao@mediatek.com>,
 Erin Lo <erin.lo@mediatek.com>, Stephen Boyd <sboyd@codeaurora.org>, Shunli
 Wang <shunli.wang@mediatek.com>, Michael Turquette
 <mturquette@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: Fix MT2701 dependencies
Message-ID: <20170110130300.167d215b@endymion>
In-Reply-To: <c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
References: <20170109113621.31d384c9@endymion>
	<c3da261a-eb85-9b30-d5e2-05863d2efad2@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On Mon, 9 Jan 2017 21:08:50 +0100, Andreas F=C3=A4rber wrote:
> Hi Jean,
>=20
> Am 09.01.2017 um 11:36 schrieb Jean Delvare:
> > If I say "no" to "Clock driver for Mediatek MT2701", I don't want to
> > be asked individually about each sub-driver. No means no.
> >=20
> > Additionally, this driver shouldn't be proposed at all on non-mediatek
> > builds, unless build-testing.
> >=20
> > Signed-off-by: Jean Delvare <jdelvare@suse.de>
> > Fixes: e9862118272a ("clk: mediatek: Add MT2701 clock support")
> > Cc: Shunli Wang <shunli.wang@mediatek.com>
> > Cc: James Liao <jamesjj.liao@mediatek.com>
> > Cc: Erin Lo <erin.lo@mediatek.com>
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: Michael Turquette <mturquette@baylibre.com>
> > Cc: Matthias Brugger <matthias.bgg@gmail.com>
> > ---
> [...]
> > As another side note, I wonder why so many clock drivers have
> > "COMMON" in their symbol names. Looks wrong to me.
>=20
> It refers to the Common Clock Framework:
> https://www.kernel.org/doc/Documentation/clk.txt

OK, thanks for the explanation. Still seems overkill to me to prefix
everything with COMMON_CLK when the drivers live under drivers/clk, but
oh well :-)

> > --- linux-4.10-rc2.orig/drivers/clk/mediatek/Kconfig	2017-01-01 23:31:5=
3.000000000 +0100
> > +++ linux-4.10-rc2/drivers/clk/mediatek/Kconfig	2017-01-09 11:17:37.542=
344083 +0100
> > @@ -8,6 +8,7 @@ config COMMON_CLK_MEDIATEK
> > =20
> >  config COMMON_CLK_MT2701
> >  	bool "Clock driver for Mediatek MT2701"
> > +	depends on ARCH_MEDIATEK || COMPILE_TEST
> >  	select COMMON_CLK_MEDIATEK
> >  	default ARCH_MEDIATEK
>=20
> Should the default then become y for simplicity?

I left it as is as it is the same already done in other drivers in the
same directory. I agree "default y" would do the same in practice.

> Another aspect here is that this is a 32-bit SoC but it propagates into
> the arm64 configs, so maybe (ARCH_MEDIATEK && !ARM64) || COMPILE_TEST?
>=20
> Same for mt2701 pinctrl.
>=20
> http://kernel.opensuse.org/cgit/kernel-source/plain/config/arm64/default?=
id=3Dff90e915117c5d7a8bb00dc0bc1d3145ebe985ec

Actually I thought the driver was needed primarily on arm64 because of
this configuration file. If that's not the case then I can resubmit
with the suggested change, no problem.

What about MT8135 and MT8173, are they 32-bit SoCs as well?

> (...)
> Anyway, a step forward,
>=20
> Reviewed-by: Andreas F=C3=A4rber <afaerber@suse.de>

Thanks for the review.

--=20
Jean Delvare
SUSE L3 Support
