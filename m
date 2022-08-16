Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92260C25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:51:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbiHPLv0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235003AbiHPLuY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:24 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C823ECEC
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:25:38 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 7BD513200921;
        Tue, 16 Aug 2022 07:25:36 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Tue, 16 Aug 2022 07:25:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1660649136; x=1660735536; bh=6prhc53UPP
        aO1noQ5A69LuSsUInxzCnRGeHJJeRAVms=; b=nT3CYJxQQ3phgdRG3XeuLmULeb
        4m6Ssgn72CR6ySKKF9bqgv6ZNTfE+wnTY+XrZEHFFOiShfc4u2DmYMmq61FV87LS
        uUcMcHrfXA5sDWHlt6VHM2pxmKyPYFFSH6l8I7BZiWSuxy/koHDjB+D0RA1hayJd
        4x7jH6/rrJgeEwOBp1uTYVNZ5ZerF//p8Zpl7iPpb9e+OM8ge/g1jBieuFdhiqgV
        +w5NNJGClOLiNk9RLHwGOtxYIyPFQDWV9kd+Gkh6ki5t14nxNziXsM7wlQNYufbi
        pYlccc8CB51m0dmWJAYLnGBJBQMY10pk9/cpakkf23yKdDjelOn7ciQaAs9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649136; x=1660735536; bh=6prhc53UPPaO1
        noQ5A69LuSsUInxzCnRGeHJJeRAVms=; b=e4hGB0wCSUKSoEp59EhyYO2xb/Ln6
        cxxXTVWmNxm/NfXVT/UMMmZdedPZNVGKvCQDS9gjkLXFjSTqswqGBz1jrRs4u9Av
        rsVtRO2nU5h9vT5nZVatES0R8MIntJu8oPPNi3OYGde/ZWU+NhhLwP0gMvWxloY8
        vtqKvG/4flM7e1C4K+mvmBFGlOT7KMyQzQyfCAKRjTkf0lkYve+flctI7Fipqg2D
        E3f1aTOKBwLpR86k6T0ZwWjGVB9wL+wCLjzDvATNV2zQ9+XH1KyEp0rpThAF6vYQ
        Kqy+SufWNycFb0mvSok1p/KIH1xWzfoSe+1+GyNLB5RN/+AjrqpPBWOYA==
X-ME-Sender: <xms:rn77YrKRNZnO7jxQH08VCRbDJKw-IXmuDzQoPOFJOKJEK5cw7EREDA>
    <xme:rn77YvIQw1B9KT-hgmFqs8ST97N-g4SD-HbqcMgCuHZ5-H06BHOF3YiIhQxveOm2l
    snit9-5s5dg_PxzffM>
X-ME-Received: <xmr:rn77Yjv7vxZre0jrLXWp8i_f8qzwbXeYc_CQYSYcjfe9nnluL34WxFzkCYU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgtggfgsehtkeertdertdejnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepledvtdegkeegtdejvdejvdejleeifeegfeevueegvddvleevieeghffhtdet
    geffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:rn77YkZmvDR-F_UFPK6IdR5wogNb5GfAHP0IVgY5LEioZxDMZb7afw>
    <xmx:rn77YiY05vCUzqVDrYdCzaO7Z1zmPINqhyP1WTpvY21I3NCMMv4peQ>
    <xmx:rn77YoD0zOwoAFJr_SuKJkp1HY7ZzITsRz8O4Ghffmeyk6nbWKpuqQ>
    <xmx:sH77YvQbemjpTDpnB-QRXZJ5AzWhAnAbSUdk97pbUwHxHISSXGRnHA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:25:33 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 00/25] clk: More clock rate fixes and tests
Date:   Tue, 16 Aug 2022 13:25:05 +0200
Message-Id: <20220816112530.1837489-1-maxime@cerno.tech>
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

Changes from v8:
  - Fixed a regression when probing a clock driver backed by a device accessed
    through a bus that might sleep

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
 drivers/clk/clk.c                 |  288 ++++--
 drivers/clk/clk_test.c            | 1413 ++++++++++++++++++++++++++++-
 drivers/clk/qcom/clk-rcg2.c       |    9 +
 include/linux/clk-provider.h      |   18 +-
 include/linux/clk.h               |    2 +-
 10 files changed, 1665 insertions(+), 109 deletions(-)

-- 
2.37.1

