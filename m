Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 11:20:45 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH 05/11] mmc: sunxi: Support controllers that can use both
 old and new timings
Message-ID: <20170717092045.3hidokuo6w7cgorw@flea>
References: <20170714064302.20383-1-wens@csie.org>
 <20170714064302.20383-6-wens@csie.org>
 <CAPDyKFoLTXJ10EJRfPPggJBg8bh9BpdwTnew-WL0G7LpnO43Pg@mail.gmail.com>
 <CAGb2v64gjLSdb83fR9OCZthtgMQz-UkmMhT9OmJkq3Xp6mJ-aA@mail.gmail.com>
 <CAPDyKFqe1hFmfWziu04fW=cQa0EGvT11YzuJ0f-eHy6+u7vutQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="4ehpzjnyhte6weth"
In-Reply-To: <CAPDyKFqe1hFmfWziu04fW=cQa0EGvT11YzuJ0f-eHy6+u7vutQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--4ehpzjnyhte6weth
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 11:57:35AM +0200, Ulf Hansson wrote:
> >>> +       if (host->use_new_timings) {
> >>> +               ret =3D sunxi_ccu_set_mmc_timing_mode(host->clk_mmc, =
true);
> >>
> >> Can't this be solved through some other generic API/interface?
> >
> > The old discussion is here: https://lkml.org/lkml/2017/5/5/77
> >
> > It is possible to piggy back on existing API, but as Maxime mentioned
> > back in the discussion, it is confusing.
> >
> > IIRC Mike said (via Maxime) an SoC specific call was the easy way
> > to handle this. I don't think there's anything generic about this.
> > Even if you could have a _set_mode callback for the clks, the modes
> > would be SoC specific anyway.
>=20
> Right. But it would benefit that we can keep drivers generic, as they
> are using generic APIs/interfaces. I prefer that.
>=20
> Anyway, let me try to dig up the earlier discussion.

There's really not any generic way to support that. Even if we reuse
some other function (clk_set_phase/clk_get_phase was suggested), and
use error codes and / or values to differentiate between two modes,
this will be very much implementation-specific as well, and any other
SoC that in theory would be using that will very likely to not
implement the same behaviour for its clocks.

And this driver is only used on one SoC family, so it's not really a
big deal anyway.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4ehpzjnyhte6weth
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbIFtAAoJEBx+YmzsjxAg4DoP/3A2zAdfpPwRKRni8/xIZXeT
rxKBN8LAPCm2gW85Ufk3mY54BiAUFu+8FhR6eYtlo4LVr8fTNIFGN0fYHYVfQtW+
sP8LVKDXeDpvs5v5oRduaQQclgziR8+4FwhrRe4C6mHim1s3U0HMwlxQOCw9azWk
/Kq3q+Tc0LJqVChvJmuTqcdD+VgNAkJRkjWO3kmRnnatLTYoao1VJxa01iIoqU7j
3j4GGYUCfrIouecm/2UDOMi0hLjnD/IWKKCRmSUcN2tMWzdd6N2vsrrLviIXQ4td
4YSUUBzp8wcIMD4up3/wTQCUwci/S2X8uJQqDa3GO22ItrDCV6//MkqNm5xllFSK
Q32qRmfNyEJ3T+M1PHUKgufmipIvXCI2Q1RYVpGc6BpODygqOkvXSFagHBitaif6
vjeJAPjkteHSQ6Y2Z2U66f9PHwgPxryFQA2lHe3pFg3uBEfVER7gsLx4O2lZf0OU
k3sQ5HWZUxGk/tUcXV67Z4YVDWtHSXpjWpYSja4uqWjVf2fg/IWGeUTi8lhEfUXt
GPro/dRlGwm/imCN1cPtahlzeR0iqnLBPbvq8+7em1v31JT26S7YODHFxP0T5SiV
CR/q/pMe20dqqOhsz4KGAEjKo+g3hR4WdAoXtjUdzhHK27ztTS0020XIJGNWS+tO
qYMLM/JqKj2kbluwuAZ3
=MAT0
-----END PGP SIGNATURE-----

--4ehpzjnyhte6weth--
