Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17248158874
	for <linux-clk@vger.kernel.org>; Sun,  8 Dec 2024 16:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733675007; cv=none; b=I1xMbVHewNFNfYSlOk4KjtkkfXo5b9pt46ztCbBAtH7Q5fK8NPfLOUQMuIsUGeta2yNxPzJT4xJrueuxuMLCbgD5lCxwPnvqnSYIRTmpSNaut54XZzbP255bQ5/fT56nww9mPZoQ71n8Mm33vZHCB3QzShl6uZ/JEnmGOZ89kcQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733675007; c=relaxed/simple;
	bh=JsGq0YhaA/fjrB5i30iNldjy4eoZqlyPCHjVboORafM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U6LNyjVbrk7SR2cRlvG6D0skNS0O1Cf7nW+WqSzMiuY8XwhnsoQJ2fYDLVzb2RAPd44mUtWOEtZx26eERN9S/LiigqIqdKXw6gu0QVJpY7kPTNbD1MG1hxPLWE8wfKkCCHJUW/mo1qBgIkytUC4zvBCQbwkc86WNji47rcQFaXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=FlAE7rAS; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="FlAE7rAS"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3f65844deso560274a12.0
        for <linux-clk@vger.kernel.org>; Sun, 08 Dec 2024 08:23:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1733675003; x=1734279803; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2Ja4iyQmAzISPsWmv2Yy+J9mTuONiwkR0YrQmpPL14U=;
        b=FlAE7rASzQNuKr9euzhs9NzZvBARBYt/IpnehyvTb2Wy5sL4zB0eTp5N9X6agMmUqb
         0h9+3AhChPJObIzyWK37nEiK2m0Po2I4aYYNFOgnbEHYmYI8BEbJtcvBac8LozdrUn1+
         63l1VJlqJNHYyqXjdbBabCVY4u8eA6xCSZqOf1CNwZlD6Pp8eEOsrUqsC3wl31ZFunwz
         ouBnXinGMtGMmuG9ZII48//6wXYCvtKggsg29rC1oAThHYHv1LLdDlXfklJT/BOFvKh6
         BPu9vvaK5wgHWMwrNS1p5ci1Ii5+DYSmjx4Q+Q5UvO2t/CG46NWI+2xKkEoPgZuqit7i
         tbzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733675003; x=1734279803;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2Ja4iyQmAzISPsWmv2Yy+J9mTuONiwkR0YrQmpPL14U=;
        b=i1z0A/k5UzJalbmVk1Geq/U4XtjQ/n2RCvsD4kJeIcKn+I1NW1P4bcUMcFDORBvsN+
         7+Sze3E4dxVH/bIswijakhVGIF6wUE31j98nDmf4UWVuSBNJw9ppMTo511l/5qzvdR3Y
         witMNbnk3eBI8hmbDL5djzEDQuzoUg7MJ9LEC+IuFAQ/oEbZlz+x1l7IIlrQyRmmA7+l
         FtLRrRnSRoB82ptWhUKlZXPYZn3kghtS4xQ0bl2dJpu+gHTFTGzdLMQze5bf8+3rZNUG
         7UebnYBJMfHMjdNiF5gu8Wx5xOdjd9dHA/l/GusCTIKU0iUIDIDN4m5Myq6nZyHAXtf3
         NDeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXYMtXdzwphJYVaUWRMrX+Hu0K7gbiMkYQwXHH5cWhRETKl4mqP56O1zLU90AQ6O/AWXxTbqMQz/Dk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsgJ9hYjKGKr/WNsgc4R+Z4MJaGepkWLeqOT1aCBDbPr/dUMIZ
	tQVdkxyOvBaxPaIntylK0Q5LFXXvAa1aV45G3u9bfSbePul4grPCc4fImLP09/I=
X-Gm-Gg: ASbGnctjGwR8aeAxY/vXtkB5RXUZSzfVZdb0FfksFGLCwQJWR5mu+0T8cQEAAR5afaO
	6Aa4Iir7GNAzbze7iXHG43ei5nWNGD6MWXdmc3sYbo/ZNKUWJXtwSqJXJ2/kNM6JFmhBJEBrg4f
	bMnZy+r/3SUrlfjeayS4Dhnt2lwpjZiioRdCGy+8yWjKoFBmaiEyieXsZh4Gb92sOxr+DbfyUEo
	Z5OiubkWMo0ukDbj8Vj5ZFyrtVlbpJYNOvNZywrBmIo0kNXny6a2HSFAdLXGR4=
X-Google-Smtp-Source: AGHT+IH86UBvGGnyAV0eg40dVkna/XfNJd8hDIG21j22U90IZW6G8d+OfAAcOP2EKLLK8RxyDrgbuA==
X-Received: by 2002:a50:8e1d:0:b0:5d3:d7ae:a893 with SMTP id 4fb4d7f45d1cf-5d3d7aea934mr5930138a12.25.1733675003295;
        Sun, 08 Dec 2024 08:23:23 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.161])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d149a49e48sm4883698a12.30.2024.12.08.08.23.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Dec 2024 08:23:22 -0800 (PST)
Message-ID: <40084072-8581-49b1-b0b8-e3c63dd39f3a@tuxon.dev>
Date: Sun, 8 Dec 2024 18:23:19 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/13] dt-bindings: ARM: at91: Document Microchip
 SAMA7D65 Curiosity
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
 linux-serial@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
References: <cover.1733505542.git.Ryan.Wanner@microchip.com>
 <d5a22763a2081daa0d2155e2c05b7dc0eb468610.1733505542.git.Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <d5a22763a2081daa0d2155e2c05b7dc0eb468610.1733505542.git.Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 06.12.2024 21:59, Ryan.Wanner@microchip.com wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Document device tree binding of the Microchip SAMA7D65 Curiosity board.
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Acked-by: Nicolas Ferre <nicolas.ferre@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>

> ---
>  Documentation/devicetree/bindings/arm/atmel-at91.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/atmel-at91.yaml b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> index 7160ec80ac1b..0ec29366e6c2 100644
> --- a/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> +++ b/Documentation/devicetree/bindings/arm/atmel-at91.yaml
> @@ -180,6 +180,13 @@ properties:
>            - const: atmel,sama5d4
>            - const: atmel,sama5
>  
> +      - description: Microchip SAMA7D65 Curiosity Board
> +        items:
> +          - const: microchip,sama7d65-curiosity
> +          - const: microchip,sama7d65
> +          - const: microchip,sama7d6
> +          - const: microchip,sama7
> +
>        - items:
>            - const: microchip,sama7g5ek # SAMA7G5 Evaluation Kit
>            - const: microchip,sama7g5
