Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate16.nvidia.com ([216.228.121.65]:17275 "EHLO
        hqemgate16.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751409AbeAZJhk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 26 Jan 2018 04:37:40 -0500
Subject: Re: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
To: Peter De Schrijver <pdeschrijver@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
From: Jon Hunter <jonathanh@nvidia.com>
Message-ID: <839ae776-65b4-88bd-48d2-96b21d97d9e6@nvidia.com>
Date: Fri, 26 Jan 2018 09:37:35 +0000
MIME-Version: 1.0
In-Reply-To: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>


On 25/01/18 14:00, Peter De Schrijver wrote:
> This patch series introduces the Memory Built-In Self Test (MBIST)
> work around (WAR) needed when power ungating certain domains. More
> details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
> implement the WAR in the Tegra210 clock driver, because most accesses are
> to CAR registers and for the VENC domain, we need to make sure the CSI
> clock source is not changed during the WAR execution.
> 
> Changes in v4:
> * moved locking and clock control to tegra210_clk_handle_mbist_war()
> * propagate errors during WAR execution to user
> * rework error handling tegra210_mbist_clk_init() slightly
> 
> Changes in v3:
> * fix compile problem on non-Tegra210 platforms
> * fix clock handling bug in tegra210_generic_mbist_war()
> * addressed minor comments
> 
> Changes in v2:
> * Use readl for fence_delay() rather than readl_relaxed
> * clarify MBIST and WAR acronyms
> 
> Peter De Schrijver (4):
>   clk: tegra: Add la clock for Tegra210
>   clk: tegra: add fence_delay for clock registers
>   clk: tegra: MBIST work around for Tegra210
>   soc/tegra: pmc: MBIST work around for Tegra210
> 
>  drivers/clk/tegra/clk-tegra210.c         | 357 ++++++++++++++++++++++++++++++-
>  drivers/clk/tegra/clk.h                  |   7 +
>  drivers/soc/tegra/pmc.c                  |   7 +
>  include/dt-bindings/clock/tegra210-car.h |   2 +-
>  include/linux/clk/tegra.h                |   6 +
>  5 files changed, 376 insertions(+), 3 deletions(-)

For the series ...

Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
Tested-by: Jon Hunter <jonathanh@nvidia.com>

Cheers
Jon

-- 
nvpublic
