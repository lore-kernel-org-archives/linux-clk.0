Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCABA318ECC
	for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 15:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769874228; cv=none; b=o+6sRmd4hegzjA4OVxEZOOZNyX7s4rWvJkxg216PgVJFpPxDHGUtRzujnHql2NTj1hge212qWOOqTl4Z0SIYxjrYDBuEOWhr+mHXUWBR2076zI2WBzoTakNXXxfUxT2KhfQGbkn6OHLivdfJIimUyjdZXbRfsBH8wZKm8ElOh8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769874228; c=relaxed/simple;
	bh=3zq88OGXmsHOOLJgZcxJMUgtSvwHsbfdpn0d45bqb7k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CE/6MznBIRaFZUFOV0f3yVenUC5Z2RGG7cvDS319NwGk91uvVkTKLwG/eH8DFYOGxqO9ZaE3x0gl8xbzdHt3YiK1jpNxtgA36OtKjWh+rtJ3RRjgvVpMNoWG3rAUT+19A2JpQeibeS2maZxJf5dce1srdc253E+ZxknvX/xt3uw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=QaPThkAb; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="QaPThkAb"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43601e96f72so62031f8f.2
        for <linux-clk@vger.kernel.org>; Sat, 31 Jan 2026 07:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1769874223; x=1770479023; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPTC9B9AxKZ/luocqmLIMukEnXXZUyNvVqk4iN/Kcvc=;
        b=QaPThkAb5i+tmVXvd+AsTUZn2kLCZbEDlsl5Dv4hu3YAS39WkJZLlumiFwfyhq775U
         IPeGr+dgkBs1RPj42VRIlOEdqUueG2PhDofq4XYXHqTgple8fcIGpPCFqd5BZA8SfII3
         xtPdhtZpaAUpN0NTl5LHOHgwD6xazp0PXXtOxs0qqp0lpGkzmv7FORMvuO8VwD+ODvNC
         hqZmkwVxih6TeYtj/l73JTGvIzcXd+gq6RSjwj+stOj5eqII/QYXus/5zxWHxr29T8xq
         trRSDkIphwG1+gi++UYt1aW2+4qaYla0BAtSyl86LT1Gx8yHqojFde8C0jqCofC/2Bsf
         503g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769874223; x=1770479023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPTC9B9AxKZ/luocqmLIMukEnXXZUyNvVqk4iN/Kcvc=;
        b=IESY6i4pThfILnO2f0sAnY6Cp2WGIzIr3qQjNAIfrA368p7Nb5Y6PniE6vqM1OaGNm
         xAL8rHK6CRhAhIlnD83e2XOumE0tF9LMhqed6W4Ea/ThMUt9+P/aqGL7cE1SGHX/gt9j
         Cte53GayULEaMzSRglLJm4kRSmhO/kzTtyUfTDW8XklvLDhTeuKti/ynnfe1RxO+9xcj
         2I2pca1AdfjonRMHW+Euggk4AOnMf+p4VAgU4WT1Ejj2aqNxOHI91G9qBmcVv216V2/g
         1pNae0EwaMND6uiDQhL2Igfbtb0USCdsClx7xjiypgq7pnYexgFoMvozxnmLWiH5zvhj
         93/w==
X-Forwarded-Encrypted: i=1; AJvYcCW4GM/ClPbxvRtcP2vKHQMr0JLDg2zhhW6EiGi4ifRjPMPjnYZNmvpNqq1/f1l+pdV1xAQZd/FdUmY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVd2vuJiG9AyygCDJ5ntCnbrRiNs/Gs16jH8PplroDkrufBbpl
	VDvETU3et8/bnQ0LCLNmwhzf9KLCgpuxnxUQKs3Dm8JMV55e9+9V9wkQvh2rxBYg6hA=
X-Gm-Gg: AZuq6aLIdcN16LwJxnaXzhaDLHdnEGJmBd6wPnVrbNrMyaW02E42cFMKD2EFDpkN3Vf
	T60qaZYpG0MedVSephcpq+cnK8abiqWWdM6PWyAr1hgkah3TidIjITwuIz9fcTpHIIyKK4Go7lh
	Gu/QptrNIMhMDjXOH7ODPtbWZB2fwkeN5rS2kRIsN9gK4BG+fS6FPAQ1XX16LNTAeHrEiQfTmtZ
	Ajh/64I7dteXJvsDozR7CQo4pLGGpATPsK/8aQmkB0TyXjdhDuLm4s5UIi+10g5n5V6lq6gveM7
	zQHE1ok5DlIZuMy/WoF+2UpZL9+5u1QlV9OYtwDFNv4lJcBI8kQNdDT19AH3UDt57m/WYRg6IsP
	HLJEzMxzmJrMhVnb9TYKzRyNFO3q54PrisaiolrPd0f4ZzbEhmU/k0dQ847XUZEbxwPSvuiuZ5e
	OGKqGfm1/cCc4bhSsVzCQyhFgTaZsd
X-Received: by 2002:a05:600c:6298:b0:477:2f7c:314f with SMTP id 5b1f17b1804b1-482db4bda82mr79391115e9.10.1769874223122;
        Sat, 31 Jan 2026 07:43:43 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1323034sm31026101f8f.35.2026.01.31.07.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Jan 2026 07:43:42 -0800 (PST)
Message-ID: <1f25e668-ff04-4fa7-a7fd-3ed3286edbe6@tuxon.dev>
Date: Sat, 31 Jan 2026 17:43:41 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/19] dt-bindings: clock: at91: Split up per SoC
 partially
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120143759.904013-3-ada@thorsis.com>
Content-Language: en-US
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20260120143759.904013-3-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 1/20/26 16:37, Alexander Dahl wrote:
> Before adding even more new indexes creating more holes in the
> clk at91 drivers pmc_data->chws arrays, split this up.
> 
> This is a partial split up only for some of the old PMC definitions.
> 
> Binding splitup was proposed for several reasons:
> 
> 1) keep the driver code simple, readable, and efficient
> 2) avoid accidental array index duplication
> 3) avoid memory waste by creating more and more unused array members.
> 
> Old values are kept to not break dts, and to maintain dt ABI.
> 
> Link: https://lore.kernel.org/linux-devicetree/20250207-jailbird-circus-bcc04ee90e05@thorsis.com/T/#u
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>      v3:
>      - full splitup for all at91 family SoCs instead of just a few
>      
>      v2:
>      - new patch, not present in v1
> 
>   .../reset/atmel,at91sam9260-reset.yaml        |  3 ++-
>   .../dt-bindings/clock/atmel,at91rm9200-pmc.h  | 15 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9260-pmc.h | 16 +++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9g45-pmc.h | 15 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9n12-pmc.h | 15 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9rl-pmc.h  | 15 ++++++++++++
>   .../dt-bindings/clock/atmel,at91sam9x5-pmc.h  | 15 ++++++++++++
>   include/dt-bindings/clock/atmel,sama5d2-pmc.h | 20 ++++++++++++++++
>   include/dt-bindings/clock/atmel,sama5d3-pmc.h | 14 +++++++++++
>   include/dt-bindings/clock/atmel,sama5d4-pmc.h | 15 ++++++++++++
>   .../dt-bindings/clock/microchip,sam9x60-pmc.h | 15 ++++++++++++
>   .../dt-bindings/clock/microchip,sam9x7-pmc.h  | 19 +++++++++++++++
>   .../clock/microchip,sama7d65-pmc.h            | 24 +++++++++++++++++++
>   .../dt-bindings/clock/microchip,sama7g5-pmc.h | 19 +++++++++++++++
>   14 files changed, 219 insertions(+), 1 deletion(-)
>   create mode 100644 include/dt-bindings/clock/atmel,at91rm9200-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9260-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d2-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d3-pmc.h
>   create mode 100644 include/dt-bindings/clock/atmel,sama5d4-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sam9x60-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sam9x7-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sama7d65-pmc.h
>   create mode 100644 include/dt-bindings/clock/microchip,sama7g5-pmc.h
> 
> diff --git a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> index 84c4801df8d9a..8c89ccc3d6393 100644
> --- a/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> +++ b/Documentation/devicetree/bindings/reset/atmel,at91sam9260-reset.yaml
> @@ -67,9 +67,10 @@ additionalProperties: false
>   examples:
>     - |
>       #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/clock/atmel,at91sam9260-pmc.h>
>   
>       reset-controller@fffffd00 {
>           compatible = "atmel,at91sam9260-rstc";
>           reg = <0xfffffd00 0x10>;
> -        clocks = <&pmc PMC_TYPE_CORE PMC_SLOW>;
> +        clocks = <&pmc PMC_TYPE_CORE AT91SAM9260_PMC_SLOW>;
>       };
> diff --git a/include/dt-bindings/clock/atmel,at91rm9200-pmc.h b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> new file mode 100644
> index 0000000000000..ab0d0d7a3b655
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91rm9200-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91rm9200 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91RM9200_PMC_H
> +
> +#define AT91RM9200_PMC_MCK	1
> +#define AT91RM9200_PMC_MAIN	3
> +#define AT91RM9200_PMC_PLLACK	7
> +#define AT91RM9200_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9260-pmc.h b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> new file mode 100644
> index 0000000000000..6a5453cf70954
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9260-pmc.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9260 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9260_PMC_H
> +
> +#define AT91SAM9260_PMC_SLOW	0
> +#define AT91SAM9260_PMC_MCK	1
> +#define AT91SAM9260_PMC_MAIN	3
> +#define AT91SAM9260_PMC_PLLACK	7
> +#define AT91SAM9260_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> new file mode 100644
> index 0000000000000..63134ecafa50c
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9g45-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9g45 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9G45_PMC_H
> +
> +#define AT91SAM9G45_PMC_MCK	1
> +#define AT91SAM9G45_PMC_UTMI	2
> +#define AT91SAM9G45_PMC_MAIN	3
> +#define AT91SAM9G45_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> new file mode 100644
> index 0000000000000..e41ad6d68108a
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9n12-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9n12 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9N12_PMC_H
> +
> +#define AT91SAM9N12_PMC_MCK	1
> +#define AT91SAM9N12_PMC_MAIN	3
> +#define AT91SAM9N12_PMC_PLLACK	7
> +#define AT91SAM9N12_PMC_PLLBCK	8
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> new file mode 100644
> index 0000000000000..4306d457f8d2b
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9rl-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9rl clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9RL_PMC_H
> +
> +#define AT91SAM9RL_PMC_MCK	1
> +#define AT91SAM9RL_PMC_UTMI	2
> +#define AT91SAM9RL_PMC_MAIN	3
> +#define AT91SAM9RL_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> new file mode 100644
> index 0000000000000..d3e612f063a00
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,at91sam9x5-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91sam9x5 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_AT91SAM9X5_PMC_H
> +
> +#define AT91SAM9X5_PMC_MCK	1
> +#define AT91SAM9X5_PMC_UTMI	2
> +#define AT91SAM9X5_PMC_MAIN	3
> +#define AT91SAM9X5_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d2-pmc.h b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> new file mode 100644
> index 0000000000000..1690a69087522
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d2-pmc.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d2 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D2_PMC_H
> +
> +#define SAMA5D2_PMC_MCK		1
> +#define SAMA5D2_PMC_UTMI	2
> +#define SAMA5D2_PMC_MAIN	3
> +#define SAMA5D2_PMC_MCK2	4
> +#define SAMA5D2_PMC_I2S0_MUX	5
> +#define SAMA5D2_PMC_I2S1_MUX	6
> +#define SAMA5D2_PMC_PLLACK	7
> +#define SAMA5D2_PMC_AUDIOPLLCK	9
> +#define SAMA5D2_PMC_AUDIOPINCK	10
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d3-pmc.h b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> new file mode 100644
> index 0000000000000..85b772ccd996a
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d3-pmc.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d3 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D3_PMC_H
> +
> +#define SAMA5D3_PMC_MCK		1
> +#define SAMA5D3_PMC_UTMI	2
> +#define SAMA5D3_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/atmel,sama5d4-pmc.h b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> new file mode 100644
> index 0000000000000..15b812e1b9259
> --- /dev/null
> +++ b/include/dt-bindings/clock/atmel,sama5d4-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama5d4 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> +#define _DT_BINDINGS_CLOCK_ATMEL_SAMA5D4_PMC_H
> +
> +#define SAMA5D4_PMC_MCK		1
> +#define SAMA5D4_PMC_UTMI	2
> +#define SAMA5D4_PMC_MCK2	4
> +#define SAMA5D4_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/microchip,sam9x60-pmc.h b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> new file mode 100644
> index 0000000000000..91f8f863ea076
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sam9x60-pmc.h
> @@ -0,0 +1,15 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sam9x60 clock driver.

s/at91/Microchip. Same for microchip,sam9x7-pmc.h, microchip,sama7d65-pmc.h, 
microchip,sama7g5-pmc.h files.


> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X60_PMC_H
> +
> +#define SAM9X60_PMC_MCK		1
> +#define SAM9X60_PMC_UTMI	2
> +#define SAM9X60_PMC_MAIN	3
> +#define SAM9X60_PMC_PLLACK	7
> +
> +#endif
> diff --git a/include/dt-bindings/clock/microchip,sam9x7-pmc.h b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> new file mode 100644
> index 0000000000000..e1dd41fe75046
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sam9x7-pmc.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sam9x7 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAM9X7_PMC_H
> +
> +#define SAM9X7_PMC_MCK		1
> +#define SAM9X7_PMC_UTMI		2
> +#define SAM9X7_PMC_MAIN		3
> +#define SAM9X7_PMC_PLLACK	7

You should also keep the other PLLs even if they are not used in device trees. 
They are HW specific. Same for the other SoCs.

> +#define SAM9X7_PMC_AUDIOPMCPLL	9
> +#define SAM9X7_PMC_AUDIOIOPLL	10
> +#define SAM9X7_PMC_PLLADIV2	14
> +#define SAM9X7_PMC_LVDSPLL	15
> +
> +#endif
> diff --git a/include/dt-bindings/clock/microchip,sama7d65-pmc.h b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> new file mode 100644
> index 0000000000000..09d152da6db44
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sama7d65-pmc.h
> @@ -0,0 +1,24 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama7d65 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7D65_PMC_H
> +
> +#define SAMA7D65_PMC_MCK0		1
> +#define SAMA7D65_PMC_UTMI		2
> +#define SAMA7D65_PMC_MAIN		3
> +#define SAMA7D65_PMC_CPUPLL		4
> +#define SAMA7D65_PMC_SYSPLL		5

Here, you should keep the other PLLs as well.

> +#define SAMA7D65_PMC_BAUDPLL		8
> +#define SAMA7D65_PMC_AUDIOPMCPLL	9
> +#define SAMA7D65_PMC_AUDIOIOPLL		10
> +#define SAMA7D65_PMC_ETHPLL		11
> +#define SAMA7D65_PMC_MCK1		13
> +#define SAMA7D65_PMC_LVDSPLL		15
> +#define SAMA7D65_PMC_MCK3		16
> +#define SAMA7D65_PMC_MCK5		17
> +
> +#endif
> diff --git a/include/dt-bindings/clock/microchip,sama7g5-pmc.h b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> new file mode 100644
> index 0000000000000..0303cae56f849
> --- /dev/null
> +++ b/include/dt-bindings/clock/microchip,sama7g5-pmc.h
> @@ -0,0 +1,19 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * The constants defined in this header are being used in dts and in
> + * at91 sama7g5 clock driver.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
> +#define _DT_BINDINGS_CLOCK_MICROCHIP_SAMA7G5_PMC_H
> +
> +#define SAMA7G5_PMC_MCK0	1
> +#define SAMA7G5_PMC_UTMI	2
> +#define SAMA7G5_PMC_MAIN	3
> +#define SAMA7G5_PMC_CPUPLL	4
> +#define SAMA7G5_PMC_SYSPLL	5

Same here. Keep the defines for the rest of the PLLs.

> +#define SAMA7G5_PMC_AUDIOPMCPLL	9
> +#define SAMA7G5_PMC_AUDIOIOPLL	10
> +#define SAMA7G5_PMC_MCK1	13
> +
> +#endif

