Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 398F520010C
	for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 13:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737986084; cv=none; b=RTzrUBrqGQysM/6bgLFoelKIsC0h2oBARkw91fcpT2FD5pLVzWOUZAv9EvtPOhBHofe6E8PpTzW41M+J0HVubWgDAVkCGEpZY6/78RbquHkUttcPm6sF659zZahT30QSxUTdJutY2G4kSCqSimjV3gcxz7JqWPYatCBZmQh/iso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737986084; c=relaxed/simple;
	bh=4pN0JqogpuXrg2SLbBAUBg8nV9QiDA72RP8sN6rDFQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YdBxV1TnVpDCiCSEBn8W0iOGjhea1uClDHLSkXkKFuTiMsweF6lt9pHg/RNj3MCWLPVqysH2KiNlpK7wN05XaeC7VOBGPZHq8I0vesOifN3H8HLqA5CvhqsgXUyMUJOkmUfIqD1pOVuL6wbrRvnvxRwszJN2zCdFiZ2niYoh0x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V0RSkRih; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V0RSkRih"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30219437e63so56707991fa.1
        for <linux-clk@vger.kernel.org>; Mon, 27 Jan 2025 05:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737986080; x=1738590880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MG8vL6IasZgSPWiGApP4GVL5c9606qD22ZEA08oiK0c=;
        b=V0RSkRihbc5pQwafnrfZlxd+aSkuyJ0hw7o0q/vuv4owy/7qimCGmHpCmKf2fOtth0
         Uox5vweV8m9X08eUAXYACo5KS5CEH5gABzEsdeoCdMuGt3l60iQsX55FcBN+ylC5/444
         dnbpn3Y6SrCNC7GoRtDKvdn0tC2du3mP6lWOlCUgfvpl5HwTM5RmFGCZEeFK36PwNDQy
         B2HOFIVPnYuWb0uN0543sN1DGVkI0B7QEKY1r8kLRG7NfpCcTMi9Dbd1cMdnn8fH6Oa5
         kUIpnt/60aAunXtBVnmuAci26+ktc5f2oMAy9d4FrbDhUCdpFMcnA8HvUtv/Ok3R4XYO
         SY7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737986080; x=1738590880;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG8vL6IasZgSPWiGApP4GVL5c9606qD22ZEA08oiK0c=;
        b=Vxjc3wZo9ojs8V0tFFRNG6zlTfyqRFD1LsJGdEWJmWua/riTUKagOsSP8eWdRWP5v9
         +414bOsYqJNGZsNgF8VU7t2FjqTokD87wEpUmaf6k8H/ZoJ1Y7F3P7hZt41qboRYJ4OZ
         cf2ui4JQr2vNVtF6MJy0d067tDLZIHfcID84/ClgC43+bzJ2F+QV7rMzPpyvm63wlttQ
         Fzqzt1uFWDurQmYcAGKpo64wq0HvUDWZsKTVnF8d5pNufqVydIEF/mkQ0Htf9JTGvlxK
         MjYM8CopztEebMi5GrAf+9XFnxt1dZ5i7WGHoeERnhK0PnxIE3wDt+DyP62S1S1NEbfA
         jTOw==
X-Forwarded-Encrypted: i=1; AJvYcCWH71ISuIrfYokSSG33eWEND8K0Gs1BtdMFRGra8wIcO5olEaMy3cTsh4RfigSF72cep3ED4Nf1UQc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfcg6VBRl/w087GTs31yMRyf4EhqnZgc8tehbEE80m6uOXhxM+
	o+puZq75B/MSSV4ntjbZawmDqOjdQ73Cyv6h+wUUNSzCCkQC+Z6RJX6YKsdhPb4=
X-Gm-Gg: ASbGncuHSTR7lCngY0/bEcs4LH4/abqtV37Fdvqy8B2fBlXHNH2wnnJgM4xjGQMvkRl
	qlNHX8rdu+r+icP2W1chLww85Ij08nJ81RXnBwSoA2cWPggIlshvodTUfgY0dVrXh8DAXuLaMeG
	V3NHP91VKIVTWTUsSELP6e7MXYP+4txwDBJtKBPlIpfXLiPkRaH74XGtpLXH1Q6/GlAybfT/Fsl
	S0ve22D4Eys/LWkibMbQWt1CTcyWzbDqA4oyY25fGKMf9QtoBnAxbr00/AF7sLgOxBa7MrwziY/
	6qy81/AwsDYgdc4GOFOj4KWcdXt3rwgFPl0WA26IPNeoo9nE4GSRPKNLRLnj
X-Google-Smtp-Source: AGHT+IEZNRgyG7avdiIFrrqpYNJ9ma4eAM8WC44WUlJD0d6Eyzriv+5OslGJLlbJ5m5dOBVSOwRTkw==
X-Received: by 2002:a2e:a917:0:b0:302:2097:392f with SMTP id 38308e7fff4ca-3076c33d8d0mr50387271fa.7.1737986080297;
        Mon, 27 Jan 2025 05:54:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076ba6bd1asm14100191fa.11.2025.01.27.05.54.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 05:54:38 -0800 (PST)
Date: Mon, 27 Jan 2025 15:54:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] drm/msm/dsi/phy: Use the header with clock IDs
Message-ID: <ccs5oxfgtk5zrnw27okvbskddqynurx6hl3e6g4zbmlqcqm4yl@sxghz575bqdo>
References: <20250127132105.107138-1-krzysztof.kozlowski@linaro.org>
 <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127132105.107138-2-krzysztof.kozlowski@linaro.org>

On Mon, Jan 27, 2025 at 02:21:05PM +0100, Krzysztof Kozlowski wrote:
> Use the header with clock IDs to bind the interface between driver and
> DTS.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 5 ++---
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 1 +
>  6 files changed, 7 insertions(+), 3 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-- 
With best wishes
Dmitry
