Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32F3192B89
	for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 09:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730366791; cv=none; b=DRzMQyqUQyTF/86GVXclijULWwVRHQmhVy8F/pSvoWLD9fazaYj/QiVvtg+JWrCBRmjvQN/cZXNVbV3cETXyaL3igYgP7NY68FuSVXIoyBKVG1BTNRoskTY13qW7qZb25tlczZuv8v5RYKBtm8iV3B8C16MQqRUR0ZM+kQ2Bxls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730366791; c=relaxed/simple;
	bh=W+7WITvQz2ZgCwS9oNFaKkBroXYi4X6KRO4xqfT+YUQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eoeSmFrprAS4Tjx4kncUaVPVvNaQHfhlGfBJLL02jGIYeMtzQDnYzI8R+U2+q8QGjt91J+YY58AYRJP3kMlhfl5y4OYL9PmLx7Y/jIHGEkFbs3CSbf9u8CBFKbcSaqvGLCvT2uEqBSJ6N6sNHaWkt31+ehPmaLs9BIaPKI5ER6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=q+uQKR6p; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="q+uQKR6p"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-539f4d8ef84so902059e87.0
        for <linux-clk@vger.kernel.org>; Thu, 31 Oct 2024 02:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730366786; x=1730971586; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WPySU9GG1bDdptaowyq3VjxeujL5zBs3sjWS8sIYgHw=;
        b=q+uQKR6pkACB75xQMn3++eVBRS7sJIf7dk+y3++vj9EYnyBUzJVi1HvR+OL9uJRzIf
         mqKetllPpd8T/2jYbu5bh2G/v1lkywjkCeZQiXD5DyDRpnww3Q14AfK5fmsjYpblaWnf
         o/sgTrFl3hfU6wLKcvBXlNdhrfCBbKX0BPV2fqlROpJGvXOJ3yOnBJpuxBevp94k5pvO
         wZI8K1LU9c/oooBTQyHVgVI7DH3FRRewgf2P5TCfvVTK7uNnuJ+Q/u8F0cV42/8NLZAX
         Q5WYtwok1dOGng+OTpqsZbSuhCBSyLI4NrUMurGqpLVU/IingGWFAPeFU7hiuKTayMn7
         5svw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730366786; x=1730971586;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WPySU9GG1bDdptaowyq3VjxeujL5zBs3sjWS8sIYgHw=;
        b=YaGYzn+Bx23Wwso2NwPGjHnFb6mADCKqAb4p0v92d0hc1Hg9uN346fhlhPvTvGr3GH
         a/fND2Ai7fSYn0Ru0X3PN2z5Jdrz6Yvk3pay+i+sXy/+/LSoQiAdx6Vye16SOqVLSN1o
         DtjVeotk1KSLdZQlbBkARpO8H3NRKhxve8rAqjgNol8M7o2EcZTPIbzkhPn+65p1vJj3
         ID9auhtzl7gDS2SdUjWa7UycH5Cl/BA4C7M5jQt/6IvRJysnQHfli1UsTyr7E3CtPHkS
         msUUDIRp9bOQ8WsGE5l0whJ07ahIo9uX1u7G92TF/F2blL+wcXQ+cWi7eSLA+8GHMdVo
         lX/Q==
X-Forwarded-Encrypted: i=1; AJvYcCW1uzv44CjmBLhv7zCzPXoufLulBZ4NxnwyMDqrM4EU8OMXvTL+EO1lGPG6VZ50Gzeah9wgavYFFO4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUypvuTv+ik3fQn9rEBrsuMrVjv5C7eK2NXUx9Z0dWu9Pez+lv
	M3StTuMROqBj1qBW2nknuyyi/Up2ts1Pf1NFuhPTaEBHZUEnbOAxi9N2FOqOeQ8=
X-Google-Smtp-Source: AGHT+IFx8MLTqlbYOXV70FjxcgUiPu/8my35yVrkTf/0/c/FdNoy8F04GpO/K6glzhe+yo4QhhnwIg==
X-Received: by 2002:a05:6512:b94:b0:539:f7ab:e161 with SMTP id 2adb3069b0e04-53c79e8ec22mr1531829e87.45.1730366785959;
        Thu, 31 Oct 2024 02:26:25 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.190])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431bd917fefsm48372175e9.16.2024.10.31.02.26.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 31 Oct 2024 02:26:25 -0700 (PDT)
Message-ID: <ee94a802-97ec-4a9b-9ca4-5c14e0eba116@tuxon.dev>
Date: Thu, 31 Oct 2024 11:26:23 +0200
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
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
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
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdUcw_UHAZRVGt=Tr0jv3NOPDibtPy1E-46Pq74YKFZxWg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert, Krzysztof,

On 31.10.2024 10:43, Geert Uytterhoeven wrote:
> Hi Krzysztof,
> 
> On Thu, Oct 31, 2024 at 8:48 AM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>> On Wed, Oct 30, 2024 at 01:01:13PM +0200, Claudiu wrote:
>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> The VBATTB IP of the Renesas RZ/G3S SoC controls the clock that is used
>>> by the RTC. The input to the VBATTB could be a 32KHz crystal
>>> or an external clock device.
>>>
>>> The HW block diagram for the clock generator is as follows:
>>>
>>>            +----------+ XC   `\
>>> RTXIN  --->|          |----->| \       +----+  VBATTCLK
>>>            | 32K clock|      |  |----->|gate|----------->
>>>            | osc      | XBYP |  |      +----+
>>> RTXOUT --->|          |----->| /
>>>            +----------+      ,
>>>
>>> After discussions w/ Stephen Boyd the clock tree associated with this
>>> hardware block was exported in Linux as:
>>>
>>> vbattb-xtal
>>>    xbyp
>>>    xc
>>>       mux
>>>          vbattbclk
>>>
>>> where:
>>> - input-xtal is the input clock (connected to RTXIN, RTXOUT pins)
>>> - xc, xbyp are mux inputs
>>> - mux is the internal mux
>>> - vbattclk is the gate clock that feeds in the end the RTC
>>>
>>> to allow selecting the input of the MUX though assigned-clock DT
>>> properties, using the already existing clock drivers and avoid adding
>>> other DT properties. If the crystal is connected on RTXIN,
>>> RTXOUT pins the XC will be selected as mux input. If an external clock
>>> device is connected on RTXIN, RTXOUT pins the XBYP will be selected as
>>> mux input.
>>>
>>> The load capacitance of the internal crystal can be configured
>>> with renesas,vbattb-load-nanofarads DT property.
>>>
>>> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
>>> --- a/drivers/clk/renesas/Kconfig
>>> +++ b/drivers/clk/renesas/Kconfig
>>> @@ -237,6 +237,10 @@ config CLK_RZV2H
>>>       bool "RZ/V2H(P) family clock support" if COMPILE_TEST
>>>       select RESET_CONTROLLER
>>>
>>> +config CLK_RENESAS_VBATTB
>>> +     bool "Renesas VBATTB clock controller"
>>
>> tristate
> 
> Good point.
> However, does it work as a module, or would that break the RTC?

On RZ/G3S the RTC counter needs the clock provided by VBATTB.

I'll try with this as a module.

> 
> And this is missing
> 
>         depends on ARCH_RENESAS || COMPILE_TEST
> 
> which I can add while applying.

Thank you!

Claudiu

> 
>>
>>> +     select RESET_CONTROLLER
>>> +
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
