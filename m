Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8932C202F91
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 20:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729282970; cv=none; b=LaeU6+lT0LhBsNkFgnSuoJssqrwUHQcFyjt6kOtxNKVsFpMBM09ZGZwS8q/Lp8ueCojHnO1iU2yMRLmnUHQLShlQ9n0T2ofhJ0bvXNye7SPPDB2IdyfU038ASJswBEiltfEWGDMHFHwufS98M0bV21PwbBONyp9vsCUPIn3EQqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729282970; c=relaxed/simple;
	bh=zA6sAGlmcsssfbHFHpdufD4jFViwc4hJ+qdlDWdA+ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cINDoJ+ZiSVo3HY+p3z2lRAniJ/1SF4+b6IotFilf2bVYcbJ/W+5p48gCucxmYCm705kTOWMbRnhijTKOSo28yy+L/pJPlzyUquGPvUA4VuDzjr3bL71/3GILTvg/BOpoxeZZXS2pUHXHv+IqRg0gf9hzDyXAgjEH8YEiZMiKQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tmmm2Q83; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tmmm2Q83"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-539eb97f26aso3085357e87.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729282966; x=1729887766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=v6REwNIJhYaMRZTlPZFBNngTOjTKL4C0pCHHanFLiQM=;
        b=tmmm2Q83Ex1r8w75GH9gX9ooJ+E/ggD0+qKSQW4CP1Cevqgp9WXIg1ZlxuRcLAsy15
         vB+Xai1yjthtnY8Mtn9fJiZ28/G3Y7VhK3s+CRwWEFnOgSuUvEG9+UFEa9rRqXMvd63L
         nZWsrvHo8Tu9bb9sE+awR0R6kPDj5tuwB+jx41d8cetpQ9W3WFklQmM3LFs9xFyBK4rc
         /kySbSpUKq6oE4bBfJjXQBX62ViVaFQTakfpzqIbBvOaPWKcqyz57VvnLEr8pcYPUu4N
         4YyHwoiXg+7BZwkEJXGIxIyXYleALG6oLRjJbkKZTatJgPE8Ba6hPFTN9BNWy7TBxioe
         9KLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729282966; x=1729887766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v6REwNIJhYaMRZTlPZFBNngTOjTKL4C0pCHHanFLiQM=;
        b=BxPQFy2zGwJGiIgtJXRoiSWg2Wq7YLKlD08O1jE4tR9GpJ29dhaYODhb5kiZ7IMb/A
         f6MuUWDGEXAFnlBfPxFmPNIpLSEPneHcwzJSWYOuZwQo1EJHPKwFDPdqOOTNaKg3TOKK
         ou/71iLQB19KgaFPaZ/Oh4jqOkWrkTnNMH1AOpF4ZwLO8rCR+LQLvZAYUxYmPIMMqmnx
         HS/iVnwjwNcXbse1o6XEs+qkW7vINoJ4am4g4jYsbU+C7QdxcKBiiHVcExgPw/4jiUl2
         Zezug1hKzniB6NDRXVXPii2/UjPpiKBJkwA+0q8fM19bQ94HkuVhBVx3EyPyxIRX2G5v
         MWgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOxsJ0m7vZ/nTIIG97KQT/eG7AjSBYMOma5lR7E4kci67I1RpygOBkdONRkuXNe/X65gM95yAU66c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyeDtGEfxN4dFRsXC/wAH5/DkdL4bpSsAZfDbUriDrv82KNCpjc
	TJd8paTe0lZ6f5r4kemMogt0CEoI0yg6Rhn6NMSGvD6AKdUO5vlW4jvqAvo/xt8=
X-Google-Smtp-Source: AGHT+IH/AY6GEGMQZHw2wLQvEVWlWfajQiWIOTSCuRjlgslgw34A6iVSxQUE0RsRM9/nr1mz4MO7fA==
X-Received: by 2002:a05:6512:3a8d:b0:536:7362:5923 with SMTP id 2adb3069b0e04-53a1520b285mr2532574e87.1.1729282966538;
        Fri, 18 Oct 2024 13:22:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a15211ac9sm312958e87.252.2024.10.18.13.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:22:46 -0700 (PDT)
Date: Fri, 18 Oct 2024 23:22:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Taniya Das <quic_tdas@quicinc.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abhishek Sahu <absahu@codeaurora.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ajit Pandey <quic_ajipan@quicinc.com>, Imran Shaik <quic_imrashai@quicinc.com>, 
	Jagadeesh Kona <quic_jkona@quicinc.com>, Stephen Boyd <sboyd@codeaurora.org>, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/11] clk: qcom: camcc-qcs615: Add QCS615 camera clock
 controller driver
Message-ID: <f5exjvacw4gz7s7byxz6aux7jt3kczn5waio3f3dukpdvzmkvi@c65xjssv4aqy>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-4-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-4-4cfb96d779ae@quicinc.com>

On Sat, Oct 19, 2024 at 12:45:40AM +0530, Taniya Das wrote:
> Add support for the camera clock controller for camera clients to
> be able to request for camcc clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |   10 +
>  drivers/clk/qcom/Makefile       |    1 +
>  drivers/clk/qcom/camcc-qcs615.c | 1588 +++++++++++++++++++++++++++++++++++++++
>  3 files changed, 1599 insertions(+)
> 

[...]

> +
> +static struct gdsc bps_gdsc = {
> +	.gdscr = 0x6004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "bps_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR,
> +};
> +
> +static struct gdsc ife_0_gdsc = {
> +	.gdscr = 0x9004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "ife_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +
> +static struct gdsc ife_1_gdsc = {
> +	.gdscr = 0xa004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "ife_1_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};

Shouldn't IFE GDSCs have titan_top as a parent?

> +
> +static struct gdsc ipe_0_gdsc = {
> +	.gdscr = 0x7004,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "ipe_0_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = HW_CTRL_TRIGGER | POLL_CFG_GDSCR | RETAIN_FF_ENABLE,
> +};
> +
> +static struct gdsc titan_top_gdsc = {
> +	.gdscr = 0xb134,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0xf,
> +	.pd = {
> +		.name = "titan_top_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +

-- 
With best wishes
Dmitry
