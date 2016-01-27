Return-Path: <maxime.ripard@free-electrons.com>
Date: Wed, 27 Jan 2016 18:33:11 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH RFC 08/11] clk: sunxi: factors: Drop round_rate from clk
 ops
Message-ID: <20160127173311.GM4317@lukather>
References: <1453727747-23307-1-git-send-email-wens@csie.org>
 <1453727747-23307-9-git-send-email-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="FnOKg9Ah4tDwTfQS"
In-Reply-To: <1453727747-23307-9-git-send-email-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--FnOKg9Ah4tDwTfQS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 25, 2016 at 09:15:44PM +0800, Chen-Yu Tsai wrote:
> The common clock framework requires either determine_rate or round_rate
> to be implemented. We use determine_rate so we can pass the parent index
> to the get_factors callback. This cannot be done easily with round_rate,
> so just drop it.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--FnOKg9Ah4tDwTfQS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWqP9XAAoJEBx+YmzsjxAg/UsP/0tXf9hUGVRm6mxaRpnSm4dj
LPHnlyP75xxOCuzwRcbjc111s34PETcPsiJEFBbIpetSCehCQxHJqWh9PiHQNiMb
kQqx5S0TZcgd1R8J3gk3jBrj6FTTmCbfzO69i/LCcXXYBp92+1UV0I3MPcqcjjeV
JWC3IpoU3apeJoSKVdiNqHJS7bZoyYglkeRoZ3jgCrOoSiTy3vkTTObdOrzBI0kv
gG+fg8MDsYznu18TihQrzyY0fthnecFntmOq8NLL3BybAeB3aQuf08CPDmRqLAxG
7KWVKQXCxGxRAPGOuDo2ezRxsk+KPO+meIU+KFJZGsMxZsv1sM+YMBsFk4OfO9LB
wvj6wFI5Ungv0uqNOuFKZ0hIXmKUPNKt8rpSu7Htn7KpI8b25ogNTb3rfwMtk8o0
4Cf0DVznkNSSSYdm71ZQhtZjPGnkXz/2qEf+XccvmOowCrKxbU/4vO00dynJJInO
/GzkzPAlyMD3aC7B26suaaTmjorZ/zEHSBCdlTZjAdlJyhZzRCyPfNGVKaQTBH3U
oDs74pWt343hs6B+vvPq2xxyp2BUzm/dk0LBRGTjFMjXgUkF9hcTfqLGvNT8LjFF
c0YMhawVNa+aopMnW3G3byqC7Mw62SQIcyFDDE7Djdu04TyR6m9owReopjC1nBIP
8bAJirdDvycCncmqDFFd
=SmeG
-----END PGP SIGNATURE-----

--FnOKg9Ah4tDwTfQS--
