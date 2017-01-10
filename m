Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 10 Jan 2017 19:21:06 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 4/5] ARM: dts: sunxi: add dtsi file for V3s SoC
Message-ID: <20170110182106.7q7uduxxqbzg4squ@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-5-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170103151629.19447-5-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-sunxi@googlegroups.com,
 Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============2383616143206160207=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============2383616143206160207==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="u34jqn6krwdnlmfo"
Content-Disposition: inline


--u34jqn6krwdnlmfo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 11:16:28PM +0800, Icenowy Zheng wrote:
> +			uart0_pins_a: uart0@0 {
> +				pins =3D "PB8", "PB9";
> +				function =3D "uart0";
> +				bias-pull-up;

Why do you need a pullup here?

Looks good otherwise.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--u34jqn6krwdnlmfo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYdSYSAAoJEBx+YmzsjxAgSfcP/2WFx64B+GFcEU3zFtb+nYJ8
BwwYtBvlFTA/dMqLi7Q2L/U0hZz0MEHsw3iHW4VQ2IsBmXBQ+wsn4Br9EKNfH7He
R4cP/d+OvGd+3uUwdi8ZZ29vhpmDWcZFmLk9EKkzM5UN/uTE3kz5ayego08scEDk
Ce6s0UsvPDuN3ytDUl/XYegq9lY1n2NXykOiyl+QLTkNqG1eKAKiKlEnzVXBDh17
QH6R/zdsPQBwyoXq0TjXS0eMMdLF5zlruoqQ55qZw0DLrfynhUIcWHZ3tObHKhfc
KVjeodOZAENtP2QRckXZyldQs3uoJSOBP15BOYu2JyE13CllesqMX9yf0YltgAR9
F1MPBrWFADJX5V6Rs+Naek+eN+EitKUYrmxBvcjKT+3jOGR8xdXx5jEvdS72kVtk
YALOzLSkfe1EvTIYtbaxIYR0Eg29CxBUdTcxm2DJ7kmZOWxls5Xxzy28vQb5l0YY
tubnzxXb2NjpX7hN/qEulfUi0Y2nxP1d2uAJeZF0u/CeWbNblob064BzOJrDH+sR
uludE2znRWxhOxAHKHaEZaJ0rNxv6J0PJ7tg+5R9dw9/jEhEqU6WdsOBKdvCALiX
PbNdaOvEu+0WyLIonxmbo8RftFdgYDywcKj63vSrVYxt5RLVuXfRNF+i3PjOTeMe
Ki7Qox4oe6/8tGj9EzHK
=cTOx
-----END PGP SIGNATURE-----

--u34jqn6krwdnlmfo--


--===============2383616143206160207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2383616143206160207==--
