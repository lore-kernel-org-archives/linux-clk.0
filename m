Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:54122 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732496AbeITT0F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Sep 2018 15:26:05 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180920134230euoutp022c31b2a7fa1649e0ae78a0e686c62d83~WH35MSV0V3163131631euoutp02d
        for <linux-clk@vger.kernel.org>; Thu, 20 Sep 2018 13:42:30 +0000 (GMT)
Subject: Re: [RFC/PATCH] clk: samsung: exynos5433: Fix NOIRQ suspend/resume
 support
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 20 Sep 2018 15:42:27 +0200
MIME-Version: 1.0
In-Reply-To: <CAPDyKFpcs8VgPcBF4fta=tLPUatxbhvSN3TLrxm1qqDN=OS29Q@mail.gmail.com>
Message-Id: <20180920134228eucas1p2f69cf23d93d34884c6703a8a2c4d4cd1~WH33wZYnv3005330053eucas1p2q@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20180919121357eucas1p19717351c40697483d3bf467c55e46f51@eucas1p1.samsung.com>
        <20180919121342.18288-1-m.szyprowski@samsung.com>
        <CAPDyKFpcs8VgPcBF4fta=tLPUatxbhvSN3TLrxm1qqDN=OS29Q@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Ulf,

On 2018-09-19 23:18, Ulf Hansson wrote:
> On 19 September 2018 at 14:13, Marek Szyprowski
> <m.szyprowski@samsung.com> wrote:
>> My recent commit af68ec14f112 'clk: samsung: Use NOIRQ stage for Exynos5433
>> clocks suspend/resume' moved Exynos5433 CMU suspend/resume callbacks
>> to NOIRQ stage. It turned out that in some cases this is not enough to
>> ensure that clocks provided by the given CMU will be available for other
>> drivers during their NOIRQ system suspend/resume phase. Device core calls
>> pm_runtime_disable and pm_runtime_enable unconditionally on every device
>> during LATE system suspend/resume phase. This means that during
>> noirq_resume, CMU device cannot be runtime resumed, because its
>> power.disable_depth is higher than zero (runtime PM for it will be enabled
>> later in device_resume_early function).
>>
>> To let other devices properly use clocks and keep runtime PM enabled also
>> during NOIRQ system sleep phase, add calls to pm_runtime_enable/disable
>> to balance the actions done by device core. The CMU device will be
>> suspended in its noirq_suspend callback and finally resumed in noirq_resume.
>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>> Hi!
>>
>> The unconditional calls to pm_runtime_enable and pm_runtime_enable
>> in device_suspend_late and device_resume_early core functions were a bit
>> surprising for me, because they make NOIRQ phase a special case from
>> the perspective of runtime PM handling. Using LATE system sleep phase
>> to call pm_runtime_enable/disable looks like a workaround for me, but right
>> now I have no other idea how to ensure proper behavior of the Exynos5433
>> CMU driver.
>>
>> The most strange thing is that I didn't observe this initially after
>> switching to NOIRQ phase. The CMU device (FSYS_CMU) which is not under
>> any power domain behaved correctly and was properly available for DWMMC
>> device, which needs to enable clocks in its noirq_resume callback.
>>
>> However, in case of AUD_CMU and its clients (for example serial_3 device,
>> which is a part of audio-subsytem), the pm_runtime_get_sync() called from
>> clk_prepare() failed, because AUD_CMU device had still disabled runtime PM
>> support. The only difference between FSYS_CMU and AUD_CMU, is the fact
>> that AUD_CMU is under AUD power domain, while FSYS_CMU device has no power
>> domain assigned (for completely other reasons FSYS power domains is not yet
>> instantiated in exynos5433.dtsi).
>>
>> Ulf/Rafael: could You comment a bit on this issue? How it should be solved
>> properly?
> In general, this sounds like the classical problem of
> suspending/resuming devices in a correct order. The long term solution
> is to use device links to address this problem.

Device links won't help in this case. This is not a problem of correct
order of suspending/resuming devices. exynos5433 cmu device is already
suspended after its client's and resumed before them. The problem here
is using runtime PM in exynos5433 CMU driver during NOIRQ suspend/resume
stage.

> However, as a simple fix, I would try to add a ->prepare() callback
> and call pm_runtime_get_sync() from it and then in a new corresponding
> ->complete() callback, call pm_runtime_put().
>
> This means that the device will stay runtime resumed until the
> suspend_noirq phase. It would also means the pm_runtime_force_resume()
> will resume the device at resume_noirq phase. Would that work?

Yes, this will work, but it will unnecessarily wake all instances of
exynos5433 cmu and their power domains during the system suspend/resume
cycle, what I would like to avoid.

Are there any reasons for disabling runtime PM unconditionally for every
device in the system during LATE system sleep stage?

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
