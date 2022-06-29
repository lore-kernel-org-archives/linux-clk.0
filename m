Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD59C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 09:01:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbiF2JBw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 05:01:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiF2JBw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 05:01:52 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22C9A2495E
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 02:01:49 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CBD59B821DD
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 09:01:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3DEC341CA;
        Wed, 29 Jun 2022 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1656493306;
        bh=eeZ09KUc0A9ILU8NQsLNk+7v5t7F9/TgHSr1SHhfkq8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=pPcWSvjnfsios83ImwlWmfP6b7IbD+bCbHr0HK+JCHLIWa6f+JHAXd0JAc5DNQ1o6
         UR/KEenwSbRnxSwduXLsf5s3nO8XPI7AjQjbIT8an/2oApTgCnoK8BWl2kAFdOZ+4m
         xcTRgc064ZC90t33B5s0aHtZlhDx0NTVddQ/FpJKgLrvk6/5je0cZ/vbSHu2xRlbkR
         VBUbkBnaKnxipDcWMZG7gnu8+wwJa9Via+VWHVoQZtkk8iNBIjJs/lh6DGu+wE9+fb
         pypmcxh0hWHjGpTPn0R36C2MqTLQ4YuAsUiZP/GnfMntbLFT3awag74YpHOUdgdH8h
         YvXzlruQuMT/A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220516132527.328190-14-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech> <20220516132527.328190-14-maxime@cerno.tech>
Subject: Re: [PATCH v5 13/28] clk: Take into account uncached clocks in clk_set_rate_range()
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
To:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org
Date:   Wed, 29 Jun 2022 02:01:44 -0700
User-Agent: alot/0.10
Message-Id: <20220629090146.8E3DEC341CA@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Maxime Ripard (2022-05-16 06:25:12)
> diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
> index 8de6339f4f8d..9aa5b946f324 100644
> --- a/drivers/clk/clk_test.c
> +++ b/drivers/clk/clk_test.c
> @@ -362,9 +362,37 @@ static void clk_test_uncached_set_range(struct kunit=
 *test)
>         KUNIT_EXPECT_LE(test, rate, DUMMY_CLOCK_RATE_2);
>  }
> =20
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
> +       struct clk_dummy_context *ctx =3D test->priv;
> +       struct clk_hw *hw =3D &ctx->hw;
> +       struct clk *clk =3D hw->clk;
> +       unsigned long rate;
> +
> +       ctx->rate =3D DUMMY_CLOCK_RATE_1 + 1000;

Is this where we set the rate behind clk framework's back? Maybe add a
comment here to state that.

> +       KUNIT_ASSERT_EQ(test,
> +                       clk_set_rate_range(clk,
> +                                          DUMMY_CLOCK_RATE_1,
> +                                          DUMMY_CLOCK_RATE_2),
> +                       0);
> +
> +       rate =3D clk_get_rate(clk);
> +       KUNIT_ASSERT_GT(test, rate, 0);

This will almost always be true because rate is unsigned. Should it be
KUNIT_ASSERT_NE() instead?

Is there any benefit at all to this check?  We're going to check the
rate with an expectation in the next line for what we're actually
testing for, so it's not like we need to assert that the rate is
non-zero before checking that it is exactly DUMMY_CLOCK_RATE_1 + 1000.

I thought assertions were about checking sanity of the parts of the test
that aren't under test. If the assertion fails then our test is so
busted the expectation can't be trusted and we shouldn't even try to
continue. It's similar to BUG_ON() and WARN_ON().

> +       KUNIT_EXPECT_EQ(test, rate, DUMMY_CLOCK_RATE_1 + 1000);
> +}
> +
