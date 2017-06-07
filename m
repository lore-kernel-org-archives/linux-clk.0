Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Wed, 7 Jun 2017 10:45:44 +0200
From: Maxime Ripard <maxime.ripard@free-electrons.com>
To: Icenowy Zheng <icenowy@aosc.io>
Cc: Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
        Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@siol.net>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-sunxi@googlegroups.com
Subject: Re: [PATCH v2 01/11] dt-bindings: update the binding for Allwinner
 H3 TVE support
Message-ID: <20170607084544.kgclybyxxttfk3ko@flea.lan>
References: <20170604160149.30230-1-icenowy@aosc.io>
 <20170604160149.30230-2-icenowy@aosc.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="mbi7ai7gr2qcimma"
In-Reply-To: <20170604160149.30230-2-icenowy@aosc.io>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


--mbi7ai7gr2qcimma
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 05, 2017 at 12:01:39AM +0800, Icenowy Zheng wrote:
> Allwinner H3 features a "DE2.0" and a TV Encoder.
>=20
> Add device tree bindings for the following parts:
> - H3 TCONs
> - H3 Mixers
> - The connection between H3 TCONs and H3 Mixers
> - H3 TV Encoder
> - H3 Display engine
>=20
> Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
> ---
> Changes in v2:
> - Changed endpoint reg definition on TCONs and Mixers. Now the endpoint
>   id is just the component id.
> - Changed TVE and TCON1 binding -- now CLK_TVE is passed as TCON1 lcd-ch1.
>=20
>  .../bindings/display/sunxi/sun4i-drm.txt           | 37 ++++++++++++++++=
+++---
>  1 file changed, 33 insertions(+), 4 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.tx=
t b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> index b83e6018041d..7ad164cb7dcb 100644
> --- a/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> +++ b/Documentation/devicetree/bindings/display/sunxi/sun4i-drm.txt
> @@ -49,7 +49,9 @@ The TV Encoder supports the composite and VGA output. I=
t is one end of
>  the pipeline.
> =20
>  Required properties:
> - - compatible: value should be "allwinner,sun4i-a10-tv-encoder".
> + - compatible: value must be either:
> +    * allwinner,sun4i-a10-tv-encoder
> +    * allwinner,sun8i-h3-tv-encoder
>   - reg: base address and size of memory-mapped region
>   - clocks: the clocks driving the TV encoder
>   - resets: phandle to the reset controller driving the encoder
> @@ -69,23 +71,27 @@ Required properties:
>     * allwinner,sun6i-a31-tcon
>     * allwinner,sun6i-a31s-tcon
>     * allwinner,sun8i-a33-tcon
> +   * allwinner,sun8i-h3-tcon
>     * allwinner,sun8i-v3s-tcon
>   - reg: base address and size of memory-mapped region
>   - interrupts: interrupt associated to this IP
>   - clocks: phandles to the clocks feeding the TCON. Three are needed:
>     - 'ahb': the interface clocks
> -   - 'tcon-ch0': The clock driving the TCON channel 0
>   - resets: phandles to the reset controllers driving the encoder
>     - "lcd": the reset line for the TCON channel 0
> =20
>   - clock-names: the clock names mentioned above
>   - reset-names: the reset names mentioned above
> - - clock-output-names: Name of the pixel clock created
> =20
>  - ports: A ports node with endpoint definitions as defined in
>    Documentation/devicetree/bindings/media/video-interfaces.txt. The
>    first port should be the input endpoint, the second one the output
> =20
> +  In the situation of Display Engine 2.0 that the connection between
> +  the mixer and the TCON can be swapped, the input should have two
> +  endpoints. The first input endpoint should be connected to mixer0
> +  and the second should be connected to mixer1.
> +

AFAIK, this is also the case for dual-pipelines on DE1 (for example on
the A31). And this is already covered by:

"
For the input port of all components up to the TCON in the display
pipeline, if there are multiple components, the local endpoint IDs
must correspond to the index of the upstream block. For example, if
the remote endpoint is Frontend 1, then the local endpoint ID must
be 1.
"

>    The output may have multiple endpoints. The TCON has two channels,
>    usually with the first channel being used for the panels interfaces
>    (RGB, LVDS, etc.), and the second being used for the outputs that
> @@ -94,7 +100,23 @@ Required properties:
>    channel the endpoint is associated to. If that property is not
>    present, the endpoint number will be used as the channel number.
> =20
> -On SoCs other than the A33 and V3s, there is one more clock required:
> +For the following compatibles:
> +   * allwinner,sun5i-a13-tcon
> +   * allwinner,sun6i-a31-tcon
> +   * allwinner,sun6i-a31s-tcon
> +   * allwinner,sun8i-a33-tcon
> +   * allwinner,sun8i-v3s-tcon
> +there is one more clock and one more property required:
> + - clocks:
> +   - 'tcon-ch0': The clock driving the TCON channel 0
> + - clock-output-names: Name of the pixel clock created
> +
> +For the following compatibles:
> +   * allwinner,sun5i-a13-tcon
> +   * allwinner,sun6i-a31-tcon
> +   * allwinner,sun6i-a31s-tcon
> +   * allwinner,sun8i-h3-tcon
> +there is one more clock required:
>     - 'tcon-ch1': The clock driving the TCON channel 1
> =20
>  DRC
> @@ -189,6 +211,8 @@ supported.
>  Required properties:
>    - compatible: value must be one of:
>      * allwinner,sun8i-v3s-de2-mixer
> +    * allwinner,sun8i-h3-de2-mixer0
> +    * allwinner,sun8i-h3-de2-mixer1

Again, please explain why we need to have different compatibles
here. If it's only about the number of planes, this should be dealt
with a property, not a compatible.

Maxime

--=20
Maxime Ripard, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com

--mbi7ai7gr2qcimma
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIcBAEBAgAGBQJZN704AAoJEBx+YmzsjxAgNt0P/A9jM2HnzJj30eRTIQpZi+tj
bDf4f7W5yOIkpX6axeOOZKjuozyEqYQUn48MUGFJxkSCytYZ3Ap6hroSA9gwMMqQ
JMG/svB6gyk9PiZrz19pZqS+gPv7eZaAFJ1UsvgXaQuS8KrOTP3A9bN062DSHHkc
63Q9UaU20xzf4x19MzykhfkTioDltLXDzwQzDzDXw0RalsllmDBpzWDVPsuC4OMe
f/aOQ2vUvNVqSvp88tc9p0nIeB5UbvPqLg4wcWSOw5qgUi/XSxdicZycd1oDakTe
T7jSKSUllIM+T9G7CTtfx0CLqVukVwKRjW5UPwB0RZmdXMS8Nr22D1mB10nl0HGn
2OuKlUFTOK8OWFT2hWcF+/0Zcn7haqrQd2e+EQbIKE+51d2bu7Hfh5awfhbehnfq
aAjDfOqa3rkckQQx0yyMCTfPrkg+ryxQ9ZLYyN1oCEX9Z9tkH+sBJL5nqcD8HpeT
T2mkgBr/JwvvXascllriAAgEMkVxi6hW7BEQ8CZ2MkHvN0VwacMwnn3lrf/eeQWu
+Im8ZeO1oom6s6qJFKh3shvZizKX1Z5sSWHqaoKds4/tHJX1++PrJur0F4Jn0Plp
fjNdRU4kOTNoWMs9Dhc/cQZgzjrpSNtd555zwIr5o/G3xMvo2RW8ZNJ86m3TZyce
GE8Ez2SKYpERL4ut7C7y
=dFXb
-----END PGP SIGNATURE-----

--mbi7ai7gr2qcimma--
