Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:37067 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727451AbeH3P1t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Aug 2018 11:27:49 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20180830112608euoutp016e7da4a8164cbe68482f545df053b34e~Ppd2Jr9pv0730107301euoutp01a
        for <linux-clk@vger.kernel.org>; Thu, 30 Aug 2018 11:26:08 +0000 (GMT)
Subject: Re: [PATCH 02/10] clk: samsung: s3c2410: Use generic helper for
 handling suspend/resume
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?=
        <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 30 Aug 2018 13:26:06 +0200
MIME-Version: 1.0
In-Reply-To: <CAJKOXPe9u8c_PLPYmtXJFfdCfVD-rwQsdi-8hbx2Q8mGvTvziw@mail.gmail.com>
Message-Id: <20180830112607eucas1p2ed143a1726ec1745b354c37304f5a1b8~Ppd0g3ahg1307413074eucas1p21@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20180829155059eucas1p26a0ea66a0fc96c73cdd60648b82bd23e@eucas1p2.samsung.com>
        <20180829155046.29359-1-m.szyprowski@samsung.com>
        <20180829155046.29359-3-m.szyprowski@samsung.com>
        <CAJKOXPe9u8c_PLPYmtXJFfdCfVD-rwQsdi-8hbx2Q8mGvTvziw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Krzysztof,

On 2018-08-30 08:39, Krzysztof Kozlowski wrote:
> On Wed, 29 Aug 2018 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Replace common suspend/resume handling code by generic helper.
>> No functional change.
> There is functional change in case alloc fails (kzalloc(),
> samsung_clk_alloc_reg_dump()). Previously it would be warned and
> ignored. Now it will panic. You could mention this but anyway the
> change looks nice! Thanks!

No problem to replace panic() in samsung_clk_sleep_init() with a pair
of warn and return error as this is probably now a preferred behavior.
This is still truly hypothetical discussion because system, which
fails to allocate memory at boot is useless anyway.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
