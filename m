Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E395C43334
	for <linux-clk@archiver.kernel.org>; Fri, 15 Jul 2022 16:00:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231838AbiGOQA2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Jul 2022 12:00:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230239AbiGOQA0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 15 Jul 2022 12:00:26 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C8B9B6D2D2
        for <linux-clk@vger.kernel.org>; Fri, 15 Jul 2022 09:00:23 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id 69A023200A25;
        Fri, 15 Jul 2022 12:00:20 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Fri, 15 Jul 2022 12:00:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm2; t=1657900819; x=1657987219; bh=RQEPhSw8Bs
        0Qfuur61zqstUMfsYFRd1v50uVvprqVUE=; b=hA2K0eTidoq9Y1Up9l0FTYKwQ4
        a6r6nenJgP4a19EjZtbIedrxix1eJQU9SgaX9eNljrvM0HJC/gKtGZtLATjdUvQS
        trdffEIH+vp6hBWNdQHQAwszOpHNHCfwo6dMXstgaplQskhaWDsv03SBxJRFsvMf
        AfoQPh+8xdHNyyGY1dCgCph5OSx433K8GNiJskohmIs09eMBvixrq1BsnDMT8Vyg
        nqrgQjp2N0KI/xIEa2+xDnnB2OPkqXelCpdTFbh65Z/st6IX6iFqiY8hi8SasteH
        s0yh1u36fP77f/doK6nDx8RzdotruwbsxShUluZ8wBqOLqbScjvBt8eLU8Fw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1657900819; x=1657987219; bh=RQEPhSw8Bs0Qf
        uur61zqstUMfsYFRd1v50uVvprqVUE=; b=WIfYp+6OaQzZip8f7ahgi0cV/9tky
        qWjsBPIR7SB+mKLP+stk8/z7EmyX/cYm9KzSW0CUBYyzHiSdGuO+DRFRsQcCi4Rj
        +lw9g69TKV2SYSbMWHti2sXmy+sEO7rLVYf5i93OCuP+FOENrGlWBjbQAk9eto0Z
        Oxm2DHgq0jxbkY2YHO5C35HvsbOkuvoQx5hHm2+qPd1qQ5dx0pm6tsKZtCXnXgd1
        NyE+DJVss2eD9wRS7J1jmS83XWUBYvoSrHNYa50AfzmCOEgLHfJZobAks242GSPm
        pTFofJD81HlT3nSf1YMIOgeKvJB18hUWSuGq1QNySHPCv0Zlw3xn1RXjA==
X-ME-Sender: <xms:Eo_RYs87b_1DoH4y0IBevzaAK_04KqPDOvuWIR6pnXKrLjqRuFLK6A>
    <xme:Eo_RYkuN4sTJjccf41pBqRW7FtLg_3ANRrCO_EulZ0fD6Y84SI4AGD2J38xfuJlrH
    26CHk9lKjXmYk8DIrk>
X-ME-Received: <xmr:Eo_RYiDj66FV7Dk3wt9p3wllxZTl0GZt9ICK-Xi1FW4SeWih4kmDzfumdZiTJyTT6UcuJAKihqFKFnhAuyqVeQCRjL9bBoDMCDD-K5k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrudekuddgleejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
    geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Eo_RYsfg4UXh54xpDdTw8IJBrL_bvpYI1Ng4JqXgSOTJ3yDrj45-mA>
    <xmx:Eo_RYhND17amgvjd5jE9wlL7rcr-ue6nZQMFmro-qadN6sD7wCOT7Q>
    <xmx:Eo_RYmk9VRCXbK9dX2DIGW2KZcHPb5QZANf9xb0tcZ65vJx7NhNTQQ>
    <xmx:E4_RYiHAMDDxBBuuECJwtHk1BnhNMNXGdWLynIqipyIGraTTsRAzng>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 15 Jul 2022 12:00:17 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 00/28] clk: More clock rate fixes and tests
Date:   Fri, 15 Jul 2022 17:59:46 +0200
Message-Id: <20220715160014.2623107-1-maxime@cerno.tech>
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

Changes from v6:
  - Fixed a kernel build bot warning

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
 drivers/clk/bcm/clk-raspberrypi.c        |   46 +-
 drivers/clk/clk-composite.c              |    6 +-
 drivers/clk/clk-divider.c                |   20 +-
 drivers/clk/clk.c                        |  284 ++++-
 drivers/clk/clk_test.c                   | 1413 +++++++++++++++++++++-
 drivers/clk/qcom/clk-rcg2.c              |    9 +
 drivers/gpu/drm/vc4/vc4_hdmi.c           |    3 +-
 include/linux/clk-provider.h             |   18 +-
 include/linux/clk.h                      |    2 +-
 include/soc/bcm2835/raspberrypi-clocks.h |   15 +
 13 files changed, 1716 insertions(+), 118 deletions(-)
 create mode 100644 include/soc/bcm2835/raspberrypi-clocks.h

-- 
2.36.1

