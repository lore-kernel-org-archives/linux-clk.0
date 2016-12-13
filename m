Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 13 Dec 2016 16:45:48 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Russell King <linux@armlinux.org.uk>, Chen-Yu Tsai <wens@csie.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Jorik Jonker <jorik@kippendief.biz>,
	Hans de Goede <hdegoede@redhat.com>,
	Quentin Schulz <quentin.schulz@free-electrons.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 3/6] ARM: dts: sun8i: add a cpu0 label to cpu@0 node on
 A23/33
Message-ID: <20161213154548.qfbk4zd35n6tovpr@lukather>
References: <20161213152252.53749-1-icenowy@aosc.xyz>
 <20161213152252.53749-4-icenowy@aosc.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ik6geqlrhfiwixba"
In-Reply-To: <20161213152252.53749-4-icenowy@aosc.xyz>
List-ID: <linux-clk.vger.kernel.org>


--ik6geqlrhfiwixba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 13, 2016 at 11:22:49PM +0800, Icenowy Zheng wrote:
> A "cpu0" label is needed on cpu@0 for cpufreq-dt to work.
>=20
> Add such a label, in order to prepare for cpufreq support of A23/33.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ik6geqlrhfiwixba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYUBesAAoJEBx+YmzsjxAgbd0P/3sQIOWwd8IxOFA8MSjjoEyS
9bFPwIez39uRBHbksxbFvpdMormy54V1bafboyB27HW3U9oIXrR5+NLYObChEhwh
zW1QCP/l9PA2QYTql4aBlihA+2DbQMl1tlNtiY3Z5MDtsowFtyY+0qxkVhidP7tp
KCaEMr9CtMJLLikZcfV72NmxzOMaYSebqybyiS4etFosvZQNcBiDgOOMj5GPdDuu
m9qD5NsyCLq51Jeultup7Gwaz+zdDpnKc1TC3JNlF32rt86a2IYa4dZZHh7koYWy
niLSH+w8072/q4v82ViuZ4ANmJv5vznTGSfw/QHKhsjIJ0XZeYIhk/HT+nIK77qY
CDbfJUsPxS7BJsThLnbJjn42DOcqNWn4sCqtZQ+AJkvxifVEBhHyIhFZc04MRRum
OQ9Yq+IaajdM9I1uDifF0op2JsXSaI3FYwhOBuMU8qpzOpP0xjOcRb3FHEtGu852
98orThlKD2kLTo/kw3XLsO5N2q4oDV7DUWT96q73NMY4YEej419IAwo7GcYqi2tG
EZInqjsKe49WLQWoooRonDVrQASzk4GoMdHvTUWK6YwdiKkPEDo/TBbQ6DL/gz16
gIjrkRgm+KsBKAlde2B9IEK5VsMxW5CzkIpt9Qx8DrrL0YuhKo5V5lxe0w4/3Ots
HsUivSU0fcYCSoRwp2su
=VmUl
-----END PGP SIGNATURE-----

--ik6geqlrhfiwixba--
