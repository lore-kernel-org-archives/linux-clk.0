Return-Path: <broonie@sirena.org.uk>
Date: Tue, 4 Oct 2016 12:32:31 +0200
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: vinod.koul@intel.com, maxime.ripard@free-electrons.com, wens@csie.org,
	mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com,
	perex@perex.cz, tiwai@suse.com, lee.jones@linaro.org,
	mark.rutland@arm.com, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-sunxi@googlegroups.com, thomas.petazzoni@free-electrons.com,
	alexandre.belloni@free-electrons.com
Message-ID: <20161004103231.hmi3pk2bz6epcg5h@sirena.org.uk>
References: <cover.1475571575.git.mylene.josserand@free-electrons.com>
 <06ea14939405c3eb0fb9be655d26ee564a04a53d.1475571575.git.mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bw762y3qiukiubf2"
In-Reply-To: <06ea14939405c3eb0fb9be655d26ee564a04a53d.1475571575.git.mylene.josserand@free-electrons.com>
Subject: Re: [PATCH 08/14] dt-bindings: sound: Add sun8i analog codec
 documentation
List-ID: <linux-clk.vger.kernel.org>


--bw762y3qiukiubf2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2016 at 11:46:21AM +0200, Myl=E8ne Josserand wrote:

> +* Allwinner A23/A33 Analog Codec
> +
> +This codec must be handled as a PRCM subnode.

What does this mean - how does one handle something as a "PRCM subnode"?

Please use subject lines matching the style for the subsystem.  This
makes it easier for people to identify relevant patches.

--bw762y3qiukiubf2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAABCAAGBQJX84U8AAoJECTWi3JdVIfQodwH/0sWJPgCadPLU/4aoJ44Li/J
O8DohFC4BSsTQ7OMzITg3KOc26bmEpcu787K7TCq4ZFWsnfUwxBKi640kx+wQRE9
Mx4cRi67cB7EuvERRMGc43Tx/pOvB3Vh1Rg5WcltlhqxBWx2aG5CQhzHL0Olnyr3
xPWAoeTGYyCtGn5/mGGCRi4DR6rkhaR6zOSvUO+2vKBYBJaBfLR1m2ovbJrkznP8
NEirRfrk74LokfxUdAKUZxQVRhSKege8NRzJPajmCS8oK72A3h2R5FFyL2/yBBMk
5oh99N1mj2fLNVpw6/WEJ9/81cOfx9Y6KUPKBFYXrER+5jY90DDe7PIzUErGjeg=
=lcJE
-----END PGP SIGNATURE-----

--bw762y3qiukiubf2--
