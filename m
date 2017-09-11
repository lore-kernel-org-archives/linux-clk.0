Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:32809 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750989AbdIKM5z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Sep 2017 08:57:55 -0400
Subject: Re: [PATCH v9 0/5] Add runtime PM support for clocks (on Exynos SoC
 example)
To: Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Cc: Stephen Boyd <sboyd@codeaurora.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-id: <426d5e2d-a6e8-a409-635e-71b543b7fb2a@samsung.com>
Date: Mon, 11 Sep 2017 14:57:49 +0200
MIME-version: 1.0
In-reply-to: <150483237153.48525.1363518996437790191@resonance>
Content-type: text/plain; charset="utf-8"; format="flowed"
References: <CGME20170821080538eucas1p1e273ef22920493ee406ef546bcc230e5@eucas1p1.samsung.com>
        <1503302703-13801-1-git-send-email-m.szyprowski@samsung.com>
        <150483237153.48525.1363518996437790191@resonance>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Michael,

On 2017-09-08 02:59, Michael Turquette wrote:
> Hi Marek,
>
> Quoting Marek Szyprowski (2017-08-21 01:04:58)
>> Dear All,
>>
>> This patchset adds runtime PM support to common clock framework. This is an
>> attempt to implement support for clock controllers, which belongs to a power
>> domain. This approach works surprisingly well on Exynos 5433 SoC, what allowed
>> us to solve various freeze/crash issues related to power management.
>>
>> The main idea behind this patchset is to keep clock's controller power domain
>> enabled every time when at least one of its clock is enabled or access to its
>> registers is being made. Clock controller driver (clock provider) can
>> supply a struct device pointer, which is the used by clock core for tracking and
>> managing clock's controller runtime pm state. Each clk_prepare() operation will
>> first call pm_runtime_get_sync() on the supplied device, while clk_unprepare()
>> will do pm_runtime_put() at the end.
>>
>> This runtime PM feature has been tested with Exynos4412 (not included in this
>> patchset) and Exynos5433 clocks drivers. Both have some clocks, which belongs to
>> respective power domains and need special handling during power on/off
>> procedures. Till now it wasn't handled at all, what caused various problems.
>>
>> Patches for clocks drivers change the way the clock provider is initialized.
>> Instead of CLK_OF_DECLARE based initialization, a complete platform device driver
>> infrastructure is being used. This is needed to let driver to use runtime PM
>> feature and integrate with generic power domains. The side-effect of this change
>> is a delay in clock provider registeration during system boot, so early
>> initialized drivers might get EPROBEDEFER error when requesting their clocks.
>> This was an issue for IOMMU drivers, but IOMMU deferred probe support has been
>> finally merged to v4.13-rc1 and now it is handled correctly.
>>
>> Patches are based and tested on v4.13-rc5, but applies fine also on v4.13-rc1.
> Patches look good to me. It's too late for the v4.14 PR, but I'll merge
> this to clk-next after -rc1 drops.

Thanks! There will be a plenty of time to test them in linux-next then! :)

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

