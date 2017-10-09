Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:50419 "EHLO
        mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751581AbdJIKjs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2017 06:39:48 -0400
Subject: Re: [PATCH v2] clk: samsung: Add a separate driver for Exynos4412
 ISP clocks
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <53f6ec57-61b5-d47d-a8b7-791eabe6eac6@samsung.com>
Date: Mon, 09 Oct 2017 12:39:42 +0200
MIME-version: 1.0
In-reply-to: <20171003061644.2597-1-m.szyprowski@samsung.com>
Content-type: text/plain; charset="utf-8"
References: <20171002180007.asan73h53nfot6nr@kozik-lap>
        <CGME20171003061657eucas1p27badb05b29f1130e598aeb2fa2aef92f@eucas1p2.samsung.com>
        <20171003061644.2597-1-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 10/03/2017 08:16 AM, Marek Szyprowski wrote:
> Some registers for the Exynos 4412 ISP (Camera subsystem) clocks are
> partially located in the SOC area, which belongs to ISP power domain.
> Because those registers are also located in a different memory region
> than the main clock controller, support for them can be provided by
> a separate clock controller. This in turn allows to almost seamlessly
> make it aware of the power domain using recently introduced runtime
> PM support for clocks.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Patch applied, thanks.
