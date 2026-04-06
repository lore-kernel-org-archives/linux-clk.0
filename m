Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BE2538E5E6
	for <linux-clk@vger.kernel.org>; Mon,  6 Apr 2026 17:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775495416; cv=none; b=JEYkkKMu2yJ+oRXb7g+cWUlQoaVzefZ5KgaQE0gw2/1Gwp/3DGJq8JzGtrPORG8HSFH+vhMrJqxbcCAyjqxbhmDiXGLYp6ADKoPfjS7A6PZ15bam7grm/WTsWSKbiUeTttzjyzD5SdpbvCZCwxiOiLIeOxD7DjJcpgEWGJfb+kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775495416; c=relaxed/simple;
	bh=Q0aHysHy7Yujmz8Vb6wEo2J1Xk1/MxbuHltcIQn0WQo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MkPkWwvIWS8I2sWbIjLlEinY6P1EoO4tB9mQMPHnKlCdj9xnxMXZBh0UCD3rGqBMdeiyMl4tGWh5E7+lkMNyFqpY9ePxE0rLNUpRtmyRFWoG/Squ0Q0I/7mIyzF6YlZdjg8HHgLxnBjltyyFWZw0TLpgJ2/BQ56lGE6++lEbXP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q8uVLB3I; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=gzCb03l1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q8uVLB3I";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="gzCb03l1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775495413;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=eSGVwFFbEI9CQm/EYHooDVKaJTkTGsktE9gOyBTNJZs=;
	b=Q8uVLB3IWumQDob6aRrBcyYTQiGvz0wCl4sTIP7fk+sU4pxmmmWgtLjw90xsySpt23Lv7E
	MVa+YaGhDRvLOTs1qltB4r0FDBBMgiU72cuVanHPB/TlU4NdgsBCRVGt9nvtODdolGmE2q
	gpDQVWO4lIOMkf0fvVDQ9LW6GK4s5UI=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-PleXMwUoP66TcrX-PyRklg-1; Mon, 06 Apr 2026 13:10:12 -0400
X-MC-Unique: PleXMwUoP66TcrX-PyRklg-1
X-Mimecast-MFC-AGG-ID: PleXMwUoP66TcrX-PyRklg_1775495412
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b3544bc7bso56123961cf.2
        for <linux-clk@vger.kernel.org>; Mon, 06 Apr 2026 10:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775495412; x=1776100212; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSGVwFFbEI9CQm/EYHooDVKaJTkTGsktE9gOyBTNJZs=;
        b=gzCb03l1F3ltmMjEyjvHmZHkez6Khqd9zaFLJJwtQWEwXuK20ChDcKblVJLmhuLAzS
         QCR4CwtW7AN3nLhILyKGLnC6ElxUqqP+7KQY0QOxpxjC3CXo2BvFE4VTnszolIikX3Xn
         xyaOvWGwBKluHpgl2TAn/4HzNWoxgZn7wFxwSVy6gNFAUEDRco5HtQ61V6n6yfeTjWLH
         8/YT32bHdl88Gi+0pxeigFUv1zqkHWkM7PhPSOd2cWOCZ+f6vQmpQNjBv+DzJjGcrIZ5
         1kITr7ifCXgSl8T1gN3B1xCEtpgVc43k9hmZm3tnH453IL+e07OBYIK+Rp4pfKIIFTOh
         tXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775495412; x=1776100212;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eSGVwFFbEI9CQm/EYHooDVKaJTkTGsktE9gOyBTNJZs=;
        b=d7jA5i/wjU1Bt1r/GJ76p35HeVOWPGblUqT69LHCbAbBP1AEjFiqyb/bnkbjKdQpyU
         ZRUfw97Wh3wFSrNgMgBgfMjzsl/+EV+dQmbl0h+uSF5iUbZCrr1wktTk6kFrgnSHYvaU
         thly01VvpCUYD2NQ/Jg7Pa6dZRIYHTvXpMaEl7vtg9vHreAWSkl4cEyZE74vPufNfNx8
         z1BxvK3IIYLQjb8N6Vms9Md8iKHt2nzZhTg2t4b9YhszriEJIhXPkN79fKh3cNNZaxio
         vf1KJgTL9Kuv7oXS6k2mKXm2EM7jVvOz0ygzB8V9S5JxjyETQy9kskAlGFOEXJhC9txj
         ciQw==
X-Gm-Message-State: AOJu0YxRLMiZkuFPBBMvVLIFUWj3MiWC/aZP90abGYzRHePkfIqQtyqc
	L3/tsDn9Ef9Bu3ROduoCNcajHpvcF4HLyCEEk89G0Zq0f3H6RdkFp8/IgnfwuXEu7NHcPDIJBt0
	AavJ4V74gIM0HPU/Cv1F0ie017CTi4uyHOtg3qsOUZTjBYDu2MH4ovvzPnqcAgg==
X-Gm-Gg: AeBDievfoVDM72MCyKAAXpf4c8EWq1oMc8ZJBu3bAjmDvf1leoTGP91jXArEPjgltna
	rJi6HpYZNnPGYiHorr5u4013nhWJaQt1Z3Y8k6QjubvZEn9UQLqEnV4arAs8sin6G0YEWNuBv1C
	FwF+6SmD7ZD3e05VQ8pdPPLXIMI5wkyXnQOt35Q5xChwrLmHTCN7GMI6fUd8zR8RqA1kqH075Gg
	YnV6cIrHDejTAe/CuQqEPkezomjNK9y0DLyWI4SVyTjdmOxagPwxd2Pik5TyigaSFIXG9ISTkY/
	mi5LZNirARvGW54VPn6TuxEVgTFKDRWq7c5f8nrUFTN7T0FoVBiHKT2YrmYO6NjA5zlc0tBaoDR
	aSMKE1n+DhquTeGXTO0P3H7M73qy79Z5mH39CTikKeaXj7m3LD7eGIxVi
X-Received: by 2002:a05:622a:aa42:10b0:50d:4143:73c8 with SMTP id d75a77b69052e-50d62ad90bamr164402891cf.41.1775495411751;
        Mon, 06 Apr 2026 10:10:11 -0700 (PDT)
X-Received: by 2002:a05:622a:aa42:10b0:50d:4143:73c8 with SMTP id d75a77b69052e-50d62ad90bamr164401741cf.41.1775495410714;
        Mon, 06 Apr 2026 10:10:10 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a5974dda27sm125238756d6.42.2026.04.06.10.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 10:10:09 -0700 (PDT)
Date: Mon, 6 Apr 2026 13:10:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Michael Walle <mwalle@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/4] clk: fsl-sai: Add MCLK generation support
Message-ID: <adPo7qa5LusV8M5V@redhat.com>
References: <20260404183419.46455-1-marex@nabladev.com>
 <20260404183419.46455-4-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260404183419.46455-4-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Marek,

On Sat, Apr 04, 2026 at 08:33:28PM +0200, Marek Vasut wrote:
> The driver currently supports generating BCLK. There are systems which
> require generation of MCLK instead. Register new MCLK clock and handle
> clock-cells = <1> to differentiate between BCLK and MCLK. In case of a
> legacy system with clock-cells = <0>, the driver behaves as before, i.e.
> always returns BCLK.
> 
> Note that it is not possible re-use the current SAI audio driver to
> generate MCLK and correctly enable and disable the MCLK.
> 
> If SAI (audio driver) is used to control the MCLK enablement, then MCLK
> clock is not always enabled, and it is not necessarily enabled when the
> codec may need the clock to be enabled. There is also no way for the
> codec node to specify phandle to clock provider in DT, because the SAI
> (audio driver) is not clock provider.
> 
> If SAI (clock driver) is used to control the MCLK enablement, then MCLK
> clock is enabled when the codec needs the clock enabled, because the
> codec is the clock consumer and the SAI (clock driver) is the clock
> provider, and the codec driver can request the clock to be enabled when
> needed. There is also the usual phandle to clock provider in DT, because
> the SAI (clock driver) is clock provider.
> 
> Acked-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Michael Walle <michael@walle.cc>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
> V2: No change
> V3: - Rebase on current next, update mail address
>     - Update commit message according to clarify the difference between
>       SAI audio and SAI clock driver
>     - Pick ancient AB from Michael, although this may be outdated
>       https://patchwork.kernel.org/project/alsa-devel/patch/20241226162234.40141-4-marex@denx.de/
> ---
>  drivers/clk/clk-fsl-sai.c | 74 ++++++++++++++++++++++++++++++++-------
>  1 file changed, 61 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
> index 336aa8477d0ea..f00b49edb2e9f 100644
> --- a/drivers/clk/clk-fsl-sai.c
> +++ b/drivers/clk/clk-fsl-sai.c
> @@ -7,6 +7,7 @@
>  
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
> +#include <linux/clk.h>
>  #include <linux/clk-provider.h>
>  #include <linux/err.h>
>  #include <linux/of.h>

Since changes are being made here, could the includes be sorted in a
separate patch?

> @@ -15,21 +16,37 @@
>  
>  #define I2S_CSR		0x00
>  #define I2S_CR2		0x08
> +#define I2S_MCR		0x100
>  #define CSR_BCE_BIT	28
> +#define CSR_TE_BIT	31
>  #define CR2_BCD		BIT(24)
>  #define CR2_DIV_SHIFT	0
>  #define CR2_DIV_WIDTH	8
> +#define MCR_MOE		BIT(30)
>  
>  struct fsl_sai_clk {
> -	struct clk_divider div;
> -	struct clk_gate gate;
> +	struct clk_divider bclk_div;
> +	struct clk_divider mclk_div;
> +	struct clk_gate bclk_gate;
> +	struct clk_gate mclk_gate;
> +	struct clk_hw *bclk_hw;
> +	struct clk_hw *mclk_hw;
>  	spinlock_t lock;
>  };
>  
>  struct fsl_sai_data {
>  	unsigned int	offset;	/* Register offset */
> +	bool		have_mclk; /* Have MCLK control */
>  };
>  
> +static struct clk_hw *
> +fsl_sai_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct fsl_sai_clk *sai_clk = data;
> +
> +	return clkspec->args[0] ? sai_clk->mclk_hw : sai_clk->bclk_hw;
> +}
> +
>  static int fsl_sai_clk_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -54,37 +71,68 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&sai_clk->lock);
>  
> -	sai_clk->gate.reg = base + data->offset + I2S_CSR;
> -	sai_clk->gate.bit_idx = CSR_BCE_BIT;
> -	sai_clk->gate.lock = &sai_clk->lock;
> +	sai_clk->bclk_gate.reg = base + data->offset + I2S_CSR;
> +	sai_clk->bclk_gate.bit_idx = CSR_BCE_BIT;
> +	sai_clk->bclk_gate.lock = &sai_clk->lock;
>  
> -	sai_clk->div.reg = base + data->offset + I2S_CR2;
> -	sai_clk->div.shift = CR2_DIV_SHIFT;
> -	sai_clk->div.width = CR2_DIV_WIDTH;
> -	sai_clk->div.lock = &sai_clk->lock;
> +	sai_clk->bclk_div.reg = base + data->offset + I2S_CR2;
> +	sai_clk->bclk_div.shift = CR2_DIV_SHIFT;
> +	sai_clk->bclk_div.width = CR2_DIV_WIDTH;
> +	sai_clk->bclk_div.lock = &sai_clk->lock;
>  
>  	/* set clock direction, we are the BCLK master */
>  	writel(CR2_BCD, base + data->offset + I2S_CR2);
>  
> -	hw = devm_clk_hw_register_composite_pdata(dev, dev->of_node->name,
> +	hw = devm_clk_hw_register_composite_pdata(dev, "BCLK",

Will there ever be multiple instances of this IP block on a system? If
so, the hardcoded BCLK and MCLK clk names will collide.

>  						  &pdata, 1, NULL, NULL,
> -						  &sai_clk->div.hw,
> +						  &sai_clk->bclk_div.hw,
>  						  &clk_divider_ops,
> -						  &sai_clk->gate.hw,
> +						  &sai_clk->bclk_gate.hw,
>  						  &clk_gate_ops,
>  						  CLK_SET_RATE_GATE);
>  	if (IS_ERR(hw))
>  		return PTR_ERR(hw);
>  
> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
> +	sai_clk->bclk_hw = hw;
> +
> +	if (data->have_mclk) {
> +		sai_clk->mclk_gate.reg = base + data->offset + I2S_CSR;
> +		sai_clk->mclk_gate.bit_idx = CSR_TE_BIT;
> +		sai_clk->mclk_gate.lock = &sai_clk->lock;
> +
> +		sai_clk->mclk_div.reg = base + I2S_MCR;
> +		sai_clk->mclk_div.shift = CR2_DIV_SHIFT;
> +		sai_clk->mclk_div.width = CR2_DIV_WIDTH;
> +		sai_clk->mclk_div.lock = &sai_clk->lock;
> +
> +		pdata.index = 1; /* MCLK1 */
> +		hw = devm_clk_hw_register_composite_pdata(dev, "MCLK",
> +							  &pdata, 1, NULL, NULL,
> +							  &sai_clk->mclk_div.hw,
> +							  &clk_divider_ops,
> +							  &sai_clk->mclk_gate.hw,
> +							  &clk_gate_ops,
> +							  CLK_SET_RATE_GATE);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		sai_clk->mclk_hw = hw;

This section is basically a copy/paste of the bclk from above, with a
few minor changes (bclk renamed to mclk, different gate and div regs,
and a different base offset). What do you think about mostly keeping
struct fsl_sai_clk with the same names, and add a new helper to do
the registrations?

Brian


> +
> +		/* set clock direction, we are the MCLK output */
> +		writel(MCR_MOE, base + I2S_MCR);
> +	}
> +
> +	return devm_of_clk_add_hw_provider(dev, fsl_sai_of_clk_get, sai_clk);
>  }
>  
>  static const struct fsl_sai_data fsl_sai_vf610_data = {
>  	.offset	= 0,
> +	.have_mclk = false,
>  };
>  
>  static const struct fsl_sai_data fsl_sai_imx8mq_data = {
>  	.offset	= 8,
> +	.have_mclk = true,
>  };
>  
>  static const struct of_device_id of_fsl_sai_clk_ids[] = {
> -- 
> 2.53.0
> 

