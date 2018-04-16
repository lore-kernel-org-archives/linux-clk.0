Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:45330 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751070AbeDPQqn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Apr 2018 12:46:43 -0400
Date: Mon, 16 Apr 2018 18:46:39 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH v3 5/6] soc: samsung: pm_domains: Deprecate support for
 clocks
Message-ID: <20180416164639.d3nn6q6lz3robk7z@kozik-lap>
References: <20180306143312.21035-1-m.szyprowski@samsung.com>
 <CGME20180306143324eucas1p2ec351b007e6c5a1e3a07437ff0aa9e97@eucas1p2.samsung.com>
 <20180306143312.21035-6-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
In-Reply-To: <20180306143312.21035-6-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Mar 06, 2018 at 03:33:11PM +0100, Marek Szyprowski wrote:
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

Hi Marek,

Can I take this and #6 (all dependencies merged?)?

Best regards,
Krzysztof

