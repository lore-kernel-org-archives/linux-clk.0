Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 4 Oct 2016 18:09:54 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>,
	vinod.koul@intel.com, wens@csie.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, lee.jones@linaro.org,
	mark.rutland@arm.com, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-sunxi@googlegroups.com, alexandre.belloni@free-electrons.com
Subject: Re: [PATCH 06/14] ASoC: Add sun8i digital audio codec
Message-ID: <20161004160954.GN5228@lukather>
References: <cover.1475569400.git.mylene.josserand@free-electrons.com>
 <85cbd9926e52d0aa03f6bbfd8794373d8db491e0.1475571575.git.mylene.josserand@free-electrons.com>
 <20161004144008.0d07d18c@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nLMor0SRtNCuLS/8"
In-Reply-To: <20161004144008.0d07d18c@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--nLMor0SRtNCuLS/8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 04, 2016 at 02:40:08PM +0200, Thomas Petazzoni wrote:
> > +	scodec->clk_apb =3D devm_clk_get(&pdev->dev, "apb");
> > +	if (IS_ERR(scodec->clk_apb)) {
> > +		dev_err(&pdev->dev, "Failed to get the apb clock\n");
> > +		return PTR_ERR(scodec->clk_apb);
> > +	}
> > +	if (clk_prepare_enable(scodec->clk_apb))
> > +		pr_err("err:open failed;\n");
>=20
> Ditto. + unprepare/disable the previous clock.

Ideally, that would be even not be part of the runtime_pm
hooks. Ideally, that would be great if that driver supports it.

We'll have to go through all the drivers to support it, that would be
one less to do (and ASoC makes it very easy, you can have a look at
the sun4i-i2s driver).

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nLMor0SRtNCuLS/8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX89RSAAoJEBx+YmzsjxAg5aIQAK9reOMYcu/CQkGi7fRGhg+f
1LC0a7AJP62iwuEsM7smH+aev2yOnFCFP5k83DELONU39WMMoC7e9zvwqoEKgbl4
3i72vx+fE2G7gsk5+QObH/ueZ/+vdUITBrIgZMYQ1H46/LbDhusP4iUHLBUvkkvN
Bcq3ZnCQPQ2hP2y7HqKBAL7xs2IV/Wj8/97lUWT9b/oraTweeticZinQjUUy/pou
4nl2pYSG6I+xNtm58lHF2emuyUCiGCuSkmoWCQPA3kmwaRiBBbeJf9DyJaOZ5zNb
VQjaKXYBAvgJIKn+MHmHoyvbLXuNc/dVE0qNjpPwlCkttSdSWhwzfSve6cvSr8R4
WciTYrDQ0TbRlsdyafFApGX0iE3FI1Jr+d5+VH0k5yOExHpLn9XUhXB0m8qJoeOf
ShLooMhjxMFHrEmBI8JOUk6BG2vZbpelRvc5irCDNkVnsBVpAU/0fvieWP1Uui/w
/azyEUCK43WTTFXCbriRHU9tDcGdvzbJVFiXXS+Oy4LlebBVh5kpr1U3qexeF2FX
YqcNH3kvM5KNDXbdG1kR1pyEB2TKr1ZPJhPksOIsMzYQKZR2l5m5tSHydJs9WG1v
5jAyxbT5DhWnT4OI/gJBTATUTIknG9CxNQOm79B1dLCTTm8u2Jop21lCUCykoEg2
jfn87G4ULjc8e8jor6mA
=4DSg
-----END PGP SIGNATURE-----

--nLMor0SRtNCuLS/8--
