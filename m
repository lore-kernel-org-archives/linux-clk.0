Return-Path: <sudeep.holla@arm.com>
Message-ID: <55647454.50401@arm.com>
Date: Tue, 26 May 2015 14:25:40 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Sudeep Holla <sudeep.holla@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 "Jon Medhurst (Tixy)" <tixy@linaro.org>,
 Mike Turquette <mturquette@linaro.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 3/4] clk: scpi: add support for cpufreq virtual device
References: <1430134846-24320-1-git-send-email-sudeep.holla@arm.com> <1430134846-24320-4-git-send-email-sudeep.holla@arm.com> <20150520234558.GB31753@codeaurora.org>
In-Reply-To: <20150520234558.GB31753@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 21/05/15 00:45, Stephen Boyd wrote:
> On 04/27, Sudeep Holla wrote:
>> The clocks for the CPUs are provided by SCP and are managed by this
>> clock driver. So the cpufreq device needs to be added only after the
>> clock get registered and removed when this driver is unloaded.
>>
>> This patch manages the cpufreq virtual device based on the clock
>> availability.
>>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>
> The cpufreq device can't handle probe defer? I suppose we do it
> this way because we need to create a platform device somewhere
> and this is the best place to do so?
>

Correct, unless the communication with the SCP firmware is established
and the CPU clocks are registered, it makes no sense to register CPUFreq
virtual device. This seems to be best place IMO.

And yes, thanks to the absence of platform code on ARM64, where such
code was traditionally stashed away and got away with such scenarios.
Let me if you disagree with this or have any other suggestions.

Regards,
Sudeep
