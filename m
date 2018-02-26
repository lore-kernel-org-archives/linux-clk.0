Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57262 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754000AbeBZPJk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Feb 2018 10:09:40 -0500
MIME-Version: 1.0
In-Reply-To: <20180226125355.9052-3-m.szyprowski@samsung.com>
References: <CGME20180226125402eucas1p1ac3e0a5853218cd77f469864f70ae89d@eucas1p1.samsung.com>
 <20180226125355.9052-1-m.szyprowski@samsung.com> <20180226125355.9052-3-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 26 Feb 2018 16:09:37 +0100
Message-ID: <CAJKOXPc6UY5B+7H64cb7Qn+c8sK_22v_a3oMCXhQOyVoXhhk4A@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] clk: samsung: Add Exynos5 sub-CMU clock driver
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 26, 2018 at 1:53 PM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Exynos5250/5420/5800 have only one clock constroller, but some of their
> clock depends on respective power domains. Handling integration of clock
> controller and power domain can be done using runtime PM feature of CCF
> framework. This however needs a separate struct device for each power
> domain. This patch adds such separate driver for a group of such clocks,
> which can be instantiated more than once, each time for a different
> power domain.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-exynos5-subcmu.c | 185 +++++++++++++++++++++++++++++++
>  drivers/clk/samsung/clk-exynos5-subcmu.h |  26 +++++
>  2 files changed, 211 insertions(+)
>  create mode 100644 drivers/clk/samsung/clk-exynos5-subcmu.c
>  create mode 100644 drivers/clk/samsung/clk-exynos5-subcmu.h

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
