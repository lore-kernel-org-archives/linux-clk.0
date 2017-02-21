Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 21 Feb 2017 15:05:04 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [RFC PATCH 8/9] ARM: dts: sun8i: add USB nodes for R40
Message-ID: <20170221230504.pvlmr5ylkfy2tntl@lukather>
References: <20170217173722.6477-1-icenowy@aosc.xyz>
 <20170217173722.6477-9-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170217173722.6477-9-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============6994104290902079284=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============6994104290902079284==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zpjwodcjpng5sve3"
Content-Disposition: inline


--zpjwodcjpng5sve3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 18, 2017 at 01:37:21AM +0800, Icenowy Zheng wrote:
> Allwinner R40 SoC features a USB OTG port and two USB HOST ports.
>=20
> Add support for the ports in the DTSI file.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Can't this be merged into the patch adding the DTSI?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--zpjwodcjpng5sve3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYrMegAAoJEBx+YmzsjxAgU+cP/2LQ2UjYbAcg4eqlH+UFMsct
3O7E4IMVMuZe/Qg5jdd0UWN72Zj4sU9jlFsZzQJEU6zjosALAOlWCLpw12csMu13
kyzZ7g+S8BMKn+nK65T+bLuzhut0o3hje49l1KHL25nnPDtLDZQbHFGzxjKoJP6x
fw5sCwnLMmxotjatim+7Sm5jj8jkQ3po18bkcraiASSvAorePRDObLaz9zv+NUu8
U6vdxzsU6mAxsZgjrtyVH4kJzfc3F/WGoFmKfyLUTGbNwXBQDoIoBJr1KuRswlZJ
pDZXtM74IW+Rf1gDPDNOTUm1RJDYhCbJGsIS1pkH3KdJ8ZaKtZWi88jeL5qZxgTC
Eu9lItZvB4HaoQK3QtSxsNFclMtpKdA1YT/XVgbEBsmi2neIOe+++q4CnQoqtOCY
gkoPxmd7asV+TA8v/g7Pxl0AWMRjM4QDu8zG4HsVGlO+qLyHrxSjo7INxmvCf4i+
hyQDXYFmvktIVyciaqbHkzBSxWQIbnYSiAYW2xgxkca0pn2TK5pxWgjWpt0w8GHX
U7D+Q1Z6Zlur3xa2zjp3QzcLkc/3yW+3H/HtN3xX8vYhVn8nRg8B9ngzscxY/++c
bx9cK3ZzRSMFuRo3G5wZ5JYK4cvWRB4Hd2H14+Ru88tRYfjjhVWWufJeOPmuVTGS
zIhbUBu4XrAF7zVOKke+
=vZ5G
-----END PGP SIGNATURE-----

--zpjwodcjpng5sve3--


--===============6994104290902079284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6994104290902079284==--
