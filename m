Return-Path: <maxime.ripard@free-electrons.com>
Date: Fri, 2 Jun 2017 21:42:19 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Chen-Yu Tsai <wens@csie.org>
Cc: David Airlie <airlied@linux.ie>, Rob Herring <robh+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH 19/19] ARM: sun6i: a31s: Enable HDMI display output on
 the MSI Primo81 tablet
Message-ID: <20170602194219.hiajr7dt2oikm52q@flea.lan>
References: <20170602101024.18940-1-wens@csie.org>
 <20170602101024.18940-20-wens@csie.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tpb4lttli73lzwcx"
In-Reply-To: <20170602101024.18940-20-wens@csie.org>
List-ID: <linux-clk.vger.kernel.org>


--tpb4lttli73lzwcx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 02, 2017 at 06:10:24PM +0800, Chen-Yu Tsai wrote:
> The MSI Primo81 tablet has a micro HDMI connector at the bottom.
> This is connected to the SoCs HDMI output.
>=20
> Enable the display pipeline and the HDMI output.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@csie.org>
> ---
>  arch/arm/boot/dts/sun6i-a31s-primo81.dts | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/sun6i-a31s-primo81.dts b/arch/arm/boot/dts=
/sun6i-a31s-primo81.dts
> index f3712753fa42..26154b2f87a3 100644
> --- a/arch/arm/boot/dts/sun6i-a31s-primo81.dts
> +++ b/arch/arm/boot/dts/sun6i-a31s-primo81.dts
> @@ -52,17 +52,42 @@
>  / {
>  	model =3D "MSI Primo81 tablet";
>  	compatible =3D "msi,primo81", "allwinner,sun6i-a31s";
> +
> +	hdmi-connector {
> +		compatible =3D "hdmi-connector";
> +		type =3D "c";

Should we add a connector type for this one?

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--tpb4lttli73lzwcx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZMb+bAAoJEBx+YmzsjxAgecIP/iHqNWdDG3ImuYHcRBlCnO/1
56ubtyQczLJK0/49C0gjoNv76lkjc6z35zJE+7k0eAfuvbYL2f4ip25ul+0hzcUd
SYQcDsoid15Zd8M81ohp89w6Bi/PLtGuEVGSvqeQpCuOO5RPvtzDOukt4KaxHZQA
8Ih6F6zNlsTYNbWoYBYe3Of/v3UZDM07BCaovw5bOhdGrLegplM+DcFdkqAxwFDR
ozoaUgztE21liiPe1MWQMbMftdYcXS4oW82gtwSRpULyb9NB6ok5PQ8fjdVxVepy
1nnSZtbL4ESwguzAnZOQic1u/K1t81yvX0j269O2osBI4PhCxywbFvTRmmT5jaaT
XE47DRsxDr84UeLAeDL1B5L5R1hF0K5aQIRo21JCOkdPkRYmZyYmgdmNA6AMs+VY
IZDzA99z1ZXbLRv/0B1eINyshBVOgC4Kw9jcdgE+UuUlf3BDhXxUF1ZdbITjO1ul
nXSfbVpQl6mUJL/Qyrx7/Muy+wY34qJxCF88Jf6w6Gaz3HnHeIpMVNvQ+FXK167M
VWSIbCmLAziqkNqeXSqrjnE0bfmuoFAyKxfpZK8q1pgRVihLxog0MGDxAgJdn9Pm
/PA+76FQa9+TXTDfTcctsO2b8/7nOpdIaFh9ippFrFjM549MzHmsP7HbmZwS1qfd
APC12Z17DTfIo8L5Egv9
=t+yq
-----END PGP SIGNATURE-----

--tpb4lttli73lzwcx--
