Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16C4A215F4B
	for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 10:29:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728642544; cv=none; b=jdLYjDXrmDmQ0IV317rfgUBPCk/HmwbFZNiovPdedhDdqf6KNThiH0rRP258ge3no4bcAVSboKghcYTsnVgMSIw4Xwq2NJZfA++ShZ5b9jGje5uhpglCNPZM4yvYSXyzG6ptrpWHy16OwfA+t4LON+hGruwWIlrmhwetkjwsruw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728642544; c=relaxed/simple;
	bh=CpzP4jIAsLQFOci9vd7nVdcZrPbqR5o+VO25hWfgfVg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XtiQ8JZdT5YGQQMgZ4Vo3SkPGHHkXXGTWehsI6pCwhK1xhTmo824fjfNf7xwxomDtYzWt6fQiXY09TbltJ44Zs6vHZOlZ7ogF769bwcpj+X8ExJtS64L251OIpdgEu7vDUEvd70W9yR3yRHoBQN/NvstPVaWLUGB63462ccLfUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Ul1OhfFg; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Ul1OhfFg"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5c915308486so2547722a12.0
        for <linux-clk@vger.kernel.org>; Fri, 11 Oct 2024 03:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1728642539; x=1729247339; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nQe1ygN5+gjUxEVF95q+XKGxLHi73x/RYXOsryhpwc0=;
        b=Ul1OhfFgKMDiv/FHEGkYzhnIHRQpv8gpU7oc6KOsD038O4Ow3Mf4R5Ehlx8YIsTKLV
         LTcyF54jBm7u9f3owYIQkceei22FD2Fn2zgRRM3vPRJgtWkDa+/q4meSr+GE1VAL2AAD
         TLEKFTpYk/C6zjua/MiStTJnmVajH+sVoyCFHC3NAIdF3zbZB27T9AQblhOpw8r7Ms0n
         eQitOMZYbGAoOMbsXMRXGq5VOyhpl4OEgErCVuYBsFNyDU65nvR4f9pWEuQEnKFjZSYZ
         1gc7H2wQ+JuS0dG9NQkWJO6mpHdC5MZUtKlrhyD57nipadPyk0gU6Ca2fOBDxSKt/aVr
         wIiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728642539; x=1729247339;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQe1ygN5+gjUxEVF95q+XKGxLHi73x/RYXOsryhpwc0=;
        b=UKgab43UBujRNr5HCP7DvmtV08jj9/wdRALNFd81UPmkwS4ltHU/E/NstOJhQW0a6E
         VpI0bY1Vr3Bl6QktAAeBsR99Sjvp3PP/0NKV3FTFWPIE8iRTeWk+qjKHkonwbW58rOWx
         dVnDxH6LzgBUMptaWBtQej3rojB6wb7wnkPwVSndiziZCUc7k0CDxi71kuRcCfwpyPfc
         xOJaLM7NHUaC5A6/K9+hPwfTJM10r5lJGkEaaJ72pn8SvTV8DXOFY3vY/rqBa/zmvoTE
         jYb80U8hekrmQ2/Meyv8bZdN0HdKCbTTtzyZuVsRcDYcQ5DokCKRcdtl9qN9NziwbVJv
         o6fA==
X-Forwarded-Encrypted: i=1; AJvYcCWak3NT9xb/78Hkf514XwcwL16w+gHqBjLbkYqjoRIkl+JJi6hv65+HVei1lNhlnKeBi+vWQ5no9aQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4QgYSfUL9HadGARXLLRHxPop6Ks2bg5ikbnOl4FCdvLG8wXWL
	eOTwG5YFq+js2f+oJcWXy2h/qGrvpF0lPTieaGI0yLeEQAt3DLLoVCfoFr6y253vCCnNGH9zlxQ
	a
X-Google-Smtp-Source: AGHT+IGpFSe9PPuejO0Ed6dL5vV8hMNLXlFVjY2ecCHqdlPf7/F9v+d3+Yof8NsZqf50BjGWowvvQA==
X-Received: by 2002:a05:6402:348c:b0:5c8:8416:cda7 with SMTP id 4fb4d7f45d1cf-5c948ccf04fmr1246559a12.15.1728642539131;
        Fri, 11 Oct 2024 03:28:59 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.23])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c9371533c4sm1763989a12.54.2024.10.11.03.28.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Oct 2024 03:28:57 -0700 (PDT)
Message-ID: <4ff318b0-cd7c-4857-888c-a07c8985fce9@tuxon.dev>
Date: Fri, 11 Oct 2024 13:28:55 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] arm64: dts: renesas: r9a08g045: Add RTC node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240830130218.3377060-1-claudiu.beznea.uj@bp.renesas.com>
 <20240830130218.3377060-9-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVqno3vO9T0FtHnNL2afWP4abSE4vmf8vkLRRndg=ws7A@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVqno3vO9T0FtHnNL2afWP4abSE4vmf8vkLRRndg=ws7A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 10.10.2024 18:22, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Aug 30, 2024 at 3:02 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add the DT node for the RTC IP available on the Renesas RZ/G3S SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>> ---
>>
>> Changes in v3:
>> - added CPG clock, power domain, reset
>> - and assigned-clocks, assigned-clock-parents to configure the
>>   VBATTCLK
>> - included dt-bindings/clock/r9a08g045-vbattb.h
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> @@ -160,6 +161,22 @@ i2c3: i2c@10090c00 {
>>                         status = "disabled";
>>                 };
>>
>> +               rtc: rtc@1004ec00 {
> 
> Please insert this after serial@1004b800, to preserve sort order.

You're right. I though I have already checked this.

> 
>> +                       compatible = "renesas,r9a08g045-rtca3", "renesas,rz-rtca3";
>> +                       reg = <0 0x1004ec00 0 0x400>;
>> +                       interrupts = <GIC_SPI 315 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 317 IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "alarm", "period", "carry";
>> +                       clocks = <&cpg CPG_MOD R9A08G045_VBAT_BCLK>, <&vbattb VBATTB_VBATTCLK>;
>> +                       clock-names = "bus", "counter";
>> +                       assigned-clocks = <&vbattb VBATTB_MUX>;
>> +                       assigned-clock-parents = <&vbattb VBATTB_XC>;
> 
> Don't the assigned-clock* properties belong in the board DTS?

It makes sense to be in the board DTS, indeed.

> In addition, I think they should be documented in the DT bindings,
> and be made required, so board developers don't forget about them.

It would be better, indeed.

Thank you,
Claudiu Beznea

> 
>> +                       power-domains = <&cpg>;
>> +                       resets = <&cpg R9A08G045_VBAT_BRESETN>;
>> +                       status = "disabled";
>> +               };
>> +
>>                 vbattb: vbattb@1005c000 {
>>                         compatible = "renesas,r9a08g045-vbattb";
>>                         reg = <0 0x1005c000 0 0x1000>;
> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
