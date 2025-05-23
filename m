Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026EF1AE875
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 07:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983729; cv=none; b=tnZnTQ5+QIkFBaDKG7eqEn1kd4pGAKVpnqKMptqg1j3nN4U+11ZV5xxzgR6ceGtkM+anSrr7N7vHF7Bj9eMzbfuyA7OtGNpy8tWe+0nZy32Msk/J/qoUsaFGmXtaaZ2SStTMkP0Q7Qr7IZozFhE+djE+dY5fOjxD4rb+qlsUJNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983729; c=relaxed/simple;
	bh=c7jysfuRbmmTUAzBorXcjsX2IBCdoM9L94JM9I+9q8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FCmJMKFyby7+go2D2XwyFOeSsuJGsO6RCxig5hvq1pcCyFGwyVHpy9+xIRGljq7q3XCQFuQddesUq+4HK9TcyYcEC+i1Q+c/n7jvpL85zfwJJH+CevAWlBrOhwXPJW5PoDYsZhvf2TbRyci05JeQse7Zfqz8ApDpf35yDz8hIfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HHJpvCtl; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HHJpvCtl"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-44b1ff82597so7780825e9.3
        for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 00:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747983726; x=1748588526; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=y3chgsoPjsxPJjeKJHvKUZQo0VoemKGDA7Ek6bDVj68=;
        b=HHJpvCtlXa2x9a/S3RFf0ofBB22Jy+vGXphOTfZ8UE7MdcxZTgulODBAOO24SC+txI
         xMygkZTxiyRslE9sSZMeq1wS6Gjbuutsr7iWWquu2yksqaAB1mKGdLrsNcmQznPpN9wL
         qbRTfhwUhapFsmZy/weuOD0HY6lC+2E2QCQuTI4OlkNRU0/pd9Aja5VToHfqQa9l2qbz
         OWLoXGqQ44K9h8k18zzc3k4/Ot1AOxLEg05i5IusYM2bf+0Pn/cHmZrJQL0NuzRfD98v
         a+XCPhpknVjB0IEf9Bp9iOhZ6doyAi44+ZY+By4J21/7pqruFVBUobUPQ55/6I9O0/3p
         zg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747983726; x=1748588526;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y3chgsoPjsxPJjeKJHvKUZQo0VoemKGDA7Ek6bDVj68=;
        b=cWnobPJrSDORA19/WikkWiCGmSx8e+QkIL96yYDxuzW8kon+FpBu+33TZUfoq1Bm+Z
         H9iDxRud8PQZRt2akNjy3gv9H6rvbKg1dkbLszLyXFP7yjr156zfTXTQV4/0XwMdtRnQ
         bwwsT91MwOJ/D64zPTAWGHvs47slktYelJJ59M/oalXjGk06YJ7D6vMQrb9tROtMnwQr
         iYxaHAOAfL1ScpRXu+6xquYLqBELkXQvP1xPZi5c8BcTlzVDTeyQagQ3o3eKKrc5hnr+
         cLDJIVJOTR3Igu2NWKqiziybzrLm8ALvEUhqemU3/G4ciKI/JoDrBs5PsM/e5knxLQxJ
         LrFw==
X-Forwarded-Encrypted: i=1; AJvYcCXJJfeAEeknxBmIo4Qaxl29hJubW36W+PlGLlV3I2VptFPWY4o4dp4GCPrDVuZX+TtOBH5ePf3dNsU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGMrHyzHGvnP0oRr8X5SonnzF2KornPpN1K8kvZLV0P8mrXIzD
	5a95eWjbFIoLBrT3af7zl/RRh2kKtF2W79IhqRwAT6v93T1jb7rqvK4iCets90nTEJU=
X-Gm-Gg: ASbGnculRnLPT9dfdxz3LoSjjhlfRkftT/Md0KMr4Hb8nf/YFoGIYWbdbfH3g4fPFnF
	2a2+CeyPC5EwiuR8Xg6lpZdvMjeZLjcX0vhNJhyZ2Wt6bdHQ6Vq7BGHBMMfr56+61efVrkRURuR
	3rkQ4IWe7QMyJOV0u/eMOOMa6Wev3EqizShI2tVpg4Ow2uy0A+YJWhBnT37lzrJ8hRA/naGcnIC
	p31QUmn+wuUzHzhJIfrDvAWZyJ/hqRME5kgJ04o416M0MNy+pYDE6ST4LtplwzQYjIhlMJg16gJ
	uYFg5jc60LLJhR+oW6I418Y99RLMkxRQQiDovAA0MIWUDe8r
X-Google-Smtp-Source: AGHT+IFY4y/ZUB1VKe4lNbsorjCqofEy8Oz5r/Dj6XfZyxk0qjzrM+uoTb7F1fSElFjmjBLoR4SC6w==
X-Received: by 2002:a05:600c:8487:b0:43d:160:cd9e with SMTP id 5b1f17b1804b1-44b6d6b1fdbmr13812575e9.17.1747983726219;
        Fri, 23 May 2025 00:02:06 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f18251adsm134886385e9.2.2025.05.23.00.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 00:02:05 -0700 (PDT)
Date: Fri, 23 May 2025 10:02:03 +0300
From: Abel Vesa <abel.vesa@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krishna Manikandan <quic_mkrishn@quicinc.com>,
	Jonathan Marek <jonathan@marek.ca>,
	Kuogee Hsieh <quic_khsieh@quicinc.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Rob Clark <robdclark@gmail.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v5 21/24] drm/msm/dpu: Implement 10-bit color alpha for
 v12.0 DPU
Message-ID: <aDAdax7xdeDsvQHB@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
 <aDAbxAnCN1lGGcGH@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aDAbxAnCN1lGGcGH@linaro.org>

On 25-05-23 09:55:00, Abel Vesa wrote:
> On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> > v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> > differences and new implementations of setup_alpha_out(),
> > setup_border_color() and setup_blend_config().
> > 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > 
> > ---
> > 
> > Changes in v4:
> > 1. Lowercase hex, use spaces for define indentation
> > 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> > 
> > Changes in v3:
> > 1. New patch, split from previous big DPU v12.0.
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
> >  2 files changed, 94 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
> >  }
> >  
> >  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > -		struct dpu_plane_state *pstate, const struct msm_format *format)
> > +				      struct dpu_plane_state *pstate,
> > +				      const struct msm_format *format,
> > +				      const struct dpu_mdss_version *mdss_ver)
> >  {
> >  	struct dpu_hw_mixer *lm = mixer->hw_lm;
> >  	uint32_t blend_op;
> > -	uint32_t fg_alpha, bg_alpha;
> > +	uint32_t fg_alpha, bg_alpha, max_alpha;
> >  
> >  	fg_alpha = pstate->base.alpha >> 8;
> 
> For the 10-bit alpha, you need to shift here by 5 instead of 8.

Typo. "6 instead of 8".

I blame the keyboard ...
