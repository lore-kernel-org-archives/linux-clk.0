Return-Path: <SRS0=dIxE=EL=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5828DC4741F
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 07:22:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ED4C72087D
	for <linux-clk@archiver.kernel.org>; Thu,  5 Nov 2020 07:22:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="iqd4cqha"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbgKEHW1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Nov 2020 02:22:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725320AbgKEHWZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Nov 2020 02:22:25 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC932C0613CF
        for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2020 23:22:24 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id t143so705184oif.10
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2020 23:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WSZ3+zLaojBm8Llmv8mdwwh1sKAbO9V1JJ7VIGY5YaM=;
        b=iqd4cqhaOURh+RJCIK7wwSnQuhnxujTo2ztBt+aVcxykRvNrG9uuBde3XzAhI2pjP9
         OOE6bjCaG65Qow41L4PK7cMY5hA3m5pLHsAATuQziti/UZ0+bTHycJBzTs1WKnnc8giT
         tkB9OA/hvZS1dUUOu23LMJteVg7jYwg6J+RJ2kp/63ti20sl0YrPLjk0haMozMXNKVmb
         64oS4WIeHb6RrS6tGBtkbjyiyJUWaKycGNBbqPgg/xgAza+dbfnEvHcJaDQsqkpGWLLs
         6VgB5i9La8YVUm0i1paX5ZOAA2//pHVk34C21OIjBlBwfU8aA2aZhgSn9VPAQ3NkOpXw
         LyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WSZ3+zLaojBm8Llmv8mdwwh1sKAbO9V1JJ7VIGY5YaM=;
        b=O6sg3vLcWjtoPNM2n+EBXxCH92xArG7yC82UX/0zjtbytD+O5Y3ejxz9p/VKg2vxNl
         EwT8zAbo9vdNQOxbhSzNED6nCmLVNsiYiBqTAMDoLrHB9hm2V6MKjtNHQbQBrSMeMN1o
         j+c05cPrIViati4pXmHCzQ6aSJvZ7d7kGxau6zbXvAYYG5aUBdQBpevSp/cFl6sIZgnx
         PWo0eWe+Y4mswimagjyDL355ovIGl3yn07u/YmMsFTAtB+cifN4Xr1/FJsvQPqYUS7lK
         LTJ4MFgBfO29eNcNOeXmH6nSzWopG0i3p3CfoM6Rr9Ui7ocO7kmd3tqkfnUr1C7UlCZi
         DAEg==
X-Gm-Message-State: AOAM533s1Car3hMcBLhU1QesEHZkjZi4k2B0wbgajkD734xOodr1tGV3
        8iXtFIDtQ5eaf4RaVU5eOyEz4PHCQWqFgHyvm2EG4g==
X-Google-Smtp-Source: ABdhPJy0F5JCc98tp7QNjA610x1Eqz7f1L3ylLULpbwz+DrTYw2meMBgEMIwHINr6f0EPsTptlEuoAYI6lV5pfkWL5c=
X-Received: by 2002:aca:4b82:: with SMTP id y124mr750400oia.35.1604560943669;
 Wed, 04 Nov 2020 23:22:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1602838910.git.zong.li@sifive.com> <b10784643665ad56ca41ea6754c7f28f8be1c7ca.1602838910.git.zong.li@sifive.com>
 <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
In-Reply-To: <160454434294.3965362.6100009498384462585@swboyd.mtv.corp.google.com>
From:   Zong Li <zong.li@sifive.com>
Date:   Thu, 5 Nov 2020 15:22:10 +0800
Message-ID: <CANXhq0qpEXejD765A5S5KfbuYQc=in5sFdEmk5K=BzZy2L=nmQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: sifive: Extract prci core to common base
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org,
        "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Yash Shah <yash.shah@sifive.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Nov 5, 2020 at 10:45 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Zong Li (2020-10-16 02:18:23)
> > Extract common core of prci driver to an independent file, it could
> > allow other chips to reuse it. Separate SoCs-dependent code 'fu540'
> > from prci core, then we can easily add 'fu740' later.
>
> Please indicate if there are any functional changes or this is just code
> movement.

There are some changes for common use, not just code movement or
copies, I would figure out the changes in the commit message  in the
next version.

>
> >
> > Signed-off-by: Zong Li <zong.li@sifive.com>
> > ---
> >  drivers/clk/sifive/Makefile      |   2 +
> >  drivers/clk/sifive/fu540-prci.c  | 586 +------------------------------
> >  drivers/clk/sifive/fu540-prci.h  |  21 ++
> >  drivers/clk/sifive/sifive-prci.c | 409 +++++++++++++++++++++
> >  drivers/clk/sifive/sifive-prci.h | 201 +++++++++++
>
> How much of this is a copy/pastes? Can you generate patches with
> format-patch -M -C to try to find copies and renames?

I tried to add -M and -C option to find renames and copies, but it
doesn't detect anything here.

>
> >  5 files changed, 652 insertions(+), 567 deletions(-)
> >  create mode 100644 drivers/clk/sifive/fu540-prci.h
> >  create mode 100644 drivers/clk/sifive/sifive-prci.c
> >  create mode 100644 drivers/clk/sifive/sifive-prci.h
> >
