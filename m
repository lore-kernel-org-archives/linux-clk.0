Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC075C43381
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7AA0F64F0F
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235398AbhBXOh0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:37:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235259AbhBXONM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Feb 2021 09:13:12 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0753C06178A;
        Wed, 24 Feb 2021 06:12:03 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id i18so1784435ilq.13;
        Wed, 24 Feb 2021 06:12:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=swN82XLnjpt5P5hzyMkcuM7ZVNfF/SgBiyG0AuD8DK8=;
        b=ejB3EFuC3cj/v9LxIsV6Efby7+ayhEO7Fu/uj3thZgkDAVaK1n0hlOLyCUaWB4nrmT
         Leh067zly2wifhayhVOP+zHKCWKRKgN0lDEyINlHtiZEZISuDs75DW30unDRHJwyuBX5
         OuFx2LWVmMK0NGk+AMblm2MZSgZ0SHiSl4qw/VpeTj7mQrxevAPmtKjo8fowzO2VMsO+
         YWx02zXnYPDY6kN/vBt1VkmfLRqrWChH4QFFE7yFty1KRiFnEdSaiv9FpcQyVLan7npy
         pHqY2URFDaDfheUP8u/eCu498mGU30DcUtmh4ItBFfzqgR6QTcux8fbcRMPRKkFwzRmF
         UDug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=swN82XLnjpt5P5hzyMkcuM7ZVNfF/SgBiyG0AuD8DK8=;
        b=Jphdc6bHyfW/9pndeEaZrGQzDzjta2JcDAj34I62xJe3dpvIHfQMjrg1TARuiRYjk7
         E4YUXk6nR7teHuAiC8VN4sy9aNNTbv4sukyG0Dsj3pf1of28fQhRll7hRDFiJ0JvVBYp
         YYR24A50oJSdJkQqT37PTlnlvOAxU19acbtM8+x73vtNPMCg5mCKb/gInvCfQCMjZN0W
         tlF2DJlCzaeYf5rr/Xhy0bfZgnV9X8kpwObDFb7FUP1tc8lQ3ifjjMcPqqH5F6y4uJ9r
         Tf4SMoDpT69D74VsOpOo7a++lJdX3Qgrpn9daMZA5CDqL56YOWxHnyrPeRTtpm75CY4o
         sGPQ==
X-Gm-Message-State: AOAM532nm4BYxzdmyFV58GBeR9JraJeOmaQG3XtIWmQV5Tr55V/QKb+a
        cVp9EPe20Os6orkfo+RexNAJX4UyQuWVRM0iSDKKoSuM
X-Google-Smtp-Source: ABdhPJzl053EPbx5hxcCBrXj1eUUKf+beJntVugSHPkQUxZPNisOE3b4WkiRkMQQDPmaZ7wotcuBeZ6kK2r4+0v16iA=
X-Received: by 2002:a05:6e02:20ee:: with SMTP id q14mr22753717ilv.259.1614175923366;
 Wed, 24 Feb 2021 06:12:03 -0800 (PST)
MIME-Version: 1.0
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com> <20210218092440.7ddeb617@xps13>
In-Reply-To: <20210218092440.7ddeb617@xps13>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 24 Feb 2021 19:41:52 +0530
Message-ID: <CAKfKVtFFyR-tyRx5tvKAPfX_Zy_QN8+7PXrEe+LJR7+LikLx5g@mail.gmail.com>
Subject: Re: [PATCH v9 0/7] clk: clk-wizard: clock-wizard: Driver updates
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Feb 18, 2021 at 1:54 PM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Shubhrajyoti,
>
> Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
> 2021 10:19:44 +0530:
>
> > In the thread [1] Greg suggested that we move the driver
> > to the clk from the staging.
> > Add patches to address the concerns regarding the fractional and
> > set rate support in the TODO.
> >
> > The patch set does the following
> > - Trivial fixes for kernel doc.
> > - Move the driver to the clk folder
> > - Add capability to set rate.
> > - Add fractional support.
> > - Add support for configurable outputs.
> > - Make the output names unique so that multiple instances
> > do not crib.
>
> I think we prefer to move "clean" drivers out of the staging tree
> rather than "to be fixed" code. So I would invert the order of the
> patches in this series to make more sense:
> * 3/7-7/7 (various fixes/improvements)
> * 1/7 (bindings)
> * 2/7 (move to clk)
>
Will update in next version

> > Shubhrajyoti Datta (7):
> >   dt-bindings: add documentation of xilinx clocking wizard
> >   clk: clock-wizard: Add the clockwizard to clk directory
> >   clk: clock-wizard: Fix kernel-doc warning
> >   clk: clock-wizard: Add support for dynamic reconfiguration
> >   clk: clock-wizard: Add support for fractional support
> >   clk: clock-wizard: Remove the hardcoding of the clock outputs
> >   clk: clock-wizard: Update the fixed factor divisors
> >
> >  .../bindings/clock/xlnx,clocking-wizard.yaml       |  65 ++
> >  drivers/clk/Kconfig                                |   9 +
> >  drivers/clk/Makefile                               |   1 +
> >  drivers/clk/clk-xlnx-clock-wizard.c                | 689 +++++++++++++=
++++++++
> >  drivers/staging/Kconfig                            |   2 -
> >  drivers/staging/Makefile                           |   1 -
> >  drivers/staging/clocking-wizard/Kconfig            |  10 -
> >  drivers/staging/clocking-wizard/Makefile           |   2 -
> >  drivers/staging/clocking-wizard/TODO               |  12 -
> >  .../clocking-wizard/clk-xlnx-clock-wizard.c        | 333 ----------
> >  drivers/staging/clocking-wizard/dt-binding.txt     |  30 -
> >  11 files changed, 764 insertions(+), 390 deletions(-)
> >  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocki=
ng-wizard.yaml
> >  create mode 100644 drivers/clk/clk-xlnx-clock-wizard.c
> >  delete mode 100644 drivers/staging/clocking-wizard/Kconfig
> >  delete mode 100644 drivers/staging/clocking-wizard/Makefile
> >  delete mode 100644 drivers/staging/clocking-wizard/TODO
> >  delete mode 100644 drivers/staging/clocking-wizard/clk-xlnx-clock-wiza=
rd.c
> >  delete mode 100644 drivers/staging/clocking-wizard/dt-binding.txt
> >
>
> Thanks,
> Miqu=C3=A8l
