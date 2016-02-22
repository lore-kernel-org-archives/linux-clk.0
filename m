Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 21 Feb 2016 19:45:17 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Emilio Lopez <emilio@elopez.com.ar>,
	Michael Turquette <mturquette@baylibre.com>,
	Chen-Yu Tsai <wens@csie.org>, Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] clk: sunxi: error checking on clock setup
Message-ID: <20160222034517.GH19169@lukather>
References: <1455619568-1906-1-git-send-email-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="NzX0AQGjRQPusK/O"
In-Reply-To: <1455619568-1906-1-git-send-email-andre.przywara@arm.com>
List-ID: <linux-clk.vger.kernel.org>


--NzX0AQGjRQPusK/O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Feb 16, 2016 at 10:46:05AM +0000, Andre Przywara wrote:
> Setting up the clocks properly is quite critical to the system's
> operation, but currently our error handling is not very verbose.
> This series adds error handling and reporting to the sunxi clocks,
> so that any errors are correctly detected and reported. Also previous
> actions are rolled back in case something went wrong.
> This proves to be helpful in debugging clock tree issues,
> especially when adding support for new SoCs.
> I tested this on a BananaPi by deliberately misspelling
> "clock-output-names". The resulting kernel crash in
> sun4i_timer_interrupt is totally misleading, but now there is a line
> in the dmesg before saying:
> =3D=3D=3D=3D=3D=3D=3D
> sunxi_divider_clk_setup: could not read clock-output-names for "apb0"
> =3D=3D=3D=3D=3D=3D=3D
>=20
> This applies on top of Maxime's sunxi/for-next branch.

Applied all three, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--NzX0AQGjRQPusK/O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWyoRNAAoJEBx+YmzsjxAg/kYQAKlF/mKB+9NHj8y1ajwkQdV/
3hTEnCyKVHgKO9jfMfb13XGMA6jbqM4pCY+U/D65FQCqGhvV3l12PQ4XubOLoq2t
VqO7UGXVVLY5gLtNtBtxZkNhI7ejj8W7hX3C5CULn00jDn3n+rAtN5EKCYI0hbJS
i3W57y3nC+yWRz6aW1bdHqhjcRFB3OxdgD7kqD7axrIcOkxdpJUkqk9S6b9BNEx+
fPX2vCQ9JRt3bnnL7iCw8VbXMl0NsWL7Cv2c30E9Fowg29QRidPhtoaftCAoiKHN
lOpShG0j7hHA59GbElqm09c+xl0eEnk4RzDAk5XsV8f3HGEoeAj8T8DfNMArDuSS
QsJJv8QfAfkUgVLKkjG3ALyhFVaalAH0smt3h+cEHWOmCydUrM8aNxpyDSvDf4F0
+Gpw/IPpd2ltBrBqmj7DvLFCe7euhKwwGS97+R9gE2PpIMvFXAA+PAgT+0tOfWS4
pTOxg+CMtZmPB15AddmJuTOjC6Ies3RV0XDDh/lqmj8RKM01wdJsalAw05O8W3dP
6O4AY8BaMJdfh+IRnZMar8esIQgBz1Rvuu+CAbN+2kdu7wFBd3FZv5b9uld0Aiqf
AwONbqL8FCczIpbgINpk0FHTKCTPy9bAasNpWKwAPUM1ZPfTAOBvqzODTF5eC+wd
KPWy0fXRF+H/TZWoUZtT
=nEIM
-----END PGP SIGNATURE-----

--NzX0AQGjRQPusK/O--
