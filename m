Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388AD1DF738
	for <linux-clk@vger.kernel.org>; Wed,  6 Nov 2024 15:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730906716; cv=none; b=OzUl2MLbsdjb2VaAL/+6grB3gvb3szH9dt8BJo7xKlu6yc6wGAtYqbQSeTPwaUIT5EYmYrkX8IYsJDQo39gyBPSaMhoBt8J4tblIT7heQqY8MPhkZNFERqZRz/CzjppdQF9afjMLjtj9m8JSJ8uycWTptVzyVLLQeDA9aIGLwiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730906716; c=relaxed/simple;
	bh=825fFcUQnPqu974K62Cc6TOzabToD2+pOzemxF4MwRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kt+f4MMSb9BRkUlPL7vrN/4w3KLujy3c82wkbpVoEsrndo21ocjap+w04CEoDCgdP8lPg8BpFblJwCFRlLKmc/dqrQKCAFolnLmhtEpqXMXKdTuF9sSY2MaekL5y8FL1/sUsh9d0H2ReLUNm9I7bdeCo1w4tkemR30E6yk1XJlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=eAvksleF; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="eAvksleF"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-a9ec86a67feso144544666b.1
        for <linux-clk@vger.kernel.org>; Wed, 06 Nov 2024 07:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1730906714; x=1731511514; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dpz0KPFgwBV81mrLK+Jjg94JN4iKvNSkamb0eOPZLK4=;
        b=eAvksleF7W+C+ALDEBsiL1juBKu4OBb8yTa1Uos7IDPpjRzWA0CZkV4wDVvq2ubycU
         Ft1338HVt9x6/xBsWOh11mGoRQcs4Q3Humzxpd321W1ydp6fNVCBzXNlpEl7wMCHqJ3v
         M15fNINekBH6k/t+HanQpJNZVzIp18KAnAx0A0se/8nx5S1PrDd1cBWaIWSyn6JoAH6+
         2x2vii6jgBe1SbVnAFVbI8SsHMtqm8Tz1RV8oa/4Akr/n0hp0RUF80+nXI+uHREaCZsK
         8DFEWbUeyS60OtSybjOw2o11rgdamI52QSDgm31ETdpHr+4R5TL3TAdQ9YNjgUzllLRd
         yUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730906714; x=1731511514;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dpz0KPFgwBV81mrLK+Jjg94JN4iKvNSkamb0eOPZLK4=;
        b=PLBYP5PLuEDaffwmCHiCyk7Y1uDcgH1ks0yM/5kHgh4BiwwF3+lAOpoHtHDq7m4Z20
         PokSoDtyrOYdgwy0kcBz+ufxLn+Mq/bTorZXfvQ4V/g639lc0s0x1Fjox8A4nr5aSIp+
         /DAVEO69TlObp4unh4GaDMQDAiDlUZE2Bxui8kqAt9qE1lRfNJ3KX5hPmICucXb/aRYL
         vCWGmJnCBdBi+7biDp16+bKxb9eEVwJczqJNNIUFadcfc6kptTVgxaMuaCK4cvOLWP26
         93MTEYw3E/QV+Q4VXBjZP4h6rcTeHppm9l9ZOURZLJXywrOje0fc5HLhNmEcgd+OFQwX
         eBgA==
X-Forwarded-Encrypted: i=1; AJvYcCV+I6RaDL9Fo0bA5ZVWyqwQYyTDsMxmDGinyElZpkwoor0W21TOCAySIHohBVJfMg+eSPrL0GfbF7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKqSZ9g2sUTU2MfiFnskVYeUaQ9X/HGM1fx7nFO/NseHjODCj7
	HMNYefSJZ3MyYzbOlxZAg5v6ZomRMyW7vK83w6FJKVKApnfRDzI39yt/PgARWQ8=
X-Google-Smtp-Source: AGHT+IGCsBt4YImQ9v/cxMm8F2bd0t7nztI/dFwfKLybyOThX/4Zc2NTUaw9MVXNyjcZDUzvlEvVaQ==
X-Received: by 2002:a17:907:1a4e:b0:a9a:2523:b4ce with SMTP id a640c23a62f3a-a9de5c91985mr2353019666b.6.1730906713378;
        Wed, 06 Nov 2024 07:25:13 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.28])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb1814086sm294320366b.193.2024.11.06.07.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 07:25:12 -0800 (PST)
Message-ID: <5f524886-7479-44d7-b94f-21207c5a9ff9@tuxon.dev>
Date: Wed, 6 Nov 2024 17:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/31] ASoC: sh: rz-ssi: Use a proper bitmask for clear
 bits
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 support.opensource@diasemi.com, perex@perex.cz, tiwai@suse.com,
 p.zabel@pengutronix.de, Adam.Thomson.Opensource@diasemi.com,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241106081826.1211088-1-claudiu.beznea.uj@bp.renesas.com>
 <20241106081826.1211088-13-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWxmoUQSSnAVdqhpTQJYvUCJTL0EZbdKmLLhFWi8UCGkg@mail.gmail.com>
 <4e233ebe-b0e1-4b37-9063-bdbeb5980b13@tuxon.dev>
 <CAMuHMdVrKoyRuaa=jtZ5SJ3OX8ytGyN_jwv2uKX2ohGpg6yiuA@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVrKoyRuaa=jtZ5SJ3OX8ytGyN_jwv2uKX2ohGpg6yiuA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 06.11.2024 17:21, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 6, 2024 at 4:17 PM Claudiu Beznea <claudiu.beznea@tuxon.dev> wrote:
>> On 06.11.2024 16:56, Geert Uytterhoeven wrote:
>>> On Wed, Nov 6, 2024 at 9:19 AM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>
>>>> While it is still correct to pass zero as the bit-clear mask it may be
>>>> confusing. For this, use a proper bitmask for clear bits.
>>>>
>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>> Thanks for your patch!
>>>
>>>> --- a/sound/soc/renesas/rz-ssi.c
>>>> +++ b/sound/soc/renesas/rz-ssi.c
>>>> @@ -331,7 +331,7 @@ static void rz_ssi_set_idle(struct rz_ssi_priv *ssi)
>>>>                 dev_info(ssi->dev, "timeout waiting for SSI idle\n");
>>>>
>>>>         /* Hold FIFOs in reset */
>>>> -       rz_ssi_reg_mask_setl(ssi, SSIFCR, 0, SSIFCR_FIFO_RST);
>>>> +       rz_ssi_reg_mask_setl(ssi, SSIFCR, SSIFCR_FIFO_RST, SSIFCR_FIFO_RST);
>>>
>>> But you're not clearing SSIFCR_FIFO_RST, you're setting it?
>>
>> The bits should be set to reset the FIFOs.
>>
>> By "Use a proper bitmask for clear bits" phrase in the patch title or
>> description I was referring at the 3rd argument of the
>> rz_ssi_reg_mask_setl() function, which has the following prototype:
>>
>> static void rz_ssi_reg_mask_setl(struct rz_ssi_priv *priv, uint reg,
>>
>>                                  u32 bclr, u32 bset)
>>
>>
>> Would you prefer to rephrase it in the next version?
> 
> The idea behind such functions is to pass a bitmask representing the
> bits to be cleared to "bclr", and a bitmask representing the bits
> to be set to "bset".  In this case, you do not want to clear any bits,
> so the "bclr" parameter should be zero, and the original code is fine.

OK, I'll will drop this patch.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
