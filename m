Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3B2DC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 09:13:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232944AbiDHJP0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 05:15:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232935AbiDHJOB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 05:14:01 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A44A711F78B
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 02:10:44 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id 029B25C0242;
        Fri,  8 Apr 2022 05:10:42 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Fri, 08 Apr 2022 05:10:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:date:date:from:from
        :in-reply-to:message-id:mime-version:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=TxdIX60OvPCMLv41LnJOy4lCb5hedQH6xvkAMm
        /z5XQ=; b=PtR9IHdGdIc8EY+c8EZmI5VJRmZi7HlV0W0OpjwXCcPx0rfKibwkYp
        +Utx59qiPnSXfUCzDOIObeuN63QngGp3Ka4DwcqN3gtWSGK7uLprJTVcQHqahpcs
        Edp0gl9zm/REIstBWMK5dIi0goLgP0MuomI/TUgP1/t0zfnw4MzIclWwUJbVBsMO
        9ZKkRRVGTC0s+vkWG18FuSLcZe5o7YrRTiDLFonfbdOLHIdaT5YJXQsZF9YrcBYz
        7ZzO4OfowIc5c3AL4S005Js0UubLPOOYVHLdnRvO2vhGsT7WfGKqzYQUfWhVO7UD
        QgpOfz6GN1ZcqnCoQIZEG9VIJhaXYB4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=TxdIX6
        0OvPCMLv41LnJOy4lCb5hedQH6xvkAMm/z5XQ=; b=OG8h0WAqEzztlFMGQlJGcB
        +6/aHpgN+A+AAojORm1xTXuE8HiQNXetO/PKTgKaD/YwMrQYtXhaGpkET/C76Zk8
        LhJoqjCvdsSLJ/heTEo7lzLdz0fE6iEJf8ILjWslm31xibjKdMrovi4SXWiCKNop
        SVJetWiMSklpqsyVcWKhZivtXvjINjBFAlcHHqDwvVDCTkpNUFhbLPxa2oeJlaT6
        P/6cgsvBkuFwqTYZRcXthm/bsZyNv3gUWK8gCZ64p+wS8ZDtfHSs6966X6G+AJuD
        xUQOr6O7vJ5NE9LzCaclS47nzugMTyBWldPiC5aKg1v7kJn2FuXLyJJPyKcYuRlw
        ==
X-ME-Sender: <xms:EPxPYvSSlDZXFRbT0GpVN7ycr5QxaBmMkkuSUskrJzjQ9caga-AplA>
    <xme:EPxPYgzmLxJY0lL6KJWTV7MTdsGHfLfi9Df2E0VbHuhZxwYlN0amjH4gjypV6reJ_
    58biLblzQlHy4yTZcE>
X-ME-Received: <xmr:EPxPYk0ThDlO9ljPltmjf3BlRi9aP-pZxM2cARnHRysrsGxxkcs-YvYVRlLL67CcPU4Q5hWDMwz4RhV5VTqnAr4RX6CLZoFOPJYqg6c>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudektddguddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffotggggfesthhqredtredtjeenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpeetieekgfffkeegkeeltdehudetteejgfekueevhffhteegudfgkedtueegfffg
    feenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:EPxPYvDRcvzDKAsRt5AsEkuUB0bL2Y3OZAgz-SPX-UMhW-Zl6VnH1Q>
    <xmx:EPxPYojHBIuEN4giMSQCPQJIBn_5CqqZy36Y3FLaV3EG9ifC9xYjlw>
    <xmx:EPxPYjrBk95lyhChg55j15T3hddrNH38fbQ5bhp25sqAcGacZahCmA>
    <xmx:EfxPYrNOoDxWWXCyaCIXEgMT2OkQN9G8SWvfV1E_irD7m-fRj3bI_Q>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 8 Apr 2022 05:10:39 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH 00/22] clk: More clock rate fixes and tests
Date:   Fri,  8 Apr 2022 11:10:15 +0200
Message-Id: <20220408091037.2041955-1-maxime@cerno.tech>
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
All the other patches should be probably be flagged as fixes, but=0D
they've never seem to have shown any real-world issues until now, and=0D
they aren't all really trivial to backport either, so I'm not sure it's=0D
worth it.=0D
=0D
The last patch will probably prove to be controversial, but it can be=0D
left out without affecting the rest of the series. It will affect the=0D
meson clock drivers for the g12b SoC at least. It stems from the=0D
realisation that on the g12b, 4 PLLs (and thus all their children) have=0D
a rate of 0, pretty much forever which feels like a bug considering the=0D
rate 0 is used as an error in most places.=0D
=0D
Those 4 PLLs have a rate of 0 because meson_clk_pll_recalc_rate will=0D
return 0 if the diviser of the PLL is set to 0 in the register, but:=0D
=0D
  - pcie_pll_dco has a few registers to initialize set in=0D
    g12a_pcie_pll_dco, but meson_clk_pcie_pll_ops don't set the init=0D
    hook and will instead call it in the enable hook. This looks like a=0D
    bug and could be easily fixed by adding that init hook.=0D
=0D
  - gp0_pll_dco and hifi_pll_dco both don't set any of there n field in=0D
    the initialisation of their register (g12a_gp0_init_regs and=0D
    g12a_hifi_init_regs). So if the bootloader doesn't set it, and as=0D
    long as set_rate isn't called, that field is going to remain at 0. And=
=0D
    since all but one users don't have CLK_SET_RATE_PARENT, this is=0D
    still fairly unlikely.=0D
=0D
  - hdmi_pll_dco doesn't set the n field in the initialisation either,=0D
    but also doesn't have a set_rate implementation. Thus, if the=0D
    bootloader doesn't set it, this clock and all its children will=0D
    always report a rate of 0, even if the clock is functional.=0D
=0D
During the discussion with amlogic clock maintainers, we kind of ended=0D
up on a disagreement of whether returning 0 was ok or not, hence the=0D
expected controversy :)=0D
=0D
Let me know what you think,=0D
Maxime=0D
=0D
Maxime Ripard (22):=0D
  clk: Drop the rate range on clk_put()=0D
  clk: tests: Add test suites description=0D
  clk: tests: Add reference to the orphan mux bug report=0D
  clk: tests: Add tests for uncached clock=0D
  clk: tests: Add tests for single parent mux=0D
  clk: tests: Add tests for mux with multiple parents=0D
  clk: tests: Add some tests for orphan with multiple parents=0D
  clk: Take into account uncached clocks in clk_set_rate_range()=0D
  clk: Fix clk_get_parent() documentation=0D
  clk: Set req_rate on reparenting=0D
  clk: Skip set_rate_range if our clock is orphan=0D
  clk: Add our request boundaries in clk_core_init_rate_req=0D
  clk: Change clk_core_init_rate_req prototype=0D
  clk: Introduce clk_hw_init_rate_request()=0D
  clk: Add missing clk_core_init_rate_req calls=0D
  clk: Remove redundant clk_core_init_rate_req() call=0D
  clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock=0D
  clk: Introduce clk_core_has_parent()=0D
  clk: Stop forwarding clk_rate_requests to the parent=0D
  clk: Zero the clk_rate_request structure=0D
  clk: Test the clock pointer in clk_hw_get_name()=0D
  clk: Prevent a clock without a rate to register=0D
=0D
 drivers/clk/clk.c            |  239 +++++--=0D
 drivers/clk/clk_test.c       | 1256 +++++++++++++++++++++++++++++++++-=0D
 include/linux/clk-provider.h |    6 +=0D
 include/linux/clk.h          |    5 +-=0D
 4 files changed, 1439 insertions(+), 67 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D
