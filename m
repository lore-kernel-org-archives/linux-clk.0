Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:39332 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728261AbeH3POE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Aug 2018 11:14:04 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180830111225euoutp028df782cd769abe98e0dbceba0fbb6387~PpR3rCv-l2069620696euoutp02A
        for <linux-clk@vger.kernel.org>; Thu, 30 Aug 2018 11:12:25 +0000 (GMT)
Subject: Re: [PATCH 1/2] clk: samsung: Use NOIRQ stage for Exynos5433 clocks
 suspend/resume
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?=
        <b.zolnierkie@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 30 Aug 2018 13:12:23 +0200
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeKEBZ8u9h2=bKtk6GhVVbsV719qGS_5oyy98B+qZQx9g@mail.gmail.com>
Message-Id: <20180830111224eucas1p13ce54ae974ddfaada05e265bba926f0b~PpR2FY2zD2568825688eucas1p1D@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20180829160024eucas1p1049ff966800cdc44e876d546978df399@eucas1p1.samsung.com>
        <20180829160013.9447-1-m.szyprowski@samsung.com>
        <20180829160013.9447-2-m.szyprowski@samsung.com>
        <CAJKOXPeHkbYA6hE+YfgdogiH48zXpFrqauhgmGCDYQs=Dt-iyQ@mail.gmail.com>
        <20180830095909eucas1p1be50efaae96040be0663e9997d0d607c~PoR5Ollhd2533325333eucas1p1G@eucas1p1.samsung.com>
        <CAJKOXPeVKwA8xOuW_qEPWjqwrgFogNwD8dcqxz+_Bn6W3AC=8A@mail.gmail.com>
        <20180830103424eucas1p2163c9fd7ec7cf08fccc3ee22ad4ddc74~Powq6EK521806518065eucas1p2R@eucas1p2.samsung.com>
        <CAJKOXPeKEBZ8u9h2=bKtk6GhVVbsV719qGS_5oyy98B+qZQx9g@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On 2018-08-30 12:45, Krzysztof Kozlowski wrote:
> On Thu, 30 Aug 2018 at 12:34, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Hi Krzysztof,
>>
>> On 2018-08-30 12:25, Krzysztof Kozlowski wrote:
>>> On Thu, 30 Aug 2018 at 11:59, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>> On 2018-08-30 08:29, Krzysztof Kozlowski wrote:
>>>>> On Wed, 29 Aug 2018 at 18:00, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>>> Clocks should be suspended as late as possible and resumed as early as
>>>>>> possible to let other drivers do their own suspend/resume tasks. NOIRQ
>>>>>> callbacks better suit this requirement.
>>>>> I think that's not a good reason to use the noirq versions. These are
>>>>> to solve the races with interrupt handlers, not to manually order
>>>>> callbacks.
>>>> Then please tell me which other solution should I use to make clock
>>>> available
>>>> on Exynos5433 during NOIRQ suspend/resume phase. dw-mmc driver requires to
>>>> access its clocks in NOIRQ resume.
>>> Indeed I found the usage of noirq in the dw-mmc driver which made me
>>> wondering why it is there... and if you look at explanation, the noirq
>>> is only for the purpose of clearing wakeup interrupt in CLKSEL
>>> register.
>>>
>>> Further code refactoring moved more and more code to suspend_noirq,
>>> including the runtime PM part. This probably should not be part of
>>> suspend_noirq but regular suspend. Then all the need of manual
>>> ordering would go away. So the answer to your question - try fixing
>>> buggy dw-mmc driver. :)
>> It is not the bug in dw-mmc driver. It clearly needs to access some its
>> registers during NOIRQ phase. However accessing registers requires to
>> have clocks enabled, which is being handled by runtime PM. There is
>> nothing broken here.
> Ah I missed that point and I see you fixed that case in "mmc:
> dw_mmc-exynos: fix potential external abort in resume_noirq()". The
> true reasoning for this patch is that soc clk driver should suspend
> after every other suspend callback which is using clocks... It would
> be nice to explain this particular scenario in commit msg.
>
> However both dw-mmc and clk will be now in suspend noirq phase so do
> you have any guarantees that dw-mmc will be suspended after clk?

Frankly speaking this works now, because the devices are populated in
the order of their presence in device-tree. When the order would be
reverse, dw-mmc driver will defer probe until clocks are registered.
This would be enough to ensure proper suspend/resume order, because all
deferred devices are moved to the end of dpm_list (the list of device
used for system suspend/resume calls), see deferred_probe_work_func()
and comments there.

This is however still not fully resolved problem that has to be
addressed one day. Andrzej Hajda will have a speech on this topic at
Open Source Summit:

https://osseu18.sched.com/event/FxYd/deferred-problem-issues-with-complex-dependencies-between-devices-in-linux-kernel-andrzej-hajda-samsung

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
