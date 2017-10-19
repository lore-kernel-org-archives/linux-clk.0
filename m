Return-Path: <nicoleotsuka@gmail.com>
Return-Path: <nicoleotsuka@gmail.com>
Date: Thu, 19 Oct 2017 02:29:20 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: thierry.reding@gmail.com, sboyd@codeaurora.org, pdeschrijver@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-clk@vger.kernel.org, jonathanh@nvidia.com,
	mturquette@baylibre.com, pgaikwad@nvidia.com
Subject: Re: [PATCH v2] clk: tegra: Use readl_relaxed_poll_timeout_atomic in
 tegra210_clock_init
Message-ID: <20171019092919.GA7252@Asurada>
References: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1505502613-11801-1-git-send-email-nicoleotsuka@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On Fri, Sep 15, 2017 at 12:10:13PM -0700, Nicolin Chen wrote:
> Below is the call trace of tegra210_init_pllu() function:
>   start_kernel()
>   -> time_init()
>   --> of_clk_init()
>   ---> tegra210_clock_init()
>   ----> tegra210_pll_init()
>   -----> tegra210_init_pllu()
> 
> Because the preemption is disabled in the start_kernel before calling
> time_init, tegra210_init_pllu is actually in an atomic context while
> it includes a readl_relaxed_poll_timeout that might sleep.
> 
> So this patch just changes this readl_relaxed_poll_timeout() to its
> atomic version.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Acked-By: Peter De Schrijver <pdeschrijver@nvidia.com>

Thierry, can you also take a look at this one? I sent a month ago. Thanks.
