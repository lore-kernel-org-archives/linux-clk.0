Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 2 Feb 2016 14:18:51 +0100
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
Subject: Re: [PATCH 06/14] ARM: dts: sun8i-a83t: Correct low speed oscillator
 clocks
Message-ID: <20160202131851.GR4652@lukather>
References: <1454203266-4450-1-git-send-email-vishnupatekar0510@gmail.com>
 <1454203266-4450-7-git-send-email-vishnupatekar0510@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="YkilVOb9qhI0mB+X"
In-Reply-To: <1454203266-4450-7-git-send-email-vishnupatekar0510@gmail.com>
List-ID: <linux-clk.vger.kernel.org>


--YkilVOb9qhI0mB+X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

1;4002;0c
On Sun, Jan 31, 2016 at 09:20:58AM +0800, Vishnu Patekar wrote:
> From: Chen-Yu Tsai <wens@csie.org>
>=20
> The A83T does not have a 32.768 kHz low speed oscillator, either as
> an external crystal or input. It has a 16 MHz RC-based (inaccurate)
> internal oscillator, which is then divided by 512 for a clock close
> to 32 kHz.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun8i-a83t.dtsi | 21 ++++++++++++++++++---
>  1 file changed, 18 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-a83t.dtsi b/arch/arm/boot/dts/sun8i-=
a83t.dtsi
> index 8d27b63..45b725c 100644
> --- a/arch/arm/boot/dts/sun8i-a83t.dtsi
> +++ b/arch/arm/boot/dts/sun8i-a83t.dtsi
> @@ -118,6 +118,7 @@
>  		#size-cells =3D <1>;
>  		ranges;
> =20
> +		/* TODO: PRCM block has a mux for this. */
>  		osc24M: osc24M_clk {
>  			#clock-cells =3D <0>;
>  			compatible =3D "fixed-clock";
> @@ -125,11 +126,25 @@
>  			clock-output-names =3D "osc24M";
>  		};
> =20
> -		osc32k: osc32k_clk {
> +		/*
> +		 * This is called "internal OSC" in some places.
> +		 * It is an internal RC-based oscillator.
> +		 * TODO: Its controls are in the PRCM block.
> +		 */
> +		osc16M: osc16M_clk {
>  			#clock-cells =3D <0>;
>  			compatible =3D "fixed-clock";
> -			clock-frequency =3D <32768>;
> -			clock-output-names =3D "osc32k";
> +			clock-frequency =3D <16000000>;
> +			clock-output-names =3D "osc16M";
> +		};
> +
> +		osc16Md512: osc16Md512_clk {
> +			#clock-cells =3D <0>;
> +			compatible =3D "fixed-factor-clock";
> +			clock-div =3D <512>;
> +			clock-mult =3D <1>;
> +			clocks =3D <&osc16M>;
> +			clock-output-names =3D "osc16Md512";

We've been using a dash to separate between the clock and its divider
on other SoCs.

I changed that and applied the patch.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--YkilVOb9qhI0mB+X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWsKy7AAoJEBx+YmzsjxAg28wP/1WWgz1hA75JUiy8D6k4i+67
ylz+gt0v+jMJfQLJwBjtD9NlyEdyEM2q5jkeh8i+H8ffCi2IlRmhZpv8Pco0GFL+
ZE2D+e629ygBJRr2rp5Ev5006w3FFKJKHjucpD1gyqlASyUHYTWD+JgOOQWHAsr2
A3sr3Z9YNcgjRVDQoYZDz0xjMfSYdK8eDnnkZ+iHA9slr+Bfmf7no0+HlaqTk1w9
7+Iy3wf9wT51DOoKx3IUkeekIzunq/JGu6XD+MYjISV8MNwJ98M2k23kfp1T6RKc
gzX0qnM5wGJhbZrJdqCQZazaPiT95YBEajl2csE9PaVB/Nc+69ui+g7I3COuBvnR
sT8j6N5v0y2RyaE2Jgpp+gmXXMOAAJPNbo3hmgAIgfmAeS7ig9R2QlJvmYBst74J
S3E3hR4H8D++O0RV1NnPj2onJiW/hAphEn+ParQ+GbpgwvdOlLG9L7HRwApEzDS2
Lued4A22G9tb9rYtrpuMYvIQv/tSXHrz+95J+c1Km/Ns1vO9skcjl7AQLy3QnlqJ
Cq3V9QOr1e3usdBQCFT6M3CgY+slpdGlC/R1q1hRGvYIADNWpYuPw6AbCJTb97m/
2HJYa7vkq7Uq0slExCaL9LyEUQcAuMP76Ru/WYlWtYNEPufevXfn7fUdZKdR+9mL
2Y7jQEej1pCt8RgT4HgR
=WaWw
-----END PGP SIGNATURE-----

--YkilVOb9qhI0mB+X--
