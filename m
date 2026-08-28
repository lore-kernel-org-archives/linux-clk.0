Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973A154785;
	Fri, 28 Aug 2026 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787935811; cv=none; b=emOy9hVj4pw4xuyD8NTYFKpjQ+oyrbb1F6GFG+kpd8a0S8m59A/zkL8Gzj0ZIx4Y2ZKyx+YJxltJq2bwYeKLYLVWsXwNs4fVBrcucu+fZugf4YhOjw2dy+rovqV0l3CxoUAAS4ZVl8cVHtgCBN+y0wmOP25xBIe3+JMU6LAX5lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787935811; c=relaxed/simple;
	bh=CgXPItRXRQy1tDThHXDBVQckJhxrBAuIiDItozyW1/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tFqBsLUK3zvZJZBWLeUJP16s40SrZa85eBQqofbkgXyxuQEteyanEVZ8YwSFbfyi9RXk5ozFsDgH940GCI8eGX5c2oi2L2GRrIlsdkhjhbaXZy043MH0GAGNFLk5hMSO/1diyXtACCNbCdFiUSoRa+RboH1F23rae22BKWEaxYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XxoRvS/p; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XxoRvS/p"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F8101F000E9;
	Fri, 28 Aug 2026 16:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787935809;
	bh=Hw/jCmn/KOE2LoDFpFWah+rvYGMtWOdmte3fTa9ScuY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XxoRvS/pWD7EfKWlPLkqW8pWjkuekfNHrSvJvmaAdzI5X8auF7Qn5/jEDekj4ncxI
	 2jEmHqbY3k4YyvyXFuSacz8f8GpOr7bqT67VdFZfNvMpbBr1Ekt7XVD73tEKN2eUKb
	 mrJyA7yxMSBDWNzDtpoXYtfBlsXgO8CLsP3kkvES3ibm8QHxvHfkJ9foYSiyUY5swe
	 lxSlvUTKJINxWvdGnb28E0bCU3fKxWhlYhaehUcNWzno23zxRoF5GIpX36pmaU6UDe
	 2Z7/6zpZ9xXAYLv2qcsQ3bADDJhCoO/spbT0lR0/z/+3Qt/+wvjx6mJiJ+/AKg1mbk
	 pnYtXn7scph8A==
Date: Fri, 28 Aug 2026 17:50:00 +0100
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
Subject: Re: [PATCH v2 03/15] dt-bindings: mfd: Add
 starfive,jh7110-hdmi-subsystem
Message-ID: <20260828-tribune-unguided-672ae7ade441@spud>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134819eucas1p2c8e2bb95dd957981ec5e60e1da03223c@eucas1p2.samsung.com>
 <20260828-jh7110-clean-send-v2-3-331680c8b9d1@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Cg0ACwIa4U5WfwqO"
Content-Disposition: inline
In-Reply-To: <20260828-jh7110-clean-send-v2-3-331680c8b9d1@samsung.com>

--Cg0ACwIa4U5WfwqO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 03:47:27PM +0200, Michal Wilczynski wrote:
> Add the dt-binding for the StarFive JH7110 HDMI subsystem.
>=20
> The JH7110 HDMI IP is a monolithic block containing both the digital
> controller and analog PHY in a single register space. This binding
> defines the parent device, which holds the shared register map and
> populates its two children: the PHY and the controller. This is
> necessary to resolve a circular clock dependency between the HDMI block
> and the VOUT clock generator.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../mfd/starfive,jh7110-hdmi-subsystem.yaml        | 116 +++++++++++++++=
++++++
>  1 file changed, 116 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-s=
ubsystem.yaml b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-=
subsystem.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..01f079160ab8c13c6fa4ce3ab=
aac6607021b3792
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsyste=
m.yaml
> @@ -0,0 +1,116 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/starfive,jh7110-hdmi-subsystem.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 HDMI subsystem
> +
> +maintainers:
> +  - Michal Wilczynski <m.wilczynski@samsung.com>
> +
> +description:
> +  The StarFive JH7110 HDMI block is a monolithic IP containing both
> +  the digital controller logic and the analog PHY logic in a single
> +  register space.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-hdmi-subsystem
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +    description:
> +      NoC display bus clock, which gates access to the whole vout
> +      register region.
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      NoC display bus reset, which gates access to the whole vout
> +      register region.
> +
> +  power-domains:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - power-domains

Here you're willing not to have -names properties?

> +
> +patternProperties:
> +  "^phy(@[0-9a-f]+)?$":

These are not pattern properties at all, given they have no variance
because there's no unit addresses involved!
pw-bot: changes-requested

Cheers,
Conor.

> +    $ref: /schemas/phy/starfive,jh7110-inno-hdmi-phy.yaml#
> +  "^controller(@[0-9a-f]+)?$":
> +    $ref: /schemas/display/bridge/starfive,jh7110-inno-hdmi-controller.y=
aml#
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/power/starfive,jh7110-pmu.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    soc {
> +        #address-cells =3D <1>;
> +        #size-cells =3D <1>;
> +
> +        hdmi@29590000 {
> +            compatible =3D "starfive,jh7110-hdmi-subsystem";
> +            reg =3D <0x29590000 0x4000>;
> +            clocks =3D <&syscrg JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
> +            power-domains =3D <&pwrc JH7110_PD_VOUT>;
> +            resets =3D <&syscrg JH7110_SYSRST_NOC_BUS_DISP_AXI>;
> +
> +            controller {
> +                compatible =3D "starfive,jh7110-inno-hdmi-controller";
> +                clocks =3D <&voutcrg JH7110_VOUTCLK_HDMI_TX_SYS>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_MCLK>,
> +                         <&voutcrg JH7110_VOUTCLK_HDMI_TX_BCLK>,
> +                         <&hdmi_phy>;
> +                clock-names =3D "sys", "mclk", "bclk", "pclk";
> +                interrupts =3D <99>;
> +                phys =3D <&hdmi_phy>;
> +                phy-names =3D "hdmi-phy";
> +                resets =3D <&voutcrg JH7110_VOUTRST_HDMI_TX_HDMI>;
> +                reset-names =3D "hdmi_tx";
> +
> +                ports {
> +                    #address-cells =3D <1>;
> +                    #size-cells =3D <0>;
> +
> +                    port@0 {
> +                        reg =3D <0>;
> +
> +                        endpoint {
> +                            remote-endpoint =3D <&dpu_out_dpi0>;
> +                        };
> +                    };
> +
> +                    port@1 {
> +                        reg =3D <1>;
> +
> +                        endpoint {
> +                            remote-endpoint =3D <&hdmi_con_in>;
> +                        };
> +                    };
> +                };
> +            };
> +
> +            hdmi_phy: phy {
> +                compatible =3D "starfive,jh7110-inno-hdmi-phy";
> +                #clock-cells =3D <0>;
> +                clock-output-names =3D "hdmi_pclk";
> +                clocks =3D <&xin24m>;
> +                clock-names =3D "refoclk";
> +                #phy-cells =3D <0>;
> +            };
> +        };
> +    };
> +...
>=20
> --=20
> 2.34.1
>=20

--Cg0ACwIa4U5WfwqO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCapG8NwAKCRB4tDGHoIJi
0hpkAP9IEPsKXNupV8il/GXzWDWNOrSDzHB2OymOU4fR89rhBAD+LI4SNgwfyjrP
7lvK3nlFJ0fQqo4ZtM5vpnIawQnoNwE=
=PKQG
-----END PGP SIGNATURE-----

--Cg0ACwIa4U5WfwqO--
