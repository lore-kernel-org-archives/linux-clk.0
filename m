Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7E013624B8
	for <linux-clk@vger.kernel.org>; Thu,  7 May 2026 08:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778142788; cv=none; b=XnraWr1Aa1aNNkzD3yBINj9D2hwzidNe8h4gUVeRdfYOKOL4SXkf/xV+7yDrqFUd56q0UKU8qW2Es46pXMHcd6J/a8whh51d1uWvGxx08MAB/5oSsItTVLgq9Hs9mH3BoehTy098Q99Fti7L3z5GbF6N1vIgkBF3hM7+0pu2TDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778142788; c=relaxed/simple;
	bh=qcvqULrg1L127w3Mirj0n3N+6vWZ6Q9bK1d+khDDJxo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dP3z+t+KBOv+l5TMBv8geaMhBy+ZXqyWZUY25PwV75XDgSVmrxu7ejyfHnyICXa8bQ1HR0SHL/y+OXAua+CCFYHlfSU9ICF38CqC+FKs4kvapq91eb0PtbWcYkNVcadYxIp2+AcpfMsq6hPTXNxUJJSdquM4zLFnHDGESRDEr2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RFlRHiz0; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RFlRHiz0"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4852a9c6309so4177355e9.0
        for <linux-clk@vger.kernel.org>; Thu, 07 May 2026 01:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778142782; x=1778747582; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=86qRkTYkeTPGUaExOcKsMIcF7KjnGIGTELhJaNsShJE=;
        b=RFlRHiz0xIR8BEf/KDhg3GsLONezsF92ljL6JIYuU1LCLE9jgDZ6niEgbIdEYIlUrf
         KM2UhAzE3ajNssSxlm9YE5wg6D8lpMFRGZ0EuNU4TuylA2u3FcWdn1WvjhTinIwdM5KM
         Yxl6oBagrgsIRlRgsNaKr3p6ytGyBFPxmBZs/iTk7sLHi4GKy/vPelNJ1hx+R54THio7
         OaaF6fHWoKjVOQrPlSSgN7lZ3nQcE95HHe40tSZ9/XjEnPbwg6WnW09vGJFr+q5nULuh
         Cmy81hpSiKiDdyqFCbcnMwMrbS23V237yfBWmtPOO7xdSA4v6qOoWvgwUUQllMjcD+SN
         gYNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778142782; x=1778747582;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=86qRkTYkeTPGUaExOcKsMIcF7KjnGIGTELhJaNsShJE=;
        b=UdePyvQNE8dbmneAb75B3u9/e7vUkSTolaW+CAnr0h7Mn7WELLrE7ENbRl8/qRlNDb
         gc6aNdhuioaGdELT1w3K1IIwr+IhILoh683HBqLDNNgPasuJD4Ez0fbcC0oj/UD24JZL
         3Y6TD7ZcWykjkgI5tsAK7XLW10FXCC5imbHz+vDI/A4qH4AZKSqCgiGG6/6DN44ZVuzM
         AU+CTFv7WNQlyZCnVctREHHT0mhNJKPt7IZeLHaTEGdAnAChHr3jcCs7fKgVVc/Hb3tm
         hksukSx8vU1K1y99YWIaEd05eE8LcVmasekQu20J9qZGVIpP+qJ8bkjO6w8iVHxevW7r
         xz1g==
X-Forwarded-Encrypted: i=1; AFNElJ8+ZRS1bVqKWXc9S24lxDo9TBgeaCbAhdVLe9B0xUFM7jepwatOWX4pCGEl0qfY+jrK9vlcTlmlSSE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5Wq2/y7DT7g5xfDYpcJ/1O71mbTSmrBsV1sYrwBryAFIZ1stk
	LY4ZC09/Os3Z4jtegOavlQ3p/2Bw57MyC3/C9Vi2O8NMhxx191rQm+tOaDW/0PdSof0=
X-Gm-Gg: AeBDietzA7UJq90p/ESStY6bNromjT/Q6N1HdYEEvTlKrTdc4kdapqMQxgreZscyP9M
	BBudYDpvhA1PR/enFbXHNtU0DNA1/vV2r72VhGZuPYEB07MzNf6Vu0/FqZE83VohHp8wHLhdA19
	P+2obOjRT/H+WGeMSxN+BdZmbXSFWcdMLyLGshpdl5QsrnL+5EFeiC10lExVbAIe+caMEgLgubo
	4S3nZWnAm7a4OzdsjMXmW/3I+nzECI2h3wXFR2qUGz79lpZ88gZg0RrfL6DVLcDekCRH0N4W/LQ
	acpfbpZaMddGGkcd0t8qvWYe5Rl5555b0OaSqtLWrz8396mPnkRwoMaFycY8zE7MgwqvEB/+s3R
	8Qd8tPBzHeMzcVG5NFjHeZQkNWQuCgcTz/4JN7tjtgtd9Y3r/Qco7LR+tLWxcsFj5tfkVKagwym
	1SXDVQOnoqVi/tUAaVoJAyF1+Tu8PH7f4SuUA5lCcnXnOO/1fJ+qIgsQ==
X-Received: by 2002:a05:600c:a317:b0:488:a977:8d6 with SMTP id 5b1f17b1804b1-48e52bd4f32mr82461455e9.19.1778142781642;
        Thu, 07 May 2026 01:33:01 -0700 (PDT)
Received: from [10.11.12.108] ([79.115.63.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5390f854sm104780755e9.14.2026.05.07.01.32.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 May 2026 01:33:01 -0700 (PDT)
Message-ID: <4c57b107-e1eb-4eef-ad77-021d9669900d@linaro.org>
Date: Thu, 7 May 2026 11:32:53 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 0/3] clk: samsung: use kzalloc_flex
To: Rosen Penev <rosenp@gmail.com>, linux-clk@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 "open list:SAMSUNG SOC CLOCK DRIVERS" <linux-samsung-soc@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 open "list:KERNEL" HARDENING "(not" covered by other
 "areas):Keyword:b__counted_by(_le|_be)?b" <linux-hardening@vger.kernel.org>
References: <20260506233833.178357-1-rosenp@gmail.com>
Content-Language: en-US
From: Tudor Ambarus <tudor.ambarus@linaro.org>
In-Reply-To: <20260506233833.178357-1-rosenp@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi!

On 5/7/26 2:38 AM, Rosen Penev wrote:
> Switch three structs to flexible array members to combine allocations.
> 

What's changed in v2?

Cheers,
ta
> Rosen Penev (3):
>   v2: fix compilation and reword descriptions
>   clk: samsung: use kzalloc_flex
>   clk: samsung: cpu: use kzalloc_flex
>   clk: samsung: pll: use kzalloc_flex
> 
>  drivers/clk/samsung/clk-cpu.c | 34 +++++++++------------
>  drivers/clk/samsung/clk-pll.c | 56 ++++++++++++++++-------------------
>  drivers/clk/samsung/clk.c     | 11 +++----
>  drivers/clk/samsung/clk.h     |  2 +-
>  4 files changed, 47 insertions(+), 56 deletions(-)
> 

