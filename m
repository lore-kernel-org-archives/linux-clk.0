Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCAF7C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jun 2022 14:30:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241371AbiFCOar (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jun 2022 10:30:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230293AbiFCOaq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jun 2022 10:30:46 -0400
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com [64.147.123.21])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B64494C42B
        for <linux-clk@vger.kernel.org>; Fri,  3 Jun 2022 07:30:45 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 44F2A320095A;
        Fri,  3 Jun 2022 10:30:44 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute4.internal (MEProxy); Fri, 03 Jun 2022 10:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1654266643; x=
        1654353043; bh=753duY4OnL3/TpcxGjLLye2hLjK+YCDC5lUrR2n6d4s=; b=T
        7wb1aPVYHKEMv1R/V93csCKGvYgLjXM1C3CXWqZHWa5kd0dDbPEkSbNO3inHqtgN
        sFDq+0vc/HOKZTKLXDAbc5C6vn8J0cwd8IGBvn7up54Q1Acfh/+9LkJ9f+iq5N+J
        YhFvFsC7tc6tevrH0MUNoX99heqXENlvewG5yvi+VakhU42Qcpk+ProhPEHKEoH9
        Tvqi2fTAO6R9cv9xm6HJPqlzTy7UYZWcnuk59s+f+lra4c+YXEVULlvmfQUIlCqS
        2CFZ6YR/qbBAGmeS0QNFVRW5AzfRam845IrXEzoiJkJvI2XKVrjPvtm08YYvzVsF
        90jPIRxPq8Kws6VecP9kA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1654266643; x=
        1654353043; bh=753duY4OnL3/TpcxGjLLye2hLjK+YCDC5lUrR2n6d4s=; b=Y
        yY0BUuyw0LcMVlZcp3XKDnSOQPiIQVd6TJwjWLV2bh+PpCOTjcBSL9lIFg1nlHUt
        2PZrin+rjykcOzLsOuG5u4LFbS2Oges330HStDon4tkiZSnJbHsT/IBirKvZQY4p
        uF4e5oCLfNHzP4lEF52vqx8eCZC4N4dGtUuTKGP5awXsajkw5iixrmzoQ2BJrzQ2
        6/eAbiS3qycca5R4N/FGiJH8hweI7d88xXxwhqXpBN0GYi5tU/QX2PTKfdkeM/c0
        UnJMLwq3m9paOdx1T7VLXyoFmIK1gkNJeKll637y/LG5W3IYHurYuBqCB4LC29XV
        Fc5+WWW16wEMAFtxaTOpg==
X-ME-Sender: <xms:EhuaYuEOrue2OGfWWp0_ygYFOQpnLYxtLwkWJpmQUZRk_XixiPqU9A>
    <xme:EhuaYvWX3CM7AtaRI2D_FTMq8dp-cp4rnBothOs7qNkplT0xy99nFqfJ9a7so10Ks
    ACFuGeGCR12SWXScbg>
X-ME-Received: <xmr:EhuaYoIpr_jDkn5VRuwSyl6uouHPm0vDDm66yYcnS2ETkUs0ejZU-YkVJB84>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrleeigdejhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtvdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeetgfelgefggeekkefggfeludeiudffjeffgeevveekjedukedtudeuteef
    teefgfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EhuaYoHkmoYhHfmrUnEgonU3ht5HczYXOk-4h-ksgVBEYzI-7ByZfw>
    <xmx:EhuaYkX1bjoES5DZ8P0xOgNH6vXWP2F9UCDsrQDgU-cC02z6mF5Q5w>
    <xmx:EhuaYrMIHQRE1FsK4ygoynnbhb1Klwqu0u9I0AxKjVqWOE9VQhuGtQ>
    <xmx:ExuaYoQnpmrDlSZURsBJsC9oGKqgQTRVDdIANRsvgqSKYt_zbx7BRg>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 3 Jun 2022 10:30:42 -0400 (EDT)
Date:   Fri, 3 Jun 2022 16:30:40 +0200
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH v3 00/28] clk: More clock rate fixes and tests
Message-ID: <20220603143040.pjcelo6a5packoaj@penduick>
References: <20220511144249.354775-1-maxime@cerno.tech>
 <20220511144830.wgs6zt27gzckbzng@houat>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220511144830.wgs6zt27gzckbzng@houat>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen, Mike,

On Wed, May 11, 2022 at 04:48:30PM +0200, Maxime Ripard wrote:
> On Wed, May 11, 2022 at 04:42:21PM +0200, Maxime Ripard wrote:
> > Thanks to the feedback I got on the previous series, I found and fixed a
> > number of bugs in the clock framework and how it deals with rates,
> > especially when it comes to orphan clocks.
> >=20
> > In order to make sure this doesn't pop up again as a regression, I've
> > extended the number of tests.
> >=20
> > The first patch reintroduces the clk_set_rate_range call on clk_put, but
> > this time will only do so if there was a range set on that clock to
> > begin with. It should be less intrusive, and reduce the number of
> > potential side effects considerably.
> >=20
> > We then have a fix for the qcom rcg2 issue that has been reported
> > recently, and two patches to address a regression with the RaspberryPi4.
>=20
> Those four patches are fixing regressions in 5.18. Even though the later
> patches are also fixing some issues, the first four should have your
> priority over the rest.

Could we please move forward on this?

Maxime
