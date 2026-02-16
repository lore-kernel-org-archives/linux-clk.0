Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FB9292B2E
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 17:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771262238; cv=none; b=NrKXPQ2cOclJNdjhxjiTOrjZCgXzGNuxkF03OJD8FwR1exy+OBrTBafrHyHeQXNQnllPS+4k6v+9pITGNsdg5QlMp+VoJ7pmdkxqK9jV//Gxd6AR/Mn5XcNce/CkSIqWcY8jVyHVEOkrJO8wlBsj00nhQke1VcpupyTmknqbU5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771262238; c=relaxed/simple;
	bh=ljyJejsDCTeFe7l6Bsim939+HPUbbNGjGpHbaJTRpjA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wi45IJVe+QE9IZUlpmInAkLx9g91/1klTaDgLXV1+JWbuGhhDw5v49902p1m1DTB9w55ecXgBVu6Lzjf5xL868d+1XEcFgZqevzKn7D2sHprfBiAmxeKITkhb0jbP+TlNYJy2Lmta3NoUs+zfdp5Bku/cWHkPXZkA0jrWBJXIlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gU4wNcdd; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=U/2mW9lA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gU4wNcdd";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="U/2mW9lA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771262235;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/BV5BrY8bTAWZzYh4SQAs5ed7dyoi8SAO4pF+5Qq8qo=;
	b=gU4wNcddz1WFTagDPI5xYCPMwa8jA0mkxvQKcvnhmSooDQXPRk43iZ+wSlqYzXJUWU8UPi
	YJs705ri5AjIN2U2qTcXzghY6Mo7yZYfNvzJJ+9NJglR/JAqrOCxvFvPa+u0GHtmnxhfgW
	dnh2iaXYLpGmrASU+96eor36ukPepXk=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-437-u2Vl09tqMGi2WCnv2nsWwg-1; Mon, 16 Feb 2026 12:17:13 -0500
X-MC-Unique: u2Vl09tqMGi2WCnv2nsWwg-1
X-Mimecast-MFC-AGG-ID: u2Vl09tqMGi2WCnv2nsWwg_1771262233
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c71500f274so356302185a.1
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 09:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771262233; x=1771867033; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/BV5BrY8bTAWZzYh4SQAs5ed7dyoi8SAO4pF+5Qq8qo=;
        b=U/2mW9lAJk+n769QGwNf2a0HzhZs14VAisEKQEVLcB71eqXlgX2ss5s5P5J0WfOH8A
         LB+y5f7QvwgJJCRk1+fhtIGjLVR1AlkyuwllSPC5llu4jeRZof4LrWmcSLnUon4yofQ3
         GWXm/xoxglEETAFimI3lURFY8sdY3KPtmJCwRSB4QfAnUq2YS4akYQ5HnlpbhX7Mn8Am
         Sn1c5hDs95ey6OeX8Ydro6IuYI0S/7yoVQCE7p/ZlbusIEZYFU4uzFTt3X2yp8pLeb2g
         MsOHSvOKMiRkZHXlGN86JdT+7CxAYf3cph+ysSN7wefEF2zqivVkGgWPYS8FF10Z7/P1
         A30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771262233; x=1771867033;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/BV5BrY8bTAWZzYh4SQAs5ed7dyoi8SAO4pF+5Qq8qo=;
        b=nIrKtUOpzbCDAs6PXaUUlqDK6nyexl4bYzjaiI9NqJiJVf6Nmf4F5XhXi/K1g1Uj3/
         V2b8OO9UWIn5L/w7PTwtvKOTD8QXp42CiQAnjOojnmvWx5lkVT5QKEc6UmB8KkEqJ1hG
         O3CNyMCTJXjVbwj5UMmjlhhHwbirfMBqQ/1kUd8rQqE0skAkHZYStcd4h+vaezT/Dn5J
         W3wjR6REvNGf04ZQ0k10KJlMLUYFMXiV5WKvC8tr/6LHbZZho5lETf5Cl1Ff0YEN2QOb
         I8S4BEYpUmorE5d4MF7I1QasNqfBWBc+LcVHVKqS/9F5SmBB1RCl9+tr3jBMNLjzb6Fc
         JP3w==
X-Forwarded-Encrypted: i=1; AJvYcCVOsevQcn32yh7SEQR953X5PxzU3ugcqCximN2GzUkXEq7LtA0cvXDW92iPpFFafZ/QO4EQgKIUQxM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxEELmDmqbPC1u5uPoc3w5XIR5C1k6tXJEgOCFp5QAuz+ydg1u
	IRAQJVhc8v4M490Za9drdo5s7YXFjgWAqM74yeDLGiMiI2NFas3vQiyJf/KoR9D3qNRBoHqTRiT
	Qu7Bru6PDnv6/OMQM29nEFXxRmHo+17r/FkTXNby7kh96zPJ8swgNFUpvNFHJYA==
X-Gm-Gg: AZuq6aJefTMPpfx2x/RSJ87OePdi2ZI3IKBTI72V13HU6l5j5VWb8dNgjdePoipy8sa
	+EqNmOMbNtrN+fOllAYGvh3RP0Hmau5WPIHV0QOBSWTB05gXiVfCYdg5+InxlqLy3jAkOruxTp0
	8IUlcgI4BmPIEYvVFsvmpsz39CiOwI40A+iiNgQYPGB6uUeAkp2vZJ5i2FgWz+hhAjlTQoriHtD
	N/R2CMIWeHuYXg4Bwo/4y9tTesZSGjnpybAR4eu2T5Ph5gXhG7tdw/xNMpUYHqdyTizpLoJ1kdQ
	dKKle0zjDUvBs835oWY21DS8dERYycv18pa9Ool9rdLKnY8I/00kVeF5U2gVmhjYEwMNCuqMslq
	Pnzzd3TgAAp8z20FtbpRlwm1Eh96PBfPoiQDXsZlVwdb/MZTMaa371FId
X-Received: by 2002:a05:620a:4888:b0:8cb:4128:ec3c with SMTP id af79cd13be357-8cb424afc08mr1313487185a.64.1771262233085;
        Mon, 16 Feb 2026 09:17:13 -0800 (PST)
X-Received: by 2002:a05:620a:4888:b0:8cb:4128:ec3c with SMTP id af79cd13be357-8cb424afc08mr1313479985a.64.1771262232352;
        Mon, 16 Feb 2026 09:17:12 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cb2b1c7d7csm1335808385a.27.2026.02.16.09.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Feb 2026 09:17:11 -0800 (PST)
Date: Mon, 16 Feb 2026 12:17:09 -0500
From: Brian Masney <bmasney@redhat.com>
To: dongxuyang@eswincomputing.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	troy.mitchell@linux.dev, ningyu@eswincomputing.com,
	linmin@eswincomputing.com, huangyifeng@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, ganboing@gmail.com,
	marcel@ziswiler.com
Subject: Re: [PATCH v13 2/3] clk: eswin: Add eic7700 clock driver
Message-ID: <aZNRFYs_QuGRI8PV@redhat.com>
References: <20260214101421.228-1-dongxuyang@eswincomputing.com>
 <20260214101519.341-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260214101519.341-1-dongxuyang@eswincomputing.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Xuyang,

On Sat, Feb 14, 2026 at 06:15:19PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
> 
> Add clock drivers for the EIC7700 SoC. The clock controller on the ESWIN
> EIC7700 provides various clocks to different IP blocks within the SoC.
> 
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Can Marcel retest the new version since some of the logic related to the
parent rate changed in the new version? It's probably still fine, however
it's good to be sure.

I have some other minor comments / questions below.

[snip]

> +static int eic7700_clk_probe(struct platform_device *pdev)
> +{
> +	struct eswin_clock_data *clk_data;
> +	struct device *dev = &pdev->dev;
> +	struct clk *pll_clk;
> +	int ret;
> +
> +	clk_data = eswin_clk_init(pdev, EIC7700_NR_CLKS);
> +	if (!clk_data)
> +		return dev_err_probe(dev, -EAGAIN, "failed to get clk data!\n");

Change eswin_clk_init() to return an error code, and return that instead
of -EAGAIN. I have more details below inside this function.

> +
> +	ret = eswin_clk_register_fixed_rate(dev, eic7700_fixed_rate_clks,
> +					    ARRAY_SIZE(eic7700_fixed_rate_clks),
> +					    clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register fixed rate clock\n");
> +
> +	ret = eswin_clk_register_pll(dev, eic7700_pll_clks,
> +				     ARRAY_SIZE(eic7700_pll_clks),
> +				     clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register pll clock\n");
> +
> +	pll_clk = devm_clk_hw_get_clk(dev, &eic7700_pll_clks[1].hw,
> +				      "clk_pll_cpu");
> +	if (IS_ERR(pll_clk))
> +		return dev_err_probe(dev, PTR_ERR(pll_clk),
> +				     "failed to get clk_pll_cpu\n");
> +
> +	clk_data->pll_nb.notifier_call = eic7700_clk_pll_cpu_notifier_cb;
> +	ret = devm_clk_notifier_register(dev, pll_clk, &clk_data->pll_nb);
> +	if (ret)
> +		return ret;
> +
> +	ret = eswin_clk_register_fixed_factor(dev, eic7700_factor_clks,
> +					      ARRAY_SIZE(eic7700_factor_clks),
> +					      clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register fixed factor clock\n");
> +
> +	ret = eswin_clk_register_divider(dev, eic7700_div_clks,
> +					 ARRAY_SIZE(eic7700_div_clks),
> +					 clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register divider clock\n");
> +
> +	ret = eswin_clk_register_gate(dev, eic7700_gate_clks,
> +				      ARRAY_SIZE(eic7700_gate_clks), clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register gate clock\n");
> +
> +	ret = eswin_clk_register_clks(dev, eic7700_early_clks,
> +				      ARRAY_SIZE(eic7700_early_clks), clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register clock\n");
> +
> +	ret = eswin_clk_register_mux(dev, eic7700_mux_clks,
> +				     ARRAY_SIZE(eic7700_mux_clks), clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret,
> +				     "failed to register mux clock\n");
> +
> +	ret = eswin_clk_register_clks(dev, eic7700_clks,
> +				      ARRAY_SIZE(eic7700_clks), clk_data);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "failed to register clock\n");
> +
> +	return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> +					   &clk_data->clk_data);
> +}
> +
> +static const struct of_device_id eic7700_clock_dt_ids[] = {
> +	{ .compatible = "eswin,eic7700-clock", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, eic7700_clock_dt_ids);
> +
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
> +MODULE_DESCRIPTION("ESWIN EIC7700 clock controller driver");

MODULE_ALIAS("platform:eic7700-clk")

> diff --git a/drivers/clk/eswin/clk.c b/drivers/clk/eswin/clk.c
> new file mode 100644
> index 000000000000..7d9678c00c3d
> --- /dev/null
> +++ b/drivers/clk/eswin/clk.c
> @@ -0,0 +1,591 @@
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
> +#include <linux/delay.h>
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
uu> +#define PLL_POSTDIV1_MASK	GENMASK(10, 8)
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
> +		return NULL;
> +
> +	eclk_data->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(eclk_data->base)) {
> +		dev_err(&pdev->dev, "failed to map clock registers\n");
> +		return NULL;

The error code is dropped here. Later, when eswin_clk_init() is called,
it will return -EAGAIN. Just return an error in this function. You can
return -ENOMEM above.

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
> + * @parent_rate: parent rate
> + *
> + *   Calculate PLL values for frac and fbdiv
> + */
> +static void eswin_calc_pll(u32 *frac_val, u32 *fbdiv_val, unsigned long rate,
> +			   unsigned long parent_rate)
> +{
> +	u32 rem, tmp1 = 0, tmp2 = 0, tmp_p;
> +	u64 tmp;
> +
> +	/* fbdiv = rate * 4 / parent_rate */
> +	tmp = rate * 4;
> +	tmp_p = parent_rate;
> +
> +	do_div(tmp, tmp_p);
> +
> +	*fbdiv_val = (u32)tmp;
> +
> +	/* frac = rate * 4 % parent_rate * (2 ^ 24) */
> +	tmp = rate * 4;
> +	rem = do_div(tmp, 1000);
> +	if (rem)
> +		tmp1 = rem;
> +
> +	rem = do_div(tmp, 1000);
> +	if (rem)
> +		tmp2 = rem;
> +
> +	rem = do_div(tmp, 24);
> +	tmp = (u64)(1000 * (1000 * rem + tmp2) + tmp1) << 24;
> +	do_div(tmp, tmp_p);
> +
> +	*frac_val = (u32)tmp;

Would it be possible to document in more detail what's going on with
these formulas?

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
> +	u32 frac_val, fbdiv_val, val, mask;
> +	int ret;
> +
> +	eswin_calc_pll(&frac_val, &fbdiv_val, rate, parent_rate);
> +
> +	/* First, disable pll */
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~PLL_EN_MASK;
> +	val |= FIELD_PREP(PLL_EN_MASK, 0);
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~(PLL_REFDIV_MASK | PLL_FBDIV_MASK);
> +	val |= FIELD_PREP(PLL_FBDIV_MASK, fbdiv_val);
> +	val |= FIELD_PREP(PLL_REFDIV_MASK, 1);
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	val = readl_relaxed(clk->ctrl_reg1);
> +	val &= ~PLL_FRAC_MASK;
> +	val |= FIELD_PREP(PLL_FRAC_MASK, frac_val);
> +	writel_relaxed(val, clk->ctrl_reg1);
> +
> +	val = readl_relaxed(clk->ctrl_reg2);
> +	val &= ~(PLL_POSTDIV1_MASK | PLL_POSTDIV2_MASK);
> +	val |= FIELD_PREP(PLL_POSTDIV1_MASK, 1);
> +	val |= FIELD_PREP(PLL_POSTDIV2_MASK, 1);
> +	writel_relaxed(val, clk->ctrl_reg2);
> +
> +	/* Last, enable pll */
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= ~PLL_EN_MASK;
> +	val |= FIELD_PREP(PLL_EN_MASK, 1);
> +	writel_relaxed(val, clk->ctrl_reg0);
> +
> +	/* Usually the pll will lock in 50us */
> +	mask = GENMASK(clk->lock_shift + clk->lock_width - 1, clk->lock_shift);
> +	ret = readl_poll_timeout(clk->status_reg, val, val & mask, 1, 50 * 2);
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
> +	u64 fbdiv_val, frac_val, tmp;
> +	u32 rem, val;
> +
> +	val = readl_relaxed(clk->ctrl_reg0);
> +	val &= PLL_FBDIV_MASK;
> +	fbdiv_val = (val >> clk->fbdiv_shift);
> +
> +	val = readl_relaxed(clk->ctrl_reg1);
> +	val &= PLL_FRAC_MASK;
> +	frac_val = (val >> clk->frac_shift);
> +
> +	/* rate = 24000000 * (fbdiv + frac / (2 ^ 24)) / 4 */
> +	tmp = parent_rate * frac_val;
> +	rem = do_div(tmp, BIT(24));
> +	if (rem)
> +		tmp = parent_rate * fbdiv_val + tmp + 1;
> +	else
> +		tmp = parent_rate * fbdiv_val + tmp;
> +
> +	do_div(tmp, 4);
> +
> +	return tmp;
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
> +		p_clk->fbdiv_shift = clks[i].fbdiv_shift;
> +
> +		p_clk->ctrl_reg1 = data->base + clks[i].ctrl_reg1;
> +		p_clk->frac_shift = clks[i].frac_shift;
> +
> +		p_clk->ctrl_reg2 = data->base + clks[i].ctrl_reg2;
> +
> +		p_clk->status_reg = data->base + clks[i].status_reg;
> +		p_clk->lock_shift = clks[i].lock_shift;
> +		p_clk->lock_width = clks[i].lock_width;
> +
> +		p_clk->max_rate = clks[i].max_rate;
> +		p_clk->min_rate = clks[i].min_rate;
> +
> +		init.name = clks[i].name;
> +		init.flags = 0;
> +		init.parent_data = clks[i].parent_data;
> +		init.num_parents = 1;
> +		init.ops = &eswin_clk_pll_ops;
> +		p_clk->hw.init = &init;
> +
> +		clk_hw = &p_clk->hw;
> +
> +		ret = devm_clk_hw_register(dev, clk_hw);
> +		if (ret)
> +			return ret;
> +
> +		clks[i].hw = *clk_hw;
> +		data->clk_data.hws[clks[i].id] = clk_hw;
> +		p_clk++;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(eswin_clk_register_pll);
> +
> +int eswin_clk_register_fixed_factor(struct device *dev,
> +				    struct eswin_fixed_factor_clock *clks,
> +				    int nums, struct eswin_clock_data *data)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk_hw = devm_clk_hw_register_fixed_factor_index
> +				(dev, clks[i].name, clks[i].parent_data->index,
> +				clks[i].flags, clks[i].mult, clks[i].div);
> +
> +		if (IS_ERR(clk_hw))
> +			return PTR_ERR(clk_hw);
> +
> +		clks[i].hw = *clk_hw;
> +		data->clk_data.hws[clks[i].id] = clk_hw;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(eswin_clk_register_fixed_factor);
> +
> +int eswin_clk_register_mux(struct device *dev, struct eswin_mux_clock *clks,
> +			   int nums, struct eswin_clock_data *data)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk_hw = devm_clk_hw_register_mux_parent_data_table
> +				(dev, clks[i].name, clks[i].parent_data,
> +				clks[i].num_parents, clks[i].flags,
> +				data->base + clks[i].offset, clks[i].shift,
> +				clks[i].width, clks[i].mux_flags, clks[i].table,
> +				&data->lock);
> +
> +		if (IS_ERR(clk_hw))
> +			return PTR_ERR(clk_hw);
> +
> +		clks[i].hw = *clk_hw;
> +		data->clk_data.hws[clks[i].id] = clk_hw;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(eswin_clk_register_mux);
> +
> +static unsigned int _eswin_get_val(unsigned int div, unsigned long flags,
> +				   u8 width)
> +{
> +	unsigned int maxdiv;
> +
> +	maxdiv = clk_div_mask(width);
> +	div = div > maxdiv ? maxdiv : div;
> +
> +	if (flags & ESWIN_PRIV_DIV_MIN_2)
> +		return (div < 2) ? 2 : div;
> +
> +	return div;
> +}
> +
> +static unsigned int eswin_div_get_val(unsigned long rate,
> +				      unsigned long parent_rate, u8 width,
> +				      unsigned long flags)
> +{
> +	unsigned int div;
> +
> +	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
> +
> +	return _eswin_get_val(div, flags, width);
> +}
> +
> +static inline struct eswin_divider_clock *to_div_clk(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct eswin_divider_clock, hw);
> +}
> +
> +static int clk_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct eswin_divider_clock *dclk = to_div_clk(hw);
> +	unsigned long flags = 0;

No need to initialize flags.

> +	unsigned int value;
> +	u32 val;
> +
> +	value = eswin_div_get_val(rate, parent_rate, dclk->width,
> +				  dclk->priv_flag);
> +
> +	spin_lock_irqsave(dclk->lock, flags);
> +
> +	val = readl_relaxed(dclk->reg);
> +	val &= ~(clk_div_mask(dclk->width) << dclk->shift);
> +	val |= (u32)value << dclk->shift;
> +	writel_relaxed(val, dclk->reg);
> +
> +	spin_unlock_irqrestore(dclk->lock, flags);
> +
> +	return 0;
> +}
> +
> +static unsigned long clk_div_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct eswin_divider_clock *dclk = to_div_clk(hw);
> +	unsigned int div, val;
> +
> +	val = readl_relaxed(dclk->reg) >> dclk->shift;
> +	val &= clk_div_mask(dclk->width);
> +	div = _eswin_get_val(val, dclk->priv_flag, dclk->width);
> +
> +	return DIV_ROUND_UP_ULL((u64)parent_rate, div);
> +}
> +
> +static int eswin_clk_bestdiv(unsigned long rate,
> +			     unsigned long best_parent_rate, u8 width,
> +			     unsigned long flags)
> +{
> +	unsigned long bestdiv, up_rate, down_rate;
> +	int up, down;
> +
> +	if (!rate)
> +		rate = 1;
> +
> +	/* closest round */
> +	up = DIV_ROUND_UP_ULL((u64)best_parent_rate, rate);
> +	down = best_parent_rate / rate;
> +
> +	up_rate = DIV_ROUND_UP_ULL((u64)best_parent_rate, up);
> +	down_rate = DIV_ROUND_UP_ULL((u64)best_parent_rate, down);
> +
> +	bestdiv = (rate - up_rate) <= (down_rate - rate) ? up : down;
> +
> +	return bestdiv;
> +}
> +
> +static int clk_div_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct eswin_divider_clock *dclk = to_div_clk(hw);
> +	int div;
> +
> +	div = eswin_clk_bestdiv(req->rate, req->best_parent_rate, dclk->width,
> +				dclk->priv_flag);
> +	div = _eswin_get_val(div, dclk->priv_flag, dclk->width);
> +	req->rate = DIV_ROUND_UP_ULL((u64)req->best_parent_rate, div);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops eswin_clk_div_ops = {
> +	.set_rate = clk_div_set_rate,
> +	.recalc_rate = clk_div_recalc_rate,
> +	.determine_rate = clk_div_determine_rate,
> +};
> +
> +struct clk_hw *eswin_register_clkdiv(struct device *dev, unsigned int id,
> +				     const char *name,
> +				     const struct clk_hw *parent_hw,
> +				     unsigned long flags, void __iomem *reg,
> +				     u8 shift, u8 width,
> +				     unsigned long clk_divider_flags,
> +				     unsigned long priv_flag, spinlock_t *lock)
> +{
> +	struct eswin_divider_clock *dclk;
> +	struct clk_init_data init;
> +	struct clk_hw *clk_hw;
> +	int ret;
> +
> +	dclk = devm_kzalloc(dev, sizeof(*dclk), GFP_KERNEL);
> +	if (!dclk)
> +		return ERR_PTR(-ENOMEM);
> +
> +	init.name = name;
> +	init.ops = &eswin_clk_div_ops;
> +	init.flags = flags;
> +	init.parent_hws = &parent_hw;
> +	init.num_parents = 1;
> +
> +	/* struct clk_divider assignments */
> +	dclk->id = id;
> +	dclk->reg = reg;
> +	dclk->shift = shift;
> +	dclk->width = width;
> +	dclk->div_flags = clk_divider_flags;
> +	dclk->priv_flag = priv_flag;
> +	dclk->lock = lock;
> +	dclk->hw.init = &init;
> +
> +	/* register the clock */
> +	clk_hw = &dclk->hw;
> +	ret = devm_clk_hw_register(dev, clk_hw);
> +	if (ret) {
> +		dev_err(dev, "failed to register divider clock!\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	return clk_hw;
> +}
> +EXPORT_SYMBOL_GPL(eswin_register_clkdiv);
> +
> +int eswin_clk_register_divider(struct device *dev,
> +			       struct eswin_divider_clock *clks,
> +			       int nums, struct eswin_clock_data *data)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk_hw = clk_hw_register_divider_parent_data
> +				(dev, clks[i].name, clks[i].parent_data,
> +				clks[i].flags, data->base + clks[i].offset,
> +				clks[i].shift, clks[i].width, clks[i].div_flags,
> +				&data->lock);
> +
> +		if (IS_ERR(clk_hw)) {
> +			while (i--)
> +				clk_hw_unregister_divider
> +					(data->clk_data.hws[clks[i].id]);

All of the other places you are using the devm_ variant to automate the
cleanup, such as devm_clk_hw_register_gate_parent_data(),
devm_clk_hw_register_mux_parent_data_table(), and 
devm_clk_hw_register_divider_parent_hw(). What do you think about adding
a devm_clk_hw_register_divider_parent_data() for consistency?

> +			return PTR_ERR(clk_hw);
> +		}
> +
> +		clks[i].hw = *clk_hw;
> +		data->clk_data.hws[clks[i].id] = clk_hw;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(eswin_clk_register_divider);
> +
> +int eswin_clk_register_gate(struct device *dev, struct eswin_gate_clock *clks,
> +			    int nums, struct eswin_clock_data *data)
> +{
> +	struct clk_hw *clk_hw;
> +	int i;
> +
> +	for (i = 0; i < nums; i++) {
> +		clk_hw = devm_clk_hw_register_gate_parent_data
> +				(dev, clks[i].name, clks[i].parent_data,
> +				clks[i].flags, data->base + clks[i].offset,
> +				clks[i].bit_idx, clks[i].gate_flags,
> +				&data->lock);
> +
> +		if (IS_ERR(clk_hw))
> +			return PTR_ERR(clk_hw);
> +
> +		clks[i].hw = *clk_hw;
> +		data->clk_data.hws[clks[i].id] = clk_hw;
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(eswin_clk_register_gate);
> +
> +int eswin_clk_register_clks(struct device *dev, struct eswin_clk_info *clks,
> +			    int nums, struct eswin_clock_data *data)
> +{
> +	struct eswin_clk_info *info;
> +	const struct clk_hw *phw = NULL;
> +	struct clk_hw *hw;
> +	int i;
> +
> +	for (i = 0; i < nums; i++) {
> +		info = &clks[i];
> +		switch (info->type) {
> +		case CLK_FIXED_FACTOR: {
> +			const struct eswin_fixed_factor_clock *factor;
> +
> +			factor = &info->data.factor;
> +			phw = data->clk_data.hws[info->pid];
> +			hw = devm_clk_hw_register_fixed_factor_parent_hw
> +					(dev, factor->name, phw, factor->flags,
> +					factor->mult, factor->div);
> +			break;
> +		}
> +		case CLK_MUX: {
> +			const struct eswin_mux_clock *mux = &info->data.mux;
> +
> +			hw = devm_clk_hw_register_mux_parent_data_table
> +				(dev, mux->name, mux->parent_data,
> +				mux->num_parents, mux->flags,
> +				data->base + mux->offset, mux->shift,
> +				mux->width, mux->mux_flags, mux->table,
> +				&data->lock);
> +			break;
> +		}
> +		case CLK_DIVIDER: {
> +			const struct eswin_divider_clock *div = &info->data.div;
> +
> +			phw = data->clk_data.hws[info->pid];
> +			if (div->priv_flag)
> +				hw = eswin_register_clkdiv
> +				(dev, div->id, div->name, phw,
> +				div->flags, data->base + div->offset,
> +				div->shift, div->width, div->div_flags,
> +				div->priv_flag, &data->lock);

You can now go out to 100 characters for the line lengths instead of 80, however,
I'm not sure how Stephen feels about that. Personally I think it'd make this
block, plus some others in this series a bit cleaner. Taking into account the
current indentation, this block could become this with 100 characters as the max:

    hw = eswin_register_clkdiv(dev, div->id, div->name, phw,
                               div->flags, data->base + div->offset,
                               div->shift, div->width, div->div_flags,
                               div->priv_flag, &data->lock);

Brian

