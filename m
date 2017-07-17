Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 17 Jul 2017 11:14:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-mmc@vger.kernel.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 04/11] mmc: sunxi: Keep default timing phase settings for
 new timing mode
Message-ID: <20170717091444.7yd2rcx3qdx35rmf@flea>
References: <20170714064302.20383-1-wens@csie.org>
 <20170714064302.20383-5-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nhfrmnkkstzxktmp"
In-Reply-To: <20170714064302.20383-5-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--nhfrmnkkstzxktmp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2017 at 02:42:55PM +0800, Chen-Yu Tsai wrote:
> The register for the "new timing mode" also has bit fields for setting
> output and sample timing phases. According to comments in Allwinner's
> BSP kernel, the default values are good enough.
>=20
> Keep the default values already in the hardware when setting new timing
> mode, instead of overwriting the whole register.
>=20
> Fixes: 9a37e53e451e ("mmc: sunxi: Enable the new timings for the A64 MMC
> 		      controllers")
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--nhfrmnkkstzxktmp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZbIAEAAoJEBx+YmzsjxAgdRMP/1nMO7KkZEks6LKP/YUj7j2O
281pm4DHwCM7A/I5uzYez1SMky6CKoAzuYx77/uz9KZxLpX6rUOwxHCiSQl8+W86
l1R1lD/dLovOVepWF1qpEvB/dc2u2wk0cqwgwsEcVVlFJsSQoZ9V+0amLZ7sSpnH
J6pRJByrXvkG7jbp58gyVUUD5ifYIPruoobp3sUY/SFlPqsVWaC7VntuevFpe7M6
yY25VNK8S3WOPaY6tZtexvrBmRkJuuTCvtMNYy0/DX8wWqzB+Z3DepiQqs4mcoqi
kaRj9o19pUzrXUdf9hWzuPZ6DSGtgHAyAWiGX0NZpFY6CSJRQ7IEIDYmTv3GtWjx
TNQ9mC3NE+NNSaZEJD2S3knvXKqzb+/wjB3rZmKU5x/UmMewvM7BM0Rl7eW4U9se
3EC+8iGVwcW72h3/iW8QppCj0TGlDQFrhXRnkSmOlVJO2L5ttdBcLBYWnb6Hgbhw
FCvjGlHzDadPPx0PQX/CdlXCzA8JhwmcG+Zt6Iq5jmiwMiuu6EKrWtqv3C7P3WnG
Wk+sb1dYudjFzqrUs2x53a0vt2tIpkz8N9AEiS1QuH18jmoM/bkA8SXlio1lrTEU
d7oPxJCZKetMWjrpm5xDgQSgIS8Hrl8Hcn3dN7tmJRyuRyx3GKrZ4aLvEmjM6xBx
g/7fxpKQfOgn/YcBri4a
=PpY+
-----END PGP SIGNATURE-----

--nhfrmnkkstzxktmp--
