Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:60355 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751834AbdJIKh5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2017 06:37:57 -0400
Subject: Re: [PATCH 0/9] Various cleanups for Samsung clocks drivers
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <180a571f-26ea-88f6-4b0c-8d5cce37da34@samsung.com>
Date: Mon, 09 Oct 2017 12:37:49 +0200
MIME-version: 1.0
In-reply-to: <20171003100016.32029-1-m.szyprowski@samsung.com>
Content-type: text/plain; charset="utf-8"
References: <CGME20171003100028eucas1p11057e4643675c66f6144d0737e8b933a@eucas1p1.samsung.com>
        <20171003100016.32029-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10/03/2017 12:00 PM, Marek Szyprowski wrote:
> Patch summary:
> 
> Marek Szyprowski (9):
>   clk: samsung: Remove support for obsolete Exynos4212 CPU clock
>   clk: samsung: Remove clkdev alias support in Exynos4 clk driver
>   clk: samsung: Remove double assignment to CLK_ARM_CLK id in Exynos4
>     driver
>   clk: samsung: Remove clkdev alias support in Exynos5250 clk driver
>   clk: samsung: Drop useless alias in Exynos5420 clk driver
>   clk: samsung: Rework clkdev alias handling in Exynos5440 driver
>   clk: samsung: Rework clkdev alias handling in S3C2443 driver
>   clk: samsung: Add explicit MPLL and EPLL clkdev aliases in S3C2443
>     driver
>   clk: samsung: Remove obsolete clkdev alias support

I have applied this patch set, thanks.
