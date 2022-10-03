Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEC9BC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  3 Oct 2022 00:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229479AbiJCAG0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 2 Oct 2022 20:06:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbiJCAGZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 2 Oct 2022 20:06:25 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 624A536DF3
        for <linux-clk@vger.kernel.org>; Sun,  2 Oct 2022 17:06:24 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 304FA8B8;
        Mon,  3 Oct 2022 02:06:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664755582;
        bh=Q2OLvRxaTex/nZYjssOAlRaKsw2guN6fKXvLB/8YKj0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=k4aHTiJKvC53u9A5JoQVPLD8t0agwJlMdcM35fivnB3WcxVRri3p4JWILxCN6//zB
         d98PuNhEaT07gOpeNSP4im9bS4rlAlcyJptiih/jmNyfm3X2fp6bUOfhdHoRl+Xyfd
         YZSaZl5ZfXEsgmSRG9YaGqG8T2RLRxqGd/7r16EY=
Date:   Mon, 3 Oct 2022 03:06:20 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Quanyang Wang <quanyang.wang@windriver.com>
Cc:     Maxime Ripard <maxime@cerno.tech>, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Message-ID: <YzonfAbGsymi9ZeA@pendragon.ideasonboard.com>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
 <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
 <20221001000503.23268C433D6@smtp.kernel.org>
 <20221001104001.r7r2utwymm32tv53@houat>
 <ba5bb9dd-8a4c-3f24-c7e2-c8469ef693be@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ba5bb9dd-8a4c-3f24-c7e2-c8469ef693be@windriver.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

On Sun, Oct 02, 2022 at 10:17:24AM +0800, Quanyang Wang wrote:
> On 10/1/22 18:40, Maxime Ripard wrote:
> > On Fri, Sep 30, 2022 at 05:05:01PM -0700, Stephen Boyd wrote:
> >> +Maxime
> >>
> >> Quoting Quanyang Wang (2022-09-28 18:05:10)
> >>> Hi Laurent,
> >>>
> >>> I have sent a patch as below to fix this issue which set rate failed and
> >>> it's in linux-next repo now.
> >>>
> >>> https://lore.kernel.org/linux-arm-kernel/20220826142030.213805-1-quanyang.wang@windriver.com/T/
> >>>
> > 
> > It looks to me that the fundamental issue is that, in some situations,
> > the round_rate implementation can return a rate outside of the
> > boundaries enforced on a clock.
>
> In my limited view, the round_rate callbacks should return a rate within 
> boundaries as output, but can take a rate outside of boundaries as input.
> 
> Take Xilinx Zynqmp for instance, VPLL's rate range is 1.5GHz~3GHz. A 
> consumer dp_video_ref wants a 200MHz rate, its request walks upward 
> through multiplexers and dividers then reaches to VPLL, VPLL receives 
> this 200MHz request and call  zynqmp_pll_round_rate to "round" this 
> out-of-range rate 200MHz to 1600MHz via multiplying by 8. 

I don't think that's the right way to look at it. Making the VPLL driver
multiply the requested 200MHz rate by 8 assumes that it knows that the
next block in the clock tree is a divider capable of dividing by 8.
That's not something the VPLL driver should know about. The next block
may be able to divide by 10 and up only, which means that the VPLL
should then be configured to output 2000 MHz.

The problem that needs to be solved is to find a global optimal
configuration for cascaded PLLs and dividers. 

> zynqmp_pll_round_rate returns 1600MHz and clk subsystem will call 
> determine callbacks to configure dividers correctly to make sure that 
> dp_video_ref can get an exact rate 200MHz.
> 
> But the commit 948fb0969eae8 ("clk: Always clamp the rounded rate") adds
> 
> req->rate = clamp(req->rate, req->min_rate, req->max_rate);
> 
> before
> 
> rate = core->ops->round_rate(core->hw, req->rate,&req->best_parent_rate);
> 
> This results that .round_rate callbacks lose functionality since they 
> have no chance to pick up a precise rate but only a boundary rate.
> Still for Xilinx Zynqmp, the 200MHz rate request to PLL will be set to 
> 1500MHz by clamp function and then zynqmp_pll_round_rate does nothing, 
> dp_video_ref will finally receive a rate which is 1500MHz/8 = 187.5MHz.
> The rate gap (200MHz-187.5MHz) happens.
> 
> There is no doubt that round_rate should return a valid rate as output. 
> But is it necessary that forces the input of round_rate callbacks to be 
> within boundaries?
> 
> > I think that's the current behaviour (that was there prior to my
> > patches) to reject any rate outside of the boundaries in
> > clk_calc_new_rates() makes it clear that it's not something we should
> > allow.
> > 
> > I'm a bit two-minded on this though. All the failures of that test I've
> > seen actually turned out to be bugs, so I guess it's useful, but it's
> > also true that for rounding errors it's a bit overkill. We could also
> > relax that check and warn instead of failing.
> > 
> >>> As for the frequency gap between the requested rate and the actual, it's
> >>> because of the commit:
> >>>
> >>> commit 948fb0969eae8
> >>> Author: Maxime Ripard <maxime@cerno.tech>
> >>> Date:   Fri Feb 25 15:35:26 2022 +0100
> >>>
> >>>       clk: Always clamp the rounded rate
> >>>
> >>> And I haven't figured out how to fix it.
> > 
> > Again, it boils down on whether or not we should allow a rate outside of
> > boundaries. If we don't and if the clock can't do better, then yeah, the
> > rate difference is fairly big but we can't do better.
> > 
> >> Maxime has some more patches to fix this and they're in linux-next.
> >> Maybe those fix this problem?
> > 
> > I don't think they will fix it. However, depending on the outcome of
> > that discussion I can send more fixes your way :)
> > 
> > Maxime

-- 
Regards,

Laurent Pinchart
