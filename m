Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:46199 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752045AbeB0JDv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Feb 2018 04:03:51 -0500
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQBLTk7rduT2eQQKRhRiGTw-8MRhpz2ZJdEwKTx=-zY-Q@mail.gmail.com>
References: <1519483851-31135-1-git-send-email-yamada.masahiro@socionext.com>
 <CAK8P3a26kkcmzT450326=xHXjynG=uNYi2w07w6T+T01zQOQag@mail.gmail.com>
 <CAK7LNAT8sRDNZKbcpXY+e98O+sJHw9vUM9bKvdmVZNuEEQoMdA@mail.gmail.com>
 <CAK8P3a3zMG4wV9SWg78NGmk=BU9yq5paxZvJ=coHCWxVgNhO2w@mail.gmail.com> <CAK7LNAQBLTk7rduT2eQQKRhRiGTw-8MRhpz2ZJdEwKTx=-zY-Q@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 27 Feb 2018 10:03:50 +0100
Message-ID: <CAK8P3a1cEcBTiH7_gcUPZtsuRaeoOYaH3H4cYxkUBQiLMTMq=A@mail.gmail.com>
Subject: Re: [RFC PATCH] drivers: use 'depends on MFD_SYSCON' instead of
 'select MFD_SYSCON'
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Lee Jones <lee.jones@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Feb 27, 2018 at 1:46 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2018-02-26 21:43 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>> On Mon, Feb 26, 2018 at 12:53 PM, Masahiro Yamada
>> <yamada.masahiro@socionext.com> wrote:
>>> 2018-02-26 17:43 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
>>>> On Sat, Feb 24, 2018 at 3:50 PM, Masahiro Yamada
>>>> <yamada.masahiro@socionext.com> wrote:
>>>>> As Documentation/kbuild/kconfig-language.txt notes, 'select' should be
>>>>> used with care - it forces a lower limit of another symbol, ignoring
>>>>> the dependency.
>>>>>
>>>>> MFD_SYSCON depends on HAS_IOMEM, but several drivers with COMPILE_TEST
>>>>> select it.
>>>>>
>>>>> This causes unmet dependencies for architecture without HAS_IOMEM.
>>>>>
>>>>>   $ make ARCH=score randconfig
>>>>>   scripts/kconfig/conf  --randconfig Kconfig
>>>>>   KCONFIG_SEED=0x27C47F43
>>>>>   warning: (HWSPINLOCK_QCOM && AHCI_MTK && STMMAC_PLATFORM && ...)
>>>>>   selects MFD_SYSCON which has unmet direct dependencies (HAS_IOMEM)
>>>>>
>>>>> Use 'depends on' to observe the dependency.
>>>>>
>>>>> This commit was created by the following command:
>>>>>
>>>>>   $ find drivers -name 'Kconfig*' | xargs sed -i -e \
>>>>>     's/select MFD_SYSCON$/depends on MFD_SYSCON/'
>>>>>
>>>>> Then, COMMON_CLK_NXP and S3C2410_WATCHDOG were fixed up manually.
>>>>>
>>>>> Also, make MFD_SYSCON 'default y' because some defconfig files may
>>>>> rely on someone select's MFD_SYSCON.
>>>>>
>>>>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>>>>> ---
>>>>>
>>>>> If you have a better idea to fix 'unmet dependencies',
>>>>> please suggest.
>>>>
>>>> Changing 'select MFD_SYSCON' to 'depends on' will definitely break lots
>>>> of defconfig configurations, I'd rather not do that.
>>>
>>>
>>> Could you explain why?
>>>
>>> I set 'default y' for MFD_SYSCON.
>>>
>>> Would it still break defconfig configurations?
>>
>> No, you are right, that would not break defconfigs, it would just mean one
>> useless driver being enabled for many configurations that don't need it.
>
> If we are unhappy about this,
> we can send per-arch patches
> to add CONFIG_MTD_SYSCON=y to defconfigs that need it.
>
> But, we need to decide what the right solution is.

I think for consistency, we should change the existing
'depends on MFD_SYSCON' to 'select MFD_SYSCON'. This
matches what we do with REGMAP_MMIO.

MFD_SYSCON is really a thin wrapper around REGMAP_MMIO,
so I would keep using the same conventions here, even though
we normally prefer to not 'select' any user-visible options.

It might be possible to make MFD_SYSCON a silent symbol
as well, but we'd have to make sure that all users select the symbol
then.

        Arnd
