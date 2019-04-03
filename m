Return-Path: <SRS0=fESv=SF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D473C4360F
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 15:36:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5E44F206DD
	for <linux-clk@archiver.kernel.org>; Wed,  3 Apr 2019 15:36:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l/7LyQ3o"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbfDCPg0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Apr 2019 11:36:26 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:40075 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726084AbfDCPg0 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Apr 2019 11:36:26 -0400
Received: by mail-pl1-f195.google.com with SMTP id b3so5246327plr.7;
        Wed, 03 Apr 2019 08:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=8DdJjypyavUkEu4P/k1Apa1umGD2ecBWvbSudLGQeGQ=;
        b=l/7LyQ3oULlUtDNc7HKVmHmJSuyuGnvh9sOig2p5tkukMeufWOapBFFzL0PaplIA+5
         r6dBsx1QL8Fy5nm9/HcwyL9VlxUYRrc7+xUKXR20r26C77+GyUDQDrDu95vOWS8TLuaN
         /BEXhEEeZFXp1qq4necxl0Gd7p71C6JfwHvYEbaMabur8y1PjBzlCA0AF/1+kj10Q3B5
         ti14s96ZLvGm14p5Dq1GuUIWcbUno9ctMxHaVN+CA4/jlJAhBvgMMDTg35hxnss5n21P
         L10uSLfoSGyf3qassQ9MvYWPkiMPUWQIaXzdretjAW2udFaxOeWc6teSgXYSZlMGpGxE
         n0FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=8DdJjypyavUkEu4P/k1Apa1umGD2ecBWvbSudLGQeGQ=;
        b=WWdQPOjB0eodoWsrzD2PH0pYtwLjNX8tYbqC64S3uKQGyVw2neT2rE29ZLQnNKAtYX
         E5GMv/qMEihXoF1t4x9iTl1U5SjXRbp/jmZUMH1mG94zX7Kw2fwKQV9aX3hDXl7TOntR
         YgJGSArBqa+V58uRnpXurtlO4K05pxMsa5HVEHhI/pB2N6MlSr0rWe9siSTDuEGbl6d8
         4FuFcZQM2mU0Mu662G2/V22zyrk4ugnPtLDV1wyJGvTqBSWrYrWJF5bDGjIeP5Dl1X5G
         fjApD80rPJcEE4flcYj07vGpgDBVmvB0y28Ed2s6Ph7WKZDVWg1+EEXua1hWU+AKoyVj
         kvcg==
X-Gm-Message-State: APjAAAUlD300+0l4OarZEaAxfqi/oHcTKku+0fWk8OgpPmlwB/gsQXI5
        CiuePRbucg4gmNWDt3KBbywcZbl9a2NuvYgW7fs=
X-Google-Smtp-Source: APXvYqxaw9B1welUzrVVE7EWxduxZYpsCbOQgjGVLpOeHe8c/rY+QT+G8DzFzVW61VBw/krs2NKByHxgn2t7f8OF9jM=
X-Received: by 2002:a17:902:2963:: with SMTP id g90mr604978plb.182.1554305785695;
 Wed, 03 Apr 2019 08:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190328124939.23139-1-dave.mueller@gmx.ch> <20190403140857.1130-1-dave.mueller@gmx.ch>
 <ed8c07ff-5719-9179-424c-13b0891605f7@redhat.com>
In-Reply-To: <ed8c07ff-5719-9179-424c-13b0891605f7@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Apr 2019 18:36:14 +0300
Message-ID: <CAHp75VdT_4e1F51YfRVtmPBmT+ZbwvjVGJAY5uhC=QMKxyANPQ@mail.gmail.com>
Subject: Re: [PATCH v2] clk: x86: Add system specific quirk to mark clocks as critical
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     =?UTF-8?Q?David_M=C3=BCller?= <dave.mueller@gmx.ch>,
        linux-clk <linux-clk@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 3, 2019 at 6:31 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 03-04-19 16:08, David M=C3=BCller wrote:

> >       clk_data->base =3D pmc_regmap; /* offset is added by client */
> >       clk_data->clks =3D pmc_data->clks;
> > +     if (d) {
> > +             clk_data->chk_critclks =3D true;
> > +             pr_info("%s critclks quirk enabled\n", d->ident);
> > +     }
> >
> >       clkdev =3D platform_device_register_data(&pdev->dev, "clk-pmc-ato=
m",
> >                                              PLATFORM_DEVID_NONE,
>
> Normally I would be fine with your choice to use dmi_first_match(), but s=
ince
> you need to respin anyway, can you change this to:
>
>         if (dmi_check_system(critclk_systems)) {
>                 clk_data->chk_critclks =3D true;
>                 pr_info("%s critclks quirk enabled\n", d->ident);
>         }
>
> That will allow you to drop the 'd' variable declaration all together and=
 is
> somewhat cleaner IMHO.

pr_info() relies on it AFAICS.

If needed we may switch to ->callback() instead, but it would take more lin=
es.
--
With Best Regards,
Andy Shevchenko
