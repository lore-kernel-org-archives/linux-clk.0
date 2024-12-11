Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47C79229149
	for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 13:53:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733925209; cv=none; b=f9ZidHlX43LdOK0IsANvehlOyNSy8S/XEnMigjCZS+JAL7io30zrw82vjcmWciEkf7D2EC6FehuYrZihBIfETRrWZtCPBl4jpOd43QE0vKtbkFNYVJDMidfeVtqtev8OQnxjcYeG880WS5KR5q1e29Y3cmahT3N5cyyctJjGOkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733925209; c=relaxed/simple;
	bh=YSdh0Mm0FonlMgaa3imnf9PPReZOary7MqBo29RKeZI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MPhdqLhNWo1KMiB9q6R06E1ziz+CBlkgvi0tZOXZvQ9p53GBNtB6ow+qd9Z8wPwEeXK0OEk7Y48AMuebhL6ZOnTy1qKRljYtl2BsFuE49+fgqcThbFDsEfOA7CN9j70boa5Shtrk5TW0mzFngz8De8rTC7lHqB6+dpKn23G77uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=We7Ro6Qp; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="We7Ro6Qp"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aa69077b93fso470424266b.0
        for <linux-clk@vger.kernel.org>; Wed, 11 Dec 2024 05:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733925205; x=1734530005; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JAQ94DgwmZTsFqQuFhEr5XjtlJo5Liq/MWFSbEP7oQ=;
        b=We7Ro6QpXdFqx1EZCLNk/BGMGe7KhGl6PAlNriTd27U4td+pcYwIjAR39eWjr3fQV3
         hbwqiaKicF/joN8+62DAYg8Wf9/MURxT8V6z8bGdUlL0iV0Y0xNXupuRo9OjB3QYbfXB
         csYSDW2tU10Y1v8TLomFlX/NG62h5wyDlxRXMB8/GWwUj6vIlZrublRxbyO8JQNTZs1M
         OcPBeDjVKdSmVLyG3jFTn0n0XIj0HAlr/ZL0YbhyX4t0B5HGjOtgCwRfE8wv4qfhgf1p
         XHhWsm3/GVeyw5+QUaPsEKGZ4IfFzeXu8dZNVG5Z9qY2DOR51vj1yLn1M/mVxfIyXI4X
         sg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733925205; x=1734530005;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2JAQ94DgwmZTsFqQuFhEr5XjtlJo5Liq/MWFSbEP7oQ=;
        b=tiL5D2BIOb3bqcvphnX1PaajYoGugdoU11jhhQzpIe+otl2Cfg9Yy38aA6Du+6mHu2
         8C6s23mWgNZd49kQ+jD9hG2tAznVtdFYMj1JErAQTtRqRj46TNUR66/rAIfeGZI82roq
         kunV6/k2scj0JDawXeJR95SmHlfSbeSqFmsf6Mfs3tTO/mblyyij4fag3zRkKjuw+DSV
         qBwSDGsAqeXiGXcLJDwnfxsi2qxr96Mx7cLpNKL3xuvxur15WoDYhW54TNFtxX3+S5M5
         decXDzl9nBjEOIJHQyvetT25r+SxCKBjV7bUSpVOrwXSWf/PtSJw98SjkSDAwxluuJ//
         jbLw==
X-Forwarded-Encrypted: i=1; AJvYcCUDhSlDqPjemS1lAk07Lu4GCb6SXA+H+Tg+Ds3CViDG7RKI5ql7BE5lX3ZAoQ4TNVsKaz5PUG3G6ZM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7smBNd6OkByxSPNzS3t1zoGb1f7DzEQNp0+zH2CqRSYBbioGs
	g/JDz7a/0BoHzUc0ToKnC+IQoW+iPygXo4mmO5Sb3Epw2AIVPJ6D4g52WpsXWG4=
X-Gm-Gg: ASbGncu6imJ4sQn6PX/wQMzrEVKPrWMdk9+iKL1TsaR28IkztxgqaGnhr3xPlzHGnUc
	mZMHpjJBMbae2izDS7w+bTb/JsL6ZeIrKKeFRP3A9EamElWPJW5krguAENIdQsGz3o1V6AhtHDi
	bEtlj3jwSisZbkc6gdQ67VnrGrniQzNjwjZnDmA4HCHO39lN7MurvwCkXN2pRfzzDLDoeZtYw8J
	xWLrIMeMnYYjzZwP0XiMIvGePHR3KUZ485beDnWVTzRBiSHk0QC1y5zBV+mljc=
X-Google-Smtp-Source: AGHT+IHhR+q/yjOR8fMgpp+HvsWmN+ncd/5Lo5Mk+pkPGE0cvah/TqVw4ZywcOYOxY2cukLaXrgmug==
X-Received: by 2002:a17:906:b3a1:b0:aa6:75e1:186c with SMTP id a640c23a62f3a-aa6b1505cf0mr213318566b.50.1733925205362;
        Wed, 11 Dec 2024 05:53:25 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa653d1df95sm682900766b.98.2024.12.11.05.53.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2024 05:53:24 -0800 (PST)
Message-ID: <5e7d316d-2e13-436d-8474-48411e2a12d9@tuxon.dev>
Date: Wed, 11 Dec 2024 15:53:22 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] arm64: dts: renesas: r9a08g045: Add ADC node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: prabhakar.mahadev-lad.rj@bp.renesas.com, jic23@kernel.org,
 lars@metafoo.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, linux-iio@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241206111337.726244-1-claudiu.beznea.uj@bp.renesas.com>
 <20241206111337.726244-15-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVMQr9RhG7v32vQeSrepmdh2VdzzwF5obJUpdGNotGV7Q@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVMQr9RhG7v32vQeSrepmdh2VdzzwF5obJUpdGNotGV7Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 11.12.2024 15:27, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Fri, Dec 6, 2024 at 12:14 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add the device tree node for the ADC IP available on the Renesas RZ/G3S
>> SoC.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> @@ -87,6 +87,59 @@ rtc: rtc@1004ec00 {
>>                         status = "disabled";
>>                 };
>>
>> +               adc: adc@10058000 {
>> +                       compatible = "renesas,r9a08g045-adc";
>> +                       reg = <0 0x10058000 0 0x400>;
> 
> Table 5.1 ("Detailed Address Space") says the size is 4 KiB.
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.14, with the above fixed.

Thank you!

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
