Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4443D19259B;
	Sun, 20 Oct 2024 11:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729425474; cv=none; b=nQYaQRME4XDmUbXIFjmtCScNw2ZWb4Iat1kUDh7yLE8wGwIUqh/ojfoMM1u6JV1lfFvDESpswW0OupUv9MgS6L0Y64dPLkg7hqavdDspF53HRtMOn/pqBpQEEJeL5UV1GH/Rmga+KTYJdqxVB/xRdmd6Rwp2itQJJC5hQJoXlNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729425474; c=relaxed/simple;
	bh=gbpmEsQrInjTsQllEL0d+1ipYxosLUDGzwVqo6mC+NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQnUECeEdoYkqoFDSUu/gZGX4s25I6t1PIz3dIphHFZDWVSuwXYM74ms/czNVkKuTF8Fqz2ZMW9UZU+O8LakZAiyqTQHn8zOSQ4R3pE2uXPdPmJaOmrGnOqkhf+AR7Z1oEfVVQF7esGK1kJbWPnLSwnw8gLH0XgDSoj51BSBs9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 490A0DA7;
	Sun, 20 Oct 2024 04:58:20 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD8FD3F58B;
	Sun, 20 Oct 2024 04:57:48 -0700 (PDT)
Date: Sun, 20 Oct 2024 12:56:54 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/7] clk: sunxi-ng: h616: Add sigma-delta modulation
 settings for audio PLL
Message-ID: <20241020125654.6bf3e86b@minigeek.lan>
In-Reply-To: <20241020083124.174724-2-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
	<20241020083124.174724-2-ryan@testtoast.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 20 Oct 2024 21:30:51 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

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
> A fixed post-divider of 2 is used to account for a fixed M0 divider of
> 2 (taken from the vendor BSP driver).

The real reason seems to be that our existing macros and struct cannot
model those extra dividers, and using M0=2 gives better results, so we
fix that in the probe routine and account for that using the fixed
post-div.

> Using SDM allows correction of the PLL_AUDIO_(4,2,1)X clock fixed
> dividers to the datasheet-specified values of 1/2/4 respectively.

As mentioned below, SDM has nothing to do with those simple dividers
clocks, it's just there to reach the "odd" base audio frequency more
accurately.

> 
> Add SDM to the H616 clock control unit driver.
> 
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
> 
> ---
> Changelog v1..v2:
> - Add fixed_post_div to high-speed audio clock to correct M0 value to 1 (ie divide by 2) based on manual
> - Correct PLL_AUDIO_(4/2/1)X clocks to manual-provided values
> - Add/correct inline comments for the above.
> - add CCU_FEATURE_FIXED_POSTDIV to pll_audio_hs_clk.common.features
> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 44 ++++++++++++++++----------
>  1 file changed, 28 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> index 6c7623d4c59ea..42feaaf5a59c6 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
> @@ -215,20 +215,28 @@ static struct ccu_nkmp pll_de_clk = {
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
> + * fixed values in the probe routine.
>   */
> +static struct ccu_sdm_setting pll_audio_sdm_table[] = {
> +	{ .rate = 90316800, .pattern = 0xc001288d, .m = 3, .n = 22 },
> +	{ .rate = 98304000, .pattern = 0xc001eb85, .m = 5, .n = 40 },

It's a bit strange to see odd dividers here, since the manual "warns"
against this, because it's causing a non-50% duty cycle. But apparently
the audio codec is fine with this (given it works)? Or does this apply
to the product of all the dividers (m * m0 * m1), so our m0=2 fixes
that?

And for the records, the numbers calculate like this (with SDM):
rate = 24MHz * (n + pattern[16:0] / 2^17) / m / m0 / m1
which gives 90316802 Hz and 98303997 Hz with those numbers,
respectively.

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
> @@ -701,18 +709,20 @@ static const struct clk_hw *clk_parent_pll_audio[] = {
>  };
>  
>  /*
> - * The divider of pll-audio is fixed to 24 for now, so 24576000 and 22579200
> - * rates can be set exactly in conjunction with sigma-delta modulation.
> + * The PLL_AUDIO_4X clock defaults to 24.5714 MHz according to the manual, with 

The manual says that PLL_AUDIO_1X defaults to 24.5714 MHz (24.576,
really?), so PLL_AUDIO_4X (the actual PLL output) should be four times
that.

> + * a final divider of 1. The 2X and 1X clocks use 2 and 4 respectively. The 1x 
> + * clock is set to either 24576000 or 22579200 for 48Khz and 44.1Khz (and 
> + * multiples) in conjunction with sigma-delta modulation.

That last part sounds a bit vague, what about:
" ... (and multiples). The Sigma-delta modulation bits allow providing a
fractional-N divider in the PLL, to help reaching those specific
frequencies with less error."

But then again this probably belongs more to the PLL_AUDIO_HS clock
comment above? Since this here is just to model the simple divider
clocks.

Anyway, the technical bits seem to add up, and that's what I came up
with in my experiments as well. But there are better combinations of N,
fractional N, and M to reach the target frequency with less error, and
M is also even in those cases. This could be a later optimisation,
though.

Cheers,
Andre


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
> @@ -1162,12 +1172,14 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
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

