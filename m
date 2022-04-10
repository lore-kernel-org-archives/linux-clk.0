Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CF06C433F5
	for <linux-clk@archiver.kernel.org>; Sun, 10 Apr 2022 12:07:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238469AbiDJMJP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 10 Apr 2022 08:09:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232013AbiDJMJO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 10 Apr 2022 08:09:14 -0400
Received: from mail-40137.protonmail.ch (mail-40137.protonmail.ch [185.70.40.137])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F40CF2A70C
        for <linux-clk@vger.kernel.org>; Sun, 10 Apr 2022 05:07:03 -0700 (PDT)
Date:   Sun, 10 Apr 2022 12:06:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1649592421;
        bh=zzb8o4OJF+w831oexy0cIfChUgIXNNxRvdimfske2No=;
        h=Date:To:From:Cc:Reply-To:Subject:Message-ID:In-Reply-To:
         References:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID;
        b=xm5tY9+0DuTW3nfMoS8dtx0WM2jh2QiTrG44WMgzDGyS//F/1dt9dSfX/qcqJlgWN
         sHU3ATi9j7tAy6qoHAFMGVhnJ7XtIrJxDroCwlMMNzADdrrd/wLwLaf4cPDMin0VcK
         /uCviv+DnO7WAPg0+M1FEEL60McC7vM4gMw2bsTpia4YIOUXtiNmC3CWdzUVsRl8U0
         6/RPQUlv/vApNYqLg8AGT7GY8zieATJlvZeZf/7QmrO2rGIwQNR8BtdqXy2lyWjr/B
         Bh9fkY4ShlJ762vOqYV9rreYdMhyLDkDoCjeXb/vZpNwU07exZyoQiTTOe5eGw9FQy
         BFWKNtUV15qcQ==
To:     Maxime Ripard <maxime@cerno.tech>
From:   Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Reply-To: Yassine Oudjana <y.oudjana@protonmail.com>
Subject: Re: [PATCH 00/22] clk: More clock rate fixes and tests
Message-ID: <72HmVB9N_Hm0q8rTTo4Pg9uzlcm_ZYIrKuNEGp3SKbNAMcCo_E9UDLemXOEYYIW4fz9EE-AhP0qxjLh1Kmcjxu9SO1UBLFi5EldKRMZV54U=@protonmail.com>
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Friday, April 8th, 2022 at 1:10 PM, Maxime Ripard <maxime@cerno.tech> wr=
ote:
> Hi,
>
> Thanks to the feedback I got on the previous series, I found and fixed a
> number of bugs in the clock framework and how it deals with rates,
> especially when it comes to orphan clocks.
>
> In order to make sure this doesn't pop up again as a regression, I've
> extended the number of tests.
>
> The first patch reintroduces the clk_set_rate_range call on clk_put, but
> this time will only do so if there was a range set on that clock to
> begin with. It should be less intrusive, and reduce the number of
> potential side effects considerably.
>
> All the other patches should be probably be flagged as fixes, but
> they've never seem to have shown any real-world issues until now, and
> they aren't all really trivial to backport either, so I'm not sure it's
> worth it.
>
> The last patch will probably prove to be controversial, but it can be
> left out without affecting the rest of the series. It will affect the
> meson clock drivers for the g12b SoC at least. It stems from the
> realisation that on the g12b, 4 PLLs (and thus all their children) have
> a rate of 0, pretty much forever which feels like a bug considering the
> rate 0 is used as an error in most places.
>
> Those 4 PLLs have a rate of 0 because meson_clk_pll_recalc_rate will
> return 0 if the diviser of the PLL is set to 0 in the register, but:
>
> - pcie_pll_dco has a few registers to initialize set in
> g12a_pcie_pll_dco, but meson_clk_pcie_pll_ops don't set the init
> hook and will instead call it in the enable hook. This looks like a
> bug and could be easily fixed by adding that init hook.
>
> - gp0_pll_dco and hifi_pll_dco both don't set any of there n field in
> the initialisation of their register (g12a_gp0_init_regs and
> g12a_hifi_init_regs). So if the bootloader doesn't set it, and as
> long as set_rate isn't called, that field is going to remain at 0. And
> since all but one users don't have CLK_SET_RATE_PARENT, this is
> still fairly unlikely.
>
> - hdmi_pll_dco doesn't set the n field in the initialisation either,
> but also doesn't have a set_rate implementation. Thus, if the
> bootloader doesn't set it, this clock and all its children will
> always report a rate of 0, even if the clock is functional.
>
> During the discussion with amlogic clock maintainers, we kind of ended
> up on a disagreement of whether returning 0 was ok or not, hence the
> expected controversy :)
>
> Let me know what you think,
> Maxime
>
> Maxime Ripard (22):
> clk: Drop the rate range on clk_put()
> clk: tests: Add test suites description
> clk: tests: Add reference to the orphan mux bug report
> clk: tests: Add tests for uncached clock
> clk: tests: Add tests for single parent mux
> clk: tests: Add tests for mux with multiple parents
> clk: tests: Add some tests for orphan with multiple parents
> clk: Take into account uncached clocks in clk_set_rate_range()
> clk: Fix clk_get_parent() documentation
> clk: Set req_rate on reparenting
> clk: Skip set_rate_range if our clock is orphan
> clk: Add our request boundaries in clk_core_init_rate_req
> clk: Change clk_core_init_rate_req prototype
> clk: Introduce clk_hw_init_rate_request()
> clk: Add missing clk_core_init_rate_req calls
> clk: Remove redundant clk_core_init_rate_req() call
> clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
> clk: Introduce clk_core_has_parent()
> clk: Stop forwarding clk_rate_requests to the parent
> clk: Zero the clk_rate_request structure
> clk: Test the clock pointer in clk_hw_get_name()
> clk: Prevent a clock without a rate to register
>
> drivers/clk/clk.c | 239 +++++--
> drivers/clk/clk_test.c | 1256 +++++++++++++++++++++++++++++++++-
> include/linux/clk-provider.h | 6 +
> include/linux/clk.h | 5 +-
> 4 files changed, 1439 insertions(+), 67 deletions(-)
>
> --
> 2.35.1

It appears that this series breaks mmcc-msm8996:

[    8.713810] mmpll2_early: recalc_rate returned a null rate
[    8.713864] mmcc-msm8996: probe of 8c0000.clock-controller failed with e=
rror -22

I haven't yet tried to figure out the exact patch that causes
this or how it does. I just wanted to report it as soon as possible.

