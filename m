Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:44237 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750790AbeDQFGk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 17 Apr 2018 01:06:40 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180417050637euoutp028ac684ac231970086699118525fc2117~mIM8fUv7Q2111921119euoutp02H
        for <linux-clk@vger.kernel.org>; Tue, 17 Apr 2018 05:06:37 +0000 (GMT)
Subject: Re: [PATCH v3 5/6] soc: samsung: pm_domains: Deprecate support for
 clocks
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Inki Dae <inki.dae@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Message-ID: <8e197cb7-143f-42a8-5d53-d2e9e7b34e2b@samsung.com>
Date: Tue, 17 Apr 2018 07:06:34 +0200
MIME-Version: 1.0
In-Reply-To: <20180416164639.d3nn6q6lz3robk7z@kozik-lap>
Content-Type: text/plain; charset="utf-8"
References: <20180306143312.21035-1-m.szyprowski@samsung.com>
        <CGME20180306143324eucas1p2ec351b007e6c5a1e3a07437ff0aa9e97@eucas1p2.samsung.com>
        <20180306143312.21035-6-m.szyprowski@samsung.com>
        <20180416164639.d3nn6q6lz3robk7z@kozik-lap>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Krzysztof,

On 2018-04-16 18:46, Krzysztof Kozlowski wrote:
> On Tue, Mar 06, 2018 at 03:33:11PM +0100, Marek Szyprowski wrote:
>> Handling of special clock operations on power domain on/off sequences has
>> been moved to respective Exynos clock controller drivers, so there is no
>> need to keep the duplicated (and conflicting) code in Exynos power domain
>> driver. Mark clock related properties in Exynos power domain bindings as
>> deprecated. This change has no inpact on backwards-compatibility, as the
>> new drivers properly work with old DTBs (deprecated properties are
>> ignored).
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   .../devicetree/bindings/power/pd-samsung.txt       | 20 +----
>>   drivers/soc/samsung/pm_domains.c                   | 90 +---------------------
>>   2 files changed, 5 insertions(+), 105 deletions(-)
> Hi Marek,
>
> Can I take this and #6 (all dependencies merged?)?

Yes, it is safe to apply it now.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

