Return-Path: <SRS0=W/YM=DX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31839C433E7
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 14:56:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C7A3120874
	for <linux-clk@archiver.kernel.org>; Fri, 16 Oct 2020 14:56:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="Ymp3Z3Al"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2409643AbgJPO4f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Oct 2020 10:56:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406998AbgJPO4c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Oct 2020 10:56:32 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8554C0613D3
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2020 07:56:30 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id m128so2731758oig.7
        for <linux-clk@vger.kernel.org>; Fri, 16 Oct 2020 07:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o683JyDzGtCz8h08bH720Xzkdnsct+b153JAeeQ2q3A=;
        b=Ymp3Z3Alkmll4V81zm2iA/funD9+iBwilvwYdSd9IX5hMZRv5M7byKXSK+PMkOp56A
         +yYyeMN+OW4vBy4YOedRf8XjX4mA9LNxrHGmvVrkQ2/PnZSw12zAqipKc5ZExVnn1a+k
         0o+3tuXvjoOf+ml2ynW9iAxrN5i1wfkPOKe8BNsnzj4Zl9a1yViKfBXoMkf13O8R9toq
         O+EoBlUWfBjYm+ei9fZxzNzkD2FqsMsRvuPUEhk8BpX3NGo4Q6rKhrrOtXsCk+g/EYQ6
         hkvAddoDwwCVKhyig9g52Gn5e8MAT0MxaPRma95tSkBJdMnMZ5lVP6fGnBryobfPcveD
         SEJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o683JyDzGtCz8h08bH720Xzkdnsct+b153JAeeQ2q3A=;
        b=Yk0vbou+6I0nWeQz6HORrrafeGh85iqR8ttbqzPUiFrVaIBb6dDjXyxWyCnF/w+Oag
         NrnArP53a3B0X1WN9u/yjShQZdCNKB0d4TXluCOVAUQHMEBG02yp/n0rlFwM4cqiYMgR
         e+Ca4h6s7atYe/yVgxhFqlup+P5FIKvhoDtpFDKXEELi+O6gd87A9DuCPo+IUZcNQo+D
         Wupf2ooad2WeVAq0vb+ZndZbv1yQqvLefM3PsB0nwfMiFrZlfLwA76pxhmafDObqUT62
         r1hCusTYNlsgoyqGvRX9by/I938ERyHtXVTdlG+/qlfKPLAW9A8kmnf5OkRV/3q4N1Lj
         BFTA==
X-Gm-Message-State: AOAM53342+2PVkEDireNZ6m8B0hZLzN4teIAMapztPsWq9bFkw+c893d
        d7oAlUYqkSidRarnvg1M0fNDfeDiUGHAgKVmpHofx5lW5fKthg==
X-Google-Smtp-Source: ABdhPJwaOVXEFgE7MDb+P6rriQcnt5gJEF9iYQ95Wzrs+rMlfp6FglUJ6grrdHS4qDdHDbY3U7tDou8zkTfLCp3asy0=
X-Received: by 2002:aca:6702:: with SMTP id z2mr2818623oix.140.1602860190126;
 Fri, 16 Oct 2020 07:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com> <d0627c5b-1007-bca0-e6d6-0a3740eaf6a7@gmail.com>
In-Reply-To: <d0627c5b-1007-bca0-e6d6-0a3740eaf6a7@gmail.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Fri, 16 Oct 2020 22:56:19 +0800
Message-ID: <CANXhq0pgeDZkWgwmZE+sFPjYhAmNBNoYGPRfij+Yz_Pc8hNN-Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: add driver for the SiFive FU740
To:     Sean Anderson <seanga2@gmail.com>
Cc:     Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        Yash Shah <yash.shah@sifive.com>,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-clk@vger.kernel.org,
        linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 16, 2020 at 10:17 PM Sean Anderson <seanga2@gmail.com> wrote:
>
> On 10/16/20 5:18 AM, Zong Li wrote:
> > Add a driver for the SiFive FU740 PRCI IP block, which handles more
> > clocks than FU540. These patches also refactor the original
> > implementation by spliting the dependent-code of fu540 and fu740
> > respectively.
> >
> > Zong Li (4):
> >   clk: sifive: Extract prci core to common base
>
> I don't see this patch, and it isn't listed on the web archive. Was it
> not CC'd to this list?
>
>         --Sean
>

There is a problem on linux-riscv mailing list for the first one
patch, the size of it is too big, it needs to be approved and posted
on the list by moderator.

This patch set is also sent to clk mailing list, and I can see it on that:
https://patchwork.kernel.org/project/linux-clk/patch/b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com/




> >   clk: sifive: Use common name for prci configuration
> >   clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
> >   clk: sifive: Refactor __prci_clock array by using macro
> >
> >  arch/riscv/Kconfig.socs                       |   2 +-
> >  drivers/clk/sifive/Kconfig                    |   8 +-
> >  drivers/clk/sifive/Makefile                   |   5 +-
> >  drivers/clk/sifive/fu540-prci.c               | 618 +-----------------
> >  drivers/clk/sifive/fu540-prci.h               |  21 +
> >  drivers/clk/sifive/fu740-prci.c               | 102 +++
> >  drivers/clk/sifive/fu740-prci.h               |  21 +
> >  drivers/clk/sifive/sifive-prci.c              | 529 +++++++++++++++
> >  drivers/clk/sifive/sifive-prci.h              | 297 +++++++++
> >  include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
> >  10 files changed, 1032 insertions(+), 594 deletions(-)
> >  create mode 100644 drivers/clk/sifive/fu540-prci.h
> >  create mode 100644 drivers/clk/sifive/fu740-prci.c
> >  create mode 100644 drivers/clk/sifive/fu740-prci.h
> >  create mode 100644 drivers/clk/sifive/sifive-prci.c
> >  create mode 100644 drivers/clk/sifive/sifive-prci.h
> >  create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h
> >
>
