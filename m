Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AADAC433F5
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 07:17:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230383AbiDWHUb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 03:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbiDWHUa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 03:20:30 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93F53136969
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 00:17:29 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 36CE23200FA9;
        Sat, 23 Apr 2022 03:17:25 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Sat, 23 Apr 2022 03:17:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1650698244; x=
        1650784644; bh=7geXDW3WmMzWv3sJPMUU1YJO0TU7D0rZdzrGif3a0jk=; b=a
        fwqvGv/vtzjJdo+0woJ48Pa9K83/71yYxc1og//KTTkNks+AyAKE++LVfihBsQ31
        /najBxC6344Mghwuv7nbfIKXF/atS+V7KmrLm27/IqOrGNmzpuKyASqqj1E46kN9
        GmIZPIF7P1Z9RCEYomfM27ehQjI0wRxfA96nNjaIBM0VDU0+xs/5Bc5rppx1g4JL
        v9RfAbUlUZFe2oLvCG9WIZqaEnyQ6pBopo7Yx4Tnz1VnJG3fZAf8+I6I3w7mJQB/
        XKVonJJDTZgMKfFq4V1z5YkzPimsTTqaou3gZiSfOa5Yks6hd5gbzWcxYMsD+Dp3
        KvOr7NpMZJt1RcSe/oECA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1650698244; x=1650784644; bh=7geXDW3WmMzWv
        3sJPMUU1YJO0TU7D0rZdzrGif3a0jk=; b=biMNK5Kl/hkJ+DjNjW9Pei389sG5n
        XsgnG2FZmGyQVCvJSSkqLjrd+8zPeJdk3DPUR/H2iTqnijdz1vumvkNGsE5g4eb0
        DvJG84N8GGDXxKs8w2KSFBOLSwZhDvIw3nX4SdMGJWh3i12V3s86qStolaEKIFlX
        EQYSn1S3FfoQx6EA3llY6xx6LwuBefVjTKPCbSUye1gUXSZFNtVnYyOBZdCEu7Wk
        e8JLctF3sgvnX1YC7ra57+utbeY8uBLnzRImCZWM7zL3UKi3PCzScg3NpG02gGax
        AlhBH1e72UqVmodYQWgSzLx4XgMAzITaH6HPa4ZUpMBXY9e2emvswu9rQ==
X-ME-Sender: <xms:A6hjYh8zkmm5-D8YtNcoEYS2Y9wTTk7KHuTh1JlTREofGSiXkyy-rg>
    <xme:A6hjYlu6t5dFG3MPqD1pnTakRY-JBSgkZRXYCZhlzqodNV9RCw4B6ktyObYshqOku
    llGvzKGDGfgE_Gq7qg>
X-ME-Received: <xmr:A6hjYvBy7FdH4kuztlQp2wDJwEE6kkD_RqYWmWqVF-NEfjvxjFx3KaBYUfEthOfGIkgJi0Vso2k5ABgvYlw2_Sr06nyosg0EriC6OEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdehgdduudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepheejffefgefgieevjedvfffgvdfghedtgfdvueejvdejgfffvdeuteei
    vedufedvnecuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordht
    vggthh
X-ME-Proxy: <xmx:A6hjYlf8EzmQcs6k2p4axECm0Xm0yJa01YcdzarsNaaaCjjXHLbgIQ>
    <xmx:A6hjYmNfsJB2tzpUArcnVEWIXfgS2durqCUB6b7tbPQBtCJ_qIDDWg>
    <xmx:A6hjYnkr9lqHl8Vs0BSLAjDOFo-qHrWwKXADSeqhcRt9SVVyjedMIA>
    <xmx:BKhjYnj3XXiqAfjJDafK_A9PPHv63_V3B4UlzqMWyZnP5WHJN9ZEHA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Apr 2022 03:17:22 -0400 (EDT)
Date:   Sat, 23 Apr 2022 09:17:20 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH 14/22] clk: Introduce clk_hw_init_rate_request()
Message-ID: <20220423071720.35x5hxcxevh5erny@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-15-maxime@cerno.tech>
 <20220423034623.A43CBC385A0@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220423034623.A43CBC385A0@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

Thanks for your reviews :)

On Fri, Apr 22, 2022 at 08:46:21PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-04-08 02:10:29)
> > diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> > index 399080456e45..83dd5f1df0b9 100644
> > --- a/drivers/clk/clk.c
> > +++ b/drivers/clk/clk.c
> > @@ -1396,6 +1396,26 @@ static void clk_core_init_rate_req(struct clk_co=
re * const core,
> >         }
> >  }
> > =20
> > +/**
> > + * clk_hw_init_rate_request - Initializes a clk_rate_request
> > + * @hw: the clk for which we want to submit a rate request
> > + * @req: the clk_rate_request structure we want to initialise
> > + * @rate: the rate which is to be requested
> > + *
> > + * Initializes and fills a clk_rate_request structure to submit to
>=20
> s/and fills//
>=20
> > + * __clk_determine_rate or similar functions.
>=20
> __clk_determine_rate()
>=20
> > + */
> > +void clk_hw_init_rate_request(struct clk_hw * const hw,
>=20
> I don't get why it isn't 'const struct clk_hw *hw', but it looks to be
> following clk_core_init_rate_req() so that can be figured out later.

We won't modify either the pointer nor the clk_hw itself, so it made
sense to me?

> Please remove the const from here regardless; it's not doing anything.

Ok, I'll remove it.

> > +                             struct clk_rate_request *req,
> > +                             unsigned long rate)
> > +{
> > +       if (WARN_ON(!hw || !req))
>=20
> Why would you call it without those two items? Another copy/paste from
> clk_core_init_rate_req()?

I never know what to do here honestly. It's true that calling it with
NULL as a parameter seems dumb, but I could very well see a NULL pointer
stored in a variable and using that variable.

Preventing a NULL pointer dereference in such a case seems sane, but I
couldn't find a consistent policy in the kernel about what to do. I'll
remove it if you don't like it.

> > +               return;
> > +
> > +       clk_core_init_rate_req(hw->core, req, rate);
> > +}
> > +EXPORT_SYMBOL_GPL(clk_hw_init_rate_request);
> > +
> >  static bool clk_core_can_round(struct clk_core * const core)
> >  {
> >         return core->ops->determine_rate || core->ops->round_rate;
> > diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> > index c10dc4c659e2..39e4ed301ec5 100644
> > --- a/include/linux/clk-provider.h
> > +++ b/include/linux/clk-provider.h
> > @@ -42,6 +42,8 @@ struct dentry;
> >   * struct clk_rate_request - Structure encoding the clk constraints th=
at
> >   * a clock user might require.
> >   *
> > + * Should be initialized by calling clk_hw_init_rate_request().
>=20
> How is that enforced?

I'm sure we can come up with some coccinelle script if needed, but yeah
it's a pretty loose requirement for now.

> This has only become a problem after commit 948fb0969eae ("clk: Always
> clamp the rounded rate") from what I can tell. I guess we can't skip the
> clamp when both min/max are zero though because it may be stack junk?

Yeah, but it isn't the only issue, really.

Prior to this series, the most glaring issue is that most
CLK_SET_RATE_PARENT handling is just updating the rate, or even just
copying the clk_request_rate and forwarding it to the parent:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/clk.c#L553

In this case, the requested rate is wrong, but the best_parent_hw and
best_parent_rate fields will be the one of the child clock, and thus
will point to the parent itself, not the parent's parent.

at91 has the same issue in multiple places:
https://elixir.bootlin.com/linux/latest/source/drivers/clk/at91/clk-generat=
ed.c#L191
https://elixir.bootlin.com/linux/latest/source/drivers/clk/at91/clk-master.=
c#L402
https://elixir.bootlin.com/linux/latest/source/drivers/clk/at91/clk-master.=
c#L731

So making it available to drivers seems to add some value at least,
whether we require it or not.

> But I looked at all the call sites and either they zero initialize the
> whole struct (qcom) or they copy the req from what is passed into the
> determine_rate clk_op (others). So we could simply not clamp if both
> values are equal to zero and then qcom would be happy, but that has been
> fixed by setting the min/max to 0 and max instead.

Like I said, it's more of a symptom of a larger issue than a bug in
itself. It's not just that the driver doesn't enforce any boundary (so
at the clk_hw level), which would be fine, it's also that it will ignore
any user boundary, and that's where the bug is in my book. And it was
there prior to the patch you mentioned.

I'd be ok to add that kind of check for the time being, but it should at
least come with some kind of warning to report that something fishy is
going on and needs to be addressed.

> That leaves the other users, which already copy what is being passed
> in, i.e. what is done by clk_core_init_rate_req().

> I guess my question is who is going to use this? And if we can't even
> enforce that it is used then it feels like we shouldn't add it. Maybe it
> can be useful to cleanup the core request initialization logic because
> it's sort of spread out but probably not as a clk_hw API.

The main user really will be a unit test I added for
__clk_determine_rate() to make sure the returned clk_request_rate is
sane. All the drivers we discussed so far would probably need to use
clk_core_forward_rate_req() instead.

If we follow what is being done for the rest of the clk_core_*
functions, clk_core_forward_rate_req() isn't available to providers and
isn't exported, to it would be difficult to use as is in the tests.
Could we create a clk_internal.h header or something maybe to export it
only to the tests if you don't want to expose it to drivers?

Maxime
