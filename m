Return-Path: <phil@raspberrypi.org>
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
From: Phil Elwell <phil@raspberrypi.org>
Message-ID: <215eea3c-febe-5aa4-9dbb-e1f170bc0b0d@raspberrypi.org>
Date: Thu, 1 Jun 2017 09:26:31 +0100
MIME-Version: 1.0
In-Reply-To: <20170601063937.GN20170@codeaurora.org>
Content-Type: text/plain; charset=utf-8
List-ID: <linux-clk.vger.kernel.org>

On 01/06/2017 07:39, Stephen Boyd wrote:
> On 05/31, Phil Elwell wrote:
>> On 31/05/2017 16:58, Stefan Wahren wrote:
>>> Am 31.05.2017 um 17:27 schrieb Stephen Warren:
>>>> On 05/30/2017 06:23 AM, Phil Elwell wrote:
>>>>> Hi,
>>>>>
>>>>> I've run into a problem using the fixed-factor clock on Raspberry Pi
>>>>> and I'd
>>>>> like some advice before I submit a patch.
>>>>>
>>>>> Some context: the aim is to use a standard UART and some external
>>>>> circuitry
>>>>> as a MIDI interface. This would be straightforward except that Linux
>>>>> doesn't
>>>>> recognise the required 31.25KHz as a valid UART baud rate. Rhe
>>>>> workaround is
>>>>> to declare the UART clock such that the reported rate differs from
>>>>> the actual
>>>>> rate. If one sets the reported rate to be (actual*38400)/31250 then
>>>>> requesting a 38400 baud rate will result in an actual 31250 baud signal.
>>>>
>>>> This sounds like the wrong approach. Forcing the port to use a
>>>> different clock rate than the user requests would prevent anyone from
>>>> using that port for its standard purpose; it'd turn what should be a
>>>> runtime decision into a compile-time decision.
>>>>
>>>> Are you sure there's no way to simply select the correct baud rate on
>>>> the port? I see plenty of references to configuring custom baud rates
>>>> under Linux when I search Google, e.g.:
>>>>
>>>>> https://stackoverflow.com/questions/12646324/how-to-set-a-custom-baud-rate-on-linux
>>>>>
>>>> "How to set a custom baud rate on Linux?"
>>>>
>>>>> https://sourceware.org/ml/libc-help/2009-06/msg00016.html
>>>> "Re: Terminal interface and non-standard baudrates"
>>>>
>>>
>>> I remember this gist from Peter Hurley:
>>>
>>> https://gist.github.com/peterhurley/fbace59b55d87306a5b8
>>
>> Thank you, Stephen and Stephan. Stephen - the clock scaling is applied by a DT overlay so
>> it effectively a runtime setting, but I take your point about the elegance of the solution.
>> Stefan - anybaud looks promising, although I would have preferred for users to continue to
>> use the existing user-space tools - kernel changes can be deployed more easily.
>>
>> For my edification, can you pretend for a moment that the application was a valid one and
>> answer any of my original questions?:
>>
>> 1. Should all system clock drivers use OF_CLK_DECLARE? Doing so would probably
>> avoid this problem, but further initialisation order dependencies may
>> require more drivers to be initialised early.
> 
> No. CLK_OF_DECLARE() is only there to register clks early for
> things that need them early, i.e. interrupts and timers.
> Otherwise they should be plain drivers (platform or some other
> bus). If the same node has both then we have
> CLK_OF_DECLARE for that.

The problem with fixed-factor-clock is something like a Priority Inversion. CLK_OF_DECLARE
doesn't say that a driver can be probed early, it says that _must_ be probed early. There is
no fallback to platform device probing - setting the OF_POPULATED flag prevents that. In my
example the parent clock and the consumer are regular platform devices, but having this tiny
little gasket in between probed from of_clk_init breaks what ought to be a run-of-the-mill
device instantiation. It would be better if the intermediate driver could adapt to the
environment in which it finds itself, inheriting the "earlyness" of its consumer, but that
would require proper dependency information which Device Tree doesn't capture in a way which
is easy to make use of (phandles being integers that can be embedded in vectors in
subsystem-specific ways).

>> 2. Why does the clock initialisation hook registered by OF_CLK_DECLARE not
>> return any indication of success? If it did, and if the OF_POPULATED flag
>> was only set after successful initialisation then the normal retrying of
>> a deferred probe would also avoid this problem.
> 
> Historical raisins. Honestly if it fails the whole system should
> probably panic because we aren't going to get interrupts or
> schedule properly. Of course, we have whole drivers that register
> with CLK_OF_DECLARE() though when they should really be a driver
> that can do probe defer, etc., so making a change isn't really
> feasible right now.

That's the conclusion I had come to, that the current situation isn't ideal but that fixing
it is non-trivial.

>> 3. Would adding the OF_CLK_DECLARE hook prevent the use of the devm_ managed
>> functions like devm_kzalloc? If not, why doesn't fixed-factor-clock use it?
>>
> 
> If you use CLK_OF_DECLARE() then you don't get a struct device to
> pass to devm functions and thus you can't use them. I don't
> follow the question.

You don't need to evaluate the "else" it the condition is true, so you can ignore
the follow-up question. I was just confirming that if I did modify the bcm2835 clock drivers
to register with CLK_OF_DECLARE that I would have to strip out the devm functions and revert
to old-fashioned clean-up-on-exit code.

Thanks - you've confirmed my suspicions; the problem remains though as a bear trap to catch
the unwary.

Phil
