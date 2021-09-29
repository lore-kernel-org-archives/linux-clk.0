Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E93CC433EF
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 20:46:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 555126124C
	for <linux-clk@archiver.kernel.org>; Wed, 29 Sep 2021 20:46:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346770AbhI2UsC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Sep 2021 16:48:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346750AbhI2UsB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Sep 2021 16:48:01 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFF04C061768
        for <linux-clk@vger.kernel.org>; Wed, 29 Sep 2021 13:46:19 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id b15so15839488lfe.7
        for <linux-clk@vger.kernel.org>; Wed, 29 Sep 2021 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ei5m2coJFPE9ArBvAOBUe88q9SzwkYzMD0NediKju6U=;
        b=qEv872EZJ1VZxT3IbJ1lydKZMOtHlz2Tq+poMTU1EKCSqXT6FO1OsC7Rr+v4XFJLfu
         sh3FDwWV8D8kla4buDfzP9s/pIFjI20Ke+2kzu5bFSRunrsNbTbLE22/VNWZbyl31Ho4
         zC6ZL3/oa0CIuBN4hbE+4PVZPLmzFeni2OSZIC+HlfoxlZ6aVFhfUwfAtkyGN6GsyOap
         VOpWLMT6atWAINgWI7nt6MoexZQ6FhZ0nt5uIVa2L2mIbSs2XtHhnILZCdtulY3U5+CM
         n60SmQgw3yX64OcifIiQ9uN5K10wtgiaDdQ6m4PPUVmHMue7zLg41F2rxhTG6NjmFsS2
         URSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ei5m2coJFPE9ArBvAOBUe88q9SzwkYzMD0NediKju6U=;
        b=KqDSiZdDYZegB29CvITyHgoY3uGrjXAmKfx+hJhLB/mCseGq/+gI1DjcF6dRd16lQl
         y/pGQGiqGWpqJyprKKkoEJMUH672qBpWeIT60rMJ5Gsfyn8P9pYlmEzm4E/paFXhVzMp
         /kMSfLRnh6vzqyudpyFvrMI/bIcUJjvettVJ98E61yNVOM9l6DCGVfNKX8xDReRI7n+q
         Zlg1Fh12zv4M1jIBlMzVoOa2R/QsjTo+ZoL9b1/RhVLJamdDZ1aW4W9MThRszF5Jo3b6
         veLun0jhzfls3ra24Lo4cvsKnvqxOd08SgGlqxKZFIVP3QEcS0AzkFu6e4Fi68LtOvt6
         9Vaw==
X-Gm-Message-State: AOAM531bJVSTImOtoo0XRnfXI8g5G89/a69UH6RvKt3SjYlpeBuBtNue
        cvPZGynZiMaH5Sk2K0KpwVFSwOeHl6MQnhO2Ae2r9A==
X-Google-Smtp-Source: ABdhPJxrEvaOY+BJcEwgYKyltmJ1P95B1u5A4ohEGs0wRyoS4JlFDwH3bL8wLds17FeMKw6Pk2VeWmVGDsuYCaCd4P0=
X-Received: by 2002:a2e:9802:: with SMTP id a2mr2036742ljj.427.1632948377858;
 Wed, 29 Sep 2021 13:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210928235635.1348330-1-willmcvicker@google.com>
 <20210928235635.1348330-3-willmcvicker@google.com> <CALAqxLUju1Bw0dDpi_oK6-eOiP6B2Xm1MV19G53WaRFm3Z_AWw@mail.gmail.com>
 <CABYd82Z4pgJpYVhJEGjgbWgSQp7if_=Rf03VmTu+U9D3b=dVzA@mail.gmail.com>
In-Reply-To: <CABYd82Z4pgJpYVhJEGjgbWgSQp7if_=Rf03VmTu+U9D3b=dVzA@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Wed, 29 Sep 2021 13:46:05 -0700
Message-ID: <CALAqxLXUOY+tdJat0YaxAEiS_AWrwxBaLq3M90btSVdWfvFBag@mail.gmail.com>
Subject: Re: [PATCH v2 02/12] timekeeping: add API for getting timekeeping_suspended
To:     Will McVicker <willmcvicker@google.com>
Cc:     Russell King <linux@armlinux.org.uk>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Lee Jones <lee.jones@linaro.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Saravana Kannan <saravanak@google.com>,
        Android Kernel Team <kernel-team@android.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Linux Samsung SOC <linux-samsung-soc@vger.kernel.org>,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-rtc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Sep 29, 2021 at 1:01 PM Will McVicker <willmcvicker@google.com> wrote:
> On Tue, Sep 28, 2021 at 8:42 PM John Stultz <john.stultz@linaro.org> wrote:
> > On Tue, Sep 28, 2021 at 4:56 PM Will McVicker <willmcvicker@google.com> wrote:
> > >
> > > This allows modules to access the value of timekeeping_suspended without
> > > giving them write access to the variable.
> > >
> >
> > It's important to cover "the why" not "the what" in these commit
> > messages, so you might add a note as to what code will be the user of
> > this (the samsung/clk-pll.c code changed later in this series).
> >
> > thanks
> > -john
>
> Thanks John for the tip. I will try to be better at that in the followup.

I have to remind myself regularly as well. :)  Apologies if my quick
reply above seemed curt (as it does to me re-reading it now). Wasn't
my intent.

> For this specific patch, I am adding this new API because the Samsung
> PLL driver (drivers/clk/samsung/clk-pll.c) currently is using the
> variable 'timekeeping_suspended' to detect timeouts before the
> clocksource is initialized or timekeeping itself is suspended. My
> patch series aims to modularize the Samsung PLL driver. So to keep the
> driver's functionality intact, I need to add this additional API.

Sounds good!

Another small/medium suggestion:  Since you're adding a new interface
for non-core users of timekeeping_suspended, it might be good to
switch the other users as well (seems like just
drivers/clk/ti/clkctrl.c and kernel/sched/clock.c), then also remove
the extern in include/linux/timekeeping.h (so there's one consistent
method to access it)?  I know it's a sort of scope creep, so apologies
for asking, but it would make the series more attractive if it's not
leaving something for others to clean up later.

thanks
-john
