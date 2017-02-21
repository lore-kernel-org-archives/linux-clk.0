Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 21 Feb 2017 15:02:33 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 3/9] pinctrl: sunxi: add support for R40 pinctrl
Message-ID: <20170221230233.2o4idjwybmkkakcs@lukather>
References: <20170217173722.6477-1-icenowy@aosc.xyz>
 <20170217173722.6477-4-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170217173722.6477-4-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 Kishon Vijay Abraham I <kishon@ti.com>, linux-gpio@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8111783796037153037=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8111783796037153037==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="haxkjxj4vh5e3bal"
Content-Disposition: inline


--haxkjxj4vh5e3bal
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 01:37:16AM +0800, Icenowy Zheng wrote:
> Allwinner R40 have a pin controller similar to A20, only added 8-bit
> eMMC function to mmc2 at PC bank.
>=20
> Add support for it in the already renamed sunxi-a20-r40 driver via
> variant framework.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

I think a prerequisite would be to merge A10 as well (possibly even
the other way around: A20 and R40 into the A10 driver).

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--haxkjxj4vh5e3bal
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYrMcFAAoJEBx+YmzsjxAgo6MP/0w3Z03q1sxqxWVJYWCWTFuk
wePHnb61OPLqRq0jUEZ/vAEynFr1FLIqdkiimkcn3y7oGrb3nSORzdrJBglR3J2X
lE9bU5iQ5zDLBdEktR4G18DyCDdkkhxFwNh1RetaKsC8PypYqLD7jLRrAUYz0Cmc
wdWjtahsWGL2A4ER1UXPff3PCLkqOjwWWWs3lLzhyD7NpAQ0pje03quLDVujqplr
ip8Te9rv99JJxuEnMVjMaHunACm2WOZKynT+uO6GmyeAE1d1s+f9fDh6XSmXzBcr
JXZK8CgXyfWnp1IKpBuKCJlQ/03eGCqeywIT+nfmEQjxO87E/16MHO2MSbEMVoqU
SIY1VvGk8/8pk/1Oml+CnQ/J2Hip3rfc21WXpw0tC4Z9Y7mGGq5NitiTbnckIPp5
Zgsg9In8TaAbvlxBSdklLH8rtl1uXCisMICAldGCjIsy1/q3kASwKYYK7yy7EchT
cz7c859ECMAMnH92UyJ833r2ej30jwZIZKFh/tc+gLq1CE6XsB4Pc4wshBpGO6i1
Q5QGuG3tRsWkF1JfVeidLsOfE0YuWulWa5tO5MwzM49BkkCmoMqDGhW5X637KjBn
ospK1/KDkOUyzFYxdxg28o+hNybDLQzYr1xEfEMgihet+TJKhAXNfttNVGiC9wnw
H1zkjDHW+vUQQxxIW9Vp
=+uEd
-----END PGP SIGNATURE-----

--haxkjxj4vh5e3bal--


--===============8111783796037153037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8111783796037153037==--
