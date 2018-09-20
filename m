Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:38722 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731416AbeITUIY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Sep 2018 16:08:24 -0400
MIME-Version: 1.0
References: <CGME20180919121357eucas1p19717351c40697483d3bf467c55e46f51@eucas1p1.samsung.com>
 <20180919121342.18288-1-m.szyprowski@samsung.com> <CAPDyKFpcs8VgPcBF4fta=tLPUatxbhvSN3TLrxm1qqDN=OS29Q@mail.gmail.com>
 <20180920134228eucas1p2f69cf23d93d34884c6703a8a2c4d4cd1~WH33wZYnv3005330053eucas1p2q@eucas1p2.samsung.com>
In-Reply-To: <20180920134228eucas1p2f69cf23d93d34884c6703a8a2c4d4cd1~WH33wZYnv3005330053eucas1p2q@eucas1p2.samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 20 Sep 2018 16:24:28 +0200
Message-ID: <CAJZ5v0jDUaO-zUGUy3eQ7KSHuenWtemU1Uvr0E0Q=p3pKsTGDg@mail.gmail.com>
Subject: Re: [RFC/PATCH] clk: samsung: exynos5433: Fix NOIRQ suspend/resume support
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>, snawrocki@kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, Sep 20, 2018 at 3:42 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> Hi Ulf,
>
> On 2018-09-19 23:18, Ulf Hansson wrote:
> > On 19 September 2018 at 14:13, Marek Szyprowski
> > <m.szyprowski@samsung.com> wrote:
> >> My recent commit af68ec14f112 'clk: samsung: Use NOIRQ stage for Exynos5433
> >> clocks suspend/resume' moved Exynos5433 CMU suspend/resume callbacks
> >> to NOIRQ stage. It turned out that in some cases this is not enough to
> >> ensure that clocks provided by the given CMU will be available for other
> >> drivers during their NOIRQ system suspend/resume phase. Device core calls
> >> pm_runtime_disable and pm_runtime_enable unconditionally on every device
> >> during LATE system suspend/resume phase. This means that during
> >> noirq_resume, CMU device cannot be runtime resumed, because its
> >> power.disable_depth is higher than zero (runtime PM for it will be enabled
> >> later in device_resume_early function).
> >>
> >> To let other devices properly use clocks and keep runtime PM enabled also
> >> during NOIRQ system sleep phase, add calls to pm_runtime_enable/disable
> >> to balance the actions done by device core. The CMU device will be
> >> suspended in its noirq_suspend callback and finally resumed in noirq_resume.
> >
> >> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> >> ---
> >> Hi!
> >>
> >> The unconditional calls to pm_runtime_enable and pm_runtime_enable
> >> in device_suspend_late and device_resume_early core functions were a bit
> >> surprising for me, because they make NOIRQ phase a special case from
> >> the perspective of runtime PM handling. Using LATE system sleep phase
> >> to call pm_runtime_enable/disable looks like a workaround for me, but right
> >> now I have no other idea how to ensure proper behavior of the Exynos5433
> >> CMU driver.
> >>
> >> The most strange thing is that I didn't observe this initially after
> >> switching to NOIRQ phase. The CMU device (FSYS_CMU) which is not under
> >> any power domain behaved correctly and was properly available for DWMMC
> >> device, which needs to enable clocks in its noirq_resume callback.
> >>
> >> However, in case of AUD_CMU and its clients (for example serial_3 device,
> >> which is a part of audio-subsytem), the pm_runtime_get_sync() called from
> >> clk_prepare() failed, because AUD_CMU device had still disabled runtime PM
> >> support. The only difference between FSYS_CMU and AUD_CMU, is the fact
> >> that AUD_CMU is under AUD power domain, while FSYS_CMU device has no power
> >> domain assigned (for completely other reasons FSYS power domains is not yet
> >> instantiated in exynos5433.dtsi).
> >>
> >> Ulf/Rafael: could You comment a bit on this issue? How it should be solved
> >> properly?
> > In general, this sounds like the classical problem of
> > suspending/resuming devices in a correct order. The long term solution
> > is to use device links to address this problem.
>
> Device links won't help in this case. This is not a problem of correct
> order of suspending/resuming devices. exynos5433 cmu device is already
> suspended after its client's and resumed before them. The problem here
> is using runtime PM in exynos5433 CMU driver during NOIRQ suspend/resume
> stage.

Simply put, if a driver uses PM-runtime in its noirq system-wide
callbacks, this is a bug in the driver.

> > However, as a simple fix, I would try to add a ->prepare() callback
> > and call pm_runtime_get_sync() from it and then in a new corresponding
> > ->complete() callback, call pm_runtime_put().
> >
> > This means that the device will stay runtime resumed until the
> > suspend_noirq phase. It would also means the pm_runtime_force_resume()
> > will resume the device at resume_noirq phase. Would that work?
>
> Yes, this will work, but it will unnecessarily wake all instances of
> exynos5433 cmu and their power domains during the system suspend/resume
> cycle, what I would like to avoid.
>
> Are there any reasons for disabling runtime PM unconditionally for every
> device in the system during LATE system sleep stage?

Yes, there are.

It generally is not safe to do that, because the state of the device
after/during late suspend generally may be different than expected by
its PM-runtime callbacks and that doesn't apply just to the device
itself, but also to its parent and possible suppliers and all of their
ancestors and suppliers.  The resume of a device generally triggers a
resume of all devices it depends on and that may not be expected by
their drivers and the bus types/PM domains they depend on and/or work
with.

Your particular case appears to be simple enough, but there are more
complicated ones.

Also, it generally is not a good idea to rely on PM-runtime for
system-wide PM, because PM-runtime may be effectively disabled by user
space via sysfs for any device.  IOW, pm_runtime_suspend() or
pm_runtime_put_sync() or equivalent doesn't guarantee that the device
will actually be suspended and system-wide PM is expected to work
regardless.

So, please abandon the
runtime-resume-during-noirq-phase-of-system-wide-suspend idea and find
a different way to organize your code.

Thanks,
Rafael
