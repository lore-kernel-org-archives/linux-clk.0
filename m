Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0FCEC43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 17:37:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 98D60216FE
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 17:37:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="KjLG+UpD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98D60216FE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727522AbeI0X4X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 19:56:23 -0400
Received: from mail-it1-f196.google.com ([209.85.166.196]:50879 "EHLO
        mail-it1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728255AbeI0X4X (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 19:56:23 -0400
Received: by mail-it1-f196.google.com with SMTP id j81-v6so8939726ite.0
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 10:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=obtE2YEIwUU4EGWgNtv90np7kXoKjqfs5aq6vD3BoWY=;
        b=KjLG+UpDjsD1mwWz8NLAIV/YViJdTKpAyaYPjshM8EGwln/MwG8DtOeNJ7RJ+OcfhD
         SbMNQbwpZbMqptDcaVZ5ZzUocRAThsEVuQo9s5oiJNOy84Y0JWyS7CDaOzmWa1eKLorY
         S5MFNH3v0fSM4wiAzRXGKesMUUKoAdu3jODqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=obtE2YEIwUU4EGWgNtv90np7kXoKjqfs5aq6vD3BoWY=;
        b=jMAx57q2L0FtQqdwd3eLFV1NqdaFuTCO9tkv9q99iWGv9z9XjQY//DpJlxcF9LVttQ
         0S4cAHsA6jvEDS5KN3Ahlak+kb+37CBpqGLI8sIEwIIg71W0Zfh0PlVh0QfL6kC6JzPq
         B+if8Czensz1MzPhC/lFxLrls7nk10pxbTm8RLGvdT5J/ZqdRQ8vfygbX8ER8hKHsHLQ
         QXDnDCkNP0a2pGPCSAUFF7Bvfun3s4OlUIv+Mu0XdGZaBcwG3R4MVfkY/A9o+weWz5nz
         IjjvaXM+NUbMrAz5RdofHh7Qqsr0RhGptIi+qAmJU+zzd8p16OPIdihZZG8dNlZpywko
         ZgGA==
X-Gm-Message-State: ABuFfojEEURdfS7V8WHu41rU+zS1ibb+z71jC1uwgiz5FMBTwKsAeKDn
        LP9/oTLPRUj0bM1dJpHcV97h0FEPlkD4H9eNzqlLNA==
X-Google-Smtp-Source: ACcGV61KG3VBOr8sKz4CquBgRRpo/FHW4UwpUDXNbQn1eVm7EpWZI558TIGghRsl5tUdmsl7XTeM9Uj7fyexm2mmsqk=
X-Received: by 2002:a24:8083:: with SMTP id g125-v6mr10403373itd.2.1538069821754;
 Thu, 27 Sep 2018 10:37:01 -0700 (PDT)
MIME-Version: 1.0
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-6-jagan@amarulasolutions.com> <20180927171831.2nfybgn2xmc4vrgt@flea>
In-Reply-To: <20180927171831.2nfybgn2xmc4vrgt@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 27 Sep 2018 23:06:50 +0530
Message-ID:
 <CAMty3ZCD4ArjhPJYxv3ztWXdnby8YXQ73QqoVNoHFBc-DAxx_w@mail.gmail.com>
Subject: Re: [PATCH 05/12] drm/sun4i: sun6i_mipi_dsi: Add DSI Generic short
 write 2 param transfer
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Chen-Yu Tsai <wens@csie.org>, Icenowy Zheng <icenowy@aosc.io>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Vasily Khoruzhick <anarsoul@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        David Airlie <airlied@linux.ie>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927173650.N-zkd2215-hd0X90jZ365VWozyDc86MsviQrbDCCPFM@z>

On Thu, Sep 27, 2018 at 10:48 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Thu, Sep 27, 2018 at 05:18:43PM +0530, Jagan Teki wrote:
> > Short transfer write support for DCS and Generic transfer types
> > share similar way to process command sequence in DSI block so
> > add generic write 2 param transfer type macro so-that the panels
> > which are requesting similar transfer type may process properly.
> >
> > Also added error check for unsupporting transfer types this make
> > debugging easy for new transfer types.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > index 156b371243c6..1c7e42015645 100644
> > --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> > @@ -869,6 +869,7 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_host *host,
> >                    SUN6I_DSI_CMD_CTL_TX_FLAG);
> >
> >       switch (msg->type) {
> > +     case MIPI_DSI_GENERIC_SHORT_WRITE_2_PARAM:
> >       case MIPI_DSI_DCS_SHORT_WRITE:
> >       case MIPI_DSI_DCS_SHORT_WRITE_PARAM:
>
> You should order them by alphabetical order.

I just placed it with transfer code, ok will add it alphabetical

>
> >               ret = sun6i_dsi_dcs_write_short(dsi, msg);
> > @@ -885,6 +886,8 @@ static ssize_t sun6i_dsi_transfer(struct mipi_dsi_host *host,
> >               }
> >
> >       default:
> > +             dev_err(dsi->dev, "unsupported message type 0x%02x\n",
> > +                     msg->type);
>
> And this isn't an error check.

But unsupported message type by sun6i_dsi should be an error
eventually isn't it? and we can easily figure out where the error
trigger.
