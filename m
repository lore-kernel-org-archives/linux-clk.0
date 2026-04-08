Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9315037268B
	for <linux-clk@vger.kernel.org>; Wed,  8 Apr 2026 22:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775686350; cv=none; b=r2WN3+b9dUvZspwY3pd2eyKumzMsgYHLP4a/LIBA4gsqVErbwv7yO4ZOlVzrjmqnQvmdE2odSfYUfKdl9vRhwORZSQ2uDR7yDlPH81aWAskiE0FISn5IuA3HJ2NrbcTcT30qXS6+lplGYvODamsJ27IJx/mUxXLwxFrMfn2yiLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775686350; c=relaxed/simple;
	bh=aYvZiUL14h1TcpUOmtaLqfZqQc3dSmjKk3UM+S590C4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aDCh4jitQVJbN8EMWIvypjNm2kaJPWY0MJv9/St9LKvvtJDtP4MhQbyHjiL4juSADFt2g67eXx5FCMU7boZUCc9TOJfDL2AI+3MNUQ5Y3lgN8SoWXw0MTB9f4E47J8uqD3+b6uI5+gYNIsGx55VEqFW65lVlNxexEd4apvSkHOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=T0e/KGQW; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bDuUElIN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="T0e/KGQW";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bDuUElIN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775686347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fym2LzOOWtP3DEfhBZ50aXf6HMqAJm+7igjBImlFTbY=;
	b=T0e/KGQWgaHlVyWTLfn5zlZhKNzTQF7z0Pha2DfLGeOP0VwdaL56h5pxufk26Eudw9qGO/
	zm2VVN7NqvWrNBauO3MogzOSGMLIZWGyc6tqRyQO3UfzVa98GE3/duJoQg7QHvwbHIyHQ1
	e9DEWnLudrcIBflrbEBxFkpJK2UVE2Y=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-361-D1byT68cNsWfbWdoNgvSbw-1; Wed, 08 Apr 2026 18:12:26 -0400
X-MC-Unique: D1byT68cNsWfbWdoNgvSbw-1
X-Mimecast-MFC-AGG-ID: D1byT68cNsWfbWdoNgvSbw_1775686346
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-89fd9daa423so8652136d6.1
        for <linux-clk@vger.kernel.org>; Wed, 08 Apr 2026 15:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775686346; x=1776291146; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Fym2LzOOWtP3DEfhBZ50aXf6HMqAJm+7igjBImlFTbY=;
        b=bDuUElINiZxXQxTT2GuxJOXQBPc6kRBq3+1ogURKPvHR7WCh/DZPqSIIqr04qf/7dl
         kGBYsA+NwX5qAcjvuj5Eg9YNlQIcWZK6BuMXITtr2KbSGFElf+VRaUf3XBjC9VKyBYzA
         DZuTelt3lObSWSYbOLfHvzo0C/kKH7xEAeAA+XfevOk2apmNiwpohcEgbIQt1qMZ5SUF
         v/eumcKXadMqOv6jXDSrp1h2355hUYzT/iqsmBjg2MbbXNNdTY8Y/m9efeNRgir4OgXv
         5IG/0d1ejmqiZsU+zKd9PXIYYRE+BdiVJHBaKHJERuV4sc21n76KWwuyuNuax+T4yFQ9
         oW0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775686346; x=1776291146;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Fym2LzOOWtP3DEfhBZ50aXf6HMqAJm+7igjBImlFTbY=;
        b=AooSerYXtdCOlprFSESkTvkpXdyqK75lUh8ilPnEg+cy0dJdYdESwtTj0JMW3S2e4q
         Qw5oXUYgbVHhpvHSI9LnSaF1T59GJ8HhQePRNslLWbsOkWG6SWZLvhfiL30qkPybq8X+
         b+aoGZgSJCyq1IsUi+Jvf8qkzZzbVef5iRnWeID4XDJsbhvSgdObd1padcN/uHzcTVCD
         i6st9wjWDtzXoq4ql3l1v433uThuGdEILxp22EktSssXsgj95K6PYuNIRcmbFQ9LGeMJ
         An9EM7ySJF/MPqbq+8JDQzjtloQzyckpLsud4VHmn52lyJTcRucnIPa2ZVQAA3Nj6Vbv
         f47Q==
X-Gm-Message-State: AOJu0YzeQwvSQm3ILqgYET3PySeRvvx+7JB8XIvP2JPcnEhf9jH9fjgO
	bmY4E3G0qwd+gOHHOF7q3+iCSCIvTdmSHtDsLOrVllHmXzVsVFxYZRtkyViyw262Kt86Nxkf1zG
	y2Gy9yV5bAxpvLQC1YYitLMHDSWyRHUD960DayeKMU1zKyJNnZkVkgxRZRgqa1NJNzXi2Wg==
X-Gm-Gg: AeBDietR1Nk+JcHRRu6LiGjEaevyQWkPTV0KL+ohltQIfX3Tg6FRhZDh4QtcqjXYw4z
	a+M9KZXyQtnUd82+QB9+BJKk7pqJSTr4MqgNE7XXhIUlmQDjw4I8mfY+I+YlRJSNw8SmiH89CZU
	nEgk5ltkSbCIg0o18NiahavEGvu9nI83Ga87rsDsoufZv/w+BdM5aqYUuRSqa/2ini3qeg+0Vz6
	ZqX9mdQxBAY6JJ8aaLOT2RpkBcrx3J54qPRAJu9PTsFa6gQchXlS9mxkjDwCr+QXeZLaJDRBpGd
	6EI/ZHnAGzK2VsFCe0ucY5NPqT107+m26/k72cTbzlBm82Are4vKzs1pVIvT2XEpUo54JgN1Y9/
	BVd1sXW+7ZyEqh1nUdOxsu0NEoBvYd+eiJzPR5EPlLRFJbRV89N92aU1/
X-Received: by 2002:a05:620a:28ce:b0:8cf:c218:739b with SMTP id af79cd13be357-8d41c6abd7dmr3111687985a.18.1775686345853;
        Wed, 08 Apr 2026 15:12:25 -0700 (PDT)
X-Received: by 2002:a05:620a:28ce:b0:8cf:c218:739b with SMTP id af79cd13be357-8d41c6abd7dmr3111683585a.18.1775686345273;
        Wed, 08 Apr 2026 15:12:25 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d526e26c19sm1271366585a.18.2026.04.08.15.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 15:12:24 -0700 (PDT)
Date: Wed, 8 Apr 2026 18:12:22 -0400
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
Message-ID: <adbSxmeJDf14EtS0@redhat.com>
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
> @@ -55,29 +106,14 @@ static int fsl_sai_clk_probe(struct platform_device *pdev)
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
> -
> -	return devm_of_clk_add_hw_provider(dev, of_clk_hw_simple_get, hw);
> +	ret = fsl_sai_clk_register(dev, base, &sai_clk->lock,
> +				   &sai_clk->bclk_div, &sai_clk->bclk_gate,
> +				   &sai_clk->bclk_hw, CSR_BCE_BIT, CR2_BCD,
> +				   data->offset + I2S_CR2, "BCLK");
                                   ^^^^^^^^^^^^^^^^^^^^^^
Sashiko reports the following:
https://sashiko.dev/#/patchset/20260407211123.77602-1-marex%40nabladev.com

    For MCLK, this evaluates to writel(MCR_MOE, base + I2S_MCR). Does this
    overwrite the entire register and clear all other bits to 0? This could zero
    out fields like the MCLK Divider Enable and Clock Source Select, breaking
    the MCLK hardware divider.

It's the same behavior as what was there previously. There's a lot more
to the comment. Can you look and see if there's anything else valid in
Sashiko's comment that should be addressed while changes are being made
here?

Otherwise, based on what was there previously, this looks good to me.

Brian

