Return-Path: <grahamr@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Date: Tue, 31 Jul 2018 13:02:45 -0700
From: grahamr@codeaurora.org
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Viresh Kumar
 <viresh.kumar@linaro.org>, linux-clk <linux-clk@vger.kernel.org>, Linux PM
 <linux-pm@vger.kernel.org>, Doug Anderson <dianders@chromium.org>, Taniya
 Das <tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>, Amit
 Nischal <anischal@codeaurora.org>, Vincent Guittot
 <vincent.guittot@linaro.org>, Amit Kucheria <amit.kucheria@linaro.org>,
 linux-clk-owner@vger.kernel.org
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
In-Reply-To: <CAPDyKFqHNOc-KHcA-LGpyScZ54rsa-FWgJihStgW6sPmXgw07A@mail.gmail.com>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180704065522.p4qpfnpayeobaok3@vireshk-i7>
 <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
 <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
 <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
 <153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
 <20180725054400.96956.13278@harbor.lan>
 <20180725112702.GN1636@tbergstrom-lnx.Nvidia.com>
 <CAPDyKFqHNOc-KHcA-LGpyScZ54rsa-FWgJihStgW6sPmXgw07A@mail.gmail.com>
Message-ID: <83d6a10252e7238f326e378957f2ff70@codeaurora.org>
List-ID: <linux-clk.vger.kernel.org>

I have two significant concerns with using a wrapper framework to 
support DVFS.  The first may be Qualcomm-specific, and more of a 
practical concern rather than a principled one.  We (clock driver 
owners) get voltage/frequency operating points from the clock controller 
designers in a single data-set, it is not information that is provided 
to or coming from the clock consumer hardware or software teams.  
Tracking, updating, and debugging frequency/voltage mismatches falls 
completely into the clock team, so moving the responsibility of handling 
the relationship in code to the consumer would be a disaster (SDM845 has 
almost 200 clock domains and over 800 clock branches - not all 
controlled by Linux but a large proportion are).  It would mean all 
clock consumers using any clk_set_rate or clk_enable APIs would need to 
make the appropriate voltage requests as well - and even if they could 
look up the required voltage based on frequency from some central 
location (which I expect would be delivered and maintained by the clock 
driver team) the chance that everyone would do that correctly is, 
frankly, zero.  The types of problems that arise from under-volting a 
clock generator or consumer are very hard to debug (since it can 
essentially result in random behavior).

My second concern is that we do have voltage requirements coming from 
the clock controller itself, not related to the clock consumer.  The 
clock hardware components themselves (PLLs, muxes, etc) require voltage 
levels that may differ from that of the final consumer of the output 
clock.  We could hack all these requirements into the frequency/voltage 
tuple table that consumers look up, but at that point we have diverged 
fairly dramatically from Stephen's principle that the clock framework 
should not directly require any voltage - fundamentally they do (at 
least ours do).

Our most recent patch that Taniya posted has gone in the direction 
similar to Tegra - instead of having the framework handle it, we use 
prepare and set_rate hooks to implement voltage (corner) voting in the 
qcom drivers via the new genpd.  This is not fully proven yet but is so 
far working well and will likely be our internal solution going forward 
if the framework consensus is to force consumers to manage their 
frequency-based voltage requirements themselves - I just do not see that 
as a practical solution for a complicated SoC with a large, highly 
distributed, clock tree.  That being said I do see potential future 
deadlock race conditions between clk and genpd which concern me - it 
remains a downside of that coupling.

Would there be some way to prevent consumers from directly calling 
clk_set_rate or clk_enable and force them to go via another framework 
for these calls?  It would at least prevent people from using the 
"wrong" interface and bypassing voltage requirements.  That of course 
means having to mirror any of the clk APIs that update clock state into 
genpd/opp, which Stephen finds distasteful (and I agree).

Graham



On 2018-07-31 04:56, Ulf Hansson wrote:
> On 25 July 2018 at 13:27, Peter De Schrijver <pdeschrijver@nvidia.com> 
> wrote:
>> On Tue, Jul 24, 2018 at 10:44:00PM -0700, Michael Turquette wrote:
>>> Quoting Stephen Boyd (2018-07-24 16:04:37)
>>> > Quoting Peter De Schrijver (2018-07-23 01:26:41)
>>> > > On Fri, Jul 20, 2018 at 10:12:29AM -0700, Stephen Boyd wrote:
>>> > > >
>>> > > > For one thing, a driver should be able to figure out what the
>>> > > > performance state requirement is for a particular frequency. I'd like to
>>> > > > see an API that a driver can pass something like a (device, genpd, clk,
>>> > > > frequency) tuple and get back the performance state required for that
>>> > > > device's clk frequency within that genpd by querying OPP tables. If we
>>> > > > had this API, then SoC vendors could design OPP tables for their on-SoC
>>> > > > devices that describe the set of max frequencies a device can operate at
>>> > > > for a specific performance state and driver authors would be able to
>>> > > > query that information and manually set genpd performance states when
>>> > > > they change clk frequencies. In Qualcomm designs this would be their
>>> > > > "fmax" tables that map a max frequency to a voltage corner. If someone
>>> > > > wanted to fine tune that table and make it into a full frequency plan
>>> > > > OPP table for use by devfreq, then they could add more entries for all
>>> > > > the validated frequencies and voltage corners that are acceptable and
>>> > > > tested and this API would still work. We'll need this sort of table
>>> > > > regardless because we can't expect devices to search for an exact
>>> > > > frequency in an OPP table when they can support hundreds of different
>>> > > > frequencies, like in display or audio situations.
>>> > > >
>>> > >
>>> > > Various reasons why I think the driver is not the right place to handle
>>> > > the V/f relationship:
>>> > >
>>> > > 1) The V/f relationship is temperature dependent. So the voltage may have
>>> > >    to be adjusted when the temperature changes. I don't think we should
>>> > >    make every driver handle this on its own.
>>> >
>>> > This is AVS? Should be fine to plumb that into some sort of voltage
>>> > domain that gets temperature feedback and then adjusts the voltage based
>> 
>> For the core rail, it seems the voltage is indeed just adjusted based 
>> on
>> temperature. For the GPU rail, we have equations which calculate the 
>> required
>> voltage as a function of frequency and temperature. In some cases I 
>> think
>> we just cap the frequency if the temperature would be too high to find
>> a suitable voltage. Fortunately the GPU has its own rail, so it 
>> doesn't
>> necessarily need to be handled the same way.
>> 
>>> > on that? This is basically the same as Qualcomm's "voltage corners" by
>>> > the way, just that the voltage is adjusted outside of the Linux kernel
>>> > by another processor when the temperature changes.
>>> 
>>> Ack to what Stephen said above. Adaptive voltage scaling, corners, 
>>> body
>>> bias, SMPS modes/efficiency, etc are all just implementation details.
>>> 
>>> I don't think anyone is suggesting for drivers to take all of the 
>>> above
>>> into account when setting voltage. I would imagine either a "nominal"
>>> voltage, a voltage "index" or a performance state to be passed from 
>>> the
>>> driver into the genpd layer.
>>> 
>>> Peter would that work for you?
>>> 
>> 
>> A voltage index should do I think. The reason for a voltage index is 
>> that
>> we have at least one case, where the voltage depends on the mode of 
>> the
>> device. This is the case for the HDMI/DP output serializers (SORx). 
>> The
>> required voltage doesn't only depend on the pixel rate, but also on 
>> the
>> mode (DP or HDMI). One danger is that we must make sure all
>> drivers of devices sharing a rail, use this API to set their voltage
>> requirement. If not, weird failures will show up.
> 
> I am trying to understand the proposal, but it seems like I am failing. 
> Sorry.
> 
> Genpd already have an API for requesting a performance state for a
> device, dev_pm_genpd_set_performance_state() - and genpd aggregates
> the votes per PM domain.
> 
> The idea so far, is that most votes should come via the OPP layer,
> dev_pm_opp_set_rate(), but for special cases users may decide to call
> dev_pm_genpd_set_performance_state() directly.
> 
> So far so good?
> 
> Following the conversation, it seems like the suggestion is to *not*
> go through the OPP layer, but instead always let drivers call
> dev_pm_genpd_set_performance_state(). Why is that a benefit and why is
> that preferred?
> 
> If I understood the main concern raised by Graham/Stephen, was that we
> didn't want to make the driver call yet another API to manage OPPs. So
> then calling dev_pm_genpd_set_performance_state() is fine, but not
> dev_pm_opp_set_rate()?
> 
> Moreover, how would the driver know which performance state it shall
> request? Sounds like a OPP translation is needed anyways, so even more
> things falls into the responsibility of the driver, in case it shall
> call dev_pm_genpd_set_performance_state(). It doesn't sound right to
> me.
> 
> Finally, trying to make use of the ->stop|start() callbacks in genpd,
> can be useful for SoC specific operations that we want to make
> transparent for generic drivers. However, I wonder if dealing with
> OPPs from there really makes sense, need to think more about that.
> 
> [...]
> 
> Kind regards
> Uffe
> --
> To unsubscribe from this list: send the line "unsubscribe linux-clk" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
