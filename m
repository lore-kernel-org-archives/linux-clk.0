Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 21 Apr 2016 17:01:20 +0100
From: Mark Brown <broonie@kernel.org>
To: Wadim Egorov <w.egorov@phytec.de>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	rtc-linux@googlegroups.com, devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org, robh+dt@kernel.org,
	pawel.moll@arm.com, mark.rutland@arm.com,
	ijc+devicetree@hellion.org.uk, galak@codeaurora.org,
	mturquette@baylibre.com, sboyd@codeaurora.org,
	lee.jones@linaro.org, lgirdwood@gmail.com, a.zummo@towertech.it,
	alexandre.belloni@free-electrons.com, dianders@chromium.org,
	zyw@rock-chips.com
Message-ID: <20160421160120.GT3217@sirena.org.uk>
References: <1461244361-45686-1-git-send-email-w.egorov@phytec.de>
 <1461244361-45686-4-git-send-email-w.egorov@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="x735uyZ2C9eR7U1j"
In-Reply-To: <1461244361-45686-4-git-send-email-w.egorov@phytec.de>
Subject: Re: [PATCH v2 3/7] regulator: rk808: Migrate to regulator core's
 simplified DT parsing code
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--x735uyZ2C9eR7U1j
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Apr 21, 2016 at 03:12:37PM +0200, Wadim Egorov wrote:

> +static int rk808_set_suspend_voltage(struct regulator_dev *rdev, int uv)
> +{
> +	unsigned int reg;
> +	int sel = regulator_map_voltage_linear(rdev, uv, uv);
> +
> +	if (sel < 0)
> +		return -EINVAL;
> +
> +	reg = rdev->desc->vsel_reg + RK808_SLP_REG_OFFSET;
> +
> +	return regmap_update_bits(rdev->regmap, reg,
> +				  rdev->desc->vsel_mask,
> +				  sel);
> +}

This is fine but is adding a new feature and not part of the refactoring
that the changelog talked about so should be in a separate commit.

--x735uyZ2C9eR7U1j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJXGPlKAAoJECTWi3JdVIfQqxcH/3zHYCsco7Um+vuiC3Tx+h+S
6zDWfQtNVsxmf75m9fTYsY91t1ub/SNY8DGvEeCPRffvVHxLQBaaKyW0HcaBvdS3
h2LOaXlJlTE5o3SnA/RVC7qM5OEGLU94oxa5x+j03MUbqMtm4ngDCe0LzFdGsq4a
2kaUCx35X9Kdy6N2pHPGxF3A0v+gqSnQ35L/JfUqAy0KhjdN/y0G2pZpfuxhM6+U
jniv0nasEatBpB6KZPSDqwjOMsNB9kPpBixRtTHksfPjZgCC8NqNT1eGEyJq8eOZ
QWZr6Is7zpwT388PaDDfwdpd9K758Jv15EnXDb+IF0Zxz0Mp4Ds3hPEUKJBNbFE=
=tDQJ
-----END PGP SIGNATURE-----

--x735uyZ2C9eR7U1j--
