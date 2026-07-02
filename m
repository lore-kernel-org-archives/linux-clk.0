Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9645B1A6835;
	Thu,  2 Jul 2026 21:24:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783027470; cv=none; b=A2Mv4EcTRB7HsAaaSj68poHsb9NEZ2zfbY7zI/yk/RCtc/4N7KYIOHlAamexUW3qsO+b1hJmhqYjbDdaYVOnWtcC1fi97ovThI+AW6rX3JHMQsXSs6dN0ykUKWlDa0T7EHLithF0sw0MkWGxHPTltBdMgEuxyHg0+SgKvrSQM14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783027470; c=relaxed/simple;
	bh=7h8p5JymaPl6j2G50UYplFLnTLxP1bHA5e/xdPIdqPo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SdcL/J8I56gmd7m1M+Z/7OkoqjNsZfwesxkpIZ8K5fsYDe5MUneSAGR8BFp9b+AS8vJB0rM+RKXrrkbwtcEfkvIlc/VUDDyU5wHI6Vr+Syc0LZmkdNfNHOMnFyHLgtqJfVM8/NaXVZNKbEUhy9EWZT/J+eZ6XFEvdg719rgy0kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IBPp5alA; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IBPp5alA"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8EEE3517;
	Thu,  2 Jul 2026 23:23:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1783027419;
	bh=7h8p5JymaPl6j2G50UYplFLnTLxP1bHA5e/xdPIdqPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IBPp5alAe2KGTmJ2fOV0p9hAaIyV+xM2eG0an2/7GOgZRazZE1wqoU6V32WJnZEmn
	 d68yhWXdD95YPckw68EKGX0RM6wZ5emQgqlWkai+pL35nMYeF6jvjxECVM1hkeHEGV
	 gBdsxA5V7Tsp4EpIfEyp7C1pvH9o9yszsdLpZQ4Y=
Date: Fri, 3 Jul 2026 00:24:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v5 4/7] drm/rcar-du: dsi: Support DSC in the pipeline
Message-ID: <20260702212423.GA3662157@killaraus.ideasonboard.com>
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
 <20260615-rcar-du-dsc-v5-4-aed1a28610e4@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260615-rcar-du-dsc-v5-4-aed1a28610e4@ideasonboard.com>

Hi Tomi,

Thank you for the patch.

On Mon, Jun 15, 2026 at 04:11:57PM +0300, Tomi Valkeinen wrote:
> Enabling DSI clocks on rcar-du needs some tricks as the DU dot clock is
> provided by the DSI. Thus, we call rcar_mipi_dsi_pclk_enable() from the
> crtc, when enabling the crtc.
> 
> With DSC (added in upcoming patch) in the pipeline, between the DU and
> the DSI, the above call path is broken as the crtc tries to call
> rcar_mipi_dsi_pclk_enable() on the DSC.
> 
> To solve this problem, make sure we store the DSI bridge to the
> rcdu->dsi[] array, instead of the first bridge in the DSI pipeline
> (which can be DCS), by checking the bridge's bridge->type.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 18 ++++++++++++++++--
>  drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  1 +
>  2 files changed, 17 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> index db2088529b48..ac85838ab3b8 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> @@ -89,9 +89,23 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
>  				drm_bridge_get(bridge);
>  
>  		if (output == RCAR_DU_OUTPUT_DSI0 ||
> -		    output == RCAR_DU_OUTPUT_DSI1)
> +		    output == RCAR_DU_OUTPUT_DSI1) {
> +			struct drm_bridge *dsi_bridge;
> +
> +			/*
> +			 * When we have a DSC block between the DU and the DSI,
> +			 * the "bridge" points to the DSC. Detect the DSC by looking
> +			 * at the bridge type, and skip the DSC if the bridge is not
> +			 * the DSI bridge.
> +			 */
> +
> +			dsi_bridge = bridge->type == DRM_MODE_CONNECTOR_DSI ?
> +						     bridge :
> +						     bridge->next_bridge;

The indentation looks weird.

			dsi_bridge = bridge->type == DRM_MODE_CONNECTOR_DSI
				   ? bridge : bridge->next_bridge;

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

> +
>  			rcdu->dsi[output - RCAR_DU_OUTPUT_DSI0] =
> -				drm_bridge_get(bridge);
> +				drm_bridge_get(dsi_bridge);
> +		}
>  	}
>  
>  	/*
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> index aaafee1c060b..f429f03a380c 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
> @@ -957,6 +957,7 @@ static int rcar_mipi_dsi_host_attach(struct mipi_dsi_host *host,
>  
>  	/* Initialize the DRM bridge. */
>  	dsi->bridge.of_node = dsi->dev->of_node;
> +	dsi->bridge.type = DRM_MODE_CONNECTOR_DSI;
>  	drm_bridge_add(&dsi->bridge);
>  
>  	return 0;

-- 
Regards,

Laurent Pinchart
