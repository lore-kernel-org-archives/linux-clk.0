Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Mon, 27 Feb 2017 13:24:44 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v5 2/7] clk: sunxi-ng: rename sun8i-h3 driver to
 sunxi-h3-h5
Message-ID: <20170227122444.6523qu4wwm4ihlfx@lukather>
References: <20170226011956.53581-1-icenowy@aosc.xyz>
 <20170226011956.53581-3-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170226011956.53581-3-icenowy@aosc.xyz>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 linux-sunxi@googlegroups.com, Will Deacon <will.deacon@arm.com>,
 linux-kernel@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============8586608977300342273=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============8586608977300342273==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="e5suamyvr326w62f"
Content-Disposition: inline


--e5suamyvr326w62f
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Feb 26, 2017 at 09:19:51AM +0800, Icenowy Zheng wrote:
> As the CCU in the Allwinner H5 SoC is very similar to the one in H3,
> rename the H3 driver to sunxi-h3-h5 so that it can be extended with H5
> support.
>=20
> Trasitional header symlinks are created, to ensure current device tree
> files which included sun8i-h3-ccu.h can compile.
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>

Just like for the R40, I wonder whether this is needed at all. We have
a lot of other drivers that we don't have to rename to support new
SoCs. This is kind of weird to make an exception for this one only.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--e5suamyvr326w62f
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYtBqMAAoJEBx+YmzsjxAgATMP/RM5d+OXrk1RQWmIkbNmuFbG
0wDximpqngUEQD5kO+crTEtdWTFTBLeB+vXIE2SJBWrFdCRHY5r+XS7CqikYgWGj
g+ksATE7sqCm3bD+anAvs660cTvI8F6Kn+R0m5mnPjV0nekvdaHd40oaWwkj4Eyl
ufjXrB912F4Mi/h/zkFz3hd+PLM47fkqRy64741dNtaeFfTnWM8f4deME8WHmcLP
5cCsm5PVzcUwC2wCssP0dH1AaM5eB048ZjkWicvllUgXkQXczQDnS2ttxH9k8Aqm
OlwbqKVmkclf+U1k7wCAebAVHWJAQgWyc49KRaxPoei3FJxwgwRROQPFcJa/o0QC
yMXSXiI5icJNuhrrYQ+aXJFdkMtzrn4cNejktPTuJkem89rElzexRUNKROGtSYev
fRgsEhlvMROcdaUvsxrH39zcOWbUBrCIlbZS1WhZPLdycc51wxmltqfHRTlNMqNc
KYAiiBdplJQNK19A+HUmJsebfkl3erKV1VYUh8VWE/xD/0rR4jd7IxSdviT0gxRU
fdjapvjZFhOKyEQYzlymyTcDOxsGbybxq/5uaDMWzWa1icfpQX0Fb3LrAS8dGa15
P0d5IJs7XtJ83QJValsMU6s8ZkadEI0eMRnh4dGjba1f0VgT5HgUUbUwj1Hdg1XE
0tZd2Hh8SuRCVz5WLjyW
=L3jj
-----END PGP SIGNATURE-----

--e5suamyvr326w62f--


--===============8586608977300342273==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============8586608977300342273==--
