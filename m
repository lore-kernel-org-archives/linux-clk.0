Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: grahamr@codeaurora.org, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
 sboyd@kernel.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
Cc: dianders@chromium.org, ulf.hansson@linaro.org, viresh.kumar@linaro.org,
 Taniya Das <tdas@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
Message-ID: <20180702051311.99641.74432@harbor.lan>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Date: Sun, 01 Jul 2018 22:13:14 -0700
List-ID: <linux-clk.vger.kernel.org>

Hi Graham,

Thanks for bringing up this issue. It has been near and dear to my heart
for a decade. Apologies in advance for the long-winded replies and
occasional memes.

Quoting grahamr@codeaurora.org (2018-06-18 13:44:39)
> Hi All,
> =

> A number of vendors, including Qualcomm, support sophisticated digital =

> voltage rail management based on the state (rate and enable) of each =

> clock in the system.  In a Qualcomm SOC we require the ability to assert =

> a vote on both a regulator enable and voltage corner (essentially a =

> quantified voltage level) when clocks are enabled or have their rate =

> set. =


Who votes on the voltage control hardware? Is it the device that
consumes the clk and voltage resources, or does the clk hardware vote on
the regulator hardware on behalf of the consuming device?

Are there details of the QCOM-specific DVFS/DCVS scheme and sequencing
somewhere in a public doc? (if not, ping me off list with the name of
the doc and I'll look it up in createpoint/chipcode)

> Importantly, if a clock is disabled, it must release its required =

> voltage vote.

OK, so a clock votes on a regulator ... still would be good to
understand this in more detail.

> In general clients of the clock framework are not aware of the mapping =

> between their performance level (clock rate) and voltage requirement, =

> because it comes as part of the clock controller design and not the core =

> design,

Not caring about voltage seems to be common. Client devices know what
performance (or clock rate) that they want and voltage is just a
function of the requested performance level/clock rate.

The OPP library was designed with this in mind and this reality is
reflected in the fact that there are dev_pm_opp_find_freq_* functions,
but no dev_pm_opp_find_volt_* functions. Consumer drivers give zero
shits about voltage.

> and also because the clock controller elements themselves have =

> voltage requirements that must be included in the relationship (i.e. =

> PLLs need minimum voltage levels to operate at a given output =

> frequency).

Expanding on my missive above, a clock controller can be considered Just
Another Device with performance states that have a corresponding voltage
requirement.

Put another way, if a certain voltage is needed for correct clock signal
generation, then the clock generator hardware is the consumer device
that consumes this voltage.

> =

> The solution we have deployed for many years is to associate a regulator =

> and voltage level with each clock rate, and manage voting for the =

> associated regulator in the clock framework during state changes.  There =


Hmm, so the entry point for touching the voltage control hardware is the
clock framework? Sounds perilous.

Does it not make sense on QCOM hardware to track voltage requirements
based on the *consumer* device requirements? The scheme you're
describing is more like attributing the voltage requirements *to the
clock*. In my experiences, this likely does not model reality.

Are you not setting the voltage level for the power that is distributed
to the transistors associated with the consumer device? This would imply
that the voltage level is a property of the consumer device, no? Of
course the voltage and clock rate are a pair (tuple), but the ownership
of this property is the consumer device, right?

In your out-of-tree solutions, what happens if two distinct consumer
devices share a clock? Does the regulator only get voted on once (by the
clock), or twice (by the two consumer devices)?

> are two issues with this solution that have been raised by maintainers:
> =

> 1. The use of the regulator framework to track voltage corners has been =

> deemed invalid.  We are in the process of changing our implementation to =


Can you provide a link to the thread explaining that? Would be helpful
to me.

> use genpd, which is being modified to support aggregation, and is viewed =

> as acceptable in principle.

Yeah, now that genpd has a concept of performance[0][1], this makes
sense.  However that begs the question of whether the genpd should be a
superset of a {clk,regulator} tuple?

Why not use regulators to model the voltage hardware and then group
clk+regulator inside of a genpd for a "performance domain" or
"performance island"?

And Linux power domains can be nested, so you could possibly have a
"performance domain" genpd that is made of a clock paired with a
"voltage domain" genpd instead of using the regulator framework. For the
rest of this email I'll refer to "regulators", but you can just
substitute that with "voltage domain genpd" and it still works.

I should probably make it clear here that I have always felt that the
clock framework in Linux is a framework for managing some of the lowest
level of hardware primitives. I don't consider the clk framework to be a
good point of entry for a higher level DVFS/DCVS solution.

I've always imagined that a DVFS framework would come along and glue the
clk and regulator and scpi and opp and p-state and wtf frameworks
together into something coherent. Perhaps performance-aware genpd is the
hero we deserve?

> 2. In some SOCs, control over voltages may itself require enabling or =

> configuring a clock (think an I2C regulator for example).  In such a =

> design, the regulator->clock and clock->regulator dependencies =

> introduces a potential deadlock.

This is true if the clock framework is the entry point for DVFS
transitions. Ie:

clk_set_rate(target_clk)
-> regulator_set_voltage
   -> clk_prepare_enable(i2c_clk)
   -> clk_set_rate(i2c_clk)

But if regulators as a primitive are peers of clocks, and not children,
and if we group them all up under a performance-aware genpd we end up
with something like:


(increasing performance)
dev_pm_genpd_set_performance_state
-> regulator_set_voltage
   -> clk_prepare_enable(i2c_clk)
   -> clk_set_rate(i2c_clk)
-> clk_set_rate(target_clk)

(decreasing performance)
dev_pm_genpd_set_performance_state
-> clk_set_rate(target_clk)
-> regulator_set_voltage
   -> clk_prepare_enable(i2c_clk)
   -> clk_set_rate(i2c_clk)

> =

> The second concern above is the more challenging.  A proposal to use OPP =

> to manage core DVFS has been made, but suffers from three major =

> problems: first, it requires clients to use OPP for setting their rate, =

> but the clock framework for other control (i.e. enable or disable). Not =

> only is this confusing and (I would claim) ugly, it would also be very =

> easy for clients to accidentally call clk_set_rate directly instead of =

> going via OPP, resulting in invalid DVFS operating points.  The second =


Yes, yes, it would be interesting to have a framework that handled both
performance and idle ... oh wait genpd!

> problem is that OPP does not allow for removing a voltage vote entirely =

> when the clock is disabled - which is a fundamental requirement for the =

> design to be power optimal. =


I'll take your word on that. Not sure I follow, but I'm fine with OPP
not being the lynchpin of this whole thing. If the performance-aware
genpd implementation mandates genpd then it is broken and needs fixing
(I haven't had time to look).

> The third problem is that semantically =

> using OPP for requesting specific functional frequencies (i.e. for a  =

> serial bus) is an abuse of that framework.  It requires the clients to =

> find the "performance level" that matches the specific frequency they =

> require, then request that performance level - when what they really =

> want is to "set rate" on the clock to a specific, known, frequency.

Agreed, OPP library is pretty limited by design and doesn't fit all
cases. However I do feel that the clock framework should be used for
clock-only use cases (e.g. audio codec) and some dvfs framework should
be used for other use cases that may perform dvfs (such as using some
sort of genpd, per-device pm_qos and maybe runtime pm interface).
Performance-aware genpd is worth serious consideration here.

The devil is is in the details as always. Consider an audio codec that
just needs to configure a clock, and the clock generator hardware itself
has a voltage requirement for a given frequency or hardware
configuration, but the audio codec has no such voltage requirement (e.g.
external audio chip that consumes clk signal via clkin pin). =


In this case I would expect the clk provider driver to use whatever
performance framework is required to achieve its clk rate, but the audio
codec driver could just use the clk consumer apis like normal without
consideration for DVFS or voltage.

> =

> We have avoided the deadlock concern in Qualcomm SOCs by never having a =

> clock dependency to control a voltage rail.  This is admittedly not a =

> good general solution (although it does appear to be perfectly =

> acceptable for current SOCs that have such clock/voltage requirements).
> =

> So the question to everybody is how to manage clock-driven DVFS in a =

> safe and acceptable fashion?  Would an integrated solution in the clock =

> framework with a requirement that SOCs using it not have a =

> regulator->clock path be acceptable (it works for us at least)?

I'll repeat myself: my current frame of mind is that the clk framework
manages low level primitives and is not a good entry point for higher
level operations such as DVFS. I believe that the DVFS solution should
be a higher level framework that make calls into the clock framework,
and possibly the regulator framework or whatever.

I'm open to changing my mind on that once we've gathered some more
requirements from other SoC vendors and whatnot. But for now I don't
think adding voltage control to the clk framework is great.

Regarding the locking, if the clock framework locking is somehow broken
for your use case then maybe we need to rewrite the clock framework
locking scheme (ugh) but everything is on the table. Then again if we
consider the clk framework as a peer/sibling to the regulator framework,
and encapsulate the whole sequence in a higher level abstraction (like
genpd), then I wonder if your locking woes disappear?

Regards,
Mike

[0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D42f6284ae602469762ee721ec31ddfc6170e00bc
[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3D42f6284ae602469762ee721ec31ddfc6170e00b://lkml.org/lkml/2017/10/11=
/66 =


> =

> Thanks,
> Graham
