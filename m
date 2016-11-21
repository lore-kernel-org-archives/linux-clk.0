Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 21 Nov 2016 23:04:14 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 9/10] ARM: sun5i: Convert to CCU
Message-ID: <20161121220414.bqsdjtpsjsq5tefs@lukather>
References: <cover.326f50aecc25fbe292184527b52a1e3172aba9cf.1478625788.git-series.maxime.ripard@free-electrons.com>
 <4046893c1810045bac3eeb1ea3a35c5771d250e0.1478625788.git-series.maxime.ripard@free-electrons.com>
 <CAGb2v64vOePTQ0a7cmSmimVrkYOxxRwRZnGbsC2ZQ4Su59oJaQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="kzzvkrmn7zojorgc"
In-Reply-To: <CAGb2v64vOePTQ0a7cmSmimVrkYOxxRwRZnGbsC2ZQ4Su59oJaQ@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--kzzvkrmn7zojorgc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 13, 2016 at 11:01:27PM +0800, Chen-Yu Tsai wrote:
> >                         compatible =3D "allwinner,sun5i-a13-tcon";
> >                         reg =3D <0x01c0c000 0x1000>;
> >                         interrupts =3D <44>;
> > -                       resets =3D <&tcon_ch0_clk 1>;
> > +                       resets =3D <&ccu RST_LCD>;
> >                         reset-names =3D "lcd";
> > -                       clocks =3D <&ahb_gates 36>,
> > -                                <&tcon_ch0_clk>,
> > -                                <&tcon_ch1_clk>;
> > +                       clocks =3D <&ccu CLK_AHB_LCD>,
> > +                                <&ccu CLK_TCON_CH0>,
> > +                                <&ccu CLK_TCON_CH1>;
>=20
> Just curious, is CLK_TCON_CH1_SCLK ever used?

Yes, this is an intermediate clock for the channel 1 clock.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--kzzvkrmn7zojorgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBCAAGBQJYM29aAAoJEBx+YmzsjxAgbFcQAJzjss5chc2doiInTHVjBQBl
RRbZsOeCxOdB8EYrGVs7sSzdDFbQ4qLPKOi+wTE6lZ9DjlyPPdv+JYf/qCvvr80i
LMIGQVsDrS4/nUemGw/yW/wkRkWilDDH4Qlsprhq+TIlnDA7qZoD6sOEVzjpzYQE
ijquTgg6EpYuWiQYQnmA9QEjLpmJM6Vqi8nW6J90x1CkLhPiJrPdTy98E/qAjtdi
QImZS1j44YnQ2lIrMpi5qEFSvrVtVxO2kfnfDhjs7e4DEaa29IViZ/oAjtA4QSFc
5YMXz9FFalW641nlspYPxDEEjzlYNpU5crJcEAR9dLBjcL1pcihYVeOkBL5E8h6U
srRZyqeghAQjXjNsd1M3iNMTyEvGM8qRWRu0+qlvmpOzx8z9CBRJOhcDBgOy6mRc
EhBvBJ6IRSN3pcNMJYmJzryFUC2ibPH7EfHCLe4pMYkNqRmK/GgiKSgP0UAGNV/f
9q0nFwmJz8lwgK9Sg5/FK0GLHrYRXXQ3a98JgH/FoWWV0EeUAIz0Q24kN79fOUps
rzOQ5Nsrqa6gzQ+D7ppZHZV4+gRVFim2spT4qPu1TbRDZBHI+1ybplON9ROP2+rJ
AzxfrR4DL3wAnF6zb4hVb4hlezjuJZ2KyD/6H7zzw1N7nN+I7M2itUpG+/AQQTX5
W6MbkDAcsnWjwgtOJD17
=W5gz
-----END PGP SIGNATURE-----

--kzzvkrmn7zojorgc--
