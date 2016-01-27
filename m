Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 16:51:41 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 03/11] clk: sunxi: factors: Add clk cleanup in
 sunxi_factors_register() error path
Message-ID: <20160127155141.GG4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-4-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Cgrdyab2wu3Akvjd"
In-Reply-To: <1453727747-23307-4-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--Cgrdyab2wu3Akvjd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:39PM +0800, Chen-Yu Tsai wrote:
> sunxi_factors_register() does not check for failures or cleanup after
> clk_register_composite() or other clk-related calls.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Cgrdyab2wu3Akvjd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqOeNAAoJEBx+YmzsjxAgsRwP/RXkXYGOWAdM32Dqi3WoCy7R
FFoZNakZRHWzf+iAQWdw2POJXNr3wKMjuGNUgALAKTGwrsIp0dQycZuYnJHnPDPB
o+Ksao+g/5sHSNTwz4jF5CB5OIQLItjYGhK1hFOEtcslrA5jJgzGRjynPMnWNb/h
0Vd7TPOI2JVR6XPMFycUiM3vIgLZwz2MMq/38+mGruQkARXNS5LuF2HutuPLKVD0
/vJVbmW1okg4Ptpr1zZdgarQRAdPFYDI1GXNcr6ddZS3IxsXdCooRUIF357DJJQa
2gNNoArwPOfswGcFkcjybtIPHbXU5LMmCmHbwW6cMO2C8dT/a/M/NIp0MdeLGhE5
epcDFIyw3z12eNE9PDjJUYPmMdCObZWqgPZRSxUjGKBKIQyxrb8wICURDRJ8stn2
YEZFnzm2cgfqJDX93FOMx07wgIiW0E8GUIskAsajpYfxJJ+cHJjWf+bTNm3YCs/1
MHFySAB+qZvlyYLNfGC6dFE3ejYPrRN1nGLUfH4pixF1nwRUiMJeRC3L6xyjfKXX
dgnouiU0hnCPNOk4MsGzfBVv50vOSsaD93L3UoglgNGPVdA42ooMxLq/elB/nMek
CVvy6HUgL5LDMDJK2nkPKrDT5pEGEByrrC6PQA+ea1q+tNM9YMkXxlp75HdwyRNU
Dw/oliDiInloG0LTUA9K
=hWgv
-----END PGP SIGNATURE-----

--Cgrdyab2wu3Akvjd--
