Return-Path: <maxime.ripard@free-electrons.com>
Date: Sun, 2 Apr 2017 18:02:37 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-sunxi@googlegroups.com
Subject: Re: [PATCH v3 0/5] Add support for the R_CCU on Allwinner H3/A64 SoCs
Message-ID: <20170402160237.osgt32ugw7cz7ubg@lukather>
References: <20170329104246.34204-1-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ei5u7bbps4yf4ctl"
In-Reply-To: <20170329104246.34204-1-icenowy@aosc.io>
List-ID: <linux-clk.vger.kernel.org>


--ei5u7bbps4yf4ctl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Mar 29, 2017 at 06:42:41PM +0800, Icenowy Zheng wrote:
> Allwinner SoCs after sun6i-a31 nearly all have a R_CCU in PRCM part.
> (V3s and R40 do not have it, as they have even no PRCM)
>=20
> This patch adds support for the ones on H3/A64.
>=20
> Some clock/reset values are reserved for easier extending the support to
> A31/A23, but for this I think some changes to the PRCM MFD should be made,
> see [1] (Although this is only a sketch).
>=20
> The r_pio device node is also added for A64, as the driver is already
> merged, and its depends (r_ccu) is now met.
>=20
> [1] https://github.com/wens/linux/commits/sunxi-ng-prcm

It looks good now, thanks.

Beside from the minor fix you've mentionned, please don't use the
defined IDs (yet) in your DT patches (3 to 5).

It will be a PITA to get merged otherwise. We'll fix it later.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ei5u7bbps4yf4ctl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJY4SCYAAoJEBx+YmzsjxAgEn4P/AtoGCilXGI4M7SwBbF1aOsa
O9MguoSa22XPqW7YDz+4Y/lryFaNOr6ickazZJcmHLv70sGjkn06dfTR+L/d0cgX
tIy8yjKTT0kCAemv/6jaXLTA/d79dTJCq1tD6UT34q+K+S+L35nnEP98zdorNRP/
jBwW0D4y7PABpg/7FkA7s0mU0vVDNyOyPg2CxcTIqYlDeAZtuCsnSP5Ym1LLT/lY
MPUbKTMqTfi/hS8Q2i4/6c/Qm1LTVvh6Dfzy6t4QjyXj5sCzb7nep578BAgk3BYE
vC32QEvTesmaIraC/WVkYT5IyH5SPwRGYbU8Qjsr88g4gze+xFMNULW++4M3Isva
povd3Neybj1MyJJwFZJ51vHMnKeEdsk1wUdbrvoILzBT6eY26xqzzIihjMvyrWux
R9BMuH4Wp6vnrjGLLdjWWaIkGqQR4LvZb3axua3zyZSi0AKXQ8a5dyJlyvk7gXYi
v8r6u+ybth/DrZ2dAOwV/ZWRm4ycgNTPzWZYhOqpO06AspLydIz4E8wO8yRqz8UT
hHALTkgRMx4OXFBLMpkT+hD98GQGw3ZFc/U2Kg4eTxqyedHaPjh93NNQpcLp+Esr
Obrgdkw+kssi/p9k5IiRNkjvr1Ch6OVhzw9YS2JVkTuxBKEgP9BHMPDRcE4fVLJQ
8+YNXvy3aEJGQFgq2IxW
=XXYu
-----END PGP SIGNATURE-----

--ei5u7bbps4yf4ctl--
