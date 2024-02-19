Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A0672F5E
	for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 08:29:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708331368; cv=none; b=dhynkqH1YwPGK6w3NKEBlkxTVfnK1UE2Khc36gERVA34zH4RuPvia7YklgevAGT/zCA5mLhZ838RNc4oJJKqtjXL9C06zSe+p6njM8RnobMkBlsSea7MBeiOMRprjpZtbsFcxQ0fwZFn7iRnzfvdyBMUh3J+Bok9Jn7KxAk2kII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708331368; c=relaxed/simple;
	bh=uhdC6JFPIGg+KsZnoOpAWCewl/MoAdPwQ2M0i3DpJNw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i93s5LLTfTVwuZlBHv7OxzhlZl4EvvR1hz1LsI2GBXf8tnetyU5ubkr5bkVpiAWQUT1/5QnICq+OL0Objqy7B0BHU0+9hHKMzcHDN9foykSKeFyKbGnA9cC7OIL7UMpQRrjTv0cULAIWa7+zzWVtdRyQ3OnygSuAOagueQRy+AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UgrZj6Ky; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UgrZj6Ky"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2d22b8801b9so24923531fa.0
        for <linux-clk@vger.kernel.org>; Mon, 19 Feb 2024 00:29:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708331365; x=1708936165; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kWUWsnfwYVJB3NeJPGabmiQoX5d4BCcDZFFFL55Cbcc=;
        b=UgrZj6KyMkIoaNrtRt8adIqFsfchFQmxiPgEzEAZfss5rCWyQz8DPmeSQJx+lhag6k
         oCYw2YhOVynEz64c99AxdBZUSq9SB7eS8iwGgBDWzsLS8eiBhHACusWTSzvzZIXwNOma
         l0mhn52QL9uKoIUA0DYj/gMtQiYo0FZlwwrNGZnoApK0pe9S/JPbdI+fJqgFfyHQ42LM
         iDtTZF6Ryi2px9OlbcnGokaNnKqtHBRplEn7cArxAUK8/DaJsvyUG7n1fh0O5yseIE8M
         yiC6EJkzm+OOYsCSoG70aF8D9fVH7mQqDeFOpL65q3DolO+26L7F431domELyjncqnws
         0uAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331365; x=1708936165;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kWUWsnfwYVJB3NeJPGabmiQoX5d4BCcDZFFFL55Cbcc=;
        b=qpMgsjuTMvCNFN6WKPmKxLGQzIFhMffGpTIvxheEGBihJSxwaNlCrsdXcmHMfjGUNP
         ilpPbf7Jvz26WY9cfaeHdd4BWsJO7vRyd1HFB+KAMuTHjJJ8bS1mjmN/3DGs2ber2J2R
         SyddveGGOPRysosGNMdPDKYvws1pnirvGN+h/Xe7DpH+kykNKpvNHKywHXDscEqjWsWJ
         KaymSrHinhXIVxzzWGPuDTWixGENwKFyq1q3SuIRDL9S+6kK6MufdFQqaL+LmXFsK+P/
         h2DEH3Lbnn6B3i/zUrwHMRLnbsIId+Hg2y0dXiNYiVAdwhhxKMr4i3j+3KyttPxwnpRt
         BJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXHnWMZCCdSRuXut/Y1EFadXQf6UzFV5hnxEFyMPy81Vrv+czR1WFokNSpeURYWn5SlC1fFRHB0/H0vyLWYnzgLqWOS9SgTGnAf
X-Gm-Message-State: AOJu0Yz0JOmEUMmncElqZIJRHHRN2rWWkemqpW/g43+4CDJBHm3UfNnl
	Zhr97CPQc8YCpjG8v3MV+F7Sx7lkHH9WLfpiCsM6Rl7TWjdfIzAxdJCD23HJYTc=
X-Google-Smtp-Source: AGHT+IGJbZ1oXtdXJ0tTWHvHxj794/54tKPc/gXozHxyRNAZCzrqi/Be9hQAFy18RTkyv7AzQAYNmA==
X-Received: by 2002:a05:651c:604:b0:2d2:4314:8c06 with SMTP id k4-20020a05651c060400b002d243148c06mr47798lje.15.1708331365518;
        Mon, 19 Feb 2024 00:29:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id g2-20020a2e9382000000b002d09bdb7e1fsm983394ljh.24.2024.02.19.00.29.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:29:24 -0800 (PST)
Message-ID: <3c47c45d-be37-415b-b38c-2185a2108d40@tuxon.dev>
Date: Mon, 19 Feb 2024 10:29:21 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/17] arm64: dts: renesas: rzg3s-smarc-som: Guard the
 ethernet IRQ GPIOs with proper flags
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-13-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdX3=KJ6=qOW__KxWisj7Fguwr=SdP7XGvFD+BKgZbRo9A@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdX3=KJ6=qOW__KxWisj7Fguwr=SdP7XGvFD+BKgZbRo9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 16.02.2024 16:17, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:44 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Ethernet IRQ GPIOs are marked as gpio-hog. Thus, these GPIOs are requested
>> at probe w/o considering if there are other peripherals that needs them.
>> The Ethernet IRQ GPIOs are shared w/ SDHI2. Selection b/w Ethernet and
>> SDHI2 is done through a hardware switch. To avoid scenarios where one wants
>> to boot with SDHI2 support and some SDHI pins are not propertly configured
>> because of gpio-hog guard Ethernet IRQ GPIO with proper build flag.
>>
>> Fixes: 932ff0c802c6 ("arm64: dts: renesas: rzg3s-smarc-som: Enable the Ethernet interfaces")
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch! (which was well-hidden between non-fixes ;-)

Sorry about that.

> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.9.
> 
> As Ethernet is enabled by default, I think there is no need to fast-track
> this for v6.8.

Right!

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
