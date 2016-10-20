Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 20 Oct 2016 19:26:47 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-sunxi <linux-sunxi@googlegroups.com>,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v4 3/9] clk: sunxi-ng: Finish to convert to structures
 for arguments
Message-ID: <20161020172647.ngib3vf3dteoo4xn@lukather>
References: <cover.024e1b023e41efe548dc6a004f7a946408d5c9a2.1476196031.git-series.maxime.ripard@free-electrons.com>
 <67333887b86b7fd838dd9d6523dc7e3d9a9ddeb4.1476196031.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v67CWEEcC+AQ9MqsyKokTx2ZVXKqBSUFW_x7CfjHrL_JFA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bmdz3whixsrrvilf"
In-Reply-To: <CAGb2v67CWEEcC+AQ9MqsyKokTx2ZVXKqBSUFW_x7CfjHrL_JFA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--bmdz3whixsrrvilf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2016 at 10:35:18PM +0800, Chen-Yu Tsai wrote:
> On Tue, Oct 11, 2016 at 10:28 PM, Maxime Ripard
> <maxime.ripard@free-electrons.com> wrote:
> > Some clocks still use an explicit list of arguments, which make it a bit
> > more tedious to add new parameters.
> >
> > Convert those over to a structure pointer argument to add as many
> > arguments as possible without having to many noise in our patches, or a
> > very long list of arguments.
> >
> > Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
>=20
> Acked-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--bmdz3whixsrrvilf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYCP5XAAoJEBx+YmzsjxAgc6YP/i2k8GQYt4Fkhu1y2CK1LjZd
GrEwpOE9FfAikI4zi8v5H+T1nsqcTHXH6cIXfkF5Eg/D4AKhOb65Mud6TKdKa5RQ
PgVpVy0E6yC0q/LzHpcjSTiCXVRe5BAvlKu8jAvNUWIo5s1zE3Gzu2K690NXKdyt
sCqVQj6+Tgo+MFD3yM9WAV8Xa6NBGCYKBVf3rxMYqDNVkJXHP3OLP6efBg6gp2/7
9CzRbYD7bXzikLeF0GoDsUnNiPNzHNI0n/zYyfieiPrHHGnxGhr0pQbWsYA4+gkd
8wTERqVREC8RCm8+dUmhfrg9zFdi4LTjcZLIRfSC9AYID3IjSupbcoSOFtyl1giV
Vt3kaiH7t/t2I4+NJ3SD327/XlWIUjHplKhT3IpHhNaay8lGWEQC0hBjPFah8Z8g
t3tXEnyM9KTvRVYiJm2rocQBRirZr1m2/FwHGZPM+5vyiMotGXBuxa/stSwSF63N
ayGXEwXYR7A6kM1CGPqlFX5qS7EPJDbx9bk5BvTQgpgnT/fkLy+TY2UUbv6sUB1z
Dq4VS1H+5kwncBfVTfhBx3ESp0WzmLHf2uRuHpc5DVum2lwVoviNCGeWZ4Bq3dNT
OolfESS/efixbVDNTXK3fJ/MUEan/bff0n0XxFJjFevjw3Ghw36+k3pdVxkZCnAX
O21EmJxzXoBrtvKu0pRm
=fKC8
-----END PGP SIGNATURE-----

--bmdz3whixsrrvilf--
