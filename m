Return-Path: <mturquette@baylibre.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Geert Uytterhoeven <geert@linux-m68k.org>
From: Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <CAMuHMdWdPHOhZFCnswaYoUgbDSaEAOzgN02S3vbww4QKkX69Aw@mail.gmail.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, grahamr@codeaurora.org,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Stephen Boyd <sboyd@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux PM list <linux-pm@vger.kernel.org>,
 Doug Anderson <dianders@chromium.org>, tdas@codeaurora.org,
 Rajendra Nayak <rnayak@codeaurora.org>, anischal@codeaurora.org,
 Vincent Guittot <vincent.guittot@linaro.org>, amit.kucheria@linaro.org,
 linux-clk-owner@vger.kernel.org
References: <9439bd29e3ccd5424a8e9b464c8c7bd9@codeaurora.org>
 <20180723082641.GJ1636@tbergstrom-lnx.Nvidia.com>
 <153247347784.48062.15923823598346148594@swboyd.mtv.corp.google.com>
 <20180725054400.96956.13278@harbor.lan>
 <20180725112702.GN1636@tbergstrom-lnx.Nvidia.com>
 <CAPDyKFqHNOc-KHcA-LGpyScZ54rsa-FWgJihStgW6sPmXgw07A@mail.gmail.com>
 <83d6a10252e7238f326e378957f2ff70@codeaurora.org>
 <CAPDyKFrthH5djDN=Ves0VK4GpSVWQrerqc-JC6EAkJz4U_nGQw@mail.gmail.com>
 <20180918230023.67076.42969@harbor.lan>
 <CAMuHMdWdPHOhZFCnswaYoUgbDSaEAOzgN02S3vbww4QKkX69Aw@mail.gmail.com>
Message-ID: <20180919180726.67076.48303@harbor.lan>
Subject: Re: [RFD] Voltage dependencies for clocks (DVFS)
Date: Wed, 19 Sep 2018 11:07:30 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Geert Uytterhoeven (2018-09-19 00:05:59)
> On Wed, Sep 19, 2018 at 1:01 AM Michael Turquette
> <mturquette@baylibre.com> wrote:
> > Quoting Ulf Hansson (2018-08-23 06:20:11)
> > > Anyway, in regards to control the performance state for these clock
> > > controller devices, to me it seems like there are no other way, but
> > > explicitly allow clock drivers to call an "OPP API" to request a
> > > performance state. Simply, because it's the clock driver that needs
> > > the performance state for its device. Whether the "OPP API" is the
> > > new, dev_pm_genpd_set_performance_state() or something not even
> > > invented yet, is another question.
> >
> > I completely agree, with the exception that I don't think it will be an
> > "OPP API" but instead I hope it will be some runtime pm performance api.
> >
> > > My conclusion so far is, that we seems to fall back to a potential
> > > locking problem. In regards to that, I am wondering whether that is
> > > actually more of hypothetical problem than a real problem for your
> > > case.
> >
> > For reference, this is why we allow reentrancy into the clock framework.
> > It is common that consumer A calls clk_set_rate to set clock X to a
> > rate, but in order for clock X to acheive that rate the clock provider
> > might need to call clk_set_rate on another clock. We support reentrancy
> > for this type of case.
> >
> > The problem described by Graham seems analogous. There are times when a
> > performance provider itself will need to adjust it's own performance (as
> > consumed by some other parent provider). I'm under the impression that
> > runtime pm allows reentrancy and genpd allows for nested genpds, so
> > hopefully this should Just Work.
> =

> BTW, from time to time, lockdep spews out warnings about genpd/clock
> interaction. I believe they are false positives.

I'm happy to take a look at a spew if you can capture it and tell me how
to reproduce.

Thanks,
Mike

> =

> Gr{oetje,eeting}s,
> =

>                         Geert
> =

> -- =

> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
> =

> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
