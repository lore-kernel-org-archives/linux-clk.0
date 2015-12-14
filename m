Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 14 Dec 2015 14:05:06 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Andrzej Hajda <a.hajda@samsung.com>
Cc: Emilio =?iso-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi: fix handling return value of
 of_property_match_string
Message-ID: <20151214130506.GI19456@lukather>
References: <1450087564-28441-1-git-send-email-a.hajda@samsung.com>
 <1450087564-28441-3-git-send-email-a.hajda@samsung.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="GBuTPvBEOL0MYPgd"
In-Reply-To: <1450087564-28441-3-git-send-email-a.hajda@samsung.com>
List-ID: <linux-clk.vger.kernel.org>


--GBuTPvBEOL0MYPgd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Dec 14, 2015 at 11:06:00AM +0100, Andrzej Hajda wrote:
> The function can return negative values, so its result should
> be assigned to signed variable.
>=20
> The problem has been detected using proposed semantic patch
> scripts/coccinelle/tests/assign_signed_to_unsigned.cocci [1].
>=20
> [1]: http://permalink.gmane.org/gmane.linux.kernel/2046107
>=20
> Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--GBuTPvBEOL0MYPgd
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWbr6CAAoJEBx+YmzsjxAgNAgQAJ04FUh7VwJZVZsHfAJFkNGA
62Vw8B/4SAiqqJO7xiA4ozLv/L5qKALbxHHnXQAHa9yo91JBWN/Ei5SHGUCWPLRG
bB30uRylbV3hY7ORKz9WVtpwPpF3uJ/sAzmYuyRpLH7TOVkK6QiKXXvXm1HPmk3w
y8rzTZpEJ3DbaszZmDtdlLm2Tk/epAn2mmdepNIAVqlprR0rJpIII3m/ZZxTc8Ve
/EjjSRu2AIGizUB8sJ3ceGnnkZh9wFzH5pAePyVgawIEgLpqVbNUYfmfHMrEu5fQ
8oeS9anOGosa1p10KSXaI5QgtSEeQ594aRrJ+J5JMBVXX+OY0JJG8CRz9IbUo5Mq
4TCJMIpwWR/7dPKpI06KCYTH50DU5FdpoyNOhFHbwmjSRmx8w0oibqaQGc0ePPWz
PgvTtjnjbozPvmU7fvHnvormHglQryZfnF38RWmejAt7JWRmJJHIclan4KVknBhW
owsQ7wRVdCwFkOdy4L7E/xOo+aO4Yqnso2GFEk40QK/7cM3pOob0q5aVEnYwzAg3
ePfl0QcchLJbl6800ky9sMkW6LZ+kj7Yj5mHhgIW2H4HhFmfrEpgyfxomvvGg/Dw
wfhFTJowyltCn+xKoGerQarpKig2VYOuUNAv45jgPMKKWq4rj4Ny7EJ7rYQpceJK
j9p/Zne26pyTAMBHcP+b
=4H9b
-----END PGP SIGNATURE-----

--GBuTPvBEOL0MYPgd--
