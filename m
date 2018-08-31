Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:51414 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727272AbeHaKkt (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 31 Aug 2018 06:40:49 -0400
MIME-Version: 1.0
References: <CGME20180829155059eucas1p26a0ea66a0fc96c73cdd60648b82bd23e@eucas1p2.samsung.com>
 <20180829155046.29359-1-m.szyprowski@samsung.com> <20180829155046.29359-3-m.szyprowski@samsung.com>
 <CAJKOXPe9u8c_PLPYmtXJFfdCfVD-rwQsdi-8hbx2Q8mGvTvziw@mail.gmail.com> <20180830112607eucas1p2ed143a1726ec1745b354c37304f5a1b8~Ppd0g3ahg1307413074eucas1p21@eucas1p2.samsung.com>
In-Reply-To: <20180830112607eucas1p2ed143a1726ec1745b354c37304f5a1b8~Ppd0g3ahg1307413074eucas1p21@eucas1p2.samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 31 Aug 2018 08:34:40 +0200
Message-ID: <CAJKOXPcjR27dBZwrJfWmb++7kp2LRM3HC-qyf_Jq1f4K5UpQqA@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: samsung: s3c2410: Use generic helper for
 handling suspend/resume
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

On Thu, 30 Aug 2018 at 13:26, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Hi Krzysztof,
>
> On 2018-08-30 08:39, Krzysztof Kozlowski wrote:
> > On Wed, 29 Aug 2018 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> >> Replace common suspend/resume handling code by generic helper.
> >> No functional change.
> > There is functional change in case alloc fails (kzalloc(),
> > samsung_clk_alloc_reg_dump()). Previously it would be warned and
> > ignored. Now it will panic. You could mention this but anyway the
> > change looks nice! Thanks!
>
> No problem to replace panic() in samsung_clk_sleep_init() with a pair
> of warn and return error as this is probably now a preferred behavior.
> This is still truly hypothetical discussion because system, which
> fails to allocate memory at boot is useless anyway.

I do not mind keeping this as is with small notice in commit msg about
change in case of error path. Indeed it is truly hypothetical case so
there is no point to rewrite samsung_clk_sleep_init for this.

Best regards,
Krzysztof
