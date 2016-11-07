Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 7 Nov 2016 08:54:38 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	Jorik Jonker <jorik@kippendief.biz>, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH 1/2] clk: sunxi-ng: Fix CPUX clock for the A23/A33
Message-ID: <20161107075438.gjva4r53q25z2ijb@lukather>
References: <20161106172932.39478-1-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7dzb5fimzsix7mzh"
In-Reply-To: <20161106172932.39478-1-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>


--7dzb5fimzsix7mzh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 07, 2016 at 01:29:31AM +0800, Icenowy Zheng wrote:
> The CPUX clock of A23/33 CCU driver forgot to add CLK_SET_RATE_PARENT
> flag, which makes its frequency fail to change (as part of cpu thermal
> throttle).
>=20
> Fix it by add this flag.

Your commit title and log could be better.

The title usually is more about what is done in the patch itself,
something like "clk: sunxi-ng: Allow to change the parent rate for the
CPU clocks" in this case.

And your commit log should explain why it is an issue. Yours is even
wrong here, we could definitely change the rate of these clocks
already. The only thing that was not allowed was to change the rate of
its parents, which is what this patch fixes.

> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> ---
> Patch 4.9-rc too.

I don't see why it should be part of 4.9. No one uses that code in 4.9.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--7dzb5fimzsix7mzh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYIDM6AAoJEBx+YmzsjxAg2u4QAJOMV+afX2JOAD24eWQ69tux
UNDTyGddSGMegVKycsbwnX2VDBMUUxbSga88VtjpefjrxtmwvE/61HWhrtA93dn4
s3c0cKaKn9FOk9a8sF735dXCXGIyiHNDucduJ7SGs6HEPZabezTW11/G8wj7eI6W
zsEh7ygp+GnXe2CaJT/HNYi+RqSQW74BoP/dK2TQGZnpUjBp5yV78el1TifZ4488
8CogZXi7gvTCH9MnQzD87ui/y8ykzvwD/1P1TK/Cce8orlRt6EfEJ+GL0hBEKsp7
ZVa8qQgRHkiYrA0Lwbz9WsLA3EV8o90aKNeMOP7tBsJulDztV4IofR/vvDsuS1yT
iLUfirgixemTnh2mr9D/B0X7RFQ0OHlKzbD2cjrSI23fjieiRrCDjcd6begbI4GH
/MriI82IkAMaNchsMooVcJlONGHkZ4vFGdQ1+IZV/p4xZ4xlkFOpvXjrDccLd+m0
H9KWNhHbfJFE7r2IX9nIqKF4jRiEiBNCrqZ3A4zuh4Yaoq5CvNtAigQR5pKpHlbP
4DFx6FUTykaH0EiO1sq2QLB0Uu1XghTzswJiP7gHs4HMGWByQ0w6V/WL3gTZhIsg
QNUmTipqcuQTZ9sFk6isBLX4PRroS6ZZl8IfjHcEfLlQ2qZiszjEHWcm8sjwbCXv
psFwe7wocZPmjSezg/8R
=OQ6K
-----END PGP SIGNATURE-----

--7dzb5fimzsix7mzh--
