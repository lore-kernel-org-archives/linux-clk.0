Return-Path: <SRS0=4E15=D5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3D27C388F2
	for <linux-clk@archiver.kernel.org>; Thu, 22 Oct 2020 13:31:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5740C20BED
	for <linux-clk@archiver.kernel.org>; Thu, 22 Oct 2020 13:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2900109AbgJVNbY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 22 Oct 2020 09:31:24 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41487 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2895506AbgJVNbY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 22 Oct 2020 09:31:24 -0400
Received: by mail-oi1-f196.google.com with SMTP id q136so1697779oic.8;
        Thu, 22 Oct 2020 06:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UhboZwAGzeqzQpbq3SMH7k8GtFSAUCRloSoaVz8dUUs=;
        b=Y7IexbPEecF+GNQEpvybf3tEErwTEY+ZJr5GblEGI6Ls6p09MDwg7HfeBCdsWr0JPm
         dXZ6YkaKD8NPQDSv7ggPuIgnBHsokl03LiV4Nfau1zj3tWW4b7hNqzZbK+BxyrOZ0igc
         knPizA/Rr9euH2ykS3eMtICkpE2hYaAC7dK8vhZfP0D2rytYvqdyaZkl8IzXRRBAYJkM
         DEFLyzj3o1ZDcOPvqRt+nNov+ytYftsWvBdVPJfi7328cbEZjZMDL04J+QoB2HlYT+TQ
         AxpS3NfCgy2NAu5rrX3r+xq3qssYMM67TP8tQ3ndPqHC9KgIKEZ9Ot+4fpjtxvcZHG0K
         4T9A==
X-Gm-Message-State: AOAM533MEs08nSI4LEQjgW7ltY2TYeoNObddlHJe0FxLmZsTTNZYpB0Q
        OyL5oZtVc5FS6VLOL/nwLqYKiTP8EawdxewsKqk=
X-Google-Smtp-Source: ABdhPJz39R2SFO1iDXQQFvpVsKcekU58PIW9IUOOZB7j78BBf8BG/32DMa0/YHxLmJtqtTQWkAvTv7xhsdS1EoPSXP4=
X-Received: by 2002:a05:6808:8f5:: with SMTP id d21mr1427916oic.153.1603373482175;
 Thu, 22 Oct 2020 06:31:22 -0700 (PDT)
MIME-Version: 1.0
References: <20201016121709.8447-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20201016121709.8447-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20201016121709.8447-4-prabhakar.mahadev-lad.rj@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 22 Oct 2020 15:31:10 +0200
Message-ID: <CAMuHMdX--Z-ms9O3c=+Daqq3JDaR30rVtMLCPQ4L9q=EtPcdAg@mail.gmail.com>
Subject: Re: [PATCH 3/4] clk: renesas: r8a774b1: Add RPC clocks
To:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Prabhakar <prabhakar.csengg@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 16, 2020 at 2:17 PM Lad Prabhakar
<prabhakar.mahadev-lad.rj@bp.renesas.com> wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the RZ/G2N (R8A774B1) CPG/MSSR
> driver.
>
> Inspired by commit 94e3935b5756 ("clk: renesas: r8a77980: Add RPC clocks").
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.11.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
