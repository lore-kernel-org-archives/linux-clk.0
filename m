Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13031 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750782AbeCFQwa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 6 Mar 2018 11:52:30 -0500
Subject: Re: [PATCH v3 0/6] Exynos5: cleanup clocks handling in power
 domains
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <bd9fb3a8-0bb4-f408-6f76-567e401217a6@samsung.com>
Date: Tue, 06 Mar 2018 17:52:23 +0100
MIME-version: 1.0
In-reply-to: <20180306143312.21035-1-m.szyprowski@samsung.com>
Content-type: text/plain; charset="utf-8"
References: <CGME20180306143322eucas1p258b0dfce5af79f19dd36fbb9b4013d5a@eucas1p2.samsung.com>
        <20180306143312.21035-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 03/06/2018 03:33 PM, Marek Szyprowski wrote:
> Marek Szyprowski (6):
>   soc: samsung: pm_domains: Add blacklisting clock handling
>   clk: samsung: Add Exynos5 sub-CMU clock driver
>   clk: samsung: exynos5420: Move PD-dependent clocks to Exynos5 sub-CMU
>     driver
>   clk: samsung: exynos5250: Move PD-dependent clocks to Exynos5 sub-CMU
>     driver
>   soc: samsung: pm_domains: Deprecate support for clocks
>   ARM: dts: exynos: Remove obsolete clock properties from power domains

I have applied first four patches to samsung/clk tree, thanks.

-- 
Regards,
Sylwester
