Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE2933955C0;
	Thu, 10 Sep 2026 08:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789028324; cv=none; b=RXMJwO5ikNFbeKh9DQtYr7qhteO1PPWfL/Qmdon1Z/rr/0jgJhldwUh380XGHBDcKlZMJ81g9xgh/OIQndVwfcCKn3d2Jt0JuvgQKJMnSbyIkJ12PiOoQh2IU25qP7N863BVIwVvFZNwHOpe3E2mKPT91OXoqJZdd35ML9EbxUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789028324; c=relaxed/simple;
	bh=+s3gXFg0A7TRvCuEVhPty6xAyfGgMhu7fM5nfEIhCx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r5tY/ZGNub+kTA6BIg+AKqterH+CvJRJt0QocRwLS03lyCnTQgQm/Un+gYX0N7+R8KJwfpfu0ZCeXkEOIuUVvYVhFeCar5b+jJkvu11UFheXcLJ5wNx2SFxp4vszjbGlCYzgONVsM6+wI27CVQcisvias8B/UhvH6bY+4e4qKgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkgi9nSF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkgi9nSF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2524E1F000FF;
	Thu, 10 Sep 2026 08:18:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789028322;
	bh=1vEmeHSRktXz2Zp/AeoCrE6FXGB8T1j415lF9mBeix4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nkgi9nSFRykN5Hn1sYrVe9y3lR7ExxJbTpq3t2nQ9ec6R2tYRySjBovEO3b28PfnG
	 H0oCKcc2DMC0RLq8+jVHIveIbeBwKrSbnS9kwBJ7Wa9GOeRsKMrtQffU6Emw7TfOCo
	 dWndxq15GSZ6ThhrHjFKaMJAoTSfJl9/AG8EriA2OvERbHnxjSjf+BL/6mpzvKyEVj
	 mkE+Vie10j2xqggaFNOLATBRiMcNkhnNv94uHhOCmD0YTgIwxtNat5frK4CSlHLaTU
	 7aeRRxtmDMSOI6Vx1LN8DdVFlxKlc1czCH52+6TFgbsfGWMqY57GeoNctxE7W4YfRN
	 zafzM/on/gExQ==
Date: Thu, 10 Sep 2026 10:18:38 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, 
	Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
	Heiko Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>, 
	Graham Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Subject: Re: [PATCH v3 04/19] dt-bindings: soc: starfive: Add
 starfive,jh7110-vout-syscon
Message-ID: <20260910-esoteric-axolotl-of-symmetry-c02f5f@quoll>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132716eucas1p2d093509db255e62e6bd546e734f04e63@eucas1p2.samsung.com>
 <20260904-jh7110-clean-send-v3-4-484f9ae72715@samsung.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260904-jh7110-clean-send-v3-4-484f9ae72715@samsung.com>

On Fri, Sep 04, 2026 at 03:27:05PM +0200, Michal Wilczynski wrote:
> The video output subsystem has its own system controller, documented as
> dom_vout_syscon. Among other things it holds the mux that selects which
> DC8200 output drives the HDMI transmitter, so the HDMI controller needs
> to reach it.
> 
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
> ---
>  .../devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml    | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> index 0039319e91fe6e6aadc4300114626348e4dfb7ce..47334f6c1243c9950e6fba44daacd41f42b55781 100644
> --- a/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml
> @@ -24,6 +24,7 @@ properties:
>            - enum:
>                - starfive,jh7110-aon-syscon
>                - starfive,jh7110-stg-syscon
> +              - starfive,jh7110-vout-syscon
>            - const: syscon
>  
>    reg:
> @@ -90,4 +91,9 @@ examples:
>          #power-domain-cells = <1>;
>      };
>  
> +    syscon@295b0000 {

Don't need new example for every compatible. You already have three...
and this one is exactly the same as the first one. Drop.

Best regards,
Krzysztof

