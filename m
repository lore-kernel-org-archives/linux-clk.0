Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29003C4708E
	for <linux-clk@archiver.kernel.org>; Sat, 29 May 2021 09:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03E8F61107
	for <linux-clk@archiver.kernel.org>; Sat, 29 May 2021 09:06:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbhE2JIP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 29 May 2021 05:08:15 -0400
Received: from szxga02-in.huawei.com ([45.249.212.188]:2462 "EHLO
        szxga02-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229559AbhE2JIP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 29 May 2021 05:08:15 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4FsbFV6r19z67c2;
        Sat, 29 May 2021 17:03:42 +0800 (CST)
Received: from dggema762-chm.china.huawei.com (10.1.198.204) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Sat, 29 May 2021 17:06:33 +0800
Received: from [10.174.179.129] (10.174.179.129) by
 dggema762-chm.china.huawei.com (10.1.198.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Sat, 29 May 2021 17:06:32 +0800
Subject: Re: [PATCH] clk: socfpga: remove set but not used variable 'rc'
To:     Dinh Nguyen <dinguyen@kernel.org>, <mturquette@baylibre.com>,
        <sboyd@kernel.org>, <s.trumtrar@pengutronix.de>
CC:     <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <yi.zhang@huawei.com>
References: <20210514062234.3534615-1-yukuai3@huawei.com>
 <786d67c5-1470-098b-79cd-801b06a72bf3@kernel.org>
From:   "yukuai (C)" <yukuai3@huawei.com>
Message-ID: <f6f902a0-575e-f73d-adcc-9f60c37bd22e@huawei.com>
Date:   Sat, 29 May 2021 17:06:32 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <786d67c5-1470-098b-79cd-801b06a72bf3@kernel.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.129]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema762-chm.china.huawei.com (10.1.198.204)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

ping ...

On 2021/05/14 23:11, Dinh Nguyen wrote:
> 
> 
> On 5/14/21 1:22 AM, Yu Kuai wrote:
>> Fixes gcc '-Wunused-but-set-variable' warning:
>>
>> drivers/clk/socfpga/clk-pll.c:83:6: warning: variable ‘rc’ set but
>> not used [-Wunused-but-set-variable]
>>
>> The returned value of of_clk_add_provider() is never used, and so
>> can be removed.
>>
>> Fixes: 97259e99bdc9 ("clk: socfpga: split clk code")
>> Signed-off-by: Yu Kuai <yukuai3@huawei.com>
>> ---
>>   drivers/clk/socfpga/clk-pll.c | 3 +--
>>   1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/socfpga/clk-pll.c 
>> b/drivers/clk/socfpga/clk-pll.c
>> index dcb573d44034..127cc849c5ee 100644
>> --- a/drivers/clk/socfpga/clk-pll.c
>> +++ b/drivers/clk/socfpga/clk-pll.c
>> @@ -80,7 +80,6 @@ static __init struct clk_hw 
>> *__socfpga_pll_init(struct device_node *node,
>>       const char *parent_name[SOCFPGA_MAX_PARENTS];
>>       struct clk_init_data init;
>>       struct device_node *clkmgr_np;
>> -    int rc;
>>       int err;
>>       of_property_read_u32(node, "reg", &reg);
>> @@ -114,7 +113,7 @@ static __init struct clk_hw 
>> *__socfpga_pll_init(struct device_node *node,
>>           kfree(pll_clk);
>>           return ERR_PTR(err);
>>       }
>> -    rc = of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
>> +    of_clk_add_provider(node, of_clk_src_simple_get, hw_clk);
>>       return hw_clk;
>>   }
>>
> 
> Acked-by: Dinh Nguyen <dinguyen@kernel.org>
> .
> 
