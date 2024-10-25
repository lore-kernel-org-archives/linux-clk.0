Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591391D26E7;
	Fri, 25 Oct 2024 09:38:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729849134; cv=none; b=fW1hmOCY10RJQjshdbpUzSp6wB1H0o4JMBDYcYhXaUwOvY+L6Y7bRGrBB/A7cwdU1hdIbhKCvdfGYHQi1Ecm0M4gwpSVVpsW/ETuyIq64ThGCGDhFex9njNDVM3GLOIO2nExOfFdX1DBYOJW7UlX+AmjlChcDihzlq1vseHIc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729849134; c=relaxed/simple;
	bh=+Q5754NxjzIaGCjBE8cr3K9Tgne9Hh3xvSdv5A40ttE=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYKJi11Wv/FmSpTLji5O6E81uIU53+J6s4d1f+G3JbS1YzMWh6wdJuOIcc/qq3YMZyJ9sQKq/ndI5Dr4c6BUcAQcHi1Lc3Kj8u2f+5PE7e9sxP4ag1/YacLjT3qAtOZUk0gf/7zyadM7W/ew/Rtq99no/Gvg89HZ/BHbsWxlS+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2A1BF339;
	Fri, 25 Oct 2024 02:39:20 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4FA13F528;
	Fri, 25 Oct 2024 02:38:47 -0700 (PDT)
Date: Fri, 25 Oct 2024 10:38:41 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 1/7] clk: sunxi-ng: h616: Add sigma-delta modulation
 settings for audio PLL
Message-ID: <20241025103828.41f459b5@donnerap.manchester.arm.com>
In-Reply-To: <20241023075917.186835-2-ryan@testtoast.com>
References: <20241023075917.186835-1-ryan@testtoast.com>
	<20241023075917.186835-2-ryan@testtoast.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 23 Oct 2024 20:56:57 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi Ryan,

> Allwinner has previously released a H616 audio driver which also
> provides sigma-delta modulation for the audio PLL clocks. This approach
> is used in other Allwinner SoCs, including the H3 and A64.
> 
> The manual-provided clock values are:
> PLL_AUDIO(hs) = 24 MHz*N/M1
> PLL_AUDIO(4X) = 24 MHz*N/M0/M1/P
> PLL_AUDIO(2X) = 24 MHz*N/M0/M1/P/2
> PLL_AUDIO(1X) = 24 MHz*N/M0/M1/P/4
> 
> A fixed post-divider of 2 is used to account for a M0 divider of
> 2, which cannot be modelled by the existing macros and ccu_nm struct.
> 
> Add SDM to the H616 clock control unit driver.

Thanks for the changes in the comments, that looks all good to me. I am
still scratching my head on why Allwinner promotes odd dividers, when
they somewhat warn about them in the manual, but I trust the wisdom of the
BSP here, and it certainly works. If any issues arise, we can always fix
that later.

> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Confirmed that the registers and bits match the manual, and the SDM values
also add up to reach those frequencies:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> 
> ---
> Changelog v1..v2:
> - Add fixed_post_div to high-speed audio clock to correct M0 value to 1 (ie divide by 2) based on manual
> - Correct PLL_AUDIO_(4/2/1)X clocks to manual-provided values
> - Add/correct inline comments for the above.
> - add CCU_FEATURE_FIXED_POSTDIV to pll_audio_hs_clk.common.features
> 
> Changelog v2..v3:
> - Update comments and commit message to more accurately reflect SDM changes and rationale
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 46 +++++++++++++++++---------
>  1 file changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 6c7623d4c59ea..05727fa1ee46e 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -215,20 +215,30 @@ static struct ccu_nkmp pll_de_clk = {
>  	},
>  };
>  
> -/*
> - * TODO: Determine SDM settings for the audio PLL. The manual suggests
> - * PLL_FACTOR_N=16, PLL_POST_DIV_P=2, OUTPUT_DIV=2, pattern=0xe000c49b
> - * for 24.576 MHz, and PLL_FACTOR_N=22, PLL_POST_DIV_P=3, OUTPUT_DIV=2,
> - * pattern=0xe001288c for 22.5792 MHz.
> - * This clashes with our fixed PLL_POST_DIV_P.
> +/* 
> + * Sigma-delta modulation settings table obtained from the vendor SDK driver.
> + * There are additional M0 and M1 divider bits not modelled here, so forced to
> + * fixed values in the probe routine. Sigma-delta modulation allows providing a
> + * fractional-N divider in the PLL, to help reaching those specific
> + * frequencies with less error.
>   */
> +static struct ccu_sdm_setting pll_audio_sdm_table[] = {
> +	{ .rate = 90316800, .pattern = 0xc001288d, .m = 3, .n = 22 },
> +	{ .rate = 98304000, .pattern = 0xc001eb85, .m = 5, .n = 40 },
> +};
> +
>  #define SUN50I_H616_PLL_AUDIO_REG	0x078
>  static struct ccu_nm pll_audio_hs_clk = {
>  	.enable		= BIT(31),
>  	.lock		= BIT(28),
>  	.n		= _SUNXI_CCU_MULT_MIN(8, 8, 12),
> -	.m		= _SUNXI_CCU_DIV(1, 1), /* input divider */
> +	.m		= _SUNXI_CCU_DIV(16, 6),
> +	.sdm		= _SUNXI_CCU_SDM(pll_audio_sdm_table,
> +					 BIT(24), 0x178, BIT(31)),
> +	.fixed_post_div = 2,
>  	.common		= {
> +		.features	= CCU_FEATURE_FIXED_POSTDIV | 
> +				  CCU_FEATURE_SIGMA_DELTA_MOD,
>  		.reg		= 0x078,
>  		.hw.init	= CLK_HW_INIT("pll-audio-hs", "osc24M",
>  					      &ccu_nm_ops,
> @@ -701,18 +711,20 @@ static const struct clk_hw *clk_parent_pll_audio[] = {
>  };
>  
>  /*
> - * The divider of pll-audio is fixed to 24 for now, so 24576000 and 22579200
> - * rates can be set exactly in conjunction with sigma-delta modulation.
> + * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the manual, with 
> + * a final divider of 1. The 2X and 1X clocks use 2 and 4 respectively. The 1x 
> + * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (and 
> + * multiples).
>   */
>  static CLK_FIXED_FACTOR_HWS(pll_audio_1x_clk, "pll-audio-1x",
>  			    clk_parent_pll_audio,
> -			    96, 1, CLK_SET_RATE_PARENT);
> +			    4, 1, CLK_SET_RATE_PARENT);
>  static CLK_FIXED_FACTOR_HWS(pll_audio_2x_clk, "pll-audio-2x",
>  			    clk_parent_pll_audio,
> -			    48, 1, CLK_SET_RATE_PARENT);
> +			    2, 1, CLK_SET_RATE_PARENT);
>  static CLK_FIXED_FACTOR_HWS(pll_audio_4x_clk, "pll-audio-4x",
>  			    clk_parent_pll_audio,
> -			    24, 1, CLK_SET_RATE_PARENT);
> +			    1, 1, CLK_SET_RATE_PARENT);
>  
>  static const struct clk_hw *pll_periph0_parents[] = {
>  	&pll_periph0_clk.common.hw
> @@ -1162,12 +1174,14 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
>  	}
>  
>  	/*
> -	 * Force the post-divider of pll-audio to 12 and the output divider
> -	 * of it to 2, so 24576000 and 22579200 rates can be set exactly.
> +	 * Set the output-divider for the pll-audio clocks (M0) to 2 and the
> +	 * input divider (M1) to 1 as recommended by the manual when using 
> +	 * SDM. 
>  	 */
>  	val = readl(reg + SUN50I_H616_PLL_AUDIO_REG);
> -	val &= ~(GENMASK(21, 16) | BIT(0));
> -	writel(val | (11 << 16) | BIT(0), reg + SUN50I_H616_PLL_AUDIO_REG);
> +	val &= ~BIT(1);
> +	val |= BIT(0);
> +	writel(val, reg + SUN50I_H616_PLL_AUDIO_REG);
>  
>  	/*
>  	 * First clock parent (osc32K) is unusable for CEC. But since there

