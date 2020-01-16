Return-Path: <SRS0=DYql=3F=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EC2C33CAF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 18:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8B7FE2073A
	for <linux-clk@archiver.kernel.org>; Thu, 16 Jan 2020 18:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389371AbgAPSls (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Jan 2020 13:41:48 -0500
Received: from mga04.intel.com ([192.55.52.120]:58916 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2407184AbgAPSlr (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Jan 2020 13:41:47 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 16 Jan 2020 10:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; 
   d="scan'208";a="305959327"
Received: from yoojae-mobl1.amr.corp.intel.com (HELO [10.7.153.147]) ([10.7.153.147])
  by orsmga001.jf.intel.com with ESMTP; 16 Jan 2020 10:41:42 -0800
Subject: Re: [PATCH 1/2] clk: aspeed: add critical clock setting logic
To:     Paul Menzel <pmenzel@molgen.mpg.de>, Joel Stanley <joel@jms.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Andrew Jeffery <andrew@aj.id.au>
Cc:     openbmc@lists.ozlabs.org, linux-clk@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
References: <20200115212639.4998-1-jae.hyun.yoo@linux.intel.com>
 <20200115212639.4998-2-jae.hyun.yoo@linux.intel.com>
 <3cafc96a-0ec5-d51c-94cc-2b2e41cc5c65@molgen.mpg.de>
From:   Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Message-ID: <0ba94fd3-e57f-82bc-0770-d623c2ce0a3b@linux.intel.com>
Date:   Thu, 16 Jan 2020 10:41:42 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <3cafc96a-0ec5-d51c-94cc-2b2e41cc5c65@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear Paul,

On 1/16/2020 1:57 AM, Paul Menzel wrote:
> Dear Jae,
> 
> 
> On 2020-01-15 22:26, Jae Hyun Yoo wrote:
>> This commit adds critical clock setting logic that applies
>> CLK_IS_CRITICAL flag if it detects 'clock-critical' property in
>> device tree.
> 
> Tested how?

I added in the cover letter how I tested it. For an example, BCLK
can have the flag if I add below setting into one of
'aspeed-bmc-*.dts' files.

&syscon {
	clock-critical = <ASPEED_CLK_GATE_BCLK>;
};

>> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
>> ---
>>   drivers/clk/clk-aspeed.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/clk-aspeed.c b/drivers/clk/clk-aspeed.c
>> index 411ff5fb2c07..d22eeb574ede 100644
>> --- a/drivers/clk/clk-aspeed.c
>> +++ b/drivers/clk/clk-aspeed.c
>> @@ -541,8 +541,11 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>>   
>>   	for (i = 0; i < ARRAY_SIZE(aspeed_gates); i++) {
>>   		const struct aspeed_gate_data *gd = &aspeed_gates[i];
>> +		unsigned long flags = gd->flags;
>>   		u32 gate_flags;
>>   
>> +		of_clk_detect_critical(pdev->dev.of_node, i, &flags);
>> +
> 
> The function description in `drivers/clk/clk.c` has the warning below.
> 
>>   * Do not use this function. It exists only for legacy Device Tree
>>   * bindings, such as the one-clock-per-node style that are outdated.
>>   * Those bindings typically put all clock data into .dts and the Linux
>>   * driver has no clock data, thus making it impossible to set this flag
>>   * correctly from the driver. Only those drivers may call
>>   * of_clk_detect_critical from their setup functions.
> 
> Will this still work?

At least, it still works now and still useful for this case. Actually, I
made this change as an alternative way of
https://www.spinics.net/lists/linux-clk/msg44836.html
because not all Aspeed BMC systems enable BCLK as a critical clock, so
it's for providing more flexible way of critical clock setting for
various hardware configurations.

If the function is deprecated and is going to be removed soon, would it
be acceptable if I add the 'critical-clock' parsing code into this
driver module instead of using the function?

Best Regards,

Jae

>>   		/* Special case: the USB port 1 clock (bit 14) is always
>>   		 * working the opposite way from the other ones.
>>   		 */
>> @@ -550,7 +553,7 @@ static int aspeed_clk_probe(struct platform_device *pdev)
>>   		hw = aspeed_clk_hw_register_gate(dev,
>>   				gd->name,
>>   				gd->parent_name,
>> -				gd->flags,
>> +				flags,
>>   				map,
>>   				gd->clock_idx,
>>   				gd->reset_idx,
> 
> 
> Kind regards,
> 
> Paul
> 
