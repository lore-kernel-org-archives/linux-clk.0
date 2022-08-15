Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE078C25B0E
	for <linux-clk@archiver.kernel.org>; Mon, 15 Aug 2022 15:42:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232726AbiHOPmM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Aug 2022 11:42:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232682AbiHOPlz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Aug 2022 11:41:55 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C080764E6
        for <linux-clk@vger.kernel.org>; Mon, 15 Aug 2022 08:41:53 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 42BF23200904;
        Mon, 15 Aug 2022 11:41:52 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Mon, 15 Aug 2022 11:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1660578111; x=1660664511; bh=LBrIlKuNM/
        1w06yBdXUfUaffM3mVFpisH4+kIlM2aFc=; b=gBFsI99qClhjB1N6OBUsfXkp2i
        HZptqJPGVJg+AV1YJYuIEFWOIKVPRlD0FnVByISfKdjuejnbXKT0gJjZkLTjmQxq
        GR8igLMgHXOKuSceVnbMlO+WnCR6k7IkmCyWtYnvtzuABuCv4eJwprwVAGjnpEDO
        um8EaRATec/mX6jAW8l2rofHYDdmWKvAsu/UST/YTinZ9lWapzjm9gR2NEO+lqhF
        ZwX7BGP5M4h9fRFelWl0+WvSb148hhpN7U7DcpMjmpH/xhUsBeESozDdoMMrW9OL
        OQLLlXVMEYlO/8OQ1SeeWvp4QUe1AYZslwKZk1Bxvp2XnXqHZMTswJUt110g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660578111; x=1660664511; bh=LBrIlKuNM/1w0
        6yBdXUfUaffM3mVFpisH4+kIlM2aFc=; b=ergL5aPVRGtCGEEFb6py/iVPwgC4d
        AW9w7BjnNrDhMiMejlypgZ8TOktVfhV5RzC5Oi6m4NvH2Vwg3InIJRrCiYvbiFTG
        WKdZl+KHc9S+3JyugTF2WaYFTH+rRXtmCwdZg6o+PAiQ4sZncFCI0Oh+68Fv9ggI
        HWTb32AHFDtJ0FXotgEboc2ZJUdhyt2FxhkRsnQP26fgbx2naco433oqFkym++Hj
        HhZWKaYW4fJjL8RbkNecTjV2a986Nm0zn6UCODlNwhdYne1i4XPSodGYnizygz0u
        Fk/SD5JiaX7lBh8KEJ7PHrBy1Nbm5tPEWgZNlRtwL3NtvUTojYlbonTIg==
X-ME-Sender: <xms:Pmn6YjPcEQXspacaZPgWnKX9bzVHPpZrB2meiIDUzSkfbmAfyESj1A>
    <xme:Pmn6Yt-varVnFLGLxPs2aM8Hke42ycNhdZ3D_xor93pd6Ag88vVJy4UQICGJz8GcV
    ptGL0wsuuZQ84BEyiM>
X-ME-Received: <xmr:Pmn6YiSUY5PIzd4dQ9slP3X2g1KMh5fMZoSFA9lnXkTRYxdn5lb1Yq78YdkX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehvddgleefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
    geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:Pmn6YnvXkUbz1j2jAJVmZYthxzHdluxHRiTgD_aFZJL8IbDnCy_cIQ>
    <xmx:Pmn6YrcFWZ8En5QsakPUZ8GRUhGLDVyvNnF8KjLb5UV6WfrpkYbPXw>
    <xmx:Pmn6Yj11pEtzVLjAbpkBB89hNDxBsud_qsxp4XWo7I1YQt-enaLCyA>
    <xmx:P2n6YsVz-O5DkN2VvxTN7qlIWvayR0Vr5rSLk1bYUnpb9LKMsa1Niw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 15 Aug 2022 11:41:49 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v8 00/25] clk: More clock rate fixes and tests
Date:   Mon, 15 Aug 2022 17:41:22 +0200
Message-Id: <20220815154147.1631441-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
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
recently.

All the other patches should be probably be flagged as fixes, but
they've never seem to have shown any real-world issues until now, and
they aren't all really trivial to backport either, so I'm not sure it's
worth it.

There's also some documentation improvements for recalc_rate and
clk_get_rate to hopefully make the documentation less ambiguous and
acknowledge that recalc_rate() returning 0 on error is fine.

Let me know what you think,
Maxime

Changes from v7:
  - Dropped the RPi fixes
  - Rebased on 6.0-rc1

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

Maxime Ripard (25):
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

 drivers/clk/at91/clk-generated.c  |    5 +-
 drivers/clk/at91/clk-master.c     |    9 +-
 drivers/clk/at91/clk-peripheral.c |    4 +-
 drivers/clk/clk-composite.c       |    6 +-
 drivers/clk/clk-divider.c         |   20 +-
 drivers/clk/clk.c                 |  284 ++++--
 drivers/clk/clk_test.c            | 1413 ++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-rcg2.c       |    9 +
 include/linux/clk-provider.h      |   18 +-
 include/linux/clk.h               |    2 +-
 10 files changed, 1661 insertions(+), 109 deletions(-)

-- 
2.37.1

