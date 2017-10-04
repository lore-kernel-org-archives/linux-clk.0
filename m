Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:46736 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751447AbdJDI3p (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Oct 2017 04:29:45 -0400
Subject: Re: [PATCH 5/7] clk: samsung: Remove support for Exynos4212 SoCs in
 Exynos CLKOUT driver
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <16849ad9-bce9-4a49-9701-737b1c49a77d@samsung.com>
Date: Wed, 04 Oct 2017 10:29:39 +0200
MIME-version: 1.0
In-reply-to: <20171004063828.22068-6-m.szyprowski@samsung.com>
Content-type: text/plain; charset="utf-8"
References: <20171004063828.22068-1-m.szyprowski@samsung.com>
        <CGME20171004063836eucas1p1ab64c174baf2773eb17d1c94cd05ed8c@eucas1p1.samsung.com>
        <20171004063828.22068-6-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10/04/2017 08:38 AM, Marek Szyprowski wrote:
> Support for Exynos4212 SoCs has been removed by commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), so there is no need
> to keep remaining dead code related to this SoC version.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.

