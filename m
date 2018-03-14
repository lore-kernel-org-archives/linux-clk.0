Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:34380 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750855AbeCNLNt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Mar 2018 07:13:49 -0400
Subject: Re: [PATCH v2] clk: samsung: exynos5250: Add missing clocks for
 FIMC LITE SYSMMU devices
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <c16f4391-fd3a-3093-fe92-e43c8fe50e63@samsung.com>
Date: Wed, 14 Mar 2018 12:13:42 +0100
MIME-version: 1.0
In-reply-to: <20180313104612.24257-1-m.szyprowski@samsung.com>
Content-type: text/plain; charset="utf-8"
References: <CGME20180313104621eucas1p1905014d182b444b86605d07702e91533@eucas1p1.samsung.com>
        <20180313104612.24257-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 03/13/2018 11:46 AM, Marek Szyprowski wrote:
> FIMC LITE SYSMMU devices are defined in exynos5250.dtsi, but clocks for
> them are not instantiated by Exynos5250 clock provider driver. Add needed
> definitions for those clocks to fix IOMMU probe failure:
> 
> ERROR: could not get clock /soc/sysmmu@13c40000:sysmmu(0)
> exynos-sysmmu 13c40000.sysmmu: Failed to get device clock(s)!
> exynos-sysmmu: probe of 13c40000.sysmmu failed with error -38
> ERROR: could not get clock /soc/sysmmu@13c50000:sysmmu(0)
> exynos-sysmmu 13c50000.sysmmu: Failed to get device clock(s)!
> exynos-sysmmu: probe of 13c50000.sysmmu failed with error -38
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Fixes: bfed1074f213 ("clk: exynos5250: Add missing sysmmu clocks for DISP and ISP blocks")
> Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

Patch applied, thanks.
