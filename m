Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 073992E765C
	for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 13:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753276228; cv=none; b=dNNzXtpNd74mBgo4PMTdR0tR0yWclmXzHo1bhuTp/U0j492yho9Zx1baBC6Rorlcm/ZESScmxWJYmmHoHe4HTa8s//3jhJwu5tFGkhA0QxLi4v3sMnTii7PF9TvusoM3WuvEw2dtO7rS8v7UNul1996WBz2W720hT0aAzSnHUt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753276228; c=relaxed/simple;
	bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a3a+NFgYAMqXKXkARayfK3Zgd/Ac7pQshr1x0wxluQEgSH7jwHrVua1qL7699WfP/nUcEPBy103sdYOc1U+DGf4ap9m6H4hhWyFtQ5aZ13RgvQxOrHTqPCKQ1i3OH8Tg8lEKULx1mp94su+K/yrG4xtQtzk/Qa4YFciVU3AROfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be; spf=fail smtp.mailfrom=hammernet.be; dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b=pIHmasZB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hammernet.be
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=hammernet.be
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hammernet-be.20230601.gappssmtp.com header.i=@hammernet-be.20230601.gappssmtp.com header.b="pIHmasZB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a582e09144so3597126f8f.1
        for <linux-clk@vger.kernel.org>; Wed, 23 Jul 2025 06:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=hammernet-be.20230601.gappssmtp.com; s=20230601; t=1753276224; x=1753881024; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
        b=pIHmasZBcQ74ijjsISLBNbNCOz53btNAxANZfw66j3L2LkNuGcfR2DrQFNtLXsBQwD
         VHNy38J5cr3iwKR29fa/BQZXz8P9XEq5NA5EWr9fmPhClXmBWFLxPpbWhAk6hn5TOoeU
         s77tnfton5cD9h0NxX9sGNATlGU15cKyAY53l8jdOu86e8SG5f0Zl1ktAqPx7xUWeB+g
         N0qK0CeWNDfSZU1v4dNQIF1CXDX5dEObdKUWXeDv/8rUCcXsXDVr7WjgzJh7w4HATBxM
         sqS0a8Jai4OfHpaCbNM+1wf2hMkZlks83DkytfKCx/95sRkomREJJGUUYIX5VB2t30Lx
         3DaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753276224; x=1753881024;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vhBAalWa5gqDwmnSu/rBsFgFjTeJbqxDSovXVqBa20A=;
        b=iPsgsc/WHC8ASJtDWDG5zdOkSVXdTVdMig17ifi576TmgpplDfRJrVSqrGjjMDVa/G
         bDfp2yDLy0LrQTD49GRxFEMtkIItwjyd7bOUrb4NDIzxhMZo1dN5Cq8PjsEL/rSjBOfy
         DWYIxP6CLE7/cZa3pIFXVmVGwcoZj9dCCPkBLyZvcIK0BJ8tkY5FR68oDuh4sI4oqqpO
         wzfYrOZr2UyyJAnTtmdj2Rqbr/wFse0DxBAlfHTObBLm47C25+knN5KSB7kZIPo/ls0u
         hAW+jK+5UImarbgiT9TBtuHD+uhVP9KteICjHmgtZPEiWjktSbb4j1Q5eyjxFwwt/Zhi
         rx1g==
X-Forwarded-Encrypted: i=1; AJvYcCWssU/eR2K6kRMXKtzAgjbLSc0TwadWyeYej4uCrSM5QSjPrKmn/jXfR6Ltqhub86aeFqaCQ77iBag=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFrtpHKBJR71UUp4KSWpMRldUnGEFPjEwl4MqyhMKxqtZPYbJy
	CQaKns8Kcp/4/LPhXgWLN/6fLX+2pe1zZhXjzi2qfhQrczCsRNJX4WkzQwvDeuawJ1M=
X-Gm-Gg: ASbGnctxxZuZbAVHg2RitcmMKAzgbA9TydUzsIJX6NRtJBFPmvKj4S7U+BwwVslK6ZB
	vY/KBz2TOYQT21f3Kah1OzCBv+BcSu/jBym5vtw6ImzBoltVMANeWeNP8wh3dIujgCavYzYLjs6
	z8kEZGTcOJMM6j1oZpHHDkdA6wKc29e2rijRmVQRdFtJt1PIj0WOpXGQa5reAAKIkRb816mGekZ
	YwxeDTQy7fMM8PLoqaNUEWPi8nauzHmlPKgZUQSGEKwyDAMPftDmCl7E2DGThkEehl4w+4v+Cmz
	549SPtGl/ajzvX5WGpHA0q6Vv+zLs3g0GCinM+vl9Kjhc8bqK8r5hWRcbnhpx8kgAF+F7rmvlph
	TfYkr+mD6PqaScTOcHbe7mjcTy485nqUka4f9INnQiZJiwtFBUVu2Jgbk5kvWnf4UmAfelqW5El
	L6LCZ58DnUhDWz
X-Google-Smtp-Source: AGHT+IHaikAjtXSOK7TzkgieFuqf48w0q0zzAkHwiGU+rMcHAorrKzxT8fl3tGpNBEzEAzrmfTi+OA==
X-Received: by 2002:a05:6000:40da:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3b768ef3c90mr2447676f8f.33.1753276224129;
        Wed, 23 Jul 2025 06:10:24 -0700 (PDT)
Received: from ?IPV6:2a02:1807:2a00:3400:7fcb:5e01:8f11:1009? ([2a02:1807:2a00:3400:7fcb:5e01:8f11:1009])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b61ca5c813sm16511400f8f.84.2025.07.23.06.10.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jul 2025 06:10:23 -0700 (PDT)
Message-ID: <fd4eba94-50f5-46c9-8675-cc0aaa4601c6@hammernet.be>
Date: Wed, 23 Jul 2025 15:10:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: spacemit: fix resource leak in
 spacemit_ccu_reset_register
To: Yixun Lan <dlan@gentoo.org>
Cc: sboyd@kernel.org, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250723124020.60897-1-hendrik.hamerlinck@hammernet.be>
 <20250723125416-GYA738759@gentoo>
Content-Language: en-US
From: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
In-Reply-To: <20250723125416-GYA738759@gentoo>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hello Yixun,

Thank you for the review.

On 7/23/25 14:54, Yixun Lan wrote:
>> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
>> Fixes: 988543522ebd ("clk: spacemit: set up reset auxiliary devices")
> Can you put Fixes tag before SoB? I'd suggest to follow tip tree's docs
>
> https://docs.kernel.org/process/maintainer-tip.html
> 4.2.6. Ordering of commit tags
>
> otherwise, looks good
Thanks for pointing that out. I'll send the corrected version in the v2
and make sure to follow the guidelines in the future.
>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>

