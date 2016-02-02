Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 2 Feb 2016 14:13:47 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Vishnu Patekar <vishnupatekar0510@gmail.com>
Cc: robh+dt@kernel.org, corbet@lwn.net, pawel.moll@arm.com,
	mark.rutland@arm.com, ijc+devicetree@hellion.org.uk,
	galak@codeaurora.org, linux@arm.linux.org.uk, emilio@elopez.com.ar,
	jenskuske@gmail.com, hdegoede@redhat.com, wens@csie.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-sunxi@googlegroups.com,
	linux-gpio@vger.kernel.org, linus.walleij@linaro.org,
	mturquette@baylibre.com, sboyd@codeaurora.org, patchesrdh@mveas.com,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 03/14] clk: sunxi: add bus gates for A83T
Message-ID: <20160202131347.GP4652@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-4-git-send-email-vishnupatekar0510@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="/NwG7NuG0/W8LcLh"
In-Reply-To: <1454203266-4450-4-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--/NwG7NuG0/W8LcLh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 31, 2016 at 09:20:55AM +0800, Vishnu Patekar wrote:
> A83T has similar bus gates that of H3, including single gating register h=
as
> different clock parent.
>=20
> As per H3 and A83T datasheet, usbhost is under AHB2.
>=20
> However,below shows allwinner source code assignment:
> bits: 26 (ehci0), 27 (ehci1), 29 (ohci0) =3D> AHB1 for A83T.
> bits: 26 (ehci0), 27 (ehci1) =3D> AHB1 for H3
> bits  29, 30, 31(ohci0,1,2) =3D> AHB2 for H3.
>=20
> until, this confusion is cleared keep it H3 way.
>=20
> Signed-off-by: Vishnu Patekar <vishnupatekar0510@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/sunxi.txt | 1 +
>  drivers/clk/sunxi/clk-sun8i-bus-gates.c           | 2 ++
>  2 files changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/clock/sunxi.txt b/Document=
ation/devicetree/bindings/clock/sunxi.txt
> index 7f19ef5..4514d77 100644
> --- a/Documentation/devicetree/bindings/clock/sunxi.txt
> +++ b/Documentation/devicetree/bindings/clock/sunxi.txt
> @@ -59,6 +59,7 @@ Required properties:
>  	"allwinner,sun6i-a31-apb2-gates-clk" - for the APB2 gates on A31
>  	"allwinner,sun8i-a23-apb2-gates-clk" - for the APB2 gates on A23
>  	"allwinner,sun8i-h3-bus-gates-clk" - for the bus gates on H3
> +	"allwinner,sun8i-a83t-bus-gates-clk" - for the bus gates on A83T

Please order them alphabetically next time.

Applied with the fix, and the Acked-bys

thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--/NwG7NuG0/W8LcLh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsKuLAAoJEBx+YmzsjxAgwP8P/1w03TCL2uPuT1wXayHRo8yW
5ahpUzgHEEyXxY1pqkh3av03MUSOp8ri1pTDaIMRFMc5VpF/E8pByi4n9W9ZJiKN
TjiwJH6fhG7wDTSjFOw0pdNgtcykYr61Aic2pBcR1jXdnANB3MKjJ8c0ijL/lEM6
Z/6TlRpH/V8ZJdgxPmnMiUUzoOzZmRDldRrx6H3BGg2HCH+TBmLNUbqV/cegKnoQ
/JHCpc+tJKoZcq+2CE3SMsCBs83Gl/FCPz0AAIaWcw56KmrBv2ORxSRfXvQ5BBJF
fgX73oogWz3RnezWy51DAOv2i54y3Jvz5wNjIJn+VzuJhU3B61uh6hjbakEjNoRy
Jti8fbL1Z6WU0SdF7RR/A21OG8KpEvivqeKSmkp7y6mBNikJVZR7rIDzfgaeMeuW
kgZ99+dHK1g3IKg+oGCIJjMhz71UbKEjPdp7rgk1aRKwP1YgSOt86hZ21x98czRy
qeRgxFrWuhQpbgnOLIdVWCjWSKTIAsWtH0cKK7Egh+Ma6VhwUE+fwvAlKsq1jUlL
leUBADgdvYLLwkG1SvFarH99+RlxxsPt+7+kDzxrTrUs53BJ73OKCvS3ZYdv4ph1
BAq6kG76+WkEK4pKfIPU7ahJXv2KLqJYtu2Vik1g7nVRiNwxvKq5dv6fB9HCI7Z9
NmZb976eOllAKUwk+QBs
=zg08
-----END PGP SIGNATURE-----

--/NwG7NuG0/W8LcLh--
