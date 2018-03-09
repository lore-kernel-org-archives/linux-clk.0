Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180212160903.GA4287@ulmo>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>, jonathanh@nvidia.com,
 linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org
References: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
 <20180212160903.GA4287@ulmo>
Message-ID: <152061995415.26240.7042528449566855659@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
Date: Fri, 09 Mar 2018 10:25:54 -0800
List-ID: <linux-clk.vger.kernel.org>

Quoting Thierry Reding (2018-02-12 08:09:03)
> On Thu, Jan 25, 2018 at 04:00:09PM +0200, Peter De Schrijver wrote:
> > This patch series introduces the Memory Built-In Self Test (MBIST)
> > work around (WAR) needed when power ungating certain domains. More
> > details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose =
to
> > implement the WAR in the Tegra210 clock driver, because most accesses a=
re
> > to CAR registers and for the VENC domain, we need to make sure the CSI
> > clock source is not changed during the WAR execution.
> > =

> > Changes in v4:
> > * moved locking and clock control to tegra210_clk_handle_mbist_war()
> > * propagate errors during WAR execution to user
> > * rework error handling tegra210_mbist_clk_init() slightly
> > =

> > Changes in v3:
> > * fix compile problem on non-Tegra210 platforms
> > * fix clock handling bug in tegra210_generic_mbist_war()
> > * addressed minor comments
> > =

> > Changes in v2:
> > * Use readl for fence_delay() rather than readl_relaxed
> > * clarify MBIST and WAR acronyms
> > =

> > Peter De Schrijver (4):
> >   clk: tegra: Add la clock for Tegra210
> >   clk: tegra: add fence_delay for clock registers
> >   clk: tegra: MBIST work around for Tegra210
> >   soc/tegra: pmc: MBIST work around for Tegra210
> > =

> >  drivers/clk/tegra/clk-tegra210.c         | 357 +++++++++++++++++++++++=
+++++++-
> >  drivers/clk/tegra/clk.h                  |   7 +
> >  drivers/soc/tegra/pmc.c                  |   7 +
> >  include/dt-bindings/clock/tegra210-car.h |   2 +-
> >  include/linux/clk/tegra.h                |   6 +
> >  5 files changed, 376 insertions(+), 3 deletions(-)
> =

> Hi Mike, Stephen,
> =

> since there's a dependency from patch 4 to patch 3 in the series, do you
> mind if I take this in via the Tegra tree? I can send out a pull request
> for the clock branch sometime later in the release cycle and pick up any
> other Tegra clock related patches that may show up in the meantime.
> =


Ok.
