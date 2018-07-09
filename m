Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Dmitry Osipenko <digetx@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>,
 Prashant Gaikwad <pgaikwad@nvidia.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180603224805.495-1-digetx@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20180603224805.495-1-digetx@gmail.com>
Message-ID: <153109498169.143105.9808940703939118816@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v1] clk: tegra: Mark Memory Controller clock as critical
Date: Sun, 08 Jul 2018 17:09:41 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Dmitry Osipenko (2018-06-03 15:48:05)
> Memory Controller should be always-on. Currently the sibling EMC clock is
> marked as critical, let's mark MC clock too for consistency.
> =

> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---

Applied to clk-next
