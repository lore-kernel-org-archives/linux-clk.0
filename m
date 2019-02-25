Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01AC8C43381
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:47:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD2662084D
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:47:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfBYJrp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:47:45 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:33084 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726493AbfBYJrp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Feb 2019 04:47:45 -0500
Received: by mail-ua1-f65.google.com with SMTP id q17so7781190uam.0;
        Mon, 25 Feb 2019 01:47:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wlskQsgIBn4sICgGxL5FRNZN5XLKGbFA+5xk3EfSALs=;
        b=liG4qVXac4hCKv9OfUDBAEkkhmXDig2XxPrFNBShen+5OseVMVy3ZElGUIbEWAmssP
         GOhB+KKInl+AJ4x583xMzNTclvEvIcZwZVTqVznEu6zQlJK0yHIlL15FVfDwUIh9nhfo
         KFbDn2RAJToredqvs81lA9YQKOpf0d8k5LWkrGRtpfEitD8M14Ky4hFUzjkUhLytD3ay
         J9Is+4Loz1dLOVQ1HyblEKHMy4GFDx/AxZ3ygkhaOAI5VLFJg/avwsj/yBFHg6MSXQND
         tuYho5875eKrgJFSQiSliJXQAKfMIG/d6eI2njuyc+F2c0h6aCYejlI0DaWDnG/TAbPF
         MHww==
X-Gm-Message-State: AHQUAubCNDVry5PvKtDQSGdPD8tUbauOPsBoOYTZsZFhfruFHfKdCQfz
        Byn9281zu5HdJEDjfZSYJpyvOdylFZAkEnlzJxXdAQ==
X-Google-Smtp-Source: AHgI3IZp3UB6iWE1+siAJxRP/6FFky20oiqNcDvFdldU49CzMv6iFvn/A4TrOyvlwdymC0TCfAVW6UAIuNp97bpP5Yo=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr8610216vsc.152.1551088064076;
 Mon, 25 Feb 2019 01:47:44 -0800 (PST)
MIME-Version: 1.0
References: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB2285B3DDEA95F441338DF14AB77F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
 <20190225092708.cwormmuqdm3g4umy@verge.net.au> <TY1PR01MB177027370EE55C92347CC576C07A0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
In-Reply-To: <TY1PR01MB177027370EE55C92347CC576C07A0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Feb 2019 10:47:31 +0100
Message-ID: <CAMuHMdUyf56_CnTS=b5UWxh8rWp9YF8sNR-BOThuB5Tpzf7BRQ@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Chris Paterson <Chris.Paterson2@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Fabrizio,

On Mon, Feb 25, 2019 at 10:44 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> > From: Simon Horman <horms@verge.net.au>
> > Sent: 25 February 2019 09:27
> > Subject: Re: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
> >
> > On Fri, Feb 22, 2019 at 12:01:21PM +0000, Chris Paterson wrote:
> > >
> > > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > > Sent: 22 February 2019 12:00
> > > >
> > > > Enum LAST_DT_CORE_CLK needs updating as R8A774A1_CLK_CANFD
> > > > was recently added and it's the core clock with the highest
> > > > index.
> > > >
> > > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
> >
> > I think this needs:
> >
> > Fixes: 9d034e151b40 ("clk: renesas: r8a774a1: Add missing CANFD clock")
>
> I naively thought I could only refer to commits from Torvald's, which is clearly wrong,
> therefore thank you for fixing.

FTR: You can refer to any commits in linux-next that are considered stable,
i.e. on branches that are never rebased.
This includes all for-next branches of maintainers who accept pull requests.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
