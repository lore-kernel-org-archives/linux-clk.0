Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60529C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 25 May 2022 08:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230107AbiEYIa2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 May 2022 04:30:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229808AbiEYIa1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 May 2022 04:30:27 -0400
Received: from wout3-smtp.messagingengine.com (wout3-smtp.messagingengine.com [64.147.123.19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 578B07B9C0
        for <linux-clk@vger.kernel.org>; Wed, 25 May 2022 01:30:25 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id D1D853200906;
        Wed, 25 May 2022 04:30:21 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Wed, 25 May 2022 04:30:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1653467421; x=
        1653553821; bh=D7BxRgdtnXLjq7oiQYKZCpV1T6vmPGp6mUzzul2bRFc=; b=i
        Co+eHcnNu4hYf7j+AJQ5gzuS6qkeabQFF5aMztrB+XDEmbpnfQvsKDn+RXsskRvu
        I/Zt+t9e0psS3K7U0R1p/Ci7KIygLsG5+FY4MH0Fj1Do3PUgwZC2O/F4Q34hP9Ap
        plRDoO80KHh1uh810HODZS7oICPltsoc0/a9wLdgBN+qIWOzi3cqsELfvH+nyw+h
        2sMd8478Gk6Aqlt5BTd7Ki7paE1rJrs5FMu8p/psUDFbuCT5Qjz4Pj191DHgkhs8
        1aHCvmmaFRN8zDVBq75KrDrQvvG3xWn799RmM7lcM1ceLUJ/wsyLKNt/reU2P51v
        T5TkMbJos8CQsdWgsrSLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1653467421; x=
        1653553821; bh=D7BxRgdtnXLjq7oiQYKZCpV1T6vmPGp6mUzzul2bRFc=; b=W
        8h3hOvRkyAweBgcagmo8UBg56TnsrCxmktH7eqcfazf3lt6fkKb/Vl2bE1MBz7Cx
        TFTPg2CUQrOLQMRtx/+m6pYBqotL2m72lrf4urwvhsU+FLg00w1qxQo5jbdNeAip
        NNuuOF6RkC0coqPFLQi3nSIO1mj5tYG8BWb5+qS0EciTZdrrv7koqPyUYlKb9udo
        WyQZlPT223QYA7PIVRX5CUZAEMlemDn4xJ9poRuE4SMnVPtRk340qOR3MILA+bst
        aDM3sSC167P47reePN9iJGsoHm6YoVLP/HotM9EZ5SuvRZfaaBX0mzJCIAxLA0q4
        O2Xdc7/rWi/AY4xfK6/Fg==
X-ME-Sender: <xms:HOmNYl1WtVlViEuzUAUpRJ5i2z3gEZSTVg_Y46bENGHZyb38CB4IEw>
    <xme:HOmNYsFvf6l-Fmdg4Ww5qRZ48KlEATYD3c_B22Ft3_u6Z1IpFTxmoirCZn3iv2y29
    reTTAAIc0-oFDloEZE>
X-ME-Received: <xmr:HOmNYl5T9gQRSCTS8spX0iSQvz5t6HJd068khp_ge-ZGVrA0aWCPq3Fhp6WB_DAiG6fS3q_qajo1xzifkqHo8vIk650-HhVBT9kfwc8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrjeehgddtfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeeitdeuffevieeufedtuddvffffffegfffgkeeihfelleektdelhfevhfdu
    udfhgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
    hh
X-ME-Proxy: <xmx:HOmNYi1fUw8pE4CPUCuqOTpRdOPWtSA9RzJ35SDIItEVoSo9x6cz8A>
    <xmx:HOmNYoG4wW2Y8xVijP0dEj2FoGaUfGv1aUfG4RpBS1ht0_GZPA7FsQ>
    <xmx:HOmNYj8REj1Iuc9bm4vA5CiSwgT34NeGCX7g8XztKOKYZFD5zTFWGw>
    <xmx:HemNYg9te-yFRIHEd-CXggNYOBeO1EP9NNKqfvDGn5rhQ3Gdynat3A>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 25 May 2022 04:30:19 -0400 (EDT)
Date:   Wed, 25 May 2022 10:30:17 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Jim Quinlan <jim2101024@gmail.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v4 13/28] clk: Take into account uncached clocks in
 clk_set_rate_range()
Message-ID: <20220525083017.eo3oxfduajrqoac4@houat>
References: <20220512160412.1317123-1-maxime@cerno.tech>
 <20220512160412.1317123-14-maxime@cerno.tech>
 <CANCKTBuWkkXNdK5eLJr=KzykDt+dbjfOiNGhxga4oEU5COyiUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <CANCKTBuWkkXNdK5eLJr=KzykDt+dbjfOiNGhxga4oEU5COyiUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Tue, May 24, 2022 at 02:32:29PM -0400, Jim Quinlan wrote:
> On Fri, May 13, 2022 at 3:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
> >
> > clk_set_rate_range() will use the last requested rate for the clock when
> > it calls into the driver set_rate hook.
> >
> > However, if CLK_GET_RATE_NOCACHE is set on that clock, the last
> > requested rate might not be matching the current rate of the clock. In
> > such a case, let's read out the rate from the hardware and use that in
> > our set_rate instead.
>
> I'm probably out of the loop on this but I am wondering why we don't
> also apply this same reasoning to
>=20
>         clk_core_set_rate_nolock()
>=20
> which may usea stale clock rate and skip the actual setting of the rate:
>=20
> static int clk_core_set_rate_nolock(core, req_rate)
> {
>         /* ... */
>         rate =3D clk_core_req_round_rate_nolock(core, req_rate);
>=20
>         /* bail early if nothing to do */
>         if (rate =3D=3D clk_core_get_rate_nolock(core))    /* [JQ] Does
> not check for CLK_GET_RATE_NOCACHE */
>                 return 0;
>=20
> I can see that 9-10 years ago someone submitted a pullreq to fix above
> but I cannot locate the response and it obviously never made it
> upstream.

Yeah, that change would make sense to me.

Stephen was hinting at a different solution here though:
https://lore.kernel.org/linux-clk/20220423044228.2AA7AC385A0@smtp.kernel.or=
g/

> Just thinking out loud, the simpler solution is to probably drop all
> rate caching in the CCF and get the frequency on a clk_get_rate()
> call. It complicates some of the core though when we check to see if
> we need to update clk rates. We could have some middle ground where
> drivers indicate that they want to update their cached rate because
> it's valid now (either from their enable path or from somewhere else).
> This may be nice actually because we could have clk providers call
> this to force a recalc down the tree from where they've updated. I
> think the qcom DisplayPort phy would want this.

Maxime
