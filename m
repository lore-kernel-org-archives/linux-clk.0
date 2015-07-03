Return-Path: <sudeep.holla@arm.com>
Message-ID: <5596B462.6050103@arm.com>
Date: Fri, 03 Jul 2015 17:12:18 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Sudeep Holla <Sudeep.Holla@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 "Jon Medhurst (Tixy)" <tixy@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@kernel.org>,
 Olof Johansson <olof@lixom.net>, Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v4 3/8] clk: add support for clocks provided by SCP(System
 Control Processor)
References: <1433760002-24120-1-git-send-email-sudeep.holla@arm.com> <1433760002-24120-4-git-send-email-sudeep.holla@arm.com> <20150702172310.GF4301@codeaurora.org> <5596A1B6.8020307@arm.com>
In-Reply-To: <5596A1B6.8020307@arm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 03/07/15 15:52, Sudeep Holla wrote:

[...]

>>> +static int scpi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
>>> +			     unsigned long parent_rate)
>>> +{
>>> +	struct scpi_clk *clk = to_scpi_clk(hw);
>>> +
>>> +	return clk->scpi_ops->clk_set_val(clk->id, rate);
>>> +}
>>> +
>>> +static void scpi_clk_disable(struct clk_hw *hw)
>>> +{
>>> +	scpi_clk_set_rate(hw, 0, 0);
>>
>> Does this mean you have to set a rate to enable the clock? Are
>> you relying on drivers to call clk_set_rate() to implicitly
>> enable the clock? If so, it would be better to cache the rate of
>> the clock in set_rate if the clock isn't enabled in software and
>> then send the cached rate during enable.
>>
>
> Agreed, I have asked the firmware/SCPI specification guys about
> more details on what to expect from firmware. Once they get back,
> will update the code considering your feedback.
>

OK, I got feedback and looks like it was never planned to implement that
and even specification needs to be fixed. So I will drop the disable
callback support. For now, we don't support {en,dis}able
features. We need to amend the specification to fix that.

Regards,
Sudeep
