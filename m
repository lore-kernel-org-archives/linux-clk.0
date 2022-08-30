Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056CDECAAD1
	for <linux-clk@archiver.kernel.org>; Tue, 30 Aug 2022 06:33:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230254AbiH3Gdn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 30 Aug 2022 02:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbiH3Gde (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 30 Aug 2022 02:33:34 -0400
Received: from mail-sh.amlogic.com (mail-sh.amlogic.com [58.32.228.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E83DBA153
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 23:33:33 -0700 (PDT)
Received: from [10.18.29.47] (10.18.29.47) by mail-sh.amlogic.com (10.18.11.5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.9; Tue, 30 Aug
 2022 14:33:30 +0800
Message-ID: <09befaaf-b34a-aeda-5dd6-6bfae4b01163@amlogic.com>
Date:   Tue, 30 Aug 2022 14:33:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH RESEND] clk: meson: pll: copy retry workaround from vendor
 driver
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>
CC:     "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
References: <cc80cda0-4dda-2e3e-3fc8-afa97717479b@gmail.com>
 <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
From:   Yu Tu <yu.tu@amlogic.com>
In-Reply-To: <1jk06rtlrv.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.29.47]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2022/8/29 17:54, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> 
> On Sun 14 Aug 2022 at 23:25, Heiner Kallweit <hkallweit1@gmail.com> wrote:
> 
>> On a S905X4-based system this call fails randomly.
>> The vendor driver has a retry mechanism and on my system
>> the second attempt is successful always.
>>
> 
> This reason looks a bit weak to me.
> I'd like AML team to comment on this PLL problem as I suspect it might
> relate to other PLL we have been seeing

First of all, we've had this problem before. But the probability is very 
low, most of the PLL will not lock when the chip is tested at high and 
low temperature.

Our actual code has retry mechanism to solve the above problem.

> 
>> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
>> ---
>>   drivers/clk/meson/clk-pll.c | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
>> index 9e55617bc..daa025b6d 100644
>> --- a/drivers/clk/meson/clk-pll.c
>> +++ b/drivers/clk/meson/clk-pll.c
>> @@ -320,12 +320,16 @@ static int meson_clk_pll_is_enabled(struct clk_hw *hw)
>>   
>>   static int meson_clk_pcie_pll_enable(struct clk_hw *hw)
>>   {
>> -	meson_clk_pll_init(hw);
>> +	int retries = 10;
>>   
>> -	if (meson_clk_pll_wait_lock(hw))
>> -		return -EIO;
>> +	do {
>> +		meson_clk_pll_init(hw);
>> +		if (!meson_clk_pll_wait_lock(hw))
>> +			return 0;
>> +		pr_info("Retry enabling PCIe PLL clock\n");
>> +	} while (--retries);
>>   
>> -	return 0;
>> +	return -EIO;
>>   }
>>   
>>   static int meson_clk_pll_enable(struct clk_hw *hw)
> 
> .
