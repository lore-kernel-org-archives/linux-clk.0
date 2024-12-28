Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80522BE6C;
	Sat, 28 Dec 2024 10:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735381035; cv=none; b=SyvH8i3n6PXEV9625KoEM+cXByGJakwfGr5YTiXZ6sxD3yyuKo2Xa75J8puqkLIotbDroVyS5Mt4tLY0r33X2GLBztK67rADGAdO7DtT8UXSChwslCNfiFewXxRBLktB2bYxlRs4TJud22+GAKnpq1eN5tP3uvpLosRNEQqgMKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735381035; c=relaxed/simple;
	bh=5cYKv9mpdIN5LJ9ta0XDAgb1oAlvM6b6BtMv+WZ13QU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QCSN8ZVmSlBaNI+P3NEIOp0dzVJzGKpnwu4eqTwyhMy8aVwkkQGX6u3pXgFue3tkSVKcugx8ZwLbTDTMZp4k6UySwyHb08KLmfgjXDgnu8vYkbkYTuuFKzbkTtyNHwcNBHrUMxDxOtZAApup5rU228OObnzPRAZJITOpws62ElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjUs635n; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjUs635n"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27AB9C4CECD;
	Sat, 28 Dec 2024 10:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735381035;
	bh=5cYKv9mpdIN5LJ9ta0XDAgb1oAlvM6b6BtMv+WZ13QU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjUs635nTcbqrpKviVK1iBOI9kxvutGV4rfn5oA9ZhBwjVZQyWUMF5xQ/NfVluiFr
	 CyRpTsytmJH+irmb/pkYcbDfmvFDGbKHHK05xi9JOK89YW8H3EFt1hRcs9w20V7ThC
	 U+PkE/zekyQuWgaTOHoTiKO0GyBHraANf1dKWB24k6Ggp+cP2CeegONe+azsucZS1C
	 AsgtDZm9fNOMimU2szpLjPGDt9J7xFhYnJaivHEiOzPxL5pjxTbLQ1oJ1QK1pqzs/m
	 KZPlvK8xWy+rQthjcjUM3PS9a45FLCN9p30ySyi6u1xKzvhB9iLE5JPSPNVs6CGc/9
	 bse5dN5CZTSSQ==
Date: Sat, 28 Dec 2024 11:17:11 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: linux-clk@vger.kernel.org, sboyd@kernel.org, mturquette@baylibre.com, 
	devicetree@vger.kernel.org, krzk+dt@kernel.org, robh@kernel.org, conor+dt@kernel.org, 
	patches@opensource.cirrus.com
Subject: Re: [PATCH v3 1/2] dt-binding: clock: cs2600: Add support for the
 CS2600
Message-ID: <gx7ripx5jf42ytxja6c3cqb67je5uy3hf65tmr3gntj6wfytxq@5lox64h7s4ct>
References: <20241227224915.3813253-1-paulha@opensource.cirrus.com>
 <20241227224915.3813253-2-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241227224915.3813253-2-paulha@opensource.cirrus.com>

On Fri, Dec 27, 2024 at 04:49:14PM -0600, Paul Handrigan wrote:
> Add device tree support for the Cirrus Logic CS2600 clock
> device.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
> ---
>  .../bindings/clock/cirrus,cs2600.yaml         | 89 +++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> new file mode 100644
> index 000000000000..0be613c78a9c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/cirrus,cs2600.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Cirrus Logic Fractional-N Clock Synthesizer & Clock Multiplier
> +
> +maintainers:
> +  - Paul Handrigan <paulha@opensource.cirrus.com>
> +  - patches@opensource.cirrus.com>
> +
> +description:
> +  The CS2600 is a system-clocking device that enables frequency synthesis and
> +  clock generation from a stable timing reference clock. The device can
> +  generate low-jitter clocks from a noisy clock reference at frequencies
> +  as low as 50 Hz.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs2600
> +
> +  clocks:
> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      enum:
> +        - xti
> +        - clk_in
> +    minItems: 1
> +    maxItems: 2

This does not match clocks. Nothing here, neither commit msg nor
description, explains why this is so flexible.


> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1

Keep the same order of properties as in required list.

> +
> +  vdd-supply:
> +    description: Power Supply
> +
> +  clock-output-names:
> +    maxItems: 3
> +    description: Names for CLK_OUT, BCLK_OUT and FSYNC_OUT clocks.
> +
> +  cirrus,aux-output-source:
> +    description:
> +      Specifies the function of the auxiliary output pin with "PHASE_UNLOCK"
> +      to indicate the input and output clocks are not in phase, "FREQ_UNLOCK"
> +      to indicate the PLL is unlocked, and NO_CLKIN to indicate the clock on
> +      the clk_in pin is not present.

enum and lower-case

> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  cirrus,clock-mode:
> +    description:
> +      Sets the device into smart mode whith "SMART_MODE" and sets the device
> +      into smart mode that only outputs a clock when clk_in starts with
> +      "SMART_CLKIN_ONLY_MODE".

enum and lower-case

> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +unevaluatedProperties: false

This is supposed to be additionalProperties. See example-schema.

> +
> +examples:
> +  - |
> +

Drop blank line

> +    i2c {
> +      #address-cells = <1>;
> +      #size-cells = <0>;

Best regards,
Krzysztof

