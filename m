Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:35000 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728223AbeH3OAc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Aug 2018 10:00:32 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20180830095910euoutp01ab37d72955a062608ccf2f96ca14e0d7~PoR6gEkk82552125521euoutp01-
        for <linux-clk@vger.kernel.org>; Thu, 30 Aug 2018 09:59:10 +0000 (GMT)
Subject: Re: [PATCH 1/2] clk: samsung: Use NOIRQ stage for Exynos5433 clocks
 suspend/resume
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?=
        <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 30 Aug 2018 11:59:08 +0200
MIME-Version: 1.0
In-Reply-To: <CAJKOXPeHkbYA6hE+YfgdogiH48zXpFrqauhgmGCDYQs=Dt-iyQ@mail.gmail.com>
Message-Id: <20180830095909eucas1p1be50efaae96040be0663e9997d0d607c~PoR5Ollhd2533325333eucas1p1G@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20180829160024eucas1p1049ff966800cdc44e876d546978df399@eucas1p1.samsung.com>
        <20180829160013.9447-1-m.szyprowski@samsung.com>
        <20180829160013.9447-2-m.szyprowski@samsung.com>
        <CAJKOXPeHkbYA6hE+YfgdogiH48zXpFrqauhgmGCDYQs=Dt-iyQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Krzysztof,

On 2018-08-30 08:29, Krzysztof Kozlowski wrote:
> On Wed, 29 Aug 2018 at 18:00, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Clocks should be suspended as late as possible and resumed as early as
>> possible to let other drivers do their own suspend/resume tasks. NOIRQ
>> callbacks better suit this requirement.
> I think that's not a good reason to use the noirq versions. These are
> to solve the races with interrupt handlers, not to manually order
> callbacks.

Then please tell me which other solution should I use to make clock 
available
on Exynos5433 during NOIRQ suspend/resume phase. dw-mmc driver requires to
access its clocks in NOIRQ resume.

 > ...

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
