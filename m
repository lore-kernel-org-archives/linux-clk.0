Return-Path: <spanda@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Fri, 13 Jul 2018 13:55:49 +0530
From: spanda@codeaurora.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>, Michael Turquette
 <mturquette@baylibre.com>, Taniya Das <tdas@codeaurora.org>,
 ryadav@codeaurora.org, Andy Gross <andy.gross@linaro.org>, David Brown
 <david.brown@linaro.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit
 Nischal <anischal@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add display clock controller driver for
 SDM845
In-Reply-To: <153142449680.48062.13809855257701591509@swboyd.mtv.corp.google.com>
References: <1529763567-13131-1-git-send-email-tdas@codeaurora.org>
 <1529763567-13131-4-git-send-email-tdas@codeaurora.org>
 <153109408562.143105.15954380130353645468@swboyd.mtv.corp.google.com>
 <10f87216-caa2-d523-e134-6cf3acd268a7@codeaurora.org>
 <153111701079.143105.13387458941681113476@swboyd.mtv.corp.google.com>
 <436cc6a3-7406-c695-7879-3b9d042262cc@codeaurora.org>
 <153112184177.143105.15452587215679149679@swboyd.mtv.corp.google.com>
 <288770be-a763-b287-f62a-72ab7616efdb@codeaurora.org>
 <153114876561.143105.465317097490450694@swboyd.mtv.corp.google.com>
 <e0203471-85ef-456a-d7f3-85c66a82b8c1@codeaurora.org>
 <153142449680.48062.13809855257701591509@swboyd.mtv.corp.google.com>
Message-ID: <9509c88c112d59874e28459d8f87509f@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

On 2018-07-13 01:11, Stephen Boyd wrote:
> Quoting Taniya Das (2018-07-12 10:21:33)
>> ++ Display driver team,
>> 
>> On 7/9/2018 8:36 PM, Stephen Boyd wrote:
>> > Quoting Taniya Das (2018-07-09 02:34:07)
>> >>
>> >>
>> >> On 7/9/2018 1:07 PM, Stephen Boyd wrote:
>> >>> Quoting Taniya Das (2018-07-09 00:07:21)
>> >>>>
>> >>>>
>> >>>> On 7/9/2018 11:46 AM, Stephen Boyd wrote:
>> >>>>>>
>> >>>>>>     > Why is the nocache flag needed? Applies to all clks in this file.
>> >>>>>>     >
>> >>>>>>
>> >>>>>> This flag is required for all RCGs whose PLLs are controlled outside the
>> >>>>>> clock controller. The display code would require the recalculated rate
>> >>>>>> always.
>> >>>>>
>> >>>>> Right. Why is the PLL controlled outside of the clock controller? The
>> >>>>> rate should propagate upward to the PLL from here, so who's going
>> >>>>> outside of that?
>> >>>>>
>> >>>> The DSI0/1 PLL are not part of the display clock controller, but in the
>> >>>> display subsystem which are managed by the DRM drivers. When DRM drivers
>> >>>> query for the rate clock driver should always return the non cached rates.
>> >>>
>> >>> Why? Is the DSI PLL changing rate all the time, randomly, without going
>> >>> through the clk APIs to do so?
>> >>>
>> >>
>> >> Hmm, I am afraid I do not have an answer for this, but this was the
>> >> requirement to always return the non cached rates from the clock driver.
>> >>
>> >
>> > Ok. Who knows about this requirement? Can we add someone from the
>> > display driver to understand more?
>> >
>> As per my discussions offline with the display teams,
>> 
>> There is a use-case where the clock framework is unaware of the PLL 
>> VCO
>> frequency change and thus the drivers would query to get the actual HW
>> frequency rather than the cached one.
>> 
>> Do you think keeping these flags would have any impact other than 
>> always
>> getting the non-cached rates?
>> 
> 
> The flag will make it so clk_get_rate() works in spite of something
> changing the frequency behind the framework's back, but I want to
> understand what and why it's changing without framework involvement. We
> shouldn't need the flag here, because this flag is typically for clks
> that are controlled by some other entity that the kernel doesn't have
> control over. In this case, it seems like we have full control of the
> clk tree for the display PLL down to this clk, so it should be 
> perfectly
> fine to not have this flag. The presence of the flag means that the
> display driver is doing something wrong.

These clocks are sourced from DSI PLL. In dsi command mode there is an 
idle use case when there
is no activity on display, we switch of the source DSI PLL to save power 
by calling clk_disable_unprepare().
In this scenario if some client queries the clk_get_rate(), then if 
NO_CACHE flag is used the clk
driver will return the cached rate which is some non-zero value set when 
we last called clk_set_rate(),
before enabling the clock, whereas actually in HW this clk is disabled. 
So we used the NO_CACHE flag
for the call to land in clk_recalc_rate and we return zero if the PLL is 
disabled.
I remember some customer had scripts that runs through all the clocks 
during idle screen scenario
and call clk_get_rate(), where they complained display clk_get_rate 
returns none zero value.
