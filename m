Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Michael Turquette <mturquette@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180611082037.31796-1-thierry.reding@gmail.com>
Cc: Peter De Schrijver <pdeschrijver@nvidia.com>,
 Dmitry Osipenko <digetx@gmail.com>, linux-clk@vger.kernel.org,
 linux-tegra@vger.kernel.org
References: <20180611082037.31796-1-thierry.reding@gmail.com>
Message-ID: <153109481112.143105.5323467615502166649@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: tegra: Make vde a child of pll_c3
Date: Sun, 08 Jul 2018 17:06:51 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Thierry Reding (2018-06-11 01:20:37)
> From: Thierry Reding <treding@nvidia.com>
> =

> The current default is to leave the VDE clock's parent at the default,
> which is clk_m. However, that is not a configuration that will allow the
> VDE to function. Reparent it to pll_c3 instead to make sure the hardware
> can actually decode video content.
> =

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Applied to clk-next
