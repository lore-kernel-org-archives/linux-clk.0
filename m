Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695D81F17EB
	for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 07:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747122466; cv=none; b=j8+vf21HqJuEkHHEryExQBYzmRqrejQ7LwkOxeEGaYOcWKeX3CInBvxZ7cn+RDs6uNEFeP01qEMiU2Mk3LqzTyI5RqI8B0ZEf1ZYfvHB0nHP9Ykm96gWBas8tclYgMMABFXJvS2ZFJS62cC7S459Wzs8PUxX+IHP8NR86D6+bu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747122466; c=relaxed/simple;
	bh=24LJEQNBtPANRsvRmA7VhJPkuYyfg6dz5LevvdvxJ1s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=J0ZYia45Y8k5gJuRBEO2uGRAwaT3c5YVFGO44mM01QJQEksoasqY5d9byb6+BcBpOLiz0Ng6XxTBcGeo9ufgb2dMLIwknyRNa817oR8OuqfyF/5Lns+nryGUQze/2gWeGe3TDgXJKbeU8aTyRKoLbb9kWOG4HNHCurdrpiIxC1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=vcocX/vp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="vcocX/vp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so33670785e9.1
        for <linux-clk@vger.kernel.org>; Tue, 13 May 2025 00:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747122462; x=1747727262; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2RtKA7NZNuHzBQS6CrTPRAttssEFDmPD1Z8kR1U88AY=;
        b=vcocX/vpjp8BiwIOfktZn7zPT3sQRvimXQxVQFKwW7SpKPHmz6dFJPKyXQ3d1O34zI
         CyZKRUcdlUDWQjlmJ6va0KGdloLmKanjgmxedpkTUkCPBRiu9KFh+gA+MXYfgk4FKlUG
         yZK8UjJcpZ9Lr+5mm0VLMbBrxuTVL6AA/QSkkhsLzmITL+ymveLa0cxhna3M5qbooUEr
         LmiDyaqAo1UCOgV2omgs0AUFj0stRLaOl/jl4g+s3wUXg8DPou+Jm7Ax48ew+9G5AZ9A
         eB2jw2ESEqNoiPFPKLMzhf6yW2nXqHocpe6R/0tv1Kia1F7Lo9cUjqB+dBnSlBwjnTh2
         FgYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747122462; x=1747727262;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2RtKA7NZNuHzBQS6CrTPRAttssEFDmPD1Z8kR1U88AY=;
        b=s6XqwjLqcSTjPY9+wHlI4aEmt8RrPOGz31HlpxKCt1Jdo3NNMuKbZRMRiBRqvIZ9Z+
         vTCgmPL9qC6XMJrA8oRgIj8YZ+j6lM4/UuzEL9RmfjSkJFrDARllf9YtcbJAmFaahZcY
         H6JaY4qIBj/Uico4R/iiLxc8no+tbpgw9KqiDDkVMZFKCLUe5n94B+jgSWn/WuE+fcEC
         tzsOPXOQjrxPfxMZ2WJpPruckC5PYFbuyoqdbSUnBUVpaATp13rLRq9lTfeXQjF1HfdY
         /I5yVBDquG0FtIi1PnJsucBp9q3lEgzZKNrngOArHHIyipkMKqXlRUs0xmbQhGgrv+8c
         JDlA==
X-Forwarded-Encrypted: i=1; AJvYcCWDmUJ0jBPQlc/vfIIU0Bbr1QHSQqq4vs2u02SXQ/uoUIGTNqqr5GwYr8rOPBPcdZpGJWD59WrVHXk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMgZzcWdDgoDJdIYJKPKLYet2RGIUSNOnDVYav9vAxNSp5pp1u
	ETAAIKcafKD2PNoVLeXJcrC+Xv6BbhHer7ycTi39SWRgztVRV6oq4Mrg4J4V4og=
X-Gm-Gg: ASbGncuJkQd60UK0A8xy7xud4mft+FSr0cn/pBP7F2ql4gc38gYKLCKBYMOTrM/qVNM
	fbH2UHp7qTv6zs5MOq20sjysfSpPNJazkZ85DD0CIWGD1tUaJGrNhYkq8AM7Z6I7YkdV8xM4/Z2
	hGflxV7qSsKG1Gkcef+2vrR9BHAu6ep9cxu+xFil8XY+HYgaDblvzl2q4yARR8q/2Z4Z/Iajt5Y
	PO12U747YLQeAAXch/xIr5CnBUsshYXyNfpgb8CySwR28pcfQp6UGbKaJym8vz6oO5wv6HmNEPr
	glL9Fz1skIDausMMRm3/ACVHc+tthTTPcpXm3DvYTcJdTD+WDGg=
X-Google-Smtp-Source: AGHT+IFAnCZ6nPY5UPyadmr7YhyYRo5ZU39JgB3mmEwc8mv+oARHGq0H1ti0jbO/TdUIglDMyD/fWQ==
X-Received: by 2002:a05:600c:5d6:b0:442:e27c:48da with SMTP id 5b1f17b1804b1-442eacabc61mr13471135e9.8.1747122461595;
        Tue, 13 May 2025 00:47:41 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:780d:7cd3:15cf:b5d6])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f5a2d30asm15070456f8f.76.2025.05.13.00.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 00:47:41 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Da Xue <da@libre.computer>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,  Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>,  Kevin Hilman
 <khilman@baylibre.com>,  Martin Blumenstingl
 <martin.blumenstingl@googlemail.com>,  stable@vger.kernel.org,
  linux-amlogic@lists.infradead.org,  linux-clk@vger.kernel.org,
  linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: meson-g12a: add missing fclk_div2 to spicc
In-Reply-To: <20250512142617.2175291-1-da@libre.computer> (Da Xue's message of
	"Mon, 12 May 2025 10:26:16 -0400")
References: <20250512142617.2175291-1-da@libre.computer>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Tue, 13 May 2025 09:47:40 +0200
Message-ID: <1jecwtymsj.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon 12 May 2025 at 10:26, Da Xue <da@libre.computer> wrote:

> SPICC is missing fclk_div2 which causes the spicc module to output sclk at
> 2.5x the expected rate. Adding the missing fclk_div2 resolves this.

I had to re-read that a few times to get the what the actual problem is.
If you don't mind, I'll amend the commit message with

'''
SPICC is missing fclk_div2, which means fclk_div5 and fclk_div7 indexes
are wrong on this clock. This causes the spicc module to output sclk at
2.5x the expected rate when clock index 3 is picked.

Adding the missing fclk_div2 resolves this.
'''

Is that OK with you Da ?

>
> Fixes: a18c8e0b7697 ("clk: meson: g12a: add support for the SPICC SCLK Source clocks")
> Cc: <stable@vger.kernel.org> # 6.1
> Signed-off-by: Da Xue <da@libre.computer>
> ---
> Changelog:
>
> v2 -> v3: remove gp0
> v1 -> v2: add Fixes as an older version of the patch was sent as v1
> ---
>  drivers/clk/meson/g12a.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
> index 4f92b83965d5a..b72eebd0fa474 100644
> --- a/drivers/clk/meson/g12a.c
> +++ b/drivers/clk/meson/g12a.c
> @@ -4099,6 +4099,7 @@ static const struct clk_parent_data spicc_sclk_parent_data[] = {
>  	{ .hw = &g12a_clk81.hw },
>  	{ .hw = &g12a_fclk_div4.hw },
>  	{ .hw = &g12a_fclk_div3.hw },
> +	{ .hw = &g12a_fclk_div2.hw },
>  	{ .hw = &g12a_fclk_div5.hw },
>  	{ .hw = &g12a_fclk_div7.hw },
>  };

-- 
Jerome
