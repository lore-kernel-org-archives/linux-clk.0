Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A6D2EAB61;
	Tue, 30 Dec 2025 12:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767097211; cv=none; b=YNpFYnDDGIi0BnaenvI88IQM/WEz1kyY1gTASLK/B8gK0psczt42D/r+TKrfTJLO0VUrxwYE5HAhEDmjt84k2MEFSYm0XullalcJvqsKVwHdjuQZdjsHTu8/KSzNWpNCXNO7URxocR4OgmMRQ/YU2pQ6gOdqSSZnpkEz8Y0DYI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767097211; c=relaxed/simple;
	bh=GzM9LAv+4l4o0RsOQvLN+xzNsfCmn6d4XXQejr7byp4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HY4bknCjA1HwLmZttIJVAADyKRtNmda+1NHAk3xMKIQx8keve6LUmI777BAI1Y1g6FPaLng88nzdEl53l9LJdi6EN4mSZuB5fNToLT49xGrWaN1b31QMIuyX3E8Ck23rfRy8vUPGdFWl3CfwrNioB9zOLADzbkbW3sc91l54lqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=htKKXLUX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="htKKXLUX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A99AC4CEFB;
	Tue, 30 Dec 2025 12:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767097208;
	bh=GzM9LAv+4l4o0RsOQvLN+xzNsfCmn6d4XXQejr7byp4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=htKKXLUXk1Ejwc1zUZTE4jedwlDR+AJ+gUFeTnDeyP0lWhHaoLCm8+2Gnp7lW0SiY
	 GbDJijLq4I5aqJywpMAaJGAnbZ812TwN7jx2EIdL2q2d6krBe9QBKOLReUzLD9yEP4
	 4znxpdx+aeT3+dBzF2VxEZUhQgWPsoyFJiFjfz4MUP7os3rDB8sOoD7R4wfjViWZLh
	 I8ax3+RDkpgtrsrR9hpIfPFvl+vWM3nWfIop+NOqpghktJXwFTQe7EzK8PHcoPueWo
	 YLJRWLiuQJN8C5wXjXo8/vGvsOrtOzIXOrdjjXZI+oT/s59xiQIEc/nBqPZOT4EKb7
	 OPe7qYz2xV4sQ==
Date: Tue, 30 Dec 2025 13:20:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, cylee12@realtek.com, 
	jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, james.tai@realtek.com, cy.huang@realtek.com, 
	stanley_chang@realtek.com
Subject: Re: [PATCH 2/9] clk: realtek: Add basic reset support
Message-ID: <20251230-impetuous-quizzical-locust-daffda@quoll>
References: <20251229075313.27254-1-eleanor.lin@realtek.com>
 <20251229075313.27254-3-eleanor.lin@realtek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229075313.27254-3-eleanor.lin@realtek.com>

On Mon, Dec 29, 2025 at 03:53:06PM +0800, Yu-Chun Lin wrote:
> +
> +int rtk_reset_controller_add(struct device *dev,
> +			     struct rtk_reset_initdata *initdata)
> +{
> +	struct rtk_reset_data *data;
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +

What sort of coding style do you use? There is absolutely never a blank
line between kzalloc and the if().

> +	if (!data)
> +		return -ENOMEM;
> +
> +	data->dev = dev;
> +	data->num_banks = initdata->num_banks;
> +	data->banks = initdata->banks;
> +	data->regmap = initdata->regmap;
> +	data->rcdev.owner = THIS_MODULE;

THIS_MODULE? so which module is exactly the owner - clk-rtk.ko or actual
driver?

This feels buggy, but I did not check your Makefile.

> +	data->rcdev.ops = &rtk_reset_ops;
> +	data->rcdev.dev = dev;
> +	data->rcdev.of_node = dev->of_node;
> +	data->rcdev.nr_resets = initdata->num_banks * 0x100;
> +	data->rcdev.of_xlate = rtk_of_reset_xlate;
> +	data->rcdev.of_reset_n_cells = 1;
> +
> +	return devm_reset_controller_register(dev, &data->rcdev);
> +}
> +EXPORT_SYMBOL_GPL(rtk_reset_controller_add);
> +
> diff --git a/drivers/clk/realtek/reset.h b/drivers/clk/realtek/reset.h
> new file mode 100644
> index 000000000000..cd446b098429
> --- /dev/null
> +++ b/drivers/clk/realtek/reset.h
> @@ -0,0 +1,36 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2019 Realtek Semiconductor Corporation

Ah, so that's why you sent probe() from ~10 years ago...

Best regards,
Krzysztof

