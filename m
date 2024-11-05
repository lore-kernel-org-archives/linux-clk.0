Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC9461D173F
	for <linux-clk@vger.kernel.org>; Tue,  5 Nov 2024 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800762; cv=none; b=QcrnXWHHDS1urGYOhevRPpDRu1NuKUFIb+M1tsuTho32THnBUMFxegnBCpqnJjfBuv2MYP3hTopWZFv6NijjF340Her/IeZUTrAEJosDyMkSG8vbov1mYrTBOwMO6l/30jsfi4E+xI1ZPVYjcx6au1aXoiwtlXm9PtGO3rA1S1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800762; c=relaxed/simple;
	bh=zNjg+Qs9cvpRbWrCXV1WmkwBfqNjNTh65eWMo8ZLqiA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhvHaL5xZ9Vhz+5opBTX8rOZZ6PrV4oOZBqoTGyzst/L6qNi+RuOcaYPfKWD3otFjxtOB1uRT2jnZmqxxJAW5b/B2hRubQnET14e0OqQ6iIP7Il9Z2bT6YTo8+MYqjA5QFtdqASKCUvZhiqmlShNfZH4eC+peL1h2zEUfRx7aXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QA0HHY7X; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QA0HHY7X"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-431695fa98bso41401865e9.3
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2024 01:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800759; x=1731405559; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fyGIcIP85izql5VivzAyfDSoQYWkeBRRivWAb6Rz/VY=;
        b=QA0HHY7XcQzU7SHUXS+CImv144g7kMaDrsRXWaBq25NQnOmMVKD5RIPc8zKWGaRvA2
         vCWGrRK30QoupgI3csTIR9WSUnCQh7gc/PA2aMk8eTMQxoSoIq5wJ7Xiidnml67nKSRG
         C97+h4F9+buyX19P5EINxP65JrcY6V70xk+u9JEm7YfcpfrP/dtvr5TW0HWZv9rS0I/o
         ZeXDNU2pm7/jFbV51Wrb323wW5X/WCfmdpZA1PeuaMWCnoPBzfJ8GGV+EVow1kHMBCut
         1humTMG98tqfwovZMo3dnfplL6Iugm6tXK8/QXnH/6T2CMt5JLd1wwJ51r/7CJVo9PrN
         zYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800759; x=1731405559;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fyGIcIP85izql5VivzAyfDSoQYWkeBRRivWAb6Rz/VY=;
        b=v63ev0q2wpHbxVhcUO0Tc6YHq4CN+50nuFsiOZ2aclHvcPkINAYuECyzNl22+50dca
         /fe7XbpuVv8yG5W4QB0xeX23JggIh37SkIlB8sGx1PenInZqhoWCi1Cu/FqGNPsFcCiH
         GHt9mIj1OVO/3ptL0cmveihgS/eK77AHwEExhZonkZtmMbfFaXuHPt//Lh0b1kXnnQ6/
         8EuwiltQ03z9c0cDJ3ERdtXWT7zjcHOEemeCNFayvaJ2xyHqV+EF5j7l9jW9I7hMzBGF
         aYT1ZRq7/VsdDNulDLHLZ5e8eAV0KXwIdZAfCJeKFenMtjsbln7wDSam9an87jDGWCkR
         4DZA==
X-Forwarded-Encrypted: i=1; AJvYcCU9vbV2tWulITGKKRBqWAts+ed4Wv+EZ4SjMcCWT9Nm5DfIK2lgNEy6YHGw81T67lvlP5H22qfFN1A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxT6UCqBpGsMfwbcm+ZRfE8xhk7UsWts3Sgu5NZEd2R/v1NKGny
	eb8YPIja8PmZwyxpReB5m6B0mpXEDYWwRG7TJg4WVgddwTAa3rZSUlCbrBr/pwSRMKwrLSw5JiV
	K
X-Google-Smtp-Source: AGHT+IFh1eUnSOgYeUPL8vbfgeu7KUTTM1nBaaDD9m2PgycfeAUV7I9FEe2TI7FKOJYLMdMaTY2lWw==
X-Received: by 2002:a05:600c:458f:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-4319ad047a7mr310993305e9.24.1730800759033;
        Tue, 05 Nov 2024 01:59:19 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5ab305sm182610885e9.7.2024.11.05.01.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:59:18 -0800 (PST)
Date: Tue, 5 Nov 2024 11:59:17 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Aisheng Dong <aisheng.dong@nxp.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>
Subject: Re: [PATCH v3 2/5] clk: imx: fracn-gppll: correct PLL initialization
 flow
Message-ID: <ZynsdXx3McoW9SK5@linaro.org>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
 <20241027-imx-clk-v1-v3-2-89152574d1d7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241027-imx-clk-v1-v3-2-89152574d1d7@nxp.com>

On 24-10-27 20:00:08, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Per i.MX93 Reference Mannual 22.4 Initialization information
> 1. Program appropriate value of DIV[ODIV], DIV[RDIV] and DIV[MFI]
>    as per Integer mode.
> 2. Wait for 5 μs.
> 3. Program the following field in CTRL register.
>    Set CTRL[POWERUP] to 1'b1 to enable PLL block.
> 4. Poll PLL_STATUS[PLL_LOCK] register, and wait till PLL_STATUS[PLL_LOCK]
>    is 1'b1 and pll_lock output signal is 1'b1.
> 5. Set CTRL[CLKMUX_EN] to 1'b1 to enable PLL output clock.
> 
> So move the CLKMUX_EN operation after PLL locked.
> 
> Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
> Co-developed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 591e0364ee5c113859a7b6271c8c11e98a0e0ffc..4749c3e0b7051cf53876664808aa28742f6861f7 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -303,13 +303,13 @@ static int clk_fracn_gppll_prepare(struct clk_hw *hw)
>  	val |= POWERUP_MASK;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
>  
> -	val |= CLKMUX_EN;
> -	writel_relaxed(val, pll->base + PLL_CTRL);
> -
>  	ret = clk_fracn_gppll_wait_lock(pll);
>  	if (ret)
>  		return ret;
>  
> +	val |= CLKMUX_EN;
> +	writel_relaxed(val, pll->base + PLL_CTRL);
> +
>  	val &= ~CLKMUX_BYPASS;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
>  
> 
> -- 
> 2.37.1
> 
