Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Tue, 7 Feb 2017 16:56:05 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.xyz>
Cc: Jaroslav Kysela <perex@perex.cz>,
        Vinod Koul <vinod.koul@intel.com>, linux-gpio@vger.kernel.org,
        dmaengine@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Andre Przywara <andre.przywara@arm.com>,
        devicetree@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        alsa-devel@alsa-project.org,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@googlegroups.com
Subject: Re: [linux-sunxi] Re: [PATCH v3 04/10] clk: sunxi-ng: add support
 for Allwinner H5 SoC
Message-ID: <20170207155605.f2k44gr56ywehz3t@lukather>
References: <20170207000838.8UJeKISe@smtp2p.mail.yandex.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ncoqq3u2mcjsuyi5"
In-Reply-To: <20170207000838.8UJeKISe@smtp2p.mail.yandex.net>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--ncoqq3u2mcjsuyi5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 30, 2017 at 10:02:04PM +0800, Icenowy Zheng wrote:
> > >=A0 static struct ccu_reset_map sunxi_h3_h5_ccu_resets[] =3D {=20
> > >=A0 [RST_USB_PHY0] =3D=A0 { 0x0cc, BIT(0) },=20
> > >=A0 [RST_USB_PHY1] =3D=A0 { 0x0cc, BIT(1) },=20
> > > @@ -791,6 +910,7 @@ static struct ccu_reset_map sunxi_h3_h5_ccu_reset=
s[] =3D {=20
> > >=A0 [RST_BUS_UART2] =3D=A0 { 0x2d8, BIT(18) },=20
> > >=A0 [RST_BUS_UART3] =3D=A0 { 0x2d8, BIT(19) },=20
> > >=A0 [RST_BUS_SCR0] =3D=A0 { 0x2d8, BIT(20) },=20
> > > + [RST_BUS_SCR1] =3D=A0 { 0x2d8, BIT(21) },=20
> >
> > That reset line is not valid on the H3.=20
>=20
> So I should split a H3 reset array and a H5 one?

Ideally, yes.

> (I modelled after ccu-sun5i.c, which shares one reset array)

They all share the same reset lines.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--ncoqq3u2mcjsuyi5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYme4VAAoJEBx+YmzsjxAgMQ0QAJ6jQL66cPjxo42RqrezKJnY
hX5LcNeVppi/6innzyewHL04c+w7w8df5f/yj8s+DPu3EMo4Bl/mgaWaUROENvOV
bINqyZTyUCEzoI5EuIEcBfjeNJMluE/u6k/2pAl5f8EqeywfaJutnrVOxVy2JnfS
rYesN2fk6839XS6alMojcgAaPjV2nqO10e+OhYpaLgRY1bl6D23qpiGO4126aJW+
Q5GtWfPwMUnkNmbGcvNtmm0PwvH4Bo1B/27d372PEI9V2IiRgp3gyT8Nm+UIRPEd
eeevL8MEtWrbhcoKeWwR4T5sf1tgoKMBN0cNjiWwbTgXr71cUNJ9gVzV+tuZHcnn
FSRpTe3B8bxI0M43IBjOzKxri4V9cN/2t1jCu6dMBI6i54q/vrbNLHb1OskgJe6P
A+Lt24psQ7YC66EqgKJzpZx2yVdQ7xDCC6ZGRSNA0XA6WC4jZfYGZvZEF5wMz5HS
XUdspVIeYkSvZetQufG40a1Fvq6AARE8rH8Mvd/LOuwaxz29xfxlFfc+MKSvPkW/
54jIxkSgZGaJbm4NYD2IUfBJAvxiq5UUi2Mq04urMBKmqWdT1XIRgEl4TEWxa4E1
TCcgd+wf8OVAFtnXj5/EyjWUNJslcFnPH+SYWjqkUtzE1DvP6Yikzmzp9IeGTcdR
v6Ik84G2gvLX5P/g5SN3
=usYJ
-----END PGP SIGNATURE-----

--ncoqq3u2mcjsuyi5--
