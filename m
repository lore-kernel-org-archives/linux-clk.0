Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B221C00140
	for <linux-clk@archiver.kernel.org>; Thu, 18 Aug 2022 06:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243711AbiHRGoR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Aug 2022 02:44:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239017AbiHRGoQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Aug 2022 02:44:16 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EF514CA2D
        for <linux-clk@vger.kernel.org>; Wed, 17 Aug 2022 23:44:15 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id gb36so1475622ejc.10
        for <linux-clk@vger.kernel.org>; Wed, 17 Aug 2022 23:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=3ZYCwILBte/HmI9Y2M6IrznEqjJ+qtgLVppYIES6VKI=;
        b=Z5KrGE9ZGvzyeBtkPtdSzP2kWXJWn+Fk6Y/M97kQxumDXYm2A2N46esyw383HZa5Oz
         xoR9dubRSVEPFFtCTESQVC2+5HXvCpVMUNBGepS+A2CqRtcd1LmBZhVcHR9C/zrr6vja
         AW8/TJrooJHvepb9HMGA0cPaVk32vTwGkulZ5CLOzhgsC/ft0wC/IbU+xZmJbcvuUBKY
         XxIN2+hfWkqkN7KxYWFKBD5nD9bI4IAsoP2IJpCAaEdY+tipp/WCtny184kWdzakl87B
         mnf8HzVZAVrZlhnCNQQ+4HpCa/Dj11ySfM98wGqmIpa5AOzKM1AsLRakcvYo/vNBcMId
         T9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=3ZYCwILBte/HmI9Y2M6IrznEqjJ+qtgLVppYIES6VKI=;
        b=1CbeYp0VW0cYxp15TcofGuithWr3yzNY4feSfLF7tAcrhvhOI/uaAhkZHf/1L5RAa5
         eo/P/5HzJom7HRE75J4uJJpkqKAiqwrZGlwp1rtO+nmF3jTX2MC9J/4/ENz2MpPoBwo2
         Wgj4src4LtHxH+1QDtFbKoreG92BbSHYAJd8J/nB2oBA1qidnpklx/kADy/6XhTOBtEX
         N+xBTvJ31cPXJaS+SDLceQXxizUR1V+7dWT7h3wTOGDHhX6oGbkkIqgs0qEYoqryi604
         6Gy2tgHLnXeEQRFDl09q44iqcBOhe+tKHaA712fvDCdpszwM4KdEPNQKJBBuLIRpI+hG
         QZxQ==
X-Gm-Message-State: ACgBeo3XioHLX1CFyH9Ejh3i5Pv0wp+AqK/8URqdQs22RpFdcXf0mICS
        giaru4VamSO95psH1ARP9zFlwQVw1ZCH/WjTDA3DDg==
X-Google-Smtp-Source: AA6agR71dG3YPa2aBpepiTfQBorxFxGTMigyL8gRH/3d6cZQkt3DeR8ki41bHX5gybk82DAYpT0T5grAiOGf2LwLBww=
X-Received: by 2002:a17:907:b590:b0:730:9e4c:3d5f with SMTP id
 qx16-20020a170907b59000b007309e4c3d5fmr999403ejc.169.1660805053381; Wed, 17
 Aug 2022 23:44:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220816112530.1837489-1-maxime@cerno.tech>
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
Date:   Thu, 18 Aug 2022 12:14:01 +0530
Message-ID: <CA+G9fYsPK8HXHqudSyrOAYsSavenqcgDJMAeXKAH=sF7rO23-Q@mail.gmail.com>
Subject: Re: [PATCH v9 00/25] clk: More clock rate fixes and tests
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 16 Aug 2022 at 16:55, Maxime Ripard <maxime@cerno.tech> wrote:
>
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
>   - Fixed a regression when probing a clock driver backed by a device accessed
>     through a bus that might sleep
>
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
>   - Removed some intermediate variables
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

I have done build testing, boot testing and LTP syscalls testing on
arm64 devices Rpi4 and db410c all test pass.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Tested-by: Naresh Kamboju <naresh.kamboju@linaro.org>

Build link:
https://builds.tuxbuild.com/2DUDJVgnEeotDGSNrcOuFswbTRm/

Test runs links:
https://lkft.validation.linaro.org/scheduler/job/5402030
https://lkft.validation.linaro.org/scheduler/job/5402031

- Naresh
