Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 804A3C4321E
	for <linux-clk@archiver.kernel.org>; Wed, 23 Nov 2022 09:21:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237514AbiKWJVp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 23 Nov 2022 04:21:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237513AbiKWJVJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 23 Nov 2022 04:21:09 -0500
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63DF2107E43;
        Wed, 23 Nov 2022 01:21:07 -0800 (PST)
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
        by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4NHFwL6JCWz15MqQ;
        Wed, 23 Nov 2022 17:20:34 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 23 Nov 2022 17:21:05 +0800
Subject: Re: [PATCH] clk: rockchip: Fix memory leak in
 rockchip_clk_register_pll()
To:     Heiko Stuebner <heiko@sntech.de>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <mturquette@linaro.org>
CC:     <linux-clk@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20221123032237.64567-1-xiujianfeng@huawei.com>
 <6301679.31r3eYUQgx@phil>
From:   xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <648ff5d2-9a52-3a73-46b8-a903315202d9@huawei.com>
Date:   Wed, 23 Nov 2022 17:21:05 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <6301679.31r3eYUQgx@phil>
Content-Type: text/plain; charset="gbk"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

ÔÚ 2022/11/23 17:01, Heiko Stuebner Ð´µÀ:
> Hi,
> 
> Am Mittwoch, 23. November 2022, 04:22:37 CET schrieb Xiu Jianfeng:
>> If clk_register() fails, @pll->rate_table may have allocated memory by
>> kmemdup(), so it needs to be freed, otherwise will cause memory leak
>> issue, this patch fixes it.
>>
>> Fixes: 90c590254051 ("clk: rockchip: add clock type for pll clocks and pll used on rk3066")
>> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
>> ---
>>   drivers/clk/rockchip/clk-pll.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/rockchip/clk-pll.c b/drivers/clk/rockchip/clk-pll.c
>> index 4b9840994295..dc4ce280d125 100644
>> --- a/drivers/clk/rockchip/clk-pll.c
>> +++ b/drivers/clk/rockchip/clk-pll.c
>> @@ -1200,6 +1200,7 @@ struct clk *rockchip_clk_register_pll(struct rockchip_clk_provider *ctx,
>>   	clk_unregister(mux_clk);
>>   	mux_clk = pll_clk;
>>   err_mux:
>> +	kfree(pll->rate_table);
> 
> I think this free needs to go up to the err_pll block.
> 
> In the code it is
> - clk_register(pll_mux->hw)   -> err_mux
> - kmemdup
> - clk_register(pll->hw)	-> err_pll
> 
> so the kfree for the rate-table should probably
> be at
> 	err_pll:
> 		kfree(rate_table)

Thanks for you review, I think here should be kfree(pll->rate_table) 
instead of kfree(rate_table), because @rate_table is the intput param 
while pll->rate_table is the new allocated memory.

v2 already sent.

> 		clk_unregister(mux_clk);
> 		...
> 
> 
> Heiko
> 
>>   	kfree(pll);
>>   	return mux_clk;
>>   }
>>
> 
> 
> 
> 
> 
> .
> 
