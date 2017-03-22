Return-Path: <sudeep.holla@arm.com>
Subject: Re: [PATCH v3 3/5] coresight: add support for debug module
To: Leo Yan <leo.yan@linaro.org>
References: <1488520809-31670-1-git-send-email-leo.yan@linaro.org>
 <1488520809-31670-4-git-send-email-leo.yan@linaro.org>
 <671a0b39-b635-6e0e-d3fa-967651f2e29c@arm.com>
 <CAJ9a7VgCjXNGC4C49PxL-nBxzhMCmA8Mb-0C_epahizA5EL2HA@mail.gmail.com>
 <e7a97c52-f61a-e503-f626-09563fa100b8@arm.com>
 <20170322160102.GB15179@leoy-linaro>
Cc: Sudeep Holla <sudeep.holla@arm.com>, Mike Leach <mike.leach@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Wei Xu <xuwei5@hisilicon.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 John Stultz <john.stultz@linaro.org>, Guodong Xu <guodong.xu@linaro.org>,
 Haojian Zhuang <haojian.zhuang@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org
From: Sudeep Holla <sudeep.holla@arm.com>
Message-ID: <d976bae5-0b81-e47c-4f41-eb240bea7827@arm.com>
Date: Wed, 22 Mar 2017 16:53:32 +0000
MIME-Version: 1.0
In-Reply-To: <20170322160102.GB15179@leoy-linaro>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>



On 22/03/17 16:01, Leo Yan wrote:
> On Wed, Mar 22, 2017 at 02:07:47PM +0000, Sudeep Holla wrote:

[...]

>>
>> We can always do that unconditionally. If implementations don't honor
>> those bits, it's different. If they hang on accessing something which is
>> on debug power domain and not on core power domain, then you have much
>> bigger issue to solve. How can you even trust and make any other
>> register accesses that are in debug power domain then ?
> 
> So we can add below code before really access another other registers
> are possible in CPU power domain:
> 
>         /*
>          * Force to power on CPU power domain and assert
>          * DBGPWRUPREQ signal
>          */
>         val = readl(drvdata->base + EDPRCR);
>         val |= BIT(3);
>         writel(val, drvdata->base + EDPRCR);
> 

Yes worth trying it out.

[...]

> 
> I tried to digest these info and below are my understanding from your
> suggestion:
> 
> ### For boot time: add two command line flags
> 

I am not really sure about boot flags as there are dependency on power
domains and expecting them to be powered on quite earlier is too much to
ask. I am not sure if we need special case for boot time. But that's
just my opinion. If someone has found it *really* useful and no other
alternative exists, then go for it.

[...]

> ### For runtime: use one sysfs node
> 
> - Create sysfs node:
>   /sys/kernel/debug/coresight_cpu_debug/enable_debug
> 
>   echo 1 > /sys/kernel/debug/coresight_cpu_debug/enable_debug: same
>   functionality with boot time's 'coresight.cpu_debug';
> 

My argument was this to be default without any need for flags.
We can skip it as and when we find broken implementation if required.

>   echo 2 > /sys/kernel/debug/coresight_cpu_debug/enable_debug: same
>   functionality with boot time's 'coresight.cpu_debug_pwrup';
> 
>   echo 0 > /sys/kernel/debug/coresight_cpu_debug/enable_debug: disable
>   debug functionality.
>

So it can be simple boolean to force setup the power domain requirements
for it to work whenever you need to activate it. I may be missing some
use-case, but IIUC simple boolean flag should be fine as suggested
initially.

-- 
Regards,
Sudeep
