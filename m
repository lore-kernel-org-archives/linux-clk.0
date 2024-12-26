Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82B6BF9FE
	for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2024 14:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735223672; cv=none; b=sYNdix8XzznglBzR96xWcvhqXZYHGKxsaKZtVnkJBkBwkP3TFOymLbywexo5p5ime4/Kw6U6bIM4U8Wr7ccHtgvK4A4e5GMrFrjoPzbZATGEaw9H6LD1PmJh95VUeirxO7vY0d7THHfbyHqb3pL+tBOybUWYJbYjffGe11Br7eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735223672; c=relaxed/simple;
	bh=/joUKp1FapFV0FDWL3iLSB/au/h69W3DHzHfU4GF3KQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rDEsnPr2LxCxHGMaC2us2vU15XAU+Soni2qXZ5l3Iy/Gf0j4pP0pa0s43F4SoJEgL1PY8iZuKLJLG9NRMaamehQEaCvRinxM2h2BRbqo4Aa+uLhi4f8QMbmQJ1HonU1HoWm8UOHwBsT2HHK+NcZeRrGocbAjzZ8oeBN0iAVPW8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ueZFeYYW; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ueZFeYYW"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-385d7f19f20so3020650f8f.1
        for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2024 06:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1735223669; x=1735828469; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZWaMQHTniKNiKHMTp7F80RZe2wo6ZB4wndPYy3Gh4Fs=;
        b=ueZFeYYWl+22X9ePoTStvND369ctQ3U1abECjmC/Qlm3FU+R6zp4pB/2p+ra2RR2Gq
         d9wW3jPOw/tjvCn4u2SyPyIayPbAocJw4e4bFbYX31Pl5Xw7RQFeZKeLWeDLAJejfIwZ
         iilDRdraHTMdLX08H+ZhyBUc2/AOzQUGgWrNSFqA90A5xex1d2YZNEGXViCi4vzv5TSw
         QrMcufdIKu4gn8xNUtmtb2xZBC9CCdWSB6H0qbGQj3lvN9sR+q96u4Vlr/grZP5bXE6q
         yVKrHBN3pTYFSLUTKDdTqkX8gQRDYE4YsbklWD85EIWKv6il3161tjRZhYTpAmcaLVsU
         bt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735223669; x=1735828469;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZWaMQHTniKNiKHMTp7F80RZe2wo6ZB4wndPYy3Gh4Fs=;
        b=goBNzuY+0BHgXlEXVozau5Z7KJkB/s/L8KywipTbiziqFDzR0ddtElIAwRooFwe/Vm
         xmQ9//tn6LNhCE4fu4TgcC7yGyCgzEBoUV+nYR1GgatGR1jHAZyDjk8u302kYg9wnEzP
         LQidOhGEGSwpsx3DqD4DWzndwA4VWM2G8SrkhWsWPHTijTymWtSfI/toHprbiwmLu+Tt
         QKhj+oDcEo/Cl8vrPIuA1FTbz+DsdTsp9b9bCJyUBWx1dEG0W1/GEcjQdEkhj3/d3/Wh
         NturiDVPOBmG7c0daklNotxLiM/WUtSHhIeEzGNTn1lIpy8Ry3e1KqNd0cdaMFMEDq89
         CbNQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyYy9sB6rJfVDK3yufFPX6qSVQTmg5p+Jhy3nlpxVV9gIwejarOTrnMk0i67kl9AkLxt9WEipS3A0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjO8qYWsPKmAAvIL8NbhgPNBResyO4gbJ5rRRFBUQaCjEMH7aF
	+aX1A+RYrKorrPUJTHHvA14isFi6uJZNPtR9468U7zsZ8v/mRAFA4bhsLqJBYZM=
X-Gm-Gg: ASbGncs7iQyNOC3BH2m7KdTcU0J0LuZ1j/5mR7YnyGfsCDsII+7TxmQu3lm0a+5q7oX
	ZdZuQidW818TR1v2cagWMwPt78qsf4nmj08M9N5XuwonuHXf8DO7nTLi0qxhWAjpZd28YoWCZtT
	QTDRLbIvhBwTCJp7Dq2KU/qz/tNi9QL5xbB4VEqT2oA5y+chPs9jljCyBnsP80Ava7IkIRmG4HU
	flg0Qwu2CzD4FeqhC4jakUevvf2E6TFU3d1KfAXUtglqujnWqtroUg=
X-Google-Smtp-Source: AGHT+IEpquj9mqHQrFXHSl5hzcnxKsnrxJ39lD9GV2mzs7t3fW0dHSS7dyN+P7J8ye5qxYUx0CveZA==
X-Received: by 2002:a05:6000:1848:b0:386:459e:655d with SMTP id ffacd0b85a97d-38a221fa039mr22306469f8f.20.1735223668760;
        Thu, 26 Dec 2024 06:34:28 -0800 (PST)
Received: from linaro.org ([82.76.168.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm19364218f8f.92.2024.12.26.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Dec 2024 06:34:28 -0800 (PST)
Date: Thu, 26 Dec 2024 16:34:26 +0200
From: Abel Vesa <abel.vesa@linaro.org>
To: Xiaolei Wang <xiaolei.wang@windriver.com>
Cc: abelvesa@kernel.org, peng.fan@nxp.com, mturquette@baylibre.com,
	sboyd@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de,
	kernel@pengutronix.de, festevam@gmail.com, akshay.bhat@timesys.com,
	p.zabel@pengutronix.de, Ranjani.Vaidyanathan@nxp.com,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: imx6q: No need to repeatedly disable analog clk
 during kdump
Message-ID: <Z21pcg6ZGA7n0wXy@linaro.org>
References: <20241107112750.3590720-1-xiaolei.wang@windriver.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241107112750.3590720-1-xiaolei.wang@windriver.com>

On 24-11-07 19:27:50, Xiaolei Wang wrote:
> During kdump, when the second kernel is started, the LDB parent
> has already been switched and will not be switched again, so
> there is no need to repeatedly disable PLL2_PFD2, PLL5, etc.
> Repeatedly disabling PLL2_PFD2 causes the system to hang
> 
> LDB Clock Switch Procedure & i.MX6 Asynchronous Clock
> Switching Guidelines[1]
> 
> [1]https://www.nxp.com/docs/en/engineering-bulletin/EB821.pdf
> 
> Fixes: 5d283b083800 ("clk: imx6: Fix procedure to switch the parent of LDB_DI_CLK")
> Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>

LGTM.

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-imx6q.c | 84 ++++++++++++++++++-------------------
>  1 file changed, 42 insertions(+), 42 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-imx6q.c b/drivers/clk/imx/clk-imx6q.c
> index bf4c1d9c9928..edbdaeea68b3 100644
> --- a/drivers/clk/imx/clk-imx6q.c
> +++ b/drivers/clk/imx/clk-imx6q.c
> @@ -291,6 +291,42 @@ static void mmdc_ch1_reenable(void __iomem *ccm_base)
>  	writel_relaxed(reg, ccm_base + CCM_CCSR);
>  }
>  
> +#define CCM_ANALOG_PLL_VIDEO    0xa0
> +#define CCM_ANALOG_PFD_480      0xf0
> +#define CCM_ANALOG_PFD_528      0x100
> +
> +#define PLL_ENABLE              BIT(13)
> +
> +#define PFD0_CLKGATE            BIT(7)
> +#define PFD1_CLKGATE            BIT(15)
> +#define PFD2_CLKGATE            BIT(23)
> +#define PFD3_CLKGATE            BIT(31)
> +
> +static void disable_anatop_clocks(void __iomem *anatop_base)
> +{
> +	unsigned int reg;
> +
> +	/* Make sure PLL2 PFDs 0-2 are gated */
> +	reg = readl_relaxed(anatop_base + CCM_ANALOG_PFD_528);
> +	/* Cannot gate PFD2 if pll2_pfd2_396m is the parent of MMDC clock */
> +	if (clk_get_parent(hws[IMX6QDL_CLK_PERIPH_PRE]->clk) ==
> +	   hws[IMX6QDL_CLK_PLL2_PFD2_396M]->clk)
> +		reg |= PFD0_CLKGATE | PFD1_CLKGATE;
> +	else
> +		reg |= PFD0_CLKGATE | PFD1_CLKGATE | PFD2_CLKGATE;
> +	writel_relaxed(reg, anatop_base + CCM_ANALOG_PFD_528);
> +
> +	/* Make sure PLL3 PFDs 0-3 are gated */
> +	reg = readl_relaxed(anatop_base + CCM_ANALOG_PFD_480);
> +	reg |= PFD0_CLKGATE | PFD1_CLKGATE | PFD2_CLKGATE | PFD3_CLKGATE;
> +	writel_relaxed(reg, anatop_base + CCM_ANALOG_PFD_480);
> +
> +	/* Make sure PLL5 is disabled */
> +	reg = readl_relaxed(anatop_base + CCM_ANALOG_PLL_VIDEO);
> +	reg &= ~PLL_ENABLE;
> +	writel_relaxed(reg, anatop_base + CCM_ANALOG_PLL_VIDEO);
> +}
> +
>  /*
>   * We have to follow a strict procedure when changing the LDB clock source,
>   * otherwise we risk introducing a glitch that can lock up the LDB divider.
> @@ -320,7 +356,7 @@ static void mmdc_ch1_reenable(void __iomem *ccm_base)
>   * switches the parent to the bottom mux first and then manipulates the top
>   * mux to ensure that no glitch will enter the divider.
>   */
> -static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base)
> +static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base, void __iomem *anatop_base)
>  {
>  	unsigned int reg;
>  	unsigned int sel[2][4];
> @@ -368,6 +404,10 @@ static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base)
>  	if (sel[0][0] == sel[0][3] && sel[1][0] == sel[1][3])
>  		return;
>  
> +	disable_anatop_clocks(anatop_base);
> +
> +	imx_mmdc_mask_handshake(ccm_base, 1);
> +
>  	mmdc_ch1_disable(ccm_base);
>  
>  	for (i = 1; i < 4; i++) {
> @@ -382,42 +422,6 @@ static void init_ldb_clks(struct device_node *np, void __iomem *ccm_base)
>  	mmdc_ch1_reenable(ccm_base);
>  }
>  
> -#define CCM_ANALOG_PLL_VIDEO	0xa0
> -#define CCM_ANALOG_PFD_480	0xf0
> -#define CCM_ANALOG_PFD_528	0x100
> -
> -#define PLL_ENABLE		BIT(13)
> -
> -#define PFD0_CLKGATE		BIT(7)
> -#define PFD1_CLKGATE		BIT(15)
> -#define PFD2_CLKGATE		BIT(23)
> -#define PFD3_CLKGATE		BIT(31)
> -
> -static void disable_anatop_clocks(void __iomem *anatop_base)
> -{
> -	unsigned int reg;
> -
> -	/* Make sure PLL2 PFDs 0-2 are gated */
> -	reg = readl_relaxed(anatop_base + CCM_ANALOG_PFD_528);
> -	/* Cannot gate PFD2 if pll2_pfd2_396m is the parent of MMDC clock */
> -	if (clk_get_parent(hws[IMX6QDL_CLK_PERIPH_PRE]->clk) ==
> -	    hws[IMX6QDL_CLK_PLL2_PFD2_396M]->clk)
> -		reg |= PFD0_CLKGATE | PFD1_CLKGATE;
> -	else
> -		reg |= PFD0_CLKGATE | PFD1_CLKGATE | PFD2_CLKGATE;
> -	writel_relaxed(reg, anatop_base + CCM_ANALOG_PFD_528);
> -
> -	/* Make sure PLL3 PFDs 0-3 are gated */
> -	reg = readl_relaxed(anatop_base + CCM_ANALOG_PFD_480);
> -	reg |= PFD0_CLKGATE | PFD1_CLKGATE | PFD2_CLKGATE | PFD3_CLKGATE;
> -	writel_relaxed(reg, anatop_base + CCM_ANALOG_PFD_480);
> -
> -	/* Make sure PLL5 is disabled */
> -	reg = readl_relaxed(anatop_base + CCM_ANALOG_PLL_VIDEO);
> -	reg &= ~PLL_ENABLE;
> -	writel_relaxed(reg, anatop_base + CCM_ANALOG_PLL_VIDEO);
> -}
> -
>  static struct clk_hw * __init imx6q_obtain_fixed_clk_hw(struct device_node *np,
>  							const char *name,
>  							unsigned long rate)
> @@ -641,10 +645,6 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
>  	hws[IMX6QDL_CLK_IPU1_SEL]         = imx_clk_hw_mux("ipu1_sel",         base + 0x3c, 9,  2, ipu_sels,          ARRAY_SIZE(ipu_sels));
>  	hws[IMX6QDL_CLK_IPU2_SEL]         = imx_clk_hw_mux("ipu2_sel",         base + 0x3c, 14, 2, ipu_sels,          ARRAY_SIZE(ipu_sels));
>  
> -	disable_anatop_clocks(anatop_base);
> -
> -	imx_mmdc_mask_handshake(base, 1);
> -
>  	if (clk_on_imx6qp()) {
>  		hws[IMX6QDL_CLK_LDB_DI0_SEL]      = imx_clk_hw_mux_flags("ldb_di0_sel", base + 0x2c, 9,  3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels), CLK_SET_RATE_PARENT);
>  		hws[IMX6QDL_CLK_LDB_DI1_SEL]      = imx_clk_hw_mux_flags("ldb_di1_sel", base + 0x2c, 12, 3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels), CLK_SET_RATE_PARENT);
> @@ -654,7 +654,7 @@ static void __init imx6q_clocks_init(struct device_node *ccm_node)
>  		 * bug. Set the muxes to the requested values before registering the
>  		 * ldb_di_sel clocks.
>  		 */
> -		init_ldb_clks(np, base);
> +		init_ldb_clks(np, base, anatop_base);
>  
>  		hws[IMX6QDL_CLK_LDB_DI0_SEL]      = imx_clk_hw_mux_ldb("ldb_di0_sel", base + 0x2c, 9,  3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels));
>  		hws[IMX6QDL_CLK_LDB_DI1_SEL]      = imx_clk_hw_mux_ldb("ldb_di1_sel", base + 0x2c, 12, 3, ldb_di_sels,      ARRAY_SIZE(ldb_di_sels));
> -- 
> 2.25.1
> 
