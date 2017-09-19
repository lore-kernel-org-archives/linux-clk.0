Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:18148 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750952AbdISI4q (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Sep 2017 04:56:46 -0400
Subject: Re: [PATCH v2] clk: samsung: exynos4: Enable VPLL and EPLL clocks
 for suspend/resume cycle
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        stable@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <2954c690-5041-b7cb-bc5b-421485673ad1@samsung.com>
Date: Tue, 19 Sep 2017 10:56:38 +0200
MIME-version: 1.0
In-reply-to: <1505468516-3324-1-git-send-email-m.szyprowski@samsung.com>
Content-type: text/plain; charset="utf-8"; format="flowed"
References: <CGME20170915094209eucas1p1c959442cce50aea9553e4b73a36ab8a0@eucas1p1.samsung.com>
        <1505468516-3324-1-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/15/2017 11:41 AM, Marek Szyprowski wrote:
> Commit 6edfa11cb396 ("clk: samsung: Add enable/disable operation for
> PLL36XX clocks") added enable/disable operations to PLL clocks. Prior that
> VPLL and EPPL clocks were always enabled because the enable bit was never
> touched. Those clocks have to be enabled during suspend/resume cycle,
> because otherwise board fails to enter sleep mode. This patch enables them
> unconditionally before entering system suspend state. System restore
> function will set them to the previous state saved in the register cache
> done before that unconditional enable.
> 
> Fixes: 6edfa11cb396 ("clk: samsung: Add enable/disable operation for PLL36XX clocks")
> CC:stable@vger.kernel.org  # v4.13
> Signed-off-by: Marek Szyprowski<m.szyprowski@samsung.com>

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>

Thanks, can you please resend so the patchwork catches the patch
and with clk maintainers in Cc?

-- 
Regards,
Sylwester
