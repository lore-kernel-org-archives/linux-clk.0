Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D407C433ED
	for <linux-clk@archiver.kernel.org>; Thu, 20 May 2021 23:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3BDF26138C
	for <linux-clk@archiver.kernel.org>; Thu, 20 May 2021 23:36:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234138AbhETXhn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 May 2021 19:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234225AbhETXhn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 May 2021 19:37:43 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2216AC061761
        for <linux-clk@vger.kernel.org>; Thu, 20 May 2021 16:36:20 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id e2so15528516ljk.4
        for <linux-clk@vger.kernel.org>; Thu, 20 May 2021 16:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uiEYhj/hJUSD/IDU7Y0eQJGcwJ9in+XbFu7eZe0F0iA=;
        b=bCiqxklQUSu5WbC8cR0qbg43ubrwUlEo+xRP/SPjrzU8k7Sk/7u4MDrwPDTxTrorx0
         jB/aGOgr0DTvdY+i9cqOzEDDnr6QOLRBYZbLYO07a7zr5FhAaFIljYHosfG0/Fp1oTd+
         6f13yW40uvztfICfWMkp6B1huQAXz7k1FNT1067ApXqdFHbd74T7tyTxBIbJrf5je598
         UUnqk2cDJbI/dm2iggSb+OiNdqi/Whmvvpnb2sNMb4iiBUERoQQihcmt7Os9PX4BurxO
         ldIDpTMQK22BqM61QwJZs8sxOIR+Og6C2TgeotgXyrwiUhMUaUpGpXiIBobEjwzd1tFl
         rSEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uiEYhj/hJUSD/IDU7Y0eQJGcwJ9in+XbFu7eZe0F0iA=;
        b=rQHuyivH7WdMZ1d1fy5P1HqgOw0kOpfwvzwKPBZ3s213PGIFVPsU3KGAOdBoJHry9O
         0y0ikixa+8XsDuHusUyQt4XRwlxiWPRksO/u3J7898w6kwkOU+dMNKKxN2wRZC2mCR34
         hfJf0AWbIr/B39FrKM55yL5F9IBwc1LEYEw00BTysuMg/liMSxgr5U1sYQXOTQqnn8dC
         +Z7LMDspN23hG10BEeJeAPhrQl/lSjZs220gj/mKHqOQoxJQqgjDp3Ft9sbTQEor4MT8
         Yi6soAdt3RNTwUIZrW6Aztx8a/RzjqhHB7cw1n2kSecNN9/aZ1Ce0I16zBYNJHNftoHN
         mdkQ==
X-Gm-Message-State: AOAM533S+SEHJk54yeefTV42ZyjcFm66qh8iwjAHC0ig/XrnCjkTuyqt
        x4j6rIcZTt7mfH1VZSzD7PTHLCOK4T0N+Tfgx1f1Xw==
X-Google-Smtp-Source: ABdhPJylu8m2f30rIC/TH4AdN7RIzUYo0nBAHSBJEWQsjgqKV/fZKjWZcZqM/jwKsFKS52g6UOmCZxr0U3BasgOtyPs=
X-Received: by 2002:a2e:1319:: with SMTP id 25mr4604039ljt.200.1621553778519;
 Thu, 20 May 2021 16:36:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210520161702.3746174-1-lee.jones@linaro.org>
In-Reply-To: <20210520161702.3746174-1-lee.jones@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 May 2021 01:36:07 +0200
Message-ID: <CACRpkdZgpFL4ALGr16hua-uSnM-5SrOZ1KGMkzTEDrZmwh_1=w@mail.gmail.com>
Subject: Re: [RESEND 1/1] clk: versatile: remove dependency on ARCH_*
To:     Lee Jones <lee.jones@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Peter Collingbourne <pcc@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 20, 2021 at 6:17 PM Lee Jones <lee.jones@linaro.org> wrote:

> From: Peter Collingbourne <pcc@google.com>
>
> It is now possible to build a modular kernel for vexpress by
> not setting CONFIG_ARCH_VEXPRESS=y and instead setting =m on the
> drivers that it normally implies. This is with the exception of
> CLK_VEXPRESS_OSC which is currently hidden behind a dependency on
> one of several ARCH_* variables. Remove that dependency so that
> CLK_VEXPRESS_OSC may be enabled without it.
>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> Link: https://linux-review.googlesource.com/id/I435a21e2e5f6187db54f4ef2079b60028ab2ea69
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
