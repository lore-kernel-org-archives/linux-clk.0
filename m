Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C791EE7C6
	for <linux-clk@vger.kernel.org>; Fri,  9 Jan 2026 07:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767942836; cv=none; b=WebWcUSMcOOpCKXyEQKzPL5PpOCSalz3jGitk9nBtf0XtG9OsIssIAB6tkrlrsfnW98mZ5IiIDLXP50lOtfBtDbS1XsqUZDmfEnpS0q/tuhyeTPMQgb5AK5qSgQmWysXYvcHtXPB2ylQfz0KcVlMqjP8ZEkkdUJIV42XlFSg8pE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767942836; c=relaxed/simple;
	bh=KcQwGQc3+sU2VUJ2AOG2sLylKITeoi2dJ4Y2DWNlP5I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h2M6QrSp2RBNOAqG0SlgNvePGddwATN4usZSI5NQhgzu7SgzH62lYYSXNL4BGKP5U+9WEHPGvxB/ERZriv+1jwOGPl0/zzB3VqFAt2XgZy18G/krW5CNhu/hCaTlxmEIm0wytpE7VV6Z31ybl/fgBe9NYwbfedJdCmuJZbC9NC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Llh+WEBS; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Llh+WEBS"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4779cc419b2so34309235e9.3
        for <linux-clk@vger.kernel.org>; Thu, 08 Jan 2026 23:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1767942833; x=1768547633; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Z9+zkmgWhfttGX2Vm6oYQ5heXWt2y9nzcAaLuC412s=;
        b=Llh+WEBS7+qGbXnZVrpfmf/RNNNLtTID+N2CdOx5FsZ3CQvOR7o3/TBVhol9QntB/N
         W4lRjYaBLvV2XuBcjM6AKqcBt+ERLA6+TkRaF+8Wvpa76wxNt2hL1iBbxtWIlTvRyd8s
         vIsdhOpYbSGOCUkvSWm1vFFBLkX6UChZ773fPOAZ7apZSTi14gdTfnQyapArdoXmDhty
         8O5vQ9KyOA+56JxsxnpmraZXXsYEjfnx6Az8EwOgFyf24QwDbsU6GG0sBY7tsuuFs267
         ine1EKqasQe/rgxMfL8m0cYDRb/5wuFmeDzUtNo9DJcFDsQnKhF6MsVAm4geeuJ50Iz/
         1oRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767942833; x=1768547633;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Z9+zkmgWhfttGX2Vm6oYQ5heXWt2y9nzcAaLuC412s=;
        b=gKKwIQpxUNR2CMoHZ/Kx7SjievOIfINlhedsngRIUXHrTsHjYufgYwWHm1ypB8pQhT
         d9zeR07LRfVcP/Tug7+5MhM8fGIs7ZXV8YP/MzJ84Y2+q7mudUtNKL/PjxFAd5PWoEmA
         soFsA+Sg+FuJt2m+PXhJwQvUY6c5bkKlw0ik8kLwg7pzUJVkDq0XqJFW4E1l75vbysko
         lHEZvbUxfm85if1LAhy8Qr6wEml1Ci4vcpyooQsT8zOrtHr8q/lS+2ZELw1JYmvZIa0R
         brJ5AcKBdXjb/HbM4iV38urF11NNyabXyXGZdh8Z+9EBraei+P5kPhhBXI31xAk0wf8D
         6puw==
X-Forwarded-Encrypted: i=1; AJvYcCU5UGbt3BkE1VxfZ/eJSbBymdnPhywZnqIMYfaqMvLfTj2ehOkniejOZYe2acJ1D3Cab6ajHQ7xG98=@vger.kernel.org
X-Gm-Message-State: AOJu0YzMvUdv5ul20Nt9mmFbIQP9J6RUw/7RK8FvnnodydlORPcGMXZf
	AaFF5Ih6jn/vJ0oaGBekc0L1RqQ324+4trdK94v8OhZLFhPrWGk21ZRnP6Vq+hg2N24=
X-Gm-Gg: AY/fxX4p72JEFIynggcmAJm8RtrT2AKHqA8KoXCa1DxmuUk4g3o3xyGxgY2TalKMNGb
	F7YZSOLc0g8F3EhnivTj+n9qPIbw7bqn0/cNGyk7eV044cFee27gBUoMy7VH9t1GwKbKAioaVBv
	O5DYpvW4hl64VirgrG24dNfB/0bUyj8hlCt6dwpco7rOdprcOBp/Gtg2wv9BuZxJ112dKVF9arB
	A4zlTaa5Rk0ybpOk4xJnKeOnSaSgYkXJIGNFZi7f3rl9fEsTP2WaBzQ74/OqmWuaxjzjLwj5u5Y
	yH4mI7Euk5USSlnJOt/u8huLL8rnUZHOSU2KYEZnuRgiAX9JEJgkJDIP2ifnu+UN6FE6IAWJ+Po
	xvr5OuWEeCWwTSJpR4R2I8xcV7/J/9VNNrqcyc0r0PdnXd7vuys7GoQ/9cGPPJ9iqOcBsCwgio9
	r0u/kolE1DyYTMwFw4hw==
X-Google-Smtp-Source: AGHT+IGK9QSYownihupe8IX039PMILz8iGWo6V1SPxCsXcyLkP013Wlr/0AHy5MsZRLsTeDbN5JO8g==
X-Received: by 2002:a05:600c:820f:b0:477:a978:3a7b with SMTP id 5b1f17b1804b1-47d84b32f09mr90707535e9.22.1767942833264;
        Thu, 08 Jan 2026 23:13:53 -0800 (PST)
Received: from [10.31.13.216] ([82.77.28.160])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd0dacc5sm20403495f8f.5.2026.01.08.23.13.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Jan 2026 23:13:52 -0800 (PST)
Message-ID: <6d486b16-b296-47d4-909d-844ab2948994@tuxon.dev>
Date: Fri, 9 Jan 2026 09:13:51 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] clk: microchip: core: allow driver to be compiled
 with COMPILE_TEST
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 Conor Dooley <conor@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251205-clk-microchip-fixes-v3-0-a02190705e47@redhat.com>
 <20251205-clk-microchip-fixes-v3-4-a02190705e47@redhat.com>
 <e632211c-7ea5-4b27-8a06-24c160b7e947@tuxon.dev>
 <aUWoWbFS6S82CW6m@redhat.com>
Content-Language: en-US
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <aUWoWbFS6S82CW6m@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi, Brian,

Sorry for the delay, I was off for a while.

On 12/19/25 21:32, Brian Masney wrote:
> Hi Claudiu,
> 
> Sorry about the delay writing back. I was at Linux Plumbers in Tokyo.
> 
> On Sat, Dec 06, 2025 at 04:28:31PM +0200, Claudiu Beznea wrote:
>> On 12/5/25 21:46, Brian Masney wrote:
>>> This driver currently only supports builds against a PIC32 target. To
>>> avoid future breakage in the future, let's update the Kconfig and the
>>> driver so that it can be built with CONFIG_COMPILE_TEST enabled.
>>>
>>> Note that with the existing asm calls is not how I'd want to do this
>>> today if this was a new driver, however I don't have access to this
>>> hardware. To avoid any breakage, let's keep the existing behavior.
>>>
>>> Signed-off-by: Brian Masney <bmasney@redhat.com>
>>> ---
>>>   drivers/clk/microchip/Kconfig    |  2 +-
>>>   drivers/clk/microchip/clk-core.c | 32 +++++++++++++++++++++++---------
>>>   2 files changed, 24 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
>>> index 1b9e43eb54976b219a0277cc971f353fd6af226a..1e56a057319d97e20440fe4e107d26fa85c95ab1 100644
>>> --- a/drivers/clk/microchip/Kconfig
>>> +++ b/drivers/clk/microchip/Kconfig
>>> @@ -1,7 +1,7 @@
>>>   # SPDX-License-Identifier: GPL-2.0
>>>   
>>>   config COMMON_CLK_PIC32
>>> -	def_bool COMMON_CLK && MACH_PIC32
>>> +	def_bool (COMMON_CLK && MACH_PIC32) || COMPILE_TEST
>>>   
>>>   config MCHP_CLK_MPFS
>>>   	bool "Clk driver for PolarFire SoC"
>>> diff --git a/drivers/clk/microchip/clk-core.c b/drivers/clk/microchip/clk-core.c
>>> index f467d7bc28c87a50fb18dc527574f973c4b7e615..fad4b45d908310ffb59e4ed57c55ae4266253444 100644
>>> --- a/drivers/clk/microchip/clk-core.c
>>> +++ b/drivers/clk/microchip/clk-core.c
>>> @@ -9,7 +9,15 @@
>>>   #include <linux/interrupt.h>
>>>   #include <linux/io.h>
>>>   #include <linux/iopoll.h>
>>> +
>>> +#if !defined(CONFIG_MACH_PIC32) && defined(CONFIG_COMPILE_TEST)
>>
>> Can't we have something like:
>>
>> #if defined(CONFIG_MATCH_PIC32)
>> #include <asm/match-pic32/pic32.h>
>> #else
>> #define PIC32_CLR(_reg)		((_reg) + 0x04)
>> #define PIC32_SET(_reg)		((_reg) + 0x08)
>> #define PIC32_INV(_reg)		((_reg) + 0x0C)
>> #define pic32_syskey_unlock()
>> #endif
> 
> Yes, I agree that would be simpler.
> 
>>> +#define PIC32_CLR(_reg)		((_reg) + 0x04)
>>> +#define PIC32_SET(_reg)		((_reg) + 0x08)
>>> +#define PIC32_INV(_reg)		((_reg) + 0x0C)
>>> +#define pic32_syskey_unlock()
>>
>> On the other side, there are other drivers using these defines, maybe a
>> unified approach would fit better? Maybe moving these to
>> include/linux/platform_data ?
> 
> I agree that would be the better approach. Specifically:
> 
> - Move arch/mips/include/asm/mach-pic32/pic32.h to
>    include/linux/platform_data
> - Drop the unused include linux/io.h in pic32.h
> - Check for CONFIG_MATCH_PIC32 for the pic32_syskey_unlock define. Make
>    it a noop for all other architectures.
> 
> That would allow us to have the following in the drivers, with no #if's:
> 
> #include <linux/platform_data/pic32.h>
> 
> I initially wanted to go this route, and I feel that's the best
> technical decision, however my only hesitation is that this is going to
> touch at least 8 different subsystems. I could probably get the MIPS
> folks to take all of this, however it's going to be a pain to collect
> all of the ACKs from the different subsystems.
> 
> x1:~/src/linux/linus (master %)$ git grep pic32.h
> arch/mips/pic32/common/reset.c:#include <asm/mach-pic32/pic32.h>
> arch/mips/pic32/common/reset.c:static void pic32_halt(void)
> arch/mips/pic32/common/reset.c: pic32_halt();
> arch/mips/pic32/common/reset.c: pic32_halt();
> arch/mips/pic32/pic32mzda/config.c:#include <asm/mach-pic32/pic32.h>
> arch/mips/pic32/pic32mzda/early_clk.c:#include <asm/mach-pic32/pic32.h>
> arch/mips/pic32/pic32mzda/early_console.c:#include <asm/mach-pic32/pic32.h>
> arch/mips/pic32/pic32mzda/init.c:#include <linux/platform_data/sdhci-pic32.h>
> drivers/clk/microchip/clk-core.c:#include <asm/mach-pic32/pic32.h>
> drivers/irqchip/irq-pic32-evic.c:#include <asm/mach-pic32/pic32.h>
> drivers/mmc/host/sdhci-pic32.c:#include <linux/platform_data/sdhci-pic32.h>
> drivers/pinctrl/pinctrl-pic32.c:#include <asm/mach-pic32/pic32.h>
> drivers/pinctrl/pinctrl-pic32.c:#include "pinctrl-pic32.h"
> drivers/rtc/rtc-pic32.c:#include <asm/mach-pic32/pic32.h>
> drivers/tty/serial/pic32_uart.c:#include <asm/mach-pic32/pic32.h>
> drivers/watchdog/pic32-dmt.c:#include <asm/mach-pic32/pic32.h>
> drivers/watchdog/pic32-wdt.c:#include <asm/mach-pic32/pic32.h>
> 
> Thoughts?

Sounds good to me.

Thank you,
Claudiu
