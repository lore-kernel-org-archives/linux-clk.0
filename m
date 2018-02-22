Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753346AbeBVKy5 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Feb 2018 05:54:57 -0500
MIME-Version: 1.0
In-Reply-To: <20180221101527.25554-5-m.szyprowski@samsung.com>
References: <CGME20180221101534eucas1p24db3c1d049d9ecd0de9c76a10bb58041@eucas1p2.samsung.com>
 <20180221101527.25554-1-m.szyprowski@samsung.com> <20180221101527.25554-5-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 22 Feb 2018 11:54:55 +0100
Message-ID: <CAJKOXPd8X3dS+h0g3+FYKX_DHiTJgy5N6aE6QeokmSqSeY-H3w@mail.gmail.com>
Subject: Re: [PATCH 4/6] clk: samsung: exynos5250: Move PD-dependent clocks to
 Exynos5x sub-CMU driver
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Feb 21, 2018 at 11:15 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Clocks related to DISP1 block require special handling for power domain
> turn on/off sequences. Till now this was handled by Exynos power domain
> driver, but that approach was limited only to some special cases. This
> patch moves handling of those operations to clock controller driver.
> This gives more flexibility and allows fine tune values of some
> clock-specific registers. This patch moves handling of those mentioned
> clocks to Exynos5x sub-CMU driver instantiated from Exynos5250 driver.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/Makefile              |  1 +
>  drivers/clk/samsung/clk-exynos5250.c      | 51 +++++++++++++++++++++----------
>  drivers/clk/samsung/clk-exynos5x-subcmu.c |  1 +
>  drivers/soc/samsung/pm_domains.c          |  1 +
>  4 files changed, 38 insertions(+), 16 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
