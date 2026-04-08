Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9522AEED8
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 21:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775685533; cv=none; b=DPSXjvSFCkOejT1c2aYC6GsXGxxaFHhdmFgNsm9MIPrsIF1tAtw+7FMO+jxVoRpcfBd+gR1xrxjJkJbsEmCEWwr62e8P3Z1lyqYNiq86Ial7TgY2TZVbKhBJi0ZCb3VWAq3A/6WBHiiy/IGpvpy85BBKVdKpH86bfRlxAVL+mOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775685533; c=relaxed/simple;
	bh=tjE9SYROPRJSd2mp6Br8BoEwlJBxJDWqw7W6mx+PZCE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GaPzi/n8XG3KWqGfs1kh3yQgtNWTS1qOB6OtbuXT+nx34Vuhm/GilVT3d5/4Q07QH2YlPKMgOHrBwvwvEfIw/sFrUuPo3t7Arq84PNWK0T8hFDu1dGqWxXa6QLCmPr6oX2cd54UHOy84P8zzDaOn8Z7q99fvIPrlkCXrLMeM2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fm6A8v7P; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=OXTxlhze; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fm6A8v7P";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="OXTxlhze"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775685530;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LOm+wk33ypCInDRQOH/vSQahWXyPcA6BwjaghqFQOQw=;
	b=Fm6A8v7Pe3V3zbWjTsmbLjMJgCxi00mhPiGaSgeyCILovOnoJtv54HA0mfRkNSM6JW8/us
	CRMmOyA8pJVgH6y2213uRM0dTIUvBIJSY1sVLGI9FJDpi6Yl77i1Vt+cAtTFy36a97EVd4
	SMrvnl743XHww9CuOPZzdRH8TQWFITk=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-155-nvd_Y2yoP-e64kD_-mxjBw-1; Wed, 08 Apr 2026 17:58:49 -0400
X-MC-Unique: nvd_Y2yoP-e64kD_-mxjBw-1
X-Mimecast-MFC-AGG-ID: nvd_Y2yoP-e64kD_-mxjBw_1775685528
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50da529ff48so11608261cf.3
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 14:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775685528; x=1776290328; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LOm+wk33ypCInDRQOH/vSQahWXyPcA6BwjaghqFQOQw=;
        b=OXTxlhzetlt95MyggV4mJW6NY+9gw93BM3nrzGVIiAx3pXBdCpmECejojg6H2+peIQ
         /4DR9t1skbSlJv5VeC57VZfwuLbd2kb31nzr2sv3Lz+S2x2UqX+zLy/Euun0qVY5GZds
         mXvDl8xO4SZqi1GKQKQmDQGjX5j45pfnr0QapTCU6aHREJCJQSLQMfw/DRdQwPIRWW2K
         Qw/iPLh3wL7aJ7eWlCnx/SUxVo6bazbYjC4ewHpTk0ytANhP/DH2NFMaz3OhqVpksE05
         LMI3kYPK5RgJ4YANAGqY8UsYRMOdzRl5kAUQwm72F4GspX1V+HuNOYQ9dgcc2vLYdoWj
         9/og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775685528; x=1776290328;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LOm+wk33ypCInDRQOH/vSQahWXyPcA6BwjaghqFQOQw=;
        b=Z+DHoRGTqiiT8VGzQ13RcKHID+G65XMIpeQD/VE4f4/Bs5FWyysY9xh6ta8djiBuZI
         MvuH0nfvNmwPK8PfrdkH5k4JU5DMLvoS8irrVCzcWlx/Bn9o6P8eiB2yivRGQBJjlj2x
         4W0KEXWzNIAPWCxG6XxoewefHnwGKCUHse6oOjykfC//2nE4/TAWB1hvczJdspSQZuoB
         AvJlrwqr3MAYfoIUV9TYzCrDseK1kC7ZAyTOdNDSU+ryaakSQPbBK3+BS22xoe1vbVFP
         yOsdfVy78t76W+UyDRVKk+UsT9fEdrYLImOSUtABs9EhNfEICbyKf+bu8GlxIbSL73Yp
         HcJw==
X-Gm-Message-State: AOJu0YwEyIHOtcoW41DYoVhvZOuaR0/D0fHPykQr5hjyp+5y2ujhM7ap
	UbioEWeP5MsiTkswxqR9pfPZKwpSXGLCyCFLBbxZFkW3tWk7R4jthqLpPSiSONCKKRDHzkikRkZ
	Et/2PiintCFg5sFO/njU79zTyURiu4Y5VVgxMZN2mG5X1aIgftb1a/UujUa5Nzw==
X-Gm-Gg: AeBDievYBkkilpiomI7TGBiYhRhFqjqeTwmpub28Jpa3l5C4fxW+6YxjfUCQ3CqaMmw
	YTsGid77hgnv7DTZb/UfZd1j5vrDjCepmxCdywQ//8vCQL+8T8kh/z9bJyhVrYIbZ+Wk6gSdJCr
	D7wPHMC0J9lrsT+UtuDFgR5Mxfl6L8mcnUNdWJL3IBIqIOUvWYytZigR0b+gPcYzhw6gL8eNqsY
	fq4P2Ob1Zc0tm9xgvoZ/pguqn6ioEDBQ3/0/YiydEmGzeYkq87AxCvRTperOHWrR7jEkhX4nj0d
	aB83HdmSlstdT6Pmi4fYM79uwsDWlgDZsZaz1KMS026NV5e9lFsgITr8s8HGVePKv2tRPSKbFi6
	j8oJVs7TPB021TtTJOHCtCNMu7ylqns9dq2pAefQP1hGpmtTFrRo8NfKq
X-Received: by 2002:a05:622a:514b:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50dabc3f68bmr101178241cf.29.1775685528595;
        Wed, 08 Apr 2026 14:58:48 -0700 (PDT)
X-Received: by 2002:a05:622a:514b:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-50dabc3f68bmr101177901cf.29.1775685528034;
        Wed, 08 Apr 2026 14:58:48 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50d4b8d0904sm170469051cf.29.2026.04.08.14.58.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 14:58:47 -0700 (PDT)
Date: Wed, 8 Apr 2026 17:58:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] clk: fsl-sai: Extract clock setup into
 fsl_sai_clk_register()
Message-ID: <adbPlFzI7jrU9pCq@redhat.com>
References: <20260407211123.77602-1-marex@nabladev.com>
 <20260407211123.77602-5-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260407211123.77602-5-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Marek,

On Tue, Apr 07, 2026 at 11:10:02PM +0200, Marek Vasut wrote:
> Create helper function fsl_sai_clk_register() to set up and register
> SAI clock. Rename BCLK specific struct fsl_sai_clk members with bclk_
> prefix. Use of_node_full_name(dev->of_node) and clock name to register
> uniquely named clock. This is done in preparation for the follow up
> patch, which adds MCLK support.
> 
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---
> Cc: Brian Masney <bmasney@redhat.com>
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
> V4: New patch
> V5: - Include fsl_sai_of_clk_get() which returns only BCLK in here already
>     - s/hw/chw/ in fsl_sai_clk_register
> ---
>  drivers/clk/clk-fsl-sai.c | 90 +++++++++++++++++++++++++++------------
>  1 file changed, 63 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
> index 27925893c4c27..01c5e26f55517 100644
> --- a/drivers/clk/clk-fsl-sai.c
> +++ b/drivers/clk/clk-fsl-sai.c
> @@ -26,20 +26,71 @@ struct fsl_sai_data {
>  };
>  
>  struct fsl_sai_clk {
> -	struct clk_divider div;
> -	struct clk_gate gate;
> +	struct clk_divider bclk_div;
> +	struct clk_gate bclk_gate;
> +	struct clk_hw *bclk_hw;
>  	spinlock_t lock;
>  };
>  
> +static struct clk_hw *
> +fsl_sai_of_clk_get(struct of_phandle_args *clkspec, void *data)
> +{
> +	struct fsl_sai_clk *sai_clk = data;
> +
> +	return sai_clk->bclk_hw;
> +}
> +
> +static int fsl_sai_clk_register(struct device *dev, void __iomem *base,
> +				spinlock_t *lock, struct clk_divider *div,
> +				struct clk_gate *gate, struct clk_hw **hw,
> +				const int gate_bit, const int dir_bit,
> +				const int div_reg, char *name)
> +{
> +	const struct fsl_sai_data *data = device_get_match_data(dev);
> +	struct clk_parent_data pdata = { .index = 0 };
> +	struct clk_hw *chw;
> +	char *cname;
> +
> +	gate->reg = base + data->offset + I2S_CSR;
> +	gate->bit_idx = gate_bit;
> +	gate->lock = lock;
> +
> +	div->reg = base + div_reg;
> +	div->shift = CR2_DIV_SHIFT;
> +	div->width = CR2_DIV_WIDTH;
> +	div->lock = lock;
> +
> +	cname = devm_kasprintf(dev, GFP_KERNEL, "%s.%s",
> +			       of_node_full_name(dev->of_node), name);

Sashiko has the following feedback:
https://sashiko.dev/#/patchset/20260407211123.77602-1-marex%40nabladev.com

    Does using of_node_full_name() break debugfs directory creation? 
    
    The full node name usually contains slashes (e.g., soc/bus@1000/sai@2000),
    which causes lookup_one_len() to reject the name with -EACCES when the CCF
    tries to create the directories.
    
    Also, if the device is instantiated without Device Tree, this evaluates to
    "<no-node>", potentially causing collisions if multiple instances exist.
    Would dev_name(dev) be more appropriate here?

> +	if (!cname)
> +		return -ENOMEM;
> +
> +	chw = devm_clk_hw_register_composite_pdata(dev, cname,
> +						   &pdata, 1, NULL, NULL,
> +						   &div->hw,
> +						   &clk_divider_ops,
> +						   &gate->hw,
> +						   &clk_gate_ops,
> +						   CLK_SET_RATE_GATE);
> +	if (IS_ERR(chw))
> +		return PTR_ERR(chw);
> +
> +	*hw = chw;
> +
> +	/* Set clock direction */
> +	writel(dir_bit, base + div_reg);

Sashiko also has the following feedback:

    Is it safe to initialize the hardware register after registering the clock
    with the CCF?
    
    During devm_clk_hw_register_composite_pdata(), the Common Clock Framework
    inspects the hardware to calculate and cache the initial clock rate based on
    the existing divider value.
    
    The subsequent writel() completely overwrites the 32-bit register, setting
    the direction bit and zeroing out the divider bits. Because this occurs
    after registration, the CCF is completely unaware of the change, leaving its
    cached rate stale and mismatched with the hardware.
    
    Additionally, since the clock is already exposed to the system, could this
    lockless writel() race with concurrent clock operations like clk_set_rate()
    and clobber new divider configurations?
    
    The original code safely performed this initialization before registration.

Brian

