Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E5F1C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 12 May 2022 16:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356155AbiELQEj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 May 2022 12:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55298 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356226AbiELQEV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 May 2022 12:04:21 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1774266060
        for <linux-clk@vger.kernel.org>; Thu, 12 May 2022 09:04:18 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 57A455C0197;
        Thu, 12 May 2022 12:04:17 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Thu, 12 May 2022 12:04:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; t=1652371457; x=1652457857; bh=td+6iJgxIh
        0Fw7JawQgBv8PBdTXqDyVRni7Oz8qrlm0=; b=MJ21VYkEebPEbqIOfyMGJp3rBP
        TL0iyj2O/2lYWXOPZC7Cm28174k8+TE+vYAGB08lJCZh9fBdD492upqrHQNn7sz5
        i33Yp7mKNEYWVTW83m1HZi0JgknZjE+EP12+Gf95DDoHz0Mv5Kn5jEIRWVJcJ/RB
        iJfp/6dU/oJGxHS4AEnW0PGkjkVuTILnCCEvAzK2421YvTcAE2ThtiO+71lMJtzi
        bSz0KEZZ1/DdxI6yk8ek0Q31x1ToXT0Y90wsZstWM/zxv3AK9VcsjzoEf2Al83cB
        wM7zU7KpKmknC9w7rnkit1YhOt1CQ/DgUag6s6lugC+uLXZrWsBgIN8Bu1Pg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652371457; x=1652457857; bh=td+6iJgxIh0Fw7JawQgBv8PBdTXqDyVRni7
        Oz8qrlm0=; b=xCrch1ihEsHDwehEMN/VJoQgu4QulpC0Lv95oNzC9kAyLAtQ0vL
        rd7ANEpS+xlPnMASTwikWe/I51uF3TpyHWUaspjBs7GTTcRS0xpn+N6Xuadt87bi
        M5/He8n0ubD309S87tGwGG+SBuLL5TjXcV6JvBPK7oGsA6sJ8873ULiL2VKA9F9d
        FpvA5yKzm46Z0RRPmQ9NiWsHesF39ZRNMc/fG6nVwkg58UuARjIVMivn0Zv6Y1HH
        HuFpIQBNA4v0fOa1JM3pS95XFGDcCn5+D7ZpWjPsLoBRz/3/TDTkmaq8/UngewKN
        H16Rc1aykgGEaXJcje9h2Ex1knpmC7mAOkg==
X-ME-Sender: <xms:_y99YpYhXj30gGX_S5bPTGFaFUvZhoenAtD8qlsxJy1pt6H1DfcHaw>
    <xme:_y99YgYtfwWXIDU4hKThH5m56lNsef6Procli1u1Wpi1807N7oWnrn8NMYTollTPi
    VOAnFU-WYEqwZitrcE>
X-ME-Received: <xmr:_y99Yr_ngUYBoPIogtdlUzoHXrv6E0otCL8hcGfxj-td1KhCT-H2aIswFCaXmnDWQ2dCvl0KO5Hrr4Wj5Dr4QMP47BTrD0bn4Zzqbg0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrgeejgdelgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeelhefhgeefiedtgeeggfduffdtkeefleekfedvheeiudejgffgveekudetfeeu
    keenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:_y99YnqyfEYRCPpoZX7Ph8xFNMYcihizVHB9IPYHbiD84UU8lsnZIg>
    <xmx:_y99YkpeLZyU5-8_9PYGNId5Ch_mNzom4wYEkBR7A6DpK00aG0IUFA>
    <xmx:_y99YtQ9JtsSwX945RdWNjPZVScGW2eXtrWpj_Y7S-iv72cX7K15pw>
    <xmx:ATB9YhgXMAwNiwTf1dXZPZhgKcQuu4Cw_wLGOcCI_2tr_biuMcRarQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 12 May 2022 12:04:14 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v4 00/28] clk: More clock rate fixes and tests
Date:   Thu, 12 May 2022 18:03:44 +0200
Message-Id: <20220512160412.1317123-1-maxime@cerno.tech>
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
Changes from v3:=0D
  - constness warning fix in clk_core_forward_rate_req=0D
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
