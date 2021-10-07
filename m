Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8E4C433EF
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 15:31:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B8E861245
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 15:31:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240912AbhJGPdK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 11:33:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240908AbhJGPdJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 11:33:09 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED8BC061570
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 08:31:15 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id q13so4566105uaq.2
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 08:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6eZtlPFWAta9cWAbKSnTEB89ZaaeeH9U6d/DiOEDJ4A=;
        b=dSEFfmniVED8B0xlIitfvX1io/mo+EB6OxRxCeRsqQQOqXu8Y72WwneAxwuNDoe69v
         BltyEpHe86PnqfjjHAUK1PjmNBgotm95hdp4tKWXeJykq2KNmKOHSrFfxX7toaIjPOfJ
         7KqGxdqAgndPB2tVNBcbqIHAtAWWhn/cuALeqgZrgREUg4TJAk85Ca53Z3Jm66fno/uE
         Q1Sh5R/ov3gQgUKc//zHbyd+xFxb8U+MZye4mJIvvC7RWb+DGs8q8cjv+7Qcn1kLhZZf
         xs3u5tMlYkDPCJj0auNZsSPVhyF1ybFBz00i/6KF34LWbR1REswR8stXwDQl0FSLq61r
         AduQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6eZtlPFWAta9cWAbKSnTEB89ZaaeeH9U6d/DiOEDJ4A=;
        b=cRv4mXLCgwqPUVHzsgwRe6tD1tgF3iqBHTh+XSxAaXdwS7sCmp3/QF8mXqZQvJyoH+
         xIZPMHGlF3SaKcK9rtotJhwBnOUchIlBr39FWloby8+VQdMnPehZu8CcclEykF1kmbXR
         ki4aK+ymsJBnbZQpHxpWOyRxpeNhkLczccTgfA3kKyIUF4aIV+GDgl3IIm+RloQtO68v
         qBOYCtVZYJiElz1TJgdIxZ23IqTpetuP+qnmcju8Wp5qddXbRfFyO9DifP2MmB0APjUy
         VkkrDLWN6rTjbOwtU9P1CBVFbUSyjYGbfTxq9TAGrkXWlGjO3AgRuB0mSvNBtRfP6UQk
         vKzw==
X-Gm-Message-State: AOAM53042gzwzo7/6gWVhmKRb6DQmM2IuE9kveFFSE3PbodL3TACoDmo
        mgpmyEVF4h7R+veErTW1rcyrTm4akHCE5KQe7gVVrg==
X-Google-Smtp-Source: ABdhPJzJnBuoD5URWYj80Agkqe+rghbldVV6ScEzSmK94NikdpG2KTBrSoM/XAT9r2zcxGPvCBrwXT1z5VtSuHdXSzk=
X-Received: by 2002:ab0:708e:: with SMTP id m14mr2737190ual.104.1633620675136;
 Thu, 07 Oct 2021 08:31:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211007135635.2717-1-semen.protsenko@linaro.org> <CAOMZO5DNF8pO__+Yjn32KEXDG_rq7LoOt=aKrsBz8gPfuxUxPw@mail.gmail.com>
In-Reply-To: <CAOMZO5DNF8pO__+Yjn32KEXDG_rq7LoOt=aKrsBz8gPfuxUxPw@mail.gmail.com>
From:   Sam Protsenko <semen.protsenko@linaro.org>
Date:   Thu, 7 Oct 2021 18:31:03 +0300
Message-ID: <CAPLW+4kEaJGbSFcY-Pex2jZdenjAfLakqy1ezGMKOAGHnab5Kg@mail.gmail.com>
Subject: Re: [PATCH v3] clk: Add clk_set_parent debugfs node
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 7 Oct 2021 at 17:17, Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Sam,
>
> On Thu, Oct 7, 2021 at 10:57 AM Sam Protsenko
> <semen.protsenko@linaro.org> wrote:
> >
> > Useful for testing mux clocks. One can write the index of the parent to
> > set into clk_parent node, starting from 0. Example
> >
> >     # cd /sys/kernel/debug/clk/mout_peri_bus
> >     # cat clk_possible_parrents
>
> s/clk_possible_parrents/clk_possible_parents

Thanks, will be fixed.
