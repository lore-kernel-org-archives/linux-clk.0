Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 2 Mar 2017 14:55:27 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v6 1/4] clk: sunxi-ng: add Allwinner H5 CCU support for
 H3 CCU driver
Message-ID: <20170302135527.sgu2cipqmnadpxgj@lukather>
References: <20170301201342.47583-1-icenowy@aosc.xyz>
 <20170301201342.47583-2-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170301201342.47583-2-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============4692424303984325288=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4692424303984325288==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="s57gm4ng7ostbajs"
Content-Disposition: inline


--s57gm4ng7ostbajs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 02, 2017 at 04:13:39AM +0800, Icenowy Zheng wrote:
> Allwinner H5 is a SoC that features a design which keeps the peripheral
> compatible with H3, so that it have also a CCU like the one on H3 --
> only one bus gate/reset is added, and the mmc sample/output phases are
> removed because of MMC controller update.
>=20
> Add its support in our existing H3 CCU driver.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Applied, thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--s57gm4ng7ostbajs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYuCRLAAoJEBx+YmzsjxAgSQ8QAIje4f+uLpsfCK8/nE2C6Td3
4ZugFT3QeGYvR82kmUg1tuXxHn7M9jMMtSthxcH9PY/X98uFfDHZMtbJn9LVIzgq
Y8KJt4W2t1xT7hsnWrczKvjFOymkrkF6QEQesA5/RA+rmt5Y2rmaOxmeICNSO9g7
be4ow45ObA/bnfAi2ee4Vrixpwq1Lm7lGJn1o6cCFkekQNE9sEQ1L3OqPjw74zXy
LAiEPrdd9pmxHf+MZJWeMmtBTnnMiRQwFNygoFM3SBIiDul0rNPPlUTiNt0SkWlx
G1GSYEkcXlJleDwt6F1I1cvIN9Xyb8atKoMSJJTArZUq9LXW/SsYGaoTDwAeX0vt
5QSRQu9bHD28Ecpc3ShU5078pjWyMo6HtmodURMcJccXq9RxyZi6P/IO07qO4+T0
CsroliVyk5Ue3/70d0VS3yFXzGOH4ZOZZJeAf7Sn1ZIHr6ppq/LD9nZUdDllSA7H
BqczQMFBbdVFud8wXeNBJOU3r6zPtdBfKbNvxemWNGD5QrZVT2u5JPPukIcH0Fgy
MKPQ6zUPpKXvTaXt5RmSe9UvuqbBt5C/LlFRGW2XdcFGMbY9spouXXkECrBVejtg
ZWcxnm/M46BLRDx+5CgzNhIJnlsTI5j444XGwp9wzvJc8s0V+5KYF68pt1Drs9ba
deLMZQvRCGExwyJv7dhn
=BdXL
-----END PGP SIGNATURE-----

--s57gm4ng7ostbajs--


--===============4692424303984325288==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4692424303984325288==--
