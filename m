Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from usa-sjc-mx-foss1.foss.arm.com ([217.140.101.70]:33398 "EHLO
        foss.arm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726015AbeG3HHI (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 30 Jul 2018 03:07:08 -0400
MIME-Version: 1.0
In-Reply-To: <153270946725.48062.11195853363758024681@swboyd.mtv.corp.google.com>
References: <1532700112-11852-1-git-send-email-amit.kachhap@arm.com> <153270946725.48062.11195853363758024681@swboyd.mtv.corp.google.com>
From: Amit Daniel Kachhap <amit.kachhap@arm.com>
Date: Mon, 30 Jul 2018 11:03:51 +0530
Message-ID: <CADGdYn5T2-B2UE9DX3wFHdvqfF85n0NAbKDBf2KHOQreRi=H+g@mail.gmail.com>
Subject: Re: [PATCH] clk: scmi: Fix the rounding of clock rate
To: Stephen Boyd <sboyd@kernel.org>
Cc: LAK <linux-arm-kernel@lists.infradead.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

On Fri, Jul 27, 2018 at 10:07 PM, Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Amit Daniel Kachhap (2018-07-27 07:01:52)
>> This fix rounds the clock rate properly by using quotient and not
>> remainder in the calculation. This issue was found while testing HDMI
>> in the Juno platform.
>>
>> Signed-off-by: Amit Daniel Kachhap <amit.kachhap@arm.com>
>
> Any Fixes: tag here?
Yes, This patch is tested with Linux v4.18-rc6 tag.
>
>> ---
>>  drivers/clk/clk-scmi.c | 5 ++---
>>  1 file changed, 2 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
>> index bb2a6f2..a985bf5 100644
>> --- a/drivers/clk/clk-scmi.c
>> +++ b/drivers/clk/clk-scmi.c
>> @@ -60,9 +59,9 @@ static long scmi_clk_round_rate(struct clk_hw *hw, unsigned long rate,
>>
>>         ftmp = rate - fmin;
>>         ftmp += clk->info->range.step_size - 1; /* to round up */
>> -       step = do_div(ftmp, clk->info->range.step_size);
>> +       do_div(ftmp, clk->info->range.step_size);
>>
>> -       return step * clk->info->range.step_size + fmin;
>> +       return ftmp * clk->info->range.step_size + fmin;
>
> Good catch.
Thanks.
>
Regards,
Amit
