Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 439B9C433F5
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 07:45:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232383AbiDWHr7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 03:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230242AbiDWHr6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 03:47:58 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC90120BDDE
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 00:45:01 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 4EC3C3200E5F;
        Sat, 23 Apr 2022 03:45:00 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute3.internal (MEProxy); Sat, 23 Apr 2022 03:45:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1650699899; x=
        1650786299; bh=jxF5BU/rv1T1SFhUpWl+HDv5YCfyuQvaqxyKG6CAdYs=; b=X
        hNujmOBkScp9Q5yipn662C/gFXwrX0Cld07dBU7MvCn8EtMEHb55vg+NaSU4aCnk
        9sCmwd8Sl99TOe9n1v+ZrDiXSGBCoLaouG+iFBBNMJFrop3ZMuFZvItpQWOWHjZq
        j5N5xxHfSnLxFXEiwvemaPDR9kIko4xsTQuqeNSamfq8i7wJt278zbP9/b0au3Ay
        em+bp20sV3751nsmKcehNSltEreNIlmLIDCOC1hdpAEIezlLxA3hMpOCD6/0XJjD
        ymaIv74AS4vj0qGY8Pl/oZ5jWzQkMpkmemsTQumnXRaPYoDRzWKK0vcsbWUpljNJ
        5WviuUiB+M5DlcA6MOK4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1650699899; x=1650786299; bh=jxF5BU/rv1T1S
        FhUpWl+HDv5YCfyuQvaqxyKG6CAdYs=; b=oGETU23/lGYCjxBV5lV/fdHsueGNy
        ypCE6FSLpWOURJrc2cZLabBzhYMYbcbiNwrB+uuumPaAWw7CObIlgBWa9TZ8cwb/
        HNUF8CxmpEpb9PIdaLf8FwGECgVfhxe9/SaZC2wfF+5d7/1sPkGPqA9ljpgI1/6V
        gPCwSGVVrpDqLu98Qw3IxTREBGwHufA9ZVo7fNp+7qDUnOaA43HDYPkO9q5eVbUA
        AqTac/SOiGDQx118sBpZTm7XSsQgwAUwT0KQh7U8RkZpHYjxUgnndhZTODoaJMHJ
        ypLvHDD6VucZEjJoAFZVx2C2rTP1BNsXRyi8f9yKrjvphAJ65eYrV6Y0Q==
X-ME-Sender: <xms:eq5jYizsYSXchTM_jsv5_NTjwDkHAh0vnyOSR4flrk0z3BiBTzdkbA>
    <xme:eq5jYuQyZw1mrxHmHH4TLPNV7EbNYbCDk1Yf0vYxro1FIxrhVGA7jABX-1cCxvlbB
    -VjCZUHBbqVXHUX-YA>
X-ME-Received: <xmr:eq5jYkXbOQZVynRFe18dcPz-lEB-dy6iy5LeIlnplgFhoBDPVfqPEWw2L8rVSHtw8hBoICQ9vljSbed6dcywjMTTMDUe_M7bg3nCVY8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrtdehgdduvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddvnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnheptefgleeggfegkeekgffgleduieduffejffegveevkeejudektdduueet
    feetfefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:eq5jYojGIeBmBT3Z842mZog28UDoKX16MK38AOv6CGrKBFalGTl0vg>
    <xmx:eq5jYkB8Y_h_2RxsC9Qpur30KJZ_raKHIy_c9sO_hGk1PQM9ihREyQ>
    <xmx:eq5jYpID5K-zOhwTNaR30_yPuOXjjoQAJukcx4vEB98U3Rq1GzSSdg>
    <xmx:e65jYg0fWnt3ST1BfHf8q4FaP3cSKiQ16M6-lNEsYxP1zXT1OzciFQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 23 Apr 2022 03:44:58 -0400 (EDT)
Date:   Sat, 23 Apr 2022 09:44:56 +0200
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
Subject: Re: [PATCH 16/22] clk: Remove redundant clk_core_init_rate_req() call
Message-ID: <20220423074456.mmkihnx5ls3oocbh@houat>
References: <20220408091037.2041955-1-maxime@cerno.tech>
 <20220408091037.2041955-17-maxime@cerno.tech>
 <20220423040250.648EFC385A9@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220423040250.648EFC385A9@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 22, 2022 at 09:02:48PM -0700, Stephen Boyd wrote:
> Quoting Maxime Ripard (2022-04-08 02:10:31)
> > Since all the users of clk_core_round_rate_nolock() will now properly
> > initialize, there's no need for it to initialize the request itself.
>=20
> Probably this needs to be combined with the previous patch.
>=20
> >=20
> > This is even dangerous, as if the clock cannot change its rate by itself
> > and has CLK_SET_RATE_PARENT, clk_core_round_rate_nolock() will call
> > itself with the parent clock but the client clk_rate_request structure.
> >=20
>=20
> I think the next sentence is part of the single sentence paragraph
> above.
>=20
> > We will then reinitialize the child request with the parent context
> > (parent, boundaries, etc.), which is an issue if the parent ever changes
> > its own parent or parent rate.
>=20
> The parent of the parent can't be the parent of the child, i.e. itself.

I already explained this a bit more in my answer to patch 15.

> I guess this is only a problem if clk_core_init_rate_req() starts
> setting min/max?

The bugs I were seeing were mostly about the parent related infos
(best_parent_rate and best_parent_hw) leaking into the child request.

> We want to leave those members unchanged so that the
> rate request can flow up through the tree and be modified when rounding
> rates from a grandchild. That's why the child req is passed up to the
> parent if the child can't round itself. The boundary of the child is
> moved to the parent.
>=20
> Definitely the rate should be clamped through a parent to the
> grandparent taking into account any of their constraints. Perhaps the
> bug is that __clk_determine_rate() doesn't clamp to boundaries like
> clk_hw_round_rate() does by calling clk_core_get_boundaries() and then
> mixing in the new requests boundaries.

That should work fine though, I've added some tests to make sure this is
working properly after a few fixes
(clk_test_single_parent_mux_set_range_round_rate_child_smaller in patch
5, clk_test_single_parent_mux_set_range_round_rate_parent_only and
clk_test_single_parent_mux_set_range_round_rate_parent_smaller in patch 19)

Maxime
