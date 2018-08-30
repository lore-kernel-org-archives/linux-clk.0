Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:36520 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728789AbeH3RDc (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 Aug 2018 13:03:32 -0400
MIME-Version: 1.0
References: <CGME20180829160024eucas1p1049ff966800cdc44e876d546978df399@eucas1p1.samsung.com>
 <20180829160013.9447-1-m.szyprowski@samsung.com> <20180829160013.9447-2-m.szyprowski@samsung.com>
 <CAJKOXPeHkbYA6hE+YfgdogiH48zXpFrqauhgmGCDYQs=Dt-iyQ@mail.gmail.com>
 <20180830095909eucas1p1be50efaae96040be0663e9997d0d607c~PoR5Ollhd2533325333eucas1p1G@eucas1p1.samsung.com>
 <CAJKOXPeVKwA8xOuW_qEPWjqwrgFogNwD8dcqxz+_Bn6W3AC=8A@mail.gmail.com>
 <20180830103424eucas1p2163c9fd7ec7cf08fccc3ee22ad4ddc74~Powq6EK521806518065eucas1p2R@eucas1p2.samsung.com>
 <CAJKOXPeKEBZ8u9h2=bKtk6GhVVbsV719qGS_5oyy98B+qZQx9g@mail.gmail.com> <20180830111224eucas1p13ce54ae974ddfaada05e265bba926f0b~PpR2FY2zD2568825688eucas1p1D@eucas1p1.samsung.com>
In-Reply-To: <20180830111224eucas1p13ce54ae974ddfaada05e265bba926f0b~PpR2FY2zD2568825688eucas1p1D@eucas1p1.samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Thu, 30 Aug 2018 15:01:16 +0200
Message-ID: <CAJKOXPcu3Appad=GHAtug-sD0DJ+fBibuVMue9w==TJT3M2Uaw@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: samsung: Use NOIRQ stage for Exynos5433 clocks suspend/resume
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?B?QmFydMWCb21pZWogxbtvxYJuaWVya2lld2ljeg==?=
        <b.zolnierkie@samsung.com>, Andrzej Hajda <a.hajda@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Thu, 30 Aug 2018 at 13:12, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
>
>
> On 2018-08-30 12:45, Krzysztof Kozlowski wrote:
> > Ah I missed that point and I see you fixed that case in "mmc:
> > dw_mmc-exynos: fix potential external abort in resume_noirq()". The
> > true reasoning for this patch is that soc clk driver should suspend
> > after every other suspend callback which is using clocks... It would
> > be nice to explain this particular scenario in commit msg.
> >
> > However both dw-mmc and clk will be now in suspend noirq phase so do
> > you have any guarantees that dw-mmc will be suspended after clk?
>
> Frankly speaking this works now, because the devices are populated in
> the order of their presence in device-tree. When the order would be
> reverse, dw-mmc driver will defer probe until clocks are registered.
> This would be enough to ensure proper suspend/resume order, because all
> deferred devices are moved to the end of dpm_list (the list of device
> used for system suspend/resume calls), see deferred_probe_work_func()
> and comments there.

Looks quite fragile... but I understand now that your patch is a
logical solution for existing infrastructure with existing dw-mmc
behavior during suspend.

I wonder whether the device links should be used here (in case of
dw-mmc and clk drivers) and in all clk consumers in general. Something
similar to regulators_get().

Can you extend the commit msg with this clk--dw_mmc scenario?

With that change:
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
