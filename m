Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6CA53C5548
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 14:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775228057; cv=none; b=OGF59inFM1PUunDTBK1BLV6PXNAfAfsuJ8S7YTN+jFZqUMjOaunFSMD1P44asBsEdPTIO+13Socpz+VeDXFdz319ZcmhcvC1Z0oxHru7x0xF/Xv4EAX3hp7Awos+qpHQFd8HWFWS7MqVLEizXbFR/Q/OyKovfMlgYFYpmNYm4Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775228057; c=relaxed/simple;
	bh=7PUBIgjHZ5FhHvfdpZSXiFD5EOe9PjvrkPuWk/Vegjo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VQx5D0y/a3qMsO4XDaOwT10EarpIfVhwr0uDYhiU1V+9Q0/YyqTnWcQG96dsDfktb1HbxY6YaADgtudzWPxfL4kvgfW7YRoB9KIYadWfU0E1C6jg+twEV6Fvytwwa67YDhWw9l0UTX0l5OHk4L7iwTDeCUuFJh8/nRRS8bFNjk0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QoVIpcD5; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=seoVZX0j; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QoVIpcD5";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="seoVZX0j"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775228053;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=;
	b=QoVIpcD5KISNiXG4nI+taODP4G0DYgM6XavsA6Y8k8VcDpi9jluRrs56WAhNdzjU4Bjq+i
	hLu4C6Iw10NJjpYKK8llDiOza9kG0G80ARwjt+Xqxer+KSqocLWfNQyAmRNtdtJ1GFPzzT
	NT/JDgBxUsVIMP5OfDPVE3pJ3kVRrTg=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-318-6rTsvaebM5azkmH0UKNhww-1; Fri, 03 Apr 2026 10:54:13 -0400
X-MC-Unique: 6rTsvaebM5azkmH0UKNhww-1
X-Mimecast-MFC-AGG-ID: 6rTsvaebM5azkmH0UKNhww_1775228052
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89f1daa57f3so73483286d6.0
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 07:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775228052; x=1775832852; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=;
        b=seoVZX0jmxVoFjHQS8P3l2gcnociwp2ylAe5F9CvBlUO6R9MSvjgPes81k0eE3HxsB
         bDH0mu9XT9DjyUf4HBefwVCPAwNtNvTF6P9bOj1uqc3nN+R9fhKipRWguEgE2fVLdQ8X
         Is6EWFDWwtEGnEeiaeNR6i7y7TV5PM83hEwS5tPsi+L8Fw3M8l1HUUryPKkXZT7OOLSe
         ZR9cEhicgWqrcRspE8J8wSRrIj5r7GnLVZI34Eeye7LkcYvwLmKS3o0bGybjh0auAjkB
         ek8wQ04MNa34a2vediNqKut7R6hrBFAmSyprzRTdKMwUOBWvm5zwbnIN5t9MCFs9NhzR
         7vZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775228052; x=1775832852;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EJQp4qyiVINRC2yWIozqFa0fIfPJ+S4aniFYq7A/W0o=;
        b=pjkn2A3L8vFc+ubJna2SlbxntEEOmrx8zplvq/kDpKpU/B87seLFq/wQXx3k/Byysf
         LDSWqXNSY3K8rGsD1+qwyxinc3R7E3YA5HuevnWUoc0bAlIkQBoQCSUn+rVTifPbB50A
         PN1WcFmRstU6Lad7WpmPZSHCQ04U2bdUbtRuwMlbGEnlMkwuYmbxw2bWZnUCRqta8CtH
         MB2mLEfrk4mQdT3+xkClU9LTHVpz/kWhHmBvUgOnCqz2Fx2UJUaQve0slITzERF/YUAZ
         ARVgIAZdJ/LyCrs9rgq9qKcpWZecvVF6PWnldApR4szIOkuP1sUX1rARcAhNu+zcK85p
         RGVw==
X-Forwarded-Encrypted: i=1; AJvYcCV6GQAO19xobxK/r6nC/qD62PUVZNtm/WeMa/9diwhwqNNj00l0YQ1CfDLghJqOGOkk1tfKrbR1P/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgN8RjmU30D0JYrbiKLwz1l6kYbxJH6TtzeBLbqfS/DQqw03U3
	uphCcnx4UQWxG3sylP4n89gQ9t8m29/ALqHFa+9SLd+IVPg1Ep3dQ1IJyPdnJLFQ2K9dxCBRCic
	LswoMvBmLBUmhUZ2RE+5YL9xYPqs5o4QUtMVx281lNTCIhhn92g/fG0l6wqL/Ww==
X-Gm-Gg: AeBDieujXSlRLesywgutEH4SvqNAci6eBmfd7604m9ohtLJ7ifs7PnGC70Vujg/yg5W
	jIhrZvcpbgOElSToeS+UzdJUcAkmqDlIy7YjD2esJ4FSuF+s9npumjUC71wM+e3M65bd/uurb2x
	ljcpqRXXe4L22f150C5Yy4pxsTDrztjhqRjeekiV/+tw+wbYMOggl4JXKMrrmXrdYa0EjtTBntw
	6KPkeXOOiIYjH6aX+7lvAMAtoug/zQOV+zLCU/kLywGsxPbgkDnP/PVoY8mXN8LZUYCX3CmTCY2
	mX4u2EyTXk8hlByz6ReorHOOtxDGV8Jiz5zsNGLz0yLSIggEls2ukUSsy0Ul/IhBVJ0zzC/JAFJ
	fs0DC4Wbi3thxFVVfDqW8ml/7udbnW47FLwQ3Hnpd+fzUL+LW8rusK8GJ
X-Received: by 2002:ad4:5961:0:b0:8a5:104b:e390 with SMTP id 6a1803df08f44-8a7043ee428mr55704356d6.32.1775228052315;
        Fri, 03 Apr 2026 07:54:12 -0700 (PDT)
X-Received: by 2002:ad4:5961:0:b0:8a5:104b:e390 with SMTP id 6a1803df08f44-8a7043ee428mr55703896d6.32.1775228051814;
        Fri, 03 Apr 2026 07:54:11 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8a593330a98sm50899396d6.2.2026.04.03.07.54.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:54:11 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:54:09 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 06/10] clk: realtek: Add support for mux clock
Message-ID: <ac_UkRiqWb6fSc1I@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-7-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-7-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Yu-Chun and Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:53PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
> 
> The implementation supports parent selection and rate determination through
> regmap-backed register access.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> ---
>  drivers/clk/realtek/Makefile         |  1 +
>  drivers/clk/realtek/clk-regmap-mux.c | 48 ++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-mux.h | 43 +++++++++++++++++++++++++
>  3 files changed, 92 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 74375f8127ac..f90dc57fcfdb 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -5,4 +5,5 @@ clk-rtk-y += common.o
>  
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
> +clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
> new file mode 100644
> index 000000000000..068b056d61f0
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.c
> @@ -0,0 +1,48 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include <linux/clk-provider.h>

Sort the includes.

> +#include "clk-regmap-mux.h"
> +
> +static u8 clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
> +	int num_parents = clk_hw_get_num_parents(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
> +	if (ret)
> +		return 0;

This is another case where it'd be nice to get the get_parent
declaration fixed. Stephen recently linked to some work of his from 2022
here.

https://lore.kernel.org/linux-clk/177431305509.5403.15386021337517970667@lazor/

There's nothing for you to do right now.

> +
> +	val = val >> clkm->shift & clkm->mask;

I know there's the order of operations, however for clarity I would just
include some () here to make it clear the expected order.
> +
> +	if (val >= num_parents)

Remove newline before if.

> +		return 0;
> +
> +	return val;

Or you could just use a ternary operator:

return val >= num_parents ? 0 : val;

> +}
> +
> +static int clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct clk_regmap_mux *clkm = to_clk_regmap_mux(hw);
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
> +				  clkm->mask << clkm->shift, index << clkm->shift);
> +}
> +
> +const struct clk_ops rtk_clk_regmap_mux_ops = {
> +	.set_parent = clk_regmap_mux_set_parent,
> +	.get_parent = clk_regmap_mux_get_parent,
> +	.determine_rate = __clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "REALTEK_CLK");
> +
> +const struct clk_ops rtk_clk_regmap_mux_ro_ops = {
> +	.get_parent = clk_regmap_mux_get_parent,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ro_ops, "REALTEK_CLK");

rtk_clk_regmap_mux_ro_ops is exported, however the declaration is not actually
declared in any header files.

Brian

