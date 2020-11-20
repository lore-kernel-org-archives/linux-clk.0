Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 702D3C63697
	for <linux-clk@archiver.kernel.org>; Fri, 20 Nov 2020 03:08:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 29F772145D
	for <linux-clk@archiver.kernel.org>; Fri, 20 Nov 2020 03:08:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726281AbgKTDIf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Nov 2020 22:08:35 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2070 "EHLO
        szxga01-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgKTDIf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Nov 2020 22:08:35 -0500
Received: from dggeme755-chm.china.huawei.com (unknown [172.30.72.56])
        by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4CchLr07SgzVqM7;
        Fri, 20 Nov 2020 11:08:04 +0800 (CST)
Received: from [10.140.157.68] (10.140.157.68) by
 dggeme755-chm.china.huawei.com (10.3.19.101) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.1913.5; Fri, 20 Nov 2020 11:08:32 +0800
Subject: Re: [v3] clk: hisilicon: refine hi3620_mmc_clk_init() and fix memory
 leak issues
To:     Markus Elfring <Markus.Elfring@web.de>, <linux-clk@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Julia Lawall <julia.lawall@lip6.fr>
References: <20201112192214.48926-1-gengdongjiu@huawei.com>
 <ef1eac81-c4f9-ca4d-f056-3cdbddcaad73@web.de>
 <5b976ad4-43e2-a021-6a93-25642b44cec5@huawei.com>
 <393a7eca-e6a0-ddf8-e0aa-ca9121acf4f3@web.de>
From:   Dongjiu Geng <gengdongjiu@huawei.com>
Message-ID: <ad55207f-5898-c967-fe98-29ea6e9ace0a@huawei.com>
Date:   Fri, 20 Nov 2020 11:08:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <393a7eca-e6a0-ddf8-e0aa-ca9121acf4f3@web.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.140.157.68]
X-ClientProxiedBy: dggeme703-chm.china.huawei.com (10.1.199.99) To
 dggeme755-chm.china.huawei.com (10.3.19.101)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2020/11/19 22:40, Markus Elfring wrote:
>> How about we adjust such a function call in another series patches?
> 
> You can try to offer desirable changes also in a corresponding patch series as usual.

sure, ok

> 
> Regards,
> Markus
> .
> 
