Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 7 Nov 2016 08:56:03 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Jorik Jonker <jorik@kippendief.biz>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 2/2] clk: sunxi-ng: fix up PLL_CPUX adjusting for A23/A33
Message-ID: <20161107075603.zad2kgzvh5lr7zeh@lukather>
References: <20161106172932.39478-1-icenowy@aosc.xyz>
 <20161106172932.39478-2-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="angc55eusjv7x2mw"
In-Reply-To: <20161106172932.39478-2-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>


--angc55eusjv7x2mw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Same remark for the commit title.

On Mon, Nov 07, 2016 at 01:29:32AM +0800, Icenowy Zheng wrote:
> When adjusting PLL_CPUX on A23/A33, the PLL is driven too high, and the
> system stucks.
>=20
> Add a notifier to avoid this situation.
>=20
> The code is ported from ccu-sun6i-a31.c.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Patch 4.9-rc too.
>  drivers/clk/sunxi-ng/ccu-sun8i-a23.c | 10 ++++++++++

Have you checked that it was also needed on A23? Not all SoCs are in
this situation.

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--angc55eusjv7x2mw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIDOTAAoJEBx+YmzsjxAgCrQP/iiUI8BNi0IPlajRev5VcUpT
oKBPgvykq1ulAHQuQq14uRfsgkG+i2QjACU4t8xqTvd7/rKPjgGIqf2kHfZsSC1q
6NYhVx2PZaBy0S4vWl3Hpx272TZjKwaqVTQMOeBG/Yf0CzHCSTJf8mPOGzj5u9R7
5E5EWxy2COhox1tSV119tvsbAM6wNSu3E40pbZpisvAGNbs4S0oN+qsQ0n4LFvk0
B2FvXCIzUnuCya00mEUKk9+DmJqyhPlSWrJezoELPOIq08fHWSRBk7pUiLOKlhBB
k9fjC+tvpKV0iNu1M48zQA3siJpZf+7nA2izV86quMdwJ2gicQKiwHToSjclNhh9
EMpgvKrb9SYYXsegedBYhe50LDY8WHPlxR53B2EnntCxKkB9fEY0YsOmOKOTJb/Q
RyTcJXI9J7AYUd1DLwe6XR8g2+n9ohzRYTqU/xT71O3vv4Wc8S2YJkkrUCiGqgBQ
rwzuY0LB5pwEmu1tI2L3zIPSsqKnD6JayituZS4jlv720S3PkTuLpDK6/VDXFOM8
TzNErG6Lfr1OhTL/xHXETCE1tR9fFTPmcUVfLlor0PbYY18ND0nYNWB7Oq9TcRmg
6Uxn1fCMDyvr9DIQCRnKgjlK5O7ZDKc42FKiP203onahkZz7peaQzx2urxdnIndB
RxRlDCYfCNcEtJSQ1hYH
=aT1+
-----END PGP SIGNATURE-----

--angc55eusjv7x2mw--
