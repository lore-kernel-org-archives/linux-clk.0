Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB667173;
	Sun, 20 Oct 2024 10:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729420738; cv=none; b=XtekKp9CFu1HUZ0tnnwbSVwpCSaUJmDv8BAvhlvB06+VFzBpoS9y/p4E70DN3ReKoRqxRd6DS2jpE6c76jOX7EuDMQWq1jVlLCTL6ScKqBYKkdj3fR5Zs1fXeYar5TQpT2exYwDwhP7GlsbKCrjDOTyH845Vwtg7GEaYxlhoJbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729420738; c=relaxed/simple;
	bh=BTFmTxk/Z/r582Nm66RiFpEoYPnDvjH/o+fYnvjrZM0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R6ChfTnoE7HoedMRZrHJBXHaguJg6YcYYwi3UOjhRhPe3Aa6JyRPoXFLidULEklSGjs4cqzkKgmeBriod1ZoQ/sQUBpW4+rmJjQIFhDakm/a3+PFdhaENaEGhU3EeBekPundM7HFpmforxYoaxVMRwVkXViU3xN+iHknyuYZpTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CF429DA7;
	Sun, 20 Oct 2024 03:39:25 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 17C033F58B;
	Sun, 20 Oct 2024 03:38:53 -0700 (PDT)
Date: Sun, 20 Oct 2024 11:37:59 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Chris Morgan <macroalpha82@gmail.com>,
 Philippe Simons <simons.philippe@gmail.com>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Marcus Cooper
 <codekipper@gmail.com>
Subject: Re: [PATCH v2 4/7] ASoC: sun4i-codec: Add playback only flag to
 quirks
Message-ID: <20241020113759.1eeb76b2@minigeek.lan>
In-Reply-To: <20241020083124.174724-5-ryan@testtoast.com>
References: <20241020083124.174724-1-ryan@testtoast.com>
	<20241020083124.174724-5-ryan@testtoast.com>
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

On Sun, 20 Oct 2024 21:30:54 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

> From: Marcus Cooper <codekipper@gmail.com>
> 
> Some devices only have the playback side of the codec implemented
> so add a quirk to check for this.

If you respin, you could mention here that the capture is also
explicitly disabled in the dai_link member in the create_card() routine
later, to keep that comment from your email alive in the commit log.

But anyway:
 
> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>  sound/soc/sunxi/sun4i-codec.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
> index 37f5678b55291..312d2655c3f4e 100644
> --- a/sound/soc/sunxi/sun4i-codec.c
> +++ b/sound/soc/sunxi/sun4i-codec.c
> @@ -1571,6 +1571,7 @@ struct sun4i_codec_quirks {
>  	unsigned int reg_dac_txdata;	/* TX FIFO offset for DMA config */
>  	unsigned int reg_adc_rxdata;	/* RX FIFO offset for DMA config */
>  	bool has_reset;
> +	bool playback_only;
>  };
>  
>  static const struct sun4i_codec_quirks sun4i_codec_quirks = {
> @@ -1779,10 +1780,13 @@ static int sun4i_codec_probe(struct platform_device *pdev)
>  	scodec->playback_dma_data.maxburst = 8;
>  	scodec->playback_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
>  
> -	/* DMA configuration for RX FIFO */
> -	scodec->capture_dma_data.addr = res->start + quirks->reg_adc_rxdata;
> -	scodec->capture_dma_data.maxburst = 8;
> -	scodec->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +	if (!quirks->playback_only) {
> +		/* DMA configuration for RX FIFO */
> +		scodec->capture_dma_data.addr = res->start +
> +						quirks->reg_adc_rxdata;
> +		scodec->capture_dma_data.maxburst = 8;
> +		scodec->capture_dma_data.addr_width = DMA_SLAVE_BUSWIDTH_2_BYTES;
> +	}
>  
>  	ret = devm_snd_soc_register_component(&pdev->dev, quirks->codec,
>  				     &sun4i_codec_dai, 1);

