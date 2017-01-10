Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 10 Jan 2017 19:18:15 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH 3/5] pinctrl: sunxi: add driver for V3s SoC
Message-ID: <20170110181815.nuayyybfdp4d27bp@lukather>
References: <20170103151629.19447-1-icenowy@aosc.xyz>
 <20170103151629.19447-4-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170103151629.19447-4-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============2914376181533260018=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============2914376181533260018==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wrsu6zwgoydx4zyk"
Content-Disposition: inline


--wrsu6zwgoydx4zyk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 03, 2017 at 11:16:27PM +0800, Icenowy Zheng wrote:
> V3s SoC features only a pin controller (for the lack of CPUs part).
>=20
> Add a driver for this controller.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Acked-by: Maxime Ripard <maxime.ripard@free-electrons.com>

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--wrsu6zwgoydx4zyk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYdSViAAoJEBx+YmzsjxAg8IIQAKBocLLwKW+QWVvya8qb5RKB
BK0t8xd8U/1J5XQqxCYqb9hsYKyQj0EyfqWCP+RdM2Xx9vukjpGwzwYMOoIll23i
kvMVNsj1L1kXs2rIOKaBqj/MyUdL82xVzMMRkFxM2MjhJT8r+GZZcVf3P8/1hM9T
EHl4+VfvNhSYHj7S7uwDMrHpXQ5kJBz3N6u5rmA3WDuGhVEYi0NZDnMWr9GKGOD3
6LjeU8hTQctvai/Tuy1vM3715IaVeydkafVTD+TxMhN/t2SsjmUynL0A7y/1mFww
kHsxKYMn3g0i0XvWSZMXC9R7iLTfL+MYpr7TMh4oKvWuFuCp4tpUfgYKzsqdiHyw
/QKn244WDr5OAT3CF8cf2tjC/bHZgqAgaQ7APWyx1Bti1t8HNltp1uflowL9FA1J
uJrEqtnT2hyS6uiooVl/VReXrPn9ur0KVlXqoOwuO3zfmybhhH/5BkbhVe2Rd+h+
PxhiE5mKGRDzk1j/UibS0FoqVj+BjU5GmfUISg3lIT/gXyjRA0IZrNLuOgEQE+Ea
d8pZbsVIEEigRzplQxUtYH3go6UDPbuxKviNB8KiLOZOiiD+en65Dpf8FPFAqWCA
JBJeoYEU5bl3Gf9qi3ZWSBsb3wpbMd3FsMnB8PQmDNA0LfEcTKpKX5VIw+ISiEEt
XYq7jKMK9x+Y8SUMA5X7
=BAG1
-----END PGP SIGNATURE-----

--wrsu6zwgoydx4zyk--


--===============2914376181533260018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============2914376181533260018==--
