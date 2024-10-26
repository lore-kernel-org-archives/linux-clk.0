Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956DA10E5
	for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729981159; cv=none; b=XeH/oUzwxy7O8izaQJ7VSDXmnlUg1pS28yj4iTLyIp9mn9Me37XI1Z2tb3mwkvSiTJWZayTtxZUz8pjiidfUxSGLPUjUkCldBy6hrbZL07BroXZXvWSGry8AeetgV83UUN4E8oT00eOgCylzEe/tnB3aISD4z1RJ6lINBSYl8es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729981159; c=relaxed/simple;
	bh=UcJLRBtQDLu/By/JY2LNqltWq3+KUy9pszQsgBNxB/w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P9YT/VnMRRQb061mPhDVmB2QLn6IzmnkZZkAUl0e8lLLsSZxYsYH1Rj08QL3FXy+Lg96dnGXcdRMFeSh0GrPPwQHmylrJKO0Inc27KN0ceNlUmWU/NN27oQ4Kpw1C4x0kz1VfkLOEIx/Mo0VIXOa/krsCdjeJ15vEVN2Z78DS68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HjrqziBZ; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HjrqziBZ"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-539f72c8fc1so3794880e87.1
        for <linux-clk@vger.kernel.org>; Sat, 26 Oct 2024 15:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729981156; x=1730585956; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7gc0n8T37Tk8alsv4FAQiObXB4rBjybL5LMUSXonOUs=;
        b=HjrqziBZYlulmZwsZHs75Genw+d9mqZdrcz1FNEEvaoAionz+QTpK24pJHgrqYF6Fr
         f5/JpBClwGt6ut81rf6gScpiwkzU38Ud2OIpECG6jZMuWpfpgHN/EE0Qc8XBBduqoJgZ
         JA46V62csQLFirR9wVgnuSNEOk0MhWAw1Jl0fVvYcLwj+3vUSWCM30dDUtOH/mAGwAss
         l/X5eLZPGjQ1Eo0igN6NUv1VRTRzeaMeH2lUdjPwEal3p7/An7fsNrS9Or90NheGX1FU
         MgyVdDaY9Uwg7NGW7a2FsGy5XUnTlbje1cSEjojI3xVY+tRFUMVgpvE0vk1xLT8IObak
         7A2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729981156; x=1730585956;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7gc0n8T37Tk8alsv4FAQiObXB4rBjybL5LMUSXonOUs=;
        b=vW8s+BmdtRuIwa4ic/5W5qSrG/JaAs3KlzIArJQblbZ9i70uxQOgfHK8Xn1WvsqGS8
         T4zUQY2u2VKrhO30J1QiYvJ3pqwTrfOvNUZwn81suHiFHcb3HqNocNvg8Zkj93nt9UnZ
         6PQZOmroDBbq1x/S6N8SI7ovasyqfKt6+BVK2TKztkjzTnrB4If87aRNw2kwvXJZ21o3
         2/k1mG/IAvyPoWNeqRZW4inQVJqHWaEEmwapNQ6BnSEAe6e3za9Ws7Dxp6t3dDRbBfIB
         8g1a2krKscDQVn3DKqnPWHPRe+SaJgLHqP+s/JijZXgC8um/MssqyyCr4oC4RFDahjsC
         8iKw==
X-Forwarded-Encrypted: i=1; AJvYcCWgA08v5P6ctzAu0HxGI/Z2M135iNzPeR8Z9S0/gLEWmXbB2pT4mX1KaNPd8LTcVCRRt2PdLscCq5U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7BJNCfgf8bOVDVfHokNgbCpKPmtWkx3A312SKouq2udsZsAnw
	7WBhtW78TMM3h9djk4cc4h+rN1xMkAE/SqO9F4CbT7hYHAQZOUwkmAMqN54KB6A=
X-Google-Smtp-Source: AGHT+IHLftPxfBYy3OdI0Mz6ENCuvIWmPxFLdFwB4D/KOPYIAnhtxSOxelLERchVWegk4UMjsgJi4w==
X-Received: by 2002:a05:6512:3b2b:b0:539:e1ea:c298 with SMTP id 2adb3069b0e04-53b348cbb37mr1416369e87.22.1729981155774;
        Sat, 26 Oct 2024 15:19:15 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53b2e10c177sm618670e87.58.2024.10.26.15.19.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Oct 2024 15:19:15 -0700 (PDT)
Date: Sun, 27 Oct 2024 01:19:12 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Taniya Das <quic_tdas@quicinc.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH v4 11/11] clk: qcom: add SAR2130P GPU Clock Controller
 support
Message-ID: <bwmoa5jyyxqyrspq4hjcr6cn475bmo5jhb5fenpmohoucuvop7@mrm7faeivymw>
References: <20241026-sar2130p-clocks-v4-0-37100d40fadc@linaro.org>
 <20241026-sar2130p-clocks-v4-11-37100d40fadc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241026-sar2130p-clocks-v4-11-37100d40fadc@linaro.org>

On Sat, Oct 26, 2024 at 06:47:09PM +0300, Dmitry Baryshkov wrote:
> From: Konrad Dybcio <konrad.dybcio@linaro.org>
> 
> Add support for the GPU Clock Controller as used on the SAR2130P and
> SAR1130P platforms.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig          |   9 +
>  drivers/clk/qcom/Makefile         |   1 +
>  drivers/clk/qcom/gpucc-sar2130p.c | 503 ++++++++++++++++++++++++++++++++++++++
>  3 files changed, 513 insertions(+)
> 
> +
> +static int gpu_cc_sar2130p_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct regmap *regmap;
> +	int ret;

This generates unused variabel warning. I'll send next iteration after
some time.

> +
> +	regmap = qcom_cc_map(pdev, &gpu_cc_sar2130p_desc);
> +	if (IS_ERR(regmap))
> +		return dev_err_probe(dev, PTR_ERR(regmap), "Couldn't map GPU_CC\n");
> +
> +	clk_lucid_ole_pll_configure(&gpu_cc_pll0, regmap, &gpu_cc_pll0_config);
> +	clk_lucid_ole_pll_configure(&gpu_cc_pll1, regmap, &gpu_cc_pll1_config);
> +
> +	/* Keep some clocks always-on */
> +	qcom_branch_set_clk_en(regmap, 0x900c); /* GPU_CC_DEMET_CLK */
> +
> +	return qcom_cc_really_probe(dev, &gpu_cc_sar2130p_desc, regmap);
> +}
> +
> +static struct platform_driver gpu_cc_sar2130p_driver = {
> +	.probe = gpu_cc_sar2130p_probe,
> +	.driver = {
> +		.name = "gpu_cc-sar2130p",
> +		.of_match_table = gpu_cc_sar2130p_match_table,
> +	},
> +};
> +module_platform_driver(gpu_cc_sar2130p_driver);
> +
> +MODULE_DESCRIPTION("QTI GPU_CC SAR2130P Driver");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.39.5
> 

-- 
With best wishes
Dmitry
