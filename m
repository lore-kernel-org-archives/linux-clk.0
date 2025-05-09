Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AB82686B1
	for <linux-clk@vger.kernel.org>; Fri,  9 May 2025 11:03:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746788614; cv=none; b=Ksbo/a5eZuZFLGo29dAHeqgU+4SHKDE4Tqm2CSPDd9IDaVpAtMY6vIpgcuNDlCmwjyalAgEqC0lEaMyTKXWoeKP+wabAVyYJUG+R/yfjOSiYdZQ5RFSJh/oNMhSuAHxphnTNnX9c2qcaOz1lxxLUR+w2XSaMunT30VlYXLMkgNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746788614; c=relaxed/simple;
	bh=OgYLS6rN/aWcHmC0TbnGXQkvQ3XWroRBm3sInogUo9Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W/sp7HPcvSXGV8f1YD2SeKKWvpJPrwHYaobvDiuL8ZD9ixh0An76LOM01G11BrUxtfTZLPElahXmdnKjWYOiYafZM+b24dQLzBegSMeBR06e/0DIeMEokpdcvo43+tn3ZhZHPQV0zDb0pnWz4CTwm97qLPdHLizTqFnwbwaFbAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=rGssEQb/; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="rGssEQb/"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5f3f04b5dbcso3095767a12.1
        for <linux-clk@vger.kernel.org>; Fri, 09 May 2025 04:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1746788611; x=1747393411; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zFxcvkRZTPa+CugcSqwsIxPTpM3T5RF/mU8pEgzipws=;
        b=rGssEQb/mIDN7BNY717WLpYV6SOzTje2fhZx17ZG/qAxJfgCg7tEK/Dlrbzn3ceZke
         mCKlpV1q4SD3+/FZiijpkyliovb6/HCvFQDuEm6BEAkLnc3Qo1X+Ci13+d+q7hc3+PeT
         2b86KavOY8GP1JNFoj1Yf3ci9N0XRjA/NTauJdQrZA2qEpjWc0TP9wGMX0raTTFeRPWv
         QZ1+MTUFgNyE5K/vpDbfgz18BCoiO+H0z4yA3RUsgyEH+WRFE34ixTc7hzyadaQaL4hA
         usyCdpRvq4+NY9Sa8iTpUJeNDOQ1gOMxz8nLHI2bue1aPzYMJBVYZYNXoVp5z8KVTsvN
         5Mhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746788611; x=1747393411;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zFxcvkRZTPa+CugcSqwsIxPTpM3T5RF/mU8pEgzipws=;
        b=ufHJy7Yy2a/sxUJkFYIU57SyyJ01YsL4nbWYxbwOhxlboGxLOF5y2F6L5i/l18HOy3
         neRG8dRM0z9IJc92Bf6HKMoxs4DYP8eDAgr8PobRjDB01YJirTQEtsEQ0gqR61zB4jvs
         RMnQv/dfpCOYouvI/oLlzokmef2N1o0/FajJ6vpevKbf5blmyY4To0n5X3/6bN5Axk4q
         dfSZ2dZy5fFQhwpZDD0v7Pfqe84S4jeHqeQMW+eOyupr4R1YSFR6742CHi9ywPUCldfn
         LKGfrHn+4jtoW/IzzRijsqhPEU7RI/qhWQc5+CbrtzGVQDs91DAfcwAHTXc5K6z4Otl9
         KfDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVCzZaEG6+AO9SsOQ86dbYGYhro63gDoMxbdbPS7+qfpcptDsk2QcQoO+wMAmYv4wihXr4kQkdRVtE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yws4iq0f2+FHYCkNPI+WwS9V1fW11f/Sn+H7qd74b9tQmE9xm+E
	AHduWl86mcXWvVCTIwX7RH3Ag2Y/4Jd6OEJdQ/vBQ6ErpR/i0Az6xERwra5N5J0=
X-Gm-Gg: ASbGncsmg1Q5UKn1QcUvUOj15FqmIoOE8iQa4najPVCsNZYRBy5ekBJow8FKp1THl3p
	WH9551nxHcnKio4Dj3ayyP4pGpOQpnsaXlFgHQxUv3UOlyykNufM1suANk892roFsik5VyCbuUs
	LyEBfAijT3VLqX0QjuUQ/h7JZIdNuBCzo/G+SCPL+tGEjsQFUwJ36BYRHWS/FWY96DzZEHm5x8K
	VDc3oFVh4R0C5AhreACNrpMom+8KcGvolLseEW2z/nczNi9r9yf+B6a0RuJokpTHwhNTZtLfpIh
	ikTDoaGeN5p6/qNK186z1mf2teqo25CEE9l5pTmBrblDD7DY
X-Google-Smtp-Source: AGHT+IH/1p6uEeOzTVLPAx+9fTyhrp0ya4CKbQUgABhxisJMsnfrdqYaw7fre4wd9sK5d2WCYVgROA==
X-Received: by 2002:a05:6402:3581:b0:5fc:9bce:65c3 with SMTP id 4fb4d7f45d1cf-5fca0818926mr2247906a12.30.1746788610572;
        Fri, 09 May 2025 04:03:30 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fc9cc261e9sm1233651a12.23.2025.05.09.04.03.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 May 2025 04:03:30 -0700 (PDT)
Message-ID: <f3a0e26d-70ba-4f19-a10b-e60cb5a0bf6d@tuxon.dev>
Date: Fri, 9 May 2025 14:03:28 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] clk: renesas: r9a08g045: Drop power domain
 instantiation
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, magnus.damm@gmail.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250410140628.4124896-1-claudiu.beznea.uj@bp.renesas.com>
 <20250410140628.4124896-5-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVpy=89g0=-U4E4Kg=M_gS96RP26xDj_mUp=Lb1sjOHMg@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdVpy=89g0=-U4E4Kg=M_gS96RP26xDj_mUp=Lb1sjOHMg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 07.05.2025 20:10, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, 10 Apr 2025 at 16:06, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Since the configuration order between the individual MSTOP and CLKON bits
>> cannot be preserved with the power domain abstraction, drop the power
>> domain instantiations.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/r9a08g045-cpg.c
>> +++ b/drivers/clk/renesas/r9a08g045-cpg.c
>> @@ -192,59 +192,105 @@ static const struct cpg_core_clk r9a08g045_core_clks[] __initconst = {
>>  };
>>
>>  static const struct rzg2l_mod_clk r9a08g045_mod_clks[] = {
> 
>> +       DEF_MOD("dmac_aclk",            R9A08G045_DMAC_ACLK, R9A08G045_CLK_P3, 0x52c, 0,
>> +                                       MSTOP(BUS_REG1, BIT(2))),
>> +       DEF_MOD("dmac_pclk",            R9A08G045_DMAC_PCLK, CLK_P3_DIV2, 0x52c, 1,
>> +                                       MSTOP(BUS_REG1, BIT(3))),
> 
> The documentation is not very clear about the mapping to the 4 MSTOP
> bits related to DMA. Can you enlighten me?

I chose it like these thinking that the bits 0 and 1 are secure specific
variants of bits 2 and 3, thinking that they should be controlled from
secure world.

> 
>> @@ -294,78 +340,6 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
>>         MOD_CLK_BASE + R9A08G045_VBAT_BCLK,
>>  };
>>
>> -static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
>> -       /* Keep always-on domain on the first position for proper domains registration. */
>> -       DEF_PD("always-on",     R9A08G045_PD_ALWAYS_ON,
>> -                               DEF_REG_CONF(0, 0),
>> -                               GENPD_FLAG_ALWAYS_ON | GENPD_FLAG_IRQ_SAFE),
>> -       DEF_PD("gic",           R9A08G045_PD_GIC,
>> -                               DEF_REG_CONF(CPG_BUS_ACPU_MSTOP, BIT(3)),
>> -                               GENPD_FLAG_ALWAYS_ON),
>> -       DEF_PD("ia55",          R9A08G045_PD_IA55,
>> -                               DEF_REG_CONF(CPG_BUS_PERI_CPU_MSTOP, BIT(13)),
>> -                               GENPD_FLAG_ALWAYS_ON),
>> -       DEF_PD("dmac",          R9A08G045_PD_DMAC,
>> -                               DEF_REG_CONF(CPG_BUS_REG1_MSTOP, GENMASK(3, 0)),
>> -                               GENPD_FLAG_ALWAYS_ON),
> 
> [...]
> 
>> -       DEF_PD("rtc",           R9A08G045_PD_RTC,
>> -                               DEF_REG_CONF(CPG_BUS_MCPU3_MSTOP, BIT(7)), 0),
> 
> These MSTOP bits are no longer controlled. Is that intentional?

No, that's a mistake from me. Thank you for pointing it.

Claudiu

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

