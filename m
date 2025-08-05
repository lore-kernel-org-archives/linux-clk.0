Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940A01C3027
	for <linux-clk@vger.kernel.org>; Tue,  5 Aug 2025 19:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754421537; cv=none; b=tf3/BaUJwBTxjYP8jEcnNBo5i59IPhi1ErZeAulU3YZ9Twk0cEsHhg2WRVVylTjwW11fsjTinrTSLQ9aoB0MAy0IuG48ooEckoUL6vzy+rISS7NfRvXvQ/NG8dqmAYkOEGI0X7shXGJ3MnyqnsdGfgzVUQnPyn04p2QvR4+jeYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754421537; c=relaxed/simple;
	bh=khGjDmYoi+SVIixaAvFiERs00u6nBzroY7eGFW5roXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BgHaF/RZ03eWxX7AxOY63OMK+7BjKboTlVUl4dODa5SoOWQVZMzmBVB4JpEQMaVyC5mYkrozFcLf/eULiW/WXpnIDRsWkstqTqN/V966G+RIiH69kWG4g8TUaiw++wyD8u/ji9VFrYeBv1TZ0yvFgFU2cpUFleWY3HcMFRy7ZJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=ildi21gB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="ildi21gB"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-af94e75445dso582537366b.0
        for <linux-clk@vger.kernel.org>; Tue, 05 Aug 2025 12:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1754421533; x=1755026333; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=140O1ncFTG+fzY5FppRujDaW5fNy7s7sdArHFrnvSdA=;
        b=ildi21gBaTCVHfyjhck7rIu82xWd/B92KfQss9RFmmMU8Otrqj0HHIxZ/6y61wudjM
         6im+StLavEfnjjWmOTDtmDYvdZANYMxMSkwGQ9ovlAfcU+mK/N4bNqcazL95ks9VIFjf
         hwW0G1AaokOmET+Uzc4IHglz8+S6CHUJXE64WP53fquMenKmQM2hrIpjZYCkv1co58rJ
         j+V/RaKdo5mO4DN28MBEb8K4hPnmXQ2MjyNfpsLI/h+RtgfE/hVx+eFa5EQTSRDMY+yu
         8SURZLIcMFS0x+P7MeYEt5TXjxWZVj+2ha03evTdWZPVXZqwOSdd+6fWFkSmQNqWkt5F
         aOZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754421533; x=1755026333;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=140O1ncFTG+fzY5FppRujDaW5fNy7s7sdArHFrnvSdA=;
        b=hUy9GkCZRXQqsWk59CBZJDyYD3r5Gv+XLZXZwTVgzFhdBMLe2lwAx0tcWk6mYSWKUR
         LiKGUiFxlm15ajpvnotou39QBqoya5gSOHcFC8rs6BEW0xtcz+PadCUuR2MR8f8dNq1/
         lc1Xd8iIHxyhP9eLhQZVWIhqFdD3bVXuT3NwIg+lEZJIGs9JZu6BvcOC9mlDGX/Ao5HL
         vsyb/gWRKwSLdWmFRnb2GfVvhja4EDpBjGF89RQBbMhH3xGcCgvrdMCBiFjDh+mA9rsv
         s9Luv2bxcwJZ8MDNIXoy8N6Y7L2A4imDeyo8uEkYqjppSyXSAIA9lUwcRSD+Td6wN9Xu
         j9gw==
X-Forwarded-Encrypted: i=1; AJvYcCVcKLWvk9eo3ZKGdYhWMIzoWfeAPqw9cWukF92MZC8R9/vxwPfI0/Yuh8WEayE7qhmePSTCev62FZY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+k9JhAtCDyUjyADW9cqAlvBu6ePjUtHgoWh+WRJbYfRPxusYT
	sGZyEU+5iG5aCSbGbCktXgMf/xRnOl4uameM9HgmlALP9l/5fTBpBwjhGbcz40v5s30=
X-Gm-Gg: ASbGnctcwIZlSbgMv3xFCgnmmPJ/FryvyaIlI54kJClXNzpt4XCc1f/v1YQp+J4jv20
	dKiZ9Jbqrj/NGLoUubY//w1Gkm1PuCJu/lojXTsWkkYKRtIKWYd/YdRtKHGdxPcmfZ0ZmjgeUCD
	goV9sdqzeYBLjuKbN4eyPAj0Q2h+meU5tYJRstdADAchDGPbxt4TapygysoTEph7s5+lVEgWrwa
	BVNEH3Zvxpx1jrRXuhjt+79e8AqfHb3qmz/XhefU2ywbTNu8cO3s9mvcJHq+G7odV7TR+5VcjPB
	CyDDAicp+QTJRKZVKQAhcZu67b4KKp6N1K782SWKEK9AapXw8B9jd+sDmOacIAwe8M9Nht4r8EK
	OEYYfTK+YYdUtPNeEIjbgddGvK3Xix/0=
X-Google-Smtp-Source: AGHT+IEzXYwKjDntoDBqUMYR9EV4V8wSDk+SRkS8ZRK9bW7nJsA/RiJNAmx7QhFIkvnw2H395/NCDA==
X-Received: by 2002:a17:907:1c84:b0:ae3:f3c1:a5dd with SMTP id a640c23a62f3a-af99050715dmr11853966b.61.1754421532805;
        Tue, 05 Aug 2025 12:18:52 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.188])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a078a11sm974656666b.7.2025.08.05.12.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Aug 2025 12:18:52 -0700 (PDT)
Message-ID: <0e718be7-32df-4fc1-af49-8dfd42143d55@tuxon.dev>
Date: Tue, 5 Aug 2025 22:18:51 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] clk: renesas: r9a07g043: Add MSTOP for RZ/G2UL
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250704134328.3614317-1-claudiu.beznea.uj@bp.renesas.com>
 <20250704134328.3614317-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXfGg6KfKt4dGf8NrboEPXF7fnq+dcM=sppYcgcq3csvw@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <CAMuHMdXfGg6KfKt4dGf8NrboEPXF7fnq+dcM=sppYcgcq3csvw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Geert,

On 04.08.2025 13:18, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, 4 Jul 2025 at 15:43, Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add MSTOP configuration for all the module clocks on the RZ/G2UL
>> based SoCs (RZ/G2UL, RZ/V2L, RZ/Five).
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/drivers/clk/renesas/r9a07g043-cpg.c
>> +++ b/drivers/clk/renesas/r9a07g043-cpg.c
>>         DEF_MOD("canfd",        R9A07G043_CANFD_PCLK, R9A07G043_CLK_P0,
>> -                               0x594, 0, 0),
>> +                               0x594, 0, MSTOP(BUS_MCPU2, BIT(9))),
>>         DEF_MOD("gpio",         R9A07G043_GPIO_HCLK, R9A07G043_OSCCLK,
>>                                 0x598, 0, 0),
> 
> MSTOP(BUS_PERI_CPU, BIT(6))?

Yes, this should be here. I'll add it in the next version.

Thank you for your review,
Claudiu

> 
>>         DEF_MOD("adc_adclk",    R9A07G043_ADC_ADCLK, R9A07G043_CLK_TSU,
>> -                               0x5a8, 0, 0),
>> +                               0x5a8, 0, MSTOP(BUS_MCPU2, BIT(14))),
> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 

