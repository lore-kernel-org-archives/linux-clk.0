Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3282040AD
	for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 20:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729283311; cv=none; b=Y+OwLnefHgC5MIqgayzPYCRj+z72ddghpu7YZo9BPNMEsa3/dsR046TFGVs8AwsvXJ9f86CcIJ+j4C5RD+DHgCLeykyuSgUjoqu6nzyukvmxS40Ihj/16F943vkZDcpp9b6+Jcu5wicXdjMOmcJpfFMPOwZhu4a+r0PwrGjN7Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729283311; c=relaxed/simple;
	bh=pSYu2V9vE1v40JDClAYzaO8gHTegAGCsdToFUQ8aORw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDejcGvisSJYFWTnn2FsPNsauJPGaAJdB9/oJKvCyf8DRcm1QH1ZFhpvmNJvAleQs8l/wiUPbiIl93P61Wggakiuhf8rxwkAl5MAWmK7AAYKwrqExF9CNOVkfxMWuOXi7xKfTyCy2BlDFI2BuOQcwmNtc14BZ/cjTFQUo/Iwog4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HFnb/xc/; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HFnb/xc/"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-539f2b95775so3192471e87.1
        for <linux-clk@vger.kernel.org>; Fri, 18 Oct 2024 13:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729283306; x=1729888106; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LY5/vQ48pBwfRlm9zQiPTqoKwm7/lyhKv/uaIUZfZmE=;
        b=HFnb/xc/JqzvvsNyLoOjSvgo8CjeVhJRUCToW62GXcKMyKFBjWM58ebalrK/WP6Z1x
         cSfetzYQEricsEoFByEYW+WA4UzlZ9cgT+es453gZvqmII48P8hlbtLTyPk09gCwt4Eu
         r/6V15H5VkHptSScGhTUU9QBLZY0RRMxiq7OqHkvWb816G/QYLMXq+n2s++TCbr420kz
         1FalBSWgMjOOQn9jWFJiJzbcJcbu7zRkW750VUKF9pBVEvLGz0J2XnC4H4FX2r+jvW7C
         sSn3KRs1r76pEI16zYUZIBlY65Sxrzr34prSHtsYGzKpNJQlutYTxJYTeVtWMsJViYu1
         P7sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729283306; x=1729888106;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LY5/vQ48pBwfRlm9zQiPTqoKwm7/lyhKv/uaIUZfZmE=;
        b=CP/nBhOhJVDsBLKkLkzBBJzEqjvHkD9FU1aBO53nn71fFp8H8il7UJIHLbpRH3LNmu
         WucGVIDkwn1EcsvtaKQkFEqYVEK738HPZLsrN0qc4/QeFFKARTcptv5akw8nKvyukwe8
         s2SBuu/rCKQo+BUZSCVxEYmpueBN5ymqA/KsTcrL+Y5cEwSYn92RUBO80ZlZrN8Yg2O5
         Ed5c+XoiNqY5y0HAZQcOIbBIQl1vvBnWPyplWbw3smUO7pxpI+Vrf+cQRHNlaUnYeCzG
         8xbWxqPGsvPJEzXcaBiUzmrviN993e1ySQBUaH/z485fG2rQG3vfpVBzkmrLaQRJRLCP
         3dFw==
X-Forwarded-Encrypted: i=1; AJvYcCUsUWgS4FpvT/pP+jE59EtV90KgzU2Iee47HtALRp+rL8E2+dgZukLstDdZfR8hhoSb38ffgSpTq3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNptdmI32hg7U6QbOm3X7Ffz2TzqKe8tv0gA92hP4OYcyTOErO
	6JSJnvFkgi5ijlBYIJ2HO6TbRmvQVJyfFZu+gSH3+EWsNXGtg7Bpq33awt/V96M=
X-Google-Smtp-Source: AGHT+IH+qsY9mBs2ZcmLMm8XT80WfJ9RLA+9rQXt0fzC+YdixxfVTgvbIo9i3IbVyuwdmP1jz0Yxpw==
X-Received: by 2002:a05:6512:6d2:b0:539:9510:2b8a with SMTP id 2adb3069b0e04-53a154d9606mr3301778e87.53.1729283306107;
        Fri, 18 Oct 2024 13:28:26 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53a151b00aesm314818e87.38.2024.10.18.13.28.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 13:28:25 -0700 (PDT)
Date: Fri, 18 Oct 2024 23:28:24 +0300
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
Subject: Re: [PATCH 08/11] clk: qcom: gpucc-qcs615: Add QCS615 graphics clock
 controller driver
Message-ID: <omn34rwurlxrjckb5d6xb2brg6zwcizonmqyfckvngk5msrfav@b3i2bdjk5vw7>
References: <20241019-qcs615-mm-clockcontroller-v1-0-4cfb96d779ae@quicinc.com>
 <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241019-qcs615-mm-clockcontroller-v1-8-4cfb96d779ae@quicinc.com>

On Sat, Oct 19, 2024 at 12:45:44AM +0530, Taniya Das wrote:
> Add support for the graphics clock controller for graphics clients to
> be able to request for the clocks on QCS615 platform.
> 
> Signed-off-by: Taniya Das <quic_tdas@quicinc.com>
> ---
>  drivers/clk/qcom/Kconfig        |   8 +
>  drivers/clk/qcom/Makefile       |   1 +
>  drivers/clk/qcom/gpucc-qcs615.c | 525 ++++++++++++++++++++++++++++++++++++++++
>  3 files changed, 534 insertions(+)
> 
> +
> +static struct gdsc cx_gdsc = {
> +	.gdscr = 0x106c,
> +	.gds_hw_ctrl = 0x1540,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x8,
> +	.pd = {
> +		.name = "cx_gdsc",
> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +
> +static struct gdsc gx_gdsc = {
> +	.gdscr = 0x100c,
> +	.en_rest_wait_val = 0x2,
> +	.en_few_wait_val = 0x2,
> +	.clk_dis_wait_val = 0x2,
> +	.pd = {
> +		.name = "gx_gdsc",

.power_on = gdsc_gx_do_nothing_enable ? Or is it controlled directly on
this platform?

> +	},
> +	.pwrsts = PWRSTS_OFF_ON,
> +	.flags = POLL_CFG_GDSCR,
> +};
> +

-- 
With best wishes
Dmitry
