Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180611081853.31474-1-thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20180611081853.31474-1-thierry.reding@gmail.com>
Message-ID: <153109471999.143105.10010542571376674298@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: tegra: Make vic03 a child of pll_c3
Date: Sun, 08 Jul 2018 17:05:19 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Thierry Reding (2018-06-11 01:18:53)
> From: Thierry Reding <treding@nvidia.com>
> =

> By default, the vic03 clock is a child of pll_m but that runs at 924 MHz
> which is too fast for VIC. Make vic03 a child of pll_c3 by default so it
> will run at a supported frequency.
> =

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next
