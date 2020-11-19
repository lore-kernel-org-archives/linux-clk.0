Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05F44C388F9
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 12:02:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C7C72225B
	for <linux-clk@archiver.kernel.org>; Thu, 19 Nov 2020 12:02:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726791AbgKSMB3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 07:01:29 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:4098 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726775AbgKSMB1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 07:01:27 -0500
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.54])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CcJDR0K8RzXnbW;
        Thu, 19 Nov 2020 20:01:11 +0800 (CST)
Received: from [10.140.157.68] (10.140.157.68) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Thu, 19 Nov 2020 20:01:23 +0800
Subject: Re: [PATCH v3] clk: hisilicon: refine hi3620_mmc_clk_init() and fix
 memory leak issues
To:     Markus Elfring <Markus.Elfring@web.de>, <linux-clk@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>
References: <20201112192214.48926-1-gengdongjiu@huawei.com>
 <ef1eac81-c4f9-ca4d-f056-3cdbddcaad73@web.de>
From:   Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <5b976ad4-43e2-a021-6a93-25642b44cec5@huawei.com>
Date:   Thu, 19 Nov 2020 20:01:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <ef1eac81-c4f9-ca4d-f056-3cdbddcaad73@web.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.140.157.68]
X-ClientProxiedBy: dggeme709-chm.china.huawei.com (10.1.199.105) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2020/11/19 17:07, Markus Elfring wrote:
>> Refine hi3620_mmc_clk_init() to use of_clk_add_hw_provider()
>> instead of of_clk_add_provider(), …
> 
> …
>> +++ b/drivers/clk/hisilicon/clk-hi3620.c
> …
>> @@ -439,17 +440,22 @@  static struct clk *hisi_register_clk_mmc(struct hisi_mmc_clock *mmc_clk,
> …
>> +	err = clk_hw_register(NULL, hw);
>> +
>> +	if (err) {
> 
> I suggest to omit a blank line here.
> 
> 
> …
>> +++ b/drivers/clk/hisilicon/clk.c
>> @@ -65,25 +65,26 @@  struct hisi_clock_data *hisi_clk_init(struct device_node *np,
> …
>>  	of_clk_add_provider(np, of_clk_src_onecell_get, &clk_data->clk_data);
>>  	return clk_data;
>> -err_data:
>> +free_clk_data:
> 
> How do you think about to adjust also such a function call for this function implementation?
> 
> Will further collateral evolution become interesting?
> https://elixir.bootlin.com/linux/v5.10-rc4/C/ident/of_clk_add_provider
Thanks for the review.

How about we adjust such a function call in another series patches?  I suggest do it in another series.
For this patch, how about we firstly merge it after I fix the above comments(omit a blank line)?

> 
> Regards,
> Markus
> .
> 
