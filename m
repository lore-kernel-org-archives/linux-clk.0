Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB127158A23
	for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 07:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725004274; cv=none; b=KJVMOSBWYLT66/lx6aYVlXfCgDzNzLEizGju1/RVUBKTexjxUpTBMOD9DLP74Bp/cu7iYf1ANENz8HpytuNK2T7g9lc4S97r7giP8qngJ54QfGS+1DzQtTYwYAi4RbTQuULJw2mTbFQOWkqeK56zZQo1Ftdpo4MkdJc0Ku+RXH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725004274; c=relaxed/simple;
	bh=o8CRy5N/QP0vv90BvpY0TE1SD1145ZLfu4J9UgiIu1Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gAFtH0jgb55q1d05WpSj562RNRIlbORWpPBIRAPQfkEX4PDZ42YbyDPpdsuRI3lPYHCS8rnrSDPLRw03qiFZqHo+RRGBuIwROPXxlkDRzu3Z7wwdRg1Mp0OHobZUS23puurony8BL1WMF/27P44BIxqimCfA8bqF/kKCSbObBKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=McXKdrvi; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="McXKdrvi"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-371893dd249so1078663f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 30 Aug 2024 00:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1725004271; x=1725609071; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QLLFPhG/9ujRCh5Id3LnvAfy27Hvm1ve5EnAKTVni/g=;
        b=McXKdrviWxCp+vRLlESSQXwa35vFGmhhWNsUwRJfQZU0r55ZLSs0nKZ1aw9FZ8aCdW
         iN07Wn0d7HAvd6bGHh/0GO57k0+S2eXF+FK91DjrRl0uFLy3+j1UB3oGrLuAsGaa1AQq
         lm4R2ZMvdvHEUn/LfDBD2hZC2Gt2grY9/0GhuMQfGdmrpn2hFL/go7RGeCUh1te0biDV
         cTgOqrrfKWue37d7FqPoaSV0vROl67V8d2ZZ/PlI7uFExB8VyowPmhZZzukQsLqmrtwN
         UiJIdhlKNBfGUsxoKX3mgzrm8xhmXljFNKOhBEUEbiWM49uCtdyGymrDua7391iEVmSW
         oN1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725004271; x=1725609071;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QLLFPhG/9ujRCh5Id3LnvAfy27Hvm1ve5EnAKTVni/g=;
        b=YvdInWbQyA1/azU6PveAI9g7cQ8dHq/DewOJNFaUSfXSL9+D/rrO5Ahml8fh624ueC
         zVgRIMBPMF4EFU8GBqQXDZqyIsPD7lQu2sbNEH+P0UDIQtD8ntu+nPlyMNdvOiwwDf3l
         2JbcNmFzEhaiQJ8x5qKlaUWAS+fnSm1t+5aPdaIF5kGfG3pKLRR6WCsqjD7C7O1s9JF9
         le4DHaoXeQmi0VrLBMMYWxtKAF0VaF9ZzyM6ebF7YNuBAlx8GFvIBfk55kt5LhkLMUuD
         6AZZiXlFq4wR8h5VIZgb6VLFQ8CoYQMLbFdg2BQq6dGz2l6jVldK7gFtDXRdr9dZi3qe
         A1pA==
X-Forwarded-Encrypted: i=1; AJvYcCWkoLdaDkjl7J/ZjIg543QhAOdBTGQbD+5DxVY3U6EU2u3dK09Yazc0xHTTxQC3MUWzCdaPwGy4W+g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+Mqp4/aWSgFwSdoJC7Gmlkjbehx6yLHUCXEq5n0CLsbgKAfWb
	wG/sHDwoOOA7+KVachkxtw5EbV7S3gb75jmfgASlISdAd36aepI4xqkRfs/DtT0wG0E9C2aezGm
	j
X-Google-Smtp-Source: AGHT+IHDX9/slgT7/GdTZaLJCStso5CFJJOwulNYGKNVh415YS6OSuMHAUYkJOcO8PCpOKwoXIevOA==
X-Received: by 2002:a05:6000:1b0d:b0:371:8bc9:167c with SMTP id ffacd0b85a97d-3749b581bcbmr3787062f8f.41.1725004270786;
        Fri, 30 Aug 2024 00:51:10 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-374b67ff88dsm190333f8f.26.2024.08.30.00.51.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Aug 2024 00:51:10 -0700 (PDT)
Message-ID: <1ced21cf-9e67-41dd-8ee3-7f8d138d4fac@tuxon.dev>
Date: Fri, 30 Aug 2024 10:51:08 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] clk: renesas: r9a08g045: Mark the watchdog and
 always-on PM domains as IRQ safe
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, wim@linux-watchdog.org,
 linux@roeck-us.net, ulf.hansson@linaro.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
 linux-pm@vger.kernel.org, Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240828140602.1006438-1-claudiu.beznea.uj@bp.renesas.com>
 <20240828140602.1006438-3-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdUcstyRDfaQ0Y=1NHgBYuRWjC0vuJj2j8USCTsEE1qKVA@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUcstyRDfaQ0Y=1NHgBYuRWjC0vuJj2j8USCTsEE1qKVA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 29.08.2024 15:45, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Aug 28, 2024 at 4:06 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> If the watchdog is part of a dedicated power domain (as it may be on
>> RZ/G3S) the watchdog PM domain need to be powered on in the watchdog
>> restart handler. Currently, only the clocks are enabled in the watchdog
>> restart handler. To be able to also power on the PM domain we need to
>> call pm_runtime_resume_and_get() on the watchdog restart handler, mark
>> the watchdog device as IRQ safe and register the watchdog PM domain
>> with GENPD_FLAG_IRQ_SAFE.
>>
>> Register watchdog PM domain as IRQ safe. Along with it the always-on
>> PM domain (parent of the watchdog domain) was marked as IRQ safe.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v2:
>> - changed patch title; it was "clk: renesas: rzg2l-cpg: Mark
>>   watchdog and always-on PM domains as IRQ safe"
> 
> Thanks for the update!
> 
>> --- a/drivers/clk/renesas/r9a08g045-cpg.c
>> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
>> @@ -259,7 +259,7 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
>>         /* Keep always-on domain on the first position for proper domains registration. */
>>         DEF_PD("always-on",     R9A08G045_PD_ALWAYS_ON,
>>                                 DEF_REG_CONF(0, 0),
>> -                               GENPD_FLAG_ALWAYS_ON),
>> +                               GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
>>         DEF_PD("gic",           R9A08G045_PD_GIC,
>>                                 DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
>>                                 GENPD_FLAG_ALWAYS_ON),
>> @@ -270,7 +270,8 @@ static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
>>                                 DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
>>                                 GENPD_FLAG_ALWAYS_ON),
>>         DEF_PD("wdt0",          R9A08G045_PD_WDT0,
>> -                               DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)), 0),
>> +                               DEF_REG_CONF(CPG_BUS_REG0_MSTOP, BIT(0)),
>> +                               GENPD_FLAG_IRQ_SAFE),
>>         DEF_PD("sdhi0",         R9A08G045_PD_SDHI0,
>>                                 DEF_REG_CONF(CPG_BUS_PERI_COM_MSTOP, BIT(0)), 0),
>>         DEF_PD("sdhi1",         R9A08G045_PD_SDHI1,
> 
> Can't you just do this for all domains (e.g. in rzg2l_cpg_pd_setup()),
> instead of limiting this to the wdt0 and always-on domains?

I thought about it but this, too, but I wasn't sure about the behavior of
the currently unexplored drivers for RZ/G3S. AFAICT from the current code
investigation, if this approach is implemented we need to be sure there is
no sleeping in drivers runtime PM APIs.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
