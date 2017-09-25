Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Mon, 25 Sep 2017 12:10:27 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Chen-Yu Tsai <wens@csie.org>, linux-arm-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 0/3] Simple DVFS support for Allwinner A64 SoC
Message-ID: <20170925101027.lghnnll4h6inreqm@flea.home>
References: <20170923001531.14285-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="cljd2fqx4wv57lmc"
In-Reply-To: <20170923001531.14285-1-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--cljd2fqx4wv57lmc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Sep 23, 2017 at 12:15:28AM +0000, Icenowy Zheng wrote:
> This patchset imports simple DVFS support for Allwinner A64 SoC.
>=20
> As the thermal sensor driver is not yet implemented and some boards
> have still no AXP PMIC support, now only two OPPs are present --
> 648MHz@1.04V and 816MHz@1.1V to prevent overheat or undervoltage.
>=20
> PATCH 1 is a fix to the CCU driver of A64, and the remaining patches
> set up the device tree bits of the DVFS on Pine64.

How has this been tested?

What tasks did you run, with what governor, etc...

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--cljd2fqx4wv57lmc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZyNYTAAoJEBx+YmzsjxAgBl8QAK7qsXEFmOMbqH8Bd7/RR0Wk
m0eAKWnAFKJt3xBtzcWVmFZxrTRe2kwxahsB1csw/0nFmANHkdFkjAn4djeJIBaZ
zouuC3/mj0SPaFTqiHRwWzyruY1TpzZKoPDPn9SIHRRSZaXZiDyla9c6gHCYKHTp
DUcyqEyWbBJuGZ9DPTDQlNx9Y3NQvbclFiLoRL9XhCmTqr+xnrYzYFu83mFqpL55
jnoGbjkkSIBjfZKMkL1rFxfVlFE0lQtM8fUSwWwiGh2sqMIbWyFAG0doFrwJ7jvj
+iUTTb6gQvY9SINRPY0z8KHYOa05ykY5tjl7bxJSuaivGSkCDL6S1Ml45irRIcdn
UYaHpyfjLKYe8/qmA/shqH775o3N1wQ0QD7B2rID5HPCVHSCEPwFmWrIPGn4efJH
U71CKKAZRwsxt5LkkXFGehDddXjv8RApx2mJz72J0lcjDz1xID5wYnlfSgUjoX50
1zRKOMQn8F2wYUQAEFQ8B52WtEVCCnANxExagv0AIzblUwyO3E8x7oD+QSEjx69R
cZH5pLnooLtID8NDIAQmgR49b2To0RMuV0VetKaY2BEgct+612cFpbO2cYtn/uQy
bWWe/uHA5uvJVhnal5GC9thSUtN7igLtImAvm0kHqLx1SfnbPnAcood1zd3sFtAP
YT43WUSE8ALplzjdRBZI
=5u1c
-----END PGP SIGNATURE-----

--cljd2fqx4wv57lmc--
