Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:52208 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727334AbeHaKmd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 31 Aug 2018 06:42:33 -0400
MIME-Version: 1.0
References: <CGME20180829155101eucas1p2f6ecb6ad0eb37fa725ac950cad73c423@eucas1p2.samsung.com>
 <20180829155046.29359-1-m.szyprowski@samsung.com> <20180829155046.29359-7-m.szyprowski@samsung.com>
In-Reply-To: <20180829155046.29359-7-m.szyprowski@samsung.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Fri, 31 Aug 2018 08:36:24 +0200
Message-ID: <CAJKOXPeR3GRg6p6QhHqX5xqW2K+wmLEqGqnp-nNamQQ-eytVFQ@mail.gmail.com>
Subject: Re: [PATCH 06/10] clk: samsung: s5pv210: Use generic helper for
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

On Wed, 29 Aug 2018 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>
> Replace common suspend/resume handling code by generic helper.
> No functional change.
>
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/clk/samsung/clk-s5pv210.c | 41 ++-----------------------------
>  1 file changed, 2 insertions(+), 39 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof
