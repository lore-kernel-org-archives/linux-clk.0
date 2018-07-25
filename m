Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Aapo Vienamo <avienamo@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531396382-5579-3-git-send-email-avienamo@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aapo Vienamo <avienamo@nvidia.com>
References: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
 <1531396382-5579-3-git-send-email-avienamo@nvidia.com>
Message-ID: <153255146921.48062.14760155393216024736@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v6 2/4] clk: tegra: Refactor fractional divider calculation
Date: Wed, 25 Jul 2018 13:44:29 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Aapo Vienamo (2018-07-12 04:53:00)
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> =

> Move this to a separate file so it can be used to calculate the sdmmc
> clock dividers.
> =

> Signed-off-by: Peter De-Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Applied to clk-next
