Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5988A1898FB;
	Wed, 10 Jun 2026 23:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781133529; cv=none; b=Wzmd8NyDZBlpu39ERHfp+vy2+0J3UQ/+mmUQcLAjcXXeHw6Uy/dZ59cSMnUgM9Fjb80A0gIPwQJESRU1btWRAXWE03GQn+MR/C05tVdBZZEepAGdr044bRhFWb4mnlFz9v1xWyKXYqUIqBh89Ond1npTCIufKjekdhtfMiAfyLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781133529; c=relaxed/simple;
	bh=bDutxsDGuo64IizNyxZ3PZMW7vgf15RM9takx0DvE9g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eqkcCvWr0ILfVssPNmrSV415kygUxLI1weIY8pxwvzRXypJ8pISrXbImXNBk3ld5G69k4T6kWeEpZVZnS3277e9OG/blizBs2IW7lkkLaTD37WaqPmlgHckXvU30Kjc2nS/pO9GmqDnJ8IIoXL3kE0PK5xVNGS6FGT4lcVKDKoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IU0H9k89; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IU0H9k89"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C4C419D1;
	Thu, 11 Jun 2026 01:18:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781133495;
	bh=bDutxsDGuo64IizNyxZ3PZMW7vgf15RM9takx0DvE9g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IU0H9k89utnCTP8294WQVrX4V7yUu1dCAp/7cj2CxziK3GlvEP7jp4nxaWe60bykX
	 0YR2Nt6KMs7QgEF2RP+wqg6h05arbJb4q4SQvh3BN0KhqLiFPGpvKOYstMthRFIQMM
	 Ka287by0WrkpCnyCg4fTZQCOa17uSWpZrlacTa3s=
Date: Thu, 11 Jun 2026 02:18:42 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Conor Dooley <conor@kernel.org>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/5] dt-bindings: display: bridge: Document Renesas
 R-Car V4H DSC bindings
Message-ID: <20260610231842.GA1751568@killaraus.ideasonboard.com>
References: <20260515-rcar-du-dsc-v2-0-f6b9240a1240@ideasonboard.com>
 <20260515-rcar-du-dsc-v2-2-f6b9240a1240@ideasonboard.com>
 <20260515-fraying-trickle-7511a2eeaf44@spud>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515-fraying-trickle-7511a2eeaf44@spud>

On Fri, May 15, 2026 at 06:32:27PM +0100, Conor Dooley wrote:
> On Fri, May 15, 2026 at 10:56:15AM +0300, Tomi Valkeinen wrote:
> > From: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > 
> > The Renesas DSC Display Stream Compression is a bridge embedded in the
> > Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> > 8k or 400 Mpixel/s .
> > 
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> > [tomi.valkeinen: fix the example]
> > Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> > ---
> >  .../bindings/display/bridge/renesas,dsc.yaml       | 96 ++++++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> > new file mode 100644
> > index 000000000000..2918d592732b
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsc.yaml
> 
> Filename matching the compatible please.
> 
> pw-bot: changes-requested
> 
> > @@ -0,0 +1,96 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/renesas,dsc.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Renesas R-Car DSC Display Stream Compression
> > +
> > +maintainers:
> > +  - Marek Vasut <marek.vasut+renesas@mailbox.org>
> > +
> > +description: |
> > +  This binding describes the VESA DSC Display Stream Compression encoder
> > +  embedded in the Renesas R-Car V4H SoC. The encoder supports all DSC1.1
> > +  encoding mechanisms, configurable bits-per-pixel, resolution up to 8k.
> > +
> > +properties:
> > +  compatible:
> > +    const: renesas,r8a779g0-dsc
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  resets:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: R-Car DU input port
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: R-Car DSI output port
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - interrupts
> > +  - power-domains
> > +  - resets
> > +  - ports
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
> > +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> > +    #include <dt-bindings/power/r8a779g0-sysc.h>
> > +
> > +    dsc@feb8d000 {
> 
> Speaking of fixing the example, should this not be "decoder" or

Or rather "encoder"

> "bridge"?
> Not a big deal though.
> With the changed filename
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> 
> > +        compatible = "renesas,r8a779g0-dsc";
> > +        reg = <0xfeb8d000 0x400>;
> > +        interrupts = <GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
> > +        clocks = <&cpg CPG_MOD 2819>;
> > +        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
> > +        resets = <&cpg 2819>;
> > +
> > +        ports {
> > +            #address-cells = <1>;
> > +            #size-cells = <0>;
> > +
> > +            port@0 {
> > +                reg = <0>;
> > +                dsc_in_dsi1: endpoint {
> > +                    remote-endpoint = <&du_out_dsi1>;
> > +                };
> > +            };
> > +
> > +            port@1 {
> > +                reg = <1>;
> > +                dsc_out_dsi1: endpoint {
> > +                    remote-endpoint = <&dsi1_in>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +...

-- 
Regards,

Laurent Pinchart
