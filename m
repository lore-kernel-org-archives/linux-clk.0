Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980FEC433FE
	for <linux-clk@archiver.kernel.org>; Sun,  2 Oct 2022 23:45:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbiJBXpr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Oct 2022 19:45:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229479AbiJBXpq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Oct 2022 19:45:46 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5669C1DF30
        for <linux-clk@vger.kernel.org>; Sun,  2 Oct 2022 16:45:41 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F0A38B8;
        Mon,  3 Oct 2022 01:45:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664754338;
        bh=bkxZv+24fhTCfW0QUzJFU2Dn1WLf+J7wi3p0btTP9yM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ds7ljow48vheC0G9o82LerrLf/g7ttk/mpon7dYwhFZA0wqecgUuDqgX+U91hhMyO
         Wnh2KxuDAZyfTqnxa8kVu4OYN+Hb9qvdNAPCZWIFF5yhu8n6NnzJHw0nCbbH0uH3ly
         +hJpsZ3sqC1ZwdZ3jooDm2G4ZqBOANPh5j1fXyZM=
Date:   Mon, 3 Oct 2022 02:45:37 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Quanyang Wang <quanyang.wang@windriver.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Message-ID: <YzoioTx9Pgw2EvbX@pendragon.ideasonboard.com>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
 <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Quanyang,

On Thu, Sep 29, 2022 at 09:05:10AM +0800, Quanyang Wang wrote:
> Hi Laurent,
> 
> I have sent a patch as below to fix this issue which set rate failed and 
> it's in linux-next repo now.
> 
> https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-quanyang.wang@windriver.com/T/

I should have searched the mailing list better before sending a patch,
sorry.

I've tested your patch, and it fixes the problem too. The resulting
pixel frequency is even more off though:

[   66.741024] zynqmp-dpsub fd4a0000.display: requested pixel rate: 297000000 actual rate: 249999998

But that's a separate issue.

> As for the frequency gap between the requested rate and the actual, it's 
> because of the commit:
> 
> commit 948fb0969eae8
> Author: Maxime Ripard <maxime@cerno.tech>
> Date:   Fri Feb 25 15:35:26 2022 +0100
> 
>      clk: Always clamp the rounded rate
> 
> And I haven't figured out how to fix it.
> 
> Thanks,
> 
> Quanyang
> 
> On 9/29/22 04:16, Laurent Pinchart wrote:
> > When calculating the divider in zynqmp_pll_round_rate() and
> > zynqmp_pll_set_rate(), the division rounding error may result in an
> > output frequency that is slightly outside of the PLL output range if the
> > requested range is close to the low or high limit. As a result, the
> > limits check in clk_calc_new_rates() would fail, and clk_set_rate()
> > would return an error, as seen in the zynqmp-dpsub driver:
> >
> > [   13.672309] zynqmp-dpsub fd4a0000.display: failed to set pixel clock rate to 297000000 (-22)
> >
> > Fix this by adjusting the divider. The rate calculation then succeeds
> > for zynqmp-dpsub:
> >
> > [   13.554849] zynqmp-dpsub fd4a0000.display: requested pixel rate: 297000000 actual rate: 255555553
> >
> > The resulting PLL configuration, however, is not optimal, as the rate
> > error is 14%. The hardware can do much better, but CCF doesn't attempt
> > to find the best overall configuration for cascaded clocks. That's a
> > candidate for a separate fix.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > ---
> >   drivers/clk/zynqmp/pll.c | 8 ++++++++
> >   1 file changed, 8 insertions(+)
> >
> > diff --git a/drivers/clk/zynqmp/pll.c b/drivers/clk/zynqmp/pll.c
> > index 91a6b4cc910e..be6fa44a21e0 100644
> > --- a/drivers/clk/zynqmp/pll.c
> > +++ b/drivers/clk/zynqmp/pll.c
> > @@ -120,6 +120,10 @@ static long zynqmp_pll_round_rate(struct clk_hw *hw, unsigned long rate,
> >   	}
> >   
> >   	fbdiv = DIV_ROUND_CLOSEST(rate, *prate);
> > +	if (*prate * fbdiv < PS_PLL_VCO_MIN)
> > +		fbdiv++;
> > +	if (*prate * fbdiv > PS_PLL_VCO_MAX)
> > +		fbdiv--;
> >   	fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
> >   	return *prate * fbdiv;
> >   }
> > @@ -208,6 +212,10 @@ static int zynqmp_pll_set_rate(struct clk_hw *hw, unsigned long rate,
> >   	}
> >   
> >   	fbdiv = DIV_ROUND_CLOSEST(rate, parent_rate);
> > +	if (parent_rate * fbdiv < PS_PLL_VCO_MIN)
> > +		fbdiv++;
> > +	else if (parent_rate * fbdiv > PS_PLL_VCO_MAX)
> > +		fbdiv--;
> >   	fbdiv = clamp_t(u32, fbdiv, PLL_FBDIV_MIN, PLL_FBDIV_MAX);
> >   	ret = zynqmp_pm_clock_setdivider(clk_id, fbdiv);
> >   	if (ret)
> >
> > base-commit: 1c23f9e627a7b412978b4e852793c5e3c3efc555

-- 
Regards,

Laurent Pinchart
