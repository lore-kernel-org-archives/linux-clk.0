Return-Path: <jonathanh@nvidia.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v4.15-rc1
To: Thierry Reding <thierry.reding@gmail.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>
CC: <linux-clk@vger.kernel.org>, <linux-tegra@vger.kernel.org>
References: <20171020121412.10527-1-thierry.reding@gmail.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <6f5cfeeb-cdff-b390-4c09-77e460a9f793@nvidia.com>
Date: Fri, 20 Oct 2017 17:00:29 +0100
MIME-Version: 1.0
In-Reply-To: <20171020121412.10527-1-thierry.reding@gmail.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>

Thierry,

On 20/10/17 13:14, Thierry Reding wrote:
> Hi Michael, Stephen,
> 
> The following changes since commit 2bd6bf03f4c1c59381d62c61d03f6cc3fe71f66e:
> 
>   Linux 4.14-rc1 (2017-09-16 15:47:51 -0700)
> 
> are available in the git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-4.15-clk
> 
> for you to fetch changes up to e4e2519df9928ae923205759176599969f344cd4:
> 
>   clk: tegra: Use readl_relaxed_poll_timeout_atomic() in tegra210_clock_init() (2017-10-20 13:37:45 +0200)
> 
> Note that this pulls in parts from two other tags that are going to go
> in via the ARM SoC tree. Those are needed to a couple of resolve build
> dependencies.
> 
> Thanks,
> Thierry
> 
> ----------------------------------------------------------------
> clk: tegra: Changes for v4.15-rc1
> 
> This contains cleanups and minor fixes for the Tegra clock driver.
> 
> ----------------------------------------------------------------
> Bhumika Goyal (1):
>       clk: tegra: Make tegra_clk_pll_params __ro_after_init
> 
> Dmitry Osipenko (4):
>       clk: tegra: Add AHB DMA clock entry
>       clk: tegra: Correct parent of the APBDMA clock

I noticed that -next is not currently booting on most Tegra boards and
it appears that the above commit has exposed a problem where pclk can
get turned off incorrectly. I have discussed with Peter and he has
identified a simple fix. I have ran out of time today, but can send a
patch on Monday. Can we sort this out next week and re-send this pull
request?

Cheers
Jon

-- 
nvpublic
