Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF72615990C
	for <linux-clk@vger.kernel.org>; Sun,  8 Dec 2024 16:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675186; cv=none; b=fZma3u2XV19B7sl6xJxpqAScdVOAtOodzT6MVi8eqp/vAwzkVn29WFZOVFjxAAz8zYGLQhnWaXp0GoW4x+ES1tbs9TiBDf63MDCbBmxU232M4155AYjDNVjSfAuFpJpnZwVUI7eJ+xuBDg4zGj6NnXlDRPYmmuXI2DoS8yfCy0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675186; c=relaxed/simple;
	bh=LnCY1BI+0e0DzijFWz7V8IFK0QilDy2CkjwcUcta/VQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dWY7T/jV5kh/EK907hUtJoPWynv+0y2qzqMg0kDMdtTo0Q5vQZRGMqfu8Gfjz269/2uehMrlY273Q1gcdxn3iMfwndLr7moleMMnbGuGbxZv/B7yAxSghCz827LgMzSI4ANux4dBc+GeJGoJUKpOpk2TGfNHRhbS7KkPfmbVliU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=fKjFcwjf; arc=none smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="fKjFcwjf"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-5d122cf8dd1so5779960a12.2
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 08:26:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675182; x=1734279982; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EAP88DzTTa15uBA2TewRSQ1lUwNGCSJEF8LO0raYTt4=;
        b=fKjFcwjfGwG0bZWA3WmsySAMZfILpOlTW3jkHf+o7/9WC8T0sEEzvGnT6SCgFKnjyC
         V34TnhVkkVkT+8Y4kr47gvOKyWad0mNCY/9ckskLJfu4fB3XgHjQfeCcNNabkoCtZaKl
         PcBYxnvuwLQX5bIZR/94TIg+Ew05fLF2tYSDPwHXPQHhZQ5pGqgax6K4IjUCFCvE4/dK
         QJxZK2I0Zuduk7T9B32Bp6devxRqQZh/spqY/EYySvTZDwDS2bvU1c8MUQFG/oJrGZ7B
         8rorVjvkE4Fd1cK5iIahjgtaDZI6WAYXKifuBcY1ixfxLxGCdCZdm2q/zw9v6dIZReEA
         jqpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675182; x=1734279982;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EAP88DzTTa15uBA2TewRSQ1lUwNGCSJEF8LO0raYTt4=;
        b=etMwfgakoaDqeSav7nXmww4tgwLozMFa5jXUgUB6H6T90aQ/ph71IFROiV07vLMuOE
         q7dYDFiQ8g2pMk36gGYXkFWUARkgqEBBpJshDOXkakEzf+PgzIWdGRq5L1ltItoPkdcC
         e1+X77tf6s2sooEBxAIe5sdxXWdqdOpgYheKS7UfnVeWvDKFn73V1vBHaY/hSfM6TysA
         I4MoR6xzs6Y/K2t4ZbH82Mv+0zOfQ0q8aA0d82HKDetKsG5Wp8RmCUXMvIe4r8+ihhuH
         wTH+e6gOexmbJyGkqus/9nZ91OEz8xHpP/6Zp9ehjk/VTUQ6jetkNTL4a+hUsKOvBbpl
         UBMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKyLwQTXzNY8npE945yGSyQzkSPpdAfFXoh+chlqZDvg+XdHCx5JHBbNMjMPCX8NuoNisePaF+ABU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMW2ivIz0qxgLQ2Pa3u7miVChQn0z4ocieXZWFnspKDklTueZ5
	Hh83z/71FwvQ+A9CqT3HtB+WIt/U+G4XtbJ7rzHE2EHO7ICkB1sjczYIGUT0WI8=
X-Gm-Gg: ASbGncuJPwyUuN+UXW/CRLkVD32egEHowCJAmPPI4GptUR00AyBrXBMulfOJa6gA3oP
	mpBKLlQgLOzdHB+vV486lcPntJuxJ8+C+N0PzzlogmnAreI9kt9LOxtV9i063zyb93Pgp6aOxa9
	9Ys0rQ+SNoja2T9IsJXzu3P+Ns8RooGZ5mqvlsQhBjW+bZwj7iJQFBmkNWUrDFdIINoyJQgl0zp
	F4yswh/sWb1P+8apr4DE7AaQ9bDHRfyy1FzN/ZTXBkqvNOsgQrbawYkeeNFegc=
X-Google-Smtp-Source: AGHT+IFxY12KAhRWbQXwONnJAJURFo6LciXJ7/zgNx3XbUIqPdq8RMUGE7iRkFtZbi7PYG8M9RNg+w==
X-Received: by 2002:a05:6402:913:b0:5cf:b079:68ef with SMTP id 4fb4d7f45d1cf-5d3be70113fmr8820202a12.26.1733675182323;
        Sun, 08 Dec 2024 08:26:22 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:26:21 -0800 (PST)
Message-ID: <7177c349-a22e-4501-b42c-0c62d94c2f76@tuxon.dev>
Date: Sun, 8 Dec 2024 18:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/13] dt-bindings: clock: Add SAMA7D65 PMC compatible
 string
Content-Language: en-US
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-serial@vger.kernel.org
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <5252a28531deaee67af1edd8e72d45ca57783464.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Dharma Balasubiramani <dharma.b@microchip.com>
> 
> Add the `microchip,sama7d65-pmc` compatible string to the existing binding,
> since the SAMA7D65 PMC shares the same properties and clock requirements
> as the SAMA7G5.
> 
> Export MCK3 and MCK5 to be accessed and referenced in DT to assign to
> the clocks property for sama7d65 SoC.
> 
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  .../devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml       | 2 ++
>  include/dt-bindings/clock/at91.h                              | 4 ++++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> index c9eb60776b4d..885d47dd5724 100644
> --- a/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> +++ b/Documentation/devicetree/bindings/clock/atmel,at91rm9200-pmc.yaml
> @@ -43,6 +43,7 @@ properties:
>                - atmel,sama5d4-pmc
>                - microchip,sam9x60-pmc
>                - microchip,sam9x7-pmc
> +              - microchip,sama7d65-pmc
>                - microchip,sama7g5-pmc
>            - const: syscon
>  
> @@ -90,6 +91,7 @@ allOf:
>              enum:
>                - microchip,sam9x60-pmc
>                - microchip,sam9x7-pmc
> +              - microchip,sama7d65-pmc
>                - microchip,sama7g5-pmc
>      then:
>        properties:
> diff --git a/include/dt-bindings/clock/at91.h b/include/dt-bindings/clock/at91.h
> index 6ede88c3992d..e37f1b9cdabf 100644
> --- a/include/dt-bindings/clock/at91.h
> +++ b/include/dt-bindings/clock/at91.h
> @@ -42,6 +42,10 @@
>  #define PMC_PLLADIV2		(PMC_MAIN + 11)
>  #define PMC_LVDSPLL		(PMC_MAIN + 12)
>  
> +/* SAMA7D65 */
> +#define PMC_MCK3               (PMC_MAIN + 13)
> +#define PMC_MCK5               (PMC_MAIN + 14)

Spaces here --------^ instead of tabs . I'll adjust it while applying.

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> +
>  #ifndef AT91_PMC_MOSCS
>  #define AT91_PMC_MOSCS		0		/* MOSCS Flag */
>  #define AT91_PMC_LOCKA		1		/* PLLA Lock */
