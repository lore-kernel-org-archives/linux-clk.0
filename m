Return-Path: <SRS0=/AGb=T6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6539EC28CC0
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 12:27:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3ACC9258D2
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 12:27:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726687AbfE3M1f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 May 2019 08:27:35 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:18054 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725961AbfE3M1e (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 30 May 2019 08:27:34 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id E5931AD4E0FB6A5B3EBE;
        Thu, 30 May 2019 20:27:32 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.180) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Thu, 30 May 2019
 20:27:29 +0800
Subject: Re: [PATCH] clk: samsung: exynos5433: Use of_clk_get_parent_count()
To:     Sylwester Nawrocki <s.nawrocki@samsung.com>
CC:     Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        <linux-samsung-soc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
References: <CGME20190525114732epcas3p1fdc42650975c9f7b1a39a87561e65a29@epcas3p1.samsung.com>
 <20190525115542.107929-1-wangkefeng.wang@huawei.com>
 <b57d66da-9b18-7b1d-ffa6-3b4600f9dc5a@samsung.com>
From:   Kefeng Wang <wangkefeng.wang@huawei.com>
Message-ID: <3673777a-60dc-3eec-ccb8-9ffa1a3e5cf4@huawei.com>
Date:   Thu, 30 May 2019 20:24:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <b57d66da-9b18-7b1d-ffa6-3b4600f9dc5a@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Originating-IP: [10.177.19.180]
X-CFilter-Loop: Reflected
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On 2019/5/30 19:13, Sylwester Nawrocki wrote:
> On 5/25/19 13:55, Kefeng Wang wrote:
>> Use of_clk_get_parent_count() instead of open coding.
>>
>> Signed-off-by: Kefeng Wang <wangkefeng.wang@huawei.com>
> Patch applied, thank you.
>
> In future please make sure to also Cc linux-clk@vger.kernel.org mailing list 
> and the clk maintainers (Stephen, Michael) when sending clk patches.

OK, thanks for the tip.

>
>> ---
>>  drivers/clk/samsung/clk-exynos5433.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/samsung/clk-exynos5433.c b/drivers/clk/samsung/clk-exynos5433.c
>> index dae1c96de933..14e253915ca4 100644
>> --- a/drivers/clk/samsung/clk-exynos5433.c
>> +++ b/drivers/clk/samsung/clk-exynos5433.c
>> @@ -5590,8 +5590,8 @@ static int __init exynos5433_cmu_probe(struct platform_device *pdev)
>>  	data->nr_clk_save = info->nr_clk_regs;
>>  	data->clk_suspend = info->suspend_regs;
>>  	data->nr_clk_suspend = info->nr_suspend_regs;
>> -	data->nr_pclks = of_count_phandle_with_args(dev->of_node, "clocks",
>> -						    "#clock-cells");
>> +	data->nr_pclks = of_clk_get_parent_count(dev->of_node);
>> +
>>  	if (data->nr_pclks > 0) {
>>  		data->pclks = devm_kcalloc(dev, sizeof(struct clk *),
>>  					   data->nr_pclks, GFP_KERNEL);
>>

