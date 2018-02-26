Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751094AbeBZPaF (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 26 Feb 2018 10:30:05 -0500
MIME-Version: 1.0
In-Reply-To: <20180226125355.9052-6-m.szyprowski@samsung.com>
References: <CGME20180226125403eucas1p27d32d02417f3cda5b809e62bf894bef8@eucas1p2.samsung.com>
 <20180226125355.9052-1-m.szyprowski@samsung.com> <20180226125355.9052-6-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 26 Feb 2018 16:15:29 +0100
Message-ID: <CAJKOXPcMndkWP4ZGp95pEibEcm8vZDZkai9Xjrhb+VT=AtuLmQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] soc: samsung: pm_domains: Deprecate support for clocks
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
> Handling of special clock operations on power domain on/off sequences has
> been moved to respective Exynos clock controller drivers, so there is no
> need to keep the duplicated (and conflicting) code in Exynos power domain
> driver. Mark clock related properties in Exynos power domain bindings as
> deprecated. This change has no inpact on backwards-compatibility, as the
> new drivers properly work with old DTBs (deprecated properties are
> ignored).
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../devicetree/bindings/power/pd-samsung.txt       | 20 +----
>  drivers/soc/samsung/pm_domains.c                   | 90 +---------------------
>  2 files changed, 5 insertions(+), 105 deletions(-)

Looks okay, as you mentioned in cover letter, I'll take this and 6/6
for the release coming after successful merge of 1-4.

Best regards,
Krzysztof
