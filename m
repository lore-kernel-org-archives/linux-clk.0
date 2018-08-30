Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51652 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728138AbeH3O1U (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Aug 2018 10:27:20 -0400
MIME-Version: 1.0
References: <CGME20180829160024eucas1p1049ff966800cdc44e876d546978df399@eucas1p1.samsung.com>
 <20180829160013.9447-1-m.szyprowski@samsung.com> <20180829160013.9447-2-m.szyprowski@samsung.com>
 <CAJKOXPeHkbYA6hE+YfgdogiH48zXpFrqauhgmGCDYQs=Dt-iyQ@mail.gmail.com> <20180830095909eucas1p1be50efaae96040be0663e9997d0d607c~PoR5Ollhd2533325333eucas1p1G@eucas1p1.samsung.com>
In-Reply-To: <20180830095909eucas1p1be50efaae96040be0663e9997d0d607c~PoR5Ollhd2533325333eucas1p1G@eucas1p1.samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 30 Aug 2018 12:25:40 +0200
Message-ID: <CAJKOXPeVKwA8xOuW_qEPWjqwrgFogNwD8dcqxz+_Bn6W3AC=8A@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: samsung: Use NOIRQ stage for Exynos5433 clocks suspend/resume
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
        <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, 30 Aug 2018 at 11:59, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Krzysztof,
>
> On 2018-08-30 08:29, Krzysztof Kozlowski wrote:
> > On Wed, 29 Aug 2018 at 18:00, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> Clocks should be suspended as late as possible and resumed as early as
> >> possible to let other drivers do their own suspend/resume tasks. NOIRQ
> >> callbacks better suit this requirement.
> > I think that's not a good reason to use the noirq versions. These are
> > to solve the races with interrupt handlers, not to manually order
> > callbacks.
>
> Then please tell me which other solution should I use to make clock
> available
> on Exynos5433 during NOIRQ suspend/resume phase. dw-mmc driver requires to
> access its clocks in NOIRQ resume.

Indeed I found the usage of noirq in the dw-mmc driver which made me
wondering why it is there... and if you look at explanation, the noirq
is only for the purpose of clearing wakeup interrupt in CLKSEL
register.

Further code refactoring moved more and more code to suspend_noirq,
including the runtime PM part. This probably should not be part of
suspend_noirq but regular suspend. Then all the need of manual
ordering would go away. So the answer to your question - try fixing
buggy dw-mmc driver. :)

Best regards,
Krzysztof
