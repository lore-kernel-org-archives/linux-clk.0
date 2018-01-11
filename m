Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:54354 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934772AbeAKPj3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Jan 2018 10:39:29 -0500
Date: Thu, 11 Jan 2018 16:39:28 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-sunxi@googlegroups.com
Subject: Re: [PATCH] clk: sunxi-ng: defaultly enable DE2 CCU for sun8i/sun50i
Message-ID: <20180111153928.qys3efun4jjrx4pz@flea.lan>
References: <20180111030451.9217-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="fhqkf5mtjzbmefeo"
In-Reply-To: <20180111030451.9217-1-icenowy@aosc.io>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--fhqkf5mtjzbmefeo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 11, 2018 at 11:04:51AM +0800, Icenowy Zheng wrote:
> As DE2 support for more SoCs are introducing, there's many reports that
> the DE2 is not functional due to DE2 CCU code not included in kernel.
>=20
> Defaultly enable DE2 CCU for sun8i/sun50i to reduce this kind of
> problems.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>

One way to avoid this would have been to add the symbol to the sunxi
and multi_v7 defconfigs...

You're also adding a depends on. This should be explained or at least
mentionned in your commit log.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--fhqkf5mtjzbmefeo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlpXhS8ACgkQ0rTAlCFN
r3Te/w/+MSz8pNeBDrNgX6H9KX+0ZR8NxKwzpqJzIRZf7QfbceS6RFxkinF8gFxE
9cp6OSJb1yXQrsCbRolYrRzYwteXnx30jIqaS9/8mw9WIeFRiQDvzqXlyfE4BN7E
e9MReV9SJ6tannusF6z+UZs0KqE8tIbBG4bsOC0/03P6lJdSnsxpDJCXdvBRl21N
vjSa+4YuRnQf+PGzD3HOnZNLz3bbdppqWwDvaHsdTXIO3HYSMTZ8I+4zTBBau9O1
k8llCx8Ol50ar73b4IGmCbw00gm0Gc8wxF+3fS0hpJev0C/lR8yL11DeQEk4xeeR
NUriNAJpUKBzDt4SE0OXaTvKXFE222nw3sDdKN6mkIPGbzaq4/GwyGXaivryRBD7
cfEc1BlvzJLc829PcxgPe119bwxW3Y5+iplCOyBoZF8tTBPggly+sBJxJub//7KC
rZzmtIrZme4j9I7yGUFb+sMb04NEy6Yx+0oSrFe41q5lEk8x6n4GEhS2g+a3tzdk
y236B22qtE/0tJn2H/CZ6JDmPO4Vo5SkHmExqd45o9gfsi+pRPJQi2o3NJX99mqh
O/mVTMKeubRf0dta6EQUtBRgmyoVsL5tXqyiJTeWkmov3Ug/RP2SH8/4tX5FDCTb
7TDnn2w7f2e8wWv9puswNlnlomqYTXgT6/wLG92T8/bZXNZaR7g=
=gtsa
-----END PGP SIGNATURE-----

--fhqkf5mtjzbmefeo--
