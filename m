Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 098592D0636
	for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 19:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760989207; cv=none; b=DZCpazHFbAHfqkxpC4klQdNMSpolFB8SI0f9pBhUZ3iZ1MndHZyYdpPAdVpLXIiXQJdprtZkN871BPsxEVGlT0JFyQx9i+g0s8YmFyTrrqnCSdOAh5GCDDTG1qnCzGnqLicjBNu0mvd8s4d6oQOPmx9L57/MU8+mkSH4Br8TwR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760989207; c=relaxed/simple;
	bh=ZSU5tICH5Ny/RPIhlf0jvQpFOlmoxiNsnQLwr8a3gfM=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=bPp0R8EDdyTPmBzCMGmiVlxWSrLzGYSt/clGP9N6Eks6aztrGozq6MjTFKq/NLY6zAVJxQkT6A1QSAUFnx2EqgKW5f5jut26IFxWSPP87avIbO8UNupTLF9uMZe9/MsDrTsvej+tw9m48gjQd+0N9yHL2gTKwR1HV7nQKiAt2v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=NPSWCDon; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="NPSWCDon"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b4c89df6145so783493366b.3
        for <linux-clk@vger.kernel.org>; Mon, 20 Oct 2025 12:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1760989204; x=1761594004; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M2WAqcTO2AOLyIz/FH6din/Z+AHju6tvGlNEoLz/PUw=;
        b=NPSWCDonrg9r2lE3OufX5Q34+lv7yEkodSwzDuuwaCt32K1ZiyAF6/kaIpQADa5BKd
         BToYFBjbjGwroEe5nw3P9s5vmo0JtcjZ/pTs+UfvJsHoYUa18XSIXDwnhykwEiJ+ENqM
         fz/1qtD68zI/FCJOr9d9M7WJ81MKWVX2EtbUkrh/ajCk7ekBZTDxFud0Szq5O0Btef/3
         oZwEFQtVjMzknabYdOaULgqXLFdrk9EFczExZLWtYDEhkhQYj2U/w/gPkg0oIIUnh7Zf
         WVfVWCz7TFszFgOIAyf1rKyHCOX8CljsY71TKDhyGnZJ7TQCK4yIlU9r+KEHuCJhWk26
         y4NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760989204; x=1761594004;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2WAqcTO2AOLyIz/FH6din/Z+AHju6tvGlNEoLz/PUw=;
        b=umT7mCuQuAKRTRwA2qQK8Mp50mByfHWSawzxLHTeUTAk7V9ted1URVnZNvdJ4X3BUY
         UvPTAUxZ9FG0xf0uN2J1aS8Hg5hfY2z1Sdy40C2bW/sfrSh6K/q8/TF//HQ7OfZ5YsU+
         iiCgGrV1192SdD+c276QE31kVC2KUEUgy+GzzxLG7qWKRlbsynVr5w83+Xyec59tolgI
         EYKqE7ffFDcUQoBbUkg+CNbOlHazSKQH52ayn4++opDH+0oBVe58ose4bO2Q3S3uszmW
         xh5t2HlxfRL/6aFfdqvyRxHz+pmd3K/cF3BmoDfSh61Z+Lm6VvLoqDfdkA/lb1ZDVR4t
         4WTw==
X-Gm-Message-State: AOJu0Yxh1FLbkoW4CWUi0G1vF2cHeG6KFAG8lVD4efQzwMt2ho/bc3Ab
	IZkhRpiiqLQ4LfF85yUGcpsXeG2RkGp3DOdZYNYr+9pZpiG8vc/fpcMcvaVzzhYB7GM=
X-Gm-Gg: ASbGncusuaflnzzExioJ48SRXaJQiL6d/8sIvHqP3ycDbr1wnQj7spN1FwHGXrUGgXY
	IjpKcDpS+vuvD20Doc424u7tyQ90tOxVpiyJLJsCRsSdly2iaiuChZ+yiJBt1ENJQ+x7ZHy0RnY
	XEX0huoTEu0dfofQQ9T882O4dITD/V6/ne4Fjc/JEkuunLffl28O7+sadxVwBzLVhTUEa80DUGV
	wPgC56Qr4ygvh84ODWvd/16BF78cOIFLhwvz1VBoDVewf1V1BSwMPB4V0OYn6LcmKiaJWizqqUN
	r/D+RIG4V00zjz/qIvWlzqEWvqJVWlATjJG8z8jYL0jfjKzmoiM6uAiaHr3otIYi6DtXSGhvvhk
	CWNq6Er+ow5r//4cF7xCDCsGd2zkqwiLz4zXoXBFYbUO7Ygg9MW1CSeJrzH5bXOZuMjhJeGimIC
	rht5u9imkW
X-Google-Smtp-Source: AGHT+IF09RobC4gyw0AbqaF6/r2W5otyzw0fU6nmn3OYfhjdCkVeH+7JcW4ecWr0aHOx3GqX12KTnQ==
X-Received: by 2002:a17:906:7316:b0:b3e:580a:184f with SMTP id a640c23a62f3a-b6472d5bc18mr1594908766b.4.1760989204253;
        Mon, 20 Oct 2025 12:40:04 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b65eb0362fbsm880048666b.39.2025.10.20.12.40.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Oct 2025 12:40:03 -0700 (PDT)
Message-ID: <0e64be2c-4ef5-4731-a503-65fcb45835a1@tuxon.dev>
Date: Mon, 20 Oct 2025 22:40:02 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH v4 01/31] clk: at91: pmc: add macros for clk_parent_data
To: Ryan.Wanner@microchip.com, mturquette@baylibre.com, sboyd@kernel.org,
 alexandre.belloni@bootlin.com, nicolas.ferre@microchip.com
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <cover.1758226719.git.Ryan.Wanner@microchip.com>
 <0221c90ab3025c8e72fcdcf54c685da058c0fe4d.1758226719.git.Ryan.Wanner@microchip.com>
Content-Language: en-US
In-Reply-To: <0221c90ab3025c8e72fcdcf54c685da058c0fe4d.1758226719.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 9/19/25 00:15, Ryan.Wanner@microchip.com wrote:
> From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> 
> Add helpers to set parent_data objects in platform specific drivers.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> [ryan.wanner@microchip.com: enclose complex macro with parentheses.]
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  drivers/clk/at91/pmc.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/clk/at91/pmc.h b/drivers/clk/at91/pmc.h
> index 5daa32c4cf25..4a416d227c50 100644
> --- a/drivers/clk/at91/pmc.h
> +++ b/drivers/clk/at91/pmc.h
> @@ -15,6 +15,14 @@
>  
>  #include <dt-bindings/clock/at91.h>
>  
> +#define AT91_CLK_PD_NAME(n) ((struct clk_parent_data){ \
> +	.hw = NULL, .name = (n), .fw_name = NULL, .index = -1, \
> +})
> +
> +#define AT91_CLK_PD_HW(h) ((struct clk_parent_data){\

Missing one space here -------------------------------^

> +	.hw = (h), .name = NULL, .fw_name = NULL, .index = -1, \
> +})
> +
>  extern spinlock_t pmc_pcr_lock;
>  
>  struct pmc_data {

