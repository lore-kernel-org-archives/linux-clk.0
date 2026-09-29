Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC1347ECDC;
	Tue, 29 Sep 2026 08:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790671355; cv=none; b=OwHQuSzaN7ahJPI+bgEVUszhNaMK14Z2d3oscrUK2ZJoVjSZ31s8vC9vDkyiUxaBQaRzNYYOhJrD6GVhOvz5uvUy/rFHV3IR/bKZ5Eqtq9JyIGcjn+495uTnNUQVJIjaVi8/5MnRUxxEZLCh1BnsSZwJ0HLDdPx7Qi0KuBZhw9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790671355; c=relaxed/simple;
	bh=f4y/mvoHZS071lB6AkPsZEkb4J49NsbE6lJ22i/vLPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OFAHpmbix/8wLSDolX03YA94rloGnbDrbSGYSabYk/dnu4ztYahNvUOEWxOGNgf1UdG3I8mMIO/yInscNYW7gUg1v+Twb8RNeqTdR6afzbYjh3ndzh3SYfrAtga+Xr0Xq3UXrnxsGMlHOr/svXpbkBWW5LDzZ3/8dIApsLxFb4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZU69Nbq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZU69Nbq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E2C1F00899;
	Tue, 29 Sep 2026 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671354;
	bh=5rtCPENpmtMMjeAjed2RbvlHNfF2BKBVrFP7DRlYUzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PZU69NbqSmv6V4oncymr1RvBFBZeu1qW6BHj8QQCiyA3HcVoQrT13YglXRwtGHAZI
	 6+1IRA492yJ650qrx1dj4OF7Ixz+dv6EYf5QJLH6e7dJxmZJH2g5bi746Cj8z+X2GO
	 1betMD3DDQcYIIgpP3fpXTZzYOcjHpjo8ob+yuoNjl2BWRkd8wDJSkJxTPqyqM2+qn
	 tJKERAehFlFPXWukoY3A8WbW5HcyXOpbLCL9PZUvYcp7a9vIMUtlH+r5zFK+9rvVnB
	 h2tZNORlQLJlGs+oaLNdBo9kZKABlzT4RvZ9RYz4FvpAFdsBynq/kLeOA0F+q+tdK8
	 O7c6BAAdXffTA==
Date: Tue, 29 Sep 2026 10:42:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU
 CCU clock controller
Message-ID: <20260929-aggressive-uptight-rattlesnake-35fdca@quoll>
References: <20260925225112.14081-1-andre.przywara@arm.com>
 <20260925225112.14081-3-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925225112.14081-3-andre.przywara@arm.com>

On Sat, Sep 26, 2026 at 12:51:10AM +0200, Andre Przywara wrote:
> There are four clock controllers in the A523 SoC, but only three are
> described in the DT binding so far.
> 
> Add a description for the CPU CCU, which provides separate clocks for
> the two CPU clusters and the DSU interconnect.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      | 38 ++++++++++++++++++-
>  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 +++++++
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> index 58be701a720ea..8d5481fb63ae8 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - allwinner,sun55i-a523-ccu
> +      - allwinner,sun55i-a523-cpu-ccu
>        - allwinner,sun55i-a523-mcu-ccu
>        - allwinner,sun55i-a523-r-ccu
>  
> @@ -35,12 +36,23 @@ properties:
>  
>  required:
>    - "#clock-cells"
> -  - "#reset-cells"
>    - compatible
>    - reg
>    - clocks
>    - clock-names
>  
> +if:

This goes to the allOf block.

> +  properties:
> +    compatible:
> +      contains:
> +        const: allwinner,sun55i-a523-cpu-ccu
> +then:
> +  properties:
> +    "#reset-cells": false
> +else:
> +  required:
> +    - "#reset-cells"
> +
>  allOf:
>    - if:
>        properties:
> @@ -64,6 +76,30 @@ allOf:
>              - const: iosc
>              - const: losc-fanout
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-cpu-ccu
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: High Frequency Oscillator (usually at 24MHz)
> +            - description: Low Frequency Oscillator (usually at 32kHz)
> +            - description: Internal Oscillator
> +            - description: Peripherals PLL 0 (1200 MHz output)
> +            - description: Peripherals PLL 0 (600 MHz output)
> +
> +        clock-names:
> +          items:
> +            - const: hosc
> +            - const: losc
> +            - const: iosc
> +            - const: pll-periph0-2x
> +            - const: pll-periph0-600m
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> new file mode 100644
> index 0000000000000..042f2310f64de
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h

Filename should match compatible.

> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 Arm Ltd.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> +#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> +
> +#define CLK_CPU_L		7

Indices start from 0 or 1

Best regards,
Krzysztof

