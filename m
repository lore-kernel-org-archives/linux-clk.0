Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:32855 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751516AbdJMWDh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Oct 2017 18:03:37 -0400
Date: Fri, 13 Oct 2017 17:03:36 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v3 2/5] clk: samsung: Add dt bindings for Exynos4412 ISP
 clock controller
Message-ID: <20171013220336.vsnvodjffg4xxkbo@rob-hp-laptop>
References: <20171011092515.1698-1-m.szyprowski@samsung.com>
 <CGME20171011092521eucas1p12fa702013b7bdbb4f9250e9da3fda8a1@eucas1p1.samsung.com>
 <20171011092515.1698-3-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <20171011092515.1698-3-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Oct 11, 2017 at 11:25:12AM +0200, Marek Szyprowski wrote:
> Some registers for the Exynos 4412 ISP (Camera subsystem) clocks are
> located in the ISP power domain. Because those registers are also
> located in a different memory region than the main clock controller,
> support for them can be provided by a separate clock controller.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  .../devicetree/bindings/clock/exynos4-clock.txt    | 43 ++++++++++++++++++++++
>  include/dt-bindings/clock/exynos4.h                | 35 ++++++++++++++++++
>  2 files changed, 78 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>
