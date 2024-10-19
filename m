Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D34342A8C
	for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 14:11:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729347070; cv=none; b=RZgw7f+GcNcpAL4u/kVIdBjyFzVP3J3UsGyA/6ytMpUY2qWw7pn6VWbc2RZ4xXdJilsR1IbB5rtcsZOtvRyRmn/9Xf6r2UbDU4uEAOfUOyMar9oUnHUbCX3c9/6UfSlnctPWxLmKHvK3pcwj5phPpzWY5umJeq14cUhfePmdZxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729347070; c=relaxed/simple;
	bh=FpuzHWVrvatpfwMJ1QvSD5uJ4cdZ+VeHi0kf8jBIBPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RzxPUNniaBGuXbXYtzNxAVox1PzXnLLLNqchr+84At2mXVjnTDOdD+ek+5ShOAOE8xd3wWPNXiunQYp2jv/E1PzTsQpEfBpJQQn/WzoWjSSKOSr9oGd2gBBS+il5WOBKhXmtzo1GCvwSbB8N6pdzgl3QuIRjY1eLrxXfR84CNCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bsniC4Mi; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bsniC4Mi"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539f4d8ef66so4212854e87.1
        for <linux-clk@vger.kernel.org>; Sat, 19 Oct 2024 07:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729347066; x=1729951866; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KFyqMGDzEiD8SJfgSIuL6OhjikfOSZdJxwOOF791tUo=;
        b=bsniC4Mi4iqv6/Kz5ExZeF6/jI71zIJLLUpZndp1KYyg+LILQB9+O+BFA2CPwPrrX5
         kQ0KWe3/oeDZpALqsLE0dDfDuCSLaweFXVXjJQH/8l7lb5y5fxzPIv7FetoqwObF8krF
         Z4Vu+7qaQAdIn74XUa3xUbWx7l1Giu3IziPzKfvvG9ypl7QKsVZXhGLDtJjPIN0duB1w
         ftJO9fTYEu6T8J/7V7jZocwOlivKP6BP43ocxEs7jhT5rBS9TO33eE0wdpBT20oT+Fg4
         9i+RbleA+9FVVj8BO3NpMZAkY/l/sifw3mHqjqUSWGoxUkYne3XGNfOyvTIOkGwiKy2k
         0pJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729347066; x=1729951866;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KFyqMGDzEiD8SJfgSIuL6OhjikfOSZdJxwOOF791tUo=;
        b=LiUfxaWy9AlXTCCKaBdJw+vDA9kHBSW8QFgQzdgNJzzKb/Vr/TQ8bvGDiw7iVvli1j
         imU+wJafJ5cby3rgs/84ut5WBh2ap2lgK2N/K4OKcMg9mLxqSPuMiZKMEOHnlsNa+RsZ
         Eyot3HjcxWLK4yMMA0rygU5/I2haYmoK7Hv52ZTUevWc8rfOvgcVhS7JGgVAaQiSnt7I
         D+zwB9XccgFB3zXHyveNHSwpX4kGEQ5Tonr1G8Bjjr0YQNGCjSbS2bT09ptrgeoA36yD
         oKmLCgaDtMHNBA7JGpoDoWxq9l5ncI8h4UDJNTHMPq9lgzNG1UfytKaQ+dB/f2MENEuu
         Q2Kg==
X-Forwarded-Encrypted: i=1; AJvYcCUhsECoEhFm4JE8ZGJ2A+qJR0mslUQebHzZt68FClvSaL3m+d+jY78V4h+mlEvXWR0tnioB2qPjG5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxNF7u3uJuA3kgFPqOOA1Ox4zCeyxAe4JtnEsLEAq59tb79vR6p
	OFCbjS8NXrqczkXt+al8nSyjo+4JVpOVWoaXOUetwiExG/oA/yys8BOnNo+4VAs=
X-Google-Smtp-Source: AGHT+IHpUlM2mb4sZE/F8kO/aL/+SbKMUhUOFGlRdpwHPf22GTTWehOQZojukTZmgNNOEorXiPGafQ==
X-Received: by 2002:a05:6512:3e0b:b0:539:eb44:7ec3 with SMTP id 2adb3069b0e04-53a1522d8bfmr3412287e87.31.1729347066370;
        Sat, 19 Oct 2024 07:11:06 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a152203c2sm543967e87.299.2024.10.19.07.11.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 07:11:05 -0700 (PDT)
Date: Sat, 19 Oct 2024 17:11:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Chris Morgan <macroalpha82@gmail.com>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 01/26] drm: sun4i: de2/de3: Change CSC argument
Message-ID: <635hn2vkmoyna7fxzgrzp7q3tlk76aoggssjbt2mpkhpvvo4fx@2pmvvxgvmfpq>
References: <20240929091107.838023-1-ryan@testtoast.com>
 <20240929091107.838023-2-ryan@testtoast.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240929091107.838023-2-ryan@testtoast.com>

On Sun, Sep 29, 2024 at 10:04:33PM +1300, Ryan Walklin wrote:
> From: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Currently, CSC module takes care only for converting YUV to RGB.
> However, DE3 is more suited to work in YUV color space. Change CSC mode
> argument to format type to be more neutral. New argument only tells
> layer format type and doesn't imply output type.
> 
> This commit doesn't make any functional change.
> 
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  drivers/gpu/drm/sun4i/sun8i_csc.c      | 22 +++++++++++-----------
>  drivers/gpu/drm/sun4i/sun8i_csc.h      | 10 +++++-----
>  drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 16 ++++++++--------
>  3 files changed, 24 insertions(+), 24 deletions(-)
> 
>  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable)
> diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
> index 828b86fd0cabb..7322770f39f03 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_csc.h
> +++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
> @@ -22,14 +22,14 @@ struct sun8i_mixer;
>  
>  #define SUN8I_CSC_CTRL_EN		BIT(0)
>  
> -enum sun8i_csc_mode {
> -	SUN8I_CSC_MODE_OFF,
> -	SUN8I_CSC_MODE_YUV2RGB,
> -	SUN8I_CSC_MODE_YVU2RGB,
> +enum format_type {

enum sun8i_format_type, unless there is a strong reason to name it
otherwise.

> +	FORMAT_TYPE_RGB,
> +	FORMAT_TYPE_YUV,
> +	FORMAT_TYPE_YVU,
>  };
>  
>  void sun8i_csc_set_ccsc_coefficients(struct sun8i_mixer *mixer, int layer,
> -				     enum sun8i_csc_mode mode,
> +				     enum format_type fmt_type,
>  				     enum drm_color_encoding encoding,
>  				     enum drm_color_range range);
>  void sun8i_csc_enable_ccsc(struct sun8i_mixer *mixer, int layer, bool enable);
> 

-- 
With best wishes
Dmitry
