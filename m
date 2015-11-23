Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 23 Nov 2015 13:43:56 +0100
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Josef Gajdusek <atx@atx.name>
Cc: linux-sunxi@googlegroups.com, linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	gpatchesrdh@mveas.com, mturquette@linaro.org, hdegoede@redhat.com,
	sboyd@codeaurora.org, mturquette@baylibre.com, emilio@elopez.com.ar,
	linux@arm.linux.org.uk, edubezval@gmail.com, rui.zhang@intel.com,
	wens@csie.org, galak@codeaurora.org, ijc+devicetree@hellion.org.uk,
	mark.rutland@arm.com, pawel.moll@arm.com, robh+dt@kernel.org
Subject: Re: [PATCH v2 1/5] ARM: dts: sun8i: Add SID node
Message-ID: <20151123124356.GW32142@lukather>
References: <cover.1448263428.git.atx@atx.name>
 <b897b1c8741c8a871163b84d01b480f99329536d.1448263428.git.atx@atx.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1lE8Wy7Exphh2Vpg"
In-Reply-To: <b897b1c8741c8a871163b84d01b480f99329536d.1448263428.git.atx@atx.name>
List-ID: <linux-clk.vger.kernel.org>


--1lE8Wy7Exphh2Vpg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 23, 2015 at 09:02:48AM +0100, Josef Gajdusek wrote:
> Add a node describing the Security ID memory to the
> Allwinner H3 .dtsi file.
>=20
> Signed-off-by: Josef Gajdusek <atx@atx.name>
> ---
>  arch/arm/boot/dts/sun8i-h3.dtsi | 7 +++++++
>  1 file changed, 7 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun8i-h3.dtsi b/arch/arm/boot/dts/sun8i-h3=
=2Edtsi
> index 0faa38a..58de718 100644
> --- a/arch/arm/boot/dts/sun8i-h3.dtsi
> +++ b/arch/arm/boot/dts/sun8i-h3.dtsi
> @@ -359,6 +359,13 @@
>  			#size-cells =3D <0>;
>  		};
> =20
> +		sid: eeprom@01c14000 {
> +			compatible =3D "allwinner,sun4i-a10-sid";
> +			reg =3D <0x01c14000 0x400>;

The datasheet says it's 256 bytes wide, while the size here is of 1kB,
is it intentional?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--1lE8Wy7Exphh2Vpg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWUwoMAAoJEBx+YmzsjxAg/6oP/2zEs+uvvg+BMHaiwjVQ0WZf
1/+uNTq4q87jl9cl2L2jsNTf+V9hZhUOI4irZ4aDR55M06pTuoCH8l8WtMqALPtQ
3UK8bHI0mgFnxooFN+QrBUOwCnNPakGy1lmDfwOUVdu4+HFgG2IDRWDEysEsBdAD
WPni+DOjmFgkTxv05IgwR4e9xL+E+jzi4HR50izswRt9l/55DwxN/hE0iFsiED5y
S9k1wzQ1usjw7ilMYOR6fH0UUVgMkA5p4ooedjpFRK8sIOVC2oa9SjQ7mU3FZDa+
wBP5E3aUx6wqrAYILYeSLGdLhsbGRu/fhqGbtk0FSRXPZr2HBo3umk4hFnWjeR5f
JHDj9ihcPc/Ti2Mf902NPhpAkHal/fkKloipN6dz5QBHfoK56Ejnl1GWulA2zJUy
BGHbAqDKGnNwWpKDOJEaUxmBZCXN1PaE8XhyPZ/ajLvRQzo4+hZjE4w4hOwSmK6A
Dck0M63Hfgov8FaOrGStwMoZVB9MSYagYEnZH4Di2ubG7DBzMEdXHDvQB0HaflDg
uP5zXb9Y6+81GA9joitV/QGA467YYYxnA2eZbnQ9tNK4WoR31/GnDRZgguzuhg+l
uJWdDzyegheQYLt8tB7q57kTea5BRcx2HLPg6x+T4z/huLXppoPd+mCyHSfXOfte
SpD+8+n6jXw3v0fk5CJA
=OeCS
-----END PGP SIGNATURE-----

--1lE8Wy7Exphh2Vpg--
