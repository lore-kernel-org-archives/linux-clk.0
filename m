Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout2.w1.samsung.com ([210.118.77.12]:38616 "EHLO
        mailout2.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729247AbeIFSBE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 6 Sep 2018 14:01:04 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
        by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20180906132532euoutp02efe9d7566a8e325af0409ef3fbea9e34~R0nFfsEy71895718957euoutp02s
        for <linux-clk@vger.kernel.org>; Thu,  6 Sep 2018 13:25:32 +0000 (GMT)
Subject: Re: [PATCH 08/10] clk: samsung: Add support for setting registers
 state before suspend
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-clk@vger.kernel.org,
        "linux-samsung-soc@vger.kernel.org"
        <linux-samsung-soc@vger.kernel.org>,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        =?UTF-8?Q?Bart=c5=82omiej_=c5=bbo=c5=82nierkiewicz?=
        <b.zolnierkie@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
Date: Thu, 6 Sep 2018 15:25:29 +0200
MIME-Version: 1.0
In-Reply-To: <CAJKOXPd=34gskzntUUpnKrZBVPN0pMXnC-0g7Q=YECJWPuDwmw@mail.gmail.com>
Message-Id: <20180906132530eucas1p1aa247751e59e06039f07d7802881e728~R0nEDIXJ90352303523eucas1p1k@eucas1p1.samsung.com>
Content-Type: text/plain; charset="utf-8"
References: <CGME20180829155102eucas1p1ca7a26c10847dcb585f01b54657e29cb@eucas1p1.samsung.com>
        <20180829155046.29359-1-m.szyprowski@samsung.com>
        <20180829155046.29359-9-m.szyprowski@samsung.com>
        <CAJKOXPd=34gskzntUUpnKrZBVPN0pMXnC-0g7Q=YECJWPuDwmw@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi Krzysztof,

On 2018-08-31 16:59, Krzysztof Kozlowski wrote:
> On Wed, 29 Aug 2018 at 17:51, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>> Some registers of clock controller have to be set to certain values before
>> entering system suspend state. Till now drivers did that on their own,
>> but it will be easier to handle it by generic code and let drivers simply
>> to provide the list of registers and their state.
>>
>> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
>> ---
>>   drivers/clk/samsung/clk.c | 23 +++++++++++++----------
>>   drivers/clk/samsung/clk.h | 18 ++++++++++++++++--
>>   2 files changed, 29 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
>> index 8634884aa11c..ab467a7f973a 100644
>> --- a/drivers/clk/samsung/clk.c
>> +++ b/drivers/clk/samsung/clk.c
>> @@ -290,9 +290,12 @@ static int samsung_clk_suspend(void)
>>   {
>>          struct samsung_clock_reg_cache *reg_cache;
>>
>> -       list_for_each_entry(reg_cache, &clock_reg_cache_list, node)
>> +       list_for_each_entry(reg_cache, &clock_reg_cache_list, node) {
>>                  samsung_clk_save(reg_cache->reg_base, reg_cache->rdump,
>>                                  reg_cache->rd_num);
>> +               samsung_clk_restore(reg_cache->reg_base, reg_cache->rsuspend,
>> +                               reg_cache->rsuspend_num);
>> +       }
>>          return 0;
>>   }
>>
>> @@ -310,9 +313,11 @@ static struct syscore_ops samsung_clk_syscore_ops = {
>>          .resume = samsung_clk_resume,
>>   };
>>
>> -void samsung_clk_sleep_init(void __iomem *reg_base,
>> +void samsung_clk_sleep_init2(void __iomem *reg_base,
> Like Chanwoo, I also do not like the init2. Quite frankly, I do not
> see what problem you want to solve it by adding "2" suffix - not
> touching Exynos5433 code?

I didn't want to change Exynos5433 and clock drivers cleaned in patches
2-7, as I see no point adding "NULL, 0" parameters there.

> In such case more meaningful prefix would be
> better. But I think this should be avoided especially that in patch
> 9/10 you use both of them.

Okay, so it is just a matter of name. What about
samsung_clk_extended_sleep_init() ?

I don't want to add another temporary structure just to pass some
arguments to that function...

> Separate topic - It is getting confusing. The existing Exynos5433 code
> has support for suspend_regs (used in its device-level runtime PM) and
> here you are extending generic code on syscore level. Maybe this could
> be unified somehow?

Well, you can consider this patch as a first step of unification.
Implementing device based suspend/resume for OF_CLK_DECLARE() based
drivers is quite complicated now (mainly because that initialization
is done much before platform bus and dt-based devices are registered),
but I hope one day this can be also unified.

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland
