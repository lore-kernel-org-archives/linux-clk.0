Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:54168 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753346AbeBVKyb (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 22 Feb 2018 05:54:31 -0500
MIME-Version: 1.0
In-Reply-To: <20180221101527.25554-2-m.szyprowski@samsung.com>
References: <CGME20180221101533eucas1p234b1801844ce8fac633377d129323422@eucas1p2.samsung.com>
 <20180221101527.25554-1-m.szyprowski@samsung.com> <20180221101527.25554-2-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 22 Feb 2018 11:54:28 +0100
Message-ID: <CAJKOXPftSvug8J_zMO0mmGWpFLHgpb4no4q2t=tW6Qva0fd0qg@mail.gmail.com>
Subject: Re: [PATCH 1/6] soc: samsung: pm_domains: Add blacklisting clock handling
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
> Handling of clock reparenting will be move to clock controller driver, so
> add possibility to blacklist clock handling on systems, where the clock
> controller already does all needed operations. This is needed to avoid
> potential deadlock on clock reparenting during power domain on/off
> procedure.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/soc/samsung/pm_domains.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Feel free to take it through samsung-clk tree. Just in case of
possible conflicts - could you put it on separate branch please?

Best regards,
Krzysztof
