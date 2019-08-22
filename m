Return-Path: <SRS0=TujE=WS=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2DA7C3A5A1
	for <linux-clk@archiver.kernel.org>; Thu, 22 Aug 2019 14:06:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A41AC233FC
	for <linux-clk@archiver.kernel.org>; Thu, 22 Aug 2019 14:06:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YjGutaIE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732909AbfHVOGs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Aug 2019 10:06:48 -0400
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46124 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725876AbfHVOGr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Aug 2019 10:06:47 -0400
Received: by mail-vs1-f66.google.com with SMTP id x20so3669349vsx.13
        for <linux-clk@vger.kernel.org>; Thu, 22 Aug 2019 07:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ORoXk3ZRgS9jNvpYbPqyKBVgMLRQQ2XXmWQM0+FO+2s=;
        b=YjGutaIEKQQg7bK1PbmrU22QMjesLDtGq1M7YyipAYmjv0BysgkKcwRKWyE03reNms
         KVBv7Sa2TDaY0LQ4PREzb11q1oqe44oqc8rpqY6v5o/t6mbSu/FBNFJq2x4RcwDZnEYg
         D6m9wuYzlFMldCAtxCWyDvwQuTuR3ZLCtiX8uBLIubScwixfcCyOC81SC2jC8QiC5H2w
         plYH8TdhVyHWB1AmotFWqyaAutI8MKhbSU/cqcnpd7q7sTg75LSAcT6+sSWpOdgja0tj
         GeEb5Muu0jS9YyBvZXFCsMvAqVG/KE11RsWgT18ZQ887OaDmXCdgW1WgELzDHJbrhHsj
         VJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ORoXk3ZRgS9jNvpYbPqyKBVgMLRQQ2XXmWQM0+FO+2s=;
        b=lIfhh/LeAGiJhrr0OtWxr/cOwlxNnlTb3ek51SZ2GTBdSqo8T4IJ78G4L9BMeFIS0r
         NC+DHElB2fOYS9TgMKq+3MTVnyspWDTmfUHyW/fQkpQD/tgR4gBJ/j5+ODACRDMiKnt/
         RZglfth5OjbtMjvL2sBYehoX7CyKKFY8maTs7tYecmOQWtVycCrIxsrTvh/nyImhqR4E
         fzP9XMgLkDf4URONn5z1iwXC3uLvdi8WQ5TGpse/8Q+EqeKyzSP3yJy24M/vMnK3xgMs
         MT+B6PKUFbho7L4kI6J3cnHHHyDgt4NLNUxshBJvfU4CBkDieZ2DmiOlDbQQ7h+CoUaN
         7nTw==
X-Gm-Message-State: APjAAAVLhAx9ppFSCcUs5dN6TPWKS8sEdWk+zSBurpRH4RAyoyu7N3BJ
        QXMHzaw/bVnR2L7aYCcPtfj+T/oguSd9d0GliRo+pg==
X-Google-Smtp-Source: APXvYqwd0MR/AjKq7X5DIo4hlw0s9CbrfREkUSY1oCN+DOSok5K61/0F/77Aw5POZ4JLfRKSpMjBam1wPm4MEBJzZEM=
X-Received: by 2002:a67:347:: with SMTP id 68mr19112864vsd.35.1566482806765;
 Thu, 22 Aug 2019 07:06:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190816125225.16061-1-geert+renesas@glider.be>
 <20190816125225.16061-2-geert+renesas@glider.be> <20190816180123.6299720665@mail.kernel.org>
 <CAMuHMdVvwsXU2YwFRA2Y2K9KKzF4L-hqDudarmc-OeHXRMCifQ@mail.gmail.com>
 <20190817034812.5435B21721@mail.kernel.org> <CAMuHMdWpUEt-wxEdAK7NsAOadS5TtHYdO=JTGT=CtSROHuR+Pw@mail.gmail.com>
In-Reply-To: <CAMuHMdWpUEt-wxEdAK7NsAOadS5TtHYdO=JTGT=CtSROHuR+Pw@mail.gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Aug 2019 16:06:10 +0200
Message-ID: <CAPDyKFpr7fw_rCciXzZNk2is8KFkd7Tvdx-fzyka_vobCK0U=g@mail.gmail.com>
Subject: Re: [PATCH 1/3] clk: renesas: mstp: Set GENPD_FLAG_ALWAYS_ON for
 clock domain
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[...]

> >
> > Well is it actually a problem to not specify the flag? I guess it's just
> > a potential problem if the genpd is ever powered off, but given that the
> > governor decides to leave it always enabled it doesn't actually matter?
> > So it's not really fixing anything besides silencing a harmless warning?
>
> The warning is indeed harmless.
>
> The "interesting" case is the case where no warning is printed, as no
> IRQ-safe device is present.  In that case, the absence of the
> GENPD_FLAG_ALWAYS_ON flag means that the core PM Domain code will
> consider the domain for power-off, and will loop over all devices part
> of it, which is suboptimal.  Setting the flag avoids that.
>
> Thanks for your continued questions, it made me realize I need to add more
> meat to the description to these "simple" patches!
>
> For the PM people: would it make sense to add a
> WARN(!genpd->power_off && !genpd_is_always_on(genpd), "...") check to
> pm_genpd_init()?
> Or set GENPD_FLAG_ALWAYS_ON automatically if !genpd->power_off?

Well, wouldn't it be possible that the power is provided through a
master domain, thus not having the ->power_off() callback assigned for
the subdomain is perfectly fine, even without having
GENPD_FLAG_ALWAYS_ON not set.

Kind regards
Uffe
