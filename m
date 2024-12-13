Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A4A1C3BEB;
	Fri, 13 Dec 2024 10:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734087328; cv=none; b=rbog/J1YulD1KwsDZ33N+1y+IJSjIA98vnjEwaQXHYuEK+aw0HITwNFWThofH4fjc7FJ1CfctM0R8i8xbOWu0+Y/jcmJiBLUZu4Pwtlgeri5d7K+lzvbC+9YKMXNk9BEXAv73JeYZ8Coejeqh4RxBJXBr/OcTgNDn5oABoNeVNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734087328; c=relaxed/simple;
	bh=/sIQNiCyvCJV1BU0yujr3/A2B9wAu1BGuwyBU4noC2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dtydaH76Zg622wTzBVB4WMbcpeFmJ877EofKmW7MIO1ZD7q27firWZrezFG8v3KU+37x5GutZSxFdleT7gk6JmB0P4HVsTvJ+ZF53/VexYpsp46MyI0HXIVSdQHao5MeFuAbWYVuOeERmdMn8nXmDop2y4WyoLShWdFeuJRUFyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gGl3GROS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gGl3GROS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADCECC4CED0;
	Fri, 13 Dec 2024 10:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734087326;
	bh=/sIQNiCyvCJV1BU0yujr3/A2B9wAu1BGuwyBU4noC2U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gGl3GROSZcllCztHrgYMNvJ+Ez+9jaWvrE0TcBxsMc3at1ozAWYkDyT7Cr3AP+615
	 G5svGg75KGrSqcJrBgMFtdjqUD9FLjOLKF6K3P9mT+uYYsPNnxqtzyG+XZfgeFjZHr
	 IlVigeckSfCcmoyMzYvt4EcMHKDCW2r8mo/Gygwniiuj28Go8LSL0plhXT8CwnyDFR
	 Cyh8RP7qLYfP2joQoaYh/oKuLjP3J8IsmECgvF69CcLUanJE4Y94jDhR599d7cQpXj
	 HfDIm4Gq8B7cZ5r4He81i5vT161LKmcQXi+JScrV6yZAOv/2Wb9LPPqS/bi+qBo4Pp
	 SVZgHaXJsAH3A==
Date: Fri, 13 Dec 2024 11:55:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-binding: clock: cs2600: Add support for the CS2600
Message-ID: <gofhuzpxqm4fmusebwkjbgblffk5ail27mtgdk4vpwjvyhipcw@2ep6gpgjkgwl>
References: <20241211003236.2523604-1-paulha@opensource.cirrus.com>
 <20241211003236.2523604-2-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241211003236.2523604-2-paulha@opensource.cirrus.com>

On Tue, Dec 10, 2024 at 06:32:35PM -0600, Paul Handrigan wrote:
> Add device tree support for the Cirrus Logic CS2600 clock
> device.
> 
> Signed-off-by: Paul Handrigan <paulha@opensource.cirrus.com>
> ---
>  .../bindings/clock/cirrus,cs2600.yaml         | 78 +++++++++++++++++++
>  include/dt-bindings/clock/cirrus,cs2600.h     | 23 ++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
>  create mode 100644 include/dt-bindings/clock/cirrus,cs2600.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> new file mode 100644
> index 000000000000..ed23f347f382
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/cirrus,cs2600.yaml
> @@ -0,0 +1,78 @@
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
> +description: |

Do not need '|' unless you need to preserve formatting.

> +  The CS2600 is a system-clocking device that enables frequency synthesis and
> +  clock generation from a stable timing reference clock. The device can generate
> +  low-jitter clocks from a noisy clock reference at frequencies as low as 50 Hz.

Be sure these are wrapped at 80 (looks like 81).

> +
> +properties:
> +  compatible:
> +    enum:
> +      - cirrus,cs2600
> +
> +  clocks:
> +    description:
> +      Common clock binding for XTI/REF_CLK, CLK_IN

Just drop description, kind of obvious from the clock-names. If you want
to keep it, then rather list the items with description per each item.

> +    maxItems: 2
> +
> +  clock-names:
> +    items:
> +      - const: ref_clk

s/ref_clk/ref/
(or xti)

"clk" is just obvious.

> +      - const: clk_in
> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +  vdd-supply:
> +    description: Power Supply
> +
> +  cirrus,aux-output-source:
> +    description:
> +      Specifies the function of the auxiliary clock output pin
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum:
> +      - 0 # CS2600_AUX_OUTPUT_FREQ_UNLOCK: Frequency unlock notification
> +      - 1 # CS2600_AUX_OUTPUT_PHASE_UNLOCK: Phase unlock notification
> +      - 2 # CS2600_AUX_OUTPUT_NO_CLKIN: CLK_IN is not available

I don't get the meanings - how clock output could be clock is not
available? clk_in is a required property, so it cannot be unavailable.


> +    default: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/cirrus,cs2600.h>
> +
> +    i2c@0 {

i2c {

> +      reg = <0x0 0x100>;

Drop reg

> +      #address-cells = <1>;
> +      #size-cells = <0>;
> +
> +      clock-controller@2c {
> +        #clock-cells = <1>;
> +        compatible = "cirrus,cs2600";
> +        reg = <0x2c>;
> +        clocks = <&xtl_clk>, <&sync_clock>;
> +        clock-names = "ref_clk", "clk_in";
> +        vdd-supply = <&vreg>;
> +      };
> +    };
> diff --git a/include/dt-bindings/clock/cirrus,cs2600.h b/include/dt-bindings/clock/cirrus,cs2600.h
> new file mode 100644
> index 000000000000..673b4b4cb1f4
> --- /dev/null
> +++ b/include/dt-bindings/clock/cirrus,cs2600.h
> @@ -0,0 +1,23 @@
> +/* SPDX-License-Identifier: (GPL-2.0 OR MIT) */
> +/*
> + * Copyright (c) 2024 Cirrus Logic, Inc. and
> + *		      Cirrus Logic International Simiconductor Ltd.
> + *
> + * Author: Paul Handrigan <paulha@opensource.cirrus.com>
> + *
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_CIRRUS_CS2600_H
> +#define _DT_BINDINGS_CLK_CIRRUS_CS2600_H
> +
> +/* CS2600 Clock Outputs  */
> +#define CS2600_CLK_OUTPUT		0

Drop "OUTPUT". These are names of the clocks.

> +#define CS2600_BCLK_OUTPUT		1
> +#define CS2600_FSYNC_OUTPUT		2
> +
> +/* CS2600 Auxiliary Output */
> +#define CS2600_AUX_OUTPUT_FREQ_UNLOCK	0
> +#define CS2600_AUX_OUTPUT_PHASE_UNLOCK	1
> +#define CS2600_AUX_OUTPUT_NO_CLKIN	2

Not sure what are these, but feel like some register values. Otherwise,
why these are exactly bindings? What part of driver do they bind?

Best regards,
Krzysztof

