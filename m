Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C3F73AFAE7;
	Tue, 28 Jul 2026 06:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785220082; cv=none; b=owFZAWe8jRm9h2qa/IJhXLDOO7ocCwsnbyVx/OEY/96rfBJajTvS7y/yPgXSZepODRy3DtemCDNZGXf7mJu7pjto0TZNKwgaoqQvx3UrmjtKA32Yz8wYcW5uB5iadsRkdMzE/aIArAXrmIIvLU/2XWFGGz5DT9gDR7Nw1HilOSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785220082; c=relaxed/simple;
	bh=ggc/hjLNeUrrbId7e1Nbn6A9KqcDtOuIHd/cq0QzimQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur0vnKr7Jkez0MWAkBl/MuXKYExPXT/lwN5JyW9Gw8wIQ8V/8vPqkESN2SsL9U8m9/7ccJZeaf0RPrVwCLY8ahcZepwAhHvNVsG8pSZ6dH+jfqQsE7djUMzjC5qArTIz4kYJz/mdng+k37nZREUSG1ryhi5XILgXu4zf0RleY8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OjCXX2RI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OjCXX2RI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547C71F000E9;
	Tue, 28 Jul 2026 06:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785220081;
	bh=1gDMNCcHBDuYrPnahUNiZDFlvS3Nqh1QQMdqSSWYU9w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OjCXX2RIhL4IV+fRTZslnsx2qiImzidMTIUjeGPhIiKJFW0pjPQNLBSTVoM6UUkBq
	 +PrUHOhExKJP8U30r56EWiY1QifFN74cf1D0tz0GsCypZOvJP0AWPHbdc428mzu6Mr
	 J2hgeiTXJfEOC3cWqTbVeomqhjNF3/vZlF3hC5zw5pQY5abkUuwUkxsQyRGa7kZcpk
	 6M1zV1dxzH9CgTyvID3JDJPXhPPLj6ZaIdmxaILO/kabZzN8rhMAssxCAObADzqXcE
	 k/LxzIyV8XrdeShSxA2RygfstjVfNdhUU6sYY8z7PMyunpmmbIfvWJURQdZS/OOHDx
	 duXqVfzPyelww==
Date: Tue, 28 Jul 2026 08:27:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 01/12] dt-bindings: clk: zte: Add zx297520v3 top clock
 and reset controller
Message-ID: <20260728-proficient-boobook-of-will-2cc94a@quoll>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260727-zx29clk-v8-1-7a107b00f1dd@gmail.com>

On Mon, Jul 27, 2026 at 09:24:16PM +0300, Stefan D=C3=B6singer wrote:
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
> +
> +  reset-names:
> +    items:
> +      - const: usb
> +      - const: hsic

You do not need these two. It's one device and DT does not represent
internal device wirings because they are redundant (deducible from the
compatible).

> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#phy-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  syscon-reboot:
> +    type: object
> +    $ref: /schemas/power/reset/syscon-reboot.yaml#
> +    description:
> +      Reboot method for the SoC.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names
> +  - syscon-reboot
> +  - "#clock-cells"
> +  - "#phy-cells"
> +  - "#reset-cells"
> +
> +unevaluatedProperties: false

This was different last time and previous code was correct.

> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/reset/zte,zx297520v3-reset.h>
> +    #include <dt-bindings/phy/zte,zx297520v3-topcrm.h>
> +    #include <dt-bindings/clock/zte,zx297520v3-clk.h>
> +
> +    topcrm: clock-controller@13b000 {
> +        compatible =3D "zte,zx297520v3-topcrm", "syscon";
> +        reg =3D <0x0013b000 0x400>;
> +        clocks =3D <&osc26m>, <&osc32k>;
> +        clock-names =3D "osc26m", "osc32k";
> +        interrupts =3D <GIC_SPI 42 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 43 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 45 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 46 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names =3D "usb-up", "usb-down", "hsic-up", "hsic-down";
> +        resets =3D <&topcrm ZX297520V3_USB_PHY_RESET>,
> +                 <&topcrm ZX297520V3_HSIC_PHY_RESET>;
> +        reset-names =3D "usb", "hsic";
> +        #clock-cells =3D <1>;
> +        #phy-cells =3D <1>;
> +        #reset-cells =3D <1>;
> +
> +        syscon-reboot {
> +          compatible =3D "syscon-reboot";
> +          offset =3D <0x0>;
> +          mask =3D <0x1>;
> +          value =3D <0x1>;
> +        };

Best regards,
Krzysztof

