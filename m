Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76382C433E6
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 238C064F08
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235039AbhBXOhM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:37:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234723AbhBXOLk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Feb 2021 09:11:40 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5234BC061786;
        Wed, 24 Feb 2021 06:11:00 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id i8so2098609iog.7;
        Wed, 24 Feb 2021 06:11:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=i6v8HuEMEflSgVIW79gElwSlCrhe13NGKf2qOXVqqNA=;
        b=oihNi3t/Fl1LPaXWmbvEF2yZI+1OwQGzgmGacIE6mnQlNvVXBcr6hlMG9YM3OzM8HQ
         3f5nGmza96UwTJSkKfL1XiNpv5IAp1rPmVvK+3BSTnLoGfwrsvZeRloH5+1X+dtt+01z
         pDEa5oT9meW7Tq3mo7Vc/JyjODb+xe4uC6atbdPBCLQwsa9blLsq+QkUVvXJu6/7BJki
         BoOlF3QxZDvlwqNO/aTULCqywb/UpalQzBR9Oki0LKDvx5sE8o4kAE4S3esRDMEO+Fah
         9k6O4KcYBmAE7Qij9QsmfjsirJYLXdMaIVuxGz0zwoDBoOGKBK9zUzWkkJp2eqk951tv
         5qoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=i6v8HuEMEflSgVIW79gElwSlCrhe13NGKf2qOXVqqNA=;
        b=F1Pdpv6V5kQIEPR/OxOk8+Tx1yhQ0KFc4M0tL6tWLVORuAWphtTWl7pudD2jCH1DBP
         MN13P49lMNKvrY28UEqb1fZYrGmOO+VP/XEp5Q9ThBWtEMbhKaUjlTIILJ3SW2DZcUiU
         jy9HCrOKlNSitQOIpFekhKJcbLlXzT4YAMeRbq6DeuB3P8b+/tXImh33TYj3Udvv066K
         EyBmfiOXEY+mjcztpZqoTupdl23H8Iz8ZlT64L0zEEq3AtNBvhUsD7jZWVINxncVio96
         C/Eil8+rG7zqdaV1bttFnfQ/ctiDoP3L9ptHVid1nx3lPu11oq8DULES1f9vzvhArmnl
         eoFw==
X-Gm-Message-State: AOAM531GD2GlpF7MIE1OAUlKzUqKdlY0FgBb+u9XVDNYJCFBoE+2pZC2
        LBiG6tlJyPU13OQNPfGme2FYfeSEibBkm9e1bjV2Fune
X-Google-Smtp-Source: ABdhPJyxXqTjN7CHY4+vHVifMsGv0x2J4blcN/0e4/e8IgR1bVvT6F83zJczOuFkwUZrl9bRvi+dSDhBUILUXlbyX4M=
X-Received: by 2002:a05:6638:5:: with SMTP id z5mr33899755jao.108.1614175858375;
 Wed, 24 Feb 2021 06:10:58 -0800 (PST)
MIME-Version: 1.0
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1613623791-4598-4-git-send-email-shubhrajyoti.datta@xilinx.com> <20210218092936.44108d1d@xps13>
In-Reply-To: <20210218092936.44108d1d@xps13>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 24 Feb 2021 19:40:46 +0530
Message-ID: <CAKfKVtG=9fZHYzw0htu1xPj3k4U6JLqGNE3u6yScuWrAKHRp0Q@mail.gmail.com>
Subject: Re: [PATCH v9 3/7] clk: clock-wizard: Fix kernel-doc warning
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

On Thu, Feb 18, 2021 at 1:59 PM Miquel Raynal <miquel.raynal@bootlin.com> w=
rote:
>
> Hi Shubhrajyoti,
>
> Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
> 2021 10:19:47 +0530:
>
> > Update description for the clocking wizard structure
>
> "Fix the clocking wizard main structure kernel documentation." ?
will update in next version.

>
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > ---
> >  drivers/clk/clk-xlnx-clock-wizard.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx=
-clock-wizard.c
> > index 1bab68e..fb2d555 100644
> > --- a/drivers/clk/clk-xlnx-clock-wizard.c
> > +++ b/drivers/clk/clk-xlnx-clock-wizard.c
> > @@ -40,7 +40,8 @@ enum clk_wzrd_int_clks {
> >  };
> >
> >  /**
> > - * struct clk_wzrd:
> > + * struct clk_wzrd - Clock wizard private data structure
> > + *
> >   * @clk_data:                Clock data
> >   * @nb:                      Notifier block
> >   * @base:            Memory base
>
>
> Thanks,
> Miqu=C3=A8l
