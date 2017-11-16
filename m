Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from hqemgate14.nvidia.com ([216.228.121.143]:7778 "EHLO
        hqemgate14.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759344AbdKPL1Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Nov 2017 06:27:24 -0500
Date: Thu, 16 Nov 2017 13:27:19 +0200
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <linux-tegra@vger.kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [PATCH 2/4] clk: tegra: add fence_delay for clock registers
Message-ID: <20171116112719.GO6210@tbergstrom-lnx.Nvidia.com>
References: <1510313868-24810-1-git-send-email-pdeschrijver@nvidia.com>
 <1510313868-24810-3-git-send-email-pdeschrijver@nvidia.com>
 <20171115004132.GM11955@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
In-Reply-To: <20171115004132.GM11955@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Tue, Nov 14, 2017 at 04:41:32PM -0800, Stephen Boyd wrote:
> On 11/10, Peter De Schrijver wrote:
> > Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Some commit text perhaps explaining why we add this?
> 
> > ---
> >  drivers/clk/tegra/clk.h | 7 +++++++
> >  1 file changed, 7 insertions(+)
> > 
> > diff --git a/drivers/clk/tegra/clk.h b/drivers/clk/tegra/clk.h
> > index 872f118..3b8947e 100644
> > --- a/drivers/clk/tegra/clk.h
> > +++ b/drivers/clk/tegra/clk.h
> > @@ -809,4 +809,11 @@ static inline struct clk *tegra_clk_register_emc(void __iomem *base,
> >  u16 tegra_pll_get_fixed_mdiv(struct clk_hw *hw, unsigned long input_rate);
> >  int tegra_pll_p_div_to_hw(struct tegra_clk_pll *pll, u8 p_div);
> >  
> > +/* Combined read fence with delay */
> > +#define fence_udelay(delay, reg)	\
> > +	do {				\
> > +		readl_relaxed(reg);	\
> > +		udelay(delay);		\
> 
> Does the udelay() need to be after the readl()? As far as I
> recall, the delay can start spinning before the read returns
> because there isn't any sort of barrier between the two. One
> approach would be to have an mb() between the read and the delay
> so that the read is ordered with respect to the delay. If not, we
> need a better comment than "combined read fence with delay".
> 

Yes. the udelay() needs to be after the readl, but it indeed needs to be
readl() so we're sure the read cycle has been completed.

Peter.
