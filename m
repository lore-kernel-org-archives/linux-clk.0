Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ulf Hansson <ulf.hansson@linaro.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAPDyKFroV0Qhx3rQfUHWeOwKjt0VTSp4TsoO1PmnHjm=JboD8g@mail.gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, grahamr@codeaurora.org,
 linux-clk <linux-clk@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, Taniya Das <tdas@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Amit Kucheria <amit.kucheria@linaro.org>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
 <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
 <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
 <153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
 <20180725054400.96956.13278@harbor.lan>
 <20180725112702.GN1636@tbergstrom-lnx.Nvidia.com>
 <CAPDyKFqHNOc-KHcA-LGpyScZ54rsa-FWgJihStgW6sPmXgw07A@mail.gmail.com>
 <20180803230533.71539.26618@harbor.lan>
 <CAPDyKFroV0Qhx3rQfUHWeOwKjt0VTSp4TsoO1PmnHjm=JboD8g@mail.gmail.com>
Message-ID: <20180918224840.67076.97774@harbor.lan>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Date: Tue, 18 Sep 2018 15:48:40 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Ulf Hansson (2018-08-23 05:13:40)
> On 4 August 2018 at 01:05, Michael Turquette <mturquette@baylibre.com> wr=
ote:
> > Quoting Ulf Hansson (2018-07-31 04:56:46)
> >> On 25 July 2018 at 13:27, Peter De Schrijver <pdeschrijver@nvidia.com>=
 wrote:
> >> > On Tue, Jul 24, 2018 at 10:44:00PM -0700, Michael Turquette wrote:
> >> >> Quoting Stephen Boyd (2018-07-24 16:04:37)
> >> >> > Quoting Peter De Schrijver (2018-07-23 01:26:41)
> >> >> > > On Fri, Jul 20, 2018 at 10:12:29AM -0700, Stephen Boyd wrote:
> >> >> > > >
> >> >> > > > For one thing, a driver should be able to figure out what the
> >> >> > > > performance state requirement is for a particular frequency. =
I'd like to
> >> >> > > > see an API that a driver can pass something like a (device, g=
enpd, clk,
> >> >> > > > frequency) tuple and get back the performance state required =
for that
> >> >> > > > device's clk frequency within that genpd by querying OPP tabl=
es. If we
> >> >> > > > had this API, then SoC vendors could design OPP tables for th=
eir on-SoC
> >> >> > > > devices that describe the set of max frequencies a device can=
 operate at
> >> >> > > > for a specific performance state and driver authors would be =
able to
> >> >> > > > query that information and manually set genpd performance sta=
tes when
> >> >> > > > they change clk frequencies. In Qualcomm designs this would b=
e their
> >> >> > > > "fmax" tables that map a max frequency to a voltage corner. I=
f someone
> >> >> > > > wanted to fine tune that table and make it into a full freque=
ncy plan
> >> >> > > > OPP table for use by devfreq, then they could add more entrie=
s for all
> >> >> > > > the validated frequencies and voltage corners that are accept=
able and
> >> >> > > > tested and this API would still work. We'll need this sort of=
 table
> >> >> > > > regardless because we can't expect devices to search for an e=
xact
> >> >> > > > frequency in an OPP table when they can support hundreds of d=
ifferent
> >> >> > > > frequencies, like in display or audio situations.
> >> >> > > >
> >> >> > >
> >> >> > > Various reasons why I think the driver is not the right place t=
o handle
> >> >> > > the V/f relationship:
> >> >> > >
> >> >> > > 1) The V/f relationship is temperature dependent. So the voltag=
e may have
> >> >> > >    to be adjusted when the temperature changes. I don't think w=
e should
> >> >> > >    make every driver handle this on its own.
> >> >> >
> >> >> > This is AVS? Should be fine to plumb that into some sort of volta=
ge
> >> >> > domain that gets temperature feedback and then adjusts the voltag=
e based
> >> >
> >> > For the core rail, it seems the voltage is indeed just adjusted base=
d on
> >> > temperature. For the GPU rail, we have equations which calculate the=
 required
> >> > voltage as a function of frequency and temperature. In some cases I =
think
> >> > we just cap the frequency if the temperature would be too high to fi=
nd
> >> > a suitable voltage. Fortunately the GPU has its own rail, so it does=
n't
> >> > necessarily need to be handled the same way.
> >> >
> >> >> > on that? This is basically the same as Qualcomm's "voltage corner=
s" by
> >> >> > the way, just that the voltage is adjusted outside of the Linux k=
ernel
> >> >> > by another processor when the temperature changes.
> >> >>
> >> >> Ack to what Stephen said above. Adaptive voltage scaling, corners, =
body
> >> >> bias, SMPS modes/efficiency, etc are all just implementation detail=
s.
> >> >>
> >> >> I don't think anyone is suggesting for drivers to take all of the a=
bove
> >> >> into account when setting voltage. I would imagine either a "nomina=
l"
> >> >> voltage, a voltage "index" or a performance state to be passed from=
 the
> >> >> driver into the genpd layer.
> >> >>
> >> >> Peter would that work for you?
> >> >>
> >> >
> >> > A voltage index should do I think. The reason for a voltage index is=
 that
> >> > we have at least one case, where the voltage depends on the mode of =
the
> >> > device. This is the case for the HDMI/DP output serializers (SORx). =
The
> >> > required voltage doesn't only depend on the pixel rate, but also on =
the
> >> > mode (DP or HDMI). One danger is that we must make sure all
> >> > drivers of devices sharing a rail, use this API to set their voltage
> >> > requirement. If not, weird failures will show up.
> >>
> >> I am trying to understand the proposal, but it seems like I am failing=
. Sorry.
> >>
> >> Genpd already have an API for requesting a performance state for a
> >> device, dev_pm_genpd_set_performance_state() - and genpd aggregates
> >> the votes per PM domain.
> >>
> >> The idea so far, is that most votes should come via the OPP layer,
> >> dev_pm_opp_set_rate(), but for special cases users may decide to call
> >> dev_pm_genpd_set_performance_state() directly.
> >>
> >> So far so good?
> >
> > This almost matches what I had in mind.
> =

> Ok, a step in the right direction. :-)

Wow, I completely missed this response! Sorry for only seeing it just
now.

> =

> >
> >>
> >> Following the conversation, it seems like the suggestion is to *not*
> >> go through the OPP layer, but instead always let drivers call
> >> dev_pm_genpd_set_performance_state(). Why is that a benefit and why is
> >> that preferred?
> >
> > I think that consumer drivers should not directly invoke the genpd apis
> > for performance power management, but instead access them through a
> > pm_runtime interface, just as they do when managing idle power
> > management.
> >
> > This pm_runtime performance interface does not exist yet. There is an
> > argument that the opp library is this interface, but I'll address that
> > at the very end of this message.
> >
> >>
> >> If I understood the main concern raised by Graham/Stephen, was that we
> >> didn't want to make the driver call yet another API to manage OPPs. So
> >> then calling dev_pm_genpd_set_performance_state() is fine, but not
> >> dev_pm_opp_set_rate()?
> >
> > Speaking only for myself, I want a single performance interface that
> > encapsulates clocks, regulators, pm microcontrollers, firmware
> > interfaces or whatever are required on the SoC to achieve the
> > performance level desired.
> >
> > There will likely be a need for some consumer drivers to mix calls to
> > low-level primitives (clks, regulators) with this new pm_runtime
> > performance api, but that is the exception to the rule.
> >
> >>
> >> Moreover, how would the driver know which performance state it shall
> >> request? Sounds like a OPP translation is needed anyways, so even more
> >> things falls into the responsibility of the driver, in case it shall
> >> call dev_pm_genpd_set_performance_state(). It doesn't sound right to
> >> me.
> >
> > Translation implies that consumer drivers are making requests in Hertz
> > to begin with. I think we should challenge this assumption.  Devicetree
> > gives us the tools we need to link SoC-specific performance states to
> > Driver-specific use cases and configurations. Clock rates will be the
> > right way to model this for many devices, but arbitrary perf indexes
> > will also make sense for others. Translation should happen in DT.
> =

> Right.
> =

> As a matter of fact we already have some DT bindings to translate
> clock/voltage to perf states for QCOM. Or maybe those didn't get fully
> merged!?
> =

> >
> >> Finally, trying to make use of the ->stop|start() callbacks in genpd,
> >> can be useful for SoC specific operations that we want to make
> >> transparent for generic drivers. However, I wonder if dealing with
> >> OPPs from there really makes sense, need to think more about that.
> >
> > To start with, I suggest we follow the principle of simplicity and
> > separate active and idle power management operations as much as
> > possible. We can always make it into a tangled mess later ;-)
> =

> If I understand, you are questioning part of the support for
> performance states through genpd?
> =

> >
> > I mentioned several times that I do not want to require OPP to be used
> > for controlling performance. I'll try to explain that now:
> >
> > My main issue with OPP is that it is really *just a library* for dealing
> > with voltage/frequency tuples. Over time it has added in some generic
> > logic for setting clock rate and regulator voltage, but this is not a
> > solution for everyone. It's fine to cover the simple cases, but complex
> > SoCs will not find this approach useful.
> >
> > In fact, having dev_pm_opp_set_rate make a call to
> > dev_pm_genpd_set_performance_state is completely backwards. Some genpd
> > implementations may make use of the OPP library as a data store for
> > supported frequency and voltage tuples, but not all of them will. Having
> > the tuple library tell the genpd layer what to do is an upside down
> > design.
> >
> > The changes to add performance awareness to genpd allows us to write
> > "performance provider" drivers, which is good. But forcing the consumer
> > api to be the OPP library is severely limiting.
> =

> The hole point of why we extended the infrastructure of genpd to deal
> with performance states, was to take advantage of the already modeled
> power topology (devices being attached to and grouped into
> master/subdomains).
> =

> I understand that you more or less seems happy with this approach, but
> not the consumer part of it. Okay, fair enough, I somewhat agree as
> well.

Correct.

> =

> >
> > What is missing is a generic, less opinionated consumer api that gives
> > performance provider drivers (aka genpd callbacks) the flexibility to
> > support complex hardware and use cases. For example, how does the OPP
> > library work for a firmware interface that controls performance? Or a
> > message passing mechanism to a power management microcontroller? In
> > either case, it might not make sense to model everything in terms of
> > hertz or volts.
> >
> > No doubt genpd, the performance provider, can handle the firmware and pm
> > microcontroller cases mentioned above. But the OPP library, the half of
> > the interface used by the performance consumer, does not fit well.
> >
> > Put another way, there exists a set of performance scalable devices.
> > Within that set is a subset of devices for which it makes sense to model
> > their performance via clock rates. And within _that_ subset there exists
> > a subset of devices for whom dev_pm_opp_set_rate will be sufficient for
> > performance management. That leaves a lot of devices unaccounted for.
> =

> You are right, not all devices can use a clock rate as to request a
> performance state. On the other hand, we seem still to talk about
> OPPs, as "performance operating points". Right!?
> =

> Then, instead of trying to invent something completely new, why don't
> we just consider to extend the OPP library with another API? Something
> along the lines of, dev_pm_opp_set_performance_state().

Because it's sort of a layering violation and the consumer api is
incongruent with the existing runtime pm stuff used for idle.

A genpd performance provider might want to use the OPP library as a part
of its own internal state machine (ie setting clocks and regulators).
Isn't it weird to have that be the same layer that consumers call into?

Furthermore, there aren't a lot of upstream examples of
dev_pm_opp_set_rate. I only see it used in drivers/cpufreq/cpufreq-dt.c
as of 4.19-rc4. So there is no inertia preventing us from considering
using the pm runtime interface (which nicely handles the consumer side
of genpd idle operations) to handle the consumer side of the genpd
active/performance operations.

Thus now is the time to decide whether or not to introduce
dev_pm_opp_set_performance_state. There will be no upstream impact on
"existing consumers" to migrate them away from the OPP library since
there are basically no existing user except for cpufreq-dt.

My vote is to not introduce a new api into the OPP library and
instead explore whether performance/active consumer apis could co-exist
with their idle counterparts in the pm runtime layer.

> =

> What would happen behind that API, would then be OPP provider
> specific. Some provider may call dev_pm_genpd_set_performance_state(),
> but some don't.
> =

> >
> > Finally, when it comes time to consider chip-wide current limits,
> > adaptive voltage scaling, thermal considerations, body bias, etc, I
> > think that the tables provided by the OPP library just won't cut it.
> > We'll need SoC vendors to write real performance provider drivers and
> > glue all of this together in that backend. The only way to make that
> > work is to provide a less opinionated consumer-facing API that does not
> > assume that everything fits neatly into a table comprised of frequency &
> > voltage pairs.
> =

> Sure, this makes sense.
> =

> Although, the part that is still a bit fuzzy, is how and "OPP
> provider" would interact with a "genpd provider". I guessing those
> simply sometimes needs to be managed by the same "driver" (or whatever
> piece of code that controls this).

I think genpd is the same as "performance provider" or "idle provider".
If a genpd's machine-specific backend uses OPP then it can be an OPP
provider too, but if not then no big deal.

My thinking today is that for performance awareness and DVFS in Linux,
I'd like for genpd to be mandatory and OPP to be optional.

Best regards,
Mike

p.s: One final rant here about using the OPP clock/regulator logic in
dev_pm_opp_set_rate as some sort of measuring stick:

Setting CPU performance is just about the simplest use case for any
performance scaling on modern ARM platforms (that do not use SCPI or
whatever). CPUs typically have a dedicated clock subtree with no impact
to other IPs, dedicated power rails, and they are glitchless (meaning
that frequency changes happen without having to gate the logic or stall
accesses or synchronize busses or whatever). We should try to design
something that can scale to the complex use cases where a PLL drives a
ton of peripherals that have conflicting needs, etc. Scaling CPU
frequency is a very low bar to meet.

> =

> Kind regards
> Uffe
