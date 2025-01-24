Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F028C4120B
	for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2025 13:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737726690; cv=none; b=BlSg23P37SEci1PhgN6KSHS6qfrJCzWZCXcUQSkv4p17Te2nGgt0N0VrHNZj//rpPIqFxe9s+ADLoXqZW/7+iVPNC/obWJAsjkxJ+M6YZi5t1PCsXU3VlBcSrlZba7FVixR1Bh/lIRPSHQ2Rc3QkQsr/8C8y6QvtHqDktKF49lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737726690; c=relaxed/simple;
	bh=pJFaFR/cdHX84EYRD0FIV+VAe/KBfCM9byCxxPK0kf8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MBxRyfLqnDDEBpnS5S/mrSssovbBJCvBUckNUla4ZVVMbEg8LdUzjR5XiqkURb1mey7NA7umxK3ICGw/5foPrKYVQ4+/XbZlcmbc6/pmHHV3DGByoRv4ISlfaHxZ+Y9REREyPqnKGz0X9os1CSYZTQbVGSOvf6pMIe6JU4SizvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IJYkyAmf; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IJYkyAmf"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-436249df846so14326285e9.3
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2025 05:51:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737726686; x=1738331486; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=;
        b=IJYkyAmfIOiE8BDleNLE7IuupEbjUaO3d7eMIuH17vzbYi3DzG2/jDB9fGulbvKSNn
         8EGMglPQmfyRSug3vpU3Zt5cxO06zUAyTUU5UBjcTSpzOYnEaWeYujq2YxMcfO2LHfim
         KsOaUTsa0A/VzQkAd5uNIjPSn3UH5yaMbq2f+FW20Bgdk+bAQaplhjMrFZtHlw2sNemm
         pcbmVs/eFT59/tfD5PutgQ9mzIrVnIqkkry2g54vVddN5bl2lCGxONz3zKGDolpZ7+bA
         lD5y0TfANsUFryE3XkWL+/eKBhyYqYIJeLlx491ccC/brBABnSNQs9VTQYqmtTTEw29+
         0jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737726686; x=1738331486;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zKRrbe6gGWiSaBV4mplOTEhtmjTYcRZx77kHNzgfO9s=;
        b=L00bbczTw/qNWkL9tONhjJNGBphBWrKx/GffjZyxJ0PI3+OPER9Kw1qTwUJ3xH6Pub
         Q9h82ujPA249+aSllaGiSRaNK00Nd6NaJCjnT3fO0ysRH4QpGfunkGotGp9UPOzbWY1d
         +scriwaaGlH2tcDvQ3I8dd+SdpaeFw86sTdXFxELiqqGVm7/JoJQspvZlnLqSX1oZ7A1
         qP3H4OgUch8SQ4bK+H87mRo2ADsWIV1JUDtOdaAHH5WDrTwoPmWrYOlRI7yC9kWqKE8b
         rbLJjAGxPCKd4kTbbHqkqZJgAtAs1bdbya7gIUrPBB4rouHVRvuz7iOPnWpEX0tnWHuR
         M4fA==
X-Forwarded-Encrypted: i=1; AJvYcCVxDriefgEuqhFHOlAfeZoDEooP2ng4gAZbKk4UV628XaSlkrkCDsWd8bVaMYxZ6HzpQjR28zjbpMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzuAeIIxZvqEjut1/xbPMnofR/xF8bWo5RU5OmvaIPEH3+sqvJs
	8RmWA/gNZ2rcdmhFTDPhwsucISkK4kHvhlfKpU4Y56e9lGEM7R0oO60p+coGxlI=
X-Gm-Gg: ASbGncuZVL1KMkn/M52b41Py1R7hAnIcD0svzHOkKUnRxw5WiwYwyV+aRCoflk71w98
	0b/RSdKeHeMEpevyef96T2iOCGW1Q3iBXCLpL1XX09mqTNUHKn8JQ3jUB+jU8Noz1RRWXHIBFGN
	sDVtyB0S3URanbuu1dLUypbMDGpZoA3JpQAYQmGP7PuBkjNRIjKNnDtmpcKO2w2gIousR0L4MHS
	4NXVBeBDzKp6xy+6mZnJRNUs1eAZPovgRJCoI3i9wOS7kWB27idsUR++dITX6rVQIjO4q/mOj6L
	fO2HEOh1WA==
X-Google-Smtp-Source: AGHT+IETFMJJrZWr/EDBakUelIAVIlOvrzgYZmGp+ZA18dqs2i5tih8sUMHw8uH4sD7esRtqKjCpXw==
X-Received: by 2002:a05:600c:3585:b0:434:f297:8e85 with SMTP id 5b1f17b1804b1-438913d5da1mr323417065e9.10.1737726686177;
        Fri, 24 Jan 2025 05:51:26 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd485007sm27717805e9.12.2025.01.24.05.51.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2025 05:51:25 -0800 (PST)
Date: Fri, 24 Jan 2025 16:51:22 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 1/3] clk: Introduce clk_set_spread_spectrum
Message-ID: <f83759b4-8e8a-4497-b032-341c8538c293@stanley.mountain>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
 <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250124-clk-ssc-v1-1-2d39f6baf2af@nxp.com>

On Fri, Jan 24, 2025 at 10:25:17PM +0800, Peng Fan (OSS) wrote:
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index cf7720b9172ff223d86227aad144e15375ddfd86..a4fe4a60f839244b736e3c2751eeb38dc4577b1f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2790,6 +2790,45 @@ int clk_set_max_rate(struct clk *clk, unsigned long rate)
>  }
>  EXPORT_SYMBOL_GPL(clk_set_max_rate);
>  
> +int clk_set_spread_spectrum(struct clk *clk, unsigned int modfreq,
> +			    unsigned int spreadpercent, unsigned int method,
> +			    bool enable)
> +{
> +	struct clk_spread_spectrum clk_ss;
> +	struct clk_core *core;
> +	int ret = 0;
> +
> +	if (!clk || !clk->core)
> +		return 0;
> +
> +	clk_ss.modfreq = modfreq;
> +	clk_ss.spreadpercent = spreadpercent;
> +	clk_ss.method = method;
> +	clk_ss.enable = enable;
> +
> +	clk_prepare_lock();
> +
> +	core = clk->core;
> +
> +	if (core->prepare_count) {
> +		ret = -EBUSY;
> +		goto fail;

fail is too vague to be useful as a name.  Also this should be
goto unlock;

> +	}
> +
> +	ret = clk_pm_runtime_get(core);
> +	if (ret)
> +		goto fail;
> +
> +	if (core->ops->set_spread_spectrum)
> +		ret = core->ops->set_spread_spectrum(core->hw, &clk_ss);
> +
> +	clk_pm_runtime_put(core);
unlock:

> +	clk_prepare_unlock();
> +fail:
> +	return ret;
> +}

regards,
dan carpenter

