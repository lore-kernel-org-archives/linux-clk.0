Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3C038F925
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 09:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837377; cv=none; b=OBlt2PYTJDoi9bFM7JygnBBwi6lKN53ELI2AeiSvKfS9tEJNCtq+skAuwIPLDL4ituzLwC1kPycEb7RqVEv/Cr/wZxGLAWhoAVFeV7ApujQRKRlQjsrMtFD4Uk2HjvMM2ozUvBaF3w81rNqlkbsOxgi7y8joilWajQ3nmQEmLhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837377; c=relaxed/simple;
	bh=1Gj/HPBROwqJ7CZWPHGQrV3g+Xz9J/TVthqlh8+3p+g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=temeNn499I/FTqVGwumqlvgGwukwtKAr6BpZdOmMoL72hpE7ony0g4EIAGdm05za4BdijdhcUIwPYGEdifKZSeB8tCj53/BAx5ne14dvaTnJckLwpt+ruuOS2LnsZAdxmK/zWBVPrJnhLqcymn+fm6V37ybxp8DA+VS848nj5gQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNoqs-0003eX-W9; Fri, 15 May 2026 11:29:03 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNoqr-000u29-1W;
	Fri, 15 May 2026 11:29:01 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNoqr-000000008Ey-1TPR;
	Fri, 15 May 2026 11:29:01 +0200
Message-ID: <53c57285166ea40ee7a435a0df048955a1ee3a0b.camel@pengutronix.de>
Subject: Re: [PATCH 3/5] drm/rcar-du: dsc: Add rudimentary Renesas R-Car V4H
 DSC driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, Geert
 Uytterhoeven <geert+renesas@glider.be>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd	 <sboyd@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong	 <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>, Laurent Pinchart	
 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm <magnus.damm@gmail.com>, Marek Vasut	
 <marek.vasut+renesas@mailbox.org>, Laurent Pinchart	
 <laurent.pinchart+renesas@ideasonboard.com>, Kieran Bingham	
 <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Date: Fri, 15 May 2026 11:29:01 +0200
In-Reply-To: <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
References: <20260514-rcar-du-dsc-v1-0-d65f7a9e9841@ideasonboard.com>
	 <20260514-rcar-du-dsc-v1-3-d65f7a9e9841@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Do, 2026-05-14 at 15:24 +0300, Tomi Valkeinen wrote:
> From: Marek Vasut <marek.vasut+renesas@mailbox.org>
>=20
> The Renesas DSC Display Stream Compression is a bridge embedded in the
> Renesas R-Car V4H SoC. The bridge performs VESA DSC encoding of up to
> 8k or 400 Mpixel/s . Add rudimentary driver, which currently acts as a
> pass-through bridge and allows DSI1 to be operational on R-Car V4H.
>=20
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> [tomi.valkeinen: use bridge->next_bridge, minor changes]
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
> ---
>  drivers/gpu/drm/renesas/rcar-du/Kconfig    |  13 +++
>  drivers/gpu/drm/renesas/rcar-du/Makefile   |   1 +
>  drivers/gpu/drm/renesas/rcar-du/rcar_dsc.c | 163 +++++++++++++++++++++++=
++++++
>  3 files changed, 177 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/renesas/rcar-du/Kconfig b/drivers/gpu/drm/re=
nesas/rcar-du/Kconfig
> index 840305fdeb49..a51f996d3537 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/Kconfig
> +++ b/drivers/gpu/drm/renesas/rcar-du/Kconfig
> @@ -33,6 +33,19 @@ config DRM_RCAR_DW_HDMI
>  	help
>  	  Enable support for R-Car Gen3 or RZ/G2 internal HDMI encoder.
> =20
> +config DRM_RCAR_USE_DSC
> +	bool "R-Car DU DSC Encoder Support"
> +	depends on DRM_BRIDGE && OF
> +	depends on DRM_RCAR_DU || COMPILE_TEST
> +	default DRM_RCAR_DU
> +	help
> +	  Enable support for the R-Car Display Unit embedded DSC encoder.
> +
> +config DRM_RCAR_DSC
> +	def_tristate DRM_RCAR_DU
> +	depends on DRM_RCAR_USE_DSC
> +	select RESET_CONTROLLER

No need to select RESET_CONTROLLER, the API is stubbed out if not
enabled.

regards
Philipp
