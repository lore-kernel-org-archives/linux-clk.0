Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14F11C07D9;
	Mon, 10 Mar 2025 12:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741610418; cv=none; b=KSlOZ3EZwZPocaXhwSc5cY4C2KnJYa4qo9bhLJnmH0d127GdKcPG0X3wR586+2Aj0Rto3eo3gAoSMVpzKHSI6Luwy9YcgHwByv8HpqBq6TeKE1M/VfJpmKHWecJlK1kC4XS6fe1TJ8Faz84fb6TTnVe7oRjad4DZ6YfgKgRPHco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741610418; c=relaxed/simple;
	bh=H8MkukXKrs1gXyaQdWlj/mYQZibbo5Fhpikh/80QqZk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYotfuq3txNB8UJrwZygWfyR9AEs36jBVPdPk74NCn52NjuVqShqtkOcmIH+p2uVgO0ELjCvkWaYqQYenaNo1xoFiM+GRLLTDSryR/bcvq818wnlKN7dhDkSaEncl7j47C7Ek/GkbS1IFakjcvaMwWnktxO8fzcTiCY1M2VAiWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OU7eweTU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OU7eweTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE40BC4CEF0;
	Mon, 10 Mar 2025 12:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741610416;
	bh=H8MkukXKrs1gXyaQdWlj/mYQZibbo5Fhpikh/80QqZk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OU7eweTUodKoVT9kzSHOX2+bCR2sRfjGewUj0AL42sokgzxf+zbLLoCvkUBRMkYHr
	 YqnVHTLHzG8wBV9cQFVqvTFOfjOWP5vIlPsnRotGJQD5OIbBlvPQDqO7Xsuf/L0heg
	 Frq89NR/lx7PZ39bM3gmfQgOjzXS3ZrX95CjIZn3m+32cf8DBqseFi667hvz6QONN3
	 hVb2aCfOLeMOHgO6/Jb+ffvfv0m/foHouvTQ44LvzUaBYY1TN0f8Fls4iOUWjThlqE
	 BgK6bUDdsTF8X3lA7uovbQc3BT/2WTsUg33dxKagtAxdQOjCUFzc1bjTfJhfdQz230
	 mxjaGxJJgTEkw==
Date: Mon, 10 Mar 2025 07:40:14 -0500
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
Subject: Re: [PATCH v8 05/11] dt-bindings: allwinner: add H616 DE33 bus
 binding
Message-ID: <20250310124014.GA3866055-robh@kernel.org>
References: <20250310092345.31708-1-ryan@testtoast.com>
 <20250310092345.31708-6-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250310092345.31708-6-ryan@testtoast.com>

On Mon, Mar 10, 2025 at 10:09:51PM +1300, Ryan Walklin wrote:
> The Allwinner H616 and variants have a new display engine revision
> (DE33).
> 
> Add a display engine bus binding for the DE33 and increase reg maxItems
> to 3 to accommodate additional register blocks.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> 
> ---
> Changelog v1..v2:
> - Correct DE2 bus enum to reflect fallback devices accurately.
> 
> Changelog v2..v3:
> - Separate content into three patches for three separate subsystems
> 
> Changelog v5..v6:
> - Increase reg maxItems to 3.
> ---
>  .../devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml  | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> index 9845a187bdf6..317a27cf590b 100644
> --- a/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> +++ b/Documentation/devicetree/bindings/bus/allwinner,sun50i-a64-de2.yaml
> @@ -24,11 +24,14 @@ properties:
>      oneOf:
>        - const: allwinner,sun50i-a64-de2
>        - items:
> -          - const: allwinner,sun50i-h6-de3
> +          - enum:
> +              - allwinner,sun50i-h6-de3
> +              - allwinner,sun50i-h616-de33
>            - const: allwinner,sun50i-a64-de2
>  
>    reg:
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 3

You have to define what each region is and the order.

And there should be constraints such that the existing cases don't 
now allow 2-3 entries.

>  
>    allwinner,sram:
>      description:
> -- 
> 2.48.1
> 
