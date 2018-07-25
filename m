Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Aapo Vienamo <avienamo@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531396382-5579-5-git-send-email-avienamo@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aapo Vienamo <avienamo@nvidia.com>
References: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
 <1531396382-5579-5-git-send-email-avienamo@nvidia.com>
Message-ID: <153255410351.48062.11833312173486670153@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v6 4/4] clk: tegra: make sdmmc2 and sdmmc4 as sdmmc clocks
Date: Wed, 25 Jul 2018 14:28:23 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Aapo Vienamo (2018-07-12 04:53:02)
> From: Peter De-Schrijver <pdeschrijver@nvidia.com>
> =

> These clocks have low jitter paths to certain parents. To model these
> correctly, use the sdmmc mux divider clock type.
> =

> Signed-off-by: Peter De-Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> ---

Applied to clk-next
