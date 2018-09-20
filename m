Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-io1-f68.google.com ([209.85.166.68]:36289 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726984AbeITXOU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Sep 2018 19:14:20 -0400
Received: by mail-io1-f68.google.com with SMTP id q5-v6so8461925iop.3
        for <linux-clk@vger.kernel.org>; Thu, 20 Sep 2018 10:29:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180920134228eucas1p2f69cf23d93d34884c6703a8a2c4d4cd1~WH33wZYnv3005330053eucas1p2q@eucas1p2.samsung.com>
References: <CGME20180919121357eucas1p19717351c40697483d3bf467c55e46f51@eucas1p1.samsung.com>
 <20180919121342.18288-1-m.szyprowski@samsung.com> <CAPDyKFpcs8VgPcBF4fta=tLPUatxbhvSN3TLrxm1qqDN=OS29Q@mail.gmail.com>
 <20180920134228eucas1p2f69cf23d93d34884c6703a8a2c4d4cd1~WH33wZYnv3005330053eucas1p2q@eucas1p2.samsung.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Thu, 20 Sep 2018 19:29:46 +0200
Message-ID: <CAPDyKFok_Fc=9EDOvKByyuOYhHbejXKRT9+a+nRDEJ_YAjP2Aw@mail.gmail.com>
Subject: Re: [RFC/PATCH] clk: samsung: exynos5433: Fix NOIRQ suspend/resume support
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

[...]

>>>
>>> The unconditional calls to pm_runtime_enable and pm_runtime_enable
>>> in device_suspend_late and device_resume_early core functions were a bit
>>> surprising for me, because they make NOIRQ phase a special case from
>>> the perspective of runtime PM handling. Using LATE system sleep phase
>>> to call pm_runtime_enable/disable looks like a workaround for me, but right
>>> now I have no other idea how to ensure proper behavior of the Exynos5433
>>> CMU driver.
>>>
>>> The most strange thing is that I didn't observe this initially after
>>> switching to NOIRQ phase. The CMU device (FSYS_CMU) which is not under
>>> any power domain behaved correctly and was properly available for DWMMC
>>> device, which needs to enable clocks in its noirq_resume callback.
>>>
>>> However, in case of AUD_CMU and its clients (for example serial_3 device,
>>> which is a part of audio-subsytem), the pm_runtime_get_sync() called from
>>> clk_prepare() failed, because AUD_CMU device had still disabled runtime PM
>>> support. The only difference between FSYS_CMU and AUD_CMU, is the fact
>>> that AUD_CMU is under AUD power domain, while FSYS_CMU device has no power
>>> domain assigned (for completely other reasons FSYS power domains is not yet
>>> instantiated in exynos5433.dtsi).
>>>
>>> Ulf/Rafael: could You comment a bit on this issue? How it should be solved
>>> properly?
>> In general, this sounds like the classical problem of
>> suspending/resuming devices in a correct order. The long term solution
>> is to use device links to address this problem.
>
> Device links won't help in this case. This is not a problem of correct
> order of suspending/resuming devices. exynos5433 cmu device is already
> suspended after its client's and resumed before them. The problem here
> is using runtime PM in exynos5433 CMU driver during NOIRQ suspend/resume
> stage.
>

I see.

However, I am guessing that one of the reason to why the client's are
also using the noirq phase is because of getting a the correct order.
The point is, the different level of PM callbacks (prepare, suspend,
suspend_late, suspend_noirq etc) aren't really the right solution to
get a correct order, even if that is what works for most cases.

In principle, if all devices dependencies were hooked up correctly
with device links, we would in principle only need one level of
suspend/resume callbacks.

>> However, as a simple fix, I would try to add a ->prepare() callback
>> and call pm_runtime_get_sync() from it and then in a new corresponding
>> ->complete() callback, call pm_runtime_put().
>>
>> This means that the device will stay runtime resumed until the
>> suspend_noirq phase. It would also means the pm_runtime_force_resume()
>> will resume the device at resume_noirq phase. Would that work?
>
> Yes, this will work, but it will unnecessarily wake all instances of
> exynos5433 cmu and their power domains during the system suspend/resume
> cycle, what I would like to avoid.

I guess what you are saying is that it's not at every suspend sequence
that the client's needs to runtime resume the exynos5433 cmu device -
and in those cases when not  needed, runtime resuming it becomes a
waste in regards to both time and energy. Right?

Anyway, I fully agree that this isn't very nice, but unfortunate
that's the best I can think of as a simple solution.

[...]

Kind regards
Uffe
