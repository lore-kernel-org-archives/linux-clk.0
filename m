Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B7E318EF6
	for <linux-clk@vger.kernel.org>; Fri,  3 Apr 2026 14:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775226893; cv=none; b=ksD3JTqVe/6fz8B+Tei1ct7g/0lgm1qeRcGtx564Y2YPoEAsI6/YCxX6S0HcntoZreP5m7z24HEHwphEvhHhejNgxIZXliQMGGudCz6pCW6NsKqq170s0Mkm8QXUfbu9JXd4uwTvteY6KEd0XKdJWPnss6PWr4ivf6vISuwI1mE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775226893; c=relaxed/simple;
	bh=7lETszO2TcBPuE8qBti4VGMJRow2riST5KFUx5uY85M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ucm7qgzMOmOoB1YnkFmQHg8GUzYGq7Z1/vlmb5u8K/9Lb7C7QIqsEjkQErDRn9Dp2aRwyld37bT65o8aH/VAevFnN4spqePxsWeOyo75+LTmh5R4sUOGePVTF+vgpzfiKKBOrlr1Zf/JoLb2GvcAZXsJyI8qlKIgGBVI54MDi34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HqHeGHXf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=TDiDcLdV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HqHeGHXf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="TDiDcLdV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775226889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
	b=HqHeGHXfKgTAkiosxWisGPo7GV8d+cWdwxotsqQhz3StIZ8hx3OVUombUZ6dwkRQcvw02A
	Gha3RiZRiuwXTdnYxvFlZ+FBd9QorezNJbdJPkLxr6b/GnQPDKXcZUP/64146eX+QsgXsB
	N+NFT2f16M95/8cFycXjuxHfKQuggjM=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-aNDyqMPHMPG-_tRmtF9Yvw-1; Fri, 03 Apr 2026 10:34:48 -0400
X-MC-Unique: aNDyqMPHMPG-_tRmtF9Yvw-1
X-Mimecast-MFC-AGG-ID: aNDyqMPHMPG-_tRmtF9Yvw_1775226888
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-89463017976so50514946d6.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Apr 2026 07:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775226888; x=1775831688; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
        b=TDiDcLdVHmfGzVDa78w2BG3jQoQHRIJvAKrnT71S42PNb58VLmFF/V82REDAV72qyx
         PCZhe1mVYCXfwFhfipcdKHLJY7AxuqHjuhzYyAMCh/y9lXXgniqF7tzK33V2GtoYDi1X
         4EKMW4ki+EL37YuPEfPxTbSpLIWSWZ8D5luX+NAwN8QlN/3+hgOyPh8aCDdvFw3d2x5F
         gcC6byyAblJIv7m3AO+LDPDNSOHunKkxUtaLG6W5Vo1q3j0zJc9CoymoQGqZTgdJCC68
         GO49FkPBJlS44Zr/x47DcSijzFu514f9J2BQaM/o4tlulsl1w7sMmPXZXd3KmKea159A
         wlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775226888; x=1775831688;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mfQkfXvruFLjBEtgSvUk56xdMUuIiWCjbR168BWqGQ8=;
        b=By6xRhTVowf7yB5R+BLaZvic1GH32kVMlDsmaZ159YsBZkpV1LWqQdVxY1jBR3yXGA
         zMfpIlGliOZvpyjiQoqkQ6hRUV1/C4uOVXfpEbZnDKsMF6bkItWIBUcfBQygL3Y19ZN4
         x8Kvjj7Lsv7QxtLlIj2NI/lFAj54gVR03SJixs6Uqar/eS4j3CsldInV+/x90iwuN82j
         UuR5odocNSxWp/5o48+l27397IHshSjUniM3Kcivi2OE/3QWIPUA5SZK1sQfZh+s9uyF
         FwdMR41v7HQ6gsCeGpM1HPn9XGwymVRPrOcpjM06LRezn27/oKieEa/sk2kZwmTYR/8D
         1XNQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDsMyLN3B8ORPq56DG8r9cfkAPnwfsTdE43/cj8c+TLAujlU/M+Ar29Gat6v8dzGu5kswt7v5U3EE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXQefgGgNMWAfkZIt1XpT7bW3sEf8nU7Y9Wkzrl1uiYg+l4PW
	C/yaghpc+bQCi4x1/hbeGHv/RPc/x4IkXFu8jRUC0RbY4M38+Ztsk34OvCuxsBDbv7SJrGZCMHI
	ahXjDkFaz5OtdPuy1XE5G5Gp/iMDa9/eph1k50m1mG8Fc0vs9+8PD6ano/G0oUw==
X-Gm-Gg: ATEYQzyb89vB53i9MRxq/i8EMN48Z74Ch6DtsBmSMHAG8tIChVrhjUZ9mSU1RPg4agU
	6cotB75jUpdggoARpL6E78i9ebMo5445dth9SEzAC81b8tDqJmhIqsS/rbRmATavKAGhAcgFyXC
	j/20JAcCGIb0VQrlveIl9kkI8WGDlQp4eMRAZ/GyGj2kCLWIs3DE2eS6uDyUTWCZaA+SfQtJIAe
	yY/u2VetyDK2VXHkEPuWyl2RD/cf1jzCEa2MHG6h3n7z2g33yd6G1J3GMALocGinH47B84B15QJ
	BZHAy3/pPwwuLjt9WzJcxLweXHlMY/jlcYgE2VbYaJow3fydlCImB6VDCqpcgLk53Pd6QhTlG1m
	jMEno4wUMBHVHakbACg/xa78alZAula3Ov7yNEWFLYG+3mlOGTT77/0pR
X-Received: by 2002:a05:620a:4402:b0:8cf:e946:b2d4 with SMTP id af79cd13be357-8d41c2b913bmr448642485a.69.1775226888124;
        Fri, 03 Apr 2026 07:34:48 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:8cf:e946:b2d4 with SMTP id af79cd13be357-8d41c2b913bmr448634385a.69.1775226887456;
        Fri, 03 Apr 2026 07:34:47 -0700 (PDT)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8d2a8c29f17sm456198385a.42.2026.04.03.07.34.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 07:34:46 -0700 (PDT)
Date: Fri, 3 Apr 2026 10:34:44 -0400
From: Brian Masney <bmasney@redhat.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org, james.tai@realtek.com,
	cy.huang@realtek.com, stanley_chang@realtek.com
Subject: Re: [PATCH v6 04/10] clk: realtek: Add support for phase locked
 loops (PLLs)
Message-ID: <ac_QBGY8VxcvuVlY@redhat.com>
References: <20260402073957.2742459-1-eleanor.lin@realtek.com>
 <20260402073957.2742459-5-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402073957.2742459-5-eleanor.lin@realtek.com>
User-Agent: Mutt/2.3.0 (2026-01-25)

Hi Cheng-Yu,

On Thu, Apr 02, 2026 at 03:39:51PM +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Provide a full set of PLL operations for programmable PLLs and a read-only
> variant for fixed or hardware-managed PLLs.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v6:
> - Add the headers used in c file to follow the "Include What You Use" principle.
> - Move to_clk_pll() from clk-pll.h to clk-pll.c to limit its scope.
> ---
>  drivers/clk/realtek/Makefile     |   2 +
>  drivers/clk/realtek/clk-pll.c    | 164 +++++++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-pll.h    |  42 ++++++++
>  drivers/clk/realtek/freq_table.c |  36 +++++++
>  drivers/clk/realtek/freq_table.h |  21 ++++
>  5 files changed, 265 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-pll.c
>  create mode 100644 drivers/clk/realtek/clk-pll.h
>  create mode 100644 drivers/clk/realtek/freq_table.c
>  create mode 100644 drivers/clk/realtek/freq_table.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 377ec776ee47..a89ad77993e9 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,3 +2,5 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += common.o
> +clk-rtk-y += clk-pll.o
> +clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-pll.c b/drivers/clk/realtek/clk-pll.c
> new file mode 100644
> index 000000000000..44730b22a94c
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.c
> @@ -0,0 +1,164 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2024 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/regmap.h>
> +#include "clk-pll.h"
> +
> +#define TIMEOUT 2000
> +
> +static inline struct clk_pll *to_clk_pll(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clkr = to_clk_regmap(hw);
> +
> +	return container_of(clkr, struct clk_pll, clkr);
> +}
> +
> +static int wait_freq_ready(struct clk_pll *clkp)
> +{
> +	u32 pollval;
> +
> +	if (!clkp->freq_ready_valid)
> +		return 0;
> +
> +	return regmap_read_poll_timeout_atomic(clkp->clkr.regmap, clkp->freq_ready_reg, pollval,
> +						(pollval & clkp->freq_ready_mask)
> +						== clkp->freq_ready_val, 0, TIMEOUT);

I would put the "(pollval & clkp->freq_ready_mask) == clkp->freq_ready_val" on
the same line to improve readability. You can go out to 100 characters.

Also should the delay be greater than 0 to avoid tons of constant
retries?

> +}
> +
> +static bool is_power_on(struct clk_pll *clkp)
> +{
> +	u32 val;
> +
> +	if (!clkp->power_reg)
> +		return true;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->power_reg, &val))
> +		return true;

Is the intention if there is an error, then it marks it as success?

> +
> +	return (val & clkp->power_mask) == clkp->power_val_on;
> +}
> +
> +static void clk_pll_disable(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +
> +	if (!clkp->seq_power_off)
> +		return;
> +
> +	regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_off,
> +			       clkp->num_seq_power_off);
> +}
> +
> +static int clk_pll_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +
> +	return is_power_on(clkp);
> +}
> +
> +static int clk_pll_determine_rate(struct clk_hw *hw,
> +				  struct clk_rate_request *req)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *ftblv = NULL;
> +
> +	ftblv = ftbl_find_by_rate(clkp->freq_tbl, req->rate);
> +	if (!ftblv)
> +		return -EINVAL;
> +
> +	req->rate = ftblv->rate;
> +	return 0;

Add newline before return.

> +}
> +
> +static unsigned long clk_pll_recalc_rate(struct clk_hw *hw,
> +					 unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	u32 freq_val;
> +
> +	if (regmap_read(clkp->clkr.regmap, clkp->freq_reg, &freq_val))
> +		return 0;
> +
> +	freq_val &= clkp->freq_mask;
> +
> +	fv = ftbl_find_by_val_with_mask(clkp->freq_tbl, clkp->freq_mask,
> +					freq_val);
> +	return fv ? fv->rate : 0;

Add newline before return.

> +}
> +
> +static int clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> +			    unsigned long parent_rate)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	const struct freq_table *fv;
> +	int ret;
> +
> +	fv = ftbl_find_by_rate(clkp->freq_tbl, rate);
> +	if (!fv || fv->rate != rate)
> +		return -EINVAL;
> +
> +	if (clkp->seq_pre_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_pre_set_freq,
> +					     clkp->num_seq_pre_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = regmap_update_bits(clkp->clkr.regmap, clkp->freq_reg,
> +				 clkp->freq_mask, fv->val);
> +	if (ret)
> +		return ret;
> +
> +	if (clkp->seq_post_set_freq) {
> +		ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_post_set_freq,
> +					     clkp->num_seq_post_set_freq);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	if (is_power_on(clkp)) {
> +		ret = wait_freq_ready(clkp);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static int clk_pll_enable(struct clk_hw *hw)
> +{
> +	struct clk_pll *clkp = to_clk_pll(hw);
> +	int ret;
> +
> +	if (!clkp->seq_power_on)
> +		return 0;
> +
> +	if (is_power_on(clkp))
> +		return 0;
> +
> +	ret = regmap_multi_reg_write(clkp->clkr.regmap, clkp->seq_power_on,
> +				     clkp->num_seq_power_on);
> +	if (ret)
> +		return ret;
> +
> +	return wait_freq_ready(clkp);
> +}
> +
> +const struct clk_ops rtk_clk_pll_ops = {
> +	.enable         = clk_pll_enable,
> +	.disable        = clk_pll_disable,
> +	.is_enabled     = clk_pll_is_enabled,
> +	.recalc_rate    = clk_pll_recalc_rate,
> +	.determine_rate = clk_pll_determine_rate,
> +	.set_rate       = clk_pll_set_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ops, "REALTEK_CLK");
> +
> +const struct clk_ops rtk_clk_pll_ro_ops = {
> +	.recalc_rate = clk_pll_recalc_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_pll_ro_ops, "REALTEK_CLK");
> diff --git a/drivers/clk/realtek/clk-pll.h b/drivers/clk/realtek/clk-pll.h
> new file mode 100644
> index 000000000000..00884585a242
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-pll.h
> @@ -0,0 +1,42 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2019 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_PLL_H
> +#define __CLK_REALTEK_CLK_PLL_H
> +
> +#include "common.h"
> +#include "freq_table.h"
> +
> +struct reg_sequence;
> +
> +struct clk_pll {
> +	struct clk_regmap clkr;
> +	const struct reg_sequence *seq_power_on;
> +	u32 num_seq_power_on;
> +	const struct reg_sequence *seq_power_off;
> +	u32 num_seq_power_off;
> +	const struct reg_sequence *seq_pre_set_freq;
> +	u32 num_seq_pre_set_freq;
> +	const struct reg_sequence *seq_post_set_freq;
> +	u32 num_seq_post_set_freq;
> +	const struct freq_table *freq_tbl;
> +	u32 freq_reg;
> +	u32 freq_mask;
> +	u32 freq_ready_valid;
> +	u32 freq_ready_mask;
> +	u32 freq_ready_reg;
> +	u32 freq_ready_val;
> +	u32 power_reg;
> +	u32 power_mask;
> +	u32 power_val_on;
> +};
> +
> +#define __clk_pll_hw(_ptr)  __clk_regmap_hw(&(_ptr)->clkr)
> +
> +extern const struct clk_ops rtk_clk_pll_ops;
> +extern const struct clk_ops rtk_clk_pll_ro_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_PLL_H */
> diff --git a/drivers/clk/realtek/freq_table.c b/drivers/clk/realtek/freq_table.c
> new file mode 100644
> index 000000000000..272a10e75a54
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.c
> @@ -0,0 +1,36 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +
> +#include <linux/bitops.h>
> +#include "freq_table.h"
> +
> +const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
> +					   unsigned long rate)
> +{
> +	unsigned long best_rate = 0;
> +	const struct freq_table *best = NULL;

Put variables in reverse Christmas tree order.

> +
> +	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
> +		if (ftbl->rate == rate)
> +			return ftbl;
> +
> +		if (ftbl->rate > rate)
> +			continue;
> +
> +		if (ftbl->rate > best_rate) {
> +			best_rate = ftbl->rate;
> +			best = ftbl;
> +		}
> +	}
> +
> +	return best;
> +}
> +
> +const struct freq_table *
> +ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value)
> +{
> +	for (; !IS_FREQ_TABLE_END(ftbl); ftbl++) {
> +		if ((ftbl->val & mask) == (value & mask))
> +			return ftbl;
> +	}
> +	return NULL;
> +};
> diff --git a/drivers/clk/realtek/freq_table.h b/drivers/clk/realtek/freq_table.h
> new file mode 100644
> index 000000000000..6d9116651105
> --- /dev/null
> +++ b/drivers/clk/realtek/freq_table.h
> @@ -0,0 +1,21 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +
> +struct freq_table {
> +	u32 val;
> +	unsigned long rate;
> +};
> +
> +/* ofs check */
> +#define CLK_OFS_INVALID        -1
> +#define CLK_OFS_IS_VALID(_ofs) ((_ofs) != CLK_OFS_INVALID)

Is this used anywhere?

Brian


> +
> +#define FREQ_TABLE_END    \
> +	{                 \
> +		.rate = 0 \
> +	}
> +#define IS_FREQ_TABLE_END(_f) ((_f)->rate == 0)
> +
> +const struct freq_table *ftbl_find_by_rate(const struct freq_table *ftbl,
> +					   unsigned long rate);
> +const struct freq_table *
> +ftbl_find_by_val_with_mask(const struct freq_table *ftbl, u32 mask, u32 value);
> -- 
> 2.34.1
> 

