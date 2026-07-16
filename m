Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2C74443A8D
	for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784225842; cv=none; b=kGUbHFpYtnI4zeqyJ7iCc0BCqAcRgvlRyAJ2gUViNV9dUCISlvW9UoAS8n3AYxgjqz2qGAXSD/iV9QUYEwKkoFsjHqJufxTpyljdpFuKOtGiGg1uXKTju2AQVfKYLeQ4uSP+wrtamPD1pQirJBNNiQK94gpoSgRVxKtAnBHkLz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784225842; c=relaxed/simple;
	bh=JhNa3NXChZgvvRp8vv1/TdGLxn6XWsdiqPg2ORbU7ok=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pojq1rBFGCl57CKUP9Y5myPBZQDt7UyeelraIFp1f9O7SQ/AMUwZhlPDgJemx6O2tUnv5dpnJb3LZ1jRZ3em/eoct7wasUN/+ptt0h4P2bvBUHuNGfxsVMbH82OPAou7PU0uAm0wX+2FoAPBCKOOugyY1X/b2nRngTNquFb7Z74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c1rV81NT; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=YG/Uqmnn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c1rV81NT";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="YG/Uqmnn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784225835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I1EFQGj/5aBchHaJPdCzDRZXU3faNJ5yBKDRHdX2qjY=;
	b=c1rV81NT5l/e8R730wRshpT6tKjcRzAIbGWDwSaroeCvHYnH9zG4QL+6lQgMPsgEoox8UG
	BmkyWfR+g5YnycJe4dAhldjvtgEmJzBrzEMKlRkIcGoPUkJIqJAxKga9zK2uNdAuW71VHq
	zySlS9p0DA6okYPqvKp63u7XcH+9h/o=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-517-QafMKrlkMhGIbFjsLpzipQ-1; Thu, 16 Jul 2026 14:17:11 -0400
X-MC-Unique: QafMKrlkMhGIbFjsLpzipQ-1
X-Mimecast-MFC-AGG-ID: QafMKrlkMhGIbFjsLpzipQ_1784225831
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1d7886cdso142103341cf.1
        for <linux-clk@vger.kernel.org>; Thu, 16 Jul 2026 11:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784225831; x=1784830631; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=I1EFQGj/5aBchHaJPdCzDRZXU3faNJ5yBKDRHdX2qjY=;
        b=YG/UqmnnyD6F28aNaSGNVVJUu65AB6omNJo2pAy26GXNlcOpaeyOrfGCMzWKfpZ5/n
         gJG7tSnFlKvoZaR0ZGO5eQZ8wjSt7vpZxH26vk60Dbi7kZ0iAcRKu7+RrIFzFrHZTaXS
         1zGR/LlnFuJNML07d7NxlDvxUA0IBlvv201ug5B8PqRHy2s4vB0vNf/hjBe0v2100rLl
         d/gmnzZtFhNttwjwAR8/gfgaK188r3mS/M62Y2u7tLdixRwjouHlVpV6qI2kMC/3lWeG
         gMykPdxtz23EDImIp1XtbBgRDLO9gmgSPxeo3Dr6/kDGUwB4A+wnmpuvNl0UgzMbm62M
         MkQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784225831; x=1784830631;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I1EFQGj/5aBchHaJPdCzDRZXU3faNJ5yBKDRHdX2qjY=;
        b=MRyaV2dGf1q5Steot0V5U09d3GPtI+C2OfPyCI1hTT05F+UcAZ7ma/TcEqG4Lq8MqU
         9zkp/cGHPWFq3TXTbYzUqd7VWKlEWNX0DU3Jh0FoVVn4Ix/7rIYp1YrHjYSdP1tdGtdp
         ZolSqBvIhinsNT4GbZvSuW88hrzGLmwcfgENcCV4+hTlFBk+kN/zrIQXQu2zjR2zpiPp
         6n9DELo9SDjbzuwEEJJwkuR8FIHschYVFvmkNi4gGqdXjMOHrxw9GlnDbxFI5WXp3JJQ
         E5lNWSuZPJzLwsD15d7MPzEToN13th2mwKIBLtLZfbYKmdvC7zRHtjIJyA2RHVuLxbh+
         A+Xg==
X-Forwarded-Encrypted: i=1; AHgh+RpfCCA/md07SiWmFqvAIDY4IA7Mt3bSC6ZmaFgiw+icE1dGuVyKUfM1V2eHjWvBR6XhmqEbZUElgFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiauqHhixYYPG5S2DEGrzioU/BbWAuMAdeB9ITw6X3J9fupx4j
	NnEdRKOa3kCk2S2mrlxc8BSlpwUvujx+/kRbrqcXnRiC2aLj7RIQjWnn4Zwc4y6q0EdFzTpQuqB
	BL0Tgvw6vU09+G9q7x8V+yn1ubDRK32RUlYTciVl0nPtyzY1if7UTH5Q5XxH72g==
X-Gm-Gg: AfdE7ck7HN+DTWzefIfR94skxC/iZ2rgE6nRnXTb6uBB6IKbSgi3aCHIZv3HMOb9nuC
	DtJceQr6CSaC9n3uf8HOgQkYWqvuyNIpkIc1LnBDYCRoV/UPulh/HXxyJfcQv9LMGPj7uXtcKK8
	fTUT3an6nsh/0fTWwSgvBgXWGrQjV7QaFFUMAlB7Yy5hG7lnl6+++hwXarUQ6I5solNpDB6yMzD
	X73ZBD+7UauxcUi6xOa6letEoTgJve2eiH97qsGoG27M2yesbSIXCWgYVgNdiYbBGS13Svmky+o
	oSMQ/Hfm9VzGxDmrsCBEyFDGm8YGhBbyONNM6qs7UO1N1fuGU0QEVpxmq4mqA2XCQZ6AYGfS0Mm
	SFDo8pYubrF4JMNNtirthYib5qsxOAy8t88k=
X-Received: by 2002:a05:622a:28e:b0:51c:7b12:5fd8 with SMTP id d75a77b69052e-51e4f12bb6cmr85086801cf.84.1784225831076;
        Thu, 16 Jul 2026 11:17:11 -0700 (PDT)
X-Received: by 2002:a05:622a:28e:b0:51c:7b12:5fd8 with SMTP id d75a77b69052e-51e4f12bb6cmr85086351cf.84.1784225830474;
        Thu, 16 Jul 2026 11:17:10 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caacaad78sm158378721cf.7.2026.07.16.11.17.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:17:09 -0700 (PDT)
Date: Thu, 16 Jul 2026 14:17:07 -0400
From: Brian Masney <bmasney@redhat.com>
To: wangjia@ultrarisc.com
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: ultrarisc: Add DP1000 clock driver
Message-ID: <alkgIyhI43ypvZdb@redhat.com>
References: <20260714-ultrarisc-clock-v3-0-4b1ccaa26b37@ultrarisc.com>
 <20260714-ultrarisc-clock-v3-3-4b1ccaa26b37@ultrarisc.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714-ultrarisc-clock-v3-3-4b1ccaa26b37@ultrarisc.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Jia,

I have one minor question below.

On Tue, Jul 14, 2026 at 09:35:09AM +0800, Jia Wang via B4 Relay wrote:
> From: Jia Wang <wangjia@ultrarisc.com>
> 
> Add a clock driver for the UltraRISC DP1000 SoC.
> 
> The clock tree is driven by a SYSPLL and provides fixed-factor clocks for
> the subsystem and PCIe, divider-based root clocks for GMAC and the UART,
> I2C, and SPI blocks, and per-instance gate clocks for UART0-3, I2C0-3,
> and SPI0-1.
> 
> Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
> ---
>  MAINTAINERS                           |   1 +
>  drivers/clk/Kconfig                   |   1 +
>  drivers/clk/Makefile                  |   1 +
>  drivers/clk/ultrarisc/Kconfig         |  18 ++
>  drivers/clk/ultrarisc/Makefile        |   4 +
>  drivers/clk/ultrarisc/clk-dp1000.c    | 154 +++++++++++++
>  drivers/clk/ultrarisc/clk-ultrarisc.c | 407 ++++++++++++++++++++++++++++++++++
>  drivers/clk/ultrarisc/clk-ultrarisc.h |  71 ++++++
>  8 files changed, 657 insertions(+)

[snip]

> 
> +static int ultrarisc_clk_register_dividers(struct platform_device *pdev,
> +					   struct clk_hw_onecell_data *clk_data,
> +					   const struct ultrarisc_clk_soc_data *soc_data,
> +					   void __iomem *base,
> +					   spinlock_t *lock)
> +{
> +	struct device *dev = &pdev->dev;
> +	u32 i;
> +
> +	for (i = 0; i < soc_data->num_dividers; i++) {
> +		const struct ultrarisc_divider_desc *desc;
> +		struct clk_hw *parent_hw;
> +		struct clk_hw *hw;
> +
> +		desc = &soc_data->dividers[i];
> +		if (desc->id >= clk_data->num || desc->parent_id >= clk_data->num)
> +			return -EINVAL;
> +
> +		parent_hw = clk_data->hws[desc->parent_id];
> +		if (!parent_hw)
> +			return -EINVAL;
> +
> +		hw = ultrarisc_clk_register_divider(dev, desc, parent_hw, base,
> +						    lock);
> +		if (IS_ERR(hw))
> +			return PTR_ERR(hw);
> +
> +		if (desc->max_rate) {
> +			unsigned long rate;
> +
> +			clk_hw_set_rate_range(hw, 0, desc->max_rate);
> +
> +			rate = clk_hw_get_rate(hw);
> +			if (rate > desc->max_rate)
> +				dev_warn(dev, "%s rate %lu exceeds max %lu\n",
> +					 desc->name, rate, desc->max_rate);

At this point in the probe, the clock tree may not be fully propagated
yet. Is this check needed?

Everything else in the driver looks fine to me.

Brian

