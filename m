Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F673AD534;
	Fri, 17 Jul 2026 06:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784269947; cv=none; b=Zzg0aVtvAszrygEYV6Uva5aRxu93ttxUSa5TsnIpTaKW6yMxT2v3OO4MWFSJAZAskVBSpwT5bRIJqy8TQvwAYK+T7HrabHYNpcGs8EsaQOCqxB0UaUAIm+JNprp7RPHeXn+jOx3ajqbalnBUA3wUx+jPRnx2e1ob4I0edoYPnWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784269947; c=relaxed/simple;
	bh=tiQGLMndWiRKE5SemlMVI08e5kJ1cjRcFQ+gAFg8sko=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1h2gIusk7QXhfjtMxdYV5MFswwW+XNjhz7zvPNrTXHlmmGfAHhOrznxVbbz7T1upt4oZlco6GZCfflZrc2myDvF7FF9CRAQCX29GxZPMvMxeN0RB2XWmwe+01GAtbfIB+4SvRPVPZ09xMaB76suTjUK7Be0V4bV5QaLlFGJn2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IMny/Fb2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IMny/Fb2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0560C1F000E9;
	Fri, 17 Jul 2026 06:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784269942;
	bh=F88kXLHiJluPemsV2dA4XtGRZ7VlVzWVhA8ffVQ3Koc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IMny/Fb25eeaa/OqOPZX4svMfgDHI7w0zXjZMf26ygEip02soGXnmovgLeF0Zeaqh
	 5RftwD4Rrg+jPyHRDyTmifGl+hu+9Xtlkk7U/2YbyFKcrg2vTVE9W5YXatBOARy94Y
	 d3v1r2hey2BjzJ3t349UtnDHdBH1jxf3cGlcHy94vQmV/aX01wcDNHQAZ3jAwZpduN
	 CgyJtId8oAWdNLYUOisnNsVoYaW38Kxgs3uqBwvBjouNNa5bNTudReiCTkNkyLOJda
	 Y9P7WGyS2GSQADpXl1q+IUegPM0TTdn8p1lmhnjF9YczbFUkcqI7kwJ9m+2wbJOYR2
	 Z7Obh8mWh0Tug==
Date: Fri, 17 Jul 2026 08:32:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy
 documentation
Message-ID: <20260717-uncovered-feathered-groundhog-eab16e@quoll>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>

On Fri, Jul 17, 2026 at 12:35:37AM +0300, Stefan D=C3=B6singer wrote:
> This binding will be used as a subnode of topcrm, which will be added in
> the next patch.

Irrelevant, drop. Also not true, because next patch is driver patch.

>=20
> Why is this a child node and not #phy-cells added to topcrm itself,
> like clocks and resets as writing-bindings.rst suggests? Because
> of_phy_provider_register checks if the of_node the PHY provider is added
> to belongs to the device or is a child of the device, so I can't put the
> PHY driver into an MFD (or AUX) child without its own node.

>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---
>=20
> How do I handle examples? It would be identical to the example in
> topcrm. The example needs the reset defines from the next patch in
> either case.

1. No, it does not need. Just use whatever numbers.
2. Other code would give you the hint: one example in parent's schema.

> ---
>  .../bindings/phy/zte,zx297520v3-usb-phy.yaml       | 96 ++++++++++++++++=
++++++
>  MAINTAINERS                                        |  2 +
>  include/dt-bindings/phy/phy-zte-zx297520v3-usb.h   | 12 +++
>  3 files changed, 110 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy=
=2Eyaml b/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
> new file mode 100644
> index 000000000000..8bad9365d5cc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
> @@ -0,0 +1,96 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/zte,zx297520v3-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ZTE zx297520v3 USB and HSIC PHY
> +
> +maintainers:
> +  - Stefan D=C3=B6singer <stefandoesinger@gmail.com>
> +
> +description: |
> +  This PHY is found on zx297520v3 boards. It has no configurability on i=
ts own,
> +  but it does require a correct reset and wait sequence to initialize. I=
t can
> +  provide interrupt notification when USB is connected and disconnected.
> +
> +  The phy is a component of the board's topcrm controller. The hardware =
needs to
> +  be declared as a child node of the zte,zx297520v3-topcrm node.
> +
> +  The register space and IRQs always account for two PHYs: One USB 2.0 O=
TG phy
> +  and a HSIC PHY. Not all boards have both. If one is missing, the corre=
sponding
> +  ready flag will never be set.
> +
> +  The "include/dt-bindings/phy/phy-zte-zx297520v3-usb.h" header contains=
 the
> +  definition for the PHY indices.
> +
> +properties:
> +  compatible:
> +    const: zte,zx297520v3-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: IRQ reporting USB connection
> +      - description: IRQ reporting USB disconnection
> +      - description: IRQ reporting HSIC connection
> +      - description: IRQ reporting HSIC disconnection
> +
> +  interrupt-names:
> +    items:
> +      - const: usb-up
> +      - const: usb-down
> +      - const: hsic-up
> +      - const: hsic-down
> +
> +  resets:
> +    items:
> +      - description: USB phy reset
> +      - description: HSIC phy reset

Why do you reference here resets from the parent? That's a clear signal
you have one device, so one device node regardless of Linux phy core
behavior.

> +
> +  reset-names:
> +    items:
> +      - const: usb
> +      - const: hsic
> +
> +  "#phy-cells":
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/phy/phy-zte-zx297520v3-usb.h>
> +
> +    topcrm: clock-controller {
> +        compatible =3D "zte,zx297520v3-topcrm", "syscon";
> +        #address-cells =3D <1>;
> +        #size-cells =3D <0>;
> +        #reset-cells =3D <1>;

Drop node, you have warnings.

> +
> +        usb-phy@84 {
> +          compatible =3D "zte,zx297520v3-usb-phy";
> +          reg =3D <0x84>;
> +          interrupts =3D <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
> +            <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
> +            <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
> +            <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;

Align it properly/

> +          interrupt-names =3D "usb-up", "usb-down", "hsic-up", "hsic-dow=
n";
> +          resets =3D <&topcrm 18>,
> +            <&topcrm 20>;

Same here.

> +          reset-names =3D "usb", "hsic";
> +          #phy-cells =3D <1>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8729cea57c3d..cb50c2e3b4ea 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3878,8 +3878,10 @@ L:	linux-arm-kernel@lists.infradead.org (moderated=
 for non-subscribers)
>  S:	Odd fixes
>  F:	Documentation/arch/arm/zte/
>  F:	Documentation/devicetree/bindings/arm/zte.yaml
> +F:	Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.yaml
>  F:	arch/arm/boot/dts/zte/
>  F:	arch/arm/mach-zte/
> +F:	include/dt-bindings/phy/phy-zte-zx297520v3-usb.h
> =20
>  ARM/ZYNQ ARCHITECTURE
>  M:	Michal Simek <michal.simek@amd.com>
> diff --git a/include/dt-bindings/phy/phy-zte-zx297520v3-usb.h b/include/d=
t-bindings/phy/phy-zte-zx297520v3-usb.h
> new file mode 100644
> index 000000000000..8a0a3ccbdd63
> --- /dev/null
> +++ b/include/dt-bindings/phy/phy-zte-zx297520v3-usb.h

Filename MUST match compatible.

> @@ -0,0 +1,12 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) Stefan D=C3=B6singer.
> + */
> +
> +#ifndef __DT_BINDINGS_PHY_USB_ZX297520V3_H
> +#define __DT_BINDINGS_PHY_USB_ZX297520V3_H
> +
> +#define ZX297520V3_USB_PHY	0
> +#define ZX297520V3_HSIC_PHY	1
> +
> +#endif /* __DT_BINDINGS_PHY_USB_ZX297520V3_H */
>=20
> --=20
> 2.54.0
>=20
