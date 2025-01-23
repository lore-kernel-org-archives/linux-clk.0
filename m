Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E80898BF8;
	Thu, 23 Jan 2025 20:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737662537; cv=none; b=P+6qpZAl59CwKRZPAZ0Nh4x8TxEMW4eGEQLqoAxkoQ7wQ9y5S5xJ1/kgS/nSZsWeg8tiyPVwY7LgyyyFVctfaMvQEO08SrAJf/JN4XBFLLj60tjw3Ca9xAIes2H72k9sg8k/1snWmqUYMEVV47Ay6e+oB0obBah9Ivf1TW3/EQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737662537; c=relaxed/simple;
	bh=0nonnXqeny+FnM/4d+e8iY8HfcowR3c9J6N3RH+Ym6c=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDrjeomn5EmgtK6HgJmRSborlXU1TjeTP6S+vcsiYPom2t0FAO549H1Twmi3c1xRSA3l5afyzfv4pn+DrJ/6TWyX2GEbEzLcSbq7+fAyQfAXT/S06+p7V1nOdXTc5SCd4l4BLGF2Ks/0UrlKoUusyEdbomsk3EkbTxyrrCz1QDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=tiWM3V37; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="tiWM3V37"
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NK2AXM1231042
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 14:02:10 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737662530;
	bh=RdtBTjfFcbNJRmOhE0vXapIJhvOUi2PQsuLDeU8sq9o=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=tiWM3V37CaIXAy54okQehkD9nmG+YwnY4idK5hWpcO5JmQvSKLtpQlOgWQRrO7VAJ
	 nY61j3jFJ3mK99sfIJlwExNcOLE1CxGbXxwne7dgi/RdLhW89L70FRWjVYuvUkXY3k
	 yZK+ziJFv8GVw+3PB6aIOCl7MfN3Xjp2TTD0g+4g=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NK2A5f015782
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 14:02:10 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 14:02:09 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 14:02:09 -0600
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NK29aP003510;
	Thu, 23 Jan 2025 14:02:09 -0600
Date: Thu, 23 Jan 2025 14:02:09 -0600
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>, Stephen Boyd <sboyd@kernel.org>
CC: Vignesh Raghavendra <vigneshr@ti.com>,
        Santosh Shilimkar
	<ssantosh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen
 Boyd <sboyd@kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, "Rob Herring (Arm)" <robh@kernel.org>,
        Lee Jones
	<lee@kernel.org>
Subject: Re: [PATCH] clk: keystone: syscon-clk: Do not use syscon helper to
 build regmap
Message-ID: <20250123200209.lqdap6jdzz4ud37f@riveter>
References: <20250123181913.597304-1-afd@ti.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250123181913.597304-1-afd@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On 12:19-20250123, Andrew Davis wrote:
> The syscon helper device_node_to_regmap() is used to fetch a regmap
> registered to a device node. It also currently creates this regmap
> if the node did not already have a regmap associated with it. This
> should only be used on "syscon" nodes. This driver is not such a
> device and instead uses device_node_to_regmap() on its own node as
> a hacky way to create a regmap for itself.
> 
> This will not work going forward and so we should create our regmap
> the normal way by defining our regmap_config, fetching our memory
> resource, then using the normal regmap_init_mmio() function.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Tested-by: Nishanth Menon <nm@ti.com>

Could we get this routed to master as fixes asap please to get a sane 6.14?

This is part of the fixes TI K3 platforms boot issues reported in
https://lore.kernel.org/all/b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com/

on the latest linus master v6.13-5001-gd0d106a2bd21 + linux
next-20250123

Total set of patches tested with:
https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
https://lore.kernel.org/r/20250123181726.597144-1-afd@ti.com
https://lore.kernel.org/r/20250123181913.597304-1-afd@ti.com
https://lore.kernel.org/r/20250123182059.597491-1-afd@ti.com
https://lore.kernel.org/r/20250123182234.597665-1-afd@ti.com


Cc Rob and Lee

> ---
>  drivers/clk/keystone/syscon-clk.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/keystone/syscon-clk.c b/drivers/clk/keystone/syscon-clk.c
> index 935d9a2d8c2b3..073c2ebcdf6af 100644
> --- a/drivers/clk/keystone/syscon-clk.c
> +++ b/drivers/clk/keystone/syscon-clk.c
> @@ -105,6 +105,12 @@ static struct clk_hw
>  	return &priv->hw;
>  }
>  
> +static const struct regmap_config ti_syscon_regmap_cfg = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +};
> +
>  static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
>  {
>  	const struct ti_syscon_gate_clk_data *data, *p;
> @@ -113,12 +119,18 @@ static int ti_syscon_gate_clk_probe(struct platform_device *pdev)
>  	int num_clks, num_parents, i;
>  	const char *parent_name;
>  	struct regmap *regmap;
> +	void __iomem *base;
>  
>  	data = device_get_match_data(dev);
>  	if (!data)
>  		return -EINVAL;
>  
> -	regmap = device_node_to_regmap(dev->of_node);
> +	base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(base))
> +		return dev_err_probe(dev, PTR_ERR(base),
> +				     "failed to get base memory resource\n");
> +
> +	regmap = regmap_init_mmio(dev, base, &ti_syscon_regmap_cfg);
>  	if (IS_ERR(regmap))
>  		return dev_err_probe(dev, PTR_ERR(regmap),
>  				     "failed to get regmap\n");
> -- 
> 2.39.2
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
