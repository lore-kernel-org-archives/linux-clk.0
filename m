Return-Path: <balbi@ti.com>
Date: Wed, 30 Sep 2015 11:31:02 -0500
From: Felipe Balbi <balbi@ti.com>
To: Alexandre Belloni <alexandre.belloni@free-electrons.com>
CC: Nicolas Ferre <nicolas.ferre@atmel.com>,
        Boris Brezillon
	<boris.brezillon@free-electrons.com>,
        Jean-Christophe Plagniol-Villard
	<plagnioj@jcrosoft.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@codeaurora.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
        Felipe
 Balbi <balbi@ti.com>, <linux-usb@vger.kernel.org>
Subject: Re: [PATCH 15/16] usb: gadget: atmel: access the PMC using regmap
Message-ID: <20150930163102.GM32625@saruman.tx.rr.com>
Reply-To: <balbi@ti.com>
References: <1443629469-15086-1-git-send-email-alexandre.belloni@free-electrons.com>
 <1443629469-15086-16-git-send-email-alexandre.belloni@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="UUMz/kfoogzZ9WLZ"
In-Reply-To: <1443629469-15086-16-git-send-email-alexandre.belloni@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>

--UUMz/kfoogzZ9WLZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 30, 2015 at 06:11:08PM +0200, Alexandre Belloni wrote:
> Use regmap to access the PMC to avoid using at91_pmc_read and
> at91_pmc_write.
>=20
> Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>

can I take this through my tree or does it have any dependences with the re=
st of
the series ?

cheers

--=20
balbi

--UUMz/kfoogzZ9WLZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWDA5GAAoJEIaOsuA1yqRE8t8QAJihmwt/tzIf3jcX9OaeGrPb
Rnoj3mGdjUnzn9+m+gOBn9e0ID3b9yZXrI+CDWlTaB78STvvshTsFOFeie6Eda2x
Q++LcT5BxMoc5Uz1ua+pJIhKS86NktqbuNgMkP/aKKTHu/K8mt8A0MxRPt6t5/Ux
KN/8pnn42+bhkkKRsGL+qc6pTGihjvT2g4FtYJNozGAD1uEA4QsAV5u6LCJ3F9kZ
9WsGdY02DkIJPKhj1R5NSfOfLeLHD7JtfE1S4RDAF8wQK7n8KP9hPPBcLVSU8+Y1
sfuVATr0qsUvAgG00c3mKKQgA+WHsG5gq+NUuzACxTDG3+2sVx8IZofCSVJgnVjp
Kn/H++wfjA3S/UtlGLaszTlY7ait9yG5dQyK9lMZVjRWRjFi67Rpq1AKznFhZBaC
n1o6Qdk2YkwOvcySO3cneXjFs+uiAdqa9l5ZkaZjY/8FKNYDv4KfMcMI/dgk2RfJ
HI10DVeKu9msM6Xpcst8K/tXCFboLBRwijpKduueS/1OIbEWBxIKNIGiu6ABmohE
ZZnuXacXUq6jGBRYzb0NukEoGAAgEXvVPbtQ2QV5Ju/BD5ptYBq9f5cnifNFrBMY
mH2fq607+GwJ681JIFwhMbcDafkacIKg7O7jzHkhksK9Ngw5RxqI7NDUdiu16y0D
8o+6oyl2w60UrLnmghHh
=au80
-----END PGP SIGNATURE-----

--UUMz/kfoogzZ9WLZ--
