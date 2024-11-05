Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 155EA1CF5C6
	for <linux-clk@vger.kernel.org>; Tue,  5 Nov 2024 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800855; cv=none; b=Wzyb3oX11x8m064pN5XG/7AaeyvWAzazGZ8IaOSf2/IUXwbE/Ia6m29CSq4+Tj+aP0rFQFkosyNs+v7kovZMgCjw0y+QjR5CUkum+KLtcT1W8l1Po/vn5g43htkNgpQdXEKXJbaOEEyNLqR/S2GhOv/qJTYK95snQ+MPMHpdxHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800855; c=relaxed/simple;
	bh=G51jhzQqKY+D8hwS2m/4yusGKIpJiOixdKXy7qb5+3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=omLAob5OdVmA8mWAOZUnrF0H9xJPB6IIZuMcnl7wQf7Hi2qEqZ+C/ho2KziOasbM0Stv6/SgLcGr7dwXwCOJkCgJpHkjn7wcFK2WOE+2ADuXNkM/5+f0K2Rh13jlzyOGQD6vUmw2jt70s3y3bUcckCHiTdxxDnlwqW98FDZJ6Vo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jGePmVM2; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jGePmVM2"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43159c9f617so41431155e9.2
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2024 02:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800852; x=1731405652; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qqjjzu00wo0rLZzR44vy7Mc+li1wHJBT4o2yabL2Nbg=;
        b=jGePmVM2e84dkSbXxcmOBAYW74kcJv05H4xJ0onu4KtIDntVGw4FQoV8GdPCm9kn/g
         QTTwRKQOxfl115hBL7M7+vRgZSpfcIXtpeCijBMg/yu6YaKOJv0xDAfUCbcG5R1w7ZIx
         YEgeQfb8Kdbuuq2RmmRcPIIfDx2lndcCndhF7EciAv+KZ9qeqipR6syOe1buGqIOpw4U
         6j0j1M77aCtJcz4pPXGxnM6pxxP2Y5i+YiqZFsNfvWv+xHkGoEKwyp5GhSvJjLVF3dkH
         SAa1vIlYqpzvx6ZDjAMFRek3WoqVkU0blic5iuJfclTNBPiJu3UCZCqONZCuxrNRJlrc
         3/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800852; x=1731405652;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqjjzu00wo0rLZzR44vy7Mc+li1wHJBT4o2yabL2Nbg=;
        b=YGetlv2aiWxF0YaOClG4WYHLCOnQrgaJwMIummwuPqX4yEWx/3hnsmuiW3X9/5ifql
         tSpnUKdb477u4lH4ievzayPpB/y/xlz4stOafb4/D+FhXdwux2YJwka1K7m5BzrjjOqu
         UXeBUL6DXYDnzl6jh7ghC25wUvnBzMbGjw6do/mhU4c18fg45M7B0bK4/FTmo/uvu8jl
         1K9yXYLrwMTO7MeMyDioZTJBZpS1BAohJLOHD8wNB9NJkG5fK6zEve3CzcklTfW1Oc9d
         Fahic3LKDHR/GEnP8XRr5zQoirDUSPLAVkqZA92lnusnF+xrnKrmLXh+uXANXITweNxo
         HKkA==
X-Forwarded-Encrypted: i=1; AJvYcCWGGV9nKbpKOEn7le50IIyeLf4+ldO5Am0UN2bf0M1QqaIqWYOWiORszG5S8VTAyHsQGD+WK3JK2k4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuU2nMPhe6yE2gFjSm3JPnSvk/Fkx4H4H7m2hIgYDYPQpA20Ul
	craGE8NXajlkh/jgQcQeJA/+KPQH15w11t4AuovXIT11/5aks4owfbiJTMBnPCc=
X-Google-Smtp-Source: AGHT+IFm4Qb4M3oCZgWdKRIgQrNjub2F52DYcxA3WJCF5Ri03R0Wl6j6IdT3Hz00MkG2UHWSG6u6kw==
X-Received: by 2002:a05:600c:458f:b0:431:3bf9:3ebb with SMTP id 5b1f17b1804b1-4319ad047a7mr311045735e9.24.1730800852400;
        Tue, 05 Nov 2024 02:00:52 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4327d5bf4e7sm181024905e9.15.2024.11.05.02.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 02:00:51 -0800 (PST)
Date: Tue, 5 Nov 2024 12:00:50 +0200
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
Subject: Re: [PATCH v3 3/5] clk: imx: fracn-gppll: fix pll power up
Message-ID: <Zyns0qfYpO3mZ4fa@linaro.org>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
 <20241027-imx-clk-v1-v3-3-89152574d1d7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-imx-clk-v1-v3-3-89152574d1d7@nxp.com>

On 24-10-27 20:00:09, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> To i.MX93 which features dual Cortex-A55 cores and DSU, when using
> writel_relaxed to write value to PLL registers, the value might be
> buffered. To make sure the value has been written into the hardware,
> using readl to read back the register could achieve the goal.
> 
> current PLL power up flow can be simplified as below:
>   1. writel_relaxed to set the PLL POWERUP bit;
>   2. readl_poll_timeout to check the PLL lock bit:
>      a). timeout = ktime_add_us(ktime_get(), timeout_us);
>      b). readl the pll the lock reg;
>      c). check if the pll lock bit ready
>      d). check if timeout
> 
> But in some corner cases, both the write in step 1 and read in
> step 2 will be blocked by other bus transaction in the SoC for a
> long time, saying the value into real hardware is just before step b).
> That means the timeout counting has begins for quite sometime since
> step a), but value still not written into real hardware until bus
> released just at a point before step b).
> 
> Then there maybe chances that the pll lock bit is not ready
> when readl done but the timeout happens. readl_poll_timeout will
> err return due to timeout. To avoid such unexpected failure,
> read back the reg to make sure the write has been done in HW
> reg.
> 
> So use readl after writel_relaxed to fix the issue.
> 
> Since we are here, to avoid udelay to run before writel_relaxed, use
> readl before udelay.
> 
> Fixes: 1b26cb8a77a4 ("clk: imx: support fracn gppll")
> Co-developed-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index 4749c3e0b7051cf53876664808aa28742f6861f7..85771afd4698ae6a0d8a7e82193301e187049255 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -254,9 +254,11 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
>  	pll_div = FIELD_PREP(PLL_RDIV_MASK, rate->rdiv) | rate->odiv |
>  		FIELD_PREP(PLL_MFI_MASK, rate->mfi);
>  	writel_relaxed(pll_div, pll->base + PLL_DIV);
> +	readl(pll->base + PLL_DIV);
>  	if (pll->flags & CLK_FRACN_GPPLL_FRACN) {
>  		writel_relaxed(rate->mfd, pll->base + PLL_DENOMINATOR);
>  		writel_relaxed(FIELD_PREP(PLL_MFN_MASK, rate->mfn), pll->base + PLL_NUMERATOR);
> +		readl(pll->base + PLL_NUMERATOR);
>  	}
>  
>  	/* Wait for 5us according to fracn mode pll doc */
> @@ -265,6 +267,7 @@ static int clk_fracn_gppll_set_rate(struct clk_hw *hw, unsigned long drate,
>  	/* Enable Powerup */
>  	tmp |= POWERUP_MASK;
>  	writel_relaxed(tmp, pll->base + PLL_CTRL);
> +	readl(pll->base + PLL_CTRL);
>  
>  	/* Wait Lock */
>  	ret = clk_fracn_gppll_wait_lock(pll);
> @@ -302,6 +305,7 @@ static int clk_fracn_gppll_prepare(struct clk_hw *hw)
>  
>  	val |= POWERUP_MASK;
>  	writel_relaxed(val, pll->base + PLL_CTRL);
> +	readl(pll->base + PLL_CTRL);
>  
>  	ret = clk_fracn_gppll_wait_lock(pll);
>  	if (ret)
> 
> -- 
> 2.37.1
> 
