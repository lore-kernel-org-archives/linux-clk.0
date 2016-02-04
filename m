Return-Path: <maxime.ripard@free-electrons.com>
Date: Thu, 4 Feb 2016 13:07:38 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Emilio Lopez <emilio@elopez.com.ar>, heiko@sntech.de,
	Chen-Yu Tsai <wens@csie.org>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH 1/5] clk: sunxi: Make clocks setup functions return their
 clock
Message-ID: <20160204120738.GD4270@lukather>
References: <1454402834-6385-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454402834-6385-2-git-send-email-maxime.ripard@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="PHCdUe6m4AxPMzOu"
In-Reply-To: <1454402834-6385-2-git-send-email-maxime.ripard@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--PHCdUe6m4AxPMzOu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 02, 2016 at 09:47:10AM +0100, Maxime Ripard wrote:
> The clocks registration code in clk-sunxi was most of the time not
> returning the struct clk (or struct clk array) that was registered,
> preventing the users of such functions to manipulate it, for example to
> protect it.
>=20
> Make them return it so that we can start using it.
>=20
> Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>

After discussing it with Chen-Yu on IRC, the error logging will be
done as a subsequent patch.

Applied.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--PHCdUe6m4AxPMzOu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsz8KAAoJEBx+YmzsjxAgAgAP/1PW5mKZ7/EaNcoLGye9ErNS
qDObAMZwjG38uf9Szj5SFeUMuV2iV9/ZdMhUuV+fijSBmXB/u0LVdF67X2W9wnrq
9u3X34jUfuZ9AjJyB24zXYEYPtWeTS/MyUiqYJ+e2TTKSHLh2uSk562iG9sc6Ax6
0BrE0ecAM3WCSsu5SYVISs4VfP0XM6oDqwxdb3Bz2YE3FYfaL+g0fRdKG7W+BXKI
LB11j/d1xNBkHwTT9T6lX3ey5e8MUkA1cCocwAIVATSoITpQYN9B3q5IXrDMdnqw
/acybitdWQ9FMtRIDYds6FY/R8PRKlblvX1A3PgnWfQ0inYfrG7vamLWqscwlYc/
i5McziIgPVA03JwyZijmXmpeMEX48dHXclN/TA0jNY1ZvfpO2Y+tY1p/F+Ca/LYE
vD+DIOW2jvxIMAqKrrH8fpmpApM7zqyxvBYBrfnp857XR9VcxqhmiNB4+kir7KvL
/q1hMGBeVE8rI3upCHVcBAigkE8KdlKAYOSYa9icyxG8jg4snSwt3AOU3J2Z+Nw5
iOtzf15oRDmr2hm3zgfB8/hCfH7EWYlJvoPXcFzi4dzKua65DHLU9DOnRwC4mNFM
4c+7RPDUoY2nemyDE3DEDsdkoo1Dv1LeNjWooZBc/PMso14tpBbaLFZkpEPJGuWY
2oP02wzhlC0mpe2EAbWN
=VaXh
-----END PGP SIGNATURE-----

--PHCdUe6m4AxPMzOu--
