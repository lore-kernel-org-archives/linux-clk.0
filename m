Return-Path: <david@lechnology.com>
Subject: Re: [PATCH] clk: divider: fix clk_round_rate() when
 CLK_DIVIDER_READ_ONLY && CLK_RATE_SET_PARENT
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 linux-kernel@vger.kernel.org
References: <1515262769-22665-1-git-send-email-david@lechnology.com>
 <20180110220333.GF28313@codeaurora.org>
From: David Lechner <david@lechnology.com>
Message-ID: <ff6bc8b7-a7b4-1218-6b1f-8bb8aa3cf479@lechnology.com>
Date: Thu, 11 Jan 2018 17:10:11 -0600
MIME-Version: 1.0
In-Reply-To: <20180110220333.GF28313@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>

On 01/10/2018 04:03 PM, Stephen Boyd wrote:
> On 01/06, David Lechner wrote:
>> clk_round_rate() 'answers the question "if I were to pass @rate to
>> clk_set_rate(), what clock rate would I end up with?" without changing
>> the hardware'.
>>
>> Currently, clk_divider_round_rate() returns the "current value" when
>> divider->flags & CLK_DIVIDER_READ_ONLY. But, if CLK_SET_RATE_PARENT is
>> set, then clk_set_rate() is supposed to propagate the rate change to the
>> parent clock. So, we need to do check for CLK_SET_RATE_PARENT and if it
>> is set, ask the parent clock what rate it can provide given the current
>> divider value.
>>
>> Signed-off-by: David Lechner <david@lechnology.com>
> 
> Jerome sent a patch the day before that probably addresses the
> same thing. See the message-id of 20180105170959.17266-2-jbrunet@baylibre.com
> for more info.
> 

Indeed, thank you. We can drop this patch.
