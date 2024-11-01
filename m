Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AF61157487
	for <linux-clk@vger.kernel.org>; Fri,  1 Nov 2024 08:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730451201; cv=none; b=dGRrKx2MCxygzdJ19+uSkn7Vt/g2bYPy3aBDxjIaa8Kof6TVPDvr7DOlIsqDzuFHapeZCJChBXkcBT3P3BqELbl0McKoAO61Exccgltg+2EXz/1lfF3NtiTgpzbRgFwNIQfB0HTbqnDu51D3eCcy6wM2aaYx8dGCPx9ZEZcbLLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730451201; c=relaxed/simple;
	bh=kstV2gF0zr5kBHLp1ywmO2z5iBJT5icL+Gz+lQBY48o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MifM4haVb+FgEo87w5esqeRbaACts9+raJcuWIx+ydOro1xD/R8U6lvoYTG54GWy8hIfnPq7RYNwIchs5OfISDgrr94U5pna/3Qs4c9G+PCt5XZAV8IfYBYatpJIwfbhBM7U53uyjOeQqYOFo0FzsCBuJd9s2WiB4ytsH3OBQFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=TB+PxxVa; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="TB+PxxVa"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5c9c28c1e63so1960898a12.0
        for <linux-clk@vger.kernel.org>; Fri, 01 Nov 2024 01:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730451195; x=1731055995; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n/lzYU0FpFCkrz0oZB5hrlorKli7TkTBu5tvutCnhvA=;
        b=TB+PxxVaG3g9uidZOe+9BsacVZTjeOgDM3qyml0cXwNvuZeZvjkrZkX46szS0bJI7+
         JlvTk/vQrtt9Pdga2TyDGUlXNRJoYcVDQ7A78RRymSuxLXOc5Ep/wcM8spFZkKnyMj3X
         fz0J71IYv+PVdvljBv4tkdWkWZDbCWSOsnByMyJsZwvQemy7lEZnjFBNuxnu9VdZPEqO
         a37RZsMZrLA3D6cVG9IAukHBeOIWI+SED/XfLcIgUo0MNNkrbJG+HCdf20oYqxS1fD54
         MByGixlGRD1atfKD9qAxi5/66U4UvdTd2ngVjRFvcEq9RzXv1jht20puqmnWegLI9IlC
         8yqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730451195; x=1731055995;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n/lzYU0FpFCkrz0oZB5hrlorKli7TkTBu5tvutCnhvA=;
        b=duTvlnVKwnxX47+/VZLESNqwiWky0Mb+LC4LOqnwsswA3gz2zoalHAqXzAAvW779ob
         UFbYFgkE6A+pIPQDXsURbv8hMPZwwZ03c1QSXEKrlF9HKUVYX/qwMXQPMitTEHrAvK2d
         fsG5U0gwY19kNlHcXGBNLDfUzubHrsiGRlGyFQPyqHAbTIYyB6V19jCRu1BgFc0OI+ur
         LzquuQdjHsEg/azfobOn43n+AfWgbPOQYalVl5QqZmzZT0WbEWazDYVbqXDjIywOyw8b
         GH+zDs1wtpNn6LGfBeMYqD4Ftu2m0lzdsW92PRoeSbaKnuRgEJW+JmEzAQk1d6T0Obrk
         5YdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWa6NpiIBOncmEh5tv3qWahO6Lrwt9tEL+Ec9MlQhtfpbGKe/Kb9E44v6aoKmwAMWHPXyKJR5q5AV0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsh7eFkStcOky0EMK6vrkCvNoModgZsgJpGaUCHHaV2z//gVSL
	kxUF6RqBh+ffJb78aH0Bofq3r1zG7h5ecTaI9sTfp+2J8pkckjN1amW7srQzga0=
X-Google-Smtp-Source: AGHT+IEj3KxbXi2bqvHFQc5tuBqv3rzxtxnuw/COMIJuYYxNFOMzNrLwH0maLO3jY5NZdwEHAAxYkw==
X-Received: by 2002:a17:906:c113:b0:a9a:533b:56e3 with SMTP id a640c23a62f3a-a9e5092a4b5mr640607366b.26.1730451195054;
        Fri, 01 Nov 2024 01:53:15 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e564e96a9sm156826066b.97.2024.11.01.01.53.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Nov 2024 01:53:14 -0700 (PDT)
Message-ID: <fa63898a-33f2-44ad-88ae-bd125e48b71e@tuxon.dev>
Date: Fri, 1 Nov 2024 10:53:12 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] clk: renesas: clk-vbattb: Add VBATTB clock
 driver
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com,
 magnus.damm@gmail.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241030110120.332802-1-claudiu.beznea.uj@bp.renesas.com>
 <20241030110120.332802-4-claudiu.beznea.uj@bp.renesas.com>
 <mg2ugyg65ke3tngzqyyixfkawf4iop4o373dc6fosy7bfydbe5@pm43dhkd7asu>
 <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
 <ee94a802-97ec-4a9b-9ca4-5c14e0eba116@tuxon.dev>
 <bcc49824-b350-45d0-af84-8458a28d5eef@kernel.org>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <bcc49824-b350-45d0-af84-8458a28d5eef@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 31.10.2024 11:46, Krzysztof Kozlowski wrote:
> On 31/10/2024 10:26, Claudiu Beznea wrote:
>> Hi, Geert, Krzysztof,
>>
>> On 31.10.2024 10:43, Geert Uytterhoeven wrote:
>>> Hi Krzysztof,
>>>
>>> On Thu, Oct 31, 2024 at 8:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>> On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
>>>>> by the RTC. The input to the VBATTB could be a 32KHz crystal
>>>>> or an external clock device.
>>>>>
>>>>> The HW block diagram for the clock generator is as follows:
>>>>>
>>>>>            +----------+ XC   `\
>>>>> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>>>>>            | 32K clock|      |  |----->|gate|----------->
>>>>>            | osc      | XBYP |  |      +----+
>>>>> RTXOUT --->|          |----->| /
>>>>>            +----------+      ,
>>>>>
>>>>> After discussions w/ Stephen Boyd the clock tree associated with this
>>>>> hardware block was exported in Linux as:
>>>>>
>>>>> vbattb-xtal
>>>>>    xbyp
>>>>>    xc
>>>>>       mux
>>>>>          vbattbclk
>>>>>
>>>>> where:
>>>>> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
>>>>> - xc, xbyp are mux inputs
>>>>> - mux is the internal mux
>>>>> - vbattclk is the gate clock that feeds in the end the RTC
>>>>>
>>>>> to allow selecting the input of the MUX though assigned-clock DT
>>>>> properties, using the already existing clock drivers and avoid adding
>>>>> other DT properties. If the crystal is connected on RTXIN,
>>>>> RTXOUT pins the XC will be selected as mux input. If an external clock
>>>>> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
>>>>> mux input.
>>>>>
>>>>> The load capacitance of the internal crystal can be configured
>>>>> with renesas,vbattb-load-nanofarads DT property.
>>>>>
>>>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>>>> --- a/drivers/clk/renesas/Kconfig
>>>>> +++ b/drivers/clk/renesas/Kconfig
>>>>> @@ -237,6 +237,10 @@ config CLK_RZV2H
>>>>>       bool "RZ/V2H(P) family clock support" if COMPILE_TEST
>>>>>       select RESET_CONTROLLER
>>>>>
>>>>> +config CLK_RENESAS_VBATTB
>>>>> +     bool "Renesas VBATTB clock controller"
>>>>
>>>> tristate
>>>
>>> Good point.
>>> However, does it work as a module, or would that break the RTC?
>>
>> On RZ/G3S the RTC counter needs the clock provided by VBATTB.
>>
>> I'll try with this as a module.
> 
> So it will defer, why would this be a problem? This does not look like

No problems with it. I wrongly phrased it. That being said, I'll set
CLK_RENESAS_VBATTB as module along with RTC and do the proper adjustments
in drivers/clk/renesas/Kconfig.

Thank you,
Claudiu


> critical core component, which would halt the system probe (and even
> then systems like Android put everything as modules).
> 
> Best regards,
> Krzysztof
> 
