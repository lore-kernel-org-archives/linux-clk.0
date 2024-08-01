Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E4C1B4C5D
	for <linux-clk@vger.kernel.org>; Thu,  1 Aug 2024 17:30:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722533428; cv=none; b=WS11G0b+RiPl+ihcK+cqXZWztbs6s0UhPxi8eCJ33a4Xgw8/j8jT4lA1ycqCTp+4b4jKZiJCwe0g/CWo5Sy5uacdQE9If/3uMuxeKDcmkPNppm4+iWlM6jIHYBqDiufhx60YOAOB1dx2ENkN89S7zeAAwlzVfLWvXOcIFIRIyMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722533428; c=relaxed/simple;
	bh=/fUgmK9Gu4vJ7gtf9Uwd95qIKPDXf8jzzp6n2YLhY1g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AfJFiS05AqWQp3MuqwyAll3ARXq5udv7u6SEVceeedWDZtUSoGbc/GXa4VoCFhMS1/kEgGw7Tfa7BE+UwRuBwm2gTR48ftBxt6vxzamr1XU32KnbrIuxxCBY14x5D9b3w4cry5/DSMdYJpErAsq2r/3vi1aK3whveNGUtg4ZKlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=UH8cbPIT; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="UH8cbPIT"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4280ca0791bso45490055e9.1
        for <linux-clk@vger.kernel.org>; Thu, 01 Aug 2024 10:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1722533424; x=1723138224; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c1S/NlVwEFkZswb6EjZlJWrnVb2z/0QNSVhH+7F6wi4=;
        b=UH8cbPITQAJcH+25OYzB3QPkJVO5LcU8lJxWpD42Nd+THfyBF8l3l0wrg8YFg2qpHz
         eMB5bjocbDdQLJEqJ6nTRufuNsebaShpPXqdM7xtC8s434V+C1BbjierqO4N9imBANoT
         Ja3TNvua5bape0ZbRv8yk9HLRpmTOpXioMRHQzT8iqsQ07lV3k39j90r/FRFEK+KjQsr
         gespgsj6YLqA9os4JXzSXXMKSnrw1I+3AQiegThIqNryJ5FeXCzoxLbzhOMmJAWZROXL
         qau7l+f8rLdwFfhdu4VON+AtoSuS8z2KrIZH1qRfGkx1H862UVh8uNFjZR7ZxraEdPjV
         FGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722533424; x=1723138224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c1S/NlVwEFkZswb6EjZlJWrnVb2z/0QNSVhH+7F6wi4=;
        b=S3TddxrG2RYkUC1Uuf5lSFcxQMQCV4b0csWSPyq17ck82qYBp/Ul72eDX1AkfASl5x
         MCFekTllC0ppUv0CLnp5D/OEFKVvdMSIkvuccpbaDJ/9+Ru68ONzDYlvHtyddq/5/gG9
         BB7lcrk0XFPcwOLIwt3p3OfvI7/rcJCGmlafRhIhV2HM0kGTAp2BrAEp9eo8TFWFM0uK
         rrPduT0zHLaor1wxJNpi7TdJ+GQK3eArdfnqHDI3JRWeBNnHJBnLmMcmQcDqDt//t//3
         uiDlM9HVtzKVUokcob6a/8uzF4VESguHHSnJfXnfkW6tpQeCOjdLE2xlTMe5Ij6N2Uxf
         9bLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1zTJR/zbXm1TWy30/YNSHulQh414NxVIQ+OKYCX8BVSddS9nekVqxmOGYbbXIwkq0qB11gdp7OGyj16hVYv2gzbRMrbG9D/tR
X-Gm-Message-State: AOJu0YwqISyt3t3KYFgt22UotHymmAtkbF8J3bV7XMGESXlyTCDVyD7t
	ddhSrApQ8XiBtwKXw6y5pDgI65vKGmoWElQffHAURZa0bTQ+se1F2pQU9hPdq2uJuVlkACO9n4y
	q
X-Google-Smtp-Source: AGHT+IG94ZE4tjZfrkwC8a7+TJTJGffEWVrCsNnStDS6gDpPa28xGx43QNeVDk0gNocTArRCz6CJ5g==
X-Received: by 2002:a05:600c:524f:b0:428:17b6:bcf1 with SMTP id 5b1f17b1804b1-428e6b0a2bcmr4750555e9.22.1722533423582;
        Thu, 01 Aug 2024 10:30:23 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4282bb6405csm65736205e9.34.2024.08.01.10.30.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Aug 2024 10:30:23 -0700 (PDT)
Message-ID: <1145bd6f-fee4-4c3a-bd71-543127f89fc8@tuxon.dev>
Date: Thu, 1 Aug 2024 20:30:21 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r9a08g045: Add DMAC node
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, biju.das.jz@bp.renesas.com, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240711123405.2966302-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711123405.2966302-4-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdXjTw1NFaZhNiskiA+BQV68B61H=iwZbeV1qpVdKCjTjw@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdXjTw1NFaZhNiskiA+BQV68B61H=iwZbeV1qpVdKCjTjw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 01.08.2024 19:29, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Thu, Jul 11, 2024 at 2:34 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> Add DMAC node.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in renesas-devel for v6.12.
> 
>> --- a/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> +++ b/arch/arm64/boot/dts/renesas/r9a08g045.dtsi
>> @@ -363,6 +363,44 @@ irqc: interrupt-controller@11050000 {
>>                         resets = <&cpg R9A08G045_IA55_RESETN>;
>>                 };
>>
>> +               dmac: dma-controller@11820000 {
> 
>> +                       power-domains = <&cpg>;
> 
> Updating to " <&cpg R9A08G045_PD_DMAC>" while applying.

FTR: please don't as the watchdog fixes are still under discussion. Only
RZ/G3S watchdog support was merged.

Thank you,
Claudiu Beznea

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
