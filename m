Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 7 Jun 2017 16:19:57 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 04/11] drm: sun4i: add support for H3's TCON0/1
Message-ID: <20170607141957.akonr7hmuwpt7hlt@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-5-icenowy@aosc.io>
 <3642057.oKT9kIlu8M@jernej-laptop>
 <493AC6F2-3CB3-48F5-9568-A34AA927238F@aosc.io>
 <20170607094343.qqiwnu2mhmoi6jn7@flea.lan>
 <52F9F9C7-9A9C-435D-A0AF-FDD4317DAD69@aosc.io>
MIME-Version: 1.0
In-Reply-To: <52F9F9C7-9A9C-435D-A0AF-FDD4317DAD69@aosc.io>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org,
 Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
 linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Chen-Yu Tsai <wens@csie.org>,
 Rob Herring <robh+dt@kernel.org>, Icenowy Zheng <icenowy@aosc.xyz>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============7293990137668584190=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============7293990137668584190==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="kthojeegoisboeih"
Content-Disposition: inline


--kthojeegoisboeih
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 07, 2017 at 05:44:56PM +0800, Icenowy Zheng wrote:
> =E4=BA=8E 2017=E5=B9=B46=E6=9C=887=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=885=
:43:43, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=B0:
> >On Mon, Jun 05, 2017 at 03:03:47AM +0800, Icenowy Zheng wrote:
> >> >You should also expand function sun4i_drv_node_is_tcon() at
> >sun4i_drv.c
> >> >with=20
> >> >new entries, but I'm not sure if this fits in this patch.
> >>=20
> >> Instead I think it should be renamed to something like
> >> "sun4i_drv_node_is_tcon_with_ch0".
> >
> >I'm not sure, or at least, it shouldn't make any difference, since
> >TCON without a channel 0 will not have an endpoint 0, so this will be
> >dealt with already.
>=20
> But that will prevent new coders from add CH1-less TCON
> compatibles to this function.

Why? We already have such TCONs (like the A33's, or V3S') in that
function.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kthojeegoisboeih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZOAuNAAoJEBx+YmzsjxAgSo0P/0hoSsKFQvbaW7yFKg12VPkj
bUgzJcndyoL13J3BBZsMa8jHvWvlGYBP5VwTfLLxlsGxxauaDNOmvgh/v2hAckoh
8fmD7piZeb5rc0nPdnhCgTLYuZ2w4w+7xRtLG9Ey5LYAECfClFUaDWbDShypRJLB
VmzBF+5MTlY9VvSU/B/ZsZPGWeVyVNBz1ykJav9cBEMf503biyEDLli9/s4kH/xd
+ev0hE0CdP5U/AzeCofbvmf0wxt5C91nBNgNBx7fdzZcwmwzNrimU1ze0bkBkPgu
2/CToSI7//jTkxBGwb1jYaBzt93ewohfGbLxd4TDWUlYFLAQoKKbjbQcEJjouwqr
+6p812H0fKkIjmNy9t6f0mBepHYUewbhGhxlFNufX24u28rTfCUTSEK/6fh5iFxE
gEIl4F+C8VoqgTcLVkzdC2/AKwAqDjOquO63Nt/CwBp7HVLB5XDBKolmYLk2ZZWo
kIa1dcrxLmxGynO/o01IekgIlwr2CjWg0Lq+wLlV0vr61blFQeSZDiHYSP3eIK1V
D9KuGI19FpCH+msiXWheJL8rejIUjcKWUznFYa6zd13lObYfntyRBGbU9qqfsrIa
fnXQpnUJacLfju4Lfz7Iw1kGzILetJ1bB3cfv3MMtXVSh/UA+jYdmrAHrz9OVB2l
TGatpdCwrIuo4RxydG4X
=df3h
-----END PGP SIGNATURE-----

--kthojeegoisboeih--


--===============7293990137668584190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============7293990137668584190==--
