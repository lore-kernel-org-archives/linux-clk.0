Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AAA8C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 28 Apr 2022 16:43:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350240AbiD1QrA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Apr 2022 12:47:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349980AbiD1Qq7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Apr 2022 12:46:59 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7C8F6E8DF
        for <linux-clk@vger.kernel.org>; Thu, 28 Apr 2022 09:43:43 -0700 (PDT)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 2F4265C00F7;
        Thu, 28 Apr 2022 12:43:43 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Thu, 28 Apr 2022 12:43:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1651164223; x=1651250623; bh=znb99JWXfL
        dMfOBo11AcLOE+mnAAW16LC5Pa7WIodd0=; b=xa3BddL9v8MepFpNufKKGY2FDc
        UhJngPJTrHKbXYScq+dO5CHjbiTdNDBZtC+PpW/TGkHViF8pYw5nMYDcvnRLWDDN
        vqeKZ3trScSheZu9eCtLn+eKwtub4MehOdhdMYq4rk4qBChQWh+J6tHOUhtmGnkG
        If5q6vn4aOh0zyYKle4EAm8IKhll1dJzC2RaSG4YrMo84QCfs7+8HYxaWat/bljz
        3FMtCPlYHkPInfRWvzZhZTLKqiLa63dlvEOYnge5Rhj/v0jLpIA5gi1ZxshQyo2b
        f/aRJlK6VJT/xsQ0Tq5Dyvi+yIekZkmf0dKsbNKZsQb5EGFtDZ+zfJSMessA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1651164223; x=1651250623; bh=znb99JWXfLdMfOBo11AcLOE+mnAAW16LC5P
        a7WIodd0=; b=gqamQS7pcTJP+zFyWxBSEAdw2Z4tHBKI5NjIlc1iTBEdu/bc1Zu
        FuSGjQVS0UZG5pqGqWvDvazWFJOdQVxZS7scaOqIEOxhDI2ywMumhxHu0PigryhV
        XNXTh0CSNu64/aXhUksRbWFbFOopK9ZOI+g85rFBIYF7qrxAYGMXXalNle7ANepr
        aCIY8E+xyKHdWnJd0JttWUI7gwFcAm9cYcqvnvuTVpLzHqI7dK6h9e0QZAUgvzXC
        rVZpifvbiQOFLQ+af0zIsac6qVstSOVNhgjGnnLGLL4vr2HOeCA2x+xwGeedDK1a
        OS0/c4Ymumfq/hsT5BlS9ctRzIUZ7kaCB8Q==
X-ME-Sender: <xms:PcRqYof-lNA0hF1UgeQxj4SkUWTuusgyj8yMMPRceQpcrS5P4zMxnw>
    <xme:PcRqYqPFh6rl-1O611HUA8qOOjrJf90BB01e8WDhZ0oUJANIMkjbA878Azq06KmMT
    O1gf-_7qah-zErlWxw>
X-ME-Received: <xmr:PcRqYpjwAxu-Uf6PnABNQsFu-jXCb2sNbTMwqsc7s2B44yI3Y9ir1FrXDlh5KVnAXN0QjECnBwtzzRl0xNszmL0CU2rpznWMnxleyrA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejgddutdeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgtggfgsehtqhertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleehhfegfeeitdeggefgudfftdekfeelkeefvdehiedujefggfevkeduteef
    ueeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:PcRqYt9s2euv2MW5X9iWmlaUSMXp0ROJWrakwF5T0ngB66Ntj3L80A>
    <xmx:PcRqYkt5O78arf7N46Io7vfxLXzweP4aCemUbbPwTRmoPFuPhOxAgA>
    <xmx:PcRqYkGjVjckZksVxJhxzp4i0rf5pyIyrckxq_7OchnV4PDNmQGFNQ>
    <xmx:P8RqYln0bqs9cj4qpWmnlBGaFGLNBawgY8OusZwYWxjZjRCwE8kvDA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 28 Apr 2022 12:43:41 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 00/28] clk: More clock rate fixes and tests
Date:   Thu, 28 Apr 2022 18:43:10 +0200
Message-Id: <20220428164338.717443-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,=0D
=0D
Thanks to the feedback I got on the previous series, I found and fixed a=0D
number of bugs in the clock framework and how it deals with rates,=0D
especially when it comes to orphan clocks.=0D
=0D
In order to make sure this doesn't pop up again as a regression, I've=0D
extended the number of tests.=0D
=0D
The first patch reintroduces the clk_set_rate_range call on clk_put, but=0D
this time will only do so if there was a range set on that clock to=0D
begin with. It should be less intrusive, and reduce the number of=0D
potential side effects considerably.=0D
=0D
We then have a fix for the qcom rcg2 issue that has been reported=0D
recently, and two patches to address a regression with the RaspberryPi4.=0D
=0D
All the other patches should be probably be flagged as fixes, but=0D
they've never seem to have shown any real-world issues until now, and=0D
they aren't all really trivial to backport either, so I'm not sure it's=0D
worth it.=0D
=0D
There's also some documentation improvements for recalc_rate and=0D
clk_get_rate to hopefully make the documentation less ambiguous and=0D
acknowledge that recalc_rate() returning 0 on error is fine.=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Changes from v1:=0D
  - Rebased on top of next-20220428=0D
  - Dropped the patch to prevent non-orphan clocks from registering if=0D
    their recalc_rate hook returns 0=0D
  - Added some patches to clarify the clk_get_rate and recalc_rate=0D
    documentation=0D
  - Dropped the patch to skip the range setup on an orphan clock that=0D
    was introducing a regression on RaspberryPi3 when a monitor wasn't=0D
    connected at boot=0D
  - Added a patch to skip the rate clamping in clk_round_rate() when=0D
    min_rate =3D=3D max_rate =3D=3D 0=0D
  - Added a new set of functions to query the clk boundaries and fix a=0D
    regression with the RaspberryPi4=0D
  - Fixed all the drivers hand-crafting their clk_rate_request=0D
  - Reworded the test suite descriptions=0D
  - Reordered a few patches to ease the review=0D
  - Reworded some commit logs to better explain the issues they address=0D
  - Collected the Tested-by of Alexander and Marek=0D
  - More tests=0D
=0D
Maxime Ripard (28):=0D
  clk: Drop the rate range on clk_put()=0D
  clk: Skip clamping when rounding if there's no boundaries=0D
  clk: Introduce clk_get_rate_range()=0D
  drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection=0D
  clk: Mention that .recalc_rate can return 0 on error=0D
  clk: Clarify clk_get_rate() expectations=0D
  clk: tests: Add test suites description=0D
  clk: tests: Add reference to the orphan mux bug report=0D
  clk: tests: Add tests for uncached clock=0D
  clk: tests: Add tests for single parent mux=0D
  clk: tests: Add tests for mux with multiple parents=0D
  clk: tests: Add some tests for orphan with multiple parents=0D
  clk: Take into account uncached clocks in clk_set_rate_range()=0D
  clk: Fix clk_get_parent() documentation=0D
  clk: Set req_rate on reparenting=0D
  clk: Change clk_core_init_rate_req prototype=0D
  clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock()=0D
    to its caller=0D
  clk: Introduce clk_hw_init_rate_request()=0D
  clk: Add our request boundaries in clk_core_init_rate_req=0D
  clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock=0D
  clk: Introduce clk_core_has_parent()=0D
  clk: Stop forwarding clk_rate_requests to the parent=0D
  clk: Zero the clk_rate_request structure=0D
  clk: Test the clock pointer in clk_hw_get_name()=0D
  clk: Introduce the clk_hw_get_rate_range function=0D
  clk: qcom: clk-rcg2: Take clock boundaries into consideration for=0D
    gfx3d=0D
  clk: tests: Add some tests for clk_get_rate_range()=0D
  clk: tests: Add missing test case for ranges=0D
=0D
 drivers/clk/at91/clk-generated.c  |    4 +-=0D
 drivers/clk/at91/clk-master.c     |    9 +-=0D
 drivers/clk/at91/clk-peripheral.c |    4 +-=0D
 drivers/clk/clk-composite.c       |    6 +-=0D
 drivers/clk/clk-divider.c         |   20 +-=0D
 drivers/clk/clk.c                 |  302 ++++--=0D
 drivers/clk/clk_test.c            | 1465 ++++++++++++++++++++++++++++-=0D
 drivers/clk/qcom/clk-rcg2.c       |    9 +=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |    2 +-=0D
 include/linux/clk-provider.h      |   18 +-=0D
 include/linux/clk.h               |   64 +-=0D
 11 files changed, 1812 insertions(+), 91 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
