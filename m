Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52BC5214A6D
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 09:05:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736413558; cv=none; b=IM+sdOF2jU8eFXSSxBjb+S218/bEfJGpF7TfBZ+VogGahxeyx1yDrlSbMb8mUeDK4fINFPi7yNC1KY0xOS5aFKaLaFsPnsp2vdVM8Wp3RTEftgBW5d+addsj7DK9V+yNA/w9Nv/gddFrxvQ9xmek+eKwvTuo3zqsh4uhQADhntI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736413558; c=relaxed/simple;
	bh=3X9WiEijehcHGThScJDj/M5PlbJqcfjClnaDwKWQmsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOAXN8wk0muZQgqBGwGHjBEIhvtSo30qZcMWbUJLJlCgXevkYP01Kt1rMNm0hTZF6DuFyBKgGD7tB3Gae8PzFPu58PnrIrriIKsjg727+lapfGiXVwQ03aX2BGyzQgS89cZWh9Kfw9CrOYFiq5d0qDP/jlKhFb7BO3yvx3JhPPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=d663mxfc; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="d663mxfc"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-38633b5dbcfso641024f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 01:05:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1736413554; x=1737018354; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bDgsyxy69lo5qTeUNcbMx7T4A8G8zgkMPtLrACBsnec=;
        b=d663mxfcDZepod7Sp/vrtf0R6bT9PIBH9XQHPH9HFY9Vtbe7c1tCuTFv6kVuNwHCz/
         kgH8+P8VGFQXydNm3h3yV7zQlnoL5bmVmzRoNLILD1s84tvW/FgltCAFrqGb93L/utGu
         YLDdCaQ4zErgcu6YoLwoBatXGkOup7EkqtEAGyU7kSdg26jpTsZw9qqjHJ2ha4Omk1FI
         ZRPb3FGjAUUc43N9zu4tc9pDvXtGjRL8mAbKGzBQiFfcVB+RHJhSiuHfhxQTXeH4MeOe
         S8fMXGzdZkF3YILsC+xx2U0p4emYoOX6ydnihfB3pPR9k6lkukFOflCq/YiRF/7B3ziC
         kzEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736413554; x=1737018354;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bDgsyxy69lo5qTeUNcbMx7T4A8G8zgkMPtLrACBsnec=;
        b=gM46yyo5KOfL4GAeydkfklIHnonmTtZyxo+9gfP+eijLtBfdpQM2yYz8mt4EJ6Dw+v
         iZtioCFGwZX2qoH//depqpznRVL+ePyZ5tx0uOGOTX0fVrXxV6eoyXIL7dwIbT9rw5w3
         AkPQNtZ6QSTETpZdrt33JhToLIci9DX57T7vNRLwwl61Zu0S/WoZUpy6OlXCfrmou5Nz
         wLQxxbPjn3Abar4XOqkFSM5lp/LLqk6wvpzNsl/buni2ocyjPZlY3PTomIABvB4NsMXR
         5c4hWKS2lyT/abuaupKjJJFnAKmvFn5uS4XFlblXhu4T9pB+uqLlYOFnVo599IGFF+km
         0UOg==
X-Forwarded-Encrypted: i=1; AJvYcCUNpmstmEf4/ciiU2R1aSltPtTSrP7T4rPps+sOqeD+8XDYT55ioYGg+X2W9ZG4wUJPSwr5ayT8yzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKBDX8ktFtOCFOHfo0UFePqqdbyaPKrs6dopYSYAD3E8UjlCIe
	aZFDgWpcjJwq/99DmPB5yiPkszPeIt/qwq+BdQV9kCbNnWLtqyu89ERdphduOkY=
X-Gm-Gg: ASbGncsMoBNLtdcENPF6Q97ViXe7BWXCG8NSRecOAzuOvcviZZF4xNCZJdLwnDBcgKS
	60PpRPwCfi7bBgskW6i5eOShtEdPFtnmdhyO9CayFk6c/+bb7CHRnjrBmVExCJ3tM4AQBasRHGn
	aqpxm7SPv/4AaZL7bE6Xo8kgVIQjXfFdVAfmbJEY9QH52P9QzBB6aqn3VdfD7KcTnD81C4MkCNR
	w/sZlyA1E2gs8uh+TjBie5S3I6oddIjPFf2/kNxLvHfgHeKGqs5Lm2Kx6c2OfQuSw==
X-Google-Smtp-Source: AGHT+IGn6+tUL2qjc6KeWfUfYK5t5bwajgtXVGt6+T5gckzV+WpKCAwBT1XMgXno9e6d1ltcd1lNOw==
X-Received: by 2002:a05:6000:188e:b0:388:c61d:43e4 with SMTP id ffacd0b85a97d-38a8733e1d1mr5799766f8f.45.1736413554441;
        Thu, 09 Jan 2025 01:05:54 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.102])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e3834a6sm1214285f8f.28.2025.01.09.01.05.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 01:05:53 -0800 (PST)
Message-ID: <c58c3935-d9bd-4091-bb7c-d1bdc2485832@tuxon.dev>
Date: Thu, 9 Jan 2025 11:05:52 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] ARM: dts: microchip: add sama7d65 SoC DT
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
 <20250107160850.120537-5-Ryan.Wanner@microchip.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250107160850.120537-5-Ryan.Wanner@microchip.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi, Ryan,

On 07.01.2025 18:07, Ryan.Wanner@microchip.com wrote:
> From: Ryan Wanner <Ryan.Wanner@microchip.com>
> 
> Add Device Tree for sama7d65 SoC.
> 
> Co-developed-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> Co-developed-by: Romain Sioen <romain.sioen@microchip.com>
> Signed-off-by: Romain Sioen <romain.sioen@microchip.com>
> Co-developed-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Varshini Rajendran <varshini.rajendran@microchip.com>
> Signed-off-by: Ryan Wanner <Ryan.Wanner@microchip.com>
> Reviewed-by: Claudiu Beznea <claudiu.beznea@tuxon.dev>
> ---
>  arch/arm/boot/dts/microchip/sama7d65.dtsi | 145 ++++++++++++++++++++++
>  1 file changed, 145 insertions(+)
>  create mode 100644 arch/arm/boot/dts/microchip/sama7d65.dtsi
> 
> diff --git a/arch/arm/boot/dts/microchip/sama7d65.dtsi b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> new file mode 100644
> index 000000000000..03e1adfdcd34
> --- /dev/null
> +++ b/arch/arm/boot/dts/microchip/sama7d65.dtsi
> @@ -0,0 +1,145 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + *  sama7d65.dtsi - Device Tree Include file for SAMA7D65 SoC
> + *
> + *  Copyright (C) 2024 Microchip Technology, Inc. and its subsidiaries

I presume the , in "Microchip Technology, Inc." it a typo. I already
removed it while applied this. Just please let me know if all good with it.

> + *
> + *  Author: Ryan Wanner <Ryan.Wanner@microchip.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/at91.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/mfd/at91-usart.h>
> +
> +/ {
> +	model = "Microchip SAMA7D65 family SoC";
> +	compatible = "microchip,sama7d65";
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +	interrupt-parent = <&gic>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			device_type = "cpu";
> +			clocks = <&pmc PMC_TYPE_CORE PMC_CPUPLL>;
> +			clock-names = "cpu";
> +		};
> +	};
> +
> +	clocks {
> +		main_xtal: clock-mainxtal {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +
> +		 slow_xtal: clock-slowxtal {

There is an extra space in front of slow_xtal. I removed it while applying.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +		};
> +

There is an empty line here. I removed it while applying.

Everything else look good to me.

Thank you,
Claudiu
