Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:45695 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752547AbeBZNJz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Feb 2018 08:09:55 -0500
Subject: Re: [PATCH 0/6] Exynos5: cleanup clocks handling in power domains
To: Anand Moon <linux.amoon@gmail.com>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-id: <c1d83b91-675a-5fb7-e28d-434a01a2eb54@samsung.com>
Date: Mon, 26 Feb 2018 14:09:50 +0100
MIME-version: 1.0
In-reply-to: <CANAwSgQirTqLMCCUWZNUKn3jVTCssjkD=H9Oe2R729K81xm2pg@mail.gmail.com>
Content-type: text/plain; charset="utf-8"; format="flowed"
References: <CGME20180221101532eucas1p24200cb65dba8209cd99dba5427c9a28d@eucas1p2.samsung.com>
        <20180221101527.25554-1-m.szyprowski@samsung.com>
        <CANAwSgQirTqLMCCUWZNUKn3jVTCssjkD=H9Oe2R729K81xm2pg@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Anand,

On 2018-02-22 06:42, Anand Moon wrote:
> On 21 February 2018 at 15:45, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> This patchset performs cleanup of the clock handling during Exynos power
>> domain power on/off sequences. This has been achieved by moving all clock
>> related operations from Exynos power domain driver to respective Exynos
>> clock controller drivers. Such change is possible after introducinng
>> runtime power-management in common clock framework.
>>
>> Another nice result of this cleanup is removal of deplock warning reported
>> in the following thread (the 'second issue'):
>> https://www.spinics.net/lists/linux-samsung-soc/msg61766.html
>>
>> [    5.932966] ======================================================
>> [    5.937199] usb 5-1: new high-speed USB device number 2 using xhci-hcd
>> [    5.939073] WARNING: possible circular locking dependency detected
>> [    5.939110] 4.15.0-rc8-next-20180116 #1121 Tainted: G        W
>> [    5.958143] ------------------------------------------------------
>> [    5.964299] kworker/0:1/59 is trying to acquire lock:
>> [    5.969304]  (&genpd->mlock){+.+.}, at: [<6abc3872>] genpd_runtime_resume+0x104/0x260
>> [    5.977155]
>> [    5.977155] but task is already holding lock:
>> [    5.982926]  (prepare_lock){+.+.}, at: [<74cef905>] clk_prepare_lock+0x10/0xf8
>> [    5.990143]
>> [    5.990143] which lock already depends on the new lock.
>> [    5.990143]
>> [    5.998309]
>> [    5.998309] the existing dependency chain (in reverse order) is:
>> [    6.005739]
>> [    6.005739] -> #1 (prepare_lock){+.+.}:
>> [    6.011042]        mutex_lock_nested+0x1c/0x24
>> [    6.015419]        clk_prepare_lock+0x50/0xf8
>> [    6.019755]        clk_unprepare+0x1c/0x2c
>> [    6.023841]        exynos_pd_power+0x1a8/0x1e4
>> [    6.028246]        genpd_power_off+0x160/0x274
>> [    6.032664]        genpd_power_off_work_fn+0x2c/0x40
>> [    6.037630]        process_one_work+0x2d4/0x8f0
>> [    6.042104]        worker_thread+0x38/0x584
>> [    6.046268]        kthread+0x138/0x168
>> [    6.049981]        ret_from_fork+0x14/0x20
>> [    6.054044]          (null)
>> [    6.056794]
>> [    6.056794] -> #0 (&genpd->mlock){+.+.}:
>> [    6.062238]        __mutex_lock+0x7c/0xa68
>> [    6.066278]        mutex_lock_nested+0x1c/0x24
>> [    6.070703]        genpd_runtime_resume+0x104/0x260
>> [    6.075557]        __rpm_callback+0xc0/0x21c
>> [    6.079792]        rpm_callback+0x20/0x80
>> [    6.083774]        rpm_resume+0x558/0x7dc
>> [    6.087762]        __pm_runtime_resume+0x60/0x98
>> [    6.092367]        clk_core_prepare+0x44/0x490
>> [    6.096783]        clk_prepare+0x20/0x30
>> [    6.100674]        amba_get_enable_pclk+0x2c/0x60
>> [    6.105363]        amba_device_try_add+0x8c/0x20c
>> [    6.110041]        amba_deferred_retry_func+0x40/0xbc
>> [    6.115080]        process_one_work+0x2d4/0x8f0
>> [    6.119569]        worker_thread+0x38/0x584
>> [    6.123727]        kthread+0x138/0x168
>> [    6.127444]        ret_from_fork+0x14/0x20
>> [    6.131510]          (null)
>> [    6.134263]
>> [    6.134263] other info that might help us debug this:
>> [    6.134263]
>> [    6.142328]  Possible unsafe locking scenario:
>> [    6.142328]
>> [    6.148178]        CPU0                    CPU1
>> [    6.152656]        ----                    ----
>> [    6.157160]   lock(prepare_lock);
>> [    6.160439]                                lock(&genpd->mlock);
>> [    6.166365]                                lock(prepare_lock);
>> [    6.172168]   lock(&genpd->mlock);
>> [    6.175517]
>> [    6.175517]  *** DEADLOCK ***
>> [    6.175517]
>> [    6.181475] 4 locks held by kworker/0:1/59:
>> [    6.185580]  #0:  ((wq_completion)"events"){+.+.}, at: [<f71c19aa>] process_one_work+0x210/0x8f0
>> [    6.194407]  #1:  ((deferred_retry_work).work){+.+.}, at: [<f71c19aa>] process_one_work+0x210/0x8f0
>> [    6.203422]  #2:  (deferred_devices_lock){+.+.}, at: [<3e940c1f>] amba_deferred_retry_func+0x1c/0xbc
>> [    6.212522]  #3:  (prepare_lock){+.+.}, at: [<74cef905>] clk_prepare_lock+0x10/0xf8
>> [    6.220128]
>> [    6.220128] stack backtrace:
>> [    6.224438] CPU: 0 PID: 59 Comm: kworker/0:1 Tainted: G        W        4.15.0-rc8-next-20180116 #1121
>> [    6.233757] Hardware name: SAMSUNG EXYNOS (Flattened Device Tree)
>> [    6.239791] Workqueue: events amba_deferred_retry_func
>> [    6.244929] [<c0111f90>] (unwind_backtrace) from [<c010e360>] (show_stack+0x10/0x14)
>> [    6.252670] [<c010e360>] (show_stack) from [<c0a19860>] (dump_stack+0x98/0xc4)
>> [    6.259877] [<c0a19860>] (dump_stack) from [<c0181478>] (print_circular_bug.constprop.17+0x210/0x32c)
>> [    6.269077] [<c0181478>] (print_circular_bug.constprop.17) from [<c01848f8>] (__lock_acquire+0x155c/0x1ac8)
>> [    6.278786] [<c01848f8>] (__lock_acquire) from [<c0185884>] (lock_acquire+0xe0/0x2bc)
>> [    6.286558] [<c0185884>] (lock_acquire) from [<c0a31788>] (__mutex_lock+0x7c/0xa68)
>> [    6.294181] [<c0a31788>] (__mutex_lock) from [<c0a32190>] (mutex_lock_nested+0x1c/0x24)
>> [    6.302161] [<c0a32190>] (mutex_lock_nested) from [<c05885dc>] (genpd_runtime_resume+0x104/0x260)
>> [    6.311008] [<c05885dc>] (genpd_runtime_resume) from [<c057c6c4>] (__rpm_callback+0xc0/0x21c)
>> [    6.319484] [<c057c6c4>] (__rpm_callback) from [<c057c840>] (rpm_callback+0x20/0x80)
>> [    6.327185] [<c057c840>] (rpm_callback) from [<c057c2a8>] (rpm_resume+0x558/0x7dc)
>> [    6.334721] [<c057c2a8>] (rpm_resume) from [<c057c58c>] (__pm_runtime_resume+0x60/0x98)
>> [    6.342706] [<c057c58c>] (__pm_runtime_resume) from [<c04b7f6c>] (clk_core_prepare+0x44/0x490)
>> [    6.351297] [<c04b7f6c>] (clk_core_prepare) from [<c04ba304>] (clk_prepare+0x20/0x30)
>> [    6.359081] [<c04ba304>] (clk_prepare) from [<c04b52f4>] (amba_get_enable_pclk+0x2c/0x60)
>> [    6.367229] [<c04b52f4>] (amba_get_enable_pclk) from [<c04b5510>] (amba_device_try_add+0x8c/0x20c)
>> [    6.376164] [<c04b5510>] (amba_device_try_add) from [<c04b56f8>] (amba_deferred_retry_func+0x40/0xbc)
>> [    6.385361] [<c04b56f8>] (amba_deferred_retry_func) from [<c01465b4>] (process_one_work+0x2d4/0x8f0)
>> [    6.394457] [<c01465b4>] (process_one_work) from [<c0147860>] (worker_thread+0x38/0x584)
>> [    6.402497] [<c0147860>] (worker_thread) from [<c014d794>] (kthread+0x138/0x168)
>> [    6.409852] [<c014d794>] (kthread) from [<c01010b4>] (ret_from_fork+0x14/0x20)
>>
>> This patchset affects Exynos5250 and Exynos5420/5422/5800 SoCs.
>>
>> Changes has been tested on Snow Chromebook (Exynos5250), Peach-Pit
>> Chromebook2 (Exynos5420) and Odroid XU3/XU4 (Exynos5422) boards with
>> latest linux-next kernel.
> I feel their is different CMU to support clk framework on Exynos platform.
> below are the some of the address of the CMU from the respective user manual.
>
> Exynos 4412:
> The address map of Exynos 4412 clock controller consists of six CMUs.
> They are, CMU_LEFTBUS, CMU_RIGHTBUS, CMU_TOP, CMU_DMC, CMU_CPU, and
> CMU_ISP. Each CMU uses an address space of 16 KB for SFRs.
> The internal structure of address space for each CMU is similar for all CMUs.
>
> 0x1003_4000         CMU_LEFTBUS
> 0x1003_8000         CMU_RIGHTBUS
> 0x1003_C000         CMU_TOP
> 0x1004_0000         CMU_DMC
> 0x1004_4000         CMU_CPU
>
> Exynos 5250:
> The address map of Exynos 5250 clock controller. There are nine CMUs
> in Exynos 5250 and
> each CMU uses 16 KB address space for SFRs. The nine CMUs are CMU_CPU,
> CMU_CORE, CMU_ACP,
> CMU_ISP, CMU_TOP, CMU_LEX, CMU_R0X, CMU_R1X, and CMU_CDREX. The
> internal structure of the
> address space for each CMU is similar to all CMUs.
>
> 0x1001_0000       CMU_CPU
> 0x1001_4000       CMU_CORE
> 0x1001_8000       CMU_ACP
> 0x1001_C000       CMU_ISP
> 0x1002_0000       CMU_TOP
> 0x1002_4000       CMU_LEX
> 0x1002_8000       CMU_R0X
> 0x1002_C000       CMU_R1X
> 0x1003_4000       CMU_CDREX
>
> Exynos5422:
> The address map of Exynos 5422 Clock Controller. Exynos 5422 provides
> for seven CMUs:
> CMU_CPU, CMU_KFC, CMU_CDREX, CMU_CPERI, CMU_G2D, CMU_ISP,  CMU_TOP
> Each CMU uses 16 KB address space for SFRs. The internal structure of
> the address space
> for each CMU is similar for all CMUs.
>
> 0x1001_0000         CMU_CPU
> 0x1001_4000         CMU_CPERI
> 0x1001_8000         CMU_G2D
> 0x1001_C000        CMU_ISP
> 0x1002_4000         CMU_TOP
> 0x1003_0000         CMU_CDREX
> 0x1003_4000         CMU_KFC
>
> I feel currently we have only one parent CMU for all the clock
> so is it possible to restructure the clk to support these CMU
> and also look into respective power-domain.
>
> I have read few parts of the documentation but dont have in-dept
> knowledge into this.
> Please correct me if my understating is wrong. I have limited
> knowledge on clk frame work.

Well, the main problem with 4412 and 5420/5422 is the fact that there is
no direct relation between each CMU and respective power domains.

For example display related clocks, which correspond to DISP power domain
are all mixed in CMU_TOP together with other non-display clocks. Same for
MFC, GSC, MSC and some ISP blocks. PERI, G2D, CPU and KFC all belong to
always-on power domains, so it is easier to have them handled together.

In short: there is no point in splitting clocks controller driver based on
the base address, as it simply gives no advantage at all.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

