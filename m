Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 25 Jul 2017 09:33:11 +0200
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
Subject: Re: [PATCH v3 03/10] clk: sunxi-ng: a83t: Support new timing mode
 for mmc2 clock
Message-ID: <20170725073311.kyfsvf4xzrzlhgp5@flea>
References: <20170724135905.28855-1-wens@csie.org>
 <20170724135905.28855-4-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="jhwtdsaj52mmq6xp"
In-Reply-To: <20170724135905.28855-4-wens@csie.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--jhwtdsaj52mmq6xp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 24, 2017 at 09:58:58PM +0800, Chen-Yu Tsai wrote:
> The MMC2 clock supports a new timing mode. When the new mode is active,
> the output clock rate is halved.
>=20
> This patch sets the feature flag for the new timing mode, and adds
> a pre-divider based on the mode bit.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--jhwtdsaj52mmq6xp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZdvQ3AAoJEBx+YmzsjxAgSRsP/i58L7bXSeRMcVtdTWlRadeP
2gmbj5YxbPEQohN41+g5y2bMpd7ntFBICvJ4WUupDeACJTnfdr2N8RjGU69lQcTZ
wkFmxixdq4/KRZTFgLqMa8XaLkfH6xCgHTGMHpn9dB3IZNt3Nnxesa3pXLEPyKa8
lNX9PQJ8Kfftw5/K4nLOkZb3x/11netZ0ocL3WmSRKsIg7bmE76Dfui2PrIuEx3T
btdIvY+HMSEcifE3aOr+NzE9rpQo+rwD0W26Vr6nIccm8FeNXRe7PoavO81zqYJ2
UXfoZfWizSES/3Y5AsqUp2gFhaEkrLr/jfARyfCZKsqsjK8Any+X4Ozr9zKBa0P1
qp4stTgM97/ytoco0TAkG4AnZ3rPS7H+4uLh833XRpsBB5tkbimmBrqBg3F1VNk0
9FxhX1hN8DkELO/QiJNSxzdoBPFSBoSz/aQo0U6p+fGX0y9tX/+cR7aENnlO/9FJ
lJnRk0YRgiJKIjUZq53fHyHCdFJ5PBkVXaIzQjwEtuEmI5yWQs6SfoIkdeQWcsNQ
IhZwE4Hlg4YS16OhOCuLcRK5vEi+NmpGndlZ7eHJD8xsan36AMPpfZCpZFJo8Wl5
a3S0Aq4Kcf53rIFJBNWTtCRjl4Wl2vj/s/GsY26Dk/ZMvTc5rzVB6GQxqrhbmAQ+
VDtW1YKj7/hvLEyEMYmr
=5tOX
-----END PGP SIGNATURE-----

--jhwtdsaj52mmq6xp--
