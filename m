Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06BACC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 24 May 2022 18:32:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240357AbiEXScn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 May 2022 14:32:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240350AbiEXScm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 May 2022 14:32:42 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 799AF5401F
        for <linux-clk@vger.kernel.org>; Tue, 24 May 2022 11:32:41 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-f1eafa567cso19904295fac.8
        for <linux-clk@vger.kernel.org>; Tue, 24 May 2022 11:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pKzj0lZePskW6OoiN0CWerTUmBfV4sGD8tc5MRd0ltM=;
        b=ZdynbkCOqgeqfvEWKowIU1iPJSiTVbwHyUSXnXlcj5llvHYLLTg1fph9Zj7mAQ9te/
         iMkKuj9n+ma8rAbxmXfh/gmS/nx4roaDsfU1CwceLGtm9bf0710GTaVEonLg444uKe1n
         hPhzO9mj0ygYdjePtvdN4jHHj+UjoPb+lkMtCG3xt1FOTNLGdhGC058Oj/Ug1BpbUnwI
         pO4Y/OytDz21v6E6thf4NAQWfoFSw7fy+7fyByI8mIXimH7LBeo0E4/QmGwMFVR0mTPE
         e0hlw+Ld4SxJPZx98CbarnPHkLOjomVqNCGcrlmqbiUFrr28YSU72hF0CsYAq2oNMd+Q
         7kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pKzj0lZePskW6OoiN0CWerTUmBfV4sGD8tc5MRd0ltM=;
        b=ZVrQu/9ovbWC5zyvNzs/q56edv+BBg8L22V6ewJlWby00FotBGcr7tnmbJ7s8yFlhH
         Solz5lBNmH7R3WR3IY7mAvb3vcKZ05AxJifRmtSHFEeGXaOziurPTAU5Im9OJIt4w3pJ
         J+ABf0WP2g/K3Pc0FYjIC1bumCYFrs1OgdTmHKbEV5alHXHXWdsl+lJiipQ3Jd/QscGc
         NSMAMv1YZP6TZMnqVwqClmnJtOJCgEEDLiVMoU8tq3oO1UfsEYeSEJdsmYaloCbdxcOP
         azJcQBCizH9PcKqy6rVJgZL/esOm2iBA6EBTdU8VrpGmBJKyyHk9fsV9POXh9XCGg1hz
         K4Vw==
X-Gm-Message-State: AOAM533DtpaXiMQU5SP3vs8JTwlirqe6v4gJuTw9EpB5QiBAun9e8cw9
        0r99BpR9n+VRFZ6wNsRF5wdZjQq7BYDIcNrlBYo=
X-Google-Smtp-Source: ABdhPJwai5oIk6Y48/PTg6ZAFiQAXEZeSYwYE2O4kAn1I7trHj4fLV/QFk3ABHYq52TCandGU4+dEAzJOB0lyz0XXCE=
X-Received: by 2002:a05:6870:b3a4:b0:e9:2370:5e9 with SMTP id
 w36-20020a056870b3a400b000e9237005e9mr3264645oap.73.1653417160793; Tue, 24
 May 2022 11:32:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220512160412.1317123-1-maxime@cerno.tech> <20220512160412.1317123-14-maxime@cerno.tech>
In-Reply-To: <20220512160412.1317123-14-maxime@cerno.tech>
From:   Jim Quinlan <jim2101024@gmail.com>
Date:   Tue, 24 May 2022 14:32:29 -0400
Message-ID: <CANCKTBuWkkXNdK5eLJr=KzykDt+dbjfOiNGhxga4oEU5COyiUg@mail.gmail.com>
Subject: Re: [PATCH v4 13/28] clk: Take into account uncached clocks in clk_set_rate_range()
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, May 13, 2022 at 3:56 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> clk_set_rate_range() will use the last requested rate for the clock when
> it calls into the driver set_rate hook.
>
> However, if CLK_GET_RATE_NOCACHE is set on that clock, the last
> requested rate might not be matching the current rate of the clock. In
> such a case, let's read out the rate from the hardware and use that in
> our set_rate instead.
Hello Maxime & MikeT,

I'm probably out of the loop on this but I am wondering why we don't also apply
this  same reasoning to

        clk_core_set_rate_nolock()

which may usea stale clock rate and skip the actual setting of the rate:

static int clk_core_set_rate_nolock(core, req_rate)
{
        /* ... */
        rate = clk_core_req_round_rate_nolock(core, req_rate);

        /* bail early if nothing to do */
        if (rate == clk_core_get_rate_nolock(core))    /* [JQ] Does
not check for CLK_GET_RATE_NOCACHE */
                return 0;

I can see that 9-10 years ago someone submitted a pullreq to fix above
but I cannot
locate the response and it obviously never made it upstream.

Kind regards,
Jim Quinlan
Broadcom STB

>
> Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com> # imx8mp
> Tested-by: Marek Szyprowski <m.szyprowski@samsung.com> # exynos4210, meson g12b
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  drivers/clk/clk.c      |  6 +++++-
>  drivers/clk/clk_test.c | 28 ++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 95be72f9373e..09849453047c 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2373,6 +2373,10 @@ static int clk_set_rate_range_nolock(struct clk *clk,    /* bail early if nothing to do */
    if (rate == clk_core_get_rate_nolock(core))
        return 0;

>                 goto out;
>         }
>
> +       rate = clk->core->req_rate;
> +       if (clk->core->flags & CLK_GET_RATE_NOCACHE)
> +               rate = clk_core_get_rate_recalc(clk->core);
> +
>         /*
>          * Since the boundaries have been changed, let's give the
>          * opportunity to the provider to adjust the clock rate based on
> @@ -2390,7 +2394,7 @@ static int clk_set_rate_range_nolock(struct clk *clk,
>          * - the determine_rate() callback does not really check for
>          *   this corner case when determining the rate
>          */
> -       rate = clamp(clk->core->req_rate, min, max);
> +       rate = clamp(rate, min, max);
>         ret = clk_core_set_rate_nolock(clk->core, rate);
>         if (ret) {
>                 /* rollback the changes */
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 8de6339f4f8d..9aa5b946f324 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -362,9 +362,37 @@ static void clk_test_uncached_set_range(struct kunit *test)
>         KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
>  }
>
> +/*
> + * Test that for an uncached clock, clk_set_rate_range() will work
> + * properly if the rate has changed in hardware.
> + *
> + * In this case, it means that if the rate wasn't initially in the range
> + * we're trying to set, but got changed at some point into the range
> + * without the kernel knowing about it, its rate shouldn't be affected.
> + */
> +static void clk_test_uncached_updated_rate_set_range(struct kunit *test)
> +{
> +       struct clk_dummy_context *ctx = test->priv;
> +       struct clk_hw *hw = &ctx->hw;
> +       struct clk *clk = hw->clk;
> +       unsigned long rate;
> +
> +       ctx->rate = DUMMY_CLOCK_RATE_1 + 1000;
> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate_range(clk,
> +                                          DUMMY_CLOCK_RATE_1,
> +                                          DUMMY_CLOCK_RATE_2),
> +                       0);
> +
> +       rate = clk_get_rate(clk);
> +       KUNIT_ASSERT_GT(test, rate, 0);
> +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
> +}
> +
>  static struct kunit_case clk_uncached_test_cases[] = {
>         KUNIT_CASE(clk_test_uncached_get_rate),
>         KUNIT_CASE(clk_test_uncached_set_range),
> +       KUNIT_CASE(clk_test_uncached_updated_rate_set_range),
>         {}
>  };
>
> --
> 2.36.1
>
