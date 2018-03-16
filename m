Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Mike Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <a64f8f5e-2d6b-a277-17cc-4c6102dc7aaa@samsung.com>
Cc: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>
References: <CGME20180315190219epcas1p364b2b0777c6f60c55a60119ea3d16480@epcas1p3.samsung.com>
 <a64f8f5e-2d6b-a277-17cc-4c6102dc7aaa@samsung.com>
Message-ID: <152122345522.70929.15804290996122965031@swboyd.mtv.corp.google.com>
Subject: Re: [GIT PULL] clk/samsung updates for 4.17
Date: Fri, 16 Mar 2018 11:04:15 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Sylwester Nawrocki (2018-03-15 12:02:15)
> =

> Hi Stephen, Mike,
> =

> The following changes since commit 7928b2cbe55b2a410a0f5c1f154610059c57b1=
b2:
> =

>   Linux 4.16-rc1 (2018-02-11 15:04:29 -0800)
> =

> are available in the git repository at:
> =

>   git://git.kernel.org/pub/scm/linux/kernel/git/snawrocki/clk.git tags/cl=
k-v4.17-samsung
> =

> for you to fetch changes up to 182c084da5d1e4d7c02d913de154cf5167521580:
> =

>   clk: samsung: Add fout=3D196608001 Hz EPLL rate entry for exynos4412 (2=
018-03-15 19:27:29 +0100)
> =

> ----------------------------------------------------------------
> clk/samsung updates for v4.17
> =

> This change set includes the PLL rate definition fixes and an addition
> of compile time PLL rate validation macros. It adds definitions of some
> missing clocks and extends the PLL rate tables required in the sound
> subsystem.
> In order to handle dependencies of clocks on the power domains a clock
> provider sub-driver is added for Exynos5 SoCs. In newer Exynos SoCs
> there is no need to do such things as the clocks/power domain relations
> are more clearly defined and better documented.
> =


Thanks. Pulled into clk-next. I also threw a patch on top to fix some
sparse warnings that came out when I compile tested stuff.
