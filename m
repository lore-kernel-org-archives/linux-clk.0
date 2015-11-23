Return-Path: <maxime.ripard@free-electrons.com>
Date: Mon, 23 Nov 2015 13:38:37 +0100
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
Subject: Re: [PATCH v2 4/5] dt-bindings: document sun8i_ths
Message-ID: <20151123123837.GV32142@lukather>
References: <cover.1448263428.git.atx@atx.name>
 <20e229f191031b0b0bff96dee118d1f2d988d7b3.1448263428.git.atx@atx.name>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Fh5LqGQwq8YwuKb/"
In-Reply-To: <20e229f191031b0b0bff96dee118d1f2d988d7b3.1448263428.git.atx@atx.name>
List-ID: <linux-clk.vger.kernel.org>


--Fh5LqGQwq8YwuKb/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Nov 23, 2015 at 09:02:51AM +0100, Josef Gajdusek wrote:
> This patch adds the binding documentation for the sun8i_ths driver
>=20
> Signed-off-by: Josef Gajdusek <atx@atx.name>
> ---
>  .../devicetree/bindings/thermal/sun8i-ths.txt      | 31 ++++++++++++++++=
++++++
>  1 file changed, 31 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sun8i-ths.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/sun8i-ths.txt b/Do=
cumentation/devicetree/bindings/thermal/sun8i-ths.txt
> new file mode 100644
> index 0000000..67056bf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/sun8i-ths.txt
> @@ -0,0 +1,31 @@
> +* sun8i THS
> +
> +Required properties:
> +- compatible : "allwinner,sun8i-h3-ths"
> +- reg : Address range of the thermal registers and location of the calib=
ration
> +        value
> +- resets : Must contain an entry for each entry in reset-names.
> +           see ../reset/reset.txt for details
> +- reset-names : Must include the name "ahb"

If you have a single reset line, you don't need reset-names.

Thanks!
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com

--Fh5LqGQwq8YwuKb/
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJWUwjNAAoJEBx+YmzsjxAg7RQQAKw7zTmUQW0gQ8sKDwxfAHgh
NwZ9SfCJhICnK5Q4r2/YdXXEq/lqHV+rFCM+jRnCRl83M7C1OnKAmH9GVmkYXzbE
EIadUEcrMvO6iqzNUcnoKzT0nfBcX+JxjIMB5tg0JtXN/cakxEnigd/uRdTh4far
F2RQzoGOx6Myeu6xmTsDzxcz4UfwgbM85lpXvwScvdLGHzedbjRk3firSiA+Z5xY
+bOTQoUq5qL1MRWbthkjkgVP/Naw884ZPIcYlvRdZ+KYFPS6UVkl87/AJgvR+ko0
RmF3wk82WKFnjYUeqOSZfZpV9+iRJlTc2hH8jQ16hREYNcSdwNll/03QsOCurQ76
hgagbqEe7M8mlFtLFkxG0THdHdXBqvaEF9IThr/JvY8r4dJOwt0EzT/jHHNms7Ew
mfl+cnZS7Hz+DMYlUyV0hCTZIsyt4LQGsbfx35yaHprn9OB/JEAspPN7VAaSH8i6
bPLo7A73ihHXcoAFA94NnYLFmEBAfVGLM4u6kxW37iglf1v9fnHILdZyaNVV9fq7
HeZWvvUuot9lWhMAFznNefksHlLZtvNAglDGoDoCRFm9QMsepvPsJLOiHwPkofAO
WH8/10p4KkHzhB+gdEn5okfG51d0ZJVuN5f3+Wew0Jhsy/66P3Y8pm3k0atSjfqH
5Sg13VLPGBl9z+UpBurs
=75IQ
-----END PGP SIGNATURE-----

--Fh5LqGQwq8YwuKb/--
