Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E0643AA6
	for <linux-clk@vger.kernel.org>; Sat,  8 Nov 2025 10:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762596010; cv=none; b=idTAnn1/JuT2QohA6aClCGJ1mxe/yFvSV9zo2kV8e0RUszA0xrb5jOC6pb+CnayzV6Ssoop2DhZJzp7FhdFF61DqVXn8N/HeSLWq5nLtxUn1gna2dqKnSQfKZLPVIZ9qa+Bp8DQrNqDcQvgYWn2hxJoE0qk05gGzbW2YAFB8wXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762596010; c=relaxed/simple;
	bh=Auc0X9Uhro11+Rp/Gqlv4V4jLrVrIxiGCG5AoxRW0Fs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fkvMROJVu/XejGFGXHckMBg1t4zoqG0g5js9pgWKdZiH+fB31E2dAgcnS5F2bZJsCvB55bzA+qqfriW4cMV5rPzI4Lh8q4FJowzDt1lY59KGqwxhgXq/MwdWqIrHvWsdFLlXJffAI0uVkeaKpfgmvlEUoKZ9GOaTyKjp3sWQR6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ki6Po93p; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ki6Po93p"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so2428675e9.1
        for <linux-clk@vger.kernel.org>; Sat, 08 Nov 2025 02:00:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1762596004; x=1763200804; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HfKm+sCMoLv848O0IaBXkyVHVooRGLLewfD9ZUo50nE=;
        b=Ki6Po93pFp1HgBALIZkpkYYRL2GonCZUU6T8H35sg+soapI4a55aa9JnPerH43vjBX
         PD4shcBjc9XZkSvQm/DwxHwvIfvOk7Fg8cSwQkMJ3Y7C7Prt58k7dnN10w+gI4HnTCKR
         YcGO8OgBWK23Q5lSR3aH+kLka+03k9hcdrEn9jZHR0qRA5qweBJR1hegX0svRHL+PUwf
         saLKVtKDgg2nMajBbwmPsTLA82AGzYBhB3SBhRMHSDZ5qicJ1WcBIxSBv6gPdt+ZG/9+
         WY1O1VsFa6DWsZjgVU5y7PNX5Aa28WPmpAraaq9lcwW9tM7ZPCoX+zPY9+edc6U9YNH3
         eU9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762596004; x=1763200804;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HfKm+sCMoLv848O0IaBXkyVHVooRGLLewfD9ZUo50nE=;
        b=ol7fdpHpN0HZ8nxYUCiPuRExUrb5mMRidf6vrVqQuNazgwjLEHT7atTDc4k51j1rvp
         DDCUrzv+N2sN4UkBWOVtWBh4hDXC6PreOCUCbi+YJ6AOEhtpiGHjGwi++tMQIS3VaF0j
         uC6iZAq7C7H/z9Acfuj467B7/8wU5CP7KW0QSAIc/5NDP+H09ZGlzQR4RTTF7FKM0JmU
         wpCUi1KYkGPakyh12WO88tbnQZCZ4XmmVmSdebPp2SNnsYodgpxDgPZx1GWBu6ZJyQ0w
         dzoGglqeKQFstV00bKA5HClQBrtsNTJuB/IsspE7GtIurgFCXy1ZDFYMIbhQzkY3xjB2
         HnWA==
X-Gm-Message-State: AOJu0YzB7ST5GCjun7oIoNuW8OfTy6rCCmxAVmwVYCr0U8mDz1awRy3Y
	PgIKaGv9Iu7k9CgQowNB6edC3MFemo6UPKoXmmEzCnCMtdOXID4df9KshVOJa0MMob0=
X-Gm-Gg: ASbGncv5kDGnFn+6XV6J/K9GcvKYfongMtER7rETShCfVkZp3J3s7BFEdeFfLLDFjt7
	hXG51Db2QDtOXhAYWpLw+EzGcPl9Loa1hK0L6Rn/SYXqTUzkPlN5m7b72OicO0RqG4g0qVvvK23
	P5pe2Vsp7e1KknSi9iS3NKxK6wW78esSt8/g0wXAPLHcEMSQ8cRf68k1FYEjbqCaJRJVKg3+7u/
	jvHgfDUKytVs0nP7hy3YWgAihpbgzAUsbZxHAOKfiEEdHHGCkD0j0c/MZipOSUAM5sj/T5spGLJ
	MsgFlr+BCYLCn4KOZJ5D8TBwCNYFBUClmox+qt4mN6BvgPtIutfm8dtnOvjHBScLgmgs3ClsVOM
	iOWU5mEQ+8bb3Zn/vDtK366dPXcV5mu1RBPagrEwR51VY07R7bBs7ifvPIG1qvW5TlMZ49gPukI
	oJaWmvzHW5FYr9o6ZgidM=
X-Google-Smtp-Source: AGHT+IEa5HkAwCtUWAqywoBTOY3tVN9yf0jwTmnq2Cg9AjaVrXNzNWnrvkGMw6skKp8s7Y/nZrMCtg==
X-Received: by 2002:a05:600c:5253:b0:477:19bc:1fe2 with SMTP id 5b1f17b1804b1-47773228b73mr15623725e9.6.1762596004492;
        Sat, 08 Nov 2025 02:00:04 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4775ce2cde0sm213265715e9.15.2025.11.08.02.00.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 08 Nov 2025 02:00:04 -0800 (PST)
Message-ID: <2aaf169a-3dab-4ddc-a095-396619983406@tuxon.dev>
Date: Sat, 8 Nov 2025 12:00:01 +0200
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
 alexandre.belloni@bootlin.com, varshini.rajendran@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com
References: <20250924145552.55058-1-sidharthseela@gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250924145552.55058-1-sidharthseela@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Sidharth,

On 9/24/25 17:55, Sidharth Seela wrote:
> Replace kmalloc with kmalloc array in clk/at91/sam9x7.c. Refactor to new
> API, for cases with dynamic size calculations inside kmalloc().
> 
> Resend is to correct previously sent patches mailing address.
> 
> Signed-off-by: Sidharth Seela <sidharthseela@gmail.com>
> ---
> diff --git a/drivers/clk/at91/sam9x7.c b/drivers/clk/at91/sam9x7.c
> index ffab32b047a0..0c0a746a183d 100644
> --- a/drivers/clk/at91/sam9x7.c
> +++ b/drivers/clk/at91/sam9x7.c
> @@ -748,9 +748,9 @@ static void __init sam9x7_pmc_setup(struct device_node *np)
>  	if (!sam9x7_pmc)
>  		return;
>  
> -	clk_mux_buffer = kmalloc(sizeof(void *) *
> -				 (ARRAY_SIZE(sam9x7_gck)),
> -				 GFP_KERNEL);
> +	clk_mux_buffer = kmalloc_array(ARRAY_SIZE(sam9x7_gck),
> +					sizeof(void *),

sizeof(*clk_mux_buffer)

Also, this line should be aligned on the above "(". Please run checkpatch.pl.

Could you please update the other at91 clock drivers?

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/coding-style.rst

> +					GFP_KERNEL);

This like could fit on the above one.

Thank you,
Claudiu

>  	if (!clk_mux_buffer)
>  		goto err_free;
>  

