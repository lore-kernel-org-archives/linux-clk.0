Return-Path: <SRS0=Ati7=SZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5842C282DD
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 07:47:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE142206BA
	for <linux-clk@archiver.kernel.org>; Tue, 23 Apr 2019 07:47:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726130AbfDWHrE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Apr 2019 03:47:04 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34112 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725888AbfDWHrE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Apr 2019 03:47:04 -0400
Received: by mail-vs1-f68.google.com with SMTP id t78so7729939vsc.1;
        Tue, 23 Apr 2019 00:47:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Wj5jZcKMZaOyGXlAkiClbQvKsdQD78WBTyQQ8q29tbc=;
        b=F5xubDmo54CK2CRhfRSPeDw4zsvaNrErAmCv310ekYOClNc4zZ/ANUw6oMh/yO1lE0
         v4+sbxANN3C9sAYo4ovhfBOTrer7IkMj7+NOXvxzCZtYZC0as4a2bjsZ9YULYjLGNj2U
         dCj7gR/23P8qpNd2PUDiCFKne1KVIAh714BbfYkNPchKSQg6PWfkN4hnjwEs4rbsCrp7
         Y/2LAqIet2z+4sdz2nrdgPz9YmUZiieQ655zd6nMW2/bIEf8iX9Q6b2iNUK9HJmoLIr5
         Io+UIEMb4QmdcBr9BK755MPpmjTIKAvY87amuOijS3uWt0Ome7FcdEnbNyiXGGe8czni
         U4dg==
X-Gm-Message-State: APjAAAW/LSS3R3iRXEYyw6eBDsoOGDDPolzXGKHD9C/dqmvaHaaTtmdd
        +sByjqVj07iC+JvJfXZo+PJSWJ5pRlnRU/y8oypFYA==
X-Google-Smtp-Source: APXvYqxo26ej/6F6dc33/I4MPlHPdV8j7IfTxr2RWvPkX4iNQPzm2d2THVf3/Z05O+yjPgX+BiNqKQW+B5O5BSjXIBM=
X-Received: by 2002:a67:8317:: with SMTP id f23mr11903182vsd.63.1556005622942;
 Tue, 23 Apr 2019 00:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190404113722.20634-1-geert+renesas@glider.be> <155500418814.20095.8564288702076959777@swboyd.mtv.corp.google.com>
In-Reply-To: <155500418814.20095.8564288702076959777@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 23 Apr 2019 09:46:50 +0200
Message-ID: <CAMuHMdXpBHBPqEBHqphYbOVhgZyOFLSUPgB__5P-FFOehgWfbQ@mail.gmail.com>
Subject: Re: [git pull] clk: renesas: Updates for v5.2
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Thu, Apr 11, 2019 at 7:36 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Geert Uytterhoeven (2019-04-04 04:37:22)
> > The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:
> >
> >   Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)
> >
> > are available in the Git repository at:
> >
> >   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.2-tag1
> >
> > for you to fetch changes up to b953eaaeb58efc944f51cffd3f6838657958f0f8:
> >
> >   clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate() return value (2019-04-04 11:54:46 +0200)
> >
> > ----------------------------------------------------------------
> > clk: renesas: Updates for v5.2
> >
> >   - Add missing PCI USB clock on RZ/N1,
> >   - Add Z2 (Cortex-A53) clocks on R-Car E3 and RZ/G2E, incl. a new
> >     helper in <linux/math64.h>,
> >   - Small fixes and cleanups.
> >
>
> Thanks. Pulled into clk-next with the below fix squashed on top.
>
> ----8<----
> From: Stephen Boyd <sboyd@kernel.org>
> Subject: [PATCH] clk: renesas: rcar-gen3: Remove unused variable
>
> This variable is no longer used and the compiler rightly complains that
> it should be removed. Drop it to silence the following:
>
> drivers/clk/renesas/rcar-gen3-cpg.c: In function 'cpg_sd_clk_register':
> drivers/clk/renesas/rcar-gen3-cpg.c:386:15: warning: unused variable 'i' [-Wunused-variable]
>   unsigned int i;
>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: b953eaaeb58e ("clk: renesas: rcar-gen3: Fix cpg_sd_clock_round_rate() return value")
> Signed-off-by: Stephen Boyd <sboyd@kernel.org>

Thanks pulling, and for fixing this silly oversight.

/me wants his gcc-4.1 back...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
