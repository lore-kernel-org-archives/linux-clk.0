Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:2484 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727790AbeGZJfI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jul 2018 05:35:08 -0400
Date: Thu, 26 Jul 2018 11:19:20 +0300
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Stephen Boyd <sboyd@kernel.org>
CC: Jon Hunter <jonathanh@nvidia.com>, <linux-clk@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <thierry.reding@gmail.com>
Subject: Re: [PATCH v2 2/2] clk: tegra: Correct clk_out_mux parents
Message-ID: <20180726081920.GQ1636@tbergstrom-lnx.Nvidia.com>
References: <1532010175-28364-1-git-send-email-pdeschrijver@nvidia.com>
 <1532010175-28364-3-git-send-email-pdeschrijver@nvidia.com>
 <b34c2624-7a55-331e-4462-bb3265f411b5@nvidia.com>
 <153255869581.48062.10244129990637940083@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <153255869581.48062.10244129990637940083@swboyd.mtv.corp.google.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Jul 25, 2018 at 03:44:55PM -0700, Stephen Boyd wrote:
> Quoting Jon Hunter (2018-07-19 08:06:50)
> > 
> > On 19/07/18 15:22, Peter De Schrijver wrote:
> > > The first 3 possible parents of clk_out_[1-3] are defined as clk_m, clk_m/2
> > > and clk_m/4. However They are actually osc, osc/2 and osc/4. In chips prior
> > > to Tegra210 clk_m and osc had the same frequency, so this difference didn't
> > > matter. Since Tegra210 however, clk_m is a divided version of osc. This
> > > results in CCF reporting the rate as only half the actual rate on Tegra210.
> > > To fix this, we add new clocks which have osc, osc/2, osc/4 and the
> > > respective extern clock as their possible parents and use them for
> > > Tegra210. Also 2 new DT clock defines are added to reflect the new
> > > names of clk_m/2 and clk_m/4. The old defines are still kept for backwards
> > > compatibility.
> > > 
> > > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> > I gave this a whirl on the Tegra210 Smaug which uses the PMC CLK_OUT1 to
> > clock the audio codec, but unfortunately this did not work. The good news
> > is that I know why. Basically, for Tegra210 there is a slight change in the
> > behaviour of the CLKx_ACCEPT_REQ bit. Essentially, this bit must always be
> > set if you want to use any of the osc clocks to drive the CLK_OUTx. Setting
> > this bit does not effect the CLK_OUTx if you are using the CAR to drive the
> > pin. The simplest thing to do for Tegra210 is to always set the
> > CLKx_ACCEPT_REQ. 
> > 
> 
> So resend with that bit also set?
> 

We haven't figured out who should set this bit as it has some other
side-effects like overriding the pinmux settings. Also not all CLK_OUT
clocks appear to behave the same way.

Peter.
