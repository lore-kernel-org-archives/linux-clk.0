Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345061FE451
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 11:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765019917; cv=none; b=V3G7aO762argTkq0S8hH5xl6zwbbXkt2IL/uH6g2zbBTve2FKwuajdpfYu+UoGtnSZekcpwO0mE3ZLnDzTbeSOMmnutkMrWBwGbXOVaBsPaKFSdDWswkYOR4nOkq37OAuwxQ9nk6d1L8xvP4NX2WPBsLz9BKkgxXfY0eaTgmzqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765019917; c=relaxed/simple;
	bh=2dSCRC+qUHWWpuBfMYiiFHMdNhNbKKMJp7pBFyy5x28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sWbk6kCf/EvoX/go15q++WquCjYnp7r9QhyQI4nnlDbzWlekkeZVANXutNCGR9UiH9Vbg0e1Kc8Cpd1aGSZ6C0iBfnS9JL9lflyJeFsJ8ySzrC2JF4OyRGxg82WKdQRlLJ9bCU9/WftJDhh5Dm5bIelwbxnOx+HqJ1i/mlZQDZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qKA7brgh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qKA7brgh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42e33956e76so1474607f8f.3
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 03:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765019913; x=1765624713; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SbIrykIurPy4cu/aMennF9ioW6dMGtNcboFPZcYKwp0=;
        b=qKA7brghGFcrRsBuTZhu3wr05yoBi0XQPIFSvVEnpgMdY4X2hATi5XN2srytZxgO9O
         /VyKb9JRK5UZY5HXnRE6LfQMSg8kx27LQQAi+ozFYR/TuKOLMz/SunoMv0ca3xlu5Hes
         1PAB23x8l+uOi4FYu6691bHyktqPmI82V2IXWtaLzShxEVoHvrt3iSJnWYMcqbs6VREW
         9SIdi2wBK6Z1AEv8oOLYPYufW5HZ1fVYWtu1x/6yBBIBbUXKcqY0s5nk0F6BnX7mKanc
         WbANPnwycUzxfLvq16Va+lnf8Y/4rB48jxZHy8zsi1IQzOdvidZ5qj7yqUTSsqyGm1z0
         HOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765019913; x=1765624713;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SbIrykIurPy4cu/aMennF9ioW6dMGtNcboFPZcYKwp0=;
        b=TObKFMzLs0UJm+ZMH0PgFT2vbQaGjvXcb+BS4PfbR/CafiaZMRkV3khDjEUfv6cTkB
         Vx5g/HLxlkamA1GH9IrvAQZBsGBTS+j7YfBEQkyfSyyKfPpXXFUt1+dp4k+DyZJ9hdIF
         WxZDkUBfjhsrmzrYU+Dtrik3N9mVyjSW1rI7kIcHusT4D9DUshJ97AWZ7EIr7tBDhgNC
         EY48LmuPZ5eyozXGtLH/tEEKj9lHWVnYqYmiYHhF2vEIwjlb6oGcWc+jnEI8WyeIjR7s
         /ddXJcLnj4NybaAd0ttufxiUDRkGZHrnRJs61WrtIlCTMz/JY8RfGUiLBn/fhxoK+VXm
         Okow==
X-Forwarded-Encrypted: i=1; AJvYcCXucI5A9c4CXZBI+KPV64yejGoHtIMqFG6aDAs3AI0JjZ3bUR9HObqKxcHSlmXZOvPMfUCUNx6jHs8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4XsjvIBEacMDuWsM/rMqqMfh406BsuOwQaxDDwEfma0C0F/9R
	VBrDpoV5LF/iMyKaAs7UlOuLfLIyKHeDNwe6GueQIN0VJQoX1AhoQzzJGocJil550TU=
X-Gm-Gg: ASbGncsFdKjzycW/V3+IXvbVYV6lq78BFibTJ9yPs0KtDbr5CX2QFqrJkYIqwVaRpnK
	bTeo9hlCNiBW5wngKa/Uf5TXEzujl9bpBaP79+5NjESXuytJhhiW9eLQ9P9ldRS9TDhR3Bgs2kD
	/xakAahywqMyZJTop5b2XtoxVp5ETyVZFAgG4geTMcBL9271vFfDonVF52VBuFw66Z9eju3VXWD
	a0cJDeN+CGdIJFMRF1Sz4ykZsYo87k2C6m5MRYdFd/rm8bj9rh2R/4+nyyWrcu+9imhiCFG+n50
	FeuXESJKBSdt30jB39uVd20RP4OCCt0KRODh946V+TzEKf2h7iHdHfnoaP2TH+dVdAHDl/hqtJ8
	CehyDvckeSea0nGtc56i9IFHh+Bko0Tm+b6/l3Ne1i89NVVzlG4278ISxJtlxJ/jIdKEXfZ5vmZ
	NtO1EntwMG7zaRzWlMwjI=
X-Google-Smtp-Source: AGHT+IHr7mdkZZdTGhGHXhCyqOpNz/L+eCosT1VVgSOrplrijDQwbTIlvnGL9FzVzlG1uTFmo3H5MQ==
X-Received: by 2002:a05:6000:290a:b0:429:d565:d7df with SMTP id ffacd0b85a97d-42f89f54886mr2311030f8f.42.1765019913538;
        Sat, 06 Dec 2025 03:18:33 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42f7d353f75sm14403593f8f.42.2025.12.06.03.18.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 03:18:32 -0800 (PST)
Message-ID: <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
Date: Sat, 6 Dec 2025 13:18:30 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
To: Conor Dooley <conor@kernel.org>, linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Daire McNamara <daire.mcnamara@microchip.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-prude-dilation-79d275fec296@spud>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251121-prude-dilation-79d275fec296@spud>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11/21/25 15:44, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
> 
> This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
> symbol has been defined for some time on RISCV so drop it without any
> functional change.
> 
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  drivers/clk/microchip/Kconfig | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index cab9a909893b..a0ef14310417 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
>  
>  config MCHP_CLK_MPFS
>  	bool "Clk driver for PolarFire SoC"
> -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
> -	default ARCH_MICROCHIP_POLARFIRE
> +	depends on ARCH_MICROCHIP || COMPILE_TEST
> +	default y
>  	depends on MFD_SYSCON
>  	select AUXILIARY_BUS
>  	select COMMON_CLK_DIVIDER_REGMAP

OK, I found v2 in my inbox. Same symptom here. It doesn't apply on top of
the current at91-next either.

Thank you,
Claudiu

