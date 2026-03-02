Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7505E317158
	for <linux-clk@vger.kernel.org>; Mon,  2 Mar 2026 17:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772473167; cv=none; b=HvVYcUXQlFoFLKCJNv7XGmxJFh38ugi40nOdETudbxzfVOnLwbvodKRiT4quofCdapPgXoDCpuANVU55HzTejnpH0pwUosVl2vvkzVX6Wm9C9kgPUecp6YL3hOE070pTXy6USp6ArqrYg6mycI5gZ2VbOHl2dR0to/RN2sQNDQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772473167; c=relaxed/simple;
	bh=uUvCAGGb52PuwK+CGHANQS62FlOFRBknxd+wtqQSDTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tR+1dMvMNtpTXgLsADaP3OAnC1SsUdx7h03autlAXuQ27H6yGaMjx/QsNFw3YF/wSOhYfGx41m2jlCGJGxWYdoY2qqDnpQaa3jEmbL/46l5ahmKsjlR39rR/lQZAXMz0M68sqh1htgGpFTmW7CB8HiV9+SEccUc52708myKo5lM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A2xoGyuQ; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=pSdYVrap; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A2xoGyuQ";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="pSdYVrap"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1772473164;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=i1tUwxzrUgsmfVWvT+mkxBs36R16WUO3Sf96FjGd71g=;
	b=A2xoGyuQbR9CdOuVf3AeM6h0P3/1k9HAVT9rj4dPzCql+2y5PhPY2xWosjy3+JPUlWcX2Q
	B137JwHHWx1o814drKc52kW5d4I9R1adDPbOxgbNTmdybFMlywkkW5zVzSnzWGUaN/7Bbi
	u4rmjCPJqN9BaWBxA/VzU1eBghTRMWQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-2SfbjsCVOASHXVxKGlCCqg-1; Mon, 02 Mar 2026 12:39:23 -0500
X-MC-Unique: 2SfbjsCVOASHXVxKGlCCqg-1
X-Mimecast-MFC-AGG-ID: 2SfbjsCVOASHXVxKGlCCqg_1772473163
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c70e610242so97033485a.2
        for <linux-clk@vger.kernel.org>; Mon, 02 Mar 2026 09:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1772473163; x=1773077963; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1tUwxzrUgsmfVWvT+mkxBs36R16WUO3Sf96FjGd71g=;
        b=pSdYVrap5TLaq7UUWM/3I26SlPaiIhIrp4UU76aVDtSXnwEOLDj8ZpAdSo1YsQqL+1
         gHHe954gF8VfwVe4lCmMWEWnjEZQ5GdjH6ijL1T0IV/ZbiuyWBgAJlXXwKM8JdGutdoQ
         P6Qhz5W0MOrjjmEjCRmreXzngMbcnxg9oWdQmjSHFJKBHc/J+mZ410BRQYpo0p3Vuqe4
         7bhge9dgFwyldujgJhI08BYq7SKfCSJYUihhlLkCLKq9faRqYfgSO6txRJWKZC4nM8xR
         ONoDt2Bm+gY79LqDFNshs9bUyWx8zuCXzsmxwyGnjH2TPTbxbFXVTqWvM8p2BWR6irxj
         vV5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772473163; x=1773077963;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i1tUwxzrUgsmfVWvT+mkxBs36R16WUO3Sf96FjGd71g=;
        b=c/gw/gYT2KLnpjZyYo9E9OncE0KfylUQ6Exmb0d4yYR6lYPui9ZOyzUyZyv+eKRGTA
         cU1QN2mEZa6rjWjP58ISYO+UcXBaaAbOEHzk9JQoFc5cJ+ncMZAI7VsuZnygDsXu/RFT
         yNr8/iIH/73relGPVvO4IrLBJC1obWkUj0nPklSumCD4s1igzRzdRYfiropEJ12WF3in
         7mDS2NAYtWDjf58wGlGXh6tjlAA20pabEDqmjNbmStJBW/BYKzEPN1yOAy6XEyWcq9Ew
         8d5SZyoAwyAr7HPJxAV72JkvbjHsSGQCYwn+8kplFBqoeAeOEsVRF/g3bXzcFInV5JVA
         6kjA==
X-Forwarded-Encrypted: i=1; AJvYcCW4rly47DQKqXpMFbMpemMsBSeAVliRR/gVuPOvT1uWDBdLUB6UZW8uzNxZOgvF1V4owGy2a7Rb1CI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaiQTlQPp4quSt2P0A/4t69+uuTxUVQ3DMz695IAyBI+mYagG/
	FOUFAJ2Gs332mmhBUGh8ygdwThrfn4h1G9sLByVtAX2jfy6mmFj+5xh2hSmBlZKavPyMbpUr+/6
	reh+c2nZKNXjs/AlVEDeuMSdUqiCYPffZxjoUB0xQcG1jo1+EnwIRmBjIZJuv2A==
X-Gm-Gg: ATEYQzzeo0+0Sf2xx4ml4iUI6BOlSsnkeBIsuPXkGbovEGnC3B5pL28kwhgkxdZ6QT1
	GoATBS1nbyu5pbXvG184kDA5UqI09zN/Z0aEkXz8HxcIkYZuiS8l0j2b59tvv/PoBDJrk56FsMf
	mH17+XxUDwqCxE9p16b21tk3DCM823+MwyYxsmEvtogqFEHpcbEq2DSv4dw3Hhlin5T/fsIS01X
	ojEV//rpYbnzsbS+qeG1IJKqch0xq3HCfakfG5uHrhIymhV24IIu2Odc/ER9ZQCRGmKu4IEda0i
	iKryJYjmz8G5oHcAuHEGjH16icaaNIwTzXuq73bsX3/dufURcBgHz1VaHclmQH2vfPCpVl/0uHL
	9oj2xI5KXnSDiutG+hUtiSsSMbhTmWkcAl8Ttxjb+V8l/QuN5GrVPnxkT
X-Received: by 2002:a05:620a:3703:b0:8ca:7b14:16d4 with SMTP id af79cd13be357-8cbc8e2d0a6mr1630208485a.63.1772473162750;
        Mon, 02 Mar 2026 09:39:22 -0800 (PST)
X-Received: by 2002:a05:620a:3703:b0:8ca:7b14:16d4 with SMTP id af79cd13be357-8cbc8e2d0a6mr1630204685a.63.1772473162215;
        Mon, 02 Mar 2026 09:39:22 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf64ef00sm1206428685a.10.2026.03.02.09.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 09:39:21 -0800 (PST)
Date: Mon, 2 Mar 2026 12:39:20 -0500
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com
Subject: Re: [PATCH v14 3/4] clk: eswin: Add eic7700 clock driver
Message-ID: <aaXLSGxL_J2Bk-Wt@redhat.com>
References: <20260226090513.1696-1-dongxuyang@eswincomputing.com>
 <20260226090646.1867-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226090646.1867-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

On Thu, Feb 26, 2026 at 05:06:46PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add clock drivers for the EIC7700 SoC. The clock controller on the ESWIN
> EIC7700 provides various clocks to different IP blocks within the SoC.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

[snip]

> +static struct platform_driver eic7700_clock_driver = {
> +	.probe	= eic7700_clk_probe,
> +	.driver = {
> +		.name	= "eic7700-clock",
> +		.of_match_table	= eic7700_clock_dt_ids,
> +	},
> +};
> +module_platform_driver(eic7700_clock_driver);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Yifeng Huang<huangyifeng@eswincomputing.com>");
> +MODULE_AUTHOR("Xuyang Dong<dongxuyang@eswincomputing.com>");

Add space between the name and <.

> +MODULE_DESCRIPTION("ESWIN EIC7700 clock controller driver");
> diff --git a/drivers/clk/eswin/clk.c b/drivers/clk/eswin/clk.c
> new file mode 100644
> index 000000000000..3d40d1d7e696
> --- /dev/null
> +++ b/drivers/clk/eswin/clk.c
> @@ -0,0 +1,588 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright 2026, Beijing ESWIN Computing Technology Co., Ltd..
> + * All rights reserved.
> + *
> + * Authors:
> + *	Yifeng Huang <huangyifeng@eswincomputing.com>
> + *	Xuyang Dong <dongxuyang@eswincomputing.com>
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk-provider.h>
> +#include <linux/iopoll.h>
> +#include <linux/math.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "common.h"
> +
> +#define PLL_EN_MASK		GENMASK(1, 0)
> +#define PLL_REFDIV_MASK		GENMASK(17, 12)
> +#define PLL_FBDIV_MASK		GENMASK(31, 20)
> +#define PLL_FRAC_MASK		GENMASK(27, 4)
> +#define PLL_POSTDIV1_MASK	GENMASK(10, 8)
> +#define PLL_POSTDIV2_MASK	GENMASK(18, 16)
> +
> +struct eswin_clock_data *eswin_clk_init(struct platform_device *pdev,
> +					size_t nr_clks)
> +{
> +	struct eswin_clock_data *eclk_data;
> +
> +	eclk_data = devm_kzalloc(&pdev->dev,
> +				 struct_size(eclk_data, clk_data.hws, nr_clks),
> +				 GFP_KERNEL);
> +	if (!eclk_data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	eclk_data->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(eclk_data->base))
> +		return ERR_PTR(-EINVAL);
> +
> +	eclk_data->clk_data.num = nr_clks;
> +	/* Avoid returning NULL for unused id */
> +	memset_p((void **)eclk_data->clk_data.hws, ERR_PTR(-ENOENT), nr_clks);

The (void **) cast shouldn't be needed. However, stepping back, this
memory is allocated using kzalloc() above, so that range should already
be zeroed. Unless I am missing something.

With those two minor issues fixed, you can add:

Reviewed-by: Brian Masney <bmasney@redhat.com>

