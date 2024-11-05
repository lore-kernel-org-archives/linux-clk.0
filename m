Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B421D1740
	for <linux-clk@vger.kernel.org>; Tue,  5 Nov 2024 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730800739; cv=none; b=D3zfCQNa5NMGtcHx3tiY9hwfBQ0BjWIcceo9oIglIwCnbmdVCWPzhuJZniQj0OyNj/A1iw35zo5ZWVyJk/CHDSOTjvgCIX1WaXFypYtyldzz4ntAac+S/fJfJ3nHNq9tWbR7rD1FdQ4ZR4HZvav94v225aFdzqzDdSm3/kGcEYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730800739; c=relaxed/simple;
	bh=ukceNXo2pywTrMUB3iOKRDJfjIGMJ5DmLc6fZKJlndI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sorvFc1SFmgih6ViegVH9ll+vrir1HWDmDRYo/AXs66bImbngrDScF6PMVEpewTCGrAbcn3a+bIZsKxE9LxE+rfIow+1ZvXH2Q+095J2EdAiWe+0o6QEi5zKLsryKO/3n5eUWUrsN3SAeTFcgXNOWjJY2OHECBPKLY0b2HDAnCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YQrRJVYW; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YQrRJVYW"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4315e9e9642so44939945e9.0
        for <linux-clk@vger.kernel.org>; Tue, 05 Nov 2024 01:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730800736; x=1731405536; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=J6h/R7lfM4qCrCDmado2Rkx+M46kJFIDRE2I4JWaZEQ=;
        b=YQrRJVYWhQoHScNLIRWLWoz/Ed/beZkMV/R6MSPdywT5b8+2G3lDIlXl90ZBGy4r0T
         Vh+4dri15ZqXri1x7sk2+ZJO6JfnC7UmIc5KR9x8H7kozgxXvo9sZoraYCO47ST/pevd
         xfudI6sjOKEjnAtATLR2wJh66Q2EiaVGpDEagrhVTi8TEmBAw/DH+OK8/qxHljyUxfxF
         8cmVMsd3PKnBKKY2QAkARj/nmNXqEal8LAUCIZQ9R5I3V4nNMiyyXP7b8tYCj5fruSBZ
         I//jzlG8gGifUkjse/BO0gvAt3NVc7SnpvhylzeJ0yInFpeD8BGvzaLhd4xCvjJrMFbH
         Xqvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730800736; x=1731405536;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J6h/R7lfM4qCrCDmado2Rkx+M46kJFIDRE2I4JWaZEQ=;
        b=PMKVAFOuqdGQNxE4IZsFjgMzVbm9RivJUD1oX9vCxA1SYmrRu+azHhuE7gTWgR2Nux
         SlvgHFMbKftuHEVYPFPA24Yvsxr9gtVWkCyXSdXLV5flRW8JmPSXkfB1nB4HkTECP3R2
         kWhYI3n0syS0PuLu/AC7pwcyx+sVSXKviV/fkt8T14efXOF0YY0M3sXsKeValscjrFi5
         rWVUyq+tcrYS0oggDOMlUmD/O9QK4L5gt7jt9wecuH777ARAwBxY0SvDyIP7whKyKo9U
         VamIlAqLcERpTbEkdEiL97/Mt46hu7cE1A1pHuhs+4wKalWvIT5k/Z6gNsndrhtrgT2f
         ZioA==
X-Forwarded-Encrypted: i=1; AJvYcCUXqtwnBtEdlwy1t1xa3Ni+0I5assucoX2U38TGv1tfmvRALKr2ojk6oDuXeTsiHQvvzCcYy3woNsw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/l2idr/Xjr2QQSUfbsx7//bVbvny3lY9cnIfwZRmlJ+4MgU5q
	o1FESUmlCIrD7xjztfE+R9ODYtgTfVY6DAcGaWvII0xAlPqXGmnslZu7AMlQvmc=
X-Google-Smtp-Source: AGHT+IENI/tO1m+wxDQs0DVE4GgW4Nt88abEszTQqX11x4d9wmMLAMDwYiShM/iz+S/e697/IpvpqA==
X-Received: by 2002:a05:600c:3112:b0:431:5d4c:5eff with SMTP id 5b1f17b1804b1-4327b6f46bdmr163702085e9.2.1730800736173;
        Tue, 05 Nov 2024 01:58:56 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c10d4d1fsm15533035f8f.38.2024.11.05.01.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Nov 2024 01:58:55 -0800 (PST)
Date: Tue, 5 Nov 2024 11:58:54 +0200
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
	linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 1/5] clk: imx: lpcg-scu: SW workaround for errata
 (e10858)
Message-ID: <ZynsXhzcoyfCzLwq@linaro.org>
References: <20241027-imx-clk-v1-v3-0-89152574d1d7@nxp.com>
 <20241027-imx-clk-v1-v3-1-89152574d1d7@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241027-imx-clk-v1-v3-1-89152574d1d7@nxp.com>

On 24-10-27 20:00:07, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> Back-to-back LPCG writes can be ignored by the LPCG register due to
> a HW bug. The writes need to be separated by at least 4 cycles of
> the gated clock. See https://www.nxp.com.cn/docs/en/errata/IMX8_1N94W.pdf
> 
> The workaround is implemented as follows:
> 1. For clocks running greater than or equal to 24MHz, a read
> followed by the write will provide sufficient delay.
> 2. For clocks running below 24MHz, add a delay of 4 clock cylces
> after the write to the LPCG register.
> 
> Fixes: 2f77296d3df9 ("clk: imx: add lpcg clock support")
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-lpcg-scu.c | 37 +++++++++++++++++++++++++++++--------
>  1 file changed, 29 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-lpcg-scu.c b/drivers/clk/imx/clk-lpcg-scu.c
> index dd5abd09f3e206a5073767561b517d5b3320b28c..620afdf8dc03e9564bb074ca879cf778f7fc6419 100644
> --- a/drivers/clk/imx/clk-lpcg-scu.c
> +++ b/drivers/clk/imx/clk-lpcg-scu.c
> @@ -6,10 +6,12 @@
>  
>  #include <linux/bits.h>
>  #include <linux/clk-provider.h>
> +#include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
> +#include <linux/units.h>
>  
>  #include "clk-scu.h"
>  
> @@ -41,6 +43,29 @@ struct clk_lpcg_scu {
>  
>  #define to_clk_lpcg_scu(_hw) container_of(_hw, struct clk_lpcg_scu, hw)
>  
> +/* e10858 -LPCG clock gating register synchronization errata */
> +static void lpcg_e10858_writel(unsigned long rate, void __iomem *reg, u32 val)
> +{
> +	writel(val, reg);
> +
> +	if (rate >= 24 * HZ_PER_MHZ || rate == 0) {
> +		/*
> +		 * The time taken to access the LPCG registers from the AP core
> +		 * through the interconnect is longer than the minimum delay
> +		 * of 4 clock cycles required by the errata.
> +		 * Adding a readl will provide sufficient delay to prevent
> +		 * back-to-back writes.
> +		 */
> +		readl(reg);
> +	} else {
> +		/*
> +		 * For clocks running below 24MHz, wait a minimum of
> +		 * 4 clock cycles.
> +		 */
> +		ndelay(4 * (DIV_ROUND_UP(1000 * HZ_PER_MHZ, rate)));
> +	}
> +}
> +
>  static int clk_lpcg_scu_enable(struct clk_hw *hw)
>  {
>  	struct clk_lpcg_scu *clk = to_clk_lpcg_scu(hw);
> @@ -57,7 +82,8 @@ static int clk_lpcg_scu_enable(struct clk_hw *hw)
>  		val |= CLK_GATE_SCU_LPCG_HW_SEL;
>  
>  	reg |= val << clk->bit_idx;
> -	writel(reg, clk->reg);
> +
> +	lpcg_e10858_writel(clk_hw_get_rate(hw), clk->reg, reg);
>  
>  	spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
>  
> @@ -74,7 +100,7 @@ static void clk_lpcg_scu_disable(struct clk_hw *hw)
>  
>  	reg = readl_relaxed(clk->reg);
>  	reg &= ~(CLK_GATE_SCU_LPCG_MASK << clk->bit_idx);
> -	writel(reg, clk->reg);
> +	lpcg_e10858_writel(clk_hw_get_rate(hw), clk->reg, reg);
>  
>  	spin_unlock_irqrestore(&imx_lpcg_scu_lock, flags);
>  }
> @@ -145,13 +171,8 @@ static int __maybe_unused imx_clk_lpcg_scu_resume(struct device *dev)
>  {
>  	struct clk_lpcg_scu *clk = dev_get_drvdata(dev);
>  
> -	/*
> -	 * FIXME: Sometimes writes don't work unless the CPU issues
> -	 * them twice
> -	 */
> -
> -	writel(clk->state, clk->reg);
>  	writel(clk->state, clk->reg);
> +	lpcg_e10858_writel(0, clk->reg, clk->state);
>  	dev_dbg(dev, "restore lpcg state 0x%x\n", clk->state);
>  
>  	return 0;
> 
> -- 
> 2.37.1
> 
