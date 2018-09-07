Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:54480 "EHLO
        mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726017AbeIGLHo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Sep 2018 07:07:44 -0400
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
        by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20180907062758euoutp01aa46aa02af07f7d9af1492558116995a~SCjy4g2V21587915879euoutp01P
        for <linux-clk@vger.kernel.org>; Fri,  7 Sep 2018 06:27:58 +0000 (GMT)
Subject: Re: [PATCH 09/10] clk: samsung: exynos4: Use generic helper for
 handling suspend/resume
To: Sylwester Nawrocki <sylwester.nawrocki@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Fri, 7 Sep 2018 08:27:55 +0200
MIME-Version: 1.0
In-Reply-To: <5140d376-b5dc-0021-6a78-782ffbfe0a7f@gmail.com>
Message-Id: <20180907062757eucas1p2fe3bcedc9fedba50df4893b1fce843a2~SCjxW6NGB1351613516eucas1p2c@eucas1p2.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <20180829155046.29359-1-m.szyprowski@samsung.com>
        <CGME20180829155102eucas1p2a4b1c554623ff97a23f85f26a6b537e2@eucas1p2.samsung.com>
        <20180829155046.29359-10-m.szyprowski@samsung.com>
        <5140d376-b5dc-0021-6a78-782ffbfe0a7f@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Sylwester,

On 2018-09-06 21:49, Sylwester Nawrocki wrote:
> On 08/29/2018 05:50 PM, Marek Szyprowski wrote:
>> Replace common suspend/resume handling code by generic helper.
>> Handling of PLLs is a bit different in generic code, as they are handled
>> in the same way as other clock registers. Such approach was already used
>> on later Exynos SoCs and worked fine. Tests have shown that it works also
>> on Exynos4 SoCs and significantly simplifies the code.
> I was going to ask whether it is safe to drop that PLL state polling code after
> looking at the diff but then I found it all explained in the commit message.
> Thank you for this clean up series, I have applied it to the samsung-clk tree.
> Thanks Chanwoo and Krzysztof for review and testing.

One more note which was lost in v2. I've tested this patch with system
suspend/resume on following Exynos4 boards: Trats (4210), Origen (4210),
OdroidU3 (4412) and Trats2 (4412). In all cases it worked fine.

>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>    drivers/clk/samsung/clk-exynos4.c | 147 ++++--------------------------
>>    1 file changed, 16 insertions(+), 131 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos4.c b/drivers/clk/samsung/clk-exynos4.c
>> index 0421960eb963..d3bd9ffd8a09 100644
>> --- a/drivers/clk/samsung/clk-exynos4.c
>> +++ b/drivers/clk/samsung/clk-exynos4.c
>> @@ -16,7 +16,6 @@
>> -static void exynos4_clk_enable_pll(u32 reg)
>> -{
>> -	u32 pll_con = readl(reg_base + reg);
>> -	pll_con |= PLL_ENABLED;
>> -	writel(pll_con, reg_base + reg);
>> -
>> -	while (!(pll_con & PLL_LOCKED)) {
>> -		cpu_relax();
>> -		pll_con = readl(reg_base + reg);
>> -	}
>> -}
>> -
>> -static void exynos4_clk_wait_for_pll(u32 reg)
>> -{
>> -	u32 pll_con;
>> -
>> -	pll_con = readl(reg_base + reg);
>> -	if (!(pll_con & PLL_ENABLED))
>> -		return;
>> -
>> -	while (!(pll_con & PLL_LOCKED)) {
>> -		cpu_relax();
>> -		pll_con = readl(reg_base + reg);
>> -	}
>> -}
>> -
>> -static int exynos4_clk_suspend(void)
>> -{
>> -	exynos4_clk_enable_pll(EPLL_CON0);
>> -	exynos4_clk_enable_pll(VPLL_CON0);
>> -	return 0;
>> -}
> --
> Regards,
> Sylwester
>
>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
