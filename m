Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7022F1991CD
	for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 17:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724694136; cv=none; b=lXpq83aerdLwfYF3E3CZ3lC/Xn0Cpr6jHLKMpGuNc4e5qV76V1nJ1pqmT//TQrpclivf0iQM4wLYw2FXnYn/dfI+AjJ1G5RrohzDHOWwdvn8zQpAXvodG8DiJhQ9+auh27bHynChhEHo6KFi/gXOiLWUzr2JfE/RdOq3biHYFtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724694136; c=relaxed/simple;
	bh=rhJBniTHjY88Us32RAgfhKeGcN7GL2KlDbC4HgbLOGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fOrKCa6HHSOb7selO4MDLpGnVqKkV5sl5G5jehPlJllwhwBo2oRsaLvZmvuiArwDvlMp6MwHNxGBkIQHurgmGfJSQdnPQnU4sV9a8dDNP5fViDCe7lBRmTPLfuVZHMFnz9VE7bcd9fQy2nJdCgXs1seSAJvkPPW9/ZXSzFaiato=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Jz8dOTWO; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Jz8dOTWO"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5bf006f37daso140521a12.1
        for <linux-clk@vger.kernel.org>; Mon, 26 Aug 2024 10:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1724694133; x=1725298933; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qFiCyxYJLEqGs500HvKL/JsZpsQRPQOlGWk1hMAooLM=;
        b=Jz8dOTWOZ+Hi4hCWUUDbofQQ+Ln1vYRYZmjmm17P25AlcWrNd91FLsHFlKosU4E09O
         Jzq8lwJl0yV/sqQ3LuNO3Xw+/9QS6Yfnv3vGOMmuBLi2cYYdgPtatwYhHbJubDz1yfYX
         LoaZ5mo+hoaNmg0OwRrbelsjMi5JkY8A7iwZo9Yg0fOMsBi1aWFulfaH9beCKsyvJ1i7
         +TbynLs2yHFj8D6QSf3uQf/subLrRwmphJnEvZdGFV9+S0vVkb7oRlMVDvFEKxLDas/R
         WRmTkTDTKYJw2oIhZKKyOo29BfbFJfhcRQA1GGT10bRafWXM9U+mqTD+tAFG3vYaWP9I
         5prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724694133; x=1725298933;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qFiCyxYJLEqGs500HvKL/JsZpsQRPQOlGWk1hMAooLM=;
        b=js4muApEElkW60FoyI5fPl6oQ7vtPrJ/iANNa6jkS3Nxhf3qZY+g+dgCiVCe/MZDbZ
         yeyxLjEu2rtBN0NoxsDKH8yOFF5rNeBP/GuIWR7pdwQJzmdlBODP2RwgmW9fiSgxqm79
         FX6BLnHYAlRhDrIrNz09DvFYigBOYpXymcO3bKAej/vfvmKJc9UPxMHwPGLz8tFgaIUE
         gbMZlsS1zPNDY9hH2OcEZvt75NuXBELNiJ/6ay1MXZt1F0QiP+3uC7o26nnU8NG90sML
         Ck25OTXmjoLOraF3y+dh61p8Bf9DV4uHFjjHero6QbJCSyS0uPRAC54VBooolbgAYjSS
         lT0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtdDvq5Pb9KAuQz7B0P9xi253ejxi/hpdB9hOD4LZK/eQqM3AMqK2c1210oAnDRZg+Wbtl4SfzoVE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxCMsEtn6OyViV7GbbSfapB6eAEHI9fjZk8TBIzg2PEQmRXP62Z
	pTdgr9rhXGG26E+Gltz55oz4LOU67QpLq9qT5MqYpc27iDuwZGXJZ2E7rT5u77s=
X-Google-Smtp-Source: AGHT+IGK/rDWQktFfcdGSgq6zs7nJIlhwN6w7cv1hF04+Aui72thInt0zEQ9R8DGVui0QugunH9n7w==
X-Received: by 2002:a05:6402:908:b0:5be:ec0a:c10f with SMTP id 4fb4d7f45d1cf-5c0ba195954mr376953a12.2.1724694132631;
        Mon, 26 Aug 2024 10:42:12 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.144])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c0bb481f50sm4519a12.86.2024.08.26.10.42.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Aug 2024 10:42:12 -0700 (PDT)
Message-ID: <8ae724e3-f467-4df4-b8cc-f03489bd0f35@tuxon.dev>
Date: Mon, 26 Aug 2024 20:42:10 +0300
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] ARM: dts: microchip: Use SCKC_{TD, MD}_SLCK IDs for
 clk32k clocks
To: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mturquette@baylibre.com, sboyd@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
References: <20240826173116.3628337-1-claudiu.beznea@tuxon.dev>
 <20240826173116.3628337-4-claudiu.beznea@tuxon.dev>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20240826173116.3628337-4-claudiu.beznea@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 26.08.2024 20:31, Claudiu Beznea wrote:
> Use the newly introduced macros instead of raw number. With this device
> tree code is a bit easier to understand.
> 
> Signed-off-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> ---
>  arch/arm/boot/dts/microchip/sam9x60.dtsi | 18 +++++++++---------
>  arch/arm/boot/dts/microchip/sama7g5.dtsi | 16 ++++++++--------
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index 04a6d716ecaf..eeda277e684f 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -560,7 +560,7 @@ tcb0: timer@f8008000 {
>  				#size-cells = <0>;
>  				reg = <0xf8008000 0x100>;
>  				interrupts = <17 IRQ_TYPE_LEVEL_HIGH 0>;
> -				clocks = <&pmc PMC_TYPE_PERIPHERAL 17>, <&clk32k 0>;
> +				clocks = <&pmc PMC_TYPE_PERIPHERAL 17>, <&clk32k SCKC_MD_SLCK>;

Actually, looking again at it, I don't know if it worth as we use numbers
directly also for other PMC clock IDs.

Sorry for the noise,
Claudiu Beznea


