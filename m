Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:58030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S932767AbeBUQVM (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 21 Feb 2018 11:21:12 -0500
MIME-Version: 1.0
In-Reply-To: <20180221101527.25554-4-m.szyprowski@samsung.com>
References: <CGME20180221101533eucas1p2c0fdc0b744b1e026906bd047507f5701@eucas1p2.samsung.com>
 <20180221101527.25554-1-m.szyprowski@samsung.com> <20180221101527.25554-4-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Wed, 21 Feb 2018 17:21:09 +0100
Message-ID: <CAJKOXPdHT6M15Kw43ve61DcprT_4-669Ucd9t2icUdOQHuYZdw@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: samsung: exynos542x: Move PD-dependent clocks to
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

Minor nit - the driver you are touching is "clk-exynos5420" so let's
use the same prefix for commit subject (instead of 542x).

With the patch itself I am okay:
Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

On Wed, Feb 21, 2018 at 11:15 AM, Marek Szyprowski
<m.szyprowski@samsung.com> wrote:
> Clocks related to DISP, GSC and MFC blocks require special handling for
> power domain turn on/off sequences. Till now this was handled by Exynos
> power domain driver, but that approach was limited only to some special
> cases. This patch moves handling of those operations to clock controller
> driver. This gives more flexibility and allows fine tune values of some
> clock-specific registers. This patch moves handling of those mentioned
> clocks to Exynos5x sub-CMU driver instantiated from Exynos5420 driver.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/Makefile              |   1 +
>  drivers/clk/samsung/clk-exynos5420.c      | 121 +++++++++++++++++++++++-------
>  drivers/clk/samsung/clk-exynos5x-subcmu.c |   2 +
>  drivers/soc/samsung/pm_domains.c          |   2 +
>  4 files changed, 100 insertions(+), 26 deletions(-)
