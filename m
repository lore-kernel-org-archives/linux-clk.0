Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 4 May 2017 16:02:20 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 03/10] pinctrl: sunxi: add A20 support to A10 driver
Message-ID: <20170504140220.26kguf3trz7ocylv@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-4-icenowy@aosc.io>
MIME-Version: 1.0
In-Reply-To: <20170504135006.16483-4-icenowy@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8793449495943588641=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8793449495943588641==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ze3rfne35fxc5myi"
Content-Disposition: inline


--ze3rfne35fxc5myi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 09:49:59PM +0800, Icenowy Zheng wrote:
>  static const struct of_device_id sun4i_a10_pinctrl_match[] =3D {
> -	{ .compatible =3D "allwinner,sun4i-a10-pinctrl", },
> +	{
> +		.compatible =3D "allwinner,sun4i-a10-pinctrl",
> +		.data =3D (void *)PINCTRL_SUN4I_A10
> +	},
> +	{
> +		.compatible =3D "allwinner,sun7i-a20-pinctrl",
> +		.data =3D (void *)PINCTRL_SUN7I_A20
> +	},
>  	{}
>  };

This means you're going to have two drivers probing for the same
device: this driver, and the old one. This is not ok, and probably
introduces some corner cases.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ze3rfne35fxc5myi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZCzRoAAoJEBx+YmzsjxAgcocQAIJErF/Fef9K4YKH1ZJX6B7d
ZJ5MGMHpih7aPgiJyZZomw5ac6Z3/mFAKYq4CBLnSRELtOLI9/O4Sa4LKrGh3nTB
o/oC6ERcDcea3q+FRC2wb2j3eT4PlWqUFMVd7Rl8v5kApKxiTB684aCLg9yYGutw
zS/bSoK1HT3m5p7Ip8iiiVn3Xi/+85sIZVUJNSljDlzHEJ5jrM/952TrEWrL4x/G
2JtTtLeGZ3o+/svg93Qr/9B4s6lWFqgvRwY1QZtwAPJkefGOM+IUZN3hdhBjweg8
2ydAAgC1HOzfNHgH7n3AvhHPakW5U8m34Bl7FJGo1854somArW6pkfFnAZU9RT4g
qQBmSjpm/mi1riXtt/XxL2lw0vE9wE37dttTkUpVg2U/+wD4AUOil61+EqXt0Fmh
S1WAgKrmI2R0VMji7GvpRpovr1hOoLn0eAF55ChM5C/5eWZBkc4cKwN25JaJ+613
A0b9r2Fov7Q8pIzFgTIqQCrOFNZDFtA2o5nU36uF9YUADudvdHGrdOwrnSWOkbwz
Nm3rYevLeP8csnS80gHD1+wyrbosJv8by016gUx5fpm2YlzuVyMa02XDp15kITyf
xloxqbUxUqHUrVKRpplc+d5V9Nxg0GqLkLjo/XNU05FVIzaU+LhIrUv591o5d9sg
SZBiR4G3oSf3GXu92H2O
=qeiz
-----END PGP SIGNATURE-----

--ze3rfne35fxc5myi--


--===============8793449495943588641==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8793449495943588641==--
