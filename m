Return-Path: <linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org>
Date: Wed, 7 Jun 2017 11:43:43 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Subject: Re: [PATCH v2 04/11] drm: sun4i: add support for H3's TCON0/1
Message-ID: <20170607094343.qqiwnu2mhmoi6jn7@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-5-icenowy@aosc.io>
 <3642057.oKT9kIlu8M@jernej-laptop>
 <493AC6F2-3CB3-48F5-9568-A34AA927238F@aosc.io>
MIME-Version: 1.0
In-Reply-To: <493AC6F2-3CB3-48F5-9568-A34AA927238F@aosc.io>
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
Content-Type: multipart/mixed; boundary="===============6451772994925303407=="
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+mturquette=baylibre.com@lists.infradead.org
List-ID: <linux-clk.vger.kernel.org>


--===============6451772994925303407==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="u4bgzgql5drlytxk"
Content-Disposition: inline


--u4bgzgql5drlytxk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2017 at 03:03:47AM +0800, Icenowy Zheng wrote:
> >You should also expand function sun4i_drv_node_is_tcon() at sun4i_drv.c
> >with=20
> >new entries, but I'm not sure if this fits in this patch.
>=20
> Instead I think it should be renamed to something like
> "sun4i_drv_node_is_tcon_with_ch0".

I'm not sure, or at least, it shouldn't make any difference, since
TCON without a channel 0 will not have an endpoint 0, so this will be
dealt with already.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--u4bgzgql5drlytxk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZN8rPAAoJEBx+YmzsjxAgLgkP/jCi7mph7T2Yibi16/5wDZyE
U6u5AMNVojZvk6oMUCtZOkke1Oz+PHdySw57euybpekFx4v+mQtx126hcyLmg+JY
3Lw09LhdUlEOunMBJ3WZ0KpjAM8BCcuYmNR6glPCJv211Df/YiaYPUi8/9ExkT4T
rFiuSPhZzlG58uMcIcQEp1PUhY4b0jwGI0oGahS/qXXKVAW9X2uy3ycItOwsBrsa
TG3w2BrABlkWaQrj/F7FBTTyqe09Gpoik+exA/vr+0Qj33K0jAYsrAHxban5s9Ka
636JoVcpdR6WNnsbcabNowIuFxWqOm5CFK0maX+LdvIKV4+ahrAO4ajC+b4iSBRr
9OUEMl2JSNCOE2A8b33PIRofkKj6kT7BBRaJ2AgqQyHlPqrOqO6nvC7aCtShh/Jg
jvHlZQTymd0N5zFKLhY+CimNhm7C5Sqqly1GmFMmdms4JDW4pI53HH5DTfNa3r45
NoW6odWs8DGwldSzRtmmXUiIHI4vlFqj/SRHofODu2eoAHuVydrkW0mFKorCCngh
RqurM0LGSWuC4G4mOZdM8afA9zhHtdnrCx45B9SxVwXzmZpTzXUyAMCnwLV/lpXh
nkmKA5nL50SAXiuFsWNoYIbyRkVWI96xigxfJwS48CFEUUB0SdadKmA3F36b43A0
KepMfWNrZyd9nJOkEugg
=J/cO
-----END PGP SIGNATURE-----

--u4bgzgql5drlytxk--


--===============6451772994925303407==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-arm-kernel mailing list
linux-arm-kernel@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

--===============6451772994925303407==--
