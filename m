Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4E8FC43441
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 06:50:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 850A020835
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 06:50:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 850A020835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727417AbeJLOVd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Oct 2018 10:21:33 -0400
Received: from mail-vk1-f196.google.com ([209.85.221.196]:42066 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727358AbeJLOVd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Oct 2018 10:21:33 -0400
Received: by mail-vk1-f196.google.com with SMTP id t202-v6so2746034vke.9;
        Thu, 11 Oct 2018 23:50:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1X4hgJ9KYNUHLK3sQjhoMPVzB+bs5BrLWNptXybhXJ4=;
        b=duCXuK3Qcfxdss5U5y6OYj0Rw92KXtGJSajnhAh6Rj6C+5cpeBde+lRPG5xjoWOb6R
         YCMox8ZREIaAJ1v52LzLWjEocsEhtN9TEDMxLloQIkpE10D6EexRRvfy/b3vGNGKtsoL
         xkiSoXuuPDKVzf5zYR6Wxs20EuHGgF7v1nw7pX+ftB0u4IU8KZJM9sZng/CCLic5MZDt
         JIH50WtcUm+MBS6wcGtYuIzNCp6V/kbh+fhSxaQ6M78NC4ayne8aWs6zcBKP99JS5VN9
         e9/oaUnIKyUcG3f1MFgvHWThT3udGDAOP6cN7WePx8ILCMdLhkYQUarCMTcm3uZCcpAB
         B/3A==
X-Gm-Message-State: ABuFfojx+zXxpus67PKiHqK1tjU3rhVdKGOxmOjxicwGgVHn7GBij2nD
        8zkFLXa7Dh/0XY96Ib0dB1AtGOkkKlu8V+X2/Ys=
X-Google-Smtp-Source: ACcGV60f1w/BaeSawa0NodCthPArjSzJlh+KGfpajU80xleT0ytilvgcESmKtQN1sslpJ0UG0dC2bOPDlnbiFxBRFJ8=
X-Received: by 2002:a1f:ca44:: with SMTP id a65mr812269vkg.74.1539327033808;
 Thu, 11 Oct 2018 23:50:33 -0700 (PDT)
MIME-Version: 1.0
References: <ee107173-b39c-5dc0-4aef-9848639b1b38@ti.com> <153927528808.5275.15861958277033864892@swboyd.mtv.corp.google.com>
In-Reply-To: <153927528808.5275.15861958277033864892@swboyd.mtv.corp.google.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 12 Oct 2018 08:50:22 +0200
Message-ID: <CAMuHMdWZK+xc0U1cjbDy9hbkcryOi31XKXjC76gV+jzifYgRGA@mail.gmail.com>
Subject: Re: [GIT PULL] clk: ti: updates for v4.20
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>, ext Tony Lindgren <tony@atomide.com>,
        j-keerthy@ti.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Oct 11, 2018 at 6:28 PM Stephen Boyd <sboyd@kernel.org> wrote:
> Quoting Tero Kristo (2018-10-03 06:12:39)
> > Here are the late changes for TI clock driver for 4.20 merge window.
> > Sorry about the late pull request, but this was waiting for resolution
> > on one of the dependencies (patch "clk: ti: fix OF child-node
> > lookup..."). Thanks for setting up the immutable branch for it.
> >
> > Please especially note the core clock changes in this series for adding
> > support of clk save/restore mechanism (two patches from Russ Dill.) I
> > decided to go ahead by adding them to this pull as there has been no
> > comments on the patches and they have been pending on the lists already
> > for a while. They aren't touching anything existing either, so they
> > should be safe to apply also.
>
> Thanks for calling it out and pushing me to react. I have been avoiding
> the suspend/resume patches unsuccessfully and now after looking at them
> I see a few nitpicks that I can resolve after merging this PR. It's also
> a sort of one-off solution for TI where all clks need to run through
> save/restore in a depth-first tree order and just blast in
> enable/disable bits, so we'll need to improve on it in the future. But
> I'm fine to go with it for now and do _something_ instead of just sit
> around and do nothing.

For the record, drivers/clk/renesas/renesas-cpg-mssr.c uses a notifier chain
for save/restore, where individual clock type drivers can register with.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
