Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A7BAC433B4
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 08:42:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2BA65611AB
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 08:42:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231127AbhDIIm2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 04:42:28 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:32900 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229846AbhDIIm2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Apr 2021 04:42:28 -0400
Received: from 1.general.cking.uk.vpn ([10.172.193.212])
        by youngberry.canonical.com with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <colin.king@canonical.com>)
        id 1lUmiV-0007hC-2B; Fri, 09 Apr 2021 08:42:15 +0000
Subject: Re: [PATCH] clk: uniphier: Fix potential infinite loop
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210407152457.497346-1-colin.king@canonical.com>
 <CAK7LNAT+JTg5QYYbYqCm+m11X7CF_ZWyYRA4eAtqeTEuHRqoyw@mail.gmail.com>
From:   Colin Ian King <colin.king@canonical.com>
Message-ID: <fa2328c5-e082-0bb7-0e87-741a4c698123@canonical.com>
Date:   Fri, 9 Apr 2021 09:42:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT+JTg5QYYbYqCm+m11X7CF_ZWyYRA4eAtqeTEuHRqoyw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/04/2021 07:46, Masahiro Yamada wrote:
> On Thu, Apr 8, 2021 at 12:25 AM Colin King <colin.king@canonical.com> wrote:
>>
>> From: Colin Ian King <colin.king@canonical.com>
>>
>> The for-loop iterates with a u8 loop counter i and compares this
>> with the loop upper limit of num_parents that is an int type.
>> There is a potential infinite loop if num_parents is larger than
>> the u8 loop counter. Fix this by making the loop counter the same
>> type as num_parents.
>>
>> Addresses-Coverity: ("Infinite loop")
>> Fixes: 734d82f4a678 ("clk: uniphier: add core support code for UniPhier clock driver")
>> Signed-off-by: Colin Ian King <colin.king@canonical.com>
>> ---
>>  drivers/clk/uniphier/clk-uniphier-mux.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/uniphier/clk-uniphier-mux.c b/drivers/clk/uniphier/clk-uniphier-mux.c
>> index 462c84321b2d..ce219e0d2a85 100644
>> --- a/drivers/clk/uniphier/clk-uniphier-mux.c
>> +++ b/drivers/clk/uniphier/clk-uniphier-mux.c
>> @@ -34,7 +34,7 @@ static u8 uniphier_clk_mux_get_parent(struct clk_hw *hw)
>>         int num_parents = clk_hw_get_num_parents(hw);
>>         int ret;
>>         unsigned int val;
>> -       u8 i;
>> +       int i;
>>
>>         ret = regmap_read(mux->regmap, mux->reg, &val);
>>         if (ret)
>> --
>> 2.30.2
>>
> 
> clk_hw_get_num_parents() returns 'unsigned int', so
> I think 'num_parents' should also have been 'unsigned int'.
> 
> Maybe, the loop counter 'i' also should be 'unsigned int' then?
> 
> 
Good point. I'll send a V2.
