Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E05E29E11D
	for <linux-clk@vger.kernel.org>; Tue,  7 Apr 2026 19:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588608; cv=none; b=TibnHb0/FdLVctkBtTCFSFh39lZv60L9wZ+URU3eyWPNR7+Pv4A8ZqsfdbOwK9EBL9onQ84jPVHRpq7SsqTSaSC9p0teqdfDHzru+lxX2vXwfuDJ51BOK7HqcZ82jkFZ8ZQHwmJV4dBxXIa2IRDTrpWzbdhcBHJ93vE4J3Xi81w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588608; c=relaxed/simple;
	bh=YRc0hKCLzo+Gtlp5jC0q+Z17AseLPx2vv7t74Hk7C+0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kfIZ0D3ABCtsZ6JSfvgARDZy7QpabNcJiD8bJYx19BbG9ws/z9RrFag0CpL2g3xIsLAmaf/s+pbq1ji8d9v0pml7De5xfwfI5ynTO8hsKi2KF+sNGF2BHeUDMUICftI7MCEeMjRR4TKvax6tFdRnLGATlZ2Ialy0WMgba4kbVBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U66FooXG; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=V3krqQZF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U66FooXG";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="V3krqQZF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775588605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=J1xXsg6lKJzkjq+203MwmcXpehNGqzdqe2bad8IS5CQ=;
	b=U66FooXGvcWDy6nHs2VctuBhfm3a8bx8AJnIJZ3FT4g1pl4lm2rYZjJrN5dc+f6VgTx8+p
	9BuLpdEvrmFoAdF4sBTHX9mVyy/uQxKx6kdYODD2HnHCm8rRDnIGLzOW9qqze0YC7gnyMx
	BS69Nlt5TEtwFVGn7CJVq7pCFSLIFII=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-D_jk1V10ON2htnpByIS6ig-1; Tue, 07 Apr 2026 15:03:24 -0400
X-MC-Unique: D_jk1V10ON2htnpByIS6ig-1
X-Mimecast-MFC-AGG-ID: D_jk1V10ON2htnpByIS6ig_1775588604
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ce2a7fef6so188741486d6.1
        for <linux-clk@vger.kernel.org>; Tue, 07 Apr 2026 12:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775588604; x=1776193404; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J1xXsg6lKJzkjq+203MwmcXpehNGqzdqe2bad8IS5CQ=;
        b=V3krqQZFghPu5JPgkSuZRuTJZh6Ei0uT6yaO+SY52spW/txCW8KeZtCFfikPsb8WQM
         GfgJjJj/8s8UElw1/iCIUP6Ge9c+DRK06+5MwICNqf0nMreKbNoQFByES9EHN+EasU6M
         PGs/kb/T+pwa17yQuT5O0UTIRTfEoQ2+XUxVMEJL5OGsP1a4I2hQSxNJUwxgFjWdSq/Q
         QJLqioxbiSrBtCvk4fI/KFZ8UM28kM/mwNYjGtHvxTYK/n+9a0oFMIaP+fHlphdjq0Hi
         qpgNdd+zaIY7kaJijIcLv++LPI8S4u37wmBjdueRhuoeNe7EaMpIU0nsIodBXgCnLEnq
         zlhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588604; x=1776193404;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J1xXsg6lKJzkjq+203MwmcXpehNGqzdqe2bad8IS5CQ=;
        b=OI6NPnpVdPS+392C+ne7n3cdUg/WxfX66NVW8DNMxPG3cZakEt3Iu4rMuyz2d4CKQk
         A89xHH8PV3TvBgyoXItbIuvCK1TcLJezRP+B+7m6L3vJdHc/oSez+XNPRXM8C0JUe8in
         uMX+DnGZN3buKgYPgxxboWgE52FAWjBkzoASZ9Jgp9xuEvFHEHa33C6KA9Ru3AZFZySq
         SjC/Fld2ocpv2Qyb/C1BhoeOxuwbVM9ANbu+x4OVOz32NP1kKyZ6WkycSAEOUuBbbQ/C
         iQtLr+e+chi4BYsmr3ybeJ9o/bLAB9p9lCdcUyX5RtJSAnmMFbmZi4HAy48a1k3ltzpA
         qyPQ==
X-Gm-Message-State: AOJu0YyEl6pX1YHohEpd48gqG7NV1qA1k6gnV/gI5mgz1JtfxQDNFWkY
	oaXFIcUP/whhep1YDzG+yJi/yfFlrDLT7T/ritxteQYbbzjP1h9rNQWcLIYDzygM7N+B74+ne+D
	g5oUb130Cc5nUboIRDnLgPy3bGhkI/1PQt/uo80hiamc28Zv4VIKWQ2av8wYAnA==
X-Gm-Gg: AeBDietM5cw5QII+Si7MCx50j0c4XQYBjOu14C3YoKMf0r+kP5JFULYhM/LczJHK5NR
	oxeijPI/01PNfsBrkzUE3Zp3ahaJWlh2LEA7mUVw9B91QUzsxoI+hl3DFTLo/5V3Y4eCJ8mvdok
	Wc3x88SYerrqdbwMvEfs4N5aJYnqCzLoISrL47i0vX2VkVbT/rgROvN33Rr/QFYVWIWhSHz6lVG
	UJAYu/0aBnyW8ej/KnYjhTe9snbzNjQqp4hKqmdrByUctiGgkB7522OFysgsTrem/A6ToadmzuK
	2rE1fEVII3GYHxlkC/4NuhYHUgzJlypj0dSArcYDVKQkM4en/Yk7T9P+DB57YogBmAJHFZheDF0
	ithkdGrB8vi/9nuDWqywHbmlZX4v+c2XUezdjoNjtTjFdKdCfSJnaPspm
X-Received: by 2002:a05:6214:5c82:b0:89a:63a8:40d2 with SMTP id 6a1803df08f44-8a7041fd559mr250688396d6.35.1775588603725;
        Tue, 07 Apr 2026 12:03:23 -0700 (PDT)
X-Received: by 2002:a05:6214:5c82:b0:89a:63a8:40d2 with SMTP id 6a1803df08f44-8a7041fd559mr250687716d6.35.1775588603234;
        Tue, 07 Apr 2026 12:03:23 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593330593sm171355116d6.3.2026.04.07.12.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 12:03:22 -0700 (PDT)
Date: Tue, 7 Apr 2026 15:03:21 -0400
From: Brian Masney <bmasney@redhat.com>
To: Marek Vasut <marex@nabladev.com>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 5/6] clk: fsl-sai: Extract clock setup into
 fsl_sai_clk_register()
Message-ID: <adVU-VgLI0MCIjz7@redhat.com>
References: <20260406215150.176599-1-marex@nabladev.com>
 <20260406215150.176599-5-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406215150.176599-5-marex@nabladev.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Marek,

On Mon, Apr 06, 2026 at 11:49:45PM +0200, Marek Vasut wrote:
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
> ---
>  drivers/clk/clk-fsl-sai.c | 78 ++++++++++++++++++++++++++-------------
>  1 file changed, 53 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/clk/clk-fsl-sai.c b/drivers/clk/clk-fsl-sai.c
> index 2a68e32c3167b..7ec9a4f22735c 100644
> --- a/drivers/clk/clk-fsl-sai.c
> +++ b/drivers/clk/clk-fsl-sai.c
> @@ -21,8 +21,9 @@
>  #define CR2_DIV_WIDTH	8
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
> @@ -30,15 +31,57 @@ struct fsl_sai_data {
>  	unsigned int	offset;	/* Register offset */
>  };
>  
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
> +	if (IS_ERR(hw))
> +		return PTR_ERR(hw);

s/hw/chw/ on the two lines above.

> +
> +	*hw = chw;
> +
> +	/* Set clock direction */
> +	writel(dir_bit, base + div_reg);

The previous behavior of the code was to call writel() and then register
the clk. This flips it. Just to be sure no regressions are introduced,
should we keep the old behavior?

> +
> +	return 0;
> +}
> +
>  static int fsl_sai_clk_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	const struct fsl_sai_data *data = device_get_match_data(dev);
>  	struct fsl_sai_clk *sai_clk;
> -	struct clk_parent_data pdata = { .index = 0 };
>  	struct clk *clk_bus;
>  	void __iomem *base;
> -	struct clk_hw *hw;
> +	int ret;
>  
>  	sai_clk = devm_kzalloc(dev, sizeof(*sai_clk), GFP_KERNEL);
>  	if (!sai_clk)
> @@ -54,27 +97,12 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
>  
>  	spin_lock_init(&sai_clk->lock);
>  
> -	sai_clk->gate.reg = base + data->offset + I2S_CSR;
> -	sai_clk->gate.bit_idx = CSR_BCE_BIT;
> -	sai_clk->gate.lock = &sai_clk->lock;
> -
> -	sai_clk->div.reg = base + data->offset + I2S_CR2;
> -	sai_clk->div.shift = CR2_DIV_SHIFT;
> -	sai_clk->div.width = CR2_DIV_WIDTH;
> -	sai_clk->div.lock = &sai_clk->lock;
> -
> -	/* set clock direction, we are the BCLK master */
> -	writel(CR2_BCD, base + data->offset + I2S_CR2);
> -
> -	hw = devm_clk_hw_register_composite_pdata(dev, dev->of_node->name,
> -						  &pdata, 1, NULL, NULL,
> -						  &sai_clk->div.hw,
> -						  &clk_divider_ops,
> -						  &sai_clk->gate.hw,
> -						  &clk_gate_ops,
> -						  CLK_SET_RATE_GATE);
> -	if (IS_ERR(hw))
> -		return PTR_ERR(hw);
> +	ret = fsl_sai_clk_register(dev, base, &sai_clk->lock,
> +				   &sai_clk->bclk_div, &sai_clk->bclk_gate,
> +				   &sai_clk->bclk_hw, CSR_BCE_BIT, CR2_BCD,
> +				   data->offset + I2S_CR2, "BCLK");
> +	if (ret)
> +		return ret;
>  
>  	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
                                                                      ^^^
hw is removed above, and it's still here in this patch. It's removed in
the last patch. This will break git bisect.

Brian

