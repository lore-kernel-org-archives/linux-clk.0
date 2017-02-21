Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Tue, 21 Feb 2017 15:03:03 -0800
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [RFC PATCH 4/9] clk: sunxi-ng: support R40 SoC
Message-ID: <20170221230303.af5d5zh7smhgcwal@lukather>
References: <20170217173722.6477-1-icenowy@aosc.xyz>
 <20170217173722.6477-5-icenowy@aosc.xyz>
MIME-Version: 1.0
In-Reply-To: <20170217173722.6477-5-icenowy@aosc.xyz>
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
Content-Type: multipart/mixed; boundary="===============0018299746242578070=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============0018299746242578070==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ig6rlonk5fd6fmqx"
Content-Disposition: inline


--ig6rlonk5fd6fmqx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Feb 18, 2017 at 01:37:17AM +0800, Icenowy Zheng wrote:
> Allwinner R40 SoC have a clock controller module in the style of the
> SoCs beyond sun6i, however, it's more rich and complex.
>=20
> Add support for it.
>=20
> As the user manual is still not available, this driver is made with
> knowledge from clk-sun8iw11.c in the BSP kernel source.

Missing SoB.

Why are some patches tagged as RFC and some don't?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ig6rlonk5fd6fmqx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYrMcnAAoJEBx+YmzsjxAgF5gQAIAsEjN92nIftkuy//ehiRdo
wGJ/S+kX1+FLd1O3i6tPQXZU3nX+5oeDHBAPh++cAQ70f162eyro9PB10T7gXzv0
XNZzKu+mQf6tKNJfbcCfT4/vkt79VBv+jhOtBYtH0Er1eeaLfoNNlsJDQjDIjTO6
nsqRK0vmJvET4nHRxj/dHLkcAixbnjOKVKiREAN1uxyDowld3CEfgAnnidiibM/Y
JEJb0jXE6Uu4m+uH1MbiQUBLIHjO3Iw0gZ4RBbCjWTRtE0VqAyzSxgpBC/IPZRzK
MfJ13eZPcMI6NWEpGXANFOQq9yFzA64WJxS828uyOZbg1sQeaNw1F3ZMtiFoPod2
xHmc6bmNoEoanuvIp1FEq+/X4igpuC8JMtxSAYUQ0l+TSye3ifHUrBqnzkOoUokB
TRQLbfrcxEuKMParOPXeKrwJucsMxsnZM35PemnlnYOKdAtpoKzAzoOpIvM+DPRz
5GFHafF+BX+qGs8bEbPrGu/8CFiTK/4HzGjM/JWOQpzj5BYNQmGVCqonmSDzJEGN
VvdCINxizvUsyKMBPaVMZGnPyy9JG6qQfCBd/uwaS/w2m2alJecixfnl1U4Y5iDh
DuISxSDq8cQ/Gs6KXu+Fip66Lsb6nhHCZmoVYslELSA3+VCb3Z2/odtDYfD5LR5f
4USHaLbES9NlMq2tOKno
=M1W7
-----END PGP SIGNATURE-----

--ig6rlonk5fd6fmqx--


--===============0018299746242578070==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============0018299746242578070==--
