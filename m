Return-Path: <SRS0=kMKU=RA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1AE1C4360F
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:32:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7ECBE20989
	for <linux-clk@archiver.kernel.org>; Mon, 25 Feb 2019 09:32:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbfBYJcv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:32:51 -0500
Received: from mail-ua1-f67.google.com ([209.85.222.67]:46880 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfBYJcv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Feb 2019 04:32:51 -0500
Received: by mail-ua1-f67.google.com with SMTP id j8so7672567uae.13;
        Mon, 25 Feb 2019 01:32:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uKuG3ub15AC8m9bi6+fcSPtN3gEcVgTGvQs9amG9RU0=;
        b=YRzFtikKpOoL8KNBQWiqOgowGIIU+YZuMyKpGtUN+LbPYutZvkk0jRk+QTlwRGkt53
         /XWkmXdHMVyodQbsHDe8QEoMoajnUOoVqKaVGeExWB0vWWUbsUc5a8DC1gG6fY28v/G3
         /jwTbS07d16uEZ9h+LyJPdjLmVD37gFCPVw7KirfewMdpgBRU2NcZ3Z6iJsRYI3wo/MQ
         q845l6M5lFyiTfyvwxCTJfy+J0M39RMZ1cvRGoE+05DdMEv+DBCGmn+muxhR46NnhMo1
         BUc8nl5oGwHbGuODL8WZf6j8/q/0/P5Je2JOBDSJcnlak/tqvFxKNOA97NRQBEto4b+D
         SR3g==
X-Gm-Message-State: AHQUAubbV184KOFjG4Y7izHOJUME15AZXAkdKuxrD4YMhh8MbbFgB4CZ
        uYF8FrE3GGAngnsZhgUaNSfUZkh+Ff64mKnc/WE=
X-Google-Smtp-Source: AHgI3IZnrmBogloimz2AA0kW17N/AjcIe3iEYt433GrsJoqTYkqXmT9o+6bZU4LFPxenieqUXIurIfeuqMv/CxNSdRk=
X-Received: by 2002:a67:fc9a:: with SMTP id x26mr8780060vsp.166.1551087170637;
 Mon, 25 Feb 2019 01:32:50 -0800 (PST)
MIME-Version: 1.0
References: <1550836779-6868-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <TYAPR01MB2285B3DDEA95F441338DF14AB77F0@TYAPR01MB2285.jpnprd01.prod.outlook.com>
 <20190225092708.cwormmuqdm3g4umy@verge.net.au>
In-Reply-To: <20190225092708.cwormmuqdm3g4umy@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Feb 2019 10:32:38 +0100
Message-ID: <CAMuHMdWWUxv5L4-CDBiAGXerM=+=7zP4VG1m2H0qFX4sMU+vaw@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a774a1: Fix LAST_DT_CORE_CLK
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Chris Paterson <Chris.Paterson2@renesas.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 25, 2019 at 10:27 AM Simon Horman <horms@verge.net.au> wrote:
> On Fri, Feb 22, 2019 at 12:01:21PM +0000, Chris Paterson wrote:
> > > From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > > Sent: 22 February 2019 12:00
> > >
> > > Enum LAST_DT_CORE_CLK needs updating as R8A774A1_CLK_CANFD
> > > was recently added and it's the core clock with the highest
> > > index.
> > >
> > > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> > Reviewed-by: Chris Paterson <chris.paterson2@renesas.com>
>
> I think this needs:
>
> Fixes: 9d034e151b40 ("clk: renesas: r8a774a1: Add missing CANFD clock")

Exactly.

> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Mike/Stephen: can you please take this one directly, as it is a fix for
clk-next?

Thanks!

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
