Return-Path: <broonie@sirena.org.uk>
Date: Fri, 7 Jul 2017 13:44:32 +0100
From: Mark Brown <broonie@kernel.org>
To: Quentin Schulz <quentin.schulz@free-electrons.com>
Cc: mturquette@baylibre.com, sboyd@codeaurora.org, robh+dt@kernel.org,
	mark.rutland@arm.com, lgirdwood@gmail.com,
	nicolas.ferre@microchip.com, alexandre.belloni@free-electrons.com,
	linux@armlinux.org.uk, boris.brezillon@free-electrons.com,
	perex@perex.cz, tiwai@suse.com, cyrille.pitchen@wedev4u.fr,
	thomas.petazzoni@free-electrons.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org
Message-ID: <20170707124432.b5h2ugtxsz3zqysx@sirena.org.uk>
References: <20170704115927.32662-1-quentin.schulz@free-electrons.com>
 <20170704115927.32662-9-quentin.schulz@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="exdyu7fmnfly6tbs"
In-Reply-To: <20170704115927.32662-9-quentin.schulz@free-electrons.com>
Subject: Re: [PATCH v2 8/9] ASoC: atmel-classd: remove aclk clock
List-ID: <linux-clk.vger.kernel.org>


--exdyu7fmnfly6tbs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 04, 2017 at 01:59:26PM +0200, Quentin Schulz wrote:
> Since gclk (generated-clk) is now able to determine the rate of the
> audio_pll, there is no need for classd to have a direct phandle to the
> audio_pll while already having a phandle to gclk.

Acked-by: Mark Brown <broonie@kernel.org>

--exdyu7fmnfly6tbs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAllfgi8ACgkQJNaLcl1U
h9DzAQf/dC3hmT2cJGuO5WN2WUEdJi8i15jUGACz08lH+qnyfGQ2vIaHDa7Gk2Ro
kZLHscJuR5tzN5xi16pUGAH2klyPaOQdVpNVXv+wzxvOsVKxsB0woKIVaFo/DhmM
y8HfO6l6J09CReewm4Ij2LzXNJy+gz9lh4GYzfWnqtqjPcns1KBEmYhmAZtvX8lh
/7Q6oZ9yeBJY3xWORvD8zv/vxof39ZbdXpRd1zb/7HYDQYnhoJlRPkn/1KtyWmAG
1lJ1+r6Ao1DEYdfwDB3jvxdtdg8zD7H0ggRyPw9fpcwSzfBUEIzFr/7Y3hrlNfus
nTT5B70tS9bBhc1bZ89tgaHoWT4yWQ==
=4O/E
-----END PGP SIGNATURE-----

--exdyu7fmnfly6tbs--
