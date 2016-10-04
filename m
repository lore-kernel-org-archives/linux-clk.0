Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 4 Oct 2016 18:24:30 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: =?iso-8859-1?Q?Myl=E8ne?= Josserand <mylene.josserand@free-electrons.com>
Cc: vinod.koul@intel.com, wens@csie.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, lgirdwood@gmail.com, broonie@kernel.org,
	perex@perex.cz, tiwai@suse.com, lee.jones@linaro.org,
	mark.rutland@arm.com, robh+dt@kernel.org,
	linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-sunxi@googlegroups.com, thomas.petazzoni@free-electrons.com,
	alexandre.belloni@free-electrons.com
Subject: Re: [PATCH 08/14] dt-bindings: sound: Add sun8i analog codec
 documentation
Message-ID: <20161004162430.GQ5228@lukather>
References: <cover.1475571575.git.mylene.josserand@free-electrons.com>
 <06ea14939405c3eb0fb9be655d26ee564a04a53d.1475571575.git.mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="p2u4WfPhYOuYlOsk"
In-Reply-To: <06ea14939405c3eb0fb9be655d26ee564a04a53d.1475571575.git.mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--p2u4WfPhYOuYlOsk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Oct 04, 2016 at 11:46:21AM +0200, Myl=E8ne Josserand wrote:
> Add the documentation for dt-binding of the analog audiocodec
> driver for SUN8I SoC.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>
> ---
>  .../devicetree/bindings/sound/sun8i-codec-analog.txt | 20 ++++++++++++++=
++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/sun8i-codec-a=
nalog.txt
>=20
> diff --git a/Documentation/devicetree/bindings/sound/sun8i-codec-analog.t=
xt b/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
> new file mode 100644
> index 0000000..a03ec20
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sun8i-codec-analog.txt
> @@ -0,0 +1,20 @@
> +* Allwinner A23/A33 Analog Codec
> +
> +This codec must be handled as a PRCM subnode.

Like Mark was saying, you should probably reference the sun6i-prcm.txt
binding here

> +Required properties:
> +- compatible: must be either "allwinner,sun8i-codec-analog"

Our compatible prefix is <family>-<soc>, and using the older SoC that
introduced that block.

In this case, that would be sun6i-a31, I think?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--p2u4WfPhYOuYlOsk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX89e+AAoJEBx+YmzsjxAg4vIP/A+feM0Z7SRv5eTtt5g+yqeA
RG/N/G1nJt32ENjJvDAMh67S5dUWLcb+4RsmdxfDkdQHjFBVxfCVINI/2/mxo1B2
0MdSlvMKvWgZsUFUzVpRf9Lmx7/u7zzljcK+z+vvF8mnLGfwB0a6T5j2JIzAWrrw
218qh4xkDJpwdxseKgqFAS/J0aH2j9cRU/woxk8mwGyFCMQiVrzKS0j0+I/sc8jC
BtTJPqOIEUCspqGQzg0mDIMsgMbdio23J1F5guOqs43BE9tDKCofaob2PACrVcvj
ze9IlAd7YnPUma3ijOCEO7iAkhpujq3SMDNMCWbwNIXzMfY7y0WD5nHEatxEERhQ
iYwi1z2TDtw9MLWVMGtCLQ6Go0V16OQhnOFPR0Ps2Wyv3gNWV11XrpDqLh1rDmdU
TpUQl4ows57z9jalbd7X7qhwd8G1ESpwA5iLHTnJ7Ec8cby5rkIPWdiXxy9k1pqX
TjAM4f6ALHeX/VV2z0u787PQt5skpsM7EHiLoklrsxDWTyF0VwtKtltC+VffTn7t
9cCLn6nOOcmMIcnrmZwAeccSCvPCnkrtSu1fRx3TutudpgkpUgXw2KUuOMhiTEs2
F4Yqwx6glIzmTQY0BNe+fmL8GqNpKPQ7st9htsUUVNtKOqX/BhsRlhZtdLMSmzGn
PPLgo4ehUi+6//MOCg6D
=3pp+
-----END PGP SIGNATURE-----

--p2u4WfPhYOuYlOsk--
