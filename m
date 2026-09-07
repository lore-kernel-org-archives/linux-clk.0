Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88CD3AFAEF;
	Mon,  7 Sep 2026 09:59:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788775172; cv=none; b=tncGCjvNeZg2gD5nuGkcnoELcBYAgGencD3yROuGboSvkFU5jo5QUsygpI9kUXVDfVJDrMNxn6Tr9HULNb4G0g4s8tj1Bu3TS7lgnjlNCwD5Amr2tv/5lLZGplu7sE18NWdXeiacNE/DOR+2RzNT6+dahlIK9JZX2+y+dUzOzQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788775172; c=relaxed/simple;
	bh=8MJKxxoccE8R0yQTP0Xn0yEz2tqNsX4Ml0v7HyjBe/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDdsGE8rHRk/Nb3jpTOBcfBBF9bksCq/unGM348DZmt67dHUebVOXK7LdmkXJXvn7qjz+OY5XaFKnKOo7roecXo8MCYkVLwSRbsm6gtorIO1hINpSNB05j3O8Du8r5Zj6YDAILsGadYkEQAjoHOT1O7uljymoOnucPKYOBatbxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=RBCObkqe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="RBCObkqe"
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id EE937C45;
	Mon,  7 Sep 2026 11:57:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1788775073;
	bh=8MJKxxoccE8R0yQTP0Xn0yEz2tqNsX4Ml0v7HyjBe/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RBCObkqevtvA6PD8XPgIjA+Iw5TAy3OzJlnKh7XeMYZXAH9sMNdXQKjDhFhrGCdVf
	 o9p5o+z1VwCKp4JaESH0yDvzuDsTba9jgOZiKbLNW1QJnqyX8T3nu8EXd/ONdC3uKY
	 rEbtykvpq3Y9V6Ap+LgBfIwZSVWj6d/YX0jpHxj0=
Date: Mon, 7 Sep 2026 12:59:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
Message-ID: <20260907095926.GA1672293@killaraus.ideasonboard.com>
References: <20260615-rcar-du-dsc-v5-0-aed1a28610e4@ideasonboard.com>
 <20260615-rcar-du-dsc-v5-4-aed1a28610e4@ideasonboard.com>
 <20260702212423.GA3662157@killaraus.ideasonboard.com>
 <7be9a590-2c27-4725-89eb-dad9dc3632b9@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7be9a590-2c27-4725-89eb-dad9dc3632b9@ideasonboard.com>

On Mon, Sep 07, 2026 at 11:56:01AM +0300, Tomi Valkeinen wrote:
> On 03/07/2026 00:24, Laurent Pinchart wrote:
> > On Mon, Jun 15, 2026 at 04:11:57PM +0300, Tomi Valkeinen wrote:
> >> Enabling DSI clocks on rcar-du needs some tricks as the DU dot clock is
> >> provided by the DSI. Thus, we call rcar_mipi_dsi_pclk_enable() from the
> >> crtc, when enabling the crtc.
> >>
> >> With DSC (added in upcoming patch) in the pipeline, between the DU and
> >> the DSI, the above call path is broken as the crtc tries to call
> >> rcar_mipi_dsi_pclk_enable() on the DSC.
> >>
> >> To solve this problem, make sure we store the DSI bridge to the
> >> rcdu->dsi[] array, instead of the first bridge in the DSI pipeline
> >> (which can be DCS), by checking the bridge's bridge->type.
> >>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> >> ---
> >>   drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c | 18 ++++++++++++++++--
> >>   drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c   |  1 +
> >>   2 files changed, 17 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> >> index db2088529b48..ac85838ab3b8 100644
> >> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> >> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_encoder.c
> >> @@ -89,9 +89,23 @@ int rcar_du_encoder_init(struct rcar_du_device *rcdu,
> >>   				drm_bridge_get(bridge);
> >>   
> >>   		if (output == RCAR_DU_OUTPUT_DSI0 ||
> >> -		    output == RCAR_DU_OUTPUT_DSI1)
> >> +		    output == RCAR_DU_OUTPUT_DSI1) {
> >> +			struct drm_bridge *dsi_bridge;
> >> +
> >> +			/*
> >> +			 * When we have a DSC block between the DU and the DSI,
> >> +			 * the "bridge" points to the DSC. Detect the DSC by looking
> >> +			 * at the bridge type, and skip the DSC if the bridge is not
> >> +			 * the DSI bridge.
> >> +			 */
> >> +
> >> +			dsi_bridge = bridge->type == DRM_MODE_CONNECTOR_DSI ?
> >> +						     bridge :
> >> +						     bridge->next_bridge;
> > 
> > The indentation looks weird.
> > 
> > 			dsi_bridge = bridge->type == DRM_MODE_CONNECTOR_DSI
> > 				   ? bridge : bridge->next_bridge;
> 
> That looks even weirder, you are associating = and ? there. What about:
> 
> dsi_bridge = bridge->type == DRM_MODE_CONNECTOR_DSI ?
> 	     bridge : bridge->next_bridge;

I like my version better :-)

-- 
Regards,

Laurent Pinchart
