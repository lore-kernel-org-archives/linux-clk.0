Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE7A3C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 11 Oct 2022 12:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229546AbiJKM2L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Oct 2022 08:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbiJKM2E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Oct 2022 08:28:04 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DBFF237D9
        for <linux-clk@vger.kernel.org>; Tue, 11 Oct 2022 05:28:03 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 74E465C0124;
        Tue, 11 Oct 2022 08:28:01 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 11 Oct 2022 08:28:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1665491281; x=
        1665577681; bh=+kIVz0joqvn5F9EmJh1M16xnRBH/ni1WtPq0h0hSx/4=; b=Q
        yIJuEnZujKeOADpZjJB5JheKIM0qmTXe9PhbckKbXF3wRAZed0jtXRFDAIHG6E1v
        mov1DUHzlXsE7lkNpB/YAGqemynB5i2JqJu6sQ6mqtkGTxJiq1QOqwEXCPIIgwj3
        KYPTaxfZK/ms6qcJPjwHMb1yABE3Mk34ZCcsNu5Y7lTeYjxq+9CTuV3pbLtoVrUl
        amKeBjkq4OT9O7bwUbdxP9nqR1eZaxLDBWr/pn3RisCiPzER7xIZE8tjvhIk+OPz
        zN9+J9HTlES9Iw83VjhqeXMgPe1FRDV0OpsR2Mb4E5FvIEP+LUHzciPl9QyPBqkF
        Q0ksOFQvsFQaC33ZUqjWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1665491281; x=
        1665577681; bh=+kIVz0joqvn5F9EmJh1M16xnRBH/ni1WtPq0h0hSx/4=; b=p
        4bW3CouRbCIXgnEuAZNbd0NClu0CPesN3ytJ/d+53uJ/VaUGX+xcmKjm6A8GKjDx
        OTHHnn9ud2g0W4V1RstPit9F+DypbQI8qB0bov4zmdoNS3krDiWXBHB7CiDscpeI
        /g4kzKoL+V7PYu8BGbSBG5vTSz2nM5/9onZaxiIP5iRrVHS4cPJumLDb7EJr42fV
        OFpuxZakmt+Ctr6d3PkESj/Zl6VZiPFC93bNJp3v/zlyWj7s0Nv56uKpvjQgrW8/
        krWduNFZOvjULrG5Hy/NEaSViEKCijOxkgPf1k5YDsA0B6YJzGX8oZwEFptB6F9t
        oabswVAy0KlFbLy5rXklw==
X-ME-Sender: <xms:UWFFY4m-tlfgPhQYBFBzLwiLXev1a8gM57w3Kosl-KZnDlz9nqSRRQ>
    <xme:UWFFY31SQETBYOR3irnsOSa3JmMca9A7jnmYTabVYqon5a7ua7_Z99WcRrXLPhlX6
    vqXCbQy1x1rXCqbxF8>
X-ME-Received: <xmr:UWFFY2rFG0IoBbPBli81uzRVB4Z5XmmYKOmi3UMfSMKSgXk-5w1z1K6np_WH>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeejiedggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepiedtueffveeiueeftdduvdffffffgeffgfekiefhleelkedtlefhvefh
    udduhffgnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgv
    tghh
X-ME-Proxy: <xmx:UWFFY0m2y0eufqeTms1WTbT2ds_xfUGmD4RlXVAJ7QUqTQdBzzUesw>
    <xmx:UWFFY233ES2SwtOsvn67dzfUoZhFZbPY6qyR9BmwgKmNUokn9wl6Cw>
    <xmx:UWFFY7vjVHQ29tf4cOQhcXuDfzUWixvRcuEPZFkX2Y5Z8ZdjZSBpYA>
    <xmx:UWFFY8NdZ2o-fz3JiSozVkmsUDKYoenOle9ELh4xJbol2EodHeBaYQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 11 Oct 2022 08:28:00 -0400 (EDT)
Date:   Tue, 11 Oct 2022 14:27:59 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Quanyang Wang <quanyang.wang@windriver.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Michal Simek <michal.simek@xilinx.com>,
        Rajan Vaja <rajan.vaja@xilinx.com>
Subject: Re: [PATCH] clk: zynqmp: pll: Fix divider calculation to avoid
 out-of-range rate
Message-ID: <20221011122759.nelmns352sfqcmsp@houat>
References: <20220928201656.30318-1-laurent.pinchart@ideasonboard.com>
 <11481209-7c8f-7543-1e04-5723ffc2ccd4@windriver.com>
 <20221001000503.23268C433D6@smtp.kernel.org>
 <20221001104001.r7r2utwymm32tv53@houat>
 <ba5bb9dd-8a4c-3f24-c7e2-c8469ef693be@windriver.com>
 <20221010084948.5ikovoamsfggsxwj@houat>
 <5dd52fa0-1507-fbf4-8e98-90e50675b83d@windriver.com>
 <20221010124915.25pl5jyxtaepimhd@houat>
 <3b05a90d-a3f0-1df7-e2f9-d3f44cdf36a8@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <3b05a90d-a3f0-1df7-e2f9-d3f44cdf36a8@windriver.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Tue, Oct 11, 2022 at 11:11:31AM +0800, Quanyang Wang wrote:
> On 10/10/22 20:49, Maxime Ripard wrote:
> > On Mon, Oct 10, 2022 at 08:12:08PM +0800, Quanyang Wang wrote:
> > > Hi Maxime,
> > >=20
> > > On 10/10/22 16:49, Maxime Ripard wrote:
> > > > Hi,
> > > >=20
> > > > On Sun, Oct 02, 2022 at 10:17:24AM +0800, Quanyang Wang wrote:
> > > > > On 10/1/22 18:40, Maxime Ripard wrote:
> > > > > > Hi
> > > > > >=20
> > > > > > On Fri, Sep 30, 2022 at 05:05:01PM -0700, Stephen Boyd wrote:
> > > > > > > +Maxime
> > > > > > >=20
> > > > > > > Quoting Quanyang Wang (2022-09-28 18:05:10)
> > > > > > > > Hi Laurent,
> > > > > > > >=20
> > > > > > > > I have sent a patch as below to fix this issue which set ra=
te failed and
> > > > > > > > it's in linux-next repo now.
> > > > > > > >=20
> > > > > > > > https://lore.kernel.org/linux-arm-kernel/20220826142030.213=
805-1-quanyang.wang@windriver.com/T/
> > > > > > > >=20
> > > > > >=20
> > > > > > It looks to me that the fundamental issue is that, in some situ=
ations,
> > > > > > the round_rate implementation can return a rate outside of the
> > > > > > boundaries enforced on a clock.
> > > > >=20
> > > > > In my limited view, the round_rate callbacks should return a rate=
 within
> > > > > boundaries as output,
> > > >=20
> > > > I guess it would be s/should/must/, but yeah, we agree.
> > > >=20
> > > > > but can take a rate outside of boundaries as input.
> > > >=20
> > > > I'm not sure what that would change though?
> > > >=20
> > > > > Take Xilinx Zynqmp for instance, VPLL's rate range is 1.5GHz~3GHz=
=2E A
> > > > > consumer dp_video_ref wants a 200MHz rate, its request walks upwa=
rd through
> > > > > multiplexers and dividers then reaches to VPLL, VPLL receives thi=
s 200MHz
> > > > > request and call  zynqmp_pll_round_rate to "round" this out-of-ra=
nge rate
> > > > > 200MHz to 1600MHz via multiplying by 8. zynqmp_pll_round_rate ret=
urns
> > > > > 1600MHz and clk subsystem will call determine callbacks to config=
ure
> > > > > dividers correctly to make sure that dp_video_ref can get an exac=
t rate
> > > > > 200MHz.
> > > >=20
> > > > Sounds good to me indeed.
> > > >=20
> > > > > But the commit 948fb0969eae8 ("clk: Always clamp the rounded rate=
") adds
> > > > >=20
> > > > > req->rate =3D clamp(req->rate, req->min_rate, req->max_rate);
> > > > >=20
> > > > > before
> > > > >=20
> > > > > rate =3D core->ops->round_rate(core->hw, req->rate,&req->best_par=
ent_rate);
> > > > >=20
> > > > > This results that .round_rate callbacks lose functionality since =
they have
> > > > > no chance to pick up a precise rate but only a boundary rate.
> > > > > Still for Xilinx Zynqmp, the 200MHz rate request to PLL will be s=
et to
> > > > > 1500MHz by clamp function and then zynqmp_pll_round_rate does not=
hing,
> > > >=20
> > > > I'm a bit confused now.
> > > >=20
> > > > If I understand your clock topology, you have a PLL, and then a div=
ider
> > > > of 8, and want the final clock to be running at 200MHz?
> > > >=20
> > > > If so, the divider should call its parent round/determine_rate with=
 200
> > > > * 8 MHz =3D 1600MHz, which is is still inside the boundaries of 1.5=
-3.0GHz
> > > > and won't be affected?
> > > >=20
> > > > Why should the child be affected by the parent boundaries, or the o=
ther
> > > > way around
> > >=20
> > > Sorry, I didn't explain the problem clearly.
> > >=20
> > > As below is the vpll clk topology in /sys/kernel/debug/clk/clk_summar=
y when
> > > reverted "clk: Always clamp the rounded rate".
> > >   clk_name				MHz
> > >   pss_ref_clk                          33333333
> > >      vpll_post_src                     33333333
> > >      vpll_pre_src                      33333333
> > >         vpll_int                       1599999984
> > >            vpll_half                   799999992
> > >               vpll_int_mux             799999992
> > >                  vpll                  799999992
> > >                     dp_video_ref_mux    799999992
> > >                        dp_video_ref_div1    99999999
> > >                           dp_video_ref_div2  99999999
> > >                              dp_video_ref    99999999
> >=20
> > I couldn't find any of these clocks by grepping in the kernel code, are
> > they upstream?
> >=20
> > > When call clk_set_rate(dp_video_ref, 100MHz), there is a clk_calc_new=
_rates
> > > request passed from bottom (dp_video_ref) to top (vpll_int), every cl=
k will
> > > calculate its clk_rate and its best_parent_rate. vpll_half will calcu=
late
> > > its clk rate is 100MHz and its parent clk vpll_int should be 200MHz s=
ince
> > > vpll_half is a half divider. But vpll_int ranges from 1.5GHz~3GHz
> >=20
> > Still, I'm not entirely sure what's going on. If the only divider we
> > have is vpll_half which halves the rate, and we want 100MHz on
> > dp_video_ref, then vpll_int should provide 200MHz? Why would we increase
> > it to 1.6GHz? I get that the range of operating frequencies for vpll_int
> > is 1.5-3GHz, but I don't understand how we could end up with 100MHz on
> > dp_video_ref with 1.6GHz for that PLL. Or the other way around, why we
> > want that * 8 in the first place for vpll_int.
>
> Oh, I think I see what's wrong. It's because the children clocks of vpll_=
int
> have the wrong rate range. The commit 948fb0969eae8 makes sense and my
> understanding was wrong.
>=20
> The clk vpll_int sets the rate range by the function:
> 	clk_hw_set_rate_range(hw, 1.5GHz, 3.0GHz);
> But the function clk_hw_set_rate_range just set the rate range for vpll_i=
nt,
> not cascade the limitation for its children clks. This results that the i=
ts
> children clks still ranges 0~ULONG_MAX.

Yeah, indeed the range isn't propagated to the children yet. This wasn't
the case before my series either, so I wouldn't consider it a
regression.

> When a 100MHz rate request is raised from the bottom "dp_video_ref",
> every clk in the tree doesn't modify it and just pass it to its parent
> clk since 100MHz is in its rate range 0~ULONG_MAX.

=46rom a current-state point of view, that makes sense.

> Then vpll_int receive a 200MHz rate request from vpll_half which will
> set itself to be 100MHz.

Still makes sense :)

> But in fact, vpll_half rate range should be 1.5GHz/2 ~ 3GHz/2. The
> same to the clk dp_video_ref_mux. And the divider dp_video_ref_div1
> should range from 1.5GHz/2/63 ~ 3GHz/2/1.

I still don't get where exactly the 8 multiplier is enforced? Is it in
vpll_int? If so, then why is it reporting a rate of 1.5-3.0 GHz, whereas
its child clock that is supposed to halve the rate has 100MHz?

> In my limited view, there is a relation between clocks that is
> muxes/dividers should inherit the limitation from its parent clk. But now=
 it
> seems that the rate ranges are isolating between clks. Is there a way that
> can re-set the rate range for children clks when its parent clk re-set the
> rate range?

We can't really do that in the framework, because we can't really know
the capabilities of the clocks at a generic level using any of the
clocks operations. Indeed some clocks won't affect the rate ("pure"
gate, muxes), and some will.

Figuring out the rate range for those that don't affect it is trivial,
but for those who do you can't know how it affects the rate. Plus, PLL
will typically have a narrower range of operation than the extremum you
can achieve by using the larger divider and smaller multiplier for
example.

So I think you can't really expect an obvious relationship between the
parent range and the child range. So it should be reported by the
driver, like you did, by calling clk_hw_set_rate_range().

Maxime
