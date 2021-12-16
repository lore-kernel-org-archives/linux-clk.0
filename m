Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 906C3C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 04:00:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233466AbhLPEAf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 15 Dec 2021 23:00:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233465AbhLPEAc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 15 Dec 2021 23:00:32 -0500
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50595C061574
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 20:00:32 -0800 (PST)
Received: by mail-ot1-x32a.google.com with SMTP id x43-20020a056830246b00b00570d09d34ebso27475618otr.2
        for <linux-clk@vger.kernel.org>; Wed, 15 Dec 2021 20:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=X7Yhixc39nJTbAZlQ+zKPrt4KeWDFDJfAMB6HF5Wvsg=;
        b=TIVLYUvCNHNC5Z2eS2BtOjpmXvFMgzFR+fpABMrAEz+XI4JAn076HnzrdgtEQ3o5AJ
         gSo4Vpbo/Q6ZM1Qe0JPoC707HXsxdGLdT4o3pEtd8Tm+eYXIN87prVnakTwgMmqyD3+s
         qHGPqbmW0r95T0zfXuyRVuT45wSTL9Azg0mS8ogcJ+oweF+v7WMfLuWpmW5X4txNtOJz
         SLz/ey5xZEic7kxXlvSosuZHjVTn9/MPDW3hwVWMVnp3C08NvkM9rc40GLMBK3At/sNT
         TyQf/hqvK7MDPZEwG1BNQg4eEZTL+h3RgGC45JRv1pQqIowpFHmrZHanJG5RQhdcQnn8
         uwug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X7Yhixc39nJTbAZlQ+zKPrt4KeWDFDJfAMB6HF5Wvsg=;
        b=8OAwUSfHQUoSVCl/DpOWPu6ulblv51WKnZX4lRsJOsNIl6Ap57iUCVRO/71Ek/OTG6
         W40+cWz6g3TUgbpCyHEDHoB4qLHbrCTYg+GVuMdsFhGCXXl99HTeK4LKCb6+bLDb8ZYv
         G3PJd7mJPT4d/dCSnHDVK+47uIBm2MwKpQysyF7aZt/LIA/Ispe/CiUEN3pUy3E96HQ+
         yzUqF+t7Bt44b2KTRpwbNT6z7+jXgBBGVMnI04F1dsCNElWmLL6zX9L3t1B/L2EcMTpF
         ITMBJZQLuvJWTApd3GvlTszbO9J9B3U/3Oe4KqgA3gsnQoPznOhRe8rySqFHqnLCR0kK
         HSCQ==
X-Gm-Message-State: AOAM532rNA65crsr192ES0o1tOXN+ejI9rEdQSrtRUFc3xn5JBuAbom3
        aQTJ1pR63x/VjutX8l3lxCPjHQ==
X-Google-Smtp-Source: ABdhPJwTzjcl6AObSoTdxiAb56ImlgcSwn1N9D34qVewteXdeFWT+LYm71msizbbFEzWzskto2gAjw==
X-Received: by 2002:a9d:1e1:: with SMTP id e88mr11262990ote.75.1639627231519;
        Wed, 15 Dec 2021 20:00:31 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 52sm173373oth.52.2021.12.15.20.00.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Dec 2021 20:00:30 -0800 (PST)
Date:   Wed, 15 Dec 2021 20:01:45 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: qcom: dispcc-sdm845: park
 disp_cc_mdss_mdp_clk_src
Message-ID: <Ybq6KeEG4kRi0McS@ripper>
References: <20211208022210.1300773-1-dmitry.baryshkov@linaro.org>
 <20211208022210.1300773-3-dmitry.baryshkov@linaro.org>
 <YbJNp+tnD6kEQAzt@ripper>
 <a4f7d300-90c2-7dda-5cda-5e2763a94912@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4f7d300-90c2-7dda-5cda-5e2763a94912@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed 15 Dec 14:17 PST 2021, Dmitry Baryshkov wrote:

> On 09/12/2021 21:40, Bjorn Andersson wrote:
> > On Tue 07 Dec 18:22 PST 2021, Dmitry Baryshkov wrote:
> > 
> > > To stop disp_cc_mdss_mdp_clk_src from getting stuck during boot if it
> > > was enabled by the bootloader, part it to the TCXO clock source.
> > > 
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > ---
> > >   drivers/clk/qcom/dispcc-sdm845.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/clk/qcom/dispcc-sdm845.c b/drivers/clk/qcom/dispcc-sdm845.c
> > > index 735adfefc379..f2afbba7bc72 100644
> > > --- a/drivers/clk/qcom/dispcc-sdm845.c
> > > +++ b/drivers/clk/qcom/dispcc-sdm845.c
> > > @@ -858,6 +858,9 @@ static int disp_cc_sdm845_probe(struct platform_device *pdev)
> > >   	clk_fabia_pll_configure(&disp_cc_pll0, regmap, &disp_cc_pll0_config);
> > > +	/* Park disp_cc_mdss_mdp_clk_src */
> > > +	clk_rcg2_park_safely(regmap, 0x2088, 0);
> > 
> > Today booting the system with "clk_ignore_unused" will give you a
> > working efifb up until the point where the display driver kicks in and
> > reinitializes the hardware state - which during development might be
> > indefinite.
> 
> During development one can introduce a dispcc parameter. Maybe we should add
> qcom-common parameter telling dispcc drivers to skip parking these clocks.
> 

Do you see a particular need to add a specific clock? Can't we just rely
on clk_ignore_unused as a global indicator for this as well?

> > 
> > If we blindly cut the mdp_clk_src here that will no longer be possible.
> 
> I think we have several separate tasks here:
> 
> 1) Support developing code. This is what you have in mind with EFIFB +
> clk_ignore_unused.
> 

There's a case here that we don't handle today; say you have two clocks
A and B, which are both parented by the same RCG. Some driver enables
clock A for a while and then disables it, at this point there's nothing
indicating that some piece of hardware (with a not yet probed driver) is
using clock B and that it must not be turned off until said driver has
had a chance to "park" the hardware or cast its vote.

> 2) Get display to work stable and rock solid. This can include completely
> tearing down the display pipeline for the sake of getting MDP/MDSS/DSI to
> work with as few hacks as possible.
> 

This is a good goal. But I don't think we should do this solely by
cutting the clocks as the clock driver probes. I do think we need to
allow the various drivers to turn off the hardware nicely before cutting
any remaining clocks.

> 3) Gracious handover of display/framebuffer from bootloader to the Linux
> kernel.
> 

Right, this is a stretch goal for now.

> For the task #1, you can hack the dispcc as you wish or set any additional
> parameters, as you are already passing clk_ignore_unused. This will all end
> up as #1 transitions to #2.
> 
> I was targetting task#2. Disable everything to let dpu/dsi/dp start from the
> scratch. If I understand correctly, this approach would also help you with
> your boot-clock-too-high-for-the-minimum-opp issue. Is my assumption
> correct?
> 

I am somewhat surprised that we haven't yet seen problems as we try out
the approach of just cutting clocks without first shutting down the
client driver. It might work for display, but I would not be surprised
if cutting clocks like this will cause problem for the clocks that feed
some external entity and then comes back in (e.g. PHY clocks).

Also not that while this might work for dispcc, we should ensure to park
all clocks that are flagged enable_safe_config downstream before we turn
off their parents. In SM8350 GCC there are 44 of these, several of them
you won't be able to just turn off - e.g. there's the UART.

> For the task #3 we need collaboration between dispcc, clock core and dpu/dsi
> drivers. Just marking the clocks for the clk_disable_unused() is the least
> of the problems that we have here. I think [1] is a bit closer to what I'd
> expect.
> 

The idea that Qualcomm (and Google) builds on for this is to rely on
sync_state in the clock drivers and essentially 1) ensure that clocks
aren't turned off until that point 2) clean up unused clocks when all
known clients have probed.

The problem with sync_state is that clocks resolved by their global name
is not known beforehand, so sync_state will fire prematurely.

> I have a similar but slightly different idea of how this can be made to
> work. I'd do the following (excuse me for the hand waving, no code at hand):
> 
> - Add clk_ops->inherit_state callback, which can check if the clock is
> enabled already or not. If it is, set the enable_count to 1, set special
> CLOCK_INHERITED flag, read back the state, etc.
> 

That's fine for clocks where you can test that, but we have several
clocks where you can't read the state.

One such set of clocks are clk-smd-rpm, which we can't query and we may
not turn off until all the client driver have probed - as they provide
e.g. clocking for the busses.

> - Make of_clk_set_defaults() ignore clocks with CLOCK_INHERITED flag. Maybe
> it should return special status telling that some of the clocks were not
> updated.
> 
> - Add clk_get_inherit() call, which would drop the CLOCK_INHERITED flag and
> return previous flag state to calling driver. The driver now assumes
> ownership of this clock with the enable_count of 1. This way the driver can
> adjust itself to the current clock state (e.g. drop the frequency, disable
> the clock and then call of_clk_set_defaults() again to reparent/reclock
> clocks as necessary, etc). If the parent chain is not fully available,
> clk_get_inherit must return an error for INHERITED clocks, so that the
> driver will not cause reparenting of the orphaned clocks.
> 

This problem is not limited to the display driver, so adding a new
clk_get() won't scale.

> - If the driver decides for some reason to abandon the device for some
> reason (because of the probe() failure or because of the remove() callback
> being called) it will disable all clocks as expected, effectively parking
> them (but not marking them as inherited). This way next driver probe()
> attempt will start from the scratch, without inherited state.
> 

So how do you handle the case when the display driver probe defers?
I think you're trying to reinvent the sync_state callback.

> But as this is a complex solution and will take several iterations, I
> suggest teaching dispcc to park clocks at boot.
> 

I agree, but it seems that we need to be more correct in order to
support the newer platforms (SM8350/8450 etc)...

Regards,
Bjorn

> 
> [1] https://lore.kernel.org/linux-arm-msm/20190630150230.7878-1-robdclark@gmail.com/
> 
> -- 
> With best wishes
> Dmitry
