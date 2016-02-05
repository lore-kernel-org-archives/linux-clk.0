Return-Path: <slash.tmp@free.fr>
Subject: Re: Common/typical fractional divider HW API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-clk <linux-clk@vger.kernel.org>
Cc: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sebastian Frias <sf84@laposte.net>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
References: <56B4B67D.2080707@free.fr>
 <1454684758.31169.77.camel@linux.intel.com> <56B4C775.50808@free.fr>
 <1454688729.31169.87.camel@linux.intel.com>
From: Mason <slash.tmp@free.fr>
Message-ID: <56B4CDEF.3080606@free.fr>
Date: Fri, 5 Feb 2016 17:29:35 +0100
MIME-Version: 1.0
In-Reply-To: <1454688729.31169.87.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
List-ID: <linux-clk.vger.kernel.org>

On 05/02/2016 17:12, Andy Shevchenko wrote:

> On Fri, 2016-02-05 at 17:01 +0100, Mason wrote:
> 
>> So, do you agree that
>>
>>   DIV = 2^I * (1 + F/256)
>>
>> gives a more useful DIV distribution than
>>
>>   DIV = I + F/16
> 
> If you can change hardware why not to use any existing approach which
> suits better to your device?

Sorry, I don't understand the question.

In this part of my message, I was trying to argue that one HW API
"2^I * (1 + F/256)" seemed better than another one "I + F/16" on
any hardware.

> I don't remember any existing, though I didn't check much, divider
> register which takes something like that.

IIUC, you are saying that you've never seen hardware use the
"2^I * (1 + F/256)" formula, is that correct?

>> I'm not sure how to parse that. I'm using the divider driver
>> for a CPU clock, to do D(V)FS in cpufreq.
> 
> If you are using custom stuff for custom hardware, I hope it's okay.
> But if we are talking about generic solutions (like clk-fractional-
> divider), I would suggest to consider existing users / hardware.

Are you saying that I could use the clk-fractional-divider with
hardware that computes "I + F/16" ?

Maybe the clk-fractional-divider could be made more generic by having
the register update part done in a call-back function?

Regards.
