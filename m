Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:41548 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752218AbeBZLyU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Feb 2018 06:54:20 -0500
MIME-Version: 1.0
In-Reply-To: <CAK8P3a26kkcmzT450326=xHXjynG=uNYi2w07w6T+T01zQOQag@mail.gmail.com>
References: <1519483851-31135-1-git-send-email-yamada.masahiro@socionext.com> <CAK8P3a26kkcmzT450326=xHXjynG=uNYi2w07w6T+T01zQOQag@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 26 Feb 2018 20:53:29 +0900
Message-ID: <CAK7LNAT8sRDNZKbcpXY+e98O+sJHw9vUM9bKvdmVZNuEEQoMdA@mail.gmail.com>
Subject: Re: [RFC PATCH] drivers: use 'depends on MFD_SYSCON' instead of
 'select MFD_SYSCON'
To: Arnd Bergmann <arnd@arndb.de>
Cc: Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

2018-02-26 17:43 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> On Sat, Feb 24, 2018 at 3:50 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> As Documentation/kbuild/kconfig-language.txt notes, 'select' should be
>> used with care - it forces a lower limit of another symbol, ignoring
>> the dependency.
>>
>> MFD_SYSCON depends on HAS_IOMEM, but several drivers with COMPILE_TEST
>> select it.
>>
>> This causes unmet dependencies for architecture without HAS_IOMEM.
>>
>>   $ make ARCH=score randconfig
>>   scripts/kconfig/conf  --randconfig Kconfig
>>   KCONFIG_SEED=0x27C47F43
>>   warning: (HWSPINLOCK_QCOM && AHCI_MTK && STMMAC_PLATFORM && ...)
>>   selects MFD_SYSCON which has unmet direct dependencies (HAS_IOMEM)
>>
>> Use 'depends on' to observe the dependency.
>>
>> This commit was created by the following command:
>>
>>   $ find drivers -name 'Kconfig*' | xargs sed -i -e \
>>     's/select MFD_SYSCON$/depends on MFD_SYSCON/'
>>
>> Then, COMMON_CLK_NXP and S3C2410_WATCHDOG were fixed up manually.
>>
>> Also, make MFD_SYSCON 'default y' because some defconfig files may
>> rely on someone select's MFD_SYSCON.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> If you have a better idea to fix 'unmet dependencies',
>> please suggest.
>
> Changing 'select MFD_SYSCON' to 'depends on' will definitely break lots
> of defconfig configurations, I'd rather not do that.


Could you explain why?

I set 'default y' for MFD_SYSCON.

Would it still break defconfig configurations?




> Only score, tile and um have some configurations that select 'NO_IOMEM'.
> Score is getting removed now, tile might get removed later (we could make
> PCI mandatory in the meantime to avoid that configuration), and I think for
> um, we already have a workaround for the NO_IOMEM dependencies
> (I forget the details).

I do not think this is a stable solution.

Or, do you mean to remove NO_IOMEM and HAS_IOMEM completely?




-- 
Best Regards
Masahiro Yamada
