Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@codeaurora.org>,
 Thierry Reding <thierry.reding@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180531084531.25421-1-thierry.reding@gmail.com>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20180531084531.25421-1-thierry.reding@gmail.com>
Message-ID: <152787484401.144038.7551622687822665492@swboyd.mtv.corp.google.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.18-rc1
Date: Fri, 01 Jun 2018 10:40:44 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Thierry Reding (2018-05-31 01:45:31)
> Hi Michael, Stephen,
> =

> The following changes since commit 60cc43fc888428bb2f18f08997432d426a2433=
38:
> =

>   Linux 4.17-rc1 (2018-04-15 18:24:20 -0700)
> =

> are available in the Git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegr=
a-for-4.18-clk
> =

> for you to fetch changes up to 5d797111afe12e488e08432fd9b372fae2cc7e93:
> =

>   clk: tegra: Add quirk for getting CDEV1/2 clocks on Tegra20 (2018-05-18=
 12:35:28 +0200)

Thanks. Pulled into clk-next.

> =

> Thanks,
> Thierry
> =

> ----------------------------------------------------------------
> clk: tegra: Changes for v4.18-rc1
> =

> Contains a proper implementation of the CDEV1/2 clocks on Tegra20.
> =

> ----------------------------------------------------------------
> Dmitry Osipenko (3):
>       clk: tegra20: Add DEV1/DEV2 OSC dividers
>       clk: tegra20: Correct parents of CDEV1/2 clocks
>       clk: tegra: Add quirk for getting CDEV1/2 clocks on Tegra20

We have a long standing issue to resolve in CCF by returning
EPROBE_DEFER from clk_get on clks that are orphaned. I'm going to merge
the framework patch into clk-next after the next rc1 and see what blows
up. Hopefully that makes this tegra specific patch irrelevant.
