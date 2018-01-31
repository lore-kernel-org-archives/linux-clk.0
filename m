Return-Path: <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 0/6] Tegra210 DFLL implementation
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
	<linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<mturquette@baylibre.com>, <sboyd@codeaurora.org>
References: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <31e9aad3-bb3d-2475-4fa7-3ecf43dc2f9e@nvidia.com>
Date: Wed, 31 Jan 2018 11:28:31 +0000
MIME-Version: 1.0
In-Reply-To: <1516797938-32044-1-git-send-email-pdeschrijver@nvidia.com>
Return-Path: jonathanh@nvidia.com
Content-Type: text/plain; charset="utf-8"
List-ID: <linux-clk.vger.kernel.org>


On 24/01/18 12:45, Peter De Schrijver wrote:
> This series introduces support for the DFLL as a CPU clock source
> on Tegra210. As Jetson TX2 uses a PWM controlled regulator IC which
> is driven directly by the DFLLs PWM output, we also introduce support
> for PWM regulators next to I2C controlled regulators. The DFLL output
> frequency is directly controlled by the regulator voltage. The registers
> for controlling the PWM are part of the DFLL IP block, so there's no
> separate linux regulator object involved because the regulator IC only
> supplies the rail powering the DFLL and the CPUs. It doesn't have any
> other controls.
> 
> Changes since v1:
> * improved commit messages
> * some style cleanups
> 
> Peter De Schrijver (6):
>   clk: tegra: dfll registration for multiple SoCs
>   clk: tegra: DT align parameter for CVB calculation
>   clk: tegra: add CVB tables for Tegra210 CPU DFLL
>   clk: tegra: dfll: support PWM regulator control
>   clk: tegra: build clk-dfll.c for Tegra124 and Tegra210
>   cpufreq: tegra124-cpufreq: extend to support Tegra210
> 
>  drivers/clk/tegra/Kconfig                  |   5 +
>  drivers/clk/tegra/Makefile                 |   2 +-
>  drivers/clk/tegra/clk-dfll.c               | 481 +++++++++++++++++++++++-----
>  drivers/clk/tegra/clk-dfll.h               |   7 +
>  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 492 ++++++++++++++++++++++++++++-
>  drivers/clk/tegra/cvb.c                    |  18 +-
>  drivers/clk/tegra/cvb.h                    |   6 +-
>  drivers/cpufreq/tegra124-cpufreq.c         |  13 +-
>  8 files changed, 920 insertions(+), 104 deletions(-)

This series appears to be missing DT documentation and DT source changes?

Cheers
Jon

-- 
nvpublic
