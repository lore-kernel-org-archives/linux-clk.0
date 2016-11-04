Return-Path: <sboyd@codeaurora.org>
Date: Fri, 4 Nov 2016 13:25:57 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] clk: pxa: transfer CPU clock setting from
 pxa2xx-cpufreq
Message-ID: <20161104202557.GF16026@codeaurora.org>
References: <1478122386-11467-1-git-send-email-robert.jarzmik@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1478122386-11467-1-git-send-email-robert.jarzmik@free.fr>
List-ID: <linux-clk.vger.kernel.org>

On 11/02, Robert Jarzmik wrote:
> This is the initial stage to transfer the pxa25x and pxa27x CPU clocks
> handling from cpufreq to the clock API. More precisely, the clocks
> transferred are :
>  - cpll : core pll, known also as the CPU core turbo frequency
>  - core : core, known also as the CPU actual frequency, being either the
>           CPU core turbo frequency or the CPU core run frequency
> 
> This transfer is a prequel to shrink the code in pxa2xx-cpufreq.c, so
> that it can become, at least in devicetree builds, the casual cpufreq-dt
> driver.
> 
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
> ---

Applied to clk-next

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
