Return-Path: <SRS0=af6Y=EK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C90A5C2D0A3
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 06:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FA8E223C7
	for <linux-clk@archiver.kernel.org>; Wed,  4 Nov 2020 06:37:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EK8UYcc+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725854AbgKDGh2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Nov 2020 01:37:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725775AbgKDGh2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Nov 2020 01:37:28 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DFD2C061A4D
        for <linux-clk@vger.kernel.org>; Tue,  3 Nov 2020 22:37:28 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id u127so21106657oib.6
        for <linux-clk@vger.kernel.org>; Tue, 03 Nov 2020 22:37:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NdyAupHoBSpX8M4LNhpuR15yjy0bTroUkv3Rh3Q8LnI=;
        b=EK8UYcc+V7mbPA5bIGcRMagowbDawbm+GUFAp0Zae+iwnjhU3XDGEG2pQWoO7dNIiH
         iROpuEoA50KNMGEgL2wvanozsOfE1uO5ufljm7v1JPHmmN1ma7YuJdt3JB1z02wC5rdN
         TFyqiALsjwDjp3oFLw72sa0Kj37oaj2wOpx7bQFOkm8Cb1ZQbkTGzlFClXkwCMl86agQ
         vqLdQr8HHLYy4eBSo0trBzkTVod5SCD4rv5xzwh8q7OADK0yWqvpYt8Z/e2p1zUYjNHC
         +WyOYPbfXaO1yHXAYgy/RU7VpTdpFmxb493pHA5MqL9mETHw3XAMfowwbvag06WFiGfQ
         KS9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NdyAupHoBSpX8M4LNhpuR15yjy0bTroUkv3Rh3Q8LnI=;
        b=V72I/zS7jLjEN5LUk5okvuCUXHoGsh9B0ZoWOOj91sx/Cr8aLpyk7wQgshQsl47qD5
         DDQ3LwVL21a4dH9estmqXSwbndPxf8v0mazGmlGfyz6bcjDC0xeBA99l5E7Leow98icc
         9esKuQ+fQBXQGnIP33+RiWLexoVK3fLiIJ+d/yk9I/EkjAbSsLAqSMA1Fd80dDdI03qL
         vT4dUpTQ3kXvPJcJCjMacKdnHeR6B5sXp1SLxPyHvaS54QMccG7ThYMjeHoKSHuJXlk7
         +c0CVtGG0DrDQx6xBcwWIIBKKSsx5k/OZFldtY7O6OJrIMV2dOSIGsZWGClasgLCU1mu
         0yEA==
X-Gm-Message-State: AOAM532j8zAbx3gGfBWknbd9VArCWr3Q6/2oUfLNX2TPLG5nhIWXZ/Zq
        7VkHJefe1H6/tgSAkt3rw0oD9ZFUqx3H/0b353fVyw==
X-Google-Smtp-Source: ABdhPJxm7DLYXbMomK9YWiWLSTVUPaRI+VJJ5tgZdr7+a3a21THR3UvntEHG9wp+X9qffZpaoq6YN7wXRbLEutw3IRc=
X-Received: by 2002:aca:4b82:: with SMTP id y124mr1676328oia.35.1604471847796;
 Tue, 03 Nov 2020 22:37:27 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com> <d0627c5b-1007-bca0-e6d6-0a3740eaf6a7@gmail.com>
 <CANXhq0pgeDZkWgwmZE+sFPjYhAmNBNoYGPRfij+Yz_Pc8hNN-Q@mail.gmail.com>
In-Reply-To: <CANXhq0pgeDZkWgwmZE+sFPjYhAmNBNoYGPRfij+Yz_Pc8hNN-Q@mail.gmail.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Wed, 4 Nov 2020 14:37:16 +0800
Message-ID: <CANXhq0p2txQE4-hCu0kGNQ4gX6t-RMjAyk4Jx5eZVVLbFKrPyg@mail.gmail.com>
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

On Fri, Oct 16, 2020 at 10:56 PM Zong Li <zong.li@sifive.com> wrote:
>
> On Fri, Oct 16, 2020 at 10:17 PM Sean Anderson <seanga2@gmail.com> wrote:
> >
> > On 10/16/20 5:18 AM, Zong Li wrote:
> > > Add a driver for the SiFive FU740 PRCI IP block, which handles more
> > > clocks than FU540. These patches also refactor the original
> > > implementation by spliting the dependent-code of fu540 and fu740
> > > respectively.
> > >
> > > Zong Li (4):
> > >   clk: sifive: Extract prci core to common base
> >
> > I don't see this patch, and it isn't listed on the web archive. Was it
> > not CC'd to this list?
> >
> >         --Sean
> >
>
> There is a problem on linux-riscv mailing list for the first one
> patch, the size of it is too big, it needs to be approved and posted
> on the list by moderator.
>
> This patch set is also sent to clk mailing list, and I can see it on that:
> https://patchwork.kernel.org/project/linux-clk/patch/b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com/
>
>
>
>
> > >   clk: sifive: Use common name for prci configuration
> > >   clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
> > >   clk: sifive: Refactor __prci_clock array by using macro
> > >
> > >  arch/riscv/Kconfig.socs                       |   2 +-
> > >  drivers/clk/sifive/Kconfig                    |   8 +-
> > >  drivers/clk/sifive/Makefile                   |   5 +-
> > >  drivers/clk/sifive/fu540-prci.c               | 618 +-----------------
> > >  drivers/clk/sifive/fu540-prci.h               |  21 +
> > >  drivers/clk/sifive/fu740-prci.c               | 102 +++
> > >  drivers/clk/sifive/fu740-prci.h               |  21 +
> > >  drivers/clk/sifive/sifive-prci.c              | 529 +++++++++++++++
> > >  drivers/clk/sifive/sifive-prci.h              | 297 +++++++++
> > >  include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
> > >  10 files changed, 1032 insertions(+), 594 deletions(-)
> > >  create mode 100644 drivers/clk/sifive/fu540-prci.h
> > >  create mode 100644 drivers/clk/sifive/fu740-prci.c
> > >  create mode 100644 drivers/clk/sifive/fu740-prci.h
> > >  create mode 100644 drivers/clk/sifive/sifive-prci.c
> > >  create mode 100644 drivers/clk/sifive/sifive-prci.h
> > >  create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h
> > >
> >

ping
