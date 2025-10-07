Received: from mail-il1-f169.google.com (mail-il1-f169.google.com [209.85.166.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0217C23C38C
	for <linux-clk@vger.kernel.org>; Tue,  7 Oct 2025 21:06:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759871174; cv=none; b=i6SJLWAEr2vtkdhssp3ayui/hP3SgHcdJ59Ydjs2JM8JRA3rBVrudrsZnsgI+v4n38BdgQyMp/BEZig0P4+hQkB8XRerf0SLulhI9Lm1dun/lTtLvuU5+B7JnWBPwKsNEc8i1N9gHKHZ342LfxO8MRpX4MdEit3DVLEK2XLSeOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759871174; c=relaxed/simple;
	bh=TS9Ms/0nVBXQq/XqEcRsNa3oajKBYOCo7nWDKz2HJI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Utb8iOR9Dl2LjOHqT5727yRE7xrj1nWhqG+pwQ66sqQNp/1q1zKaK31nedkWzSUyfUpQi5saptZTm9G7ZgHe6Mk7avav4CmHBtQ6TloWYFOdA1KJ4kbYBIzoQ8duN0y/7thIVmY6ENKg2Z/VZ2I6at0hltsWuK25e15T1SaSQj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Qhq4wB7+; arc=none smtp.client-ip=209.85.166.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Qhq4wB7+"
Received: by mail-il1-f169.google.com with SMTP id e9e14a558f8ab-42d7ef9a402so1557865ab.0
        for <linux-clk@vger.kernel.org>; Tue, 07 Oct 2025 14:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759871170; x=1760475970; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hDJssHW/G49N1bctBMwaYMSUbzS9ng1oTayUPFPGvKw=;
        b=Qhq4wB7+rgCQZFRu83X4RoxsEzYv0iSftIIGtAb8b+OtUfRMEkJxsT/kdvnwC7JqLq
         fOb019meCBe8RgcqQktkhqyIUGZh+8rfFnSLz5Pz3kDbD7C/fwcc5o57Tp2CRRCK6t1S
         Kfd+S4E9YIZlKqtr3pvTKrUWv0ccMznVqeA98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759871170; x=1760475970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hDJssHW/G49N1bctBMwaYMSUbzS9ng1oTayUPFPGvKw=;
        b=eC6cFSuSPNuaPV68gwCC2tXNoWb/jWItziY6ndYvcQ1uxy/3guItWyFTbH1C49MZoK
         f9c1bZF2raOGRo1L+JTuOuZ6MN43wLQS3kIYjlSC4+i/XrZxYjJ1RhyTzWb4nle+gPwX
         5X3kfl/CFK5+yOzQ13BaEZZ0U6VGM5MOuuQyDUSqxqnRXh/3al0nAeFYHy+uX2yMNbnE
         8idQjzuuKS4Hm+782JeWp6WnM4iK5oKXWEfBuEdD3qsMKeRi6tRwmuzSP5XU9DpiXg+a
         3m0pOOmXADFSdZ1vnWs7KxGyxyh7CqhAZn0aTh0O+7ZIPTqj1T9zmmMEA3zluPR44nrL
         L06g==
X-Gm-Message-State: AOJu0Yy4EhVyqJE57k5qFfxWOiio6nf/6oBpeGIgP+mxyYbIPO0SgD6K
	37B2IQ87U/J5MNQpBKz28qP14G+2gG20PZLUtpYt4xIWHeA4J9xfStd9hn1Ilbogvdw=
X-Gm-Gg: ASbGncszGroc5W86IzFCcIh25AeBKaHtA1fCS6GYG0cnIbmlFcUfOsOpnyt4rkpOrhC
	mQ8l9kqcT+opJo+xJkXhkt5nUEEIkbwoIe+mbqcOUhgZlAbOY7jovr2VH2TZ6aMUay62QljnpWc
	72guD8QwE3162WnQSOAnSulSVWVZQwaVhxMFq+WYyEIB0FgB1++tJgjoALsfoiD7VwM5gIbqLpW
	uJOVGD+5fVxbdfaMqQGxKNUSvmutLZeNY9zna9V5vKFOuVJAEXv6+1wdJzqq98LTaj3ncgvPxp7
	lszSislDUqrx94d2ETsWjHiCEkC3STVnIduNLTkznmyk1HmYQYaDRZJijVB0FXYp+5zjyrXhuiP
	moMFEVomdWf45hK0hGjQsvoLQa2gqkqngd/mbdgtCVZeSlVmRzWUpbPl/jTcKk8JyVoCJ2Q==
X-Google-Smtp-Source: AGHT+IHJS9tRfCPlCMJwh844fS5buPRYb19l+/WQy1lMrZF9u3+w3MuGpV9DibTiaEiM0xpOHSxg7g==
X-Received: by 2002:a05:6e02:17cb:b0:425:8134:bcaa with SMTP id e9e14a558f8ab-42f7c2d49a8mr65232375ab.0.1759871169924;
        Tue, 07 Oct 2025 14:06:09 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-42e8a0bb405sm55081635ab.12.2025.10.07.14.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 14:06:09 -0700 (PDT)
Message-ID: <c87d45dc-d545-4359-9e2f-11e43a45859f@linuxfoundation.org>
Date: Tue, 7 Oct 2025 15:06:08 -0600
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND] clk: at91: sam9x7: Use kmalloc_array() instead of
 kmalloc()
To: Sidharth Seela <sidharthseela@gmail.com>, mturquette@baylibre.com,
 sboyd@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
 varshini.rajendran@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, david.hunter.linux@gmail.com,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20250924145552.55058-1-sidharthseela@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250924145552.55058-1-sidharthseela@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/24/25 08:55, Sidharth Seela wrote:
> Replace kmalloc with kmalloc array in clk/at91/sam9x7.c. Refactor to new
> API, for cases with dynamic size calculations inside kmalloc().
> 

This following line doesn't belong in commit log.

Can you add details on how you tested this patch and also how
you found the problem to begin with.

> Resend is to correct previously sent patches mailing address.


> 
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> ---
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index ffab32b047a0..0c0a746a183d 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -748,9 +748,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>   	if (!sam9x7_pmc)
>   		return;
>   
> -	clk_mux_buffer = kmalloc(sizeof(void *) *
> -				 (ARRAY_SIZE(sam9x7_gck)),
> -				 GFP_KERNEL);
> +	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
> +					sizeof(void *),
> +					GFP_KERNEL);
>   	if (!clk_mux_buffer)
>   		goto err_free;
>   

thanks,
-- Shuah
