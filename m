Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mailout1.w1.samsung.com ([210.118.77.11]:55799 "EHLO
	mailout1.w1.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751697AbbGMXqc (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Mon, 13 Jul 2015 19:46:32 -0400
Message-id: <55A44DD3.9020005@samsung.com>
Date: Tue, 14 Jul 2015 08:46:27 +0900
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
MIME-version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Mike Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>
Subject: Re: [PATCH 22/45] clk: samsung: Properly include clk.h and clkdev.h
References: <1436571223-10959-1-git-send-email-sboyd@codeaurora.org>
 <1436571223-10959-23-git-send-email-sboyd@codeaurora.org>
 <55A0C0A6.8060600@samsung.com> <55A42299.3040809@codeaurora.org>
In-reply-to: <55A42299.3040809@codeaurora.org>
Content-type: text/plain; charset=iso-8859-2
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 14.07.2015 05:42, Stephen Boyd wrote:
> On 07/11/2015 12:07 AM, Krzysztof Kozlowski wrote:
>> W dniu 11.07.2015 o 08:33, Stephen Boyd pisze:
>>
>>> diff --git a/drivers/clk/samsung/clk.c b/drivers/clk/samsung/clk.c
>>> index 0117238391d6..f38a6c49f744 100644
>>> --- a/drivers/clk/samsung/clk.c
>>> +++ b/drivers/clk/samsung/clk.c
>>> @@ -11,6 +11,10 @@
>>>    * clock framework for Samsung platforms.
>>>   */
>>>   +#include <linux/slab.h>
>>> +#include <linux/clkdev.h>
>>> +#include <linux/clk.h>
>>> +#include <linux/clk-provider.h>
>>>   #include <linux/of_address.h>
>>>   #include <linux/syscore_ops.h>
>>>   diff --git a/drivers/clk/samsung/clk.h b/drivers/clk/samsung/clk.h
>>> index b775fc29caa5..aa872d2c5105 100644
>>> --- a/drivers/clk/samsung/clk.h
>>> +++ b/drivers/clk/samsung/clk.h
>>> @@ -13,10 +13,11 @@
>>>   #ifndef __SAMSUNG_CLK_H
>>>   #define __SAMSUNG_CLK_H
>>>   -#include <linux/clkdev.h>
>>>   #include <linux/clk-provider.h>
>>>   #include "clk-pll.h"
>>>   +struct clk;
>>> +
>> Hmmm... why? Including clk-provider (which declares struct clk in your
>> last patch) is not sufficient?
>>
> 
> I hope to eventually remove the forward declaration of struct clk in
> clk-provider.h too. That will take some more time though. I can leave
> this part out of the patch if you like and add it back when that work is
> done, it doesn't matter to me.

Thanks for explanation, it's fine as it is.

Best regards,
Krzysztof

