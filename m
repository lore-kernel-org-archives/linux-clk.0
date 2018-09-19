Return-Path: <linux-pm-owner@vger.kernel.org>
MIME-Version: 1.0
References: <CGME20180919121357eucas1p19717351c40697483d3bf467c55e46f51@eucas1p1.samsung.com>
 <20180919121342.18288-1-m.szyprowski@samsung.com>
In-Reply-To: <20180919121342.18288-1-m.szyprowski@samsung.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 20 Sep 2018 00:27:29 +0200
Message-ID: <CAJZ5v0jdE0xxyegP7KqW809+C=yG4VSkvsQQk01xV0RDwTu8Sw@mail.gmail.com>
Subject: Re: [RFC/PATCH] clk: samsung: exynos5433: Fix NOIRQ suspend/resume support
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk <linux-clk@vger.kernel.org>,
        Linux Samsung SoC <linux-samsung-soc@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Ulf Hansson <ulf.hansson@linaro.org>, snawrocki@kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 19, 2018 at 2:14 PM Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
>
> My recent commit af68ec14f112 'clk: samsung: Use NOIRQ stage for Exynos5433
> clocks suspend/resume' moved Exynos5433 CMU suspend/resume callbacks
> to NOIRQ stage. It turned out that in some cases this is not enough to
> ensure that clocks provided by the given CMU will be available for other
> drivers during their NOIRQ system suspend/resume phase. Device core calls
> pm_runtime_disable and pm_runtime_enable unconditionally on every device
> during LATE system suspend/resume phase. This means that during
> noirq_resume, CMU device cannot be runtime resumed, because its
> power.disable_depth is higher than zero (runtime PM for it will be enabled
> later in device_resume_early function).
>
> To let other devices properly use clocks and keep runtime PM enabled also
> during NOIRQ system sleep phase,

No.

> add calls to pm_runtime_enable/disable to balance the actions done by device core.

There's nothing to balance, PM-runtime doesn't work during system-wide
PM transitions as a rule.

The only thing you can do is to runtime-resume a device before
"suspend late", but you can't runtime-suspend anything anyway.

> The CMU device will be suspended in its noirq_suspend callback and finally resumed in noirq_resume.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> Hi!
>
> The unconditional calls to pm_runtime_enable and pm_runtime_enable
> in device_suspend_late and device_resume_early core functions were a bit
> surprising for me,

I wonder why.  It has been like this for a long time and it is quite
well documented AFAICS.

> because they make NOIRQ phase a special case from
> the perspective of runtime PM handling.

Well, system-wide PM transitions are not "runtime".  They use
different sets of callbacks for a reason.

> Using LATE system sleep phase
> to call pm_runtime_enable/disable looks like a workaround for me,

No, it just plain doesn't work.

> but right now I have no other idea how to ensure proper behavior of the Exynos5433
> CMU driver.
>
> The most strange thing is that I didn't observe this initially after
> switching to NOIRQ phase. The CMU device (FSYS_CMU) which is not under
> any power domain behaved correctly and was properly available for DWMMC
> device, which needs to enable clocks in its noirq_resume callback.
>
> However, in case of AUD_CMU and its clients (for example serial_3 device,
> which is a part of audio-subsytem), the pm_runtime_get_sync() called from
> clk_prepare() failed, because AUD_CMU device had still disabled runtime PM
> support. The only difference between FSYS_CMU and AUD_CMU, is the fact
> that AUD_CMU is under AUD power domain, while FSYS_CMU device has no power
> domain assigned (for completely other reasons FSYS power domains is not yet
> instantiated in exynos5433.dtsi).
>
> Ulf/Rafael: could You comment a bit on this issue? How it should be solved
> properly?

Well, as a rule, don't use PM-runtime from your system-wide PM
callbacks.  The only thing you can do is to resume a device from
runtime suspend in ->prepare or ->suspend in order to change its
configuration and suspend it later properly in the next callbacks.

With that in mind, ensure the proper ordering of system-wide suspend
of the devices as Ulf said.

Thanks,
Rafael
