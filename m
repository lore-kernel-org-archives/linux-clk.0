Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727E93C2F
	for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 13:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708522542; cv=none; b=ZRKwgAGLGdfkh4KkV00RC0XZH5yOpV+kcjK1cx4z8B7ElwRge+oCtia8lr/JM1W4xYp7ympcmINWpgcfm+ctOXx4hjs43hL8V4dElD0SgYrPT0JiV37Epv1e6XuO6F9OF/Dh/gdWlP8ccQrzGfPhAqeSC/Ana7P9AdVczg7bfRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708522542; c=relaxed/simple;
	bh=bW3BcyOo3zOnh0jsWjwvNDury7C7SRom46TGw5ILpoQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e1jEIzB6PzisBg0OJPw2jm5MrnsNovZ5KKsckE0uxSNMz6+pMFSFlKc1PcE4BsGt2yhow/Eze8NwBr+WEvHCacmwDp7x5kXpS5e11ntgIc79zPK/xgQOk+hOs8EBNu4S78iyljCug486PAK/2Rf7R0g8R3ek00AdN72eSqTsujI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=q6oTz0rC; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="q6oTz0rC"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-564d9b0e96dso2179044a12.2
        for <linux-clk@vger.kernel.org>; Wed, 21 Feb 2024 05:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708522538; x=1709127338; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M85MKNxHpEwF31wKePTUoYXDesnkz6TsPaxXuG5yiJk=;
        b=q6oTz0rCssN3AQmE/IAWE65Jb2ML4ZrxtmR/MCtu3ETsrEeKGBuib/bduTJhBTVNgQ
         cqALLEDQ6SiDrK3qhoMSQWQ1UWe3uPzeM51774MSh3DPNRxJWVlgzQEqY8Jb8CSdJn2I
         X35TEMn+QS0voS0xAVCcZ+kQSM3mqOdLDhMFSUYNQeP4QMC95DcwC6B4576Opt1ZPLAZ
         sseEfI/bPZSjB0gIMknQNNwcUJQnJy3ym0OzCSsvTrTsCodK8Fbik+k/puqwiDEoZDqe
         HOZj6Qn4D2bcsl1TJQxHXN1CjjWgE68OgTHhAMJZI7NV34kOBQdHN8ILg1Ml7KUrwdj/
         zDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708522538; x=1709127338;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M85MKNxHpEwF31wKePTUoYXDesnkz6TsPaxXuG5yiJk=;
        b=qH8kn6l//2DObyf/MwzNie14D1dWYXi3mL2AIm49yO1lyXjUpAjdPkZle0zbe9w+Do
         zbxh0b6ccEI1bsr5/qJuy/0ALJRazPGJTUwQQ8Ip0l9qOagjhxPu1BAqJli4u8MPyXR+
         Ju1QriFXYopAeVW59M2rkdwP4OGRm9LTuRxaYnYrdKLML55tYcXZOTaQtL+YkBHPU2Zw
         1RiHRrDxQ9BJ9vRirrRL8RZb2V1RJxcikHLVTPiW7U4JobWmYDsUg15xPW/ds3PzC3wE
         Gr9gIZnOjefkLDx91m+k63Khq8iqD++9rwvWl8ubLikpZ7ym639WpkeZdYtQNXJ3BIUw
         pBJw==
X-Forwarded-Encrypted: i=1; AJvYcCXwq4KYu6nDsNdCUB1Dyc+dJLubFcLipt5/E1vQYPvKY4c+bc5UvO3XHcC1+8n58z4uY5xGFvLVYjLJx6/2LPnJVUlThwrxL69P
X-Gm-Message-State: AOJu0YxW5XzKAZ92sxK3IWNn/ROwe3n3W/wrO/57qqq71MutNajpsWTK
	PIPHmqIa2lcLxOWTKnVxnGQNAxvR8dccN+NmxZgBlqsBmNMasNb89GLlgL1g+aI=
X-Google-Smtp-Source: AGHT+IFjTAniUsouIQiZg5/1w3zu99rfqHzwO1yDcSTT+S18LBkfM8M18UxyzOt56YfOrmlo+CFdnQ==
X-Received: by 2002:a17:906:16da:b0:a3e:7dbe:298b with SMTP id t26-20020a17090616da00b00a3e7dbe298bmr6580101ejd.24.1708522537598;
        Wed, 21 Feb 2024 05:35:37 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id g16-20020a170906c19000b00a3cee88ddc7sm5044547ejz.147.2024.02.21.05.35.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Feb 2024 05:35:37 -0800 (PST)
Message-ID: <1a3c9ec5-69b9-4f55-bdf6-628fcf2b0268@tuxon.dev>
Date: Wed, 21 Feb 2024 15:35:35 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/17] clk: renesas: r9a08g045: Add support for power
 domains
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
 <20240208124300.2740313-11-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUn6j8aZ+7iahrovWC8oWLiijqH=+cUDjYwdL3tWiuhDg@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUn6j8aZ+7iahrovWC8oWLiijqH=+cUDjYwdL3tWiuhDg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 16.02.2024 16:10, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Feb 8, 2024 at 1:44 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Instantiate power domains for the currently enabled IPs of R9A08G045 SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/r9a08g045-cpg.c
>> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
>> @@ -240,6 +240,28 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
>>         MOD_CLK_BASE + R9A08G045_DMAC_ACLK,
>>  };
>>
>> +static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
>> +       DEF_PD("always-on",     R9A08G045_PD_ALWAYS_ON, 0, 0,
>> +                               RZG2L_PD_F_PARENT | RZG2L_PD_F_ALWAYS_ON),
>> +       DEF_PD("gic",           R9A08G045_PD_GIC, MSTOP(ACPU, BIT(3)), PWRDN(IP1, 2),
> 
> My docs document only bit 0 of the CPG_BUS_ACPU_MSTOP register.

Indeed, mine, too. I took as reference the table "Registers for Module
Standby Mode". I asked for clarifications. The TF-A software also uses
BIT(3) for setting this.

> 
>> +                               RZG2L_PD_F_ALWAYS_ON),
>> +       DEF_PD("ia55",          R9A08G045_PD_IA55, MSTOP(PERI_CPU, BIT(13)), PWRDN(IP1, 3),
>> +                               RZG2L_PD_F_ALWAYS_ON),
>> +       DEF_PD("dmac",          R9A08G045_PD_DMAC, MSTOP(REG1, GENMASK(3, 0)), 0,
>> +                               RZG2L_PD_F_ALWAYS_ON),
>> +       DEF_PD("ddr",           R9A08G045_PD_DDR, MSTOP(PERI_DDR, BIT(1)), PWRDN(IP2, 0),
> 
> Only BIT(1)? My docs suggest GENMASK(1, 0).

I wanted to keep PHY separated but there's no reason for doing that,
AFAICT. I'll update it.

> 
>> +                               RZG2L_PD_F_ALWAYS_ON),
>> +       DEF_PD("tzcddr",        R9A08G045_PD_TZCDDR, MSTOP(TZCDDR, GENMASK(2, 0)),
>> +                               PWRDN(IP2, 1), RZG2L_PD_F_ALWAYS_ON),
>> +       DEF_PD("otfde_ddr",     R9A08G045_PD_OTFDE_DDR, 0, PWRDN(IP2, 2), RZG2L_PD_F_ALWAYS_ON),
> 
> MSTOP(PERI_CPU2, BIT(2))?

OK.

Thank you,
Claudiu Beznea

> 
>> +       DEF_PD("sdhi0",         R9A08G045_PD_SDHI0, MSTOP(PERI_COM, BIT(0)), PWRDN(IP1, 13), 0),
>> +       DEF_PD("sdhi1",         R9A08G045_PD_SDHI1, MSTOP(PERI_COM, BIT(1)), PWRDN(IP1, 14), 0),
>> +       DEF_PD("sdhi2",         R9A08G045_PD_SDHI2, MSTOP(PERI_COM, BIT(11)), PWRDN(IP1, 15), 0),
>> +       DEF_PD("eth0",          R9A08G045_PD_ETHER0, MSTOP(PERI_COM, BIT(2)), PWRDN(IP1, 11), 0),
>> +       DEF_PD("eth1",          R9A08G045_PD_ETHER1, MSTOP(PERI_COM, BIT(3)), PWRDN(IP1, 12), 0),
>> +       DEF_PD("scif0",         R9A08G045_PD_SCIF0, MSTOP(MCPU2, BIT(1)), 0, 0),
>> +};
>> +
> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> 
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
