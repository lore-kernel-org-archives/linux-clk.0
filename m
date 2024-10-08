Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4586C1DE8BE;
	Tue,  8 Oct 2024 12:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390155; cv=none; b=cT0dTBpb+YP6FMbnSpjE4mZn4EDH9XxtoavolrJcaCrLG/dg/JoBW1buXzkxqGsOWRVEkOf1bIXtc4xPMASvrijroVgYfDmqsUuKkxj810c9pA2oQFNqAgEM7KvVFtSgGdGIO1zyIJHDBvHtCP/oMJ8sVIwvC70x2wdJFFU38xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390155; c=relaxed/simple;
	bh=IdSK4QKU/vFUWkenb4duA57O6N9eYQEIiXViL0X4QS8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Z9fLPlKcvwf1QyYiGFsWjPobKCQCRCVj4cMQ4HakaM96f4WiFOSJbRF5yxdKN1hJimx1o8DCfiIhiuPffF+X9hBHmYIWwSgyoc49vJsvPM44Jv5sqjabinml0fCnsNKrKlR6x9+JtpY/rqBxegIvK2hJDR48DRapalOQTpJ4PdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1737DDA7;
	Tue,  8 Oct 2024 05:23:02 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5B8E83F73F;
	Tue,  8 Oct 2024 05:22:30 -0700 (PDT)
Date: Tue, 8 Oct 2024 13:22:21 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Marcus Cooper
 <codekipper@gmail.com>
Subject: Re: [PATCH 1/6] ASoC: sun4i-codec: Add support for different DAC
 FIFOC addresses to quirks
Message-ID: <20241008132221.4c365a9f@donnerap.manchester.arm.com>
In-Reply-To: <20240929100750.860329-2-ryan@testtoast.com>
References: <20240929100750.860329-1-ryan@testtoast.com>
	<20240929100750.860329-2-ryan@testtoast.com>
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

On Sun, 29 Sep 2024 23:06:02 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

Hi,

> From: Marcus Cooper <codekipper@gmail.com>
> 
> The Allwinner H616 SoC uses a different register address to control the
> output FIFO.
> 
> Allow this to be specified separately from the ADC FIFO control
> register.

That looks good to me, it follows the existing regmap_field pattern for the
input FIFO, and I can confirm it changes every user of the DAC register.

> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  sound/soc/sunxi/sun4i-codec.c | 83 +++++++++++++++++++++--------------
>  1 file changed, 51 insertions(+), 32 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 330bc0c09f56b..37f5678b55291 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -238,6 +238,8 @@ struct sun4i_codec {
>  
>  	/* ADC_FIFOC register is at different offset on different SoCs */
>  	struct regmap_field *reg_adc_fifoc;
> +	/* DAC_FIFOC register is at different offset on different SoCs */
> +	struct regmap_field *reg_dac_fifoc;
>  
>  	struct snd_dmaengine_dai_dma_data	capture_dma_data;
>  	struct snd_dmaengine_dai_dma_data	playback_dma_data;
> @@ -246,19 +248,19 @@ struct sun4i_codec {
>  static void sun4i_codec_start_playback(struct sun4i_codec *scodec)
>  {
>  	/* Flush TX FIFO */
> -	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
> +	regmap_field_set_bits(scodec->reg_dac_fifoc,
> +			      BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
>  
>  	/* Enable DAC DRQ */
> -	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
> +	regmap_field_set_bits(scodec->reg_dac_fifoc,
> +			      BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
>  }
>  
>  static void sun4i_codec_stop_playback(struct sun4i_codec *scodec)
>  {
>  	/* Disable DAC DRQ */
> -	regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			  BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
> +	regmap_field_clear_bits(scodec->reg_dac_fifoc,
> +				BIT(SUN4I_CODEC_DAC_FIFOC_DAC_DRQ_EN));
>  }
>  
>  static void sun4i_codec_start_capture(struct sun4i_codec *scodec)
> @@ -356,13 +358,13 @@ static int sun4i_codec_prepare_playback(struct snd_pcm_substream *substream,
>  	u32 val;
>  
>  	/* Flush the TX FIFO */
> -	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			   BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
> +	regmap_field_set_bits(scodec->reg_dac_fifoc,
> +			      BIT(SUN4I_CODEC_DAC_FIFOC_FIFO_FLUSH));
>  
>  	/* Set TX FIFO Empty Trigger Level */
> -	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			   0x3f << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL,
> -			   0xf << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL);
> +	regmap_field_update_bits(scodec->reg_dac_fifoc,
> +				 0x3f << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL,
> +				 0xf << SUN4I_CODEC_DAC_FIFOC_TX_TRIG_LEVEL);
>  
>  	if (substream->runtime->rate > 32000)
>  		/* Use 64 bits FIR filter */
> @@ -371,13 +373,13 @@ static int sun4i_codec_prepare_playback(struct snd_pcm_substream *substream,
>  		/* Use 32 bits FIR filter */
>  		val = BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION);
>  
> -	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			   BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION),
> -			   val);
> +	regmap_field_update_bits(scodec->reg_dac_fifoc,
> +				 BIT(SUN4I_CODEC_DAC_FIFOC_FIR_VERSION),
> +				 val);
>  
>  	/* Send zeros when we have an underrun */
> -	regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			   BIT(SUN4I_CODEC_DAC_FIFOC_SEND_LASAT));
> +	regmap_field_clear_bits(scodec->reg_dac_fifoc,
> +				BIT(SUN4I_CODEC_DAC_FIFOC_SEND_LASAT));
>  
>  	return 0;
>  };
> @@ -510,9 +512,9 @@ static int sun4i_codec_hw_params_playback(struct sun4i_codec *scodec,
>  	u32 val;
>  
>  	/* Set DAC sample rate */
> -	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			   7 << SUN4I_CODEC_DAC_FIFOC_DAC_FS,
> -			   hwrate << SUN4I_CODEC_DAC_FIFOC_DAC_FS);
> +	regmap_field_update_bits(scodec->reg_dac_fifoc,
> +				 7 << SUN4I_CODEC_DAC_FIFOC_DAC_FS,
> +				 hwrate << SUN4I_CODEC_DAC_FIFOC_DAC_FS);
>  
>  	/* Set the number of channels we want to use */
>  	if (params_channels(params) == 1)
> @@ -520,27 +522,27 @@ static int sun4i_codec_hw_params_playback(struct sun4i_codec *scodec,
>  	else
>  		val = 0;
>  
> -	regmap_update_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			   BIT(SUN4I_CODEC_DAC_FIFOC_MONO_EN),
> -			   val);
> +	regmap_field_update_bits(scodec->reg_dac_fifoc,
> +				 BIT(SUN4I_CODEC_DAC_FIFOC_MONO_EN),
> +				 val);
>  
>  	/* Set the number of sample bits to either 16 or 24 bits */
>  	if (hw_param_interval(params, SNDRV_PCM_HW_PARAM_SAMPLE_BITS)->min == 32) {
> -		regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
> +		regmap_field_set_bits(scodec->reg_dac_fifoc,
> +				      BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
>  
>  		/* Set TX FIFO mode to padding the LSBs with 0 */
> -		regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
> +		regmap_field_clear_bits(scodec->reg_dac_fifoc,
> +					BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
>  
>  		scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>  	} else {
> -		regmap_clear_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
> +		regmap_field_clear_bits(scodec->reg_dac_fifoc,
> +					BIT(SUN4I_CODEC_DAC_FIFOC_TX_SAMPLE_BITS));
>  
>  		/* Set TX FIFO mode to repeat the MSB */
> -		regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -				   BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
> +		regmap_field_set_bits(scodec->reg_dac_fifoc,
> +				      BIT(SUN4I_CODEC_DAC_FIFOC_TX_FIFO_MODE));
>  
>  		scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
>  	}
> @@ -587,8 +589,8 @@ static int sun4i_codec_startup(struct snd_pcm_substream *substream,
>  	 * Stop issuing DRQ when we have room for less than 16 samples
>  	 * in our TX FIFO
>  	 */
> -	regmap_set_bits(scodec->regmap, SUN4I_CODEC_DAC_FIFOC,
> -			   3 << SUN4I_CODEC_DAC_FIFOC_DRQ_CLR_CNT);
> +	regmap_field_set_bits(scodec->reg_dac_fifoc,
> +			      3 << SUN4I_CODEC_DAC_FIFOC_DRQ_CLR_CNT);
>  
>  	return clk_prepare_enable(scodec->clk_module);
>  }
> @@ -1565,6 +1567,7 @@ struct sun4i_codec_quirks {
>  	const struct snd_soc_component_driver *codec;
>  	struct snd_soc_card * (*create_card)(struct device *dev);
>  	struct reg_field reg_adc_fifoc;	/* used for regmap_field */
> +	struct reg_field reg_dac_fifoc;	/* used for regmap_field */
>  	unsigned int reg_dac_txdata;	/* TX FIFO offset for DMA config */
>  	unsigned int reg_adc_rxdata;	/* RX FIFO offset for DMA config */
>  	bool has_reset;
> @@ -1575,6 +1578,7 @@ static const struct sun4i_codec_quirks sun4i_codec_quirks = {
>  	.codec		= &sun4i_codec_codec,
>  	.create_card	= sun4i_codec_create_card,
>  	.reg_adc_fifoc	= REG_FIELD(SUN4I_CODEC_ADC_FIFOC, 0, 31),
> +	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
>  	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
>  	.reg_adc_rxdata	= SUN4I_CODEC_ADC_RXDATA,
>  };
> @@ -1584,6 +1588,7 @@ static const struct sun4i_codec_quirks sun6i_a31_codec_quirks = {
>  	.codec		= &sun6i_codec_codec,
>  	.create_card	= sun6i_codec_create_card,
>  	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
> +	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
>  	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
>  	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
>  	.has_reset	= true,
> @@ -1594,6 +1599,7 @@ static const struct sun4i_codec_quirks sun7i_codec_quirks = {
>  	.codec		= &sun7i_codec_codec,
>  	.create_card	= sun4i_codec_create_card,
>  	.reg_adc_fifoc	= REG_FIELD(SUN4I_CODEC_ADC_FIFOC, 0, 31),
> +	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
>  	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
>  	.reg_adc_rxdata	= SUN4I_CODEC_ADC_RXDATA,
>  };
> @@ -1603,6 +1609,7 @@ static const struct sun4i_codec_quirks sun8i_a23_codec_quirks = {
>  	.codec		= &sun8i_a23_codec_codec,
>  	.create_card	= sun8i_a23_codec_create_card,
>  	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
> +	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
>  	.reg_dac_txdata	= SUN4I_CODEC_DAC_TXDATA,
>  	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
>  	.has_reset	= true,
> @@ -1618,6 +1625,7 @@ static const struct sun4i_codec_quirks sun8i_h3_codec_quirks = {
>  	.codec		= &sun8i_a23_codec_codec,
>  	.create_card	= sun8i_h3_codec_create_card,
>  	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
> +	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
>  	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
>  	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
>  	.has_reset	= true,
> @@ -1632,6 +1640,7 @@ static const struct sun4i_codec_quirks sun8i_v3s_codec_quirks = {
>  	.codec		= &sun8i_a23_codec_codec,
>  	.create_card	= sun8i_v3s_codec_create_card,
>  	.reg_adc_fifoc	= REG_FIELD(SUN6I_CODEC_ADC_FIFOC, 0, 31),
> +	.reg_dac_fifoc	= REG_FIELD(SUN4I_CODEC_DAC_FIFOC, 0, 31),
>  	.reg_dac_txdata	= SUN8I_H3_CODEC_DAC_TXDATA,
>  	.reg_adc_rxdata	= SUN6I_CODEC_ADC_RXDATA,
>  	.has_reset	= true,
> @@ -1739,6 +1748,16 @@ static int sun4i_codec_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> +	scodec->reg_dac_fifoc = devm_regmap_field_alloc(&pdev->dev,
> +							scodec->regmap,
> +							quirks->reg_dac_fifoc);
> +	if (IS_ERR(scodec->reg_dac_fifoc)) {
> +		ret = PTR_ERR(scodec->reg_dac_fifoc);
> +		dev_err(&pdev->dev, "Failed to create regmap fields: %d\n",
> +			ret);
> +		return ret;
> +	}
> +
>  	/* Enable the bus clock */
>  	if (clk_prepare_enable(scodec->clk_apb)) {
>  		dev_err(&pdev->dev, "Failed to enable the APB clock\n");

