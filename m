Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FFCE1E493;
	Tue,  8 Oct 2024 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390731; cv=none; b=o0wE9ohzB5L12osBD3bsYK+8ANIfkbxV+hdhk3bW/E+RJ04e+bu5qEA3JZpVZzo+MR3b5ck2yHrfQoqsg77cysKt0W+fv16GY83tl65B8Ct+3DwWYFTZAoEclrn4bluzONVUW0jy4tPQ8ftK8Uq+bkL+fz90n1iDFjyxOfHH1mI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390731; c=relaxed/simple;
	bh=boKgprdVHWc+66TWJ3kzgy/Y45mAsLRyTN0mo3JmbiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S7vL05TytOEiGed+fNOIs2dN17u12YhXtBdSsMVwTrO8W7EcLq9ilGA4kWRjiso0b5hBcoJ1O1tFz+4QsFpF3kRld6J1ULaDCCpNayTquJNE2aTvuzblYeVOmBGJC0ubonEk5UzW0I8aia66sATBofYF5Qvibvcr7OSTcweUNpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C0EADA7;
	Tue,  8 Oct 2024 05:32:39 -0700 (PDT)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 73B733F73F;
	Tue,  8 Oct 2024 05:32:07 -0700 (PDT)
Date: Tue, 8 Oct 2024 13:32:04 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Ryan Walklin <ryan@testtoast.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, linux-sound@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Marcus Cooper
 <codekipper@gmail.com>
Subject: Re: [PATCH 2/6] ASoC: sun4i-codec: Add playback only flag to quirks
Message-ID: <20241008133204.3ea38338@donnerap.manchester.arm.com>
In-Reply-To: <20240929100750.860329-3-ryan@testtoast.com>
References: <20240929100750.860329-1-ryan@testtoast.com>
	<20240929100750.860329-3-ryan@testtoast.com>
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

On Sun, 29 Sep 2024 23:06:03 +1300
Ryan Walklin <ryan@testtoast.com> wrote:

> From: Marcus Cooper <codekipper@gmail.com>
> 
> Some devices only have the playback side of the codec implemented
> so add a quirk to check for this.

That's odd, is this really the only place where we need to 
consider the lack of sampling functionality? I mean it just prevents the
fields to be populated in our internal struct, how does the rest of the
kernel know that there is no capture? Is that magically achieved by those
fields being zero now?

Cheers,
Andre

> Signed-off-by: Marcus Cooper <codekipper@gmail.com>
> Signed-off-by: Ryan Walklin <ryan@testtoast.com>
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

