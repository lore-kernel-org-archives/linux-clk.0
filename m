Return-Path: <sudeep.holla@arm.com>
Message-ID: <5571682C.4040908@arm.com>
Date: Fri, 05 Jun 2015 10:13:16 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
MIME-Version: 1.0
To: Stephen Boyd <sboyd@codeaurora.org>
CC: Sudeep Holla <sudeep.holla@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Liviu Dudau <Liviu.Dudau@arm.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 "Jon Medhurst (Tixy)" <tixy@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Kevin Hilman <khilman@kernel.org>,
 Olof Johansson <olof@lixom.net>, Mike Turquette <mturquette@linaro.org>
Subject: Re: [PATCH v3 4/5] clk: scpi: add support for cpufreq virtual device
References: <1432720398-5701-1-git-send-email-sudeep.holla@arm.com> <1432720398-5701-5-git-send-email-sudeep.holla@arm.com> <20150604211904.GO676@codeaurora.org>
In-Reply-To: <20150604211904.GO676@codeaurora.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
List-ID: <linux-clk.vger.kernel.org>



On 04/06/15 22:19, Stephen Boyd wrote:
> On 05/27, Sudeep Holla wrote:
>> The clocks for the CPUs are provided by SCP and are managed by this
>> clock driver. So the cpufreq device needs to be added only after the
>> clock get registered and removed when this driver is unloaded.
>>
>> This patch manages the cpufreq virtual device based on the clock
>> availability.
>>
>> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
>> Cc: Mike Turquette <mturquette@linaro.org>
>> Cc: Stephen Boyd <sboyd@codeaurora.org>
>> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
>> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
>> Cc: Jon Medhurst (Tixy) <tixy@linaro.org>
>> Cc: linux-clk@vger.kernel.org
>> ---
>
> Acked-by: Stephen Boyd <sboyd@codeaurora.org>
>
>

Thanks

> I guess there's no better place for this right now.
>

True

Regards,
Sudeep
