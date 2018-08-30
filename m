Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728374AbeH3Ke6 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Aug 2018 06:34:58 -0400
MIME-Version: 1.0
References: <CGME20180829155059eucas1p28a20924521edaa4c9bd3d9683d0f2d0d@eucas1p2.samsung.com>
 <20180829155046.29359-1-m.szyprowski@samsung.com> <20180829155046.29359-2-m.szyprowski@samsung.com>
In-Reply-To: <20180829155046.29359-2-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 30 Aug 2018 08:34:10 +0200
Message-ID: <CAJKOXPfYHuAnW7NNraa+qsbgVK+U4T8qjYcB_UH1gzr91uoxNw@mail.gmail.com>
Subject: Re: [PATCH 01/10] clk: samsung: Remove excessive include
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
> Exynos Audio SubSystem and Exynos3250 clock drivers don't use any syscore
> function, so don't include linux/syscore_ops.h in their code.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos-audss.c | 1 -
>  drivers/clk/samsung/clk-exynos3250.c   | 1 -
>  2 files changed, 2 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
