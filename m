Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.samsung.com ([203.254.224.24]:28442 "EHLO
        mailout1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725758AbeH3FSz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Aug 2018 01:18:55 -0400
MIME-version: 1.0
Content-type: text/plain; charset="UTF-8"
Message-id: <5B87460C.5000005@samsung.com>
Date: Thu, 30 Aug 2018 10:19:08 +0900
From: Chanwoo Choi <cw00.choi@samsung.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org
Cc: Sylwester Nawrocki <snawrocki@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 07/10] clk: samsung: exynos5250: Use generic helper for
 handling suspend/resume
In-reply-to: <20180829155046.29359-8-m.szyprowski@samsung.com>
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155101eucas1p22b694bf6395d8efcb33ba3802e287c88@eucas1p2.samsung.com>
        <20180829155046.29359-8-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 2018년 08월 30일 00:50, Marek Szyprowski wrote:
> Replace common suspend/resume handling code by generic helper.
> No functional change.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5250.c | 42 ++--------------------------
>  1 file changed, 2 insertions(+), 40 deletions(-)

Acked-by: Chanwoo Choi <cw00.choi@samsung.com>

(snip)

-- 
Best Regards,
Chanwoo Choi
Samsung Electronics
