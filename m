Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BF722A1F1;
	Mon, 10 Mar 2025 12:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610538; cv=none; b=aq2UMYTGKAuSm0R5wSH6ts67X+eZyuQfKWLmIHl/6uIgAii2JarEbOtDpUItb8dZQysCiM2Aw/1dlfkumEZlDf2DVKAaRZAqixvx++Ys1cr/zi1Y/ZQlRZp+kpAdN4OHSgCaDs4QggyCyJqaaGsm/HNWGt2FNWEaT1yw/3trFIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610538; c=relaxed/simple;
	bh=ObpVnhp7/WvbJw/e+3sP5lgQP0HfPvs44VTr++TsRXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VPm3oFj3u+fQsdjcCgO2kv1dO5DDkMI8r4yX7+Hm9Ivdx7isIcfqfffU3SbiNJLn8ntUq3p78UrYfiitVW36VQOmucFLQ2q3IjSdP4vdQsj77EKFdFekZO/fbdDag6KORKzxj3rkeXrpkeelRRM8VAXqYxv6kJHt9BZf4FiXAvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TGfESHB/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TGfESHB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B3FDC4CEE5;
	Mon, 10 Mar 2025 12:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741610536;
	bh=ObpVnhp7/WvbJw/e+3sP5lgQP0HfPvs44VTr++TsRXI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TGfESHB/psqrhlcOLS+OwH6t7yooA+1QYsuVQnl8Ss5VqubkcbfYsnkx6p4bCfRmI
	 cJPbP4Q239ASJOSWlFY3vpa5YHVp1w3mCwD+HrIWQt+yc4aLNiZKLU8UPojZSCTzOc
	 LRTs1yk2A5OsO6ZykR8Z2WlysIWaXjW/BV7SsPrPnot9b9L+ZhGa37C/fvlXcABUjJ
	 0P4fTuROXrcaFGR5j2dsAAUWdPIYPGn3Z31Wg18FMqnQLq9pnLzgMDGktSiLGQksCG
	 mT5oZzh5PUtZYxMJS175ePcgJ5izvqCJCHu+JO1DKKSJfM7hsmUwo69gq///20jjSv
	 fyh7tVGiyhJ+g==
Date: Mon, 10 Mar 2025 07:42:14 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Chris Morgan <macroalpha82@gmail.com>,
	Hironori KIKUCHI <kikuchan98@gmail.com>,
	Philippe Simons <simons.philippe@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v8 07/11] dt-bindings: allwinner: add H616 DE33 mixer
 binding
Message-ID: <20250310124214.GA3869453-robh@kernel.org>
References: <20250310092345.31708-1-ryan@testtoast.com>
 <20250310092345.31708-8-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310092345.31708-8-ryan@testtoast.com>

On Mon, Mar 10, 2025 at 10:09:53PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> The mixer configuration registers are significantly different to the DE3
> and DE2 revisions, being split into separate top and display blocks,
> therefore a fallback for the mixer compatible is not provided.
> 
> Add a display engine mixer binding for the DE33.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> 
> Changelog v5..v6:
> - increase reg maxItems to 3 and add conditional for h616-de33
> ---
>  .../allwinner,sun8i-a83t-de2-mixer.yaml       | 21 ++++++++++++++++++-
>  1 file changed, 20 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> index b75c1ec686ad..274f5e632733 100644
> --- a/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> +++ b/Documentation/devicetree/bindings/display/allwinner,sun8i-a83t-de2-mixer.yaml
> @@ -24,9 +24,11 @@ properties:
>        - allwinner,sun50i-a64-de2-mixer-0
>        - allwinner,sun50i-a64-de2-mixer-1
>        - allwinner,sun50i-h6-de3-mixer-0
> +      - allwinner,sun50i-h616-de33-mixer-0
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

What's in each region?

>  
>    clocks:
>      items:
> @@ -61,6 +63,23 @@ properties:
>      required:
>        - port@1
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun50i-h616-de33-mixer-0
> +
> +    then:
> +      properties:
> +        reg:
> +          maxItems: 3
> +
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.48.1
> 
