Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 13 Dec 2016 16:44:51 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	Hans de Goede <hdegoede@redhat.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/6] clk: sunxi-ng: set the parent rate when adjustin
 CPUX clock on A33
Message-ID: <20161213154451.y4wcrqhtcc5sqli7@lukather>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-3-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="hu75rc2qyp55un53"
In-Reply-To: <20161213152252.53749-3-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>


--hu75rc2qyp55un53
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 11:22:48PM +0800, Icenowy Zheng wrote:
> The CPUX clock on A33, which is for the Cortex-A7 cores, is designed to
> be changeable by changing the rate of PLL_CPUX.
>=20
> Add CLK_SET_RATE_PARENT flag to this clock.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--hu75rc2qyp55un53
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUBdzAAoJEBx+YmzsjxAg39gP/jCLHnY4aXMESlxWDRK2cluJ
XaNYBo+/bQUqzxy4dV8WYrUcB/IOaSa+/tu5c9g6DAiJeKsP4wzS+RuPhWMUFPd0
b1sOJM5HXXhF7AJioFBwVqQK6oRF7ThImwLjlNPH1d6OkND35AaNKBrdmlPLx5zE
RYyGcLQtgNEK/mkLW+HtHN+CJ0NNhJuU/jv9bFoL2KsrQn9OKQr2Q2RzMRKiSEGI
B9SIgxovANEyynwAMpPXcm1GcVW9mIdRaOZzhzVBi97pblEalLNtg3FQJPZDV2ln
Xfhzwi4cDxmPN+QzEIW7/eE2MXBGwmpw4/E66g+c/4+0j7ojbzt4gT6/JWLv8uF4
lY6VuPl7HPo4CZ/356XEcBZy+YoPsRxd7n9e1xYb0/w0NrYewGtcjSV1i8GKVl3F
xbOiaC7efbdY0sMu3LHBQUAM5UUpwnud1JBwhrFQV/WRRK2ld2KgAE10oClqrJCV
vjVcNSWcVrcK2ODpHxbIaZx9DLFdoQGkcL+8u7cv16JLqaszZKcenJNB5MXt9sz1
rZfAbhpUzNb0XrbZxmiG6fAVifRvWZ3tqBoOIwsw2/YDA6Dh14HxTQk92Yeb/rXj
1SV5mO3GOIfOJXcVK3i7QxkGiAgDARQ/SxNJq1QEp9kTxaWhfOAnUyeH0aY9emYZ
CveufVzrss8Hx6A4UFOa
=EwYm
-----END PGP SIGNATURE-----

--hu75rc2qyp55un53--
