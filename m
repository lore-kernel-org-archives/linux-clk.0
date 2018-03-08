Return-Path: <joel.stan@gmail.com>
MIME-Version: 1.0
Sender: joel.stan@gmail.com
In-Reply-To: <CAARXrtk6ZynSzm=xA1E1M8aSJNb=BZ7jxg4gvWa_QJ_=LaQeog@mail.gmail.com>
References: <1520440570-25280-1-git-send-email-eajames@linux.vnet.ibm.com>
 <CACPK8Xe5rVtB6hUo4xW9qSz-T+kehvXSRv5g1_6KOO=BYr8Qwg@mail.gmail.com> <CAARXrtk6ZynSzm=xA1E1M8aSJNb=BZ7jxg4gvWa_QJ_=LaQeog@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Thu, 8 Mar 2018 16:13:28 +1030
Message-ID: <CACPK8Xe55+_aOJD+dhpLrYfnw8_kjE-daXuRhu42p=O3K5Rztw@mail.gmail.com>
Subject: Re: [PATCH] clk: aspeed: Prevent reset if clock is enabled
To: Lei YU <mine260309@gmail.com>
Cc: Eddie James <eajames@linux.vnet.ibm.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-clk@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
	Ryan Chen <ryan_chen@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

On Thu, Mar 8, 2018 at 4:08 PM, Lei YU <mine260309@gmail.com> wrote:
> On Thu, Mar 8, 2018 at 11:42 AM, Joel Stanley <joel@jms.id.au> wrote:
>>> +       /* Only reset/enable/unreset if clock is stopped */
>>> +       regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
>>> +       if (!(reg & clk))
>>> +               return 0;
>>
>> This doesn't generalise to all of the clocks, as some clocks use set
>> to disable. Perhaps we could do something like this:
>>
>>        /* Only reset/enable/unreset if clock is stopped. The LPC clock
>> on ast2500 has issues otherwise */
>>        enval = (gate->flags & CLK_GATE_SET_TO_DISABLE) ? 0 : clk;
>>        regmap_read(gate->map, ASPEED_CLK_STOP_CTRL, &reg);
>>        if ((reg & clk) == enval) {
>>                spin_unlock_irqrestore(gate->lock, flags);
>>                return 0;
>>        }
>>
>> I think we should also do this operation under the lock.
>>
>> Please cc Ryan Chen <ryan_chen@aspeedtech.com> so he can confirm that
>> this workaround is valid, and credit Lei who spent a lot of time
>> investigating this issue. Perhaps "Root-caused-by".
>>
>
> The code has aspeed_clk_is_enabled() already, why not just:
>
>     if (aspeed_clk_is_enabled(hw))
>         return 0;

Good suggestion.

We should also fix up aspeed_clk_is_enabled() for clocks that have
CLK_GATE_SET_TO_DISABLE set.

Cheers,

Joel
