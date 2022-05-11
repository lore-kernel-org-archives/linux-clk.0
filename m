Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9AD3C433F5
	for <linux-clk@archiver.kernel.org>; Wed, 11 May 2022 14:43:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232181AbiEKOnA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 May 2022 10:43:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244917AbiEKOnA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 May 2022 10:43:00 -0400
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DA9C6472E
        for <linux-clk@vger.kernel.org>; Wed, 11 May 2022 07:42:57 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.west.internal (Postfix) with ESMTP id 1DCFC320076F;
        Wed, 11 May 2022 10:42:53 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Wed, 11 May 2022 10:42:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1652280172; x=1652366572; bh=I5bkBDHzdR
        Cg8f4i0vXw2OT0Kx/G2hjwAgXa2EpIRWA=; b=g6vCA0Mpuj5Ibsp86IPf2eO4la
        5+GX7vOovZzFhoCylQYeUCgyYIfPumLLwcm7dakBZATjloidtR3FH6Wp8isQESu5
        Nj06YemAC8xrphPX3SbusN53aWzlBLAY1mgeLic4CKODrdHP2uhM9koCHJdOwZy6
        ZgoW0FpbFYpf1+UOmxdVrmiLsxItUmWCKINSw9ICEmYmfcB4q4fNoNrff4+mJNBL
        x6lgSEMOYiK7qz7hjdyc0hXbh07O23pOqIqJeEJLkEFUHrOAOeO8zfr86vobeXOp
        MWzbnUK8Xe4gpDPr40HaeufspfFpAJReo/+5ig+mUej4ECuEEj5GjS6YPqIA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652280172; x=1652366572; bh=I5bkBDHzdRCg8f4i0vXw2OT0Kx/G2hjwAgX
        a2EpIRWA=; b=li+VNgqkSAJO/XEGyPTpZveSPWOULcRrcezNn9ODlkG0ItJ3JB2
        nNIcNEMJ3OAWFH4EM8/PWJzM0J1DUSS6Hj3g8RuYIgje7j2CJZqG1BWW8MdTEJqp
        Od3XVYei2TRTOU5YR1Qo705HHooFm8GdGg9LY9mYTA6JupgwGbjBmJLDmGT8QjvC
        D1hiUfk8J3Ka5G2tFRbL388U4pCpC+TR/ia5sN6A40ZO5H8ctFc3TXewCJgofktH
        cP3jPf6rIQr39t6gMJ5N9lMQYWI7gs9xj7GY+r2QeRJ8ymBSsvN1SW0v3f+tXw8I
        StSleiW7WHF9t5vPayFCNfP+T6Z3r7ysJYg==
X-ME-Sender: <xms:a8t7YiL931X_oFwwlVSmQrSYqKzzgGMuh_H9YqOkJpfgDTtI4_oLWg>
    <xme:a8t7YqJvGe2lqRDIbn_pHDmumiGR9yupfcs5gbRowG0FBApsv-w8PA7HJX0LZ9yz0
    2uVpvdm8pPlEDrXlfI>
X-ME-Received: <xmr:a8t7Yits2CoYjMKd6J3_UkhJmLUAnR3ZSyeVzvNAL_F5wzGwjiaCzrJDGwS60vhjcs99kLEg2eG8NEnps9bbdW1idm_0xRk2LTU--Qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeehgdejjecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelhefhgeefiedtgeeggfduffdtkeefleekfedvheeiudejgffgveekudetfeeu
    keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:a8t7YnYc3PW23AO2jjo_j-OgmlyY42zDAGrDg0K2mtJKtPDrdVY4vQ>
    <xmx:a8t7YpbmVT2jg5hVSJYaScVawdeG1uQ3VYPpj8_mqk-wrc6SZzNYCA>
    <xmx:a8t7YjCO7HHGeyAETHBzA-T0XG2yIWNDmpc23udHwrFHe-sxXYZ-aw>
    <xmx:bMt7YmRK-4otGuV_OI9H41SEc2gfhndm6TOvidRNVTrZBza7UAZZ1A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 11 May 2022 10:42:51 -0400 (EDT)
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
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v3 00/28] clk: More clock rate fixes and tests
Date:   Wed, 11 May 2022 16:42:21 +0200
Message-Id: <20220511144249.354775-1-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
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
Changes from v2:=0D
  - Rebased on top of current next=0D
  - Fixed locking issue in clk_get_rate_range=0D
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
 drivers/clk/clk.c                 |  304 ++++--=0D
 drivers/clk/clk_test.c            | 1465 ++++++++++++++++++++++++++++-=0D
 drivers/clk/qcom/clk-rcg2.c       |    9 +=0D
 drivers/gpu/drm/vc4/vc4_hdmi.c    |    2 +-=0D
 include/linux/clk-provider.h      |   18 +-=0D
 include/linux/clk.h               |   64 +-=0D
 11 files changed, 1814 insertions(+), 91 deletions(-)=0D
=0D
-- =0D
2.36.1=0D
=0D
