Return-Path: <andrew@aj.id.au>
Message-ID: <1506497645.30138.37.camel@aj.id.au>
Subject: Re: [PATCH v2 3/5] clk: aspeed: Add platform driver and register
 PLLs
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>
Cc: Lee Jones <lee.jones@linaro.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>, Linux
 Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-clk@vger.kernel.org, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Jeremy Kerr <jk@ozlabs.org>, Rick Altherr
 <raltherr@google.com>, Ryan Chen <ryan_chen@aspeedtech.com>, Arnd Bergmann
 <arnd@arndb.de>
Date: Wed, 27 Sep 2017 17:04:05 +0930
In-Reply-To: <CACPK8Xd8RQ4s1xMsSuxHgQRiHS6vDtxVTAxu8Ba3J3it45MC5g@mail.gmail.com>
References: <20170921042641.7326-1-joel@jms.id.au>
	 <20170921042641.7326-4-joel@jms.id.au> <1506343255.30138.29.camel@aj.id.au>
	 <CACPK8Xd8RQ4s1xMsSuxHgQRiHS6vDtxVTAxu8Ba3J3it45MC5g@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-3gN0lTQDvqLyuXQUU+kY"
Mime-Version: 1.0
List-ID: <linux-clk.vger.kernel.org>


--=-3gN0lTQDvqLyuXQUU+kY
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2017-09-27 at 16:13 +1000, Joel Stanley wrote:
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 div_table,
> >=20
> > This doesn't seem to be correct. There's the problem of 0b000 and 0b001=
 mapping
> > the same value of 2 for the AST2500, whose table then increments in ste=
ps of 1.
> > The AST2400 mapping on the otherhand is multiples of 2 starting at 2, w=
ith no
> > inconsistency for 0b000 vs 0b001.
>=20
> Yep, we do use a different table for ast2400 vs ast2500. See
> ast2400_div_table vs ast2500_div_table.

Yep, but for the AST2500 this is a different table again to what you've
already defined (for the AST2500). However, for the AST2400 the table
looks the same as the other AST2400 tables.

Cheers,

Andrew
--=-3gN0lTQDvqLyuXQUU+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZy1RtAAoJEJ0dnzgO5LT5i5gP/RcEvydeKE/HQZG2I2b2cSBx
ceLsNY19/BLw4L8lITfSMtnzE3VjSFP3yeESsb2qtkiVsaq8RWqFE5zgP+RhFjUh
uG7Mk8JyWmooqq+w3zc5GgDnNApJnkh8z52PWgesrG2rsJgqdXg/KugsnGLGVm0F
89ngcvsMv3xfm5x2CqGkeoSbYf0fUStx96zqWqVmrppn867No/9xhvQO2TFFasN8
9MoO2bYY8UCRcxW33sGA14QmXkweUh/gchJlEfPvGxaFX7ky8hJa67PcU2H0fNxL
r1dU6IQjmVAhIJsB+R17Msi2hsWXI2rEuJ/QljtQtq//toVh0UKHj/bOyW7D5txn
jdMI7ZgAb5q6Ef0gg3JaC8AjCRUBBiJntfKGixZ+QoKNo7zJJJjhPO2XTLVThJuE
WD8ZQD7cS0YmBP9k9gDfPI73Zsuams4ETgdrsCH7imAu0AOPPXVxP8v3H1Vc3DvX
Fw/HK7QDDSx2EQrgMtIZhKp9TJhVO7vQEL1cZ7/eZBsU44/L3fN3gPwxQ+syB/06
TIk9PFs7XTsa8lY9jOOGd2aqEvLnkvTrFIWSE2zLBCGAL00GV5cd2MzEmVE84pz0
CZISPJmhR461xkI/6XlyzG3u2oFHlj7w+rWi5w+E+zukDUWmYgkX9a9LaqlrPr9R
Hd6AwOrtdva61KjGp7Nr
=It07
-----END PGP SIGNATURE-----

--=-3gN0lTQDvqLyuXQUU+kY--
