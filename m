Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:12424 "EHLO
        hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933433AbeBLMeS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Feb 2018 07:34:18 -0500
Date: Mon, 12 Feb 2018 14:34:11 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Mikko Perttunen <cyndis@kapsi.fi>
CC: <jonathanh@nvidia.com>, <linux-tegra@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] MBIST work around (WAR) for Tegra210
Message-ID: <20180212123411.GJ5850@tbergstrom-lnx.Nvidia.com>
References: <1516888813-32180-1-git-send-email-pdeschrijver@nvidia.com>
 <a40f0593-24d8-a91e-9f8c-f7eafc379591@kapsi.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <a40f0593-24d8-a91e-9f8c-f7eafc379591@kapsi.fi>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Mon, Feb 12, 2018 at 02:05:36PM +0200, Mikko Perttunen wrote:
> This seems to cause a system hang with an HDMI monitor attached -
> likely in unpowergate as if I disable powergating the hang doesn't
> happen.
> 
> Have you tested with a display attached?
> 

Yes. A DSI display at least seems to work.

Peter.

> Mikko
> 
> On 01/25/2018 04:00 PM, Peter De Schrijver wrote:
> >This patch series introduces the Memory Built-In Self Test (MBIST)
> >work around (WAR) needed when power ungating certain domains. More
> >details can be found in 'clk: tegra: MBIST WAR for Tegra210'. I choose to
> >implement the WAR in the Tegra210 clock driver, because most accesses are
> >to CAR registers and for the VENC domain, we need to make sure the CSI
> >clock source is not changed during the WAR execution.
> >
> >Changes in v4:
> >* moved locking and clock control to tegra210_clk_handle_mbist_war()
> >* propagate errors during WAR execution to user
> >* rework error handling tegra210_mbist_clk_init() slightly
> >
> >Changes in v3:
> >* fix compile problem on non-Tegra210 platforms
> >* fix clock handling bug in tegra210_generic_mbist_war()
> >* addressed minor comments
> >
> >Changes in v2:
> >* Use readl for fence_delay() rather than readl_relaxed
> >* clarify MBIST and WAR acronyms
> >
> >Peter De Schrijver (4):
> >   clk: tegra: Add la clock for Tegra210
> >   clk: tegra: add fence_delay for clock registers
> >   clk: tegra: MBIST work around for Tegra210
> >   soc/tegra: pmc: MBIST work around for Tegra210
> >
> >  drivers/clk/tegra/clk-tegra210.c         | 357 ++++++++++++++++++++++++++++++-
> >  drivers/clk/tegra/clk.h                  |   7 +
> >  drivers/soc/tegra/pmc.c                  |   7 +
> >  include/dt-bindings/clock/tegra210-car.h |   2 +-
> >  include/linux/clk/tegra.h                |   6 +
> >  5 files changed, 376 insertions(+), 3 deletions(-)
> >
