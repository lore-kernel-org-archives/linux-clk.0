Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Aapo Vienamo <avienamo@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531396382-5579-2-git-send-email-avienamo@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aapo Vienamo <avienamo@nvidia.com>
References: <1531396382-5579-1-git-send-email-avienamo@nvidia.com>
 <1531396382-5579-2-git-send-email-avienamo@nvidia.com>
Message-ID: <153255140774.48062.4242502150376707649@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v6 1/4] clk: tegra: Fix includes required by fence_udelay()
Date: Wed, 25 Jul 2018 13:43:27 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Aapo Vienamo (2018-07-12 04:52:59)
> Add the missing linux/delay.h include statement for udelay() used by
> fence_udelay() macro.
> =

> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>
> Acked-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Applied to clk-next
