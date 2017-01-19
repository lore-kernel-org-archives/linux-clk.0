Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Thu, 19 Jan 2017 16:39:50 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Subject: Re: [PATCH v2 2/4] clk: sunxi-ng: add support for V3s CCU
Message-ID: <20170119153950.gosrmbm7jesxljyj@lukather>
References: <20170116180116.36729-2-icenowy@aosc.xyz>
 <20170116180116.36729-3-icenowy@aosc.xyz>
 <20170117090456.fgw6lpqgurwwcczj@lukather>
 <5926181484672894@web12g.yandex.ru>
MIME-Version: 1.0
In-Reply-To: <5926181484672894@web12g.yandex.ru>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Zepan <715805855@qq.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-sunxi@googlegroups.com" <linux-sunxi@googlegroups.com>,
 Jonathan Corbet <corbet@lwn.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chen-Yu Tsai <wens@csie.org>, Rob Herring <robh+dt@kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: multipart/mixed; boundary="===============4022787819240337964=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============4022787819240337964==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qdxlgc3jxhpx5d5n"
Content-Disposition: inline


--qdxlgc3jxhpx5d5n
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 18, 2017 at 01:08:14AM +0800, Icenowy Zheng wrote:
>=20
>=20
> 17.01.2017, 17:05, "Maxime Ripard" <maxime.ripard@free-electrons.com>:
> > Hi,
> >
> > On Tue, Jan 17, 2017 at 02:01:14AM +0800, Icenowy Zheng wrote:
> >> =A0V3s has a similar but cut-down CCU to H3.
> >>
> >> =A0Add support for it.
> >>
> >> =A0Signed-off-by: Icenowy Zheng <icenowy@aosc.xyz>
> >> =A0---
> >
> > Output from checkpatch:
> > total: 5 errors, 2 warnings, 3 checks, 857 lines checked
>=20
> I remembered some errors' code is directly derived from ccu-sun8i-h3.c,
> so I generated a patch file for "clk: sunxi-ng: Add H3 clocks" and run
> checkpatch on it:
> total: 4 errors, 5 warnings, 1159 lines checked
>=20
> Should I still get all errors fixed?

Yes, please.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--qdxlgc3jxhpx5d5n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYgN3CAAoJEBx+YmzsjxAg+4kQAJGtnOkz8mtmQ1HunD73n5fn
GmVp6pqSOFdXlZGE03OoUdrXQ7ytjG+UCma2FjsgdN845ux7Xag1QG9RAstDbhH0
WOHEJVOZSlQhPwE1mTvFEp0iTFvUtjA/3PDjFmatOBSjNITyP2sIDTv/GiAFeZxO
8xuF0vS98k8qrr7txtkkiaPAfGbx/wrFOo2+MlM/fvCBTAvR0sbOCX7eK1yoSdG8
wq7fbeGKrzcEXWktXGtAqkHkGlbmnv9PNGp71ZbnaXd1COVj4p0KCCQCfT0kPiy+
QUgRjcUPNISMoAkIEz39TgI2vWGKptQJiwFCagLkAkAZlZsoU+/8booF+sQQDkTf
hu8nR9S+qB6V3qqI0q7owPS/kXcDytWxCHZn/DzoFNRtdcOh5Fq0s8Hff1NOzEdv
MxkSUJYJX0ImLJMip2tDrzuYwrHDjnbo6bDlRGp3Ys7dTDKUh79KaZQP0pt+sd8M
039IogGChsgCMjf922jQCqqVtQixlOVcWJSS0EHC+dlIdPD73UHkultj1jAdy3Ym
oZ1zalgDRi7eGP7H0Fn+os2edIyxjLyLB5xXFdZZl1HlpcMGUd+ayN9bxZHtQn3G
8LbdN1fQYGoGosPA654/lgtxhFQtUktJiUR/Wz/aPBYsAnLNmMGHfcfYL/ylGsVJ
FmBjS21+/xPs8RVVal0G
=FNgZ
-----END PGP SIGNATURE-----

--qdxlgc3jxhpx5d5n--


--===============4022787819240337964==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============4022787819240337964==--
