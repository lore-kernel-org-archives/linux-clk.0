Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558251;
	b=m1vy/wubToc+NnpoxpObutGzJCn3gmx0Abbs9xJLYfHBl+JjORikxjxpGic00rJD3QDT
	 X8Ufc+WTDDBLS3lZ4PtiKlM1+a4jdKp3WmurL27j3zsK8EufmW0OHxxPQzvzyYTecHLwV
	 8uIBImebBneAYY8rTzhG6CIOEoRnaoIAjm1t9MtUPPGAuG1D1bRJzjanPeMIQXR7lrNUs
	 ukHwzaNuiKfxuLuLsn19v/4IgdOJCaPevAsqbilZcN9MU3kvQVO4FYl33YkKoYXcHe70P
	 fv9j0ZvJRVcXcdjxpjoj0l4EY7uqzYfHTo1b+O5FmIXBHftgTwQRSrVf+dh87QL6Vzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558251;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=bbH2TQquUOC97ViKb2aXVBiUQChWmb/RmAEnkXSiyRU=;
	b=yQnKCa1JjzWyJB3cEDNBCzp0iPJPsWWqbF4Er5IqRWttQTwg/bcYN9oB/nSGT/2ARvO2
	 qPDVPWRqX6ri6+xlaItE8JSWs7AHBRCjGaXesVMJLy02fG43RZwyPCSXpQe0lI6xxPUN8
	 loPa/7vxOqB37LgbmHuEppA31dm19NUhN4/FzY1sBo096SWTCsx8bHxqb5elDQFPCwTbE
	 jHJ/DqxWGnn9X0C2+apPUDYrVEGd+8sts4zJ7/6ja3bwSZNRAQBC9DtnxeZB1QGFN4iQ3
	 rW34OMU21aVtZNKSm8QAHCdyxD1CVW9mniaxTHDeoesBnLMg6NSxA/sdjrFE1dgbM1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3qoJLPo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592FB606A327;
	Fri, 13 Nov 2026 08:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=n3qoJLPo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3121F000C4;
	Fri, 13 Nov 2026 08:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794558250;
	bh=bbH2TQquUOC97ViKb2aXVBiUQChWmb/RmAEnkXSiyRU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=n3qoJLPokG9v/YVuZSy+ta4GdPuE7rbzBOsn35dVoa98Z5Y31TGZbBOMf8vmyWOP1
	 SZD7LXx9RELvy+anExj/i6b4iRZxX810CPDblBGUjHOQ/gt5PYwrnBwDSRnuI5j60w
	 4DN92OXxwxXfYCijCvMu60zgg7W9NleojlekfX8jHJ6kqY85VibE3X/KIKpVxbki/m
	 YsKDTtDfQ+P9ELxR4hIFAUmhFbFvdApxgw3i3585K9wRlo+uS0MCXNPJq6soK+l42d
	 2aGdkNQLPUwJLADCVP8H/EqvyvvZ6EANHyiTK6jZrFGNzURME72vlqYQPceqFDt/qe
	 JPKVjzNddZ3FA==
Date: Fri, 13 Nov 2026 09:24:07 +0100
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
Subject: Re: [PATCH v2 2/5] dt-bindings: arm: stm32: Add clock-controller
 sub-node to STM32MP2 SYSCFG
Message-ID: <20261113-honorable-competent-lynx-b1d5b8@quoll>
References: <20261110-ups_mp25_clk_syscfg-v2-0-624559bb8ec7@foss.st.com>
 <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>
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
In-Reply-To: <20261110-ups_mp25_clk_syscfg-v2-2-624559bb8ec7@foss.st.com>

On Tue, Nov 10, 2026 at 02:10:22PM +0100, Gabriel Fernandez wrote:
> The SYSCFG of the STM32MP23x and STM32MP25x SoCs is described as the
> provider of the LTDC pixel clock, but the inputs of this mux (LTDC
> kernel clock, LVDS PHY pixel clock and DSI PHY byte lane clock) can't
> be described by the "clocks" property of the SYSCFG node: the SYSCFG is

Not true, you can.

> a syscon, whose first clock is taken as the clock of its registers and
> enabled around each register access.

That's a driver problem, fix drivers.

> 
> Add a clock-controller sub-node to describe the mux with its own clock
> inputs. It is required on STM32MP23x and STM32MP25x and not allowed on
> the other SoCs.
> 
> Deprecate the '#clock-cells' property of the SYSCFG node, which is no
> longer required. No driver ever registered a clock on the SYSCFG node,
> so this doesn't change anything for existing devicetrees.
> 
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
>  .../devicetree/bindings/arm/stm32/st,stm32-syscon.yaml        | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> index a559f8b03b84..13c02844a91f 100644
> --- a/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> +++ b/Documentation/devicetree/bindings/arm/stm32/st,stm32-syscon.yaml
> @@ -38,6 +38,10 @@ properties:
>  
>    "#clock-cells":
>      const: 0
> +    deprecated: true
> +    description:
> +      The LTDC pixel clock multiplexer is described by the clock-controller
> +      sub-node.
>  
>    "#address-cells":
>      const: 1
> @@ -45,6 +49,10 @@ properties:
>    "#size-cells":
>      const: 1
>  
> +  clock-controller:
> +    type: object
> +    $ref: /schemas/clock/st,stm32mp25-syscfg-clk.yaml#
> +
>  patternProperties:
>    "^phy@2[48]00$":

As you can easily see, each child needs addressing. This is one more
argument why this is a fake device split, done only to match your driver
limitation. Please fix your drivers.

Best regards,
Krzysztof

