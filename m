Return-Path: <sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
To: Aapo Vienamo <avienamo@nvidia.com>,
 Peter De Schrijver <pdeschrijver@nvidia.com>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <1531138660-9071-1-git-send-email-avienamo@nvidia.com>
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
 Aapo Vienamo <avienamo@nvidia.com>
References: <1531138660-9071-1-git-send-email-avienamo@nvidia.com>
Message-ID: <153114852903.143105.5065461144159249219@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v3 1/4] clk: tegra: Fix includes required by fence_udelay()
Date: Mon, 09 Jul 2018 08:02:09 -0700
List-ID: <linux-clk.vger.kernel.org>

Quoting Aapo Vienamo (2018-07-09 05:17:37)
> Add the missing linux/delay.h include statement for udelay() used by
> fence_udelay() macro.
> =

> Signed-off-by: Aapo Vienamo <avienamo@nvidia.com>

Please send cover letters for multi-patch series, and always include a
change log indicating what changed between versions of the series.
