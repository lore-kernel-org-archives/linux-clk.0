Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52304 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727178AbeHaKm5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 31 Aug 2018 06:42:57 -0400
MIME-Version: 1.0
References: <CGME20180829155101eucas1p22b694bf6395d8efcb33ba3802e287c88@eucas1p2.samsung.com>
 <20180829155046.29359-1-m.szyprowski@samsung.com> <20180829155046.29359-8-m.szyprowski@samsung.com>
In-Reply-To: <20180829155046.29359-8-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 31 Aug 2018 08:36:48 +0200
Message-ID: <CAJKOXPf3KfhHpS=CPU3wwQFWnfUk_fmhyk0smx_iZ3gePrOGBg@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: samsung: exynos5250: Use generic helper for
 handling suspend/resume
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
        <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, 29 Aug 2018 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Replace common suspend/resume handling code by generic helper.
> No functional change.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5250.c | 42 ++--------------------------
>  1 file changed, 2 insertions(+), 40 deletions(-)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
