Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3FE8F6D;
	Sun, 29 Sep 2024 19:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727639769; cv=none; b=ECkc4w1XjRIkdDMWL3mlJebOp8yvjuFjVD8mYy16q2DGIZmJHoY4zliEZ3oMWkTsBmKtE4nAHc9CfBai0O64A4+qSOSjHZxbXZA9sD/ExuPHiaT3lyViDNVmYk8363Ph665ucH/C07oBsrzmCF3sOwIJIiSl9wConJRvKkUbNJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727639769; c=relaxed/simple;
	bh=jzMzK7O17Re10O0mCQmGTuApUnxf3vcL8SpmRfsRi78=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kdu7HOtv77VNX3/GBB9DoZukqJpFXv+inSf36vcEOmbCwdbE+jbIm/YaDsrIM5KoVIWQXxtlCu4XCFP14IVlKuqnWdlU3XnUxFS6SX1HHWx4M75upjprlB582POLvcX+Ok9kY607jvuPXphxdrkxDMBt68AgkKeSq7OrgcwMKmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=USmky+oY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="USmky+oY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BAF4C4CEC5;
	Sun, 29 Sep 2024 19:56:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727639768;
	bh=jzMzK7O17Re10O0mCQmGTuApUnxf3vcL8SpmRfsRi78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=USmky+oYw5OKlBJLTygMRdumEiD+nUWz9yiuj+NebiQvDWk9ykwvVk+E7MV91f+cn
	 nw1qId0A8v8yjlGdsmEmB4QdGECjjj2mjPk7xRr2/y7nK8P3BYw310BRxVq1I0S2wv
	 sxoVKyh/nsDO956cKjLj7sSPvjQbW8C3PBzbd+WT4p79M96EygdYkOvTEvoOGRAaaV
	 wjf7OH1X5mjni5mSPdkUZOU5zi5rjI+zW6MTdqaR0AoDViyZZhqWBoDna8t70pMJr6
	 d9GstqIkJf8vfeaghQfToJWW26Mkigm2gqCZo2IfHeq5t6i5T/eiV2Xo3ZTlS8zqix
	 w1wNaXJaHsGxw==
Date: Sun, 29 Sep 2024 21:56:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: allwinner: add H616 sun4i audio codec
 binding
Message-ID: <dwp5z7ioahw7hb5celwhmeooaku2sgj4srzq7z4xmb3i3sa7y6@27rnjl72a2fo>
References: <20240929100750.860329-1-ryan@testtoast.com>
 <20240929100750.860329-5-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240929100750.860329-5-ryan@testtoast.com>

On Sun, Sep 29, 2024 at 11:06:05PM +1300, Ryan Walklin wrote:
> The H616 has an audio codec compatible with the sun4i-a10 driver.
> 
> The codec is relatively cut down compared to some of the other Allwinner
> SoCs and only has a single line-out route (relying on a separate digital
> microphone IP block for input). HDMI and SPDIF audio are handled
> separately by an audio hub IP block, which is not currently implemented
> in mainline kernels. This and the use of SDM requires some additional
> flexibility to the DMA and clock bindings.
> 
> Add compatible string and routing for the H616 audio codec, and update
> the required clock and DMA descriptions.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> ---
>  .../sound/allwinner,sun4i-a10-codec.yaml      | 55 +++++++++++++++----
>  1 file changed, 43 insertions(+), 12 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> index 78273647f7665..5838600dbc730 100644
> --- a/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> +++ b/Documentation/devicetree/bindings/sound/allwinner,sun4i-a10-codec.yaml
> @@ -22,6 +22,7 @@ properties:
>        - allwinner,sun8i-a23-codec
>        - allwinner,sun8i-h3-codec
>        - allwinner,sun8i-v3s-codec
> +      - allwinner,sun50i-h616-codec
>  
>    reg:
>      maxItems: 1
> @@ -30,24 +31,40 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: Bus Clock
> -      - description: Module Clock
> +    oneOf:
> +      - items:
> +          - description: Bus Clock
> +          - description: Module Clock
> +      - items:
> +          - description: Bus Clock
> +          - description: Module Clock
> +          - description: Module Clock (4X)

No, grow the list and add minItems instead.

>  
>    clock-names:
> -    items:
> -      - const: apb
> -      - const: codec
> +    oneOf:
> +      - items:
> +          - const: apb
> +          - const: codec
> +      - items:
> +          - const: apb
> +          - const: codec
> +          - const: audio-codec-4x

Same comment.

>  
>    dmas:
> -    items:
> -      - description: RX DMA Channel
> -      - description: TX DMA Channel
> +    oneOf:
> +      - items:
> +          - description: RX DMA Channel
> +          - description: TX DMA Channel
> +      - items:
> +          - description: TX DMA Channel
>  
>    dma-names:
> -    items:
> -      - const: rx
> -      - const: tx
> +    oneOf:
> +      - items:
> +          - const: rx
> +          - const: tx
> +      - items:
> +          - const: tx

These two properties are fine.

>  
>    resets:
>      maxItems: 1
> @@ -229,6 +246,20 @@ allOf:
>                - Mic
>                - Speaker
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun50i-h616-codec
> +
> +    then:
> +      properties:
> +        allwinner,audio-routing:
> +          items:
> +            enum:
> +              - LINEOUT
> +              - Line Out

That's odd, why two same names?

You must restrict the properties you just changed per each variant.

Best regards,
Krzysztof

