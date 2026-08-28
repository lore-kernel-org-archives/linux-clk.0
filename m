Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D82454785;
	Fri, 28 Aug 2026 16:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787935688; cv=none; b=j7naIZ8u18EO+ubk3NNg3JzbI4PXoDmiupNhj4OxIMuuo69MfC9PnTfhxUyt6QyHccS2y0cFLt+NSC62CTpna1l0SNOT0Mxau2ueT3I3u/RRCL1Ld5XuHNJmlXjlmVKyHoZ0Oi+FlCj7wlojNDSN3EPcsNONogSf+D5LPpaTbq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787935688; c=relaxed/simple;
	bh=rxX1i9PvSSUYmtC21uY+55SrgwsvqEpSyTVGtUrJWzw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ph8pO8uIm5TkLM0pstXu8+9Wi34/qm/xJDjhBcDOFN7RoGhiBP/aqIO+lQrqMrbEfo7D0nXgO+pbM1xaWkv4nluYtdzaad+CY9MUMfjKfgZgPRHNMCdzJF3fHi3zaRWbj52ChVjOS7Gsq+MRL46s5bmG1jSuEhbMi35Wgq2NeB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jr4xjUxH; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jr4xjUxH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03B351F000E9;
	Fri, 28 Aug 2026 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787935686;
	bh=3uZJ8IQ3rvAOLqsuwriJVKPiTt7W+7qGrB0uMuNGIIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Jr4xjUxHKAt1Q7DFDYX2Upl28VPMnkSAzFFonEzlkqnkbv0NPiiPJ2IOsnd/72/XD
	 47B9qGO4dBvV3NAmBTkc5P9Q3KF7rRewXQZO7sDxF76axLKw/vYn4GaAQPb8+/NdpX
	 tpkafavH+lTmRdl6xGC9+atGOWEkwytEN8eKuh27gKfW0PIUQKIHZg9bI3EvC+eX14
	 LpBDqvJCWP3NJDkbBxRlOOws+ekUArnw0iKxUoIV1bkdxMQo6RNyMJhw/z+wsRhtCi
	 G1gpytYmfDAk+dsLtw/Dwz+EmAxGa+CFkYqp53SEBqT86gEm2YaXoIAEK2edIfvaiq
	 3kTjKoOOyJlVg==
Date: Fri, 28 Aug 2026 17:47:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>,
	Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
	Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Dominique Belhachemi <db@domibel.de>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Andy Yan <andyshrk@163.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Graham Markall <hello@big-grey.co.uk>
Subject: Re: [PATCH v2 02/15] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
Message-ID: <20260828-stylus-bonfire-b71cbfe8b983@spud>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134817eucas1p2e2756deff8871be4ea8bb5c65f9c179d@eucas1p2.samsung.com>
 <20260828-jh7110-clean-send-v2-2-331680c8b9d1@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hmXiyWp5HkfjJgGf"
Content-Disposition: inline
In-Reply-To: <20260828-jh7110-clean-send-v2-2-331680c8b9d1@samsung.com>

--hmXiyWp5HkfjJgGf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 03:47:26PM +0200, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI controller
> (DRM bridge).
>=20
> This device is the second child of the starfive,jh7110-hdmi-subsystem nod=
e.
> It consumes register access clocks (sys, mclk, bclk) from the voutcrg and
> both the pixel clock (pclk) and the PHY from its hdmi_phy sibling.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../starfive,jh7110-inno-hdmi-controller.yaml      | 109 +++++++++++++++=
++++++
>  1 file changed, 109 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh=
7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/=
bridge/starfive,jh7110-inno-hdmi-controller.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..0e584e7b756e24e2f99a62daa=
b3117bbf4b472b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-in=
no-hdmi-controller.yaml
> @@ -0,0 +1,109 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/bridge/starfive,jh7110-inno-h=
dmi-controller.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Innosilicon HDMI Controller
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description:
> +  The controller portion of the StarFive JH7110 INNO HDMI IP.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-inno-hdmi-controller
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: System clock for register access
> +      - description: Module clock
> +      - description: Bus clock
> +      - description: Pixel clock from PHY
> +
> +  clock-names:
> +    items:
> +      - const: sys
> +      - const: mclk
> +      - const: bclk
> +      - const: pclk

"module" "bus" "pixel" would be more informative than spending most of
your characters regurgitating what these are by definition?

> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: hdmi_tx
> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    const: hdmi-phy

With the trend of ?pointless? -names properties, I'm surprised you don't
have interrupt-names? I'd ditch 'em all where there's only a single
clock. The _ rather than - in the reset name triggers my OCD.
pw-bot: changes-requested

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    description:
> +      A graph node with one input port and one output port.
> +
> +required:
> +  - compatible
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +  - phys
> +  - phy-names
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  # Shown as a child of the HDMI subsystem node; see
> +  # Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsystem=
=2Eyaml
> +  # for the full node.
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    controller {

"controller" seems over generic for a node, but I guess if the parent is
"hdmi-subsystem" or something it makes sense in that context.

Cheers,
Conor.


> +        compatible =3D "starfive,jh7110-inno-hdmi-controller";
> +        clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                 <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                 <&hdmi_phy>;
> +        clock-names =3D "sys", "mclk", "bclk", "pclk";
> +        interrupts =3D <99>;
> +        phys =3D <&hdmi_phy>;
> +        phy-names =3D "hdmi-phy";
> +        resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +        reset-names =3D "hdmi_tx";
> +
> +        ports {
> +            #address-cells =3D <1>;
> +            #size-cells =3D <0>;
> +
> +            port@0 {
> +                reg =3D <0>;
> +
> +                endpoint {
> +                    remote-endpoint =3D <&dpu_out_dpi0>;
> +                };
> +            };
> +
> +            port@1 {
> +                reg =3D <1>;
> +
> +                endpoint {
> +                    remote-endpoint =3D <&hdmi_con_in>;
> +                };
> +            };
> +        };
> +    };
> +
> +...
>=20
> --=20
> 2.34.1
>=20

--hmXiyWp5HkfjJgGf
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG7vAAKCRB4tDGHoIJi
0pUPAP44G7D1YksuTLzwXOQE0xjkY41H5I6ctxD3+HMYzXvYMwD/dGnps9J8VkOV
+p7sgoW/Ih4VAyXMlP+NpyZEU8ULFgY=
=mMUh
-----END PGP SIGNATURE-----

--hmXiyWp5HkfjJgGf--
