Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C814C433EF
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 13:10:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 78D2461152
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 13:10:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234705AbhKINNm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Nov 2021 08:13:42 -0500
Received: from mail-lj1-f182.google.com ([209.85.208.182]:38449 "EHLO
        mail-lj1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234686AbhKINNl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Nov 2021 08:13:41 -0500
Received: by mail-lj1-f182.google.com with SMTP id e9so15684307ljl.5;
        Tue, 09 Nov 2021 05:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=sffqGSBwNCDIhRwsUWTxOGjcxPuiCUueCgTIxVPnjaw=;
        b=nqsYEGOlFIuHw/lrmcVabQN5KQlidFnxPM97JUtQ+OlJyZM6C8ucjIQvWEpzqXIGVR
         mHCofS6p7y576w9S2AeRlERVwlzIfUax1XgY10pNjqrcsOqGruyUYm4LnGCOKrVnBkbd
         dEl8aFNo/K1gFjJrdFaz9nkhrTsZqSSAU7AD05/3mgxZ7G9cOnV5Wydi16AcH7SljQ5b
         H1o4rFQ+/lRw7F17LinnTm/6VLcUXqKpGit83QYXFCSKD89Ypu/A8VZjDJrXALqL46Eg
         dpXZujlCPrUjsjfwtGSjcr8xj8DKHaCzCpoh3HcQUWqbHavnv8peB0lNzPiEXrbl3AUF
         sKuw==
X-Gm-Message-State: AOAM531Aod6Z3zA0hyZ2BME7RleZMd5N6KOzpd/HKAhW1YplRI4wqmn8
        rTp853Hje4BjPRmAJRTJSjOu9GL7UoQ=
X-Google-Smtp-Source: ABdhPJwI7CpXfXTR+/LrzqLFzQJ2conFMadoEArtroeQlJPJEG4ItG/KBholgkNXmA54ZH3HzzHgPQ==
X-Received: by 2002:a2e:9a41:: with SMTP id k1mr7345323ljj.147.1636463454654;
        Tue, 09 Nov 2021 05:10:54 -0800 (PST)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.googlemail.com with ESMTPSA id d16sm819044ljj.87.2021.11.09.05.10.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Nov 2021 05:10:53 -0800 (PST)
Message-ID: <488b7821-674f-61ff-a960-ba3f650d3a78@kernel.org>
Date:   Tue, 9 Nov 2021 14:10:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH v5 2/2 resend] clk: microchip: Add driver for Microchip
 PolarFire SoC
Content-Language: en-US
To:     Palmer Dabbelt <palmer@dabbelt.com>, daire.mcnamara@microchip.com
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, cyril.jean@microchip.com,
        conor.dooley@microchip.com, david.abdurachmanov@gmail.com
References: <mhng-2e959dbf-7344-4ddc-b133-06ef3c5abccf@palmerdabbelt-glaptop>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <mhng-2e959dbf-7344-4ddc-b133-06ef3c5abccf@palmerdabbelt-glaptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/08/2021 23:09, Palmer Dabbelt wrote:
> On Wed, 18 Aug 2021 07:11:02 PDT (-0700), daire.mcnamara@microchip.com wrote:
>> From: Daire McNamara <daire.mcnamara@microchip.com>
>>
>> Add support for clock configuration on Microchip PolarFire SoC
>>
>> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
>> ---
>>  drivers/clk/Kconfig              |   1 +
>>  drivers/clk/Makefile             |   2 +-
>>  drivers/clk/microchip/Kconfig    |   7 +
>>  drivers/clk/microchip/Makefile   |   6 +-
>>  drivers/clk/microchip/clk-mpfs.c | 444 +++++++++++++++++++++++++++++++
>>  5 files changed, 457 insertions(+), 3 deletions(-)
>>  create mode 100644 drivers/clk/microchip/Kconfig
>>  create mode 100644 drivers/clk/microchip/clk-mpfs.c
>>
>> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
>> index a588d56502d4..ab604dd02acf 100644
>> --- a/drivers/clk/Kconfig
>> +++ b/drivers/clk/Kconfig
>> @@ -388,6 +388,7 @@ source "drivers/clk/keystone/Kconfig"
>>  source "drivers/clk/mediatek/Kconfig"
>>  source "drivers/clk/meson/Kconfig"
>>  source "drivers/clk/mstar/Kconfig"
>> +source "drivers/clk/microchip/Kconfig"
>>  source "drivers/clk/mvebu/Kconfig"
>>  source "drivers/clk/qcom/Kconfig"
>>  source "drivers/clk/renesas/Kconfig"
>> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
>> index b22ae4f81e0b..fb87a18ae8ec 100644
>> --- a/drivers/clk/Makefile
>> +++ b/drivers/clk/Makefile
>> @@ -89,7 +89,7 @@ obj-$(CONFIG_ARCH_KEYSTONE)		+= keystone/
>>  obj-$(CONFIG_MACH_LOONGSON32)		+= loongson1/
>>  obj-y					+= mediatek/
>>  obj-$(CONFIG_ARCH_MESON)		+= meson/
>> -obj-$(CONFIG_MACH_PIC32)		+= microchip/
>> +obj-y					+= microchip/
>>  ifeq ($(CONFIG_COMMON_CLK), y)
>>  obj-$(CONFIG_ARCH_MMP)			+= mmp/
>>  endif
>> diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kconfig
>> new file mode 100644
>> index 000000000000..f5edc7b3c07c
>> --- /dev/null
>> +++ b/drivers/clk/microchip/Kconfig
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +
>> +config MCHP_CLK_MPFS
>> +	bool "Clk driver for PolarFire SoC"
>> +	depends on (RISCV && SOC_MICROCHIP_POLARFIRE) || COMPILE_TEST
> 
> This shouldn't depend on the SOC config.  Those were meant to just 
> enable a set of drivers, not restrict what can be enabled. 

The kernel config is overwhelmed with amount of choices of drivers, so
it is quite common to restrict the choices of subarch-specific drivers
to these sub-architectures. That's how many, if not most, of ARM v7 and
ARMv8 drivers are restricted. Some other RISC-V drivers follow this
concept (git grep SOC_CANAAN, git grep SOC_SIFIVE) because it is
friendly for people configuring kernels. Why making configuration choice
more difficult and show the SoC-specific clock driver to every other
platform (when this SoC is not used)?

Best regards,
Krzysztof
