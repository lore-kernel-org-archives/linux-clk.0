Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Fri, 5 May 2017 21:49:01 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-sunxi@googlegroups.com, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 03/10] pinctrl: sunxi: add A20 support to A10 driver
Message-ID: <20170505194901.w3el6zucqo6mcoab@lukather>
References: <20170504135006.16483-1-icenowy@aosc.io>
 <20170504135006.16483-4-icenowy@aosc.io>
 <20170504140220.26kguf3trz7ocylv@lukather>
 <83062089-19CD-4805-A6DC-2C25D75621FF@aosc.io>
 <20170504144152.34yzk424aqrizmbu@lukather>
 <52C75207-6F41-4B3F-8953-F4F040358792@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="36cjllx3bwydmei2"
In-Reply-To: <52C75207-6F41-4B3F-8953-F4F040358792@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--36cjllx3bwydmei2
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 04, 2017 at 10:45:11PM +0800, Icenowy Zheng wrote:
>=20
>=20
> =E4=BA=8E 2017=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=881=
0:41:52, Maxime Ripard <maxime.ripard@free-electrons.com> =E5=86=99=E5=88=
=B0:
> >On Thu, May 04, 2017 at 10:03:26PM +0800, Icenowy Zheng wrote:
> >>=20
> >>=20
> >> =E4=BA=8E 2017=E5=B9=B45=E6=9C=884=E6=97=A5 GMT+08:00 =E4=B8=8B=E5=8D=
=8810:02:20, Maxime Ripard
> ><maxime.ripard@free-electrons.com> =E5=86=99=E5=88=B0:
> >> >On Thu, May 04, 2017 at 09:49:59PM +0800, Icenowy Zheng wrote:
> >> >>  static const struct of_device_id sun4i_a10_pinctrl_match[] =3D {
> >> >> -	{ .compatible =3D "allwinner,sun4i-a10-pinctrl", },
> >> >> +	{
> >> >> +		.compatible =3D "allwinner,sun4i-a10-pinctrl",
> >> >> +		.data =3D (void *)PINCTRL_SUN4I_A10
> >> >> +	},
> >> >> +	{
> >> >> +		.compatible =3D "allwinner,sun7i-a20-pinctrl",
> >> >> +		.data =3D (void *)PINCTRL_SUN7I_A20
> >> >> +	},
> >> >>  	{}
> >> >>  };
> >> >
> >> >This means you're going to have two drivers probing for the same
> >> >device: this driver, and the old one. This is not ok, and probably
> >> >introduces some corner cases.
> >>=20
> >> The A20 driver is dropped in the next commit.
> >
> >Yes, and that is an issue for bisectability. Anyone that will checkout
> >between those two commits will have a broken kernel, and that is not
> >ok. Any commit should be in a working state.
>=20
> Squash them together?

I would simply remove the A20's def_bool in that patch.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--36cjllx3bwydmei2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAABCAAGBQJZDNctAAoJEBx+YmzsjxAg4xIQAJrW1cgOCctAhrWT1Aohwg00
gwTeYSOfFUWMGtkQMCw7hkbgcKxQ/dWrEiYCXMSvQ+ej6JJ+Kcac68qxgrO1DHlT
1pXuqPC9lJxnKUDKG+bAFlph1Cyp5+C4g33OHORFXqEpWMkkc2WxhQCglN+VGUx/
Rzt2ROZOjJT2wXQWyzllUM+TtitpB3ODHuDwumrYr/S+nY2r7La8wM9wSpF0RePK
sVzHYwJwQh74I4ltW/FDmOXL6eibRFLV5iV2rQuzOctrcfSvcNbZDL0VQNueO33M
oN/5CMe6iGDy0o8BIB9HWSYIZSGo1YvSpeZ6tVdv0Lh2KDI8Pgl0Pu31x6bgV5e1
gpwBh/HM0cQheQ8a0umKKBYv8hAxgubfib5OBYHvb0xer/fiB/7sOQ/B7FvS7lx/
AACc9LT1JSGYQUTYaGvBZD903ghVZz5kk/fX90ddf5Jw+AMyETEV+6B8Nc+TF0BS
j/j900tca+P53qCRmrq29sjeduZEk+eQ6wwOmmQqvNnOaUoj8Ur6lgsooc/Sp3LI
DhBcYxtnye8GeeJSMHsVuXJb2h/aHI1OnFSsIG4yIMBEzlnApd7y9N5phpxj9Bc/
KtAyN1Ajb/HFHVUzSfP0L0b9s7bf+kG/azNjDJM63OVMnYC3klRpZw0+yzjdiYkr
eGVdNViF03Vi+Gv3qKhQ
=yVMq
-----END PGP SIGNATURE-----

--36cjllx3bwydmei2--
