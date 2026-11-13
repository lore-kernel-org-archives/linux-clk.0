Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558155;
	b=RM0ZW7UZWg0jlxpIstsEhITUMSSCBi6nkyGF0LnKid/tyo/Zpgzb3lGH3tMj9HlG11pg
	 DDo4Uq0fXxE4lXVQ29tiC7x/fknioA7FBdiYDBadYKDNCTwDHGbdM5/9GT3WDtv+CaRhB
	 72jACJSzfL80UC0jPh/pdThQ0cuk2XqB571qo2Xph3qY/dVGQYlbqqSd/FwZuV+93oFu6
	 klyOQCJXs/a/v7bcGqDI2809B0mGSpFTaCEVYA96tH5QKbmSm0TswEWPDQOVlnT8NIJ1+
	 9IgKIByuHA90NlkRuPHnKAwpFzcT3ee0Wv9z/xOylHgAm6Ge+7TbEWOTNP2khStsxgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558155;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=UXvFu+Wn1ESA3yGz4gkc3wR7DuZbJgWGF7pWZKVFO4w=;
	b=gY7dUDwom3LlM7Mr3DveVKkTXv8/jjGTqtbvE7+ACegsHtHVdfuJ4cc1ZCRFxX10VPvJ
	 WVcTa0HBmEmPeIKUdnEr+P9mTWJzvoOhHLdrjAgCw2Pi0vDKgb2Bn2QQGCmy5WEhjJllI
	 20EtCvmrR2owRqmOci2Y+uvtNTJveKst4O+KSAtpvb5WRAi2IE/WJ/70U+pYvUfJHJ50O
	 O7vPFRRSuvD4lqqzxciabYQxeyC/DpL2k7Ih53O0AZ+yvCJC8xnxvpi2208jBF5utfj0u
	 SMdoY1LC4ILsFZZLglzgUUgLTbV+7iiYeUmhKCMW8NOUq/I9OwaEgzxgm4UI3rV2Fxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SnzyokXF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C8606A323;
	Fri, 13 Nov 2026 08:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SnzyokXF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 528591F000C5;
	Fri, 13 Nov 2026 08:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558155;
	bh=UXvFu+Wn1ESA3yGz4gkc3wR7DuZbJgWGF7pWZKVFO4w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SnzyokXFuhEVSMurbyoM4lz70Pmp7QX1+Vry1yBy9/1gqKkwg/B3Ao5+tQQuQghZo
	 12IIuHadRtw9ptiOib143gO88XOQ4esR1jwITNxwt56TEMUGH1W3+UKSCmoFPRmFQa
	 BL633Sz6dAuGseT1ze7jSWShyfPUGbt5xuilY49Io5l0VTGQFDMdclwWlVa2Rapiq/
	 gSlXbqNpnd0wnMCYTfWdqh2MCQoHratcRN4ZasaXyu9nw+J7WiIwulblIvFpzUT0aF
	 E4YJUXGHhw4T++mqHxVzF7Ujyn1GrVV+U3qeQYxvZuo5lsgUgQe7EgDP/CO8lbkbm3
	 QGiKHn4NgYqZQ==
Date: Fri, 13 Nov 2026 09:22:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Christophe Roullier <christophe.roullier@foss.st.com>, Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: clock: Add STM32MP25 SYSCFG clock
 controller
Message-ID: <20261113-charming-admirable-pronghorn-bdc26c@quoll>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-1-624559bb8ec7@foss.st.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-1-624559bb8ec7@foss.st.com>

On Tue, Nov 10, 2026 at 02:10:21PM +0100, Gabriel Fernandez wrote:
> The SYSCFG of the STM32MP23x and STM32MP25x SoCs selects the LTDC pixel
> clock among the LTDC kernel clock, the LVDS PHY pixel clock and the DSI
> PHY byte lane clock.
> 
> Add the binding for this clock controller, described as a
> clock-controller sub-node of the SYSCFG node, along with the header
> defining the identifiers of the provided clocks.
> 
> A sub-node is needed since the inputs of the mux can't be described by
> the "clocks" property of the SYSCFG node: the SYSCFG is a syscon, whose
> first clock is taken as the clock of its registers and enabled around
> each register access.
> 
> The inputs are listed in the "ltdc", "lvds", "dsi" order so that the
> ones missing on a SoC (no LVDS nor DSI on STM32MP231/233 and
> STM32MP251/253) can be omitted at the end of the list. "#clock-cells"
> is 1 so that the other clocks of the SYSCFG can be added later without
> changing the binding.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../bindings/clock/st,stm32mp25-syscfg-clk.yaml    | 61 ++++++++++++++++++++++
>  .../dt-bindings/clock/st,stm32mp25-syscfg-clk.h    | 12 +++++
>  2 files changed, 73 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
> new file mode 100644
> index 000000000000..027d14f28b0c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/st,stm32mp25-syscfg-clk.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32MP2 SYSCFG clock controller
> +
> +maintainers:
> +  - Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> +
> +description: |
> +  The SYSCFG of the STM32MP23x and STM32MP25x SoCs provides clocks, described
> +  by a clock controller sub-node of the SYSCFG node.
> +
> +  The provided clocks are identified by the macros defined in
> +  include/dt-bindings/clock/st,stm32mp25-syscfg-clk.h:
> +    - CK_SYSCFG_PIX_LTDC: LTDC pixel clock, selected in the DISPLAYCLKCR
> +      register among the LTDC kernel clock, used by the RGB parallel output,
> +      the LVDS PHY pixel clock and the DSI PHY byte lane clock.
> +
> +properties:
> +  compatible:
> +    const: st,stm32mp25-syscfg-clk
> +
> +  "#clock-cells":
> +    const: 1

So you have 1 clock, thus drop the header and here you have cells=0.
> +
> +  clocks:
> +    minItems: 1

Why is this flexible? Device either has or has not these inputs.

> +    items:
> +      - description: LTDC kernel clock
> +      - description: LVDS PHY pixel clock
> +      - description: DSI PHY byte lane clock
> +
> +  clock-names:
> +    minItems: 1
> +    items:
> +      - const: ltdc
> +      - const: lvds
> +      - const: dsi
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +  - clocks
> +  - clock-names

Best regards,
Krzysztof

