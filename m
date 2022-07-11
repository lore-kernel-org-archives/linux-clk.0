Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9CADC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Jul 2022 15:24:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiGKPYa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Jul 2022 11:24:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbiGKPY3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Jul 2022 11:24:29 -0400
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9FFCF592
        for <linux-clk@vger.kernel.org>; Mon, 11 Jul 2022 08:24:28 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 28DBD5C0130;
        Mon, 11 Jul 2022 11:24:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 11 Jul 2022 11:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1657553068; x=1657639468; bh=0PgRom/deE
        fOeHxSxIjueTc/Lz9hXX2dFuioOrjhyxA=; b=DPkrpF/9DxaCxj5r75mIu6UTj8
        d8MZ7RB0S45bBT1VjnWWVsVHQhuSVM77DMgwAE3KB2k4YyI0Ju6yvaX2CwzaMlOS
        +aypO8h/zOBkdZ8iUgb6DcJA9xVIio2oKgnAxE2ZW68/rpY6eIBuxysdd8aq7OSY
        bbDUhM7E6tOwyCpcsyKsem424XAIsR4prwzxYnAnLl1cUtNGz8PFBAmSLCgAN/SN
        kS5RKQeLMAxaQZG7aGgc+WKSXpYF+aDhyWZ7un15Nzu9uviCyuFezdSWiz25gVcB
        IZxSqN+6oBen4XK5V44hUv8YZnYwLwGpl6APeaKBHC2sFoPt2nQa7zYMuwRQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657553068; x=1657639468; bh=0PgRom/deEfOe
        HxSxIjueTc/Lz9hXX2dFuioOrjhyxA=; b=YYNi+gPBzgZ8a/GLaVC2aojFgj++M
        K2jO4yFKASwrMPX1o0CMehugR3REEzvRAwZUqe5ppi4cx8w+X6LmZ/sjsNQnBw9V
        X8193zuK356SGQD5+Ia9Cx3SljkZfEkxObR4RIow9AcFH4+UegQ1BJBVw4C9X6Fp
        u0SQjq6s5ZjKPR8zvyHupVWRc5v15JmlZeN+wWtYc3T+eRpZUh9uSnrfg8NyIa45
        ZavBg5MWP2T1X+CpQf5n17G9y1/iyQKCvriscbNHunPqDEwVkag9zvjxppbj/Yh5
        3wXTCpZAoTZ9bd5SYMipw5FODaettu4FKvtlo+y5l8S0m58SGGfE1gfbw==
X-ME-Sender: <xms:q0DMYi1U0mqJTyEk0D_sMSEJb3WcKwjwhlAD0jHr6JjMeBHv0mVkVA>
    <xme:q0DMYlFhoFoz9ACmjQYFXTll4TwP-1biSQqZRc7LFeyNyMSq50nobVK3aG_xZv0E4
    uTyQtCiR3-qk-y541w>
X-ME-Received: <xmr:q0DMYq6NxJk5VSFMyF7NPWMW-FZa8nh4DZmvIsHlSnSEH0rosfACGlSxANqVWVCsy02I1KgxUl0dCvZfmk2kDcG9DEIzbyZ0PASqyeQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudejfedgkeeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
    geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:q0DMYj0TRtUX5BmY5jdVY2OLTuUwncuIJH0YGeOjGQNlSTyUDh9eOA>
    <xmx:q0DMYlHDnqJlpwczS7zxVCKhR7f0aySouqEbfgl5CTtid7WRnBdYkQ>
    <xmx:q0DMYs-Lpq46cKHcL9bAIY7xgv5CbRdQcpVtVnGexPaEdU3fUpqbGg>
    <xmx:rEDMYt_L8Pgt6kn6oY1Si8AfR6I68XcFj5ema46Za6PYwyJxjPFa0Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 11 Jul 2022 11:24:26 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v6 00/28] clk: More clock rate fixes and tests
Date:   Mon, 11 Jul 2022 17:23:56 +0200
Message-Id: <20220711152424.701311-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Thanks to the feedback I got on the previous series, I found and fixed a
number of bugs in the clock framework and how it deals with rates,
especially when it comes to orphan clocks.

In order to make sure this doesn't pop up again as a regression, I've
extended the number of tests.

The first patch reintroduces the clk_set_rate_range call on clk_put, but
this time will only do so if there was a range set on that clock to
begin with. It should be less intrusive, and reduce the number of
potential side effects considerably.

We then have a fix for the qcom rcg2 issue that has been reported
recently, and two patches to address a regression with the RaspberryPi4.

All the other patches should be probably be flagged as fixes, but
they've never seem to have shown any real-world issues until now, and
they aren't all really trivial to backport either, so I'm not sure it's
worth it.

There's also some documentation improvements for recalc_rate and
clk_get_rate to hopefully make the documentation less ambiguous and
acknowledge that recalc_rate() returning 0 on error is fine.

Let me know what you think,
Maxime

Changes from v5:
  - Rebased on current next (next-20220711)
  - Dropped clk_get_rate_range, and used a custom function instead
  - Switched all tests to use clk_hw_get_clk() instead of struct clk_hw->clk
  - Removed some intermediate variables
  - Added some comments
  - Dropped clk_get_parent() changes
  - Dropped test on clk_hw pointer non-NULL in clk_hw_get_name
  - Made clk_has_parent more const

Changes from v4:
  - Fix build breakage on SAM9x60

Changes from v3:
  - constness warning fix in clk_core_forward_rate_req

Changes from v2:
  - Rebased on top of current next
  - Fixed locking issue in clk_get_rate_range

Changes from v1:
  - Rebased on top of next-20220428
  - Dropped the patch to prevent non-orphan clocks from registering if
    their recalc_rate hook returns 0
  - Added some patches to clarify the clk_get_rate and recalc_rate
    documentation
  - Dropped the patch to skip the range setup on an orphan clock that
    was introducing a regression on RaspberryPi3 when a monitor wasn't
    connected at boot
  - Added a patch to skip the rate clamping in clk_round_rate() when
    min_rate == max_rate == 0
  - Added a new set of functions to query the clk boundaries and fix a
    regression with the RaspberryPi4
  - Fixed all the drivers hand-crafting their clk_rate_request
  - Reworded the test suite descriptions
  - Reordered a few patches to ease the review
  - Reworded some commit logs to better explain the issues they address
  - Collected the Tested-by of Alexander and Marek
  - More tests

Maxime Ripard (28):
  clk: bcm: rpi: Create helper to retrieve private data
  clk: bcm: rpi: Add a function to retrieve the maximum
  drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
  clk: test: Switch to clk_hw_get_clk
  clk: Drop the rate range on clk_put()
  clk: Skip clamping when rounding if there's no boundaries
  clk: Mention that .recalc_rate can return 0 on error
  clk: Clarify clk_get_rate() expectations
  clk: tests: Add test suites description
  clk: tests: Add reference to the orphan mux bug report
  clk: tests: Add tests for uncached clock
  clk: tests: Add tests for single parent mux
  clk: tests: Add tests for mux with multiple parents
  clk: tests: Add some tests for orphan with multiple parents
  clk: Take into account uncached clocks in clk_set_rate_range()
  clk: Set req_rate on reparenting
  clk: Change clk_core_init_rate_req prototype
  clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock()
    to its caller
  clk: Introduce clk_hw_init_rate_request()
  clk: Add our request boundaries in clk_core_init_rate_req
  clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
  clk: Introduce clk_core_has_parent()
  clk: Constify clk_has_parent()
  clk: Stop forwarding clk_rate_requests to the parent
  clk: Zero the clk_rate_request structure
  clk: Introduce the clk_hw_get_rate_range function
  clk: qcom: clk-rcg2: Take clock boundaries into consideration for
    gfx3d
  clk: tests: Add missing test case for ranges

 drivers/clk/at91/clk-generated.c         |    5 +-
 drivers/clk/at91/clk-master.c            |    9 +-
 drivers/clk/at91/clk-peripheral.c        |    4 +-
 drivers/clk/bcm/clk-raspberrypi.c        |   45 +-
 drivers/clk/clk-composite.c              |    6 +-
 drivers/clk/clk-divider.c                |   20 +-
 drivers/clk/clk.c                        |  284 ++++-
 drivers/clk/clk_test.c                   | 1413 +++++++++++++++++++++-
 drivers/clk/qcom/clk-rcg2.c              |    9 +
 drivers/gpu/drm/vc4/vc4_hdmi.c           |    3 +-
 include/linux/clk-provider.h             |   18 +-
 include/linux/clk.h                      |    2 +-
 include/soc/bcm2835/raspberrypi-clocks.h |   15 +
 13 files changed, 1715 insertions(+), 118 deletions(-)
 create mode 100644 include/soc/bcm2835/raspberrypi-clocks.h

-- 
2.36.1

