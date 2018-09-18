Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Ulf Hansson <ulf.hansson@linaro.org>, grahamr@codeaurora.org
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAPDyKFrthH5djDN=Ves0VK4GpSVWQrerqc-JC6EAkJz4U_nGQw@mail.gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, Taniya Das <tdas@codeaurora.org>,
 Rajendra Nayak <rnayak@codeaurora.org>,
 Amit Nischal <anischal@codeaurora.org>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Amit Kucheria <amit.kucheria@linaro.org>, linux-clk-owner@vger.kernel.org
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <CAPDyKFo-Z=H2mJXm7mN0Mt=iRzOaEuJSXc2gdE4i5NEfZ_OM6A@mail.gmail.com>
 <153210674909.48062.14786835684020975508@swboyd.mtv.corp.google.com>
 <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
 <153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
 <20180725054400.96956.13278@harbor.lan>
 <20180725112702.GN1636@tbergstrom-lnx.Nvidia.com>
 <CAPDyKFqHNOc-KHcA-LGpyScZ54rsa-FWgJihStgW6sPmXgw07A@mail.gmail.com>
 <83d6a10252e7238f326e378957f2ff70@codeaurora.org>
 <CAPDyKFrthH5djDN=Ves0VK4GpSVWQrerqc-JC6EAkJz4U_nGQw@mail.gmail.com>
Message-ID: <20180918230023.67076.42969@harbor.lan>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Date: Tue, 18 Sep 2018 16:00:23 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Ulf Hansson (2018-08-23 06:20:11)
> On 31 July 2018 at 22:02,  <grahamr@codeaurora.org> wrote:
> > I have two significant concerns with using a wrapper framework to suppo=
rt
> > DVFS.  The first may be Qualcomm-specific, and more of a practical conc=
ern
> > rather than a principled one.  We (clock driver owners) get
> > voltage/frequency operating points from the clock controller designers =
in a
> > single data-set, it is not information that is provided to or coming fr=
om
> > the clock consumer hardware or software teams.  Tracking, updating, and
> > debugging frequency/voltage mismatches falls completely into the clock =
team,
> > so moving the responsibility of handling the relationship in code to the
> > consumer would be a disaster (SDM845 has almost 200 clock domains and o=
ver
> > 800 clock branches - not all controlled by Linux but a large proportion
> > are).  It would mean all clock consumers using any clk_set_rate or
> > clk_enable APIs would need to make the appropriate voltage requests as =
well
> > - and even if they could look up the required voltage based on frequency
> > from some central location (which I expect would be delivered and maint=
ained
> > by the clock driver team) the chance that everyone would do that correc=
tly
> > is, frankly, zero.  The types of problems that arise from under-volting=
 a
> > clock generator or consumer are very hard to debug (since it can essent=
ially
> > result in random behavior).
> =

> Okay, I see.
> =

> Wouldn't a nice script that does a search/replace work out? :-)
> =

> >
> > My second concern is that we do have voltage requirements coming from t=
he
> > clock controller itself, not related to the clock consumer.  The clock
> > hardware components themselves (PLLs, muxes, etc) require voltage levels
> > that may differ from that of the final consumer of the output clock.  We
> > could hack all these requirements into the frequency/voltage tuple table
> > that consumers look up, but at that point we have diverged fairly
> > dramatically from Stephen's principle that the clock framework should n=
ot
> > directly require any voltage - fundamentally they do (at least ours do).
> =

> This changes my view, as I didn't know about these kind of cases.
> =

> First, it seems like you need to associate a struct device with the
> clock controller, such that it can be attached to its corresponding PM
> domain (genpd). Of course, then you also needs to deploy runtime PM
> support for the clock driver for this clock controller device. Do note
> that runtime PM is already supported by the clock core, so should be
> trivial. Why, because this is needed to properly allow genpd to
> aggregates the votes for the PM domain(s), in case there are other
> devices in the same PM domain (or if there are dependencies to
> subdomains).

Your struct device can be considered as Done. Stephen and I have been
forcing clock driver authors to write proper platform drivers for a
while now.

> =

> Also, if I am not mistaken, the runtime PM enablement is something
> that is already being used (or at least tried out) for some Exynos
> clock drivers. I recall there were some discussions around locking
> issues around the runtime PM support in the clock core. Let me see if
> can search the mail archive to see if I find out if/what went wrong, I
> will come back to this.

This was mostly related to idle power management issues, but yes there
is some basic runtime pm awareness in the clock framework.

> =

> Anyway, in regards to control the performance state for these clock
> controller devices, to me it seems like there are no other way, but
> explicitly allow clock drivers to call an "OPP API" to request a
> performance state. Simply, because it's the clock driver that needs
> the performance state for its device. Whether the "OPP API" is the
> new, dev_pm_genpd_set_performance_state() or something not even
> invented yet, is another question.

I completely agree, with the exception that I don't think it will be an
"OPP API" but instead I hope it will be some runtime pm performance api.

> =

> My conclusion so far is, that we seems to fall back to a potential
> locking problem. In regards to that, I am wondering whether that is
> actually more of hypothetical problem than a real problem for your
> case.

For reference, this is why we allow reentrancy into the clock framework.
It is common that consumer A calls clk_set_rate to set clock X to a
rate, but in order for clock X to acheive that rate the clock provider
might need to call clk_set_rate on another clock. We support reentrancy
for this type of case.

The problem described by Graham seems analogous. There are times when a
performance provider itself will need to adjust it's own performance (as
consumed by some other parent provider). I'm under the impression that
runtime pm allows reentrancy and genpd allows for nested genpds, so
hopefully this should Just Work.

> =

> > Our most recent patch that Taniya posted has gone in the direction simi=
lar
> > to Tegra - instead of having the framework handle it, we use prepare and
> > set_rate hooks to implement voltage (corner) voting in the qcom drivers=
 via
> > the new genpd.  This is not fully proven yet but is so far working well=
 and
> > will likely be our internal solution going forward if the framework
> > consensus is to force consumers to manage their frequency-based voltage
> > requirements themselves - I just do not see that as a practical solutio=
n for
> > a complicated SoC with a large, highly distributed, clock tree.  That b=
eing
> > said I do see potential future deadlock race conditions between clk and
> > genpd which concern me - it remains a downside of that coupling.
> >
> > Would there be some way to prevent consumers from directly calling
> > clk_set_rate or clk_enable and force them to go via another framework f=
or
> > these calls?  It would at least prevent people from using the "wrong"
> > interface and bypassing voltage requirements.  That of course means hav=
ing
> > to mirror any of the clk APIs that update clock state into genpd/opp, w=
hich
> > Stephen finds distasteful (and I agree).
> =

> I am not sure about this. Sound like an awful wrapper API.

Yeah, overloading the prepare callbacks is just a symptom of the greater
problem: we don't have a real DVFS api.

Regards,
Mike

> =

> However, what Mike seems to express the need for, is a common consumer
> OPP API to set a performance state for a device, but also a way to to
> allow SoC specific performance state providers to manage the backend
> parts of actually changing the performance state.
> =

> I am wondering whether this could be a way forward, maybe not exactly
> what you was looking for, but perhaps it can address your concerns?
> =

> [...]
> =

> Kind regards
> Uffe
