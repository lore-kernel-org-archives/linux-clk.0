Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFAD11A83F4
	for <linux-clk@vger.kernel.org>; Mon, 17 Feb 2025 09:10:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739783443; cv=none; b=TIzLjk6lisMW0uqW49tdgvx4T0Po5KUEU598PR+0BIocU+Lx3xrYIWj1B3JE89zfpwpWjmp3ElEV7oRMd+FBbD3QJU6PAueM3nG4qAUc3SnOXAxxCzFvi2jo+2CvKPUX6swmiYEy1CygqJ7gyvethdsz/OvvNqYu44bs4sbddFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739783443; c=relaxed/simple;
	bh=gti27IHeX1Dn0PmJ9EmmFS9iD76hwWW0DoREF9bQbzs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N6C9wuCUd3obV191k3CDyhFzs2Sda7oVnANPdVew2Hj4QB1w7XHDVwSWHKPXM8xDmLQ/dP79Olys3nxPfTx48E/+xRALR106vEWBi7IRoteYGgN7NxAru4WroZAkq+ii0Sw2Qun2Aa7cv7dx5CrPsoYzYlShsIJCZpZ6MEOBvMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=A37KpkAN; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="A37KpkAN"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5dee07e51aaso5425528a12.3
        for <linux-clk@vger.kernel.org>; Mon, 17 Feb 2025 01:10:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1739783439; x=1740388239; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZuVc/9e1Yj/sPI8+yIxKHV0o19gCf//rneJUR1cMCGw=;
        b=A37KpkANdVail02PQiX7EWBLC1Mmc+Ye9pvLdQVKEWcjGp/AJXVahPo+No00e8xAiQ
         8E/kcyy6MqO6N/EzPjD22wZO8ROgn0tEXpnBYPOeJMD8K0L1qFQX2Oywgdt+vmApvPJv
         J72FGZGbzBY6DasHPbhNFv90Angg1dVkAQHQRYdLkXAUNNWfFlzV1VCVPOj1j5pPsocV
         qMY3w9Zej6sPqjfn0oNyA43koJOl8Sf1Fvg35p+99SiGXLir485/DuDURnXAOkcVBYw4
         YEl7FL7avmlAdNWN11K0tKq6XSW5kQVux+TwjwQu02ZgbwuruMUe8Ad6FJecl+5k+aTP
         06kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739783439; x=1740388239;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuVc/9e1Yj/sPI8+yIxKHV0o19gCf//rneJUR1cMCGw=;
        b=R5UOpRFKfpub3IKRjWXO7ZAD/Pn/kL3qHEIxO2HJdmm3bef8DWXRAYqP/l7thtUXQq
         6j+vlhTD2cQdW6lY2fKXhsmHQg4uHYYgQr/KOMVvJj0Ipw6r/wKUjyHTTqbfjloDRCj3
         9CgGSD1UcBqDKgNNuvehbr/nFDn6fFJUfOjmbLozJXVO1A8g/tOlFioUdA+O6+pKGU7b
         DgL3Dv7kTGl6OfEp2AbpQ1kb2FrJ0nMlLeovcx+k7Te1mxKRuLEj6TTXIXVqr9Gr9llz
         Lhq9roiz/lzGyS4bProNTB5GDo8m8slafq4AOyk3eIe+HajrA3QdfZFw6O/57wuXH7hi
         3xLg==
X-Forwarded-Encrypted: i=1; AJvYcCVrSS/VeRDKRY4qfxZfeTz9EmKTMZWtK784CbOZrC3nDNAXADk+cgYpgzrSrvTDyTjKrnigOFvld3w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcuKXqRl4xej5Jy/0OSjOaMEjSGom6ywjo2K+kHa2LCF3Bt1T1
	wml064gIy1VYMKuUHgVbvYHtWsK5YokLVaOwruusKKric0oHwTFw5dfuzSf48uE=
X-Gm-Gg: ASbGncvZdVP3EYWvI/YogoMDKOP0u8wiTPNzkhHJzftNEAoLpAPwyYHlACOH5LXokMV
	S7hiVuYf6QIZedVphsGU0vqOWBUDza3jB7dBWTse9QtPYckVJarMHrowyQ9DSyLuKzG7B7HkZIW
	BYokyEeWwOi8uF04Y2YNqZInE2pplhgOINfPNCtg9KssAy6f2cUXz5ScRTK+B++QXerwzHimDLJ
	NmfPeunrERsYfVRUbJ3R1WdK6evd8K7MV94wHdWcsy0IWhcoezxB9yfVIGaKLozLVRSbBdvlvjJ
	MIE8a0G5e3EMTRzCDexnhYI=
X-Google-Smtp-Source: AGHT+IH9wIn/oFp0HQ5Ml9Fr0/i0O7BRhz9FvkPajM9aPkSSBQ0mED5a3gvKqPWrNLKiBiFNMqW84Q==
X-Received: by 2002:a05:6402:4609:b0:5dc:1f35:552 with SMTP id 4fb4d7f45d1cf-5e0360441d1mr7250545a12.1.1739783439236;
        Mon, 17 Feb 2025 01:10:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.25])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dece1b4ed9sm6835151a12.10.2025.02.17.01.10.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Feb 2025 01:10:38 -0800 (PST)
Message-ID: <e01ed1d6-32e5-4e0d-a4f3-01acde843b5a@tuxon.dev>
Date: Mon, 17 Feb 2025 11:10:36 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/16] ARM: dts: microchip: sam9x60: Add OTPC node
To: Alexander Dahl <ada@thorsis.com>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Ryan Wanner <ryan.wanner@microchip.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20250210164506.495747-1-ada@thorsis.com>
 <20250211065304.5019-1-ada@thorsis.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20250211065304.5019-1-ada@thorsis.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 11.02.2025 08:53, Alexander Dahl wrote:
> The One-Time Programmable (OTP) Memory Controller (OTPC) is the secure
> interface between the system and the OTP memory.  It also features the
> Unique Product ID (UID) registers containing a unique serial number.
> 
> See datasheet (DS60001579G) sections "7. Memories" and "23. OTP Memory
> Controller (OTPC)" for reference.
> 
> Signed-off-by: Alexander Dahl <ada@thorsis.com>
> ---
> 
> Notes:
>     v2:
>     - squashed with patch adding the clock properties
> 
>  arch/arm/boot/dts/microchip/sam9x60.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/microchip/sam9x60.dtsi b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> index 1724b79967a17..af859f0b83a0f 100644
> --- a/arch/arm/boot/dts/microchip/sam9x60.dtsi
> +++ b/arch/arm/boot/dts/microchip/sam9x60.dtsi
> @@ -15,6 +15,7 @@
>  #include <dt-bindings/clock/microchip,sam9x60-pmc.h>
>  #include <dt-bindings/mfd/at91-usart.h>
>  #include <dt-bindings/mfd/atmel-flexcom.h>
> +#include <dt-bindings/nvmem/microchip,sama7g5-otpc.h>

This is not needed, atm.

>  
>  / {
>  	#address-cells = <1>;
> @@ -157,6 +158,15 @@ sdmmc1: sdio-host@90000000 {
>  			status = "disabled";
>  		};
>  
> +		otpc: efuse@eff00000 {
> +			compatible = "microchip,sam9x60-otpc", "syscon";
> +			reg = <0xeff00000 0xec>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			clocks = <&pmc PMC_TYPE_CORE SAM9X60_PMC_MAIN_RC>, <&pmc PMC_TYPE_PERIPHERAL 46>;
> +			clock-names = "main_rc_osc", "otpc_clk";
> +		};
> +
>  		apb {
>  			compatible = "simple-bus";
>  			#address-cells = <1>;

