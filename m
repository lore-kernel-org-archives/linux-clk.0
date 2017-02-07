Return-Path: <shawnguo@kernel.org>
Date: Tue, 7 Feb 2017 16:09:49 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Baoyou Xie <baoyou.xie@linaro.org>
Cc: lgirdwood@gmail.com, broonie@kernel.org, robh+dt@kernel.org,
	mark.rutland@arm.com, jun.nie@linaro.org, mturquette@baylibre.com,
	sboyd@codeaurora.org, perex@perex.cz, tiwai@suse.com,
	shawn.guo@linaro.org, vinod.koul@intel.com,
	alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, xie.baoyou@zte.com.cn,
	chen.chaokai@zte.com.cn, wang.qiang01@zte.com.cn
Subject: Re: [PATCH v2 1/3] clk: zte: add i2s clocks for zx296718
Message-ID: <20170207080947.GG3407@dragon>
References: <1486436571-8682-1-git-send-email-baoyou.xie@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1486436571-8682-1-git-send-email-baoyou.xie@linaro.org>
List-ID: <linux-clk.vger.kernel.org>

On Tue, Feb 07, 2017 at 11:02:49AM +0800, Baoyou Xie wrote:
> The i2s related clock support is missing from the existing zx296718
> clock driver. This patch adds it, so that the upstream ZX I2S driver
> can work out.
> 
> Signed-off-by: Baoyou Xie <baoyou.xie@linaro.org>
> ---
>  drivers/clk/zte/clk-zx296718.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/clk/zte/clk-zx296718.c b/drivers/clk/zte/clk-zx296718.c
> index ad5d1df..f106d40 100644
> --- a/drivers/clk/zte/clk-zx296718.c
> +++ b/drivers/clk/zte/clk-zx296718.c
> @@ -941,6 +941,10 @@ static struct zx_clk_gate audio_gate_clk[] = {
>  	GATE(AUDIO_SPDIF1_WCLK, "spdif1_wclk", "spdif1_wclk_div", AUDIO_SPDIF1_CLK, 9, CLK_SET_RATE_PARENT, 0),
>  	GATE(AUDIO_TDM_WCLK, "tdm_wclk", "tdm_wclk_div", AUDIO_TDM_CLK, 17, CLK_SET_RATE_PARENT, 0),
>  	GATE(AUDIO_TS_PCLK, "tempsensor_pclk", "clk49m5", AUDIO_TS_CLK, 1, 0, 0),
> +	GATE(AUDIO_I2S0_PCLK, "i2s0_pclk", "clk49m5", AUDIO_I2S0_CLK, 8, 0, 0),
> +	GATE(AUDIO_I2S1_PCLK, "i2s1_pclk", "clk49m5", AUDIO_I2S1_CLK, 8, 0, 0),
> +	GATE(AUDIO_I2S2_PCLK, "i2s2_pclk", "clk49m5", AUDIO_I2S2_CLK, 8, 0, 0),
> +	GATE(AUDIO_I2S3_PCLK, "i2s3_pclk", "clk49m5", AUDIO_I2S3_CLK, 8, 0, 0),

I would suggest we put these clocks together with AUDIO_I2S_WCLK, so
that we can find I2S clocks in one place.

Shawn

>  };
>  
>  static struct clk_hw_onecell_data audio_hw_onecell_data = {
> -- 
> 2.7.4
> 
