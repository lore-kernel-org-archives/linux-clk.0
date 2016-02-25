Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 25 Feb 2016 10:11:05 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>
Subject: Re: [PATCH] clk: sunxi: allow PLL6 clock to be reused
Message-ID: <20160225181105.GE4736@lukather>
References: <1456105198-25295-1-git-send-email-andre.przywara@arm.com>
 <CAGb2v66Fkvpqay+pNYjN1KP_KSUmv-du+PVSsyeuK+Y7bzEt+g@mail.gmail.com>
 <56CAD72D.7050102@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ryJZkp9/svQ58syV"
In-Reply-To: <56CAD72D.7050102@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--ryJZkp9/svQ58syV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 22, 2016 at 09:38:53AM +0000, Andre Przywara wrote:
> >> diff --git a/drivers/clk/sunxi/clk-factors.h b/drivers/clk/sunxi/clk-f=
actors.h
> >> index 1e63c5b..3a7da86 100644
> >> --- a/drivers/clk/sunxi/clk-factors.h
> >> +++ b/drivers/clk/sunxi/clk-factors.h
> >> @@ -36,6 +36,7 @@ struct factors_data {
> >>         void (*getter)(struct factors_request *req);
> >>         void (*recalc)(struct factors_request *req);
> >>         const char *name;
> >> +       int name_idx;
> >=20
> > I would drop the .name field. It was a bad workaround
> > due to limitations of the factors clk code at the time
> > by me. We really shouldn't hard-code the name if we want
> > to reuse the driver.
>=20
> I know what you mean (my first thought, too) and I totally agree, but we
> need it still for PLL5, which does not carry the original name in the DT
> output names.
> So at least this workaround here does not work, I guess we have to come
> up with something different - which would be a different patch.
> I can take a look into this later.

Actually, it could be easily worked around. Always take the first
clock output name, take whatever is before '_', and you can remove the
name field entirely.

Jens did something along these lines here:
http://lists.infradead.org/pipermail/linux-arm-kernel/2015-October/379900.h=
tml

Maybe we should simply rebase this patch, and remove the part that
falls back on the name field.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--ryJZkp9/svQ58syV
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWz0O5AAoJEBx+YmzsjxAggRwP/15RV0A71UuatBGYjE7BQDKj
pvYFJRfv6SCGp2gQ9lLPyFbS0vFKXzg7ej3lmy4SWIui49pPMDSIUUvSuv6yxuAm
P1ruFVH34HvE6EWITY9a3w8i6KbD7wU5Xy8oWYANzQGzWlFtEUqC41ssFZPmU/Sa
uKw0mlPijnfcC8aWBvYV1hXraqihxOR9OlAahVBzKWA+EGDC/Rf9q+haqA2iGPxY
0z9pV3wS9pHgqkyKzgjWh0g8M/nWPR4ubwX46s+aIzN9cRglJmoYwFyyU1aV60YN
yr2IkJK0ZIARUaFXEG6309wx42yW5CDOOcAsJoyDX5idvNWZ9Zsu3/hvRAZQEkUX
Mvcx/RzhMbUpUuNKLBCj/1Oq1wnppN2kON1FFR+pSj/YzFf7fRjpsI558VT10utn
zlrdthhC5QgEbUVMxRynoSZWO36/mKyrNI4AP8ocYwfd9enllhnJX7QSV/EbmpMZ
wd3T67BYsldfHxcIeS7P9/T4CNlIPa+lfivBGq2k5NYlAhDWQtXLRiAxuhPGmCk+
5z9brjF5y0kzuYIEqTr+Tlw7QazP9P6ANb0fus00vLyUpBPnTULFy99hfpZzysjT
mPdnxSYaJpNyltVSTXnZNHLQNAIGDFoDoIJu5Sc1uWVZh6qLnViDMu9hb5IcbmIh
BUkUBI5tSFnB3CaNSNyz
=gx4g
-----END PGP SIGNATURE-----

--ryJZkp9/svQ58syV--
