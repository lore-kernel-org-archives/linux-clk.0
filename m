Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 21 Feb 2017 15:05:40 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [RFC PATCH 9/9] ARM: dts: sun8i: enable USB host for Banana Pi
 M2 Ultra
Message-ID: <20170221230540.fqvzismg2p4qdmnh@lukather>
References: <20170217173722.6477-1-icenowy@aosc.xyz>
 <20170217173722.6477-10-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170217173722.6477-10-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============8152733007724467711=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8152733007724467711==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4nqviauombsulncy"
Content-Disposition: inline


--4nqviauombsulncy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 01:37:22AM +0800, Icenowy Zheng wrote:
> Banana Pi M2 Ultra board features two USB host ports, connected to the
> two USB host ports on the SoC.
>=20
> Add support for them.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Same comment than for the DTSI. This should be merged with the rest of
the DTS' patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--4nqviauombsulncy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYrMfEAAoJEBx+YmzsjxAgBsAQAI0zLiKmf3OOrX1FAXRvPotW
WOQXkVWSIFeNKbzoQzfiwnPZWmscv6tnPiXBXMv0RgcwuNIxMWywlVQDt58ChamD
bvcugODURlcV8T5FHyFk8o/3lT3mX83pZah2YCro2y8FL8j7mCUhlEO5BFbnKT2J
J5Uid9WkfaQZsfIR1Oes5P/80A1nz938o4jrJFCb1w85EssBQmdrgkkwEnIbHvel
2rJ5FG4wFhFAfkE4E+V2YH6rvoygx8Gagx4wQt0sg/ntURjAeC75uY4+mKanbpZv
+uNZ7EZ4ghAt3mlMl6swtjKEOvX4W3GdUe9H4y6/K+onm4uelG5z05OxpRUfnjR0
K9ibvU5ydDgu64Ax6W79FXAzHOiCTK5mWoSErrhyV3w3Cr99R8n+SWj4yXReSeNU
qgmc4XgJXw9q+5IesTCLxrBbDUj0cM6wj/To/YeBqXczOuYL1b/tp752Eja/T8gG
Pt6F+AAz2Tvk419/oqJx6HUPKiOw+Gbkc41NkXPFqSg8Ww35BH4O+i5uoPpvPCEk
+k7AxgxbIN8CyzICpuvD+Mfe+D/l5Th3wRXoEERe5vbDN+n6zPc1UgAkyNFiNIO3
BJ+H0X2tEEHMCeBMaNbwIb8EmucX0ShVPRPxT8+0k89HQoEfFcLhAdj9FDB6wc67
sK0rOltLJbO/Z6d9u0mc
=h27d
-----END PGP SIGNATURE-----

--4nqviauombsulncy--


--===============8152733007724467711==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8152733007724467711==--
