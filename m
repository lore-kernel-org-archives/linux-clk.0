Return-Path: <linux-kernel-owner@vger.kernel.org>
Message-ID: <55D5994D.9080209@ti.com>
Date: Thu, 20 Aug 2015 12:09:33 +0300
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>,
	Mike Turquette <mturquette@baylibre.com>
CC: <linux-kernel@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	Luc Verhaegen <libv@skynet.be>,
	Hans de Goede <hdegoede@redhat.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>,
	David Herrmann <dh.herrmann@gmail.com>
Subject: Re: [PATCH 6/7] simplefb: Include clk.h
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org> <1436569409-27964-7-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436569409-27964-7-git-send-email-sboyd@codeaurora.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="mmN4jeROxLiRW8DBer2QPo2T0p6AllQH4"
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

--mmN4jeROxLiRW8DBer2QPo2T0p6AllQH4
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable



On 11/07/15 02:03, Stephen Boyd wrote:
> This driver uses the consumer API, so include clk.h explicitly
> instead of impliclty through the provider API.
>=20
> Cc: Luc Verhaegen <libv@skynet.be>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Geert Uytterhoeven <geert@linux-m68k.org>
> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> Cc: David Herrmann <dh.herrmann@gmail.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>=20
> Please ack so this can go through clk-tree.
>=20
>  drivers/video/fbdev/simplefb.c | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Tomi Valkeinen <tomi.valkeinen@ti.com>

 Tomi


--mmN4jeROxLiRW8DBer2QPo2T0p6AllQH4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJV1ZlNAAoJEPo9qoy8lh71INIP/1yITN70XqWeEAXX3od+Iuti
iu0Fnm4kHoQ61EGXT3h4YsFNeP1tqJllG8V0ab3DItD1hCsIoa2oi6Sv+18gmoyL
AYIA5ikrEW8O2yxY+3z+0Yr3uHbvdTFjqyRQzGkylVZ52eLkmHxs97Gk/PdEISvP
1UEQH8ZWIQ+TyxAT+inOru+YuWIKzRcveLefQcgX9GSSAqLq1prWByO/exUsoyUl
5Ypkb6LT9IJXMbjsR81tGVYVqMoewW8UQMWL2+cfYroOu2pI1jcwbLhZ2HAF0uXQ
BEe/0UsIV++JuaFar1UgFYPBU//7/2EVRjLy8engGrfMI07n0tRWkp/QjSl1F1Gw
aeJNIntsmU47RBqAOx+Zu/St68pALZwrkqHv0Cvr734Xwon/hqDH5XWjmt7/WYVd
vs3oh11SOtoYHFVV1P1W37LQWKPiLIQWSasCnH6PdHVjV6WbKIiTFP5fH+Q7QwRv
6p2OULWgYrQb/m+4ZOzlp9cdYBXJrsR4c6jOjukNy629ioZ7f/paKa7rEV+egICb
8cRPwq/uzz1s9O95z6GxYTIHPZVpHHsl9pSa1pYsHID64usYwMT92T+RRelCDeiP
M195bmNJrBTntjzMqEK07qu4zS+2H3lR35EkMVyQ8iuNVeg4hovbSM8V/bbiTmPO
PMzO6+Hn4QNcS8opE5fN
=Mwln
-----END PGP SIGNATURE-----

--mmN4jeROxLiRW8DBer2QPo2T0p6AllQH4--
