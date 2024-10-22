Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0630B1547E7
	for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 07:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729583897; cv=none; b=JOhUXxa/bV1eS4Al8jIkivgUXPQJk8MkLhApJ5kNZUUqmJSqsvs29C0hkaSsir6QpO6jkfmol0CI5NYTyy8G+jaZW/beQ/d2A3n/keBVZaTeBESG8XECp5Xge6eSNSUSdB5DkrPA2HqrZxEHbL6GrqgMdCi++h6FiMQzoqLvtzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729583897; c=relaxed/simple;
	bh=mJ8bjY+VFpWFE6qR0E3NZ6ICrOgJuTP1+oKfhr892G4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=McFOgLmB7yNNvQwxTJqAsyJQSnXvw02HYJ5moIT6NERG2FhX2GxBt1fue+ehlevKL4YgOxYdNuRqk6kdrJvJ89kXJJB9N2BlgGPBbOKc85bCC7w03zJv9Sr9IiOoNL9rbAY1hYUzkcjuVnWg1QhfXSrhW+zCvfmjxSb5WiKAQ+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gCrVne65; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gCrVne65"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4316cce103dso37352725e9.3
        for <linux-clk@vger.kernel.org>; Tue, 22 Oct 2024 00:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729583894; x=1730188694; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nB1sCny7/ObOPUFnzPaK4MI8kNEuC/RyoMXflzL/kI0=;
        b=gCrVne65EVjcZ9TxyTvTJP+sdt+0FksJYwVHMlkG4gFpnG7M2Lq1oxGlfjiVCcCFr1
         K7/zmrpZhyqpHcoEHbCXEuYNgkQ4b7ylPsk7lF+pEhJ7ZbgSWUl2twxkH9+Px1lXA5AN
         BqhLeYyZU8wdCmGF4vYL4xU0rOIKCeLWdQuR9n/1lhZQEVCQ8SP6StiyoA0OiWHkdgNt
         B7N3HZoMLXN0Wv6leD6tgXPve8F+fjFuOC1st/uXWOB25cQ/bCpk1rVlVaUuQZlHS1Oj
         9fwNDnB/IgA+F83Dt1CahuERgBQBV9ioIFqPc9ESpMCfDz5bo5t9LaqkHRN8mkIpQdRv
         XFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729583894; x=1730188694;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nB1sCny7/ObOPUFnzPaK4MI8kNEuC/RyoMXflzL/kI0=;
        b=cR4edPS9jEY4RQTRmvx3MJRwJUWL+6gdazH1ply/WveOV9FN1UIpfX3WnPlyTMKJt8
         HI2okBIAl0VBXqZjYrr6hK8aI16TWNH+Xkla2WdpxQ4piL5bZdva93+nr4StUsjuoCtd
         SSpyHwewhmzTSKLjUqmGJh/+bis5FcULvy4/M1dgWB9vDzRq/0cUI+ZVU2hWdj2s+iqc
         +edLxoCb+5EeR37Ic6f+vyHqDASvTdKRiEo2Tr/9NkQEGh9udEkO4RrB+XiR4qyYemTq
         Uq5druy5YklnZbHSlgyVDP7cb2YEZPwjr5jgAvGwZ5DxhnHGhbc+ZjVCGSRRnHcxMgPf
         9GNw==
X-Forwarded-Encrypted: i=1; AJvYcCUif29whiMOcEiqF2WNDYzlzVnyOsXfOwStGBMpJY3jEEkCxYOkSjj+uTVY27Pjc9pB7sG6c80G7BU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDYapWu7rsYriC7QxJN3M5HmxN3U/JyOFzDfLLHhlAf+496O4L
	hZ5MGTeMkiQ6lhOwzwVCCl1WlrOKNs6FlbxSNiw4p5AmxPizyTTnZ3Hv3J3q1zQ=
X-Google-Smtp-Source: AGHT+IHmsWaBFwdwaisgEvPiSCd9DJ2V4HgqR+UsslzK65yuXNBu4J6VfmNsHMFs2qztnX1amwHGig==
X-Received: by 2002:a05:600c:4ed2:b0:431:52a3:d9d5 with SMTP id 5b1f17b1804b1-4316158fd55mr151894495e9.0.1729583894165;
        Tue, 22 Oct 2024 00:58:14 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f58bbaasm81210525e9.23.2024.10.22.00.58.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Oct 2024 00:58:13 -0700 (PDT)
Date: Tue, 22 Oct 2024 10:58:08 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Gax-c <zichenxie0106@gmail.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, unicorn_wang@outlook.com,
	inochiama@outlook.com, nathan@kernel.org, linux-clk@vger.kernel.org,
	zzjas98@gmail.com, chenyuan0y@gmail.com
Subject: Re: [PATCH] clk: sophgo: Cast an operand to u64 to prevent potential
 unsigned long overflow on 32-bit machine in sg2042_pll_recalc_rate()
Message-ID: <e88d7bf3-fd7c-4944-92dc-f2224f45bda4@stanley.mountain>
References: <20241021205101.13416-1-zichenxie0106@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241021205101.13416-1-zichenxie0106@gmail.com>

On Mon, Oct 21, 2024 at 03:51:02PM -0500, Gax-c wrote:
> From: Zichen Xie <zichenxie0106@gmail.com>
> 
> This was found by a static analyzer.
> There may be a potential integer overflow issue in
> sg2042_pll_recalc_rate(). numerator is defined as u64 while
> parent_rate is defined as unsigned long and ctrl_table.fbdiv
> is defined as unsigned int. On 32-bit machine, the result of
> the calculation will be limited to "u32" without correct casting.
> Integer overflow may occur on high-performance systems.
> For the same reason, adding a cast to denominator could be better.
> So, we recommend adding an extra cast to prevent potential
> integer overflow.
> 
> Fixes: 48cf7e01386e ("clk: sophgo: Add SG2042 clock driver")
> Signed-off-by: Zichen Xie <zichenxie0106@gmail.com>
> ---
>  drivers/clk/sophgo/clk-sg2042-pll.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/sophgo/clk-sg2042-pll.c b/drivers/clk/sophgo/clk-sg2042-pll.c
> index ff9deeef509b..e0f92f7a21bd 100644
> --- a/drivers/clk/sophgo/clk-sg2042-pll.c
> +++ b/drivers/clk/sophgo/clk-sg2042-pll.c
> @@ -153,8 +153,8 @@ static unsigned long sg2042_pll_recalc_rate(unsigned int reg_value,
>  
>  	sg2042_pll_ctrl_decode(reg_value, &ctrl_table);
                                          ^^^^^^^^^^^
>  
> -	numerator = parent_rate * ctrl_table.fbdiv;
> -	denominator = ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;
> +	numerator = (u64)parent_rate * ctrl_table.fbdiv;

This seems reasonable.

> +	denominator = (u64)ctrl_table.refdiv * ctrl_table.postdiv1 * ctrl_table.postdiv2;

These values from sg2042_pll_ctrl_decode() and there is no way they can
overflow.  The highest they can be is 63 * 7 * 7 = 3087.

regards,
dan carpenter

>  	do_div(numerator, denominator);
>  	return numerator;
>  }
> -- 
> 2.34.1
