Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7A1CAA81;
	Wed, 22 Jan 2025 22:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737586692; cv=none; b=VXBpGMMJiQys27QqKDyZspAGOWQb7GzxvXBVR2hb0wOSpjNMudPD1dOhak8KUKKsKwpbxcfaTItOxrWZZ0IwG9Tx+D7KjR1eDL9wKXAN5hLFP0XsRi360tGDq8z516bwrSoaGiQXDmi7Ujljyw6aWeyAsPbX51svvt2jr0qB6E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737586692; c=relaxed/simple;
	bh=XnI1poJQc8O5qaUJnfVt25oXI1SQjL+/Lx12G7Eytt8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N2PlayVkZqimrvZwJhlkUH+OHDsHR/zTDAhx9qnV402KpUrNm9gweBHmXRQvnzFdnssjAwkFleXeB/mW4B3UhLZu96tsDldcxOwy+IZHqjN+JJeJ+241qYr3ygRZ+I5DSegm6kaC0tbxHeSZq+0LRRnkZ7AuulxQZHvU01DbpxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hu8OJGBH; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hu8OJGBH"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-436341f575fso2912545e9.1;
        Wed, 22 Jan 2025 14:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737586687; x=1738191487; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jqVF0cBTijRuq0m7GTGEM8FFP9eJBtgNqw9jRV9T5lo=;
        b=Hu8OJGBH7SbgHKVSaVYP0hhXBxXiE0vEqLt+KOp0cN0T7p/fzGMmLDzrLrG6UBqSQp
         YadJt0OIVyKF7kPZTE6l80ZpwSjciZbW1H76Rs62AjRch5aF8fVzql5oZ7NndzQuk8n4
         ObnASvgXoI8qrYoA1vjCWpWjbvrEYohDbvC/DVOWahwRB7fCOxR80BafpBQQQV9TnFUb
         D2wE4iOIHI2AeSlIa8Er7pWmtgevt2pRKkf0owXDA0n3+EmUHO5Ie6KsuwXx6IsJ4nUE
         WBDe4/qAIW+qTohN86lhLTxx5gr2iZu83CLZd3U0HzOaeRoz+/ZntOwTSUABkpuMHX7/
         caBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737586687; x=1738191487;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jqVF0cBTijRuq0m7GTGEM8FFP9eJBtgNqw9jRV9T5lo=;
        b=SxDpAZLH3fa1is3WH/J5essGYUT4RGdxXfMoa5mgog/WiZ+LQv+iaS0CHRRxsNNBnL
         3o/yeHL4pol9nnD0sW3A0Siy6RJCSGbPo0sxw34EiaOwG9YuiNSVFKzQ3fGlRP2bxjo0
         Rmwjuj168UIzaQW3DiyRTapEmCPTv4CWqSuyN/VDewgK96CElsAEYOH+mpqpR+F5ntA8
         dXSWZtA4mbXa7dMlE52UijQUhfQiMVZCEJWfB+yqrGd4g5mwzV5Qj3nqVIqFMzQaqSjd
         eDVsrDslLy+QRrak0jRTS+bFuJuJE9mBA791aIKB5DsNjUhvH43BdKPo1TSaPlqyURDf
         cZ4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUYm1NateH1fLHEyLM3WHfa3PVj0UkdikIFUDrNJpsLGxQJ9kTcOkETx1USSU0j+gB0jzggukoNPs3UZ0WZ@vger.kernel.org, AJvYcCWPUI6Hy5eHuzXfzGbyhUCueAiu+oNU/qR6KEqFul4SwxHk6xVbhWBtEtsB5Xdv14bdk1i8f274gT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjU2rrlMRh4AlGiwhmDBcTol+s5GR6F2s2/OsnqqlR65dj6iTZ
	lag84wxYWcvxqbXOr4CJQsnb0/2Ge1l354S+HArquKyQ5ot6SV3o
X-Gm-Gg: ASbGncscJaekPGY4dCjdNsG2TuwGPcxGVv/90na50FoHmfvIKdpil3AkPQbpr+Axvq6
	84iMGrg4SMLiNOYvCWA2xf+CsyrsQVoY6ni0j8gJdq4mUBgTik4D5+7aEWjImmTjsBkkzJPr1H6
	W+4Bmvk/eLVkm+ZQAwKE3pc4GvcROyYaMi2HCIyw7YZlD7e6s6mSk2PqCKo8ziP+uek4BkrUVeC
	TA+KqN1jMHW1RixvUOlDqTrPeG3Zqn32+J+sCwQUdqLCXJcvMj0U/K82ZPJ1e45w5Hvw1KW43Iu
	i2gpTLf+pDm2OWLhvRDL5rbAqjNjIyxD
X-Google-Smtp-Source: AGHT+IEQnQhWcYcYLwtPUsp3QOoc70eLrq7vJCaIVuPYRH/ywGliFi/4zTlOAPB9XOacsMLy93f4rg==
X-Received: by 2002:a05:6000:1f88:b0:385:fd31:ca23 with SMTP id ffacd0b85a97d-38bf57a7797mr24374385f8f.40.1737586687462;
        Wed, 22 Jan 2025 14:58:07 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31df412sm40115765e9.36.2025.01.22.14.58.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2025 14:58:06 -0800 (PST)
Date: Wed, 22 Jan 2025 22:58:05 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Anastasia Belova <abelova@astralinux.ru>
Cc: Emilio =?UTF-8?B?TMOzcGV6?= <emilio@elopez.com.ar>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai
 <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland
 <samuel@sholland.org>, Hans de Goede <hdegoede@redhat.com>, Maxime Ripard
 <mripard@kernel.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] clk: sunxi: add explicit casting to prevent overflow
Message-ID: <20250122225805.2ba6a062@pumpkin>
In-Reply-To: <20250120084719.63116-1-abelova@astralinux.ru>
References: <20250120084719.63116-1-abelova@astralinux.ru>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 20 Jan 2025 11:47:16 +0300
Anastasia Belova <abelova@astralinux.ru> wrote:

> If n = 255, the result of multiplication of n and 24000000
> may not fit int type. Add explicit casting to prevent overflow.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.

You need to read and understand the code before writing any patches.
The '>> p' and '/ (m + 1)' are both just conditional 'divide by 2'.
So can be done before the multiply.
Since req->rate is 'signed long' and the value is a frequency it is
only just possible that it exceeds 31 bits (and will be wrong on 32bit
builds - but sun-9 might be 64bit only?)

In any case it would be sensible to force an unsigned divide.
So perhaps:
	unsigned int n = DIV_ROUND_UP(req->rate, 6000000ul);
	...
	req->rate = ((24000000ul >> p) / (m + 1)) * n;

David

> 
> Fixes: 6424e0aeebc4 ("clk: sunxi: rewrite sun9i_a80_get_pll4_factors()")
> Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
> ---
>  drivers/clk/sunxi/clk-sun9i-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/sunxi/clk-sun9i-core.c b/drivers/clk/sunxi/clk-sun9i-core.c
> index d93c7a53c6c0..70fbd7390d96 100644
> --- a/drivers/clk/sunxi/clk-sun9i-core.c
> +++ b/drivers/clk/sunxi/clk-sun9i-core.c
> @@ -50,7 +50,7 @@ static void sun9i_a80_get_pll4_factors(struct factors_request *req)
>  	else if (n < 12)
>  		n = 12;
>  
> -	req->rate = ((24000000 * n) >> p) / (m + 1);
> +	req->rate = ((24000000ULL * n) >> p) / (m + 1);
>  	req->n = n;
>  	req->m = m;
>  	req->p = p;

