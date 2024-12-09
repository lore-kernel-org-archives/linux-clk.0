Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49FCD35941
	for <linux-clk@vger.kernel.org>; Mon,  9 Dec 2024 13:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733751122; cv=none; b=Js49m4d2dMVT2NXtirBOFWVVug3kJdvM674W7lWixK/IS06VZ03e6n6Z+EZJfHqUwbJyl2elGQbhKoA8HO5e6oeF8yXVmsQ5NmVanRAM84TZfbYp74CmnmDNG3+fuM6EgIEo9IGeTW0f8pyHWF6iDHVTTxNI9OijN6xAwRYxct4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733751122; c=relaxed/simple;
	bh=d9PZTUr6orWHC23l539tFQMpBlNZRrC0wSrH3eHbn6A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IIWOrn9bPnQAJrZQvwEYY5nMxWA1c/o6sWlo/Zyq2uUC0PYfJJCclePQ567mEaULuwNW8IByqATGToDTBZjEIzaxigM1NiMchsXxLNZG5w09ItY2kavRUkzQARx/9BNGU6kwH4bQ9FZP+4dL48xQrd3ZtgZGSUwMWqQ11UrhDac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=qPs8Xzsk; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="qPs8Xzsk"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so5339944a12.2
        for <linux-clk@vger.kernel.org>; Mon, 09 Dec 2024 05:32:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733751119; x=1734355919; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BbxG3yBrfjzh5m7OHA690Ws9nh2pSGo1XTyv9ZWjP/M=;
        b=qPs8XzskI4s8GAW0T+6e6bq0we2GDAz/a5wNCsoi3/PiayF4ixL+oKHZKTMf23BSR2
         wqVaIXStsXhaV7kFTOSiomjw59CJr8zGq1hLUl6dxBwnVBr5Ju3uqr3H2yVzBbs10cHk
         Ft7+O6akMOEEmJfmU/t8j7rr+YVgr0JpB1OksVizPJA50Izq2dAPg4iIkjVNnzTEOAxY
         flX+Dr+LWOYTHItDXS3Wqlhs2m+Sv5RzqY1BQp53vZ5TXH7Pn88i4vt06F9WDsHdSwzo
         okK4FWqrSnymwcXx7Ithj9Z39LUAZ65LnIxiBhQ6b9Vmi/79yqqwrH53iuczjsItfnjR
         I2ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733751119; x=1734355919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BbxG3yBrfjzh5m7OHA690Ws9nh2pSGo1XTyv9ZWjP/M=;
        b=PlYHchiFdvjyxWBB782n6Yw3bL6XWBT1HymN8cdS13DP5vY0lupMCWNZ9LZ92fMAD6
         /W+RZjmCnYBgbLxj84BnY7/BBWI6rRu3SaoGfoPNc9qExCAD8pLhZl1BPz2kvrFqTG+L
         1zV4MeyqWIzxQSBqE8Gi4ANljw4echQuXG+SAgX3iGGS2eHUr3XOuVkf2myEMs4ZHZUO
         g4Uww5sqMUjneKfUDoJ/1VxxbzulI6BoZwYeBA5c8fXxwCujcgN48DubeQZcQWy12Qyg
         W0LQjCPHjxLrrH1+GjzJNrRV8LdWl0CUifjR7wnFxAyBFr2nJ5iOYrsmhZ6qwcJh5Syf
         VVfw==
X-Forwarded-Encrypted: i=1; AJvYcCW8Xa5sne+QWirppC0M0gGX+yTKWXswa6MTEISigDgz7JZAU44tQMPAt25I64hGjzvBXd03fiZzg5Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yznf9003PblVZqmd9mKDddJcPgvi1ctIWdUGkM2cuTccvdoUUtR
	NUZ42cVILtghXUWGj9UANYun8o7cmEE9DLzmjmGIr4PFcLk07eM07HCWsQjJHfo=
X-Gm-Gg: ASbGncuytNJD8J9c19H1fODppfufkiVCV3nykHNwg45PRhfU/TZXtMUoIqaMiBEv+LQ
	mO+1VnfeAvTneczM0PpV80EDZKmuw1kAMX+dvltwCErNN3sgzfXsfpMhN2bZSn8y3E1OIk2KXY9
	QssjEedNj+HWIaCe4BetJBH8N5XikrY2NE43VWRoLdMHqB4mmWCb/ednia/XtJidPbekmGG2SqK
	FZI2/RJjCKodwCBHo3Winv7fahOU9y7POa0OJT4Rm81yr75NasAUsNPwtE=
X-Google-Smtp-Source: AGHT+IEsrlESQiYVoiKv8vD0ypOrjTVD+6RHuECL3G9XiqxEE715IsjeegDQVL8LbbssL5zLsoGdrw==
X-Received: by 2002:a05:6402:2689:b0:5d0:b879:fa36 with SMTP id 4fb4d7f45d1cf-5d418506a04mr834126a12.7.1733751118594;
        Mon, 09 Dec 2024 05:31:58 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d3ec8ef816sm2678075a12.59.2024.12.09.05.31.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Dec 2024 05:31:58 -0800 (PST)
Message-ID: <97049f44-cdcf-42be-aefb-c535bd7d0dbc@tuxon.dev>
Date: Mon, 9 Dec 2024 15:31:55 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/25] ASoC: renesas: rz-ssi: Use only the proper
 amount of dividers
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, biju.das.jz@bp.renesas.com,
 prabhakar.mahadev-lad.rj@bp.renesas.com, lgirdwood@gmail.com,
 broonie@kernel.org, magnus.damm@gmail.com, linus.walleij@linaro.org,
 perex@perex.cz, tiwai@suse.com, p.zabel@pengutronix.de,
 linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org, linux-gpio@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20241113133540.2005850-1-claudiu.beznea.uj@bp.renesas.com>
 <20241113133540.2005850-8-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdVms8xKxuX=gC49ognvXmY+8a3SttJOG=7iuCUVL4vcdQ@mail.gmail.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdVms8xKxuX=gC49ognvXmY+8a3SttJOG=7iuCUVL4vcdQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Geert,

On 09.12.2024 15:22, Geert Uytterhoeven wrote:
> Hi Claudiu,
> 
> On Wed, Nov 13, 2024 at 2:36 PM Claudiu <claudiu.beznea@tuxon.dev> wrote:
>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>
>> There is no need to populate the ckdv[] with invalid dividers as that
>> part will not be indexed anyway. The ssi->audio_mck/bclk_rate should
>> always be >= 0.
>>
>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
> 
> Thanks for your patch!
> 
>> --- a/sound/soc/renesas/rz-ssi.c
>> +++ b/sound/soc/renesas/rz-ssi.c
>> @@ -258,8 +258,7 @@ static void rz_ssi_stream_quit(struct rz_ssi_priv *ssi,
>>  static int rz_ssi_clk_setup(struct rz_ssi_priv *ssi, unsigned int rate,
>>                             unsigned int channels)
>>  {
>> -       static s8 ckdv[16] = { 1,  2,  4,  8, 16, 32, 64, 128,
>> -                              6, 12, 24, 48, 96, -1, -1, -1 };
>> +       static s8 ckdv[] = { 1,  2,  4,  8, 16, 32, 64, 128, 6, 12, 24, 48, 96 };
> 
> "u8", as 128 doesn't fit in s8 (why doesn't the compiler complain?).

Failed to notice that. Thank you for pointing it! I saw no compiler
complains, though.

Thank you,
Claudiu

> 
>>         unsigned int channel_bits = 32; /* System Word Length */
>>         unsigned long bclk_rate = rate * channels * channel_bits;
>>         unsigned int div;
> 
> The rest LGTM.
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
