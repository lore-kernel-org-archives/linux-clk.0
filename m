Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C94974EE869
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 16:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563754; cv=none; b=N8xMm+1EZ+SV+fWEXJZKu7v8Ku7vkzkd7faXv95hmnwspAtI8PilkXO3qZBAYFvkzcxdrvcT39owMtt9kjzO1n5JW0JtyJRPp9rfsMUhqed1n21R0qhavOaPjbYJrZjRvDEDqjrIpfFoScKzPmhpd2d17C7zVCm789VVFBoRtbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563754; c=relaxed/simple;
	bh=xzv9srNKau9QTm0+BVYd1p9jfOptiwQ8hJqbnIEu1ag=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=nu0wBOQ8DOsHRAxhXBiz4MO/1swBORuLzJ4flYI9h0WwVoO36O1/AGh8Youb6cYZ4JZluxkm5E67dtIn2J59hnZPPvcRHHHMaAwHYjOFY31jX/l/YMxq2RBSB2FqpGDBxxqLB/Ux+lA8gFtjGzPrdDhwzmpKR8YInsngPHMvBWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XjunLH8M; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XjunLH8M"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1923f15afso453325e9.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 09:35:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791563748; x=1792168548; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OR0B7gxjQXP7SQsiz6aV3vPuWAutmo5psfSXuZCrJdw=;
        b=XjunLH8MLDA7ajpTfYbPndutCDgjZywUlYdcbcYLkhiVxZtxDCoejR6ooedX7f36Hp
         1Cce9dDfVJrSr1HdtzDETriILG9hY9WSYQQGKR1SYQ41Cou+0UfLP9dvPWl+VJigUf9v
         IwaNCdn7h/7EgAOxx30CbmSqqidN1aQFLWUH6mV5tu3PkYzSxsb5mRXOIsrnzLVV/CPt
         ZPYgDLR925LCkpSTL9Fuc7tEj/fkH8z1EM6h4azt/uBBPqfi6ExkA5FUPOQ/uNuPOZRm
         UPGbgzYa1HIEVSW4kUikKOw/siTwygkauLhb9C7XDqvnRmpcKwJk+seHsGrMCwd15Ttg
         e7AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791563748; x=1792168548;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OR0B7gxjQXP7SQsiz6aV3vPuWAutmo5psfSXuZCrJdw=;
        b=LZXoPHdVRzWh2yGT9Ey+rqOFnpEXyeQ/LERxSKpVMyYCmCpqQuVT8OPG7CuUWzAhnN
         8+4zhwMHsw8s+efiFsgQZlTrUtiM5trC1VQHZJBSbMnIP+wQHt7GPsOUqCY1r2wBqkzG
         03iat0fMrSlz9bt8F++5Mlh1p8x03X/zSg8jS2j+rE+Bb7M8iFGFc6F5O9pcmYJ9CpjI
         71WOA9f5Q2Vm69EPsLIx3Nj1F0vZ3cQxdkZNeLk40HDN6Urg1khAO0AF5haRKu1Xv7bW
         0kLmEGVKbPyJISE8O1kEjmYPuvg62vtbMyY/AKizuH1TU1HKOVA4C+z7M8fl+F8JKHY3
         zKKA==
X-Forwarded-Encrypted: i=1; AKwUvBw8pJdgmokqfTxEjQg+XxEuXM4NeyJfBPNhNlBJdxAl6V31EQ7z2BB+MRgJp2uYvDFavvE3jy/QR6I=@vger.kernel.org
X-Gm-Message-State: AFuF++kkZh60HUpVVqQwqbAM5vBpTvEIdW2FEZOxn6QgF4zNeAQsBEZM
	+1co/QSnd8EjVaFlWGXyHuvVtXu0rRCdBaSfPkEnPU5XbYClHpSJxKlFu88Q1nVdI4caHC5WdA0
	q/9OrjNfRdQ==
X-Gm-Gg: AYBFou3xbn6oTilmqTKpuioewH6qyhjUF1Xc5lZZ7L2UmoRoYpg0jeyHLhxcuREdaNX
	rWuyYQwCDp222n+N3oCKsBLjLXya5puTxq3CPGl0YFi4YhZRTHSqbN6ufpINbRi9YnZ2L70EPyK
	a9ZEfF1/ragLtCrfXPc4rA71EB2HpX4IjyeWrXfDYbmxW/HL0t/EY4ByQUqjatKOXku/fdORyao
	LoN/jQWLcO6SaUy/xXEvNBD/p/SwZxZfCRl8CLg3fDP7Z54ltxbHgExiH6dnImSDbXAzCK0rxMF
	zcesQIYcqLTI5OaHJKphlFwHKe4X5Zq46NQKzyfOYFAvxwdaVA5i1Rb3cLXCOZgVoQo8dORg0Cw
	/db+FEEtCNY9WCpokl6bGnNkuTQ4uMn3I4DN/1aorPr/BR13gyCvYLlfIgAdix0fvxWs46Lc47Z
	egBlRL3PqUsFuekLesXkzzJ9Iyt1+bXUBAqSO21Mf9kV1PURGZRXbbYJVMdaC7hz//eijvkp4zK
	KYiedq0JmcXyNhvXw==
X-Received: by 2002:a05:600c:1c21:b0:49c:cee0:f383 with SMTP id 5b1f17b1804b1-4a18e4b6241mr55388775e9.16.1791563747862;
        Fri, 09 Oct 2026 09:35:47 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18eb4485dsm105678505e9.2.2026.10.09.09.35.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 09:35:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct
 formula instead of divider table
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: sboyd@kernel.org, ychuang3@nuvoton.com, schung@nuvoton.com, 
 yclu4@nuvoton.com, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20261008064307.2757324-2-a0987203069@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
 <20261008064307.2757324-2-a0987203069@gmail.com>
Date: Fri, 09 Oct 2026 18:35:25 +0200
Message-Id: <179156372588.266328.3848259565001346041.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3913; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=xzv9srNKau9QTm0+BVYd1p9jfOptiwQ8hJqbnIEu1ag=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknxa9oVTKL1DDcnNHJUbsxhyX63p9tu7xNUk72fLzCt
 GjzZubzHaUsDGJcDLJiiiw13NXi7yS1vsyarnMbZg4rE8gQBi5OAZjIiv8M/4uzg8JbXP7rHJwz
 Se2iTZTq8cuHD7rn7GE73Cft3nVJMpXhf/lC0fW5d6+8KpBJash7IDtlVcG55gONT641Xu8XWii
 RzwcA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),

Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?

 * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
 *	Formula is 2 * (value read from hardware + 1)

Am wondering if this driver is necessary at all ? Can you just use the
regular divider here ?

> which was previously modeled by building a clk_div_table with one entry per
> possible divider value (up to 2^width entries) and feeding it through the
> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
> helpers. That is unnecessary overhead (a large table allocation and a
> linear scan on every rate lookup) for a relationship with a simple
> closed-form expression, so compute the rate directly instead.
> 
> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
> OR'd an arbitrary bit into the divider register on every set_rate() call,
> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
> rather than a bit index, so BIT() shifted by an out-of-range amount, which
> is undefined behavior. The divider field write already clears and rewrites
> only its own bits, so no extra forced bit is needed.
> 
> Select the divider with a single helper shared by determine_rate() and
> set_rate(), using closest rounding as before, so the rate promised by
> determine_rate() is the rate that set_rate() programs. The helper clamps
> the divider to the valid range and avoids overflowing 2 * rate for very
> large requested rates, which would otherwise lead to a division by zero.
> Reject a rate of 0 with -EINVAL.
> 
> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> Signed-off-by: Joey Lu <a0987203069@gmail.com>
>
> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> index e992e7c30341..12a946c989e9 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
>  	void __iomem *reg;
>  	u8 shift;
>  	u8 width;
> -	u32 mask;
> -	const struct clk_div_table *table;
>  	/* protects concurrent access to clock divider registers */
>  	spinlock_t *lock;
>  };
> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
>  
>  static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
>  {
> -	unsigned int val;
>  	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +	unsigned int val;
>  
>  	val = readl_relaxed(dclk->reg) >> dclk->shift;
>  	val &= clk_div_mask(dclk->width);
> -	val += 1;
> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
> +
> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
> +}
> +
> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
> +					  unsigned long parent_rate,
> +					  unsigned long rate)
> +{
> +	unsigned long max = clk_div_mask(dclk->width) + 1;
> +	unsigned long val;
> +
> +	if (rate > parent_rate / 2)
> +		return 1;
> +
> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
> +
> +	return clamp(val, 1UL, max);
>  }
>  
>  static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
>  					struct clk_rate_request *req)
>  {
>  	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> +	unsigned int val;
>  
> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
> -				      CLK_DIVIDER_ROUND_CLOSEST);
> +	if (!req->rate)
> +		return -EINVAL;
> +
> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);

Rate propagation support is lost with this.

-- 
Jerome

