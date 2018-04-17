Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f195.google.com ([209.85.128.195]:43594 "EHLO
        mail-wr0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751187AbeDQP3p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Apr 2018 11:29:45 -0400
Date: Tue, 17 Apr 2018 17:29:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 6/6] ARM: dts: exynos: Remove obsolete clock
 properties from power domains
Message-ID: <20180417152941.j5viiq36n4xoibjm@kozik-lap>
References: <20180306143312.21035-1-m.szyprowski@samsung.com>
 <CGME20180306143325eucas1p2f0fe850a9d23dd467fb1814581159539@eucas1p2.samsung.com>
 <20180306143312.21035-7-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20180306143312.21035-7-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 06, 2018 at 03:33:12PM +0100, Marek Szyprowski wrote:
> Handling of special clock operations on power domain on/off sequences has
> been moved to respective Exynos clock controller drivers and clock properties
> have been marked as deprecated. Remove all clock properties from existing
> Exynos power domain nodes, as they are no longer used.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/boot/dts/exynos5250.dtsi |  4 ----
>  arch/arm/boot/dts/exynos5420.dtsi | 14 --------------
>  2 files changed, 18 deletions(-)
> 

Thanks, applied.

Best regards,
Krzysztof

