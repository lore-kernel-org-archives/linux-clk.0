Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7DBA3FBB3;
	Wed,  8 Jan 2025 23:48:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736380088; cv=none; b=PE7/bEZwj0h8TCIPiTPeAdS9+/83Q8iFkEVzZtjKMPesy8JGwkBRPB3LXJjw2J1ryKcJAZ41DHY0UyFqCxMMLtlbQch7k9yE6CX+NKAkBJrS/gjeIyB3OUU7DIjTgg0M8BKFe3Jdeq4UmSF1p1UKbaq27HBfpxxtvZeWPVXPtXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736380088; c=relaxed/simple;
	bh=ESRJ1GfGU3MEBCTm3oBsNj+1YXHsyQuA8Y9s6R22loo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Aj5woMPM65DpN6ThXtg/QGK56x6bQYi1vpVFo5l+VpT585V44gzUpwG4FdIqdHjK+1ggnwCOr+kNWSPpnqYLUUuJjuWfnIReGIq13PrNTytdwr+1iy7JmgE78EMg9sei9IxzR/n7MjHG8MffvfHZOyo+wFaSHfX5LRTPr6vm1Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ugheSgSb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ugheSgSb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24ECDC4CED3;
	Wed,  8 Jan 2025 23:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736380088;
	bh=ESRJ1GfGU3MEBCTm3oBsNj+1YXHsyQuA8Y9s6R22loo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ugheSgSbDS6hkRB7HGXL3laCrlZxbxaHkELksEr8U6G2shFSLX5jXoxpp/lQF/XDX
	 fKZX05yJSKLKNDhgHUtDtEP05NbPvlI/9+cbhQI0l+PE/FDN7lJWGDz42j7gq/udmf
	 kBoUCzqLu5Ywl23r5nW3c5wvpZCZ7UGWhxnLIymHPGVlIwYuQjQQENYEVdo4pmEjca
	 pdcq4X3bRJvuNuUP32F7QuOq3p2BzT2bbkbQeVFTb3XmLhHRoYNLt1xPBrqBCQeY3p
	 UdWIQBAaN10nJVjRsMrCJzH5izPzpeCcG5dukXzA0PjpmXt03ga4GHH0fS6SQs+Z9O
	 SXqyTL9IkqaXA==
Date: Wed, 8 Jan 2025 17:48:07 -0600
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 4/6] dt-bindings: clock: st,stm32-rcc: support spread
 spectrum clocking
Message-ID: <20250108234807.GA1247672-robh@kernel.org>
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com>

On Sun, Jan 05, 2025 at 07:14:16PM +0100, Dario Binacchi wrote:
> The addition of DT bindings for enabling and tuning spread spectrum
> clocking generation is available only for the main PLL.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../bindings/clock/st,stm32-rcc.yaml          | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> index ae9e5b26d876..c345d3ff3fc4 100644
> --- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> @@ -77,6 +77,26 @@ properties:
>        Phandle to system configuration controller. It can be used to control the
>        power domain circuitry.
>  
> +  st,ssc-modfreq-hz:
> +    description:
> +      The modulation frequency for main PLL (in Hz)

No constraints?

> +
> +  st,ssc-moddepth-permyriad:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
> +    minimum: 25
> +    maximum: 200
> +
> +  st,ssc-modmethod:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      The modulation techniques for main PLL.
> +    items:
> +      enum:
> +        - center-spread
> +        - down-spread

What's the default? If there's only 2 possibilities, then you can use a 
boolean instead. Though I assume you want to support spread-spectrum 
disabled.

Are there dependencies between these properties? 

> +
>  required:
>    - compatible
>    - reg
> @@ -97,6 +117,10 @@ allOf:
>            const: 1
>            description: |
>              The clock index for the specified type.
> +        st,ssc-modfreq-hz: false
> +        st,ssc-moddepth-permyriad: false
> +        st,ssc-modmethod: false
> +
>      else:
>        properties:
>          '#clock-cells':
> @@ -118,6 +142,9 @@ examples:
>          reg = <0x40023800 0x400>;
>          clocks = <&clk_hse>, <&clk_i2s_ckin>;
>          st,syscfg = <&pwrcfg>;
> +        st,ssc-modfreq-hz = <10000>;
> +        st,ssc-moddepth-permyriad = <200>;
> +        st,ssc-modmethod = "center-spread";
>      };
>  
>    - |
> -- 
> 2.43.0
> 
