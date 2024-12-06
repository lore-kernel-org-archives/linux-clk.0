Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DCC1714DF
	for <linux-clk@vger.kernel.org>; Fri,  6 Dec 2024 20:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733516898; cv=none; b=qJKrGz1blCXFYoAKK4toAx4xdN4hHaGpzDLA/c3VTU6VLD33XZ/vDwDmMcUCNguVo3X9+K05os3HXP5sVU97o9IInKQEI3fU8Ng9t7UFtmHh+09D5xqtjVdGIG6SQzB2SDZzsgFh/h4fI6HKoScO6bIrXZSfrihfyqLxeUwPzi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733516898; c=relaxed/simple;
	bh=BwakpNluTynsNNSAFGekdUFcnrj8QO9XmxqzY/IkSxk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BefC2UnzhAQNwDpcynViX6mZibpnCzCplau6OgVubeI95oRvcf5mLeY//+i6+zz/nz4546rtIqHt0qcmWESDo0JeqfCrapytrNvA5wjUYN5JYXHnPfPX6Ji8tsT84wtyDRm1qRwDy0QkAvNn+kbZrOt56PLqq9/SC4pO4kToedo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z2cuIrSp; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z2cuIrSp"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-385e1fcb0e1so1352691f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 06 Dec 2024 12:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733516895; x=1734121695; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NQaVE4xma2mfyf9DwEGfyp+l3xlEQFu3UABAOXDY/f0=;
        b=z2cuIrSp+8eZvWg94gMGQaeykK7e8zZ4y5JwC2e35/4mWnX1Q9n49cU5+G+VPPk/da
         NNDAKixylATtc9feCFpEwQi9dc1S5ud1brANGJCndRpPtzPlpOBjBz6b05HWRBXsdlDr
         xoQwxeYGwHpl7DWYqv7rbf2UjBdLHBT3mj5PdCL7N93vuASqULx5u6kB9v8YF4KZd/DL
         UblTLK50nMQ1S9l3snPaITbj+NrqCcpx9wkWgjGp3iySpkXtIis+5b+j5j5BMXIGPOAV
         xSZLm4B8e2VRjlSgeT3Xc7JVVetOJhoIV1w7AlsEhoTf0+N1kLFq032bOEb1Tk4xytI/
         I53g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733516895; x=1734121695;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NQaVE4xma2mfyf9DwEGfyp+l3xlEQFu3UABAOXDY/f0=;
        b=X3dS9L5dHFxt4M7RPeKuu42A2jlhXCA0pzGu4HIin1HSuOyRp/mnUfxSJ8n4kSXftU
         V2kzYrGYUxk4ir0pmgxQFxx19lsocPtRVpFBoby0ifSjsAdiuJupjqIG5zQ/V9lDQX2B
         o4PVk5sGLWXziXKQgMCDajWCpA17/Bum9MaGex1Wv4pxwkYrhr4fPOGyN45cNk4SD5dy
         OG8KLzIQbqDECXpOlfcSvT6vWpcIM/543BMRgxoLWGZmEUjfoFMytE4MvyKnoIllKj/M
         cX3mK3tAJPw1X0DFZIXvuphtsK5Kr/q0qm1vypr+BRTRvzNVdXK1N/y+DwHDR9VVQDip
         mlRg==
X-Forwarded-Encrypted: i=1; AJvYcCWaUHHeXe7FX3FNrSOPqoztOQ2UfgNydtcTIoymlmxEnNhxyDpIAY+9/IeRKwiOynuTTTF0udj8s94=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXnHRvECLWT+ej5IBOjvwUvjeA5SGPp5uvFTghBhlCqwx+H/0
	TJjgJdufAZGe7py0Atm1O21jsMAsG8ulbya5S1ziYQwnruu9+chMRdFKRltk+7g=
X-Gm-Gg: ASbGncvnX6b2axNBpUYGHXsK5J16LRqz5D8WBBXS0tI4C0CfdQggV5y80XCmuQyuh0k
	NRX7iv1lYKBlYS3EWhrM7D4Y97TwDdu/GOIqALy7a4zLXWsMPzFUDoVj41mB0ioysvkBAQ3GGSe
	6AwFjvNXRmRZFxa/Bor/uHEYqtGLfRhpGTn5yQ7d00TgfA3DuSr+qQ9ZlsP9/OCOlDclu1jDIKv
	gUKNIu7eEDji+xZhFgJeA9Jxea/9+M6ncXPpdt5ze7XvnWpUnqoWU0=
X-Google-Smtp-Source: AGHT+IGekqBUH4G61NmWpwsXhLA6y8516RqskqF/tq8JR1N/a6IKQ5CbI54DTrqFonQGIY9zzCX1sg==
X-Received: by 2002:a5d:5f8c:0:b0:385:f38e:c0c3 with SMTP id ffacd0b85a97d-3862b33eda1mr3932008f8f.6.1733516895327;
        Fri, 06 Dec 2024 12:28:15 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434da0d26a3sm67425945e9.1.2024.12.06.12.28.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 12:28:14 -0800 (PST)
Date: Fri, 6 Dec 2024 23:28:11 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Etienne Carriere <etienne.carriere@foss.st.com>
Cc: linux-kernel@vger.kernel.org, Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 2/2] firmware: arm_scmi: round rate bisecting in
 discrete rates
Message-ID: <7fe840af-d56d-4cb6-8d82-d42631409b2a@stanley.mountain>
References: <20241203173908.3148794-1-etienne.carriere@foss.st.com>
 <20241203173908.3148794-3-etienne.carriere@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241203173908.3148794-3-etienne.carriere@foss.st.com>

On Tue, Dec 03, 2024 at 06:39:08PM +0100, Etienne Carriere wrote:
> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
> index 09ccd6cea7f2..7bbb2ee55f4f 100644
> --- a/drivers/clk/clk-scmi.c
> +++ b/drivers/clk/clk-scmi.c
> @@ -61,13 +61,20 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>  	struct scmi_clk *clk = to_scmi_clk(hw);
>  
>  	/*
> -	 * We can't figure out what rate it will be, so just return the
> +	 * In case we can't figure out what rate it will be when the clock
> +	 * describes a list of discrete rates, then just return the
>  	 * rate back to the caller. scmi_clk_recalc_rate() will be called
>  	 * after the rate is set and we'll know what rate the clock is
>  	 * running at then.
>  	 */
> -	if (clk->info->rate_discrete)
> +	if (clk->info->rate_discrete) {
> +		ftmp = rate;

No need for this assignment.

> +		if (scmi_proto_clk_ops->round_rate &&
> +		    !scmi_proto_clk_ops->round_rate(clk->ph, clk->id, &ftmp))
> +			return ftmp;
> +
>  		return rate;
> +	}
>  
>  	fmin = clk->info->range.min_rate;
>  	fmax = clk->info->range.max_rate;

regards,
dan carpenter
