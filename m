Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3293D76
	for <linux-clk@vger.kernel.org>; Fri, 23 May 2025 06:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747983307; cv=none; b=QRz9GefEHB3uF77aO+QaqeHu6k+r/aXBjlUEVKg1A1KJCbgyDQeO6+JzZaoNMHLysYCqfnVrlWuU/z7vcgncN6tobolpwPx+UjDq1qjGJQwxtXOKWMX5XUrRLaoz4MFg8MWMnY6mdgXKY12OAhrcm5t+JG+r89k09VUXhQnaEVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747983307; c=relaxed/simple;
	bh=U20oBW7Rv6lgEPsP0GX95por6oX52DQoUY7ib1Yx1bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBrecQT5XPh+VVpwcG2lgXbSdZe1P9aBuFlCgEI/dEZEGgB47Px0vT9dsM7BW6UxBGf0vPYVa5HKdZOQX4spsIhBErppYWodjsrrK99sIFtHUtntfUct+7a95vngxYfGTFRcRU4VFS+bo1tdVLQ4ZkDjpPjmRDr4WUlDnFGvQFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f59BtNMF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f59BtNMF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a37a243388so3705211f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 22 May 2025 23:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747983303; x=1748588103; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=69oCtQFtFuIhATn7nt7tT3JoQ8RLcM/FthzOv16zp9Y=;
        b=f59BtNMFez59EXrzk3AfHvpLLVZp8dVZqJD/sC5KP9jgnljUNZd2XQDXOYLrYcctWY
         qTgPc01LYuW5HRRi9oqmQHc9Ixcl6HIlCzF/IeUJg+QlOxDNwJPQxhwNTeIpJZsSjUVt
         LFuYgi4Mw6tqf6TNOKohDWb3nOyCrQGzc+UOLAQZIu4uQuCX6IKSvtRIO02XO6NMCM0m
         lVufifWZ1Vs0vDEPBZplJnzRV6+BFKUX36rQzAOoscHgnk22T+TeFlmaic7YAb3+QQyb
         3AZnA9WFPzP28ujsY9CfvZLNgG15ddhn8WKhZUZDZBrQprmD3qIGGdQHJ/yM8IXCgusM
         Wz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747983303; x=1748588103;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=69oCtQFtFuIhATn7nt7tT3JoQ8RLcM/FthzOv16zp9Y=;
        b=ZEalxR69CGijiX8AT+JOzcWopywGS4nLcyaq4kPf1w7R5ybymWVFTb+Vc3dq06xNsZ
         UawR05twC5LEHbuISkLssMwL08piloioj5reMFMir9ZxI4f7nvB9yWUBwTm0lg1E+hLK
         MHsDNX5UEeKcMxy7jREfSnw14Ry2Qd06/BDYDXQMwt9ockrxMSYO680RMWzdAZ4xMsfL
         X32sarZUMAoFkk2qOimFiqVk3AxJulbB7zg2ADmf2PWocxbJkgtfkvl+ofuuGBl4zWkY
         wNehh1gEArMOJJj+Es4Mqjsat7CI/bTo3K9XPnNbqpFnxwmKOByEf10v3s7KN2JAbPuN
         Daag==
X-Forwarded-Encrypted: i=1; AJvYcCVL4vnsSmXLzx3qGHqpFUYP5pGprSySoxNU6ASPZBqiz3Beb7DmwnF4H9+lDMl+ihwSKGxKbGFejhE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxzyKqD98RUqkudC0jLoHCEFdwxDg+qAJpWNg9PNNbUbsH98nJj
	r16AlvgfY2eDl/VN0ryrMT20JXjMHj9AVEY3gQ/Tlxi4TUyGBVyijLBpUDycvV90m24=
X-Gm-Gg: ASbGncs2SebsBNngLIV4YYTSkVDtVY8KvROPfsd25tNa0qJP/rmdKUezpmRDhrClWe2
	aDShPDpa2L0k1LNYPDdnXs8QpMQqTiWS/Wu7V1QVetqYjGk8wTw+zH/a3kbJtPzbXrTvWSwLA+D
	TsOdIfuiuB68cooIZAd/HyR33MWS+Lc/V3YvB1bTiGGHOMjCMe6HCqJBFmaUhMmTe9jZ9jZZ/Nq
	Z6wpK4Wfr3K1HRHWBjrs63vdlYif82kloWJSTraYtbFrukeaXxJO1z8hTpKNL3wly9dJylLEdDD
	6yByTjKLHPUUgftwSbSrXWKFptDrb9lDMd3me513HwcTfRku
X-Google-Smtp-Source: AGHT+IH75aOsRJMnyheDQH5VfJc94Xc0jentcmMf8E7Zp2ROIEwHjqRlngeR8WzATqUqYD8xScblVw==
X-Received: by 2002:a05:6000:2903:b0:3a3:6e62:d8d5 with SMTP id ffacd0b85a97d-3a36e62d9afmr15906729f8f.58.1747983303480;
        Thu, 22 May 2025 23:55:03 -0700 (PDT)
Received: from linaro.org ([62.231.96.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88941sm25904629f8f.61.2025.05.22.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 23:55:02 -0700 (PDT)
Date: Fri, 23 May 2025 09:55:00 +0300
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
Message-ID: <aDAbxAnCN1lGGcGH@linaro.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430-b4-sm8750-display-v5-21-8cab30c3e4df@linaro.org>

On 25-04-30 15:00:51, Krzysztof Kozlowski wrote:
> v12.0 DPU on SM8750 comes with 10-bit color alpha.  Add register
> differences and new implementations of setup_alpha_out(),
> setup_border_color() and setup_blend_config().
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes in v4:
> 1. Lowercase hex, use spaces for define indentation
> 2. _dpu_crtc_setup_blend_cfg(): pass mdss_ver instead of ctl
> 
> Changes in v3:
> 1. New patch, split from previous big DPU v12.0.
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 19 ++++---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 84 +++++++++++++++++++++++++++++--
>  2 files changed, 94 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index a4b0fe0d9899b32141928f0b6a16503a49b3c27a..90f47fc15ee5708795701d78a1380f4ab01c1427 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -320,14 +320,20 @@ static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
>  }
>  
>  static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> -		struct dpu_plane_state *pstate, const struct msm_format *format)
> +				      struct dpu_plane_state *pstate,
> +				      const struct msm_format *format,
> +				      const struct dpu_mdss_version *mdss_ver)
>  {
>  	struct dpu_hw_mixer *lm = mixer->hw_lm;
>  	uint32_t blend_op;
> -	uint32_t fg_alpha, bg_alpha;
> +	uint32_t fg_alpha, bg_alpha, max_alpha;
>  
>  	fg_alpha = pstate->base.alpha >> 8;

For the 10-bit alpha, you need to shift here by 5 instead of 8.
