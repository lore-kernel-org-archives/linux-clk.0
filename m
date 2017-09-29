Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.samsung.com ([203.254.224.25]:13086 "EHLO
        mailout2.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750877AbdI2IkK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 29 Sep 2017 04:40:10 -0400
Subject: Re: [PATCH v2 8/9] drivers: clk: samsung: Fix m2m scaler clock on
 Exynos542x
To: Marek Szyprowski <m.szyprowski@samsung.com>,
        Andrzej Pietrasiewicz <andrzej.p@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
        Inki Dae <inki.dae@samsung.com>,
        Seung-Woo Kim <sw0312.kim@samsung.com>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Tobias Jakobi <tjakobi@math.uni-bielefeld.de>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        linux-clk@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <ac97f9ae-73bc-5b10-019b-07be3797322c@samsung.com>
Date: Fri, 29 Sep 2017 10:40:02 +0200
MIME-version: 1.0
In-reply-to: <1506670374-15689-9-git-send-email-m.szyprowski@samsung.com>
Content-type: text/plain; charset="utf-8"
References: <1506670374-15689-1-git-send-email-m.szyprowski@samsung.com>
        <CGME20170929073304eucas1p2825d0ccd64de3b39409b6767660b5543@eucas1p2.samsung.com>
        <1506670374-15689-9-git-send-email-m.szyprowski@samsung.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 09/29/2017 09:32 AM, Marek Szyprowski wrote:
> From: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> 
> TOP "aclk400_mscl" clock should be kept enabled all the time to allow
> proper access to power management control for MSC power domain and
> devices that are a part of it. This change is required for scaler to
> work properly after domain power on/off sequence.
> 
> Fixes: 318fa46cc60d ("clk/samsung: exynos542x: mark some clocks as critical")
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@samsung.com>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Applied, thanks.
