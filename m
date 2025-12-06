Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1620199FBA
	for <linux-clk@vger.kernel.org>; Sat,  6 Dec 2025 14:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765031316; cv=none; b=JESARZOP7n8fi9v6az4XuUjAto7CN5xwopBN/smgAHh4RydYz4T0bcFh72xZO0y6Zm5lSaoX7NGNwY7A6UeDnAB2R5L06+cISrErttxahUSq0JuNxtKHDf3X0oWHa9ScnjrKDgGiNvqk8DLEHwoGr4Xm5vFCROTfQ4xG9YaxhW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765031316; c=relaxed/simple;
	bh=OfFiUjKtKaNQmaRHLv2heY7Dz1J/qffq7Yyx+C4QFZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOF95lcnqhf/twvkENGDfvgbx2NqcEycrh+NfZ7bn4HMPRKX1VZJS/Y9ZPXq4/R436JG2gJe+TO/z1uVtLgLArupYVMRj7be8pYTl5yMyiVJgGO/d48eoRn1gzZTAGuAUN4/U6iZ37Li3mW1WeZU76UIp/6CcefhO73T02+uYBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=EJeIy8ra; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="EJeIy8ra"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b728a43e410so296150966b.1
        for <linux-clk@vger.kernel.org>; Sat, 06 Dec 2025 06:28:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1765031313; x=1765636113; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5IBB6UY1Oufj5k9gZto8geVC180y1blDRVWD8Hcw5Lg=;
        b=EJeIy8raS1USR84aw+/gyVPxu3LLK0S+G1qNI7Rny2/mtcmawOQpOC2T6DWggYKodB
         iD3cYxU2zaOWq3MB7dmLRt56wqKl01d68XQBIHAqdSk0iwhyTyzt6I03owBK7HIA10gB
         cg20BgIIVM6mt0DGgDQOaAla3CYMZurVC3z6lt+CtELnDZhBhDMS4jHInPlUevWAW+ah
         wTFG0Kr/ydTeXOBxp0yHRlXIe1AP7GQ7Sm/uCd9AVzEOZ1O3dzboMofwUTv3fcGXS6vC
         hJO0faKVq7p8HmZxIYx/EfGYyCHOKT7VJfincbhau3bouZ2/yJkk/DqLw62CD/ybU5pP
         1J7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765031313; x=1765636113;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IBB6UY1Oufj5k9gZto8geVC180y1blDRVWD8Hcw5Lg=;
        b=B04+THsaqRvGKc4CPhtfVa5h4QboBFx68lufjsweFr3Tu8LIGiZno1NWi8cMzLOen5
         MrveNwVLz1/BLwC2Wh25QUNCjJvHMBevnuWyAa7L5pWjJN4o3f20LnHvhKOkofb+gb3i
         f0r86pfQiMwtjrxBfLsYGntPhOnz7L6DcaMCG9EuwzMQr1nJ7XoeGC4Q58OfYnXsGUXn
         hQpob7wVzWnbC+R34dTkx7Wy9O39wdEkPncXcxNI7riu5qc94KIWGOALG4oinHQQXAzY
         +Zme5T8Ce9/jZvQ1HSF5HRgAxkxgd06bj5LNkYhpu5aCXc4JVaHG2hO94dkb2B4cZxh7
         PdEg==
X-Gm-Message-State: AOJu0YwBax+nuT4T9NXSgXA7Y/sToVGy8zozyXFhPdbuqXMZoahUULJo
	ZbUBD4Ee5Yji07LZuNehuuu3W0GuVLlcdqLMfbgGiyMOzwJ0rK02C1/HMQzsF3rBF9U=
X-Gm-Gg: ASbGncvWEMwVkV2+M2vReLjt2DlfkjhoTjpUREyrVUR7J97Dm+YQ4bNXGxU+BVm+GDp
	u79cA55bLss+7kQ/y7iZTJcs8ZpJdhDpw4Uy9OL9Jr2zAqaFrg6scdjng4ebRP7CYiEAg2hCFHA
	No45ySsuNHVmHnXX6FC+w12oA5uuyLAgv1upBoPrN9Vdaywlklz7MwjI/p8P2lMftJxcXoSko0L
	iv8A0Ajp+VqGWBI3n7JMJ2XWMgScOYe6RshTHEZaqIlgeK+uZPqFg6ZgBm2ecWHNELKprwM3Gne
	Pt7lQ2rNRwHzAPxED4sc+nd9cS3rssUIWo8OidJS6M+nxf5twHGSSpuQJaVAcC9ppVqkRaS9GLY
	MfHGzBCMcvPcNQC/n2fwPsGCj3ZFmnfSgqlcRlJ/N/7/ZVEoEc3PQpV+yInNrD+bHq+7YRU46L2
	1+M8zKGveUHPHVI0G+lPg0w/1ypjineg==
X-Google-Smtp-Source: AGHT+IF/jLLEs1IGqvlgQyQ2QONsiOXgBbQIA3ULe9FnhRwCWhVd/MizN4otMgWpmCB1z5eDdGwQTw==
X-Received: by 2002:a17:907:749:b0:b76:e6bd:7bcd with SMTP id a640c23a62f3a-b7a243074b1mr255027566b.20.1765031312727;
        Sat, 06 Dec 2025 06:28:32 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.134])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b79f49d1c4bsm638675366b.55.2025.12.06.06.28.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 06:28:32 -0800 (PST)
Message-ID: <e632211c-7ea5-4b27-8a06-24c160b7e947@tuxon.dev>
Date: Sat, 6 Dec 2025 16:28:31 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
To: Brian Masney <bmasney@redhat.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <20251205-clk-microchip-fixes-v3-4-a02190705e47@redhat.com>
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Content-Language: en-US
In-Reply-To: <20251205-clk-microchip-fixes-v3-4-a02190705e47@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi, Brian,

On 12/5/25 21:46, Brian Masney wrote:
> This driver currently only supports builds against a PIC32 target. To
> avoid future breakage in the future, let's update the Kconfig and the
> driver so that it can be built with CONFIG_COMPILE_TEST enabled.
> 
> Note that with the existing asm calls is not how I'd want to do this
> today if this was a new driver, however I don't have access to this
> hardware. To avoid any breakage, let's keep the existing behavior.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> ---
>  drivers/clk/microchip/Kconfig    |  2 +-
>  drivers/clk/microchip/clk-core.c | 32 +++++++++++++++++++++++---------
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
> index 1b9e43eb54976b219a0277cc971f353fd6af226a..1e56a057319d97e20440fe4e107d26fa85c95ab1 100644
> --- a/drivers/clk/microchip/Kconfig
> +++ b/drivers/clk/microchip/Kconfig
> @@ -1,7 +1,7 @@
>  # SPDX-License-Identifier: GPL-2.0
>  
>  config COMMON_CLK_PIC32
> -	def_bool COMMON_CLK && MACH_PIC32
> +	def_bool (COMMON_CLK && MACH_PIC32) || COMPILE_TEST
>  
>  config MCHP_CLK_MPFS
>  	bool "Clk driver for PolarFire SoC"
> diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
> index f467d7bc28c87a50fb18dc527574f973c4b7e615..fad4b45d908310ffb59e4ed57c55ae4266253444 100644
> --- a/drivers/clk/microchip/clk-core.c
> +++ b/drivers/clk/microchip/clk-core.c
> @@ -9,7 +9,15 @@
>  #include <linux/interrupt.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +
> +#if !defined(CONFIG_MACH_PIC32) && defined(CONFIG_COMPILE_TEST)

Can't we have something like:

#if defined(CONFIG_MATCH_PIC32)
#include <asm/match-pic32/pic32.h>
#else
#define PIC32_CLR(_reg)		((_reg) + 0x04)
#define PIC32_SET(_reg)		((_reg) + 0x08)
#define PIC32_INV(_reg)		((_reg) + 0x0C)
#define pic32_syskey_unlock()
#endif

> +#define PIC32_CLR(_reg)		((_reg) + 0x04)
> +#define PIC32_SET(_reg)		((_reg) + 0x08)
> +#define PIC32_INV(_reg)		((_reg) + 0x0C)
> +#define pic32_syskey_unlock()

On the other side, there are other drivers using these defines, maybe a
unified approach would fit better? Maybe moving these to
include/linux/platform_data ?

> +#else
>  #include <asm/mach-pic32/pic32.h>
> +#endif
>  
>  #include "clk-core.h"
>  
> @@ -74,15 +82,21 @@
>  /* SoC specific clock needed during SPLL clock rate switch */
>  static struct clk_hw *pic32_sclk_hw;
>  
> -/* add instruction pipeline delay while CPU clock is in-transition. */
> -#define cpu_nop5()			\
> -do {					\
> -	__asm__ __volatile__("nop");	\
> -	__asm__ __volatile__("nop");	\
> -	__asm__ __volatile__("nop");	\
> -	__asm__ __volatile__("nop");	\
> -	__asm__ __volatile__("nop");	\
> -} while (0)
> +#if !defined(CONFIG_MACH_PIC32) && defined(CONFIG_COMPILE_TEST)

Same here, can't we have:

#ifdef CONFIG_MATCH_PIC32
#define cpu_nop5()			\
	do {					\
		__asm__ __volatile__("nop");	\
		__asm__ __volatile__("nop");	\
		__asm__ __volatile__("nop");	\
		__asm__ __volatile__("nop");	\
		__asm__ __volatile__("nop");	\
	} while (0)
#else
#define cpu_nop5()
#endif

?

> +#define cpu_nop5()
> +#else
> +{

This leads to the following error when compiling:

../drivers/clk/microchip/clk-core.c:88:1: error: expected identifier or ‘(’
before ‘{’ token
   88 | {
      | ^

Thank you,
Claudiu

> +	/* add instruction pipeline delay while CPU clock is in-transition. */
> +	#define cpu_nop5()			\
> +	do {					\
> +		__asm__ __volatile__("nop");	\
> +		__asm__ __volatile__("nop");	\
> +		__asm__ __volatile__("nop");	\
> +		__asm__ __volatile__("nop");	\
> +		__asm__ __volatile__("nop");	\
> +	} while (0)
> +}
> +#endif
>  
>  /* Perpheral bus clocks */
>  struct pic32_periph_clk {
> 

