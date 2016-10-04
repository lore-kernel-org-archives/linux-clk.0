Return-Path: <maxime.ripard@free-electrons.com>
Date: Tue, 4 Oct 2016 18:32:29 +0200
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
Subject: Re: [PATCH 10/14] dt-bindings: sound: Add sun8i audio card
 documentation
Message-ID: <20161004163229.GR5228@lukather>
References: <cover.1475571575.git.mylene.josserand@free-electrons.com>
 <c317ce9f180a24611e79086944feca00d416b7b4.1475571575.git.mylene.josserand@free-electrons.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="h1wVxq8aeHrvhZJz"
In-Reply-To: <c317ce9f180a24611e79086944feca00d416b7b4.1475571575.git.mylene.josserand@free-electrons.com>
List-ID: <linux-clk.vger.kernel.org>


--h1wVxq8aeHrvhZJz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 04, 2016 at 11:46:23AM +0200, Myl=E8ne Josserand wrote:
> Add the documentation for dt-binding of the audio card driver
> for sun8i SoC.
>=20
> Signed-off-by: Myl=E8ne Josserand <mylene.josserand@free-electrons.com>
> ---
>  Documentation/devicetree/bindings/sound/sun8i-audio.txt | 17 +++++++++++=
++++++
>  1 file changed, 17 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/sun8i-audio.t=
xt
>=20
> diff --git a/Documentation/devicetree/bindings/sound/sun8i-audio.txt b/Do=
cumentation/devicetree/bindings/sound/sun8i-audio.txt
> new file mode 100644
> index 0000000..2403983
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/sun8i-audio.txt
> @@ -0,0 +1,17 @@
> +* Allwinner A23/A33 audio card
> +
> +This binding implements the A33 audio card.
> +
> +Required properties:
> +- compatible: must be "allwinner,sun8i-audio"
> +- allwinner,audio-codec: must have the phandle of the audio codec
> +  ("sun8i-a33-codec", for example).
> +- allwinner,i2s-controller: must have the phandle of the DAI
> +  ("allwinner,sun4i-a10-i2s", for example)

You should probably have a link to the PRCM too, instead of relying on
the name of the device in your card, which is quite fragile.

Also, I'm wondering, shouldn't all these nodes be part of a single
MFD? They share the same address space (even though it's split
nicely), the same clocks, and really are just one big device. Chen-Yu,
Mark, any opinion?

Thanks,
Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--h1wVxq8aeHrvhZJz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJX89mdAAoJEBx+YmzsjxAgkAIP/2djagaL2twRMaHwJ5ApV6uo
Dt3DdjLOG8zgNHdN0MWV8jfotG7UnMwlk5paFMUG+hv4UH9GwjopiKd81bORZNW4
fBDjCCspPHp7UaJC56Ij8i+D+HFEahRFbxvhnkds9/00Rlz4x0cq9GEuPwa9XiiV
xxwJo8aJ7ULpSCCtJfotIIPBzabIGU++zok+NsdtjhtO0sUw2pmh+orVY+skMHyT
KKPzWzWk7Cf345AKwgzQvw1QLHj9cPEQFyy3rnZX2ceXJA9qkvP7GQFuCa+7Fz2h
23tqt3iEaHBPsMVFit2WV+PLxuIwrHcQanaROF4TTMcC9m0TxvUOk2GexBHI3D34
nOdK8/i8yOrKeC8kDW5oVQ9NkWHPvoMqktNLwOhoOSXyvUDoVqHWLFZjXnhw8nvB
DTa/motexRjwdz7dZIVv8Q4In7ZFPTTCsfEtGADlEkGMM/pICJbyiZRcmwEHICsf
I/k83ubjbv2bQFHWEDC4C8g96S/oUMw4mD/6aCHYeWe3EdyRHA3JNub5QwJ4lKFP
O+3qAbN884JEg5owuODPJtV4DcKWjbXZ1Vo4tvrXk0pAO/6mDFIedOnxbFsgwpNx
6H5XNb0wCt25U83gwzS8LVC44IFOeYDzyfb9okgE6pA8jG7EczC+F4LK/dyEnlDN
TUvCZzVYKY0CaxlK9OI8
=Wubi
-----END PGP SIGNATURE-----

--h1wVxq8aeHrvhZJz--
