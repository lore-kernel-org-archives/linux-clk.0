Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3253A1925AF
	for <linux-clk@vger.kernel.org>; Wed,  9 Oct 2024 11:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728474044; cv=none; b=WcBum+jpYMxq0soGA7YTXNeN2uPRrHCafff5wIPV/+8VXPUoGpEOklUgsA3RAviWvLfNN4Vzg7iZ42QdzhmBlufjv4Ujo7E0k2lskC3/hap92YJBQsg4dsxK1uMoSjPYlSAtxtZG+/BrRFfJADWZx6vCpxIPEjt0XlwoTIOBrnc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728474044; c=relaxed/simple;
	bh=h9qy1eidkzqAdVQtLG/tBIVtqvb9J31253seEKXBubQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDf4A7AqdUP7m+Axo3RW+pbQQL1Q6Nas6qUxLjODoGuzhrSfg+k+UhjmUEtefZRgOOyxDoZQhRASqJbNRaZQ6G+XtNayU1O+tBXSGGidHfsvOpCZ4PWRM2zcNxbNcy5HAmgUy0pLTmpnPBR0aHUOjyt5dOqvD4FD7CvokXZSm7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MPAgVwKW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MPAgVwKW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a9977360f9fso220781666b.0
        for <linux-clk@vger.kernel.org>; Wed, 09 Oct 2024 04:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728474040; x=1729078840; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=n3tPa6oC3GkVBQqXt9lYWOj5WcXfTZQll2lZKEeta0s=;
        b=MPAgVwKW5OdGMNIz0IQy4IkKXELdRqcgOUUIvdpn6Pz25biWzx5nkkqKsm8yNiw/LH
         Yf6pv2dNUygWT4JStC8l5ctlNjXQHEgoS+Fm7woL/1Z5sL9GEmeXKXctCWxNmXOjRM1h
         Jv8f5gW0QhDIG4nwMFXi5RE91NjetnQUq1ZPy/O0FhLSQdGZ9IpDrWELrR9Hqp/XrVpy
         yGfA6cL3UxPrDXIsRxCMc4g0fMf57CNxA/UnTV9upkhcOYPJvZGwQ4T34RbStBm/6TYr
         ZxcZKUFrmjQ6SN6N69R//qSHvATy1bmkKhJUqH2PWXWvmZfesZLzj4jSZI3LZQMrTVd+
         kt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728474040; x=1729078840;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3tPa6oC3GkVBQqXt9lYWOj5WcXfTZQll2lZKEeta0s=;
        b=khEsr58aLsSXHJjJK4N51h1AfuwkOQFcOr44DQx1P/qqQKopyO+/rqK+bCEXJQBJha
         X0DlyiIDCc0ueejN1L+7XeH5SxYPGlHYXcrz+ZxZ2fuMJXp8+AuC42M9nQIyO18WUzEp
         Nj5xQrEIkQ953DPPeakxdTiEJDHMeRmKSBJt3ev5HD/BRy8iy73QNj+YaLz7oOPJPueY
         IzpeIrNTmNnfkWjFJX6dpikcT4F7R4W82XQxFSSqU+KBuw5aXEtVR4jsqj0G/NwUzh2E
         13X7QpXulWci7tGYLSewylVRtzj0Q5RhUwzAQCKl3/X7aYnDEiSTLvavEURG/vBgKK/q
         hQvg==
X-Forwarded-Encrypted: i=1; AJvYcCU1jUSR05v7Ra1n+Tzj2/uS/idtbvifWbo8aMqbZlnedbUHelq/XnoFUnKOhc7LDcMxsQDh12/jNgc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7TSVUIJWKiINgS7OvCdcqV9O7CRW7PqkhMcB/ed3cJxxE4CF0
	mz8JUXbbirnGK74DCOduUjMFsa9TorQp36X60gCeK+SHRzTWovigWScNHOX27s0=
X-Google-Smtp-Source: AGHT+IHzp7sGsoG0E3MlQedOjt1RQsHdAF3ZWTsO4nfIOk1uH4nyTFSaTS2XpHphmCpbogKsgsVUTg==
X-Received: by 2002:a17:907:e89:b0:a99:3f4e:6de8 with SMTP id a640c23a62f3a-a998d3832e7mr182256566b.64.1728474040413;
        Wed, 09 Oct 2024 04:40:40 -0700 (PDT)
Received: from linaro.org ([82.77.84.93])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a994a8da5d3sm495547966b.134.2024.10.09.04.40.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 04:40:40 -0700 (PDT)
Date: Wed, 9 Oct 2024 14:40:37 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Marek Vasut <marex@denx.de>
Cc: dri-devel@lists.freedesktop.org, Abel Vesa <abelvesa@kernel.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Robert Foss <rfoss@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Simona Vetter <simona@ffwll.ch>,
	Stephen Boyd <sboyd@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, imx@lists.linux.dev,
	kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock
 reconfigure parent rate
Message-ID: <ZwZrtajvhpq50QPH@linaro.org>
References: <20241008223846.337162-1-marex@denx.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241008223846.337162-1-marex@denx.de>

On 24-10-09 00:38:19, Marek Vasut wrote:
> The media_ldb_root_clk supply LDB serializer. These clock are usually
> shared with the LCDIFv3 pixel clock and supplied by the Video PLL on
> i.MX8MP, but the LDB clock run at either x7 or x14 rate of the LCDIFv3
> pixel clock. Allow the LDB to reconfigure Video PLL as needed, as that
> results in accurate serializer clock.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>

Any fixes tag needed ?

Otherwise, LGTM:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Cc: Abel Vesa <abelvesa@kernel.org>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Fabio Estevam <festevam@gmail.com>
> Cc: Isaac Scott <isaac.scott@ideasonboard.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Sascha Hauer <s.hauer@pengutronix.de>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: imx@lists.linux.dev
> Cc: kernel@dh-electronics.com
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-clk@vger.kernel.org
> ---
>  drivers/clk/imx/clk-imx8mp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-imx8mp.c b/drivers/clk/imx/clk-imx8mp.c
> index 516dbd170c8a3..2e61d340b8ab7 100644
> --- a/drivers/clk/imx/clk-imx8mp.c
> +++ b/drivers/clk/imx/clk-imx8mp.c
> @@ -611,7 +611,7 @@ static int imx8mp_clocks_probe(struct platform_device *pdev)
>  	hws[IMX8MP_CLK_MEDIA_MIPI_PHY1_REF] = imx8m_clk_hw_composite("media_mipi_phy1_ref", imx8mp_media_mipi_phy1_ref_sels, ccm_base + 0xbd80);
>  	hws[IMX8MP_CLK_MEDIA_DISP1_PIX] = imx8m_clk_hw_composite_bus_flags("media_disp1_pix", imx8mp_media_disp_pix_sels, ccm_base + 0xbe00, CLK_SET_RATE_PARENT);
>  	hws[IMX8MP_CLK_MEDIA_CAM2_PIX] = imx8m_clk_hw_composite("media_cam2_pix", imx8mp_media_cam2_pix_sels, ccm_base + 0xbe80);
> -	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00);
> +	hws[IMX8MP_CLK_MEDIA_LDB] = imx8m_clk_hw_composite_bus_flags("media_ldb", imx8mp_media_ldb_sels, ccm_base + 0xbf00, CLK_SET_RATE_PARENT);
>  	hws[IMX8MP_CLK_MEMREPAIR] = imx8m_clk_hw_composite_critical("mem_repair", imx8mp_memrepair_sels, ccm_base + 0xbf80);
>  	hws[IMX8MP_CLK_MEDIA_MIPI_TEST_BYTE] = imx8m_clk_hw_composite("media_mipi_test_byte", imx8mp_media_mipi_test_byte_sels, ccm_base + 0xc100);
>  	hws[IMX8MP_CLK_ECSPI3] = imx8m_clk_hw_composite("ecspi3", imx8mp_ecspi3_sels, ccm_base + 0xc180);
> -- 
> 2.45.2
> 
