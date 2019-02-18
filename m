Return-Path: <SRS0=h55i=QZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6166AC43381
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 10:17:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36A932173C
	for <linux-clk@archiver.kernel.org>; Mon, 18 Feb 2019 10:17:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728858AbfBRKRt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 18 Feb 2019 05:17:49 -0500
Received: from mail-qt1-f196.google.com ([209.85.160.196]:33567 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726800AbfBRKRt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 18 Feb 2019 05:17:49 -0500
Received: by mail-qt1-f196.google.com with SMTP id z39so18605796qtz.0;
        Mon, 18 Feb 2019 02:17:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+8Kgv8PlwJL5KkdyPdTYb24HeDNj6IXtvBZ6RD/ghcE=;
        b=GlgcY0QHKzEbFn4C4krLI5t/xSfLro3l+eGviBAzw/XetcviUvuJVxTQYcXYlC6oPF
         b9tpX1vfIOfUDEWmkfL2mf6IL7+bmRCg70zLF992G+p5fZ4c3+QK5MXonxMcDIRan4uv
         617XOCqkuIOWGSOhIjvRazrG0z05GlW86Hsnls2S8252AOXkjjhbQR3sG9+AAi/eZaY+
         OAX20h5fef1UmNBa7dFt79Hsd5IMBUUN8nZFIwyjs0GeEbQ/wtuYtiP1l66f+9LZ9w1q
         fpRFdgZBXUWN6d3dco845AyozohGg0DWwW+altJd5yhcDIWb2CX4YUJhLKaLUhS7os4C
         kSKQ==
X-Gm-Message-State: AHQUAuYM6bbAS4NTv8QRZDGcBWzOe8KXYbX9/aGfur6T/gMsTPBzhzim
        vTBLBROGuW/8I9rpTSwaMuNEQT9i3nC6Pdrq0mg=
X-Google-Smtp-Source: AHgI3IZQ/Kw4WLXZbQOzM/KsrL/flUhSZV8pkxxYWTRzoa5OeFJ/8qziVGKyZCnSYs3TeMwNTl51ZjHy0aDHTTzpPZ0=
X-Received: by 2002:ac8:445a:: with SMTP id m26mr17398822qtn.212.1550485068101;
 Mon, 18 Feb 2019 02:17:48 -0800 (PST)
MIME-Version: 1.0
References: <20190218070609.167535-1-weiyongjun1@huawei.com> <20190218083858.GA19363@ulmo>
In-Reply-To: <20190218083858.GA19363@ulmo>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Mon, 18 Feb 2019 11:17:31 +0100
Message-ID: <CAK8P3a1DdyG5EHN-H_OeJWzh9-kJau6TZ54d1Cdco87ANgTa4A@mail.gmail.com>
Subject: Re: [PATCH -next] clk: tegra: dfll: Make symbol 'tegra210_cpu_cvb_tables'
 static
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     arm-soc <arm@kernel.org>, Wei Yongjun <weiyongjun1@huawei.com>,
        "\\ Peter De Schrijver" <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Joseph Lo <josephl@nvidia.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 18, 2019 at 9:39 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Mon, Feb 18, 2019 at 07:06:09AM +0000, Wei Yongjun wrote:
> > Fixes the following sparse warning:
> >
> > drivers/clk/tegra/clk-tegra124-dfll-fcpu.c:244:18: warning:
> >  symbol 'tegra210_cpu_cvb_tables' was not declared. Should it be static?
> >
> > Fixes: 2b2dbc2f94e5 ("clk: tegra: dfll: add CVB tables for Tegra210")
> > Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> > ---
> >  drivers/clk/tegra/clk-tegra124-dfll-fcpu.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> ARM SoC maintainers,
>
> This fixes a sparse warning introduced in the tegra-for-5.1-clk pull
> request that you pulled last week. Do you want me to send you another
> pull request (perhaps give it a few more days in case other fixes are
> going to show up) or would you rather apply this directly?
>
> In the latter case, here's a link to patchwork:
>
>         http://patchwork.ozlabs.org/patch/1043804/
>
> and this is:
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Applied to arm/drivers, thanks!

>
> In the meantime, I'll go and improve my build scripts to run sparse as
> well. I used to do that but then removed it again because it was so
> noisy that it was impossible to filter out the Tegra-specific bits. I
> wonder if I could do something like have the build scripts build the
> branch base first, without sparse checking, and then fast-forward to the
> branch head and build again with sparse checking enabled. That way I
> should only be seeing the sparse results for code that was modified in
> the branch.

I should also restart my regular testing to find regressions, I'm
currently not doing any regular builds but rely on the bots.

      Arnd
