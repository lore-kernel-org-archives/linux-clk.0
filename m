Return-Path: <s.nawrocki@samsung.com>
Subject: Re: [PATCH 13/41] clk: samsung: Remove CLK_IS_ROOT
To: Stephen Boyd <sboyd@codeaurora.org>,
 Michael Turquette <mturquette@baylibre.com>
References: <1456858826-28541-1-git-send-email-sboyd@codeaurora.org>
 <1456858826-28541-14-git-send-email-sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
From: Sylwester Nawrocki <s.nawrocki@samsung.com>
Message-id: <56D6BFDD.7020404@samsung.com>
Date: Wed, 02 Mar 2016 11:26:37 +0100
MIME-version: 1.0
In-reply-to: <1456858826-28541-14-git-send-email-sboyd@codeaurora.org>
Content-type: text/plain; charset=windows-1252
List-ID: <linux-clk.vger.kernel.org>

On 03/01/2016 07:59 PM, Stephen Boyd wrote:
> This flag is a no-op now. Remove usage of the flag.
> 
> Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>
> Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
> ---
>  drivers/clk/samsung/clk-exynos4.c    | 12 +++---
>  drivers/clk/samsung/clk-exynos4415.c |  2 +-
>  drivers/clk/samsung/clk-exynos5250.c | 10 ++---
>  drivers/clk/samsung/clk-exynos5260.c | 36 ++++++++----------
>  drivers/clk/samsung/clk-exynos5420.c | 12 +++---
>  drivers/clk/samsung/clk-exynos5433.c | 74 +++++++++++++++++-------------------
>  drivers/clk/samsung/clk-exynos5440.c | 12 +++---
>  drivers/clk/samsung/clk-exynos7.c    | 12 +++---
>  drivers/clk/samsung/clk-s3c2410.c    |  2 +-
>  drivers/clk/samsung/clk-s3c2412.c    |  4 +-
>  drivers/clk/samsung/clk-s3c2443.c    |  8 ++--
>  drivers/clk/samsung/clk-s3c64xx.c    |  8 ++--
>  drivers/clk/samsung/clk-s5pv210.c    | 10 ++---
>  13 files changed, 95 insertions(+), 107 deletions(-)

Acked-by: Sylwester Nawrocki <s.nawrocki@samsung.com>
