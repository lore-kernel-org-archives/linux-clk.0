Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 1 Feb 2016 20:46:26 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Jens Kuske <jenskuske@gmail.com>,
	Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Vishnu Patekar <vishnupatekar0510@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Jean-Francois Moine <moinejf@free.fr>
Subject: Re: [PATCH v3 2/2] clk: sunxi: Refactor A31 PLL6 so that it can be
 reused
Message-ID: <20160201194626.GH4652@lukather>
References: <1454008958-12655-1-git-send-email-maxime.ripard@free-electrons.com>
 <1454008958-12655-2-git-send-email-maxime.ripard@free-electrons.com>
 <56AB38C6.2010909@gmail.com>
 <CAGb2v67v6-BCPp2u7vieCGnCAsHFv4XjnRXvfT1vZNHc_Ok0UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Q6STzHxy03qt/hK9"
In-Reply-To: <CAGb2v67v6-BCPp2u7vieCGnCAsHFv4XjnRXvfT1vZNHc_Ok0UA@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--Q6STzHxy03qt/hK9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 29, 2016 at 06:14:48PM +0800, Chen-Yu Tsai wrote:
> >> @@ -173,7 +173,7 @@
> >>                       #clock-cells =3D <0>;
> >>                       compatible =3D "allwinner,sun8i-h3-ahb2-clk";
> >>                       reg =3D <0x01c2005c 0x4>;
> >> -                     clocks =3D <&ahb1>, <&pll6d2>;
> >> +                     clocks =3D <&ahb1>, <&pll6>;
> >
> > According to the datasheet AHB2 really has PLL6 / 2 as parent, not PLL6
> > directly.
>=20
> Thanks for the save. So we should keep pll6d2_clk.

Indeed thanks for the review. Will fix for v4.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Q6STzHxy03qt/hK9
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWr7YSAAoJEBx+YmzsjxAgL+QP/3rbtYu/x5swAamLGnYZ1Bc2
HYI4yOzYBWFKY7BKhdKy+ztQFKB88QmHF1apC8J/k96xXiRAjVpHuZ7gKMvrNqK9
AwOfdrjVQOV4JbvYRkGld9UlkwUdEMJkYX/ZoimsRrJv5Q1heNZL6W8BMvBIGrLu
BEn456fdWgqnDM9SQ/05Ur69cFSU41tEuk3TEMHV4+2K515k4VIXnyyAORKIpQaR
Ugav/OlgyqCeKdCxkMacyExVKeHOQUuUTkaDz9mbHq1ETwtCK0o8H1x0JX24fA0s
NSzAqSdE+ZWIxe44ssmSBPU/HfeiT4qK/vACDO0O1hEtF/TO4J4kf+MtG8pDYVQn
Z9xcESEJe8RTUBcW3t/jpmOLjIkD5G//ABQKk0Ehdiaq2lcf6CNynWzWq0RTbVG0
Xq1sjJjqVbfgC+Q10r0pErR2dNIkQlXF7JCl49/E470gUK0Et0qVPlZSRElEFP81
MjgB2i1CgIl4zrOJtEUl/YZ5zkeHavJKPnXVF7Qr+aTJD3jB37p8EwjvZFiD8n2x
sk+3RkoerU0jDa8iXBY/MWsH9Mwav6YBd4nKkfrq1u33F8yLmUoOHuqG6ayyz8db
Tsd3Nkb6mn4dWQXY//wjvwUmoPWSyKr4Dt+V1HSYIWxw7Nwr6ff+0bw5M5qx6yIT
/s+Dgu4b6XEOHbGVC01T
=CDhR
-----END PGP SIGNATURE-----

--Q6STzHxy03qt/hK9--
