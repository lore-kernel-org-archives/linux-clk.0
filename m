Return-Path: <broonie@sirena.org.uk>
Date: Wed, 27 Apr 2016 17:57:07 +0100
From: Mark Brown <broonie@kernel.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, lee.jones@linaro.org,
	robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	mturquette@baylibre.com, sboyd@codeaurora.org, lgirdwood@gmail.com,
	a.zummo@towertech.it, alexandre.belloni@free-electrons.com,
	dianders@chromium.org, zyw@rock-chips.com
Message-ID: <20160427165707.GH3217@sirena.org.uk>
References: <1461682450-22173-1-git-send-email-w.egorov@phytec.de>
 <1461682450-22173-3-git-send-email-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bTTI3rp5igVUz0aj"
In-Reply-To: <1461682450-22173-3-git-send-email-w.egorov@phytec.de>
Subject: Re: [PATCH v4 2/7] regulator: rk808: Migrate to regulator core's
 simplified DT parsing code
List-ID: <linux-clk.vger.kernel.org>


--bTTI3rp5igVUz0aj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 26, 2016 at 04:54:05PM +0200, Wadim Egorov wrote:
> A common simplified DT parsing code for regulators was introduced in
> commit a0c7b164ad11 ("regulator: of: Provide simplified DT parsing
> method")

Acked-by: Mark Brown <broonie@kernel.org>


--bTTI3rp5igVUz0aj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXIO9jAAoJECTWi3JdVIfQaS4H/3PrjVpssZwNq60JvPllMf5F
Q/RxqhBYC82obh9ORIV0YTkmLa459p/iWzp3umzbtYVrhfkj1LWM1wcyQ66R7H8L
ma1Gf7riiKz+7xonXuFrrlpNT+0NsLAhBTLwVF8QXnWbYgYDMIkp+L0+MZ2VBO5P
CQcGmVFyaeNjbvzQviJZ7nI+uHRzhyZDUQvlVPg0mweQjdxEoLTAYYMY6VyCf8xZ
2wBsCdeDmUTXCfIxng3+/s6eAfmDy7e7Vue0HdXgacrpozkaa9FFWJq7R9vBFFDF
pCvyQUVA3uigLhUo9FpSErp7SlGaXte7OSfx5fv7YIMZFsK00lER/uBAv74A0Z0=
=/aTg
-----END PGP SIGNATURE-----

--bTTI3rp5igVUz0aj--
