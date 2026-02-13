Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA007304BCB
	for <linux-clk@vger.kernel.org>; Fri, 13 Feb 2026 22:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020868; cv=none; b=CzUmptjV9ija9+svUPkILJqP/+BHkLiH35nf2vmrT2xdz6rjamTsbAy8hlGYmERo5+QvNPAUucz61pfbdSPlbjK+gWNX/oDPx3vxqAJ/Wk/DmnSpeBGZPYoSoGl6pb7R01yv2pPS828T+vcF9qFPklK1JreN0bD8HwuM1jb9HBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020868; c=relaxed/simple;
	bh=mqW13uA5TM+Hph1nqWrJsn9JRRRcM3ZDiUWskTqCRvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K9l91p4zEVu5+IX9om0SkoAacSEec0FgD6b1vKS2ZVEfLbjjrf9CUp2Je7h1tFtuR2+yfc6Rjuhb44n8CUhsWjAbZfRFDeEbXeE9ctxFP3ML9bAo6zk7x9WbwIWVOfwf4qQsT1V0tdzMK4I+lf4pcBhWU+Cs53PpiIa0Tw8+Eb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QGQpPYUU; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g8HVlMRv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QGQpPYUU";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g8HVlMRv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771020865;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=6hTIiLdxBgTr52GSbw0BeaA/PdjvxewY6nhObNpoFhA=;
	b=QGQpPYUUwDKM4fwmyl7bSYjpEP/VPABCAU2ZerxFn0y7cmE9YP5EIs1tjET+8I3ZIpFQee
	BnsLt4BgporYeme0FMtpC7Caw/wU+RMZDzB4Eznlxr7k3WGDzAW3E/LgnRj0o2jaPav8Pp
	lHwZehF4aQibqNSW4rx68zYDeArwi6w=
Received: from mail-yx1-f70.google.com (mail-yx1-f70.google.com
 [74.125.224.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-568-hS1u1PAjOJKXHf3Lp6CF1w-1; Fri, 13 Feb 2026 17:14:24 -0500
X-MC-Unique: hS1u1PAjOJKXHf3Lp6CF1w-1
X-Mimecast-MFC-AGG-ID: hS1u1PAjOJKXHf3Lp6CF1w_1771020864
Received: by mail-yx1-f70.google.com with SMTP id 956f58d0204a3-649c2a1b438so2133330d50.1
        for <linux-clk@vger.kernel.org>; Fri, 13 Feb 2026 14:14:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771020864; x=1771625664; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6hTIiLdxBgTr52GSbw0BeaA/PdjvxewY6nhObNpoFhA=;
        b=g8HVlMRvV0PgQ/+V/szqf6r3WQDAMpsrdm2N18po6+bGCG/hxdQd9SH0oA8g/bKtIP
         w67Du9QFsAJhBZjNgO0zMaKOxHnO7eCq/B9hnhbYFQ8qrxa7qtTqhzMg4GelFj+b6iBr
         MGZ+4qslyLsAGyMdMM8OETSFfgCAIPaW7QSs+KqmBuaYqoEW0AYF7Gxwem7xSJLUBL3A
         sjA0ujjCI8ya7hFF3aLkD1vW4fGDHPXACqdC70a18Riv0zbOOmAq1NqROejAgfptmL2V
         eDe9U4X91AVzip3cA9X1GSbbRCwdtxIL9iLdsV4woTsxHdZmMDL2D8czjLqM/Mq3z1eW
         qV2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771020864; x=1771625664;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6hTIiLdxBgTr52GSbw0BeaA/PdjvxewY6nhObNpoFhA=;
        b=SANvqHmU7yEnLKhG1cHOdfgcfE3lFB6tCYlkOFeI+jxvEIOpl/NBkVh9cdpykJmc71
         4SBRektnTxyof7M/EolhH7jPw82pZnn3CflkQ5h+OB+TMd01TyiHb3sZNzkW88VLZGax
         MErVM/zQZTJ5plqZdCl3hu0NT+6KpPhmcubVRfrh5Z4fW7zPq3BFO7vlXOQUirg62qr1
         bxJC74TV1tOjF79Z4e35zM7hXehR9J00PUzyZJegukUTXT6xUxehBTw7Shnyhq6subKC
         WEI/G1QhydhAUI0RbguvH5sRfFKccgq7dlP1hDEr/GnBq+bykxl349ngcyJDNcUMfVOm
         rzAA==
X-Forwarded-Encrypted: i=1; AJvYcCWpUmjKSvmDSqK2PXu4mvqKSG7RiViOpozZ84VD58zHmhZKwdwgexKalu+aYvJ6LtTaqVsv5a/hLb4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUmv/PDz7l8BvROxS5XsD3zH72tnk92gkVEkpsyBxSk3o14ZeV
	xcVD1mo5pEpbq1PczbA4id6jRWZc8h33Ysh6hL29LArvyj8+RTJtoM/jR2LUiT+jj25EyUmefoy
	5/NNeI+6v2txGEkoxd5a0ZzPbvQxb5wcq1vbBRUUS6b/XInrMM8/o4lklkZq7Nw==
X-Gm-Gg: AZuq6aI8Z+l8I4oJVmn+inlGHDLQz9//8nKVXxdVO6qvPbFNodIs7TLINJcISMo2Cga
	BxI79NFMCAo4DR46YJ02Tu8/lFdWW3qpJjo/dA1TNoObhNjd4HX82DT3VwegdCh9zSgURb6wumq
	kg0L/UqgF5F3g+GxgZEztJYXiGwXYZsgk2nGPBREnnNa/K1QPPfLaa/XZXnZTWYCKhP4gdsa6QU
	HP0rea8cVGmK9ze8hGiMjzZ7W3CV3/lb6QQtUUHKQwg338cobqfnbKPATVE8gfK2b2Jj3G9ZvaP
	r/ryvX/T7qU0F/I4xCLwG/W4HkQRRy9HG4TkufLEATeBP2eA7aKN/6uEGupbniMF5NZNhkWJfQF
	droy8avZiFD9ZwG0huA==
X-Received: by 2002:a05:690e:1686:b0:64c:20f7:b01a with SMTP id 956f58d0204a3-64c20f7b101mr1271753d50.63.1771020863910;
        Fri, 13 Feb 2026 14:14:23 -0800 (PST)
X-Received: by 2002:a05:690e:1686:b0:64c:20f7:b01a with SMTP id 956f58d0204a3-64c20f7b101mr1271734d50.63.1771020863494;
        Fri, 13 Feb 2026 14:14:23 -0800 (PST)
Received: from redhat.com ([2600:382:7701:35e:7b1:406b:abde:3b10])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64c22fb7860sm128668d50.19.2026.02.13.14.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 14:14:22 -0800 (PST)
Date: Fri, 13 Feb 2026 17:14:18 -0500
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com
Subject: Re: [PATCH v12 2/3] clock: eswin: Add eic7700 clock driver
Message-ID: <aY-iOjczskKfF66W@redhat.com>
References: <20260213094112.115-1-dongxuyang@eswincomputing.com>
 <20260213094157.228-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260213094157.228-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Xuyang,

On Fri, Feb 13, 2026 at 05:41:57PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add clock drivers for the EIC7700 SoC. The clock controller on the ESWIN
> EIC7700 provides various clocks to different IP blocks within the SoC.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

The commit subject has 'clock: eswin: ...', and it should be
'clk: eswin: ...'.

> +++ b/drivers/clk/eswin/clk.c
> @@ -0,0 +1,579 @@
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
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/iopoll.h>
> +#include <linux/math.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include "common.h"
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
> +		return NULL;
> +
> +	eclk_data->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(eclk_data->base)) {
> +		dev_err(&pdev->dev, "failed to map clock registers\n");
> +		return NULL;
> +	}
> +
> +	eclk_data->clk_data.num = nr_clks;
> +	/* Avoid returning NULL for unused id */
> +	memset_p((void **)eclk_data->clk_data.hws, ERR_PTR(-ENOENT), nr_clks);
> +	spin_lock_init(&eclk_data->lock);
> +
> +	return eclk_data;
> +}
> +EXPORT_SYMBOL_GPL(eswin_clk_init);
> +
> +/**
> + * eswin_calc_pll - calculate PLL values
> + * @frac_val: fractional divider
> + * @fbdiv_val: feedback divider
> + * @rate: reference rate
> + *
> + *   Calculate PLL values for frac and fbdiv
> + */
> +static void eswin_calc_pll(u32 *frac_val, u32 *fbdiv_val, u64 rate)
> +{
> +	u32 rem, tmp1 = 0, tmp2 = 0;
> +
> +	rate = rate * 4;
> +	rem = do_div(rate, 1000);
> +	if (rem)
> +		tmp1 = rem;
> +
> +	rem = do_div(rate, 1000);
> +	if (rem)
> +		tmp2 = rem;
> +
> +	rem = do_div(rate, 24);
> +	/* fbdiv = rate * 4 / 24000000 */
> +	*fbdiv_val = rate;
> +	/* frac = rate * 4 % 24000000 * (2 ^ 24) */

I assume the 24 MHz is the parent rate? This function is only used by
clk_pll_set_rate(). Should the parent_rate be passed in as well, and
use that variable instead of hard coding the parent rate?

> +	*frac_val = ((1000 * (1000 * rem + tmp2) + tmp1) << 24) / 24
> +		     / 1000000;
> +}
> +
> +static inline struct eswin_clk_pll *to_pll_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct eswin_clk_pll, hw);
> +}
> +
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct eswin_clk_pll *clk = to_pll_clk(hw);
> +	u32 frac_val, fbdiv_val, val;
> +	int ret;
> +
> +	eswin_calc_pll(&frac_val, &fbdiv_val, (u64)rate);
> +
> +	/* First, disable pll */
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~(((1 << clk->pllen_width) - 1) << clk->pllen_shift);
> +	val |= 0 << clk->pllen_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~(((1 << clk->fbdiv_width) - 1) << clk->fbdiv_shift);
> +	val &= ~(((1 << clk->refdiv_width) - 1) << clk->refdiv_shift);
> +	val |= 1 << clk->refdiv_shift;
> +	val |= fbdiv_val << clk->fbdiv_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	val = readl_relaxed(clk->ctrl_reg1);
> +	val &= ~(((1 << clk->frac_width) - 1) << clk->frac_shift);
> +	val |= frac_val << clk->frac_shift;
> +	writel_relaxed(val, clk->ctrl_reg1);
> +
> +	/* Last, enable pll */
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~(((1 << clk->pllen_width) - 1) << clk->pllen_shift);
> +	val |= 1 << clk->pllen_shift;
> +	writel_relaxed(val, clk->ctrl_reg0);

You can use GENMASK() and FIELD_PREP() to simplify these bitwise
operations.
> +
> +	/* Usually the pll will lock in 50us */
> +	ret = readl_poll_timeout(clk->status_reg, val,
> +				 val & (1 << clk->lock_shift), 1, 50 * 2);
> +	if (ret)
> +		pr_err("failed to lock the pll!\n");
> +
> +	return ret;
> +}
> +
> +static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct eswin_clk_pll *clk = to_pll_clk(hw);
> +	u32 fbdiv_val, frac_val, rem, val;
> +	unsigned long rate;
> +	u64 tmp;
> +
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val = val >> clk->fbdiv_shift;
> +	val &= ((1 << clk->fbdiv_width) - 1);
> +	fbdiv_val = val;
> +
> +	val = readl_relaxed(clk->ctrl_reg1);
> +	val = val >> clk->frac_shift;
> +	val &= ((1 << clk->frac_width) - 1);
> +	frac_val = val;
> +
> +	/* rate = 24000000 * (fbdiv + frac / (2 ^ 24)) / 4 */
> +	tmp = 1000 * frac_val;
> +	rem = do_div(tmp, BIT(24));
> +	if (rem)
> +		rate = (unsigned long)(6000 * (1000 * fbdiv_val + tmp) +
> +				      ((6000 * rem) >> 24) + 1);
> +	else
> +		rate = (unsigned long)(6000 * 1000 * fbdiv_val);
> +
> +	return rate;
> +}
> +
> +static int clk_pll_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct eswin_clk_pll *clk = to_pll_clk(hw);
> +
> +	req->rate = clamp(req->rate, clk->min_rate, clk->max_rate);
> +	req->min_rate = clk->min_rate;
> +	req->max_rate = clk->max_rate;
> +
> +	return 0;
> +}
> +
> +int eswin_clk_register_fixed_rate(struct device *dev,
> +				  struct eswin_fixed_rate_clock *clks,
> +				  int nums, struct eswin_clock_data *data)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk_hw = devm_clk_hw_register_fixed_rate(dev, clks[i].name,
> +							 NULL, clks[i].flags,
> +							 clks[i].rate);
> +		if (IS_ERR(clk_hw))
> +			return PTR_ERR(clk_hw);
> +
> +		clks[i].hw = *clk_hw;
> +		data->clk_data.hws[clks[i].id] = clk_hw;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(eswin_clk_register_fixed_rate);
> +
> +static const struct clk_ops eswin_clk_pll_ops = {
> +	.set_rate = clk_pll_set_rate,
> +	.recalc_rate = clk_pll_recalc_rate,
> +	.determine_rate = clk_pll_determine_rate,
> +};
> +
> +int eswin_clk_register_pll(struct device *dev, struct eswin_pll_clock *clks,
> +			   int nums, struct eswin_clock_data *data)
> +{
> +	struct eswin_clk_pll *p_clk = NULL;
> +	struct clk_init_data init;
> +	struct clk_hw *clk_hw;
> +	int i, ret;
> +
> +	p_clk = devm_kzalloc(dev, sizeof(*p_clk) * nums, GFP_KERNEL);
> +	if (!p_clk)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < nums; i++) {
> +		p_clk->id = clks[i].id;
> +		p_clk->ctrl_reg0 = data->base + clks[i].ctrl_reg0;
> +		p_clk->pllen_shift = clks[i].pllen_shift;
> +		p_clk->pllen_width = clks[i].pllen_width;
> +		p_clk->refdiv_shift = clks[i].refdiv_shift;
> +		p_clk->refdiv_width = clks[i].refdiv_width;
> +		p_clk->fbdiv_shift = clks[i].fbdiv_shift;
> +		p_clk->fbdiv_width = clks[i].fbdiv_width;
> +
> +		p_clk->ctrl_reg1 = data->base + clks[i].ctrl_reg1;
> +		p_clk->frac_shift = clks[i].frac_shift;
> +		p_clk->frac_width = clks[i].frac_width;
> +
> +		p_clk->ctrl_reg2 = data->base + clks[i].ctrl_reg2;
> +		p_clk->postdiv1_shift = clks[i].postdiv1_shift;
> +		p_clk->postdiv1_width = clks[i].postdiv1_width;
> +		p_clk->postdiv2_shift = clks[i].postdiv2_shift;
> +		p_clk->postdiv2_width = clks[i].postdiv2_width;

Are these postdiv[12]_* members actually used anywhere? 

Brian

