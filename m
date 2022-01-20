Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DD48C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jan 2022 21:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347503AbiATV4w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jan 2022 16:56:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231373AbiATV4w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jan 2022 16:56:52 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEF66C061574
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 13:56:51 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id r10so3535491edt.1
        for <linux-clk@vger.kernel.org>; Thu, 20 Jan 2022 13:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8u7NMm+rPXQcaBd4u7CURbKlEhOD+sAcU76P/uy3xSo=;
        b=Nhv802qLytk4HmYE3loHOq2Ltf4zwpYqzFr1Z2gDlmKh/ZqbIyoSYnJanUPRP3VM7m
         7hw42HeKvDf+S1kJHokoR14s3T7waaTflccbp8BOA5ylIB0SAPxtlZ/iYjbwL8NxB6RB
         0yG1DqamdnKmppodbDRL5cqBh39YLejrLRpUDTJi0GUgJYSG1G6WjkrpcaWGwiuyEWWC
         TzzgHBK8/OKZI8NFyYpV53SqA+Kgnq35O682Ucs29bagWVx9dvNdxuUvOrL6MHXNpwX+
         YVP+6rNvUo5aQoa+X6pgT+jGS2B6vJf9nbIjHvdlvo3m2IYzUDQJi0uz9ls/JboDosmV
         7ohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8u7NMm+rPXQcaBd4u7CURbKlEhOD+sAcU76P/uy3xSo=;
        b=mfiKPoNk60l/TItDGES+m5gW+qycW45Qi35k3KbdzYXUKMmBeSWcJCFnFJScpGvjTo
         2hay4a4gdylCYMhbobClNpRRCh85Vf4tOa35gc0AaHwAI1fKiteRZqFayPRCEeobQVOx
         zZl/KP+i2CbRqfQHARy7jFBl808QMEn+jVTpEM1NYFTuk77BXpag0BtVBLwWGUgwtXrg
         rIe0BtJrJmu2SjHGRo53Wl7FAaC2S9xEE75y9fTeRTQJMfpbFA2lZEwu+mVeKeCkZN7g
         DYl09/KiUOYB4fdEaj8rhkNLwQOgo9QoDbX5ExlAtLFBLIuUYfGCJdDPklSeKldOD496
         SFjA==
X-Gm-Message-State: AOAM531H7YglL8y0w+y47nMK3XY9MJ/CbSXRhWSKdZ4D/YK0LdaJbNd9
        0N23ijQ3FcCtkV/j46B0emX30KOqWF9akCNuqaI692qzcuo=
X-Google-Smtp-Source: ABdhPJycMxh1F3SLvffkdrbcJ2W2XXm+SFnaVBUXceg/wlh8jd9RkYhsIIluk6AwlmUPqugURrQqde0qXyz0jCXbpzA=
X-Received: by 2002:a17:907:6da4:: with SMTP id sb36mr766447ejc.542.1642715810271;
 Thu, 20 Jan 2022 13:56:50 -0800 (PST)
MIME-Version: 1.0
References: <20220120143417.543744-1-maxime@cerno.tech> <20220120143417.543744-2-maxime@cerno.tech>
 <20220120213118.40F0AC340E3@smtp.kernel.org>
In-Reply-To: <20220120213118.40F0AC340E3@smtp.kernel.org>
From:   Daniel Latypov <dlatypov@google.com>
Date:   Thu, 20 Jan 2022 13:56:39 -0800
Message-ID: <CAGS_qxq9qFjx+Su_E5sQF5tsgPCyhzGMFEMZbVqPN=N6U+s+9g@mail.gmail.com>
Subject: Re: [PATCH v3 01/10] clk: Add Kunit tests for rate
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Maxime Ripard <maxime@cerno.tech>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>, kunit-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 20, 2022 at 1:31 PM Stephen Boyd <sboyd@kernel.org> wrote:
> I was thinking this would be more generic so that one file tests clk.c
> and all the code in there, but I guess there may be config dependencies
> like CONFIG_OF that we may want to extract out and depend on
> differently. I'm not sure how kunit will handle testing different paths
> depending on build configuration so this approach may head off future
> problems. If it doesn't then we can always slam the test together.

KUnit doesn't have hard technical limitations in this regard.

You could have something like this

static void my_optional_kunit_test(struct kunit *test)
{
#ifdef CONFIG_OPTIONAL_FEATURE

# else
  kunit_skip(test, "CONFIG_OPTIONAL_FEATURE is not enabled");
#endif
}

I think it's just a matter of what's least confusing to users.

> > +}
> > +
> > +/*
> > + * Test that the actual rate matches what is returned by clk_get_rate()
> > + */
> > +static void clk_rate_test_get_rate(struct kunit *test)
> > +{
> > +       struct clk_dummy_rate_context *ctx = test->priv;
> > +       struct clk_hw *hw = &ctx->hw;
> > +       struct clk *clk = hw->clk;
> > +       unsigned long rate;
> > +
> > +       rate = clk_get_rate(clk);
> > +       KUNIT_ASSERT_TRUE(test, rate > 0);

KUNIT_EXPECT_GT(test, rate, 0);

> > +       KUNIT_ASSERT_EQ(test, rate, ctx->rate);
>
> These should be KUNIT_EXPECT_*() as we don't want to stop the test if
> the rate is wrong, we want to check that the rate is what we expected it
> to be. Assertions are about making sure things are sane and if not we
> should stop testing, whereas expectations are about testing the code. A
> test must have an EXPECT while it can have an ASSERT.
>
> Maybe kunit should check that there was an EXPECT on return from the
> test. Daniel?

Sorry, I'm not sure I understand the question.

Are you saying you want kunit to flag cases like
  static void empty_test(struct kunit *) {}
?
