Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E7FC25B0E
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 14:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235424AbiHPOHu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 10:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234407AbiHPOHs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 10:07:48 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5D7065246
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660658866; x=1692194866;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=39JquYEJK5JyK+mF3YKuJXdavdQOABCn8+kiPGL7XWs=;
  b=doUgQT1+fl7Etr4vZrZe3oz36Bi0ee8SFjAIUXPoq8RX/BR2KGjJujo1
   slE0Rc3ELEJTctsu29Hssop6Pakwa4a5ofbgt5/by8KAZ3jc7OwP+CL0u
   g+CuW5bHbXDkVnlK2QT1LEuj0dEZXuVw3gVrNe4TDenwpZ3IjktLL3mKo
   oKRj/x6iM7UulGUnuGNRigBnQ3/LLhNDdNcKKTvF9qBmHQkuvHJlOsGua
   n79Sc8VEwMYaVTWF16E/Wd38CPA+TfQFckfJPo4baDj4OckJyYHsS/zCP
   UET8Y6zlS95pW5JOckLdtMUKKkTJu4rEZUwyB/vrj33EmaaVwh7TXt4ew
   w==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654552800"; 
   d="scan'208";a="25631352"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 16 Aug 2022 16:07:44 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Tue, 16 Aug 2022 16:07:44 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Tue, 16 Aug 2022 16:07:44 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1660658864; x=1692194864;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=39JquYEJK5JyK+mF3YKuJXdavdQOABCn8+kiPGL7XWs=;
  b=oNqbVONHn7xL4i9askdoAGrz45ua7c1IQmQ858muctN6tahvz8E40njI
   hprNtHcZIueanFe6+bKOYh+/u3gCEENzzUWhAqnm/vBPmE0fcNk4FEYRA
   gRqhRobCxI5X8KOdrqc6IWRNijvZ91ZG/I25xXHYMPi7fQXyozLnyLiel
   rghpUpmzuKxa0wvUEgqNvAru4CnMATbCCdjenAFljUMvWRF8lRXk3nMqn
   yLOfe4Ul1xUQ1378DFeQroPNVnRx7OfrRRionmNFPE56OeogU37uvk/lx
   nG6P6Qh1F5CabNXqdkkcEGXOz75BhsXV0A+cu4RyjShIJK4FhGElAvM1c
   A==;
X-IronPort-AV: E=Sophos;i="5.93,241,1654552800"; 
   d="scan'208";a="25631351"
Subject: Re: [PATCH v9 00/25] clk: More clock rate fixes and tests
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 16 Aug 2022 16:07:44 +0200
Received: from steina-w.localnet (unknown [10.123.49.11])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 25673280056;
        Tue, 16 Aug 2022 16:07:44 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Date:   Tue, 16 Aug 2022 16:07:41 +0200
Message-ID: <13848077.O9o76ZdvQC@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello Maxime,

Am Dienstag, 16. August 2022, 13:25:05 CEST schrieb Maxime Ripard:
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
> We then have a fix for the qcom rcg2 issue that has been reported
> recently.
> 
> All the other patches should be probably be flagged as fixes, but
> they've never seem to have shown any real-world issues until now, and
> they aren't all really trivial to backport either, so I'm not sure it's
> worth it.
> 
> There's also some documentation improvements for recalc_rate and
> clk_get_rate to hopefully make the documentation less ambiguous and
> acknowledge that recalc_rate() returning 0 on error is fine.
> 
> Let me know what you think,
> Maxime
> 
> Changes from v8:
>   - Fixed a regression when probing a clock driver backed by a device
> accessed through a bus that might sleep

With this v9 series my TQMa8MPxL platform boots without issue, also with the 
i2c attached audio codec driver successfully probed. Thanks!

Best regards,
Alexander

> Changes from v7:
>   - Dropped the RPi fixes
>   - Rebased on 6.0-rc1
> 
> Changes from v6:
>   - Fixed a kernel build bot warning
> 
> Changes from v5:
>   - Rebased on current next (next-20220711)
>   - Dropped clk_get_rate_range, and used a custom function instead
>   - Switched all tests to use clk_hw_get_clk() instead of struct clk_hw->clk
> - Removed some intermediate variables
>   - Added some comments
>   - Dropped clk_get_parent() changes
>   - Dropped test on clk_hw pointer non-NULL in clk_hw_get_name
>   - Made clk_has_parent more const
> 
> Changes from v4:
>   - Fix build breakage on SAM9x60
> 
> Changes from v3:
>   - constness warning fix in clk_core_forward_rate_req
> 
> Changes from v2:
>   - Rebased on top of current next
>   - Fixed locking issue in clk_get_rate_range
> 
> Changes from v1:
>   - Rebased on top of next-20220428
>   - Dropped the patch to prevent non-orphan clocks from registering if
>     their recalc_rate hook returns 0
>   - Added some patches to clarify the clk_get_rate and recalc_rate
>     documentation
>   - Dropped the patch to skip the range setup on an orphan clock that
>     was introducing a regression on RaspberryPi3 when a monitor wasn't
>     connected at boot
>   - Added a patch to skip the rate clamping in clk_round_rate() when
>     min_rate == max_rate == 0
>   - Added a new set of functions to query the clk boundaries and fix a
>     regression with the RaspberryPi4
>   - Fixed all the drivers hand-crafting their clk_rate_request
>   - Reworded the test suite descriptions
>   - Reordered a few patches to ease the review
>   - Reworded some commit logs to better explain the issues they address
>   - Collected the Tested-by of Alexander and Marek
>   - More tests
> 
> Maxime Ripard (25):
>   clk: test: Switch to clk_hw_get_clk
>   clk: Drop the rate range on clk_put()
>   clk: Skip clamping when rounding if there's no boundaries
>   clk: Mention that .recalc_rate can return 0 on error
>   clk: Clarify clk_get_rate() expectations
>   clk: tests: Add test suites description
>   clk: tests: Add reference to the orphan mux bug report
>   clk: tests: Add tests for uncached clock
>   clk: tests: Add tests for single parent mux
>   clk: tests: Add tests for mux with multiple parents
>   clk: tests: Add some tests for orphan with multiple parents
>   clk: Take into account uncached clocks in clk_set_rate_range()
>   clk: Set req_rate on reparenting
>   clk: Change clk_core_init_rate_req prototype
>   clk: Move clk_core_init_rate_req() from clk_core_round_rate_nolock()
>     to its caller
>   clk: Introduce clk_hw_init_rate_request()
>   clk: Add our request boundaries in clk_core_init_rate_req
>   clk: Switch from __clk_determine_rate to clk_core_round_rate_nolock
>   clk: Introduce clk_core_has_parent()
>   clk: Constify clk_has_parent()
>   clk: Stop forwarding clk_rate_requests to the parent
>   clk: Zero the clk_rate_request structure
>   clk: Introduce the clk_hw_get_rate_range function
>   clk: qcom: clk-rcg2: Take clock boundaries into consideration for
>     gfx3d
>   clk: tests: Add missing test case for ranges
> 
>  drivers/clk/at91/clk-generated.c  |    5 +-
>  drivers/clk/at91/clk-master.c     |    9 +-
>  drivers/clk/at91/clk-peripheral.c |    4 +-
>  drivers/clk/clk-composite.c       |    6 +-
>  drivers/clk/clk-divider.c         |   20 +-
>  drivers/clk/clk.c                 |  288 ++++--
>  drivers/clk/clk_test.c            | 1413 ++++++++++++++++++++++++++++-
>  drivers/clk/qcom/clk-rcg2.c       |    9 +
>  include/linux/clk-provider.h      |   18 +-
>  include/linux/clk.h               |    2 +-
>  10 files changed, 1665 insertions(+), 109 deletions(-)




