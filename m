Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926CF1A2642
	for <linux-clk@vger.kernel.org>; Fri,  7 Mar 2025 08:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741337271; cv=none; b=Mo95vBLPIkooK72W5zLrGLErQ29Ja0rx+6lg/ghU7UD1a+Ub6uU0pbxeECjiUa/qGIZAebw8qf6DPQfEjsHo5XqlGW0OsFIYzKewreNPi7Q2xIpha5LT7wlLAhcbeE1rpFdphz1KyklGMCmI/GLBNFXHAskxCbZYI1dK9SntlWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741337271; c=relaxed/simple;
	bh=1klQmpUuK3tpkUPnhlarREZmlq+0v1VMdGLEMIYqCk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r4kV9WTCANIwMZcBx8aEVmNOZKxCuwCexeLWR+V8XPr4tMIcPcV0FjEDRShI7Q+iDw2DBNb5G1vHBOksyOCsH5ba+w16ySvddzeMYrzDYhRTaYltBJLnX3757vX/XSq17TnSNptfXzzfVxfMeLP5OtZlVOq39jxJ+5medKKXJ0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o40S2uN1; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o40S2uN1"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-30bf7d0c15eso2524121fa.0
        for <linux-clk@vger.kernel.org>; Fri, 07 Mar 2025 00:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741337268; x=1741942068; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LcV1MZ5e0X4Au7sgZSdAJMfYoBCfZQzOt7NC7B6Xb5o=;
        b=o40S2uN1UD4snsy1yMtLQ9aX0HoTHUsEC+4WNc+zoiie9OSmSC9NVvwhuJedncdKAc
         htJ1Oe9u3okimtRLAv3M6umbLrwvd8BV586IHDtfs3yd+CfCuccOc36nZ19qEnOGHfdM
         4mT+scV9S63ywTmTRcTiKWfuBjKhUIO7BUtgByvTF99Q9QrKzwm3BGaK6EkO4MJmhTOm
         /9AC6AqGW9oHHlpvP9e3lyK0rh9aviATAw5KUpPqsUHZm4Q6cHA9/giF8ySNG0Uju5Vj
         cQ0tHhjvrbjwuk2tICQ53z6FvTa7XKY+f8TLzwamjl79/JW/5i3nfrAzyHI+3hWxWU9z
         FZdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741337268; x=1741942068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LcV1MZ5e0X4Au7sgZSdAJMfYoBCfZQzOt7NC7B6Xb5o=;
        b=V52Fqn0gqZEmG78Qf+pe50C/A3/op7N9HOodOfVFI1OOivrtXAt9PdF+SE7Sl3uv2m
         df+Pg7KmWdoau/dXYP6y3h5tcCW3hpl7XD08FapYEfaqtKEzfOC8Wer85ZqjbnWI7AUl
         wk3Ft9R4b7yUZCjrlDBpOFc9Gwdt+BMAF8ZRkUgM97NEWed83vetoSk4duiQC25Q+tjt
         G+HH5BsoBUC2dLSt2Fv2QL6lZAEROzuox4PE3K7BGrT8yCim96d9P6kPEv1yRbKi1WXL
         1fy1sWI6QJbfTcL0XnKpom6DZpNxuJ7lwNZ3UPf1Kqnwfrt40UMYaUmy6d+O0H8hdwmM
         1LZw==
X-Forwarded-Encrypted: i=1; AJvYcCX7tSgX4tT0hQFWMAUw3BwFaIintAxhcVYdpZiNiUr8mrZneQzFiCnDrBD6tXY5BU0i9cWWTuewe1w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLYukI4zj2KO8Q7MhODVEwYUDB56bkfO7uGkUNxKH5uNZtNgVR
	yn29kH8G95OU8Fvvv3/eFemGbPoFKFrTQ0dnOkQ9gCBKWp/dtVSPbnwQHXUB3eQ=
X-Gm-Gg: ASbGncvVleoQL1AxPJII2uH68S38+hhHmERtpkB0nPM2LaP0vs+AB7ICohyoAJMVP9P
	YGIfRHMSCe+OjUI6iy496KYUimgFkaspXiHWfMvwMzoIIHGYjKNE/N33JlWmO/T08GaTTMzlPdN
	S5f64iOxYgCjC7z9KLY9uwgPQ+KcSSCKz2fTFNXy8m13ljwQD7pEGJPxHJs9z64oz348UMj8Ha+
	gCh4QFm/P19CCgje2l1vbP8X4HQSDos/QSmGLrpUbfox14sh6ZuBL6OxWmEnxjDIVd05DHXfx8Q
	bH6KRKVAghvkGqdFav8dtA6pRV73B+OR57UnwyCGJE2NI2ocjl0n+phL63HvQR9cJsi7G3kCZwb
	HVO4v4Y8UVuhqk33Hpa+8tuke
X-Google-Smtp-Source: AGHT+IEiTwEYJTrTPyGNimhSVQS4rhsKdEBaz+K9T/k8At9auSzopeTRHY7N/xxUYxj35p79+k7uWg==
X-Received: by 2002:a2e:838a:0:b0:306:501:4772 with SMTP id 38308e7fff4ca-30bf4613cd7mr7319681fa.37.1741337267601;
        Fri, 07 Mar 2025 00:47:47 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30be98d0897sm4763021fa.2.2025.03.07.00.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 00:47:46 -0800 (PST)
Date: Fri, 7 Mar 2025 10:47:43 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Ajit Pandey <quic_ajipan@quicinc.com>, 
	Imran Shaik <quic_imrashai@quicinc.com>, Taniya Das <quic_tdas@quicinc.com>, 
	Satya Priya Kakitapalli <quic_skakitap@quicinc.com>, linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/8] clk: qcom: common: Manage rpm, configure PLLs &
 AON clks in really probe
Message-ID: <vmxwmunmlknwp7elhp5zayoraccunxw5fex2hse2w4nwhuxzu5@atbcrfp2jgdm>
References: <20250306-videocc-pll-multi-pd-voting-v2-0-0cd00612bc0e@quicinc.com>
 <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250306-videocc-pll-multi-pd-voting-v2-3-0cd00612bc0e@quicinc.com>

On Thu, Mar 06, 2025 at 02:25:35PM +0530, Jagadeesh Kona wrote:
> Add support for runtime power management, PLL configuration and enabling
> critical clocks in qcom_cc_really_probe() to commonize the clock
> controller probe.

Please split this into two commits: one for the runtime PM and another
one for clock configuration, because ...

> 
> The runtime power management is not required for all clock controllers,
> hence handle the rpm based on use_rpm flag in clock controller descriptor.
> Also the power domains need to be kept enabled during pll configuration,
> hence attach all required power domains prior to calling get_sync() on the
> device.
> 
> Signed-off-by: Jagadeesh Kona <quic_jkona@quicinc.com>
> ---
>  drivers/clk/qcom/common.c | 45 ++++++++++++++++++++++++++++++++++++---------
>  drivers/clk/qcom/common.h | 16 ++++++++++++++++
>  2 files changed, 52 insertions(+), 9 deletions(-)

[...]

> +
> +	for (i = 0; i < desc->num_plls; i++)
> +		qcom_cc_clk_pll_configure(desc->plls[i], regmap);
> +
> +	for (i = 0 ; i < desc->num_clks_cfg; i++)
> +		regmap_update_bits(regmap, clks_cfg[i].offset,
> +				   clks_cfg[i].mask, clks_cfg[i].mask);
> +

... just calling regmap_update_bits() looks like a step backwards. In
the past several years we got several sensible wrappers and helpers. I
suggest having a callback instead of a fixed 'update bits' table.

>  	reset = &cc->reset;
>  	reset->rcdev.of_node = dev->of_node;
>  	reset->rcdev.ops = &qcom_reset_ops;

The RPM part is fine with me.

-- 
With best wishes
Dmitry
