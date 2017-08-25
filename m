Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from us01smtprelay-2.synopsys.com ([198.182.47.9]:43941 "EHLO
        smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754613AbdHYSQo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Aug 2017 14:16:44 -0400
Subject: Re: [PATCH v4] ARC: clk: introduce HSDK pll driver
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-snps-arc@lists.infradead.org"
        <linux-snps-arc@lists.infradead.org>
References: <20170825173914.32121-1-Eugeniy.Paltsev@synopsys.com>
From: Vineet Gupta <Vineet.Gupta1@synopsys.com>
Message-ID: <808b0f38-f899-268a-94f9-f73885896b5d@synopsys.com>
Date: Fri, 25 Aug 2017 11:16:35 -0700
MIME-Version: 1.0
In-Reply-To: <20170825173914.32121-1-Eugeniy.Paltsev@synopsys.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On 08/25/2017 10:39 AM, Eugeniy Paltsev wrote:
> HSDK board manages its clocks using various PLLs. These PLL have same
> dividers and corresponding control registers mapped to different addresses.
> So we add one common driver for such PLLs.
>
> Each PLL on HSDK board consists of three dividers: IDIV, FBDIV and
> ODIV. Output clock value is managed using these dividers.
>
> We add pre-defined tables with supported rate values and appropriate
> configurations of IDIV, FBDIV and ODIV for each value.
>
> As of today we add support for PLLs that generate clock for the
> HSDK arc cpus, system, ddr, AXI tunnel and hdmi.
>
> By this patch we add support for several plls (arc cpus pll and others),
> so we had to use two different init types: CLK_OF_DECLARE for arc cpus pll
> and regular probing for others plls.
>
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> ---
> Changes v3 -> v4:
>   * Rename HSDKv1 to HSDK
>
> Changes v2 -> v3:
>   * Add special management of arc core interface divider.
>
> Changes v1 -> v2:
>   * Remove all MODULE* defines as this driver can't be build as module.
>   * Simplified hsdk_pll_is_err and hsdk_pll_is_locked functions.
>   * Use unsigned long fo best_rate in hsdk_pll_round_rate.
>   * Use of_clk_get_parent_count to get num_parents.
>   * Other small changes.
>
>   .../bindings/clock/snps,hsdk-pll-clock.txt         |  28 ++
>   MAINTAINERS                                        |   6 +
>   drivers/clk/Kconfig                                |   7 +
>   drivers/clk/Makefile                               |   1 +
>   drivers/clk/clk-hsdk-pll.c                         | 431 +++++++++++++++++++++
>   5 files changed, 473 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/snps,hsdk-pll-clock.txt
>   create mode 100644 drivers/clk/clk-hsdk-pll.c

Reviewed-by: Vineet Gupta <vgupta@synopsys.com>

P.S. Stephen I'd be nice if this can make it into 4.14 as we are slated to add the 
hasdk platform support in there.

Thx,
-Vineet
