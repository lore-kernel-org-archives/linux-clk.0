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
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA8CDC433E6
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:37:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BF9264EDD
	for <linux-clk@archiver.kernel.org>; Wed, 24 Feb 2021 14:37:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236074AbhBXOgj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Feb 2021 09:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233674AbhBXOJb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Feb 2021 09:09:31 -0500
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81810C061574;
        Wed, 24 Feb 2021 06:08:46 -0800 (PST)
Received: by mail-il1-x130.google.com with SMTP id k2so1811958ili.4;
        Wed, 24 Feb 2021 06:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jNaEKn9zeLo3x8GDDbdt2CN0E33ynjcZ7g3+diTTT+4=;
        b=VuTTJPwsYv2FPYRCUbQnVScmdCqugayLZPd93PigzcEsIHLcdvNijcXCTNJ5j3pBj3
         xE+mC/dwivlsZKtG4f/DrcIiK9zliW2LgZCsIjBcu7iBNuPPnnycMNJMEV4NsAw6K8GB
         /e3gS30CXg6nD+BEWNJozU87aB5Zz5aOejOwTZXCFU3x3QjwT4F5LEiLdcmNIX7pL74A
         i5/phUejfMZu02h8sRpp746fL9o8QANOQlgtiRksRe4/5L7aaT9x09UueoWmitvW5vqm
         UB4aA9aZ/Gg2ktVwdcJljSkGiws1i7/iaXjQjhQ7UvER8AwEinG18VAEEU1JONfKbdvb
         rcXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jNaEKn9zeLo3x8GDDbdt2CN0E33ynjcZ7g3+diTTT+4=;
        b=oN9+XdgKYuOiny7QE3DL37QgIfRLKjKrLaIYsbHUB5N6rP9WKGVBrk7v3muCJ7tyCJ
         6LRMbsdsqNZMuu7fmLqMAQ9D6YyqmeQZcLBlPAnYzLJcPg1CMpzRjO3H5uwFFE+nU/nb
         rx345iAdVZj3uHYHGdgC5Y38kr2Ex2hCJ2jJdErzBn2tKg40SYEP75DTzY/kcggPZNNi
         IWZjM3oYSPpyrfbVBbiXHJXFiVBiBNTD9Y0T+LCVg/gocTq9cPcM5wmlGRyLpQffaKTC
         nW/izx1bQQHLed+YjjW5GKDZBrDmWJTYEKlxF61R0Ro9zsza584lNiEbeGNz4jQyVKru
         yoCA==
X-Gm-Message-State: AOAM531hvqXc07bMmx75Q8vaxvM2OCBBkaECsdE6/YKqPJYz0w+ygN8r
        /20834lgtOV+qRqxcofo/EZiDCMG/bwWV1i6Tvg=
X-Google-Smtp-Source: ABdhPJwn0YlLrAmBf+AXSs7ioPhYEib1AVHCtQRw8npWuIIoXLXJjyO9S47XAfYQ0+TJt7Bvpv7frUDgpm2y9hIHyuE=
X-Received: by 2002:a05:6e02:20ee:: with SMTP id q14mr22741071ilv.259.1614175725835;
 Wed, 24 Feb 2021 06:08:45 -0800 (PST)
MIME-Version: 1.0
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com>
 <1613623791-4598-7-git-send-email-shubhrajyoti.datta@xilinx.com>
 <20210218093715.7fdc27ee@xps13> <161369795774.1254594.6203789110347055936@swboyd.mtv.corp.google.com>
 <CAKfKVtHVRT-8-yCwAt8+8RkS5Mi7v2RHSFg8wMNw75VkmUa+tQ@mail.gmail.com> <161404211975.1254594.9689445473737784408@swboyd.mtv.corp.google.com>
In-Reply-To: <161404211975.1254594.9689445473737784408@swboyd.mtv.corp.google.com>
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Wed, 24 Feb 2021 19:38:34 +0530
Message-ID: <CAKfKVtFzerZBSM1XkdPxdv8HR-w7vod11Mew-06pFBfJSc6AsA@mail.gmail.com>
Subject: Re: [PATCH v9 6/7] clk: clock-wizard: Remove the hardcoding of the
 clock outputs
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        linux-clk@vger.kernel.org,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Mike Turquette <mturquette@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 23, 2021 at 6:32 AM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Shubhrajyoti Datta (2021-02-21 22:47:26)
> > Hi Stephen,
> >
> > On Fri, Feb 19, 2021 at 6:55 AM Stephen Boyd <sboyd@kernel.org> wrote:
> > >
> > > Quoting Miquel Raynal (2021-02-18 00:37:15)
> > > > Hi Shubhrajyoti,
> > > >
> > > > Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com> wrote on Thu, 18 Feb
> > > > 2021 10:19:50 +0530:
> > > >
> > > > > The number of output clocks are configurable in the hardware.
> > > > > Currently the driver registers the maximum number of outputs.
> > > > > Fix the same by registering only the outputs that are there.
> > > > >
> > > > > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> > > > > ---
> > > > > v4:
> > > > > Assign output in this patch
> > > > >
> > > > >  drivers/clk/clk-xlnx-clock-wizard.c | 6 ++++--
> > > > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > > > >
> > > > > diff --git a/drivers/clk/clk-xlnx-clock-wizard.c b/drivers/clk/clk-xlnx-clock-wizard.c
> > > > > index ed3b0ef..d403a74 100644
> > > > > --- a/drivers/clk/clk-xlnx-clock-wizard.c
> > > > > +++ b/drivers/clk/clk-xlnx-clock-wizard.c
> > > > > @@ -473,6 +473,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
> > > > >       unsigned long rate;
> > > > >       const char *clk_name;
> > > > >       struct clk_wzrd *clk_wzrd;
> > > > > +     int outputs;
> > > > >       struct device_node *np = pdev->dev.of_node;
> > > > >
> > > > >       clk_wzrd = devm_kzalloc(&pdev->dev, sizeof(*clk_wzrd), GFP_KERNEL);
> > > > > @@ -541,6 +542,7 @@ static int clk_wzrd_probe(struct platform_device *pdev)
> > > > >               goto err_disable_clk;
> > > > >       }
> > > > >
> > > > > +     outputs = of_property_count_strings(np, "clock-output-names");
> > > >
> > > > A check on outputs validity is probably welcome.
> > > >
> > > > Also I usually prefer noutputs or nb_outputs for such variable name,
> > > > which implies a number rather than an array, but this is personal taste.
> > >
> > > Ideally we get rid of clock-output-names and generate them at runtime
> > > instead based on some combination of device name and something else.
> >
> > Makes sense. However it may break the current binding.
> > Do you think that shoud be okay?
>
> I think it is OK given that the current binding is for the staging tree.
> The assumption is those bindings aren't stable.
Updated it in next version.
