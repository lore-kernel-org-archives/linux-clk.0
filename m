Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758B81D618C;
	Sun,  2 Feb 2025 14:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738504826; cv=none; b=Rki1pQ7l1Dh2x4IuPlP4443ZrrcrDwN5UneaD2CLyChyPgXDyWhqNCnKDv2azlL9yrpfUViw1yceLygz0d0TpxwFYAUzYcXRCthWe4cqHd+RxNXT9DA4AQiJ6rrdiEUqoKe+iaIzah51eyP/C3yPYI7oZJ+acRlGwZQ7jBOxGBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738504826; c=relaxed/simple;
	bh=DzXPrddsd4/HbbCoDn4tV8Jh6qWf2J/+UIS1+YGvWRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RVNdwMCxtYFAhjw9Q9OV3NRPvtWdBen1qK0pwujRT6bgJz0lvAqe+szfrKMjz0PUHXU9UCEKAH7eEPdgx6JCCxNsxkj59GI3WQj7RJK12RIrDAX2KFOSEvvCXwCWhVIPKswMLIIX/bhRq6hQ1gFEnZ7yzOF/y6wt2b4h2JgHb9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ux7XG2JY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ux7XG2JY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FCB6C4CEE0;
	Sun,  2 Feb 2025 14:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738504826;
	bh=DzXPrddsd4/HbbCoDn4tV8Jh6qWf2J/+UIS1+YGvWRw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux7XG2JY1yFhXPOjhSFRAGl71XuD+jOnSkt48yjYzqkvJcpFu5jYLWMs3mphJCzY8
	 Dc1RBihb5PwpJa9Q5zMitb2KB4D1JRdM60QaD8c9SM6lDEEGMxbg7p7jPIzBp5/EBB
	 EmnLX+yZB1bOP/PvcuOwD82ej+g8BEsFDbxjTXHYiLBZLXrlcR4q3AFScAxNX7YpWM
	 IgND4zHpyMCLRdwv/xyWhyVnJD4+ciC0SnoFTZAGTs5cgMI6HF+oXKLjW3+QRhoNQs
	 D6aUT4b+bQVggR56YoOkzKzErzF595ldroM+hUWJecTwQMopZjgDBoN8gSN+GSfWQo
	 5x9ADaH81cobw==
Date: Sun, 2 Feb 2025 15:00:23 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clocks: atmel,at91rm9200-pmc: add missing
 compatibles
Message-ID: <20250202-fragrant-radical-fulmar-77ccae@krzk-bin>
References: <20250131162845.33637-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250131162845.33637-2-wsa+renesas@sang-engineering.com>

On Fri, Jan 31, 2025 at 05:28:45PM +0100, Wolfram Sang wrote:
> The driver support more SoCs. Add the missing ones.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>  .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml         | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> index 885d47dd5724..8b65390d2d54 100644
> --- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> +++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> @@ -34,6 +34,8 @@ properties:
>            - enum:
>                - atmel,at91rm9200-pmc
>                - atmel,at91sam9260-pmc
> +              - atmel,at91sam9261-pmc
> +              - atmel,at91sam9263-pmc
>                - atmel,at91sam9g45-pmc
>                - atmel,at91sam9n12-pmc

Please update also respective if:then: part with constraint for clocks.

Best regards,
Krzysztof

