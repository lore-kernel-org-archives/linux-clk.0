Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0625C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:25:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232893AbiEPNZi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:25:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiEPNZi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:25:38 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D37827CDB
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:25:36 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 0B9F13200A01;
        Mon, 16 May 2022 09:25:31 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 16 May 2022 09:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1652707531; x=1652793931; bh=Oz1G3tra9i
        E2kthgLk8k2+oZEN2GsSgqIIifzgkF52A=; b=gCRjUn2XQ+mn3qDVyBjp1YWGBi
        ad+sEyiIghvrLLCBqLsCQpFtxKaMMfkqeu8sv3edwj3RuS1fSRQBRUFR1BPGzRWT
        Y9C+eouDjPl4DamIACM8OIKPUou7fWjTTCKhoja4mjhcrclxOTaZ32mlRvAgWYlz
        uiFQPUbi+/ko/Cu3moDcBRKxCy1TMX7Lmt/O/gxsqLouP8kZFI/555/zai2R0W8s
        QdJk/o/F/lR+Bk1+UPDqmfcHoPzrLEf0yRu8/IOFM/gGIF+wnd1sMBx0ytDietXS
        t3aEmlTnhWRG1etBd09sIUy6sOGzmZ76KWwFH+aPQ0Z/jyTH92fpg3bHRRSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707531; x=1652793931; bh=Oz1G3tra9iE2kthgLk8k2+oZEN2GsSgqIIi
        fzgkF52A=; b=MiIJciIgP6gOiZlIQg8P8NM1jJzM5aTqKyXk2vPtjMh7+R5w5oz
        +wjSB6OUh9MR8mYIwoWB4vKQIYt4eSJCmCqB2G2CwKD+tx4NIbp8mLrMciAj53iy
        bfhYNAzEWHpN+nQtIuVRw45mkJSQtNAeITGv7qtmLAk0IeQ+BcnUvIDvEhyuR/GM
        o3kBsddo2YhYqXfiwjT2Kzb0wysbRls3P5gAwDQVTgOW/lm42ixEC4B8FyJNTAX/
        3h2nODoTiW86we2mOJBmzdhnJegIC7ffioMVR42YCa6XpvQBlZ4jPT1uL91HhWws
        sgv64dKLGV1rM7Loivw1sW6/19PA7TG5xuw==
X-ME-Sender: <xms:ylCCYhMGazOcKerwx2mjONe1Ve9Al0LnAr_-70t2uhD0FT5hzYLhqw>
    <xme:ylCCYj_EgGddwLbbWmqP_2QZlWo06c71psv89rUrjcht-X1Z-thOvCeXcAyBpgKY4
    dUDkSWgkZ_5wunABJA>
X-ME-Received: <xmr:ylCCYgSBmEUQl8531_X85cl9gT0Scupa_qcroGgPmD7bVSRFnu2hGpqpguCEE2MzzSGpHOA6QvUcfETn-gWtGM8YanKX--LjrYBxOcE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffotggggfesthekredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelvddtgeekgedtjedvjedvjeelieefgeefveeugedvvdelveeigefhhfdtteeg
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:ylCCYtvya1IhWvNzrQpg_lEVgsPHspO08ygAPcdwxmyWVTEZpIzIDQ>
    <xmx:ylCCYpftThzT-YsDqZt-uzw93W2XapzmldCvHeqlbDWO89oyAmzkWg>
    <xmx:ylCCYp1vK3HxVKHVIkghPKMBR2B5__CcFvjTHYHsjBCuxnl6X6Qcog>
    <xmx:y1CCYqUTuKZQthlGSJZC9IPLbewPpW21RVPHcKnR6UeliJJSKLZMvA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:29 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 00/28] clk: More clock rate fixes and tests
Date:   Mon, 16 May 2022 15:24:59 +0200
Message-Id: <20220516132527.328190-1-maxime@cerno.tech>
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
  clk: Drop the rate range on clk_put()
  clk: Skip clamping when rounding if there's no boundaries
  clk: Introduce clk_get_rate_range()
  drm/vc4: hdmi: Rework hdmi_enable_4kp60 detection
  clk: Mention that .recalc_rate can return 0 on error
  clk: Clarify clk_get_rate() expectations
  clk: tests: Add test suites description
  clk: tests: Add reference to the orphan mux bug report
  clk: tests: Add tests for uncached clock
  clk: tests: Add tests for single parent mux
  clk: tests: Add tests for mux with multiple parents
  clk: tests: Add some tests for orphan with multiple parents
  clk: Take into account uncached clocks in clk_set_rate_range()
  clk: Fix clk_get_parent() documentation
  clk: Set req_rate on reparenting
  clk: Change clk_core_init_rate_req prototype
  clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock()
    to its caller
  clk: Introduce clk_hw_init_rate_request()
  clk: Add our request boundaries in clk_core_init_rate_req
  clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
  clk: Introduce clk_core_has_parent()
  clk: Stop forwarding clk_rate_requests to the parent
  clk: Zero the clk_rate_request structure
  clk: Test the clock pointer in clk_hw_get_name()
  clk: Introduce the clk_hw_get_rate_range function
  clk: qcom: clk-rcg2: Take clock boundaries into consideration for
    gfx3d
  clk: tests: Add some tests for clk_get_rate_range()
  clk: tests: Add missing test case for ranges

 drivers/clk/at91/clk-generated.c  |    5 +-
 drivers/clk/at91/clk-master.c     |    9 +-
 drivers/clk/at91/clk-peripheral.c |    4 +-
 drivers/clk/clk-composite.c       |    6 +-
 drivers/clk/clk-divider.c         |   20 +-
 drivers/clk/clk.c                 |  304 ++++--
 drivers/clk/clk_test.c            | 1465 ++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-rcg2.c       |    9 +
 drivers/gpu/drm/vc4/vc4_hdmi.c    |    2 +-
 include/linux/clk-provider.h      |   18 +-
 include/linux/clk.h               |   64 +-
 11 files changed, 1814 insertions(+), 92 deletions(-)

-- 
2.36.1

