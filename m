Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8FE7C433E0
	for <linux-clk@archiver.kernel.org>; Mon, 22 Feb 2021 06:48:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6466064EC3
	for <linux-clk@archiver.kernel.org>; Mon, 22 Feb 2021 06:48:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhBVGsT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 22 Feb 2021 01:48:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229780AbhBVGsS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 22 Feb 2021 01:48:18 -0500
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com [IPv6:2607:f8b0:4864:20::d31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 583F3C061786;
        Sun, 21 Feb 2021 22:47:38 -0800 (PST)
Received: by mail-io1-xd31.google.com with SMTP id f20so12113606ioo.10;
        Sun, 21 Feb 2021 22:47:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CzbwqBo7/54EtEOzwje3BHhr7xtEcrRjjyrnOowJ3RA=;
        b=tZoM/ei03nNFQkhXPVPvquxs1T2YkAgjONYNooJYzDxSnoZqlnZoIUckliO56T/N0k
         l8mInoPyoBFCdb5bdj2k3U9uVOBmCaOkBpZVZ8Mvx6i/j3zbxNhRzbbXd6yqFf9y+6xr
         cwyD5aJhp9gxGob/g+RRmDDiIW+ZJ42u85L40NLxiFuS95YPZAYtSYb/ZJui+H/hjoUM
         b7s1IRQn65x3MrublhdQI8DfAaohCWeMFwn0Ee5WHCNQGxsP4C14chRN52dEXqckWuCV
         pcDl5z3GIcjorydEjOKOGc9K2KzSQE0lnut5KLvdUyuCRO+aFj5qhPQ3TA4TUWB7Fy0S
         vHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CzbwqBo7/54EtEOzwje3BHhr7xtEcrRjjyrnOowJ3RA=;
        b=VzGF1P90KS0x21cSA8SV0hXID9zgIJRKpQVlSRCwBHjEUcEhGfQzpqyp0V7vkrIoQu
         Ln/esvopcpIgrf4Hcfc9qCpFYgwCTozR9O8VUgkcOuYMZHM1kCBGF3TMHASCLHi4ssp7
         oPMqmwMMhBoLtMJ2h6XPjnYdoWgV1sqMDFbTnC3QolKyVvsgaqZiqwCiBlPoY0YplyQn
         BX5NfsKLdpmROq4Al/fwIiTETT/Ztu2w5O1jXHGOyw8w0GAsPqkDx5tGKPwz8nn20ZmV
         cRTkzOqVOUjxIgyWOLfLLpUjY9M7cdkYEnr73DT241M+vr+keMiKiyqHbwMQANdQVSQ8
         zhDw==
X-Gm-Message-State: AOAM531M0T92nilIGI5xnuJOgvjXjGZrgOr6a4JNj3eG8PhIkzXgwXoY
        9KE9edFPzvM2Z+5ycUjtiZcv0eMKhhykbzLhkKz/Hl9S
X-Google-Smtp-Source: ABdhPJxYz88oi9/UfUiw4DjF5LrZyBs4jxg6vz1nOlTfxssQ6ydATcxoSxhI75o3Nxa+X9Vql47SZFLy9ytTVhiR6xw=
X-Received: by 2002:a5e:980a:: with SMTP id s10mr14511315ioj.101.1613976457881;
 Sun, 21 Feb 2021 22:47:37 -0800 (PST)
MIME-Version: 1.0
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1613623791-4598-7-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20210218093715.7fdc27ee@xps13> <161369795774.1254594.6203789110347055936@swboyd.mtv.corp.google.com>
In-Reply-To: <161369795774.1254594.6203789110347055936@swboyd.mtv.corp.google.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Mon, 22 Feb 2021 12:17:26 +0530
Message-ID: <CAKfKVtHVRT-8-yCwAt8+8RkS5Mi7v2RHSFg8wMNw75VkmUa+tQ@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] clk: clock-wizard: Remove the hardcoding of the
 clock outputs
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Fri, Feb 19, 2021 at 6:55 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Miquel Raynal (2021-02-18 00:37:15)
> > Hi Shubhrajyoti,
> >
> > Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
> > 2021 10:19:50 +0530:
> >
> > > The number of output clocks are configurable in the hardware.
> > > Currently the driver registers the maximum number of outputs.
> > > Fix the same by registering only the outputs that are there.
> > >
> > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > > ---
> > > v4:
> > > Assign output in this patch
> > >
> > >  drivers/clk/clk-xlnx-clock-wizard.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
> > > index ed3b0ef..d403a74 100644
> > > --- a/drivers/clk/clk-xlnx-clock-wizard.c
> > > +++ b/drivers/clk/clk-xlnx-clock-wizard.c
> > > @@ -473,6 +473,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
> > >       unsigned long rate;
> > >       const char *clk_name;
> > >       struct clk_wzrd *clk_wzrd;
> > > +     int outputs;
> > >       struct device_node *np = pdev->dev.of_node;
> > >
> > >       clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
> > > @@ -541,6 +542,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
> > >               goto err_disable_clk;
> > >       }
> > >
> > > +     outputs = of_property_count_strings(np, "clock-output-names");
> >
> > A check on outputs validity is probably welcome.
> >
> > Also I usually prefer noutputs or nb_outputs for such variable name,
> > which implies a number rather than an array, but this is personal taste.
>
> Ideally we get rid of clock-output-names and generate them at runtime
> instead based on some combination of device name and something else.

Makes sense. However it may break the current binding.
Do you think that shoud be okay?
