Return-Path: <phil@raspberrypi.org>
From: Phil Elwell <phil@raspberrypi.org>
Subject: Re: CLK_OF_DECLARE advice required
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>,
        linux-clk@vger.kernel.org
References: <ae427c15-330f-6f8d-e2ac-62a8deacbdc5@raspberrypi.org>
 <8b65e551-e6dd-cf5c-1b22-e1f1a5996d73@wwwdotorg.org>
 <0794f430-9761-c855-9a89-13d9871c5831@i2se.com>
 <6765be64-9cf6-4663-4182-5b63f27bfb93@raspberrypi.org>
 <20170601063937.GN20170@codeaurora.org>
 <215eea3c-febe-5aa4-9dbb-e1f170bc0b0d@raspberrypi.org>
 <20170602223432.GU20170@codeaurora.org>
Message-ID: <35742698-9f04-fa57-60b0-eecb3d790e03@raspberrypi.org>
Date: Mon, 5 Jun 2017 17:24:08 +0100
MIME-Version: 1.0
In-Reply-To: <20170602223432.GU20170@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 02/06/2017 23:34, Stephen Boyd wrote:> On 06/01, Phil Elwell wrote:
>> On 01/06/2017 07:39, Stephen Boyd wrote:
>>> On 05/31, Phil Elwell wrote:
>>>> For my edification, can you pretend for a moment that the application was a valid one and
>>>> answer any of my original questions?:
>>>>
>>>> 1. Should all system clock drivers use OF_CLK_DECLARE? Doing so would probably
>>>> avoid this problem, but further initialisation order dependencies may
>>>> require more drivers to be initialised early.
>>>
>>> No. CLK_OF_DECLARE() is only there to register clks early for
>>> things that need them early, i.e. interrupts and timers.
>>> Otherwise they should be plain drivers (platform or some other
>>> bus). If the same node has both then we have
>>> CLK_OF_DECLARE for that.
>>
>> The problem with fixed-factor-clock is something like a Priority Inversion. CLK_OF_DECLARE
>> doesn't say that a driver can be probed early, it says that _must_ be probed early. There is
>> no fallback to platform device probing - setting the OF_POPULATED flag prevents that. In my
>> example the parent clock and the consumer are regular platform devices, but having this tiny
>> little gasket in between probed from of_clk_init breaks what ought to be a run-of-the-mill
>> device instantiation. It would be better if the intermediate driver could adapt to the
>> environment in which it finds itself, inheriting the "earlyness" of its consumer, but that
>> would require proper dependency information which Device Tree doesn't capture in a way which
>> is easy to make use of (phandles being integers that can be embedded in vectors in
>> subsystem-specific ways).
> 
> You sort of lost me here. The clk framework has support for
> "orphans" which means that clks can be registered in any order,
> i.e. the fixed factor clk could register first and be orphaned
> until the parent platform device driver probes and registers that
> clk at which point we'll fix up the tree. So nothing goes wrong
> and really the orphan design helps us here and in other
> situations.

That sounds great, but it doesn't match my experience. Let me restate my
observations with a bit more detail.

In this scenario there three devices in a dependency chain:

  clock -> fixed-factor->clock -> uart.

The Fixed Factor Clock is declared with OF_CLK_DECLARE, while the two platform
drivers use normal probe functions.

1) of_clk_init() calls encounter FFC in the list of clocks to initialise and
calls parent_ready on the device node.

2) The parent clock has not been initialised, so of_clk_get returns
-EPROBE_DEFER.

3) Steps 1 and 2 repeat until no progress is made, at which point the force
flag is set for one last iteration. This time the parent_ready check is skipped
and the code calls indirectly into _of_fixed_factor_clk_setup().

4) The FFC setup calls of_clk_get_parent_name, which returns a NULL that ends
up referred to by the parent_names field of clk_init_data structure indirectly
passed to clk_hw_register and clk_register.

5) In clk_register, the parent name is copied with kstrdup, which returns NULL
for a NULL input. clk_register sees this as an allocation failure and returns
-ENOMEM.

6) _of_fixed_factor_clock_setup returns -ENOMEM, bypassing of_clk_add_provider,
but the wrapper function registered with CLK_OF_DECLARE has a void return, so
the failure is lost.

7) Back in of_clk_init, which is ignorant of the failure, the OF_POPULATED flag
of the FFC node has already been set, preventing the node from subsequently
being probed in the usual way.

8) When the downstream uart is probed, devm_clk_get returns -EPROBE_DEFER every
time, resulting in a non-functioning UART.

Is this behaviour as intended? I can see that the NULL parent name in steps 4
and 5 could be handled more gracefully, but the end result would be the same.

Where and how is the "orphan" clock concept supposed to help, and what needs to
be fixed in this case?

Thanks,

Phil
