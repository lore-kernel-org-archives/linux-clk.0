Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B0C215071
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413635; cv=none; b=OCdiFVwe5eC6KXoWcIxO927uT8lk9umEc5NHUlFpqE1ogXsn6JNriS/CWrb/1RE8MSZWw5BfA3jazYJKF1X97sgKDL1YtH2DExWcEH6n4izUaNEI2QcjEL9UKnoj0cuPDHLa1PJ2i0Hc/zMCD6M2T9qwoMICpnyjklZ8LuONE64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413635; c=relaxed/simple;
	bh=WxA+ompYfbvXn8lvbhjRnopJN1Ho90TPPap0bZyj03E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lwuHKxhKlB5diu+TkvVX7ZlsIN2uylqXdve3zKeK6gTTlF8McUSkGKNnyDkjnDfD0dkJlg5amdBUrg678vJ731xNp9aNakL7xw7A1nkq2Ouolvh+elLM1yuoBBSQ8GJB/AfckBha1YNpl6+QgnKUWBCP6etD/XuRBxxm8Ptz/34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oEZCIEqF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oEZCIEqF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43624b2d453so7105635e9.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 01:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736413632; x=1737018432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qVwMK/eoLRZqZimy4jMPY+H4Af5hsLKL/OPymphu+WM=;
        b=oEZCIEqFJVM1zQoewqp+4Tut6M4GiBc9vOmimSmWd+ZeJ9WD06zeJv4AN1Ua8L6dWy
         vAuEb1Jt4xCeLmqeK5Gc9chTzCNfHKVxeq9NvdlfQdAK/DT4G/5X9Cbbw5pzvbzPdoxi
         oP4HTdMsZY+UzeuDiYv8s4V5DeDELykaaB6TTdYpQZ+lZi8KZ5of8XIG7G2mxlammQPI
         LoSlkn3K+LrBTqAa/MN44qimscy8Lwwv6W1tYu8oaaFJRkrARlkiHdYeclZ8qd5SomOB
         PuGbnC+okoT3sdHyH1Lw1G422LczC69WhstMLVK8/GpaHV/+iyp77Y7QAXt8cDoja5u/
         Rd4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413632; x=1737018432;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVwMK/eoLRZqZimy4jMPY+H4Af5hsLKL/OPymphu+WM=;
        b=TeMaa+rUkbICVBuwWW20iWbn/NJXiYigymiKGZegfcV0WINCE8lXRkqm+iwhYLAXey
         WeQuwIpBebOpKjDMF5VwYkDawih20+1Jn/bIjrr0RTuGA3743wLgXkcopXp9VCa6tE2U
         U9lEbVhcFCZ77CF+MbIPKMCKHJ+bYz6pbla2pLBFvAZ6/Pj1zW+q/jIt1E7uaBALcfE5
         yqbyGRRoXoFGwGZwHLMyMc3/RIW08HG7WUPPmI9sqUV/7vJo3FeEYCFWVsV25O5T/HHR
         EP661w2ryRa6x4tF2rT8UBL8VwvFJoDCdeI7AhvOWRVppbhx6v80CEoT+pZQEAuAW1RW
         wSKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnkuFVnkuENvEtoK9ANBjkQiLr8xG+D1ufThprSDhN5QjdN//tzMLrJh9dznFhpDLUCQq6dOVw+iI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxzXfALkqpJYJ7OVuClCDcJeCG21HWu1hGYPdjU7tc9th04wM
	RRaNkj7icaYBCPT0AkQbRT3vDqt1BV/zMUhOpc5Mo4JVlfmVUgw/IUFj5mr1iaA=
X-Gm-Gg: ASbGnctMPheyGC0GF3uomkjw32CDhiOcPH8Elexb03XdmkYwKQc2s2WszleiJwtuYqP
	5xsQ2kTE5gyDaRJfRKYqQZnjRCbiACHMkTaS/cGn+rMiBvEd4YpVDMYvM/zEj8rPgVZ2Y8/rr4r
	k3ZSua1mTfxGIm4E2Am7zhZHBjCIoOi1FYNueffnSh98cpQ8FzfGq1st0foazRQnI9jarsI6tIX
	uUzEmHPU4OgaBYH3AcrtegHnkDvtAQ3U8HjSkUmnKYJOrve5JYQEDTZaNSzI6eJDA==
X-Google-Smtp-Source: AGHT+IGhNi5rl+/Gx7bgxS1n90tfV8FC+iCZg9Ho0HrN4Il/VGHgdUNthAtV4OGyQQ++lThng+djbg==
X-Received: by 2002:a5d:59ab:0:b0:385:eb7c:5d0f with SMTP id ffacd0b85a97d-38a8730db6cmr5443481f8f.26.1736413631641;
        Thu, 09 Jan 2025 01:07:11 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e37d040sm1218431f8f.6.2025.01.09.01.07.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:07:11 -0800 (PST)
Message-ID: <6e14b7c5-90cd-4d26-9494-610e248267da@tuxon.dev>
Date: Thu, 9 Jan 2025 11:07:09 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] ARM: dts: microchip: add support for
 sama7d65_curiosity board
To: Ryan.Wanner@microchip.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nicolas.ferre@microchip.com,
 alexandre.belloni@bootlin.com, mturquette@baylibre.com, sboyd@kernel.org,
 arnd@arndb.de
Cc: dharma.b@microchip.com, mihai.sain@microchip.com,
 romain.sioen@microchip.com, varshini.rajendran@microchip.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-spi@vger.kernel.org, linux-serial@vger.kernel.org
References: <20250107160850.120537-1-Ryan.Wanner@microchip.com>
 <20250107160850.120537-6-Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250107160850.120537-6-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 07.01.2025 18:07, Ryan.Wanner@microchip.com wrote:
> From: Romain Sioen <romain.sioen@microchip.com>
> 
> Add device tree support for the SAMA7D65 Curiosity board.
> Update the Makefile to include the new device tree file.
> 
> uart6 is related to flexcom6, hence not sorted in alphabetical order.
> 
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> ---
>  arch/arm/boot/dts/microchip/Makefile          |  3 +
>  .../dts/microchip/at91-sama7d65_curiosity.dts | 89 +++++++++++++++++++
>  2 files changed, 92 insertions(+)
>  create mode 100644 arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> 
> diff --git a/arch/arm/boot/dts/microchip/Makefile b/arch/arm/boot/dts/microchip/Makefile
> index 470fe46433a9..79cd38fdc7da 100644
> --- a/arch/arm/boot/dts/microchip/Makefile
> +++ b/arch/arm/boot/dts/microchip/Makefile
> @@ -12,6 +12,7 @@ DTC_FLAGS_at91-sama5d2_xplained := -@
>  DTC_FLAGS_at91-sama5d3_eds := -@
>  DTC_FLAGS_at91-sama5d3_xplained := -@
>  DTC_FLAGS_at91-sama5d4_xplained := -@
> +DTC_FLAGS_at91-sama7d65_curiosity := -@
>  DTC_FLAGS_at91-sama7g54_curiosity := -@
>  DTC_FLAGS_at91-sama7g5ek := -@
>  dtb-$(CONFIG_SOC_AT91RM9200) += \
> @@ -90,6 +91,8 @@ dtb-$(CONFIG_SOC_SAM_V7) += \
>  	at91-sama5d4_xplained.dtb \
>  	at91-sama5d4ek.dtb \
>  	at91-vinco.dtb
> +dtb-$(CONFIG_SOC_SAMA7D65) += \
> +	at91-sama7d65_curiosity.dtb
>  dtb-$(CONFIG_SOC_SAMA7G5) += \
>  	at91-sama7g54_curiosity.dtb \
>  	at91-sama7g5ek.dtb
> diff --git a/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> new file mode 100644
> index 000000000000..ef6a56db8acb
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/at91-sama7d65_curiosity.dts
> @@ -0,0 +1,89 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *  at91-sama7d65_curiosity.dts - Device Tree file for SAMA7D65 Curiosity board
> + *
> + *  Copyright (c) 2024 Microchip Technology Inc. and its subsidiaries
> + *
> + *  Author: Romain Sioen <romain.sioen@microchip.com>
> + *
> + */
> +/dts-v1/;
> +#include "sama7d65-pinfunc.h"
> +#include "sama7d65.dtsi"
> +#include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/pinctrl/at91.h>
> +
> +/ {
> +	model = "Microchip SAMA7D65 Curiosity";
> +	compatible = "microchip,sama7d65-curiosity", "microchip,sama7d65",
> +		     "microchip,sama7d6", "microchip,sama7";
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	aliases {
> +		serial0 = &uart6;
> +	};

While applying this, I switched chosen and aliases to have it
alphanumerically sorted.

> +
> +	memory@60000000 {
> +		device_type = "memory";
> +		reg = <0x60000000 0x40000000>;
> +	};
> +};
> +
> +&flx6 {
> +	atmel,flexcom-mode = <ATMEL_FLEXCOM_MODE_USART>;
> +	status = "okay";
> +};
> +
> +&uart6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart6_default>;
> +	status = "okay";
> +};
> +
> +&main_xtal {
> +	clock-frequency = <24000000>;
> +};
> +
> +&pioa {
> +	pinctrl_sdmmc1_default: sdmmc1-default {
> +		cmd-data {
> +			pinmux = <PIN_PB22__SDMMC1_CMD>,
> +				 <PIN_PB24__SDMMC1_DAT0>,
> +				 <PIN_PB25__SDMMC1_DAT1>,
> +				 <PIN_PB26__SDMMC1_DAT2>,
> +				 <PIN_PB27__SDMMC1_DAT3>;
> +			slew-rate = <0>;
> +			bias-disable;
> +		};
> +
> +		ck-cd-rstn-vddsel {
> +			pinmux = <PIN_PB23__SDMMC1_CK>,
> +				 <PIN_PB21__SDMMC1_RSTN>,
> +				 <PIN_PB30__SDMMC1_1V8SEL>,
> +				 <PIN_PB29__SDMMC1_CD>,
> +				 <PIN_PB28__SDMMC1_WP>;
> +			slew-rate = <0>;
> +			bias-disable;
> +		};
> +	};
> +
> +	pinctrl_uart6_default: uart6-default {
> +		pinmux = <PIN_PD18__FLEXCOM6_IO0>,
> +			<PIN_PD19__FLEXCOM6_IO1>;

Missing a space here    ^. I already added it while applying.

Thank you,
Claudiu
