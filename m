Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:22846 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932431AbeFUINO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Jun 2018 04:13:14 -0400
Subject: Re: [PATCH v2 0/4] clk: clk: Add functions to save/restore clock
 context en-masse
To: <t-kristo@ti.com>, <sboyd@kernel.org>, <tony@atomide.com>
CC: <linux-clk@vger.kernel.org>, <d-gerlach@ti.com>,
        <linux-omap@vger.kernel.org.org>, <linux-kernel@vger.kernel.org>
References: <1529568620-19765-1-git-send-email-j-keerthy@ti.com>
From: Keerthy <j-keerthy@ti.com>
Message-ID: <8d58003e-25b4-b8b1-a1ef-1cf84a3fc79f@ti.com>
Date: Thu, 21 Jun 2018 13:43:08 +0530
MIME-Version: 1.0
In-Reply-To: <1529568620-19765-1-git-send-email-j-keerthy@ti.com>
Content-Type: text/plain; charset="utf-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>



On Thursday 21 June 2018 01:40 PM, Keerthy wrote:
> Deep enough power saving mode can result into losing context of the clock
> registers also, and they need to be restored once coming back from the power
> saving mode. Hence add functions to save/restore clock context.
> 

Seems like there is an issue with one of the e-mail addresses. Sorry
about the noise will send v3 in a bit.

> Tested for DS0 on am437x-gp-evm
> 
> Based on top of linux-next
> 
> Changes in v2:
> 
>         * Renamed clk_dflt_restore to clk_gate_restore_context
> 
> Keerthy (2):
>   clk: clk: Add clk_gate_restore_context function
>   soc: ti: pm33xx: Save/restore clk context based on enable_off_mode
>     setting
> 
> Russ Dill (2):
>   clk: clk: Add functions to save/restore clock context en-masse
>   clk: ti: Add functions to save/restore clk context
> 
>  arch/arm/mach-omap2/pm33xx-core.c    |  15 +++++
>  drivers/clk/clk.c                    |  93 ++++++++++++++++++++++++++
>  drivers/clk/ti/clock.h               |   2 +
>  drivers/clk/ti/divider.c             |  36 ++++++++++
>  drivers/clk/ti/dpll.c                |   6 ++
>  drivers/clk/ti/dpll3xxx.c            | 124 +++++++++++++++++++++++++++++++++++
>  drivers/clk/ti/gate.c                |   3 +
>  drivers/clk/ti/mux.c                 |  29 ++++++++
>  drivers/soc/ti/pm33xx.c              |  13 ++++
>  include/linux/clk-provider.h         |   9 +++
>  include/linux/clk.h                  |  25 +++++++
>  include/linux/clk/ti.h               |   6 ++
>  include/linux/platform_data/pm33xx.h |   1 +
>  13 files changed, 362 insertions(+)
> 
