Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977BEC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 11 Apr 2022 06:25:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244905AbiDKG14 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Apr 2022 02:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244992AbiDKG1w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Apr 2022 02:27:52 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23A81583C
        for <linux-clk@vger.kernel.org>; Sun, 10 Apr 2022 23:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649658336; x=1681194336;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J9UOvbxkZCJvzvIo75745byjvOu61PnAL2wvqpAj8bY=;
  b=b91uEyprR5bWHSVdikLaiQz7LoKe/A5rCyqIQcSdrYVQGi+dEAUAtIeO
   5Ax9cqEfgZRJLGGicCQsQBd0IRX0Vz8YPqBJZaVxyIw5K1XDOAFskZf2J
   xgsdCmPj/iubjzNzlxhn69y/cm/aRhYbiSyzwt6jlpY2gMgr4SkAhn5FH
   qirTlvBoWEFQyyBko95FHEz3Zhd6GtvvrkGqvpIlI3Nk7o+igPnAe7Iea
   e+RlfB/DeReTvbYmauvUwhGaExZnV5x9YbNhXUNU8u2eH5fK29PBRvpg9
   SXeMYURt6EkLR/9Rsi/Tvda6GjbLlwHMUjfj2rqqBw85xfLwuJ2CAr87W
   A==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643670000"; 
   d="scan'208";a="23207922"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 11 Apr 2022 08:25:33 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Mon, 11 Apr 2022 08:25:34 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Mon, 11 Apr 2022 08:25:34 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1649658334; x=1681194334;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=J9UOvbxkZCJvzvIo75745byjvOu61PnAL2wvqpAj8bY=;
  b=C3D8ShRa1v/WATabrZr511NbBWsSrYkGIN2PqFYsaoPzKUtBJ00dIine
   2tSH512VeKdGJ1GtwTIVD3sHo/Ewr7fi/+n2AjHURAfKXfko991Ahd/bc
   dE26f6wNGPhoxD0yvK6Wkk4JFvxzHE2Ee97D9ZcFhNI4+56qnnpAa561x
   eC7k36171gpC7w1nUzWR3I8OD1rggo8ZDXTpu0+Jw5OgZYlZeSGVpJNAJ
   u6ArTX2X+wZV799CiiysMa/mTWX3BmyUNdWWhanzzRfgoxKGz1stnhC99
   tzLyQYnEiDDR/epyv0pTHa4xUSfScP35jcjxD0fJbrpOw36iCZraZ4IQv
   g==;
X-IronPort-AV: E=Sophos;i="5.90,251,1643670000"; 
   d="scan'208";a="23207920"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 11 Apr 2022 08:25:33 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id A9827280070;
        Mon, 11 Apr 2022 08:25:33 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Maxime Ripard <maxime@cerno.tech>,
        Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tony Lindgren <tony@atomide.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: (EXT) [PATCH 00/22] clk: More clock rate fixes and tests
Date:   Mon, 11 Apr 2022 08:25:31 +0200
Message-ID: <11958147.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220408091037.2041955-1-maxime@cerno.tech>
References: <20220408091037.2041955-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Maxime,

Am Freitag, 8. April 2022, 11:10:15 CEST schrieb Maxime Ripard:
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
>   - pcie_pll_dco has a few registers to initialize set in
>     g12a_pcie_pll_dco, but meson_clk_pcie_pll_ops don't set the init
>     hook and will instead call it in the enable hook. This looks like a
>     bug and could be easily fixed by adding that init hook.
> 
>   - gp0_pll_dco and hifi_pll_dco both don't set any of there n field in
>     the initialisation of their register (g12a_gp0_init_regs and
>     g12a_hifi_init_regs). So if the bootloader doesn't set it, and as
>     long as set_rate isn't called, that field is going to remain at 0. And
>     since all but one users don't have CLK_SET_RATE_PARENT, this is
>     still fairly unlikely.
> 
>   - hdmi_pll_dco doesn't set the n field in the initialisation either,
>     but also doesn't have a set_rate implementation. Thus, if the
>     bootloader doesn't set it, this clock and all its children will
>     always report a rate of 0, even if the clock is functional.
> 
> During the discussion with amlogic clock maintainers, we kind of ended
> up on a disagreement of whether returning 0 was ok or not, hence the
> expected controversy :)
> 
> Let me know what you think,
> Maxime
> 
> Maxime Ripard (22):
>   clk: Drop the rate range on clk_put()
>   clk: tests: Add test suites description
>   clk: tests: Add reference to the orphan mux bug report
>   clk: tests: Add tests for uncached clock
>   clk: tests: Add tests for single parent mux
>   clk: tests: Add tests for mux with multiple parents
>   clk: tests: Add some tests for orphan with multiple parents
>   clk: Take into account uncached clocks in clk_set_rate_range()
>   clk: Fix clk_get_parent() documentation
>   clk: Set req_rate on reparenting
>   clk: Skip set_rate_range if our clock is orphan
>   clk: Add our request boundaries in clk_core_init_rate_req
>   clk: Change clk_core_init_rate_req prototype
>   clk: Introduce clk_hw_init_rate_request()
>   clk: Add missing clk_core_init_rate_req calls
>   clk: Remove redundant clk_core_init_rate_req() call
>   clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
>   clk: Introduce clk_core_has_parent()
>   clk: Stop forwarding clk_rate_requests to the parent
>   clk: Zero the clk_rate_request structure
>   clk: Test the clock pointer in clk_hw_get_name()
>   clk: Prevent a clock without a rate to register
> 
>  drivers/clk/clk.c            |  239 +++++--
>  drivers/clk/clk_test.c       | 1256 +++++++++++++++++++++++++++++++++-
>  include/linux/clk-provider.h |    6 +
>  include/linux/clk.h          |    5 +-
>  4 files changed, 1439 insertions(+), 67 deletions(-)

Thanks for another round of patches.
On top my patchset this one does *not* break my imx8mp based setup. Booting is 
as usual without any changes in dmesg.
Given this patch set I suspect the other one on github you sent me on Thursday 
is obsolete now.

Best regards,
Alexander



