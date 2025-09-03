Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412052DC344;
	Wed,  3 Sep 2025 08:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756886916; cv=none; b=DHm5wmPOhcODc4lNl3QCPTZVYChDQNp15JA9UiFfy7L6L6Jm5yQAe5ijXlYqrtyDHea/u0rF79SV0kq5DgU08LO2c2nbuXI8muD8CtXAyY2jA4oxZHSRv2Ef6DwuVTeeW2kw3igd/TankCUe/qoNgrhGu3boZJJS5TlFvjOanso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756886916; c=relaxed/simple;
	bh=EMAfKG5WztTKvDmx2+gKQZ2+1J1TvqlSW1ctnPEBHNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSFXBiMYBh4KJkoTY4VDFTFOxM5W77GO5E650pP16htLmcIvMoV7tNAg4ZulWx4a95tZKfpODvfCIwf7NDpkcK8LLd1+Re3O0JCQO0YYRsnOuADpgcLbx38j7OEht3c7fLbqinfB7fgN1g4SaSkihY1B/xmnaqCR7QHUpkxgd9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M3/uVeBT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M3/uVeBT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3043BC4CEF0;
	Wed,  3 Sep 2025 08:08:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756886915;
	bh=EMAfKG5WztTKvDmx2+gKQZ2+1J1TvqlSW1ctnPEBHNQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M3/uVeBTi+xK76sun7oUdvRHtu8uyW3MPEyCizLqysjXs1iW5jiL/JcrfwrkbIgVd
	 0nUNFeChtEXOKMOL97pWuY8dSN/P2QETLkeXWbJd/5pk2B5/GR5ARwUBrbTi7cWOTx
	 lAvQPQ+ei/Tvf0bXHK4aHI9Xv39IvpzNCO+/KN94l7IJHuB3gFzpahMkIyd0zCHK+A
	 aScBW6MiGHRrmEeGmf/NHdwutn3oBvU7y9473mbov96FchaY0sx3YTa3neOMcr9vf6
	 xFA6OU/eNYpYhJlHglbdWuKGzSd2kOFgLIRRf3QYPe7TORLMrGwjxYAikl5SCAFbx/
	 qLhyjTTfwA7qw==
Date: Wed, 3 Sep 2025 10:08:33 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [PATCH 1/5] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU
 CCU clock controller
Message-ID: <20250903-meticulous-didactic-degu-621fe0@kuoka>
References: <20250903000910.4860-1-andre.przywara@arm.com>
 <20250903000910.4860-2-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250903000910.4860-2-andre.przywara@arm.com>

On Wed, Sep 03, 2025 at 01:09:06AM +0100, Andre Przywara wrote:
> There are four clock controllers in the A523 SoC, but only three are
> described in the DT binding so far.
> 
> Add a description for the CPU CCU, which provides separate clocks for
> the two CPU clusters and the DSU interconnect.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      | 25 +++++++++++++++++++
>  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 ++++++++++
>  2 files changed, 38 insertions(+)
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> index 1dbd92febc471..367d26800fd0d 100644
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
> @@ -64,6 +65,30 @@ allOf:
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

Filename based on compatible.


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
> +#define CLK_CPU_DSU		8
> +#define CLK_CPU_B		9

I don't see the header being used by the driver and odd numbers (they
should start from 0 or 1) suggest these are not bindings.

Otherwise please explain in commit msg what exactly are you binding
here.

Best regards,
Krzysztof

