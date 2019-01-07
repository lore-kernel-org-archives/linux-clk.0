Return-Path: <SRS0=QWvG=PP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71E2DC43612
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jan 2019 15:18:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 422682087F
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jan 2019 15:18:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="qmutbevC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729730AbfAGPSf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Jan 2019 10:18:35 -0500
Received: from mail-it1-f195.google.com ([209.85.166.195]:55067 "EHLO
        mail-it1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfAGPSf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Jan 2019 10:18:35 -0500
Received: by mail-it1-f195.google.com with SMTP id i145so1584788ita.4
        for <linux-clk@vger.kernel.org>; Mon, 07 Jan 2019 07:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=etMmqBlvtlnxJHZTXcYc6nrcGcV1CQ7x663xqo72vJQ=;
        b=qmutbevCZWxhmrdmuvkLV9C7Rq2GXSMqc/AGZ4x7X00/aidgXNAH4n8IOqB2VfyJ8j
         7Fjc8Fl0T5D2hQfWDJIPrl4az+cGnvYGnFUEmxnPOJoKHYdfHN/7p8zn06FB/J7T3aYq
         eyEOMlsAnPSa+Xpyo9YyQiEuqAyF5zNnmFO48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=etMmqBlvtlnxJHZTXcYc6nrcGcV1CQ7x663xqo72vJQ=;
        b=prBtP33Y/3CD0sA6K26/ETMuNr8DikT1zWRGnHxvVpTvqrUH5LzAdM/zCPwX6yBXXK
         f7OeXhUKhg6mDsuoTwBt4EISM/3nU1u7cAQuw570szZNxLX9bDjNpuyx40RCnIRc+o4i
         +smJT628c6LL6ZGEmUDt6+fwo3OJQE03d8/WnDJT9i0e7wmy7eVE6/b8QzgEyt028Sxr
         tcOsoIsSB/32iUZ+sEEUMqMrW2dZe86SBPH6j0RjydZCVoe9utQhfHHau66TxXxOAymJ
         R2PQye0pUwoqdnRN2D/p81DXSK8Iu0Nd4IcBR/U/8ZaLE8hhLzXuHNxtkvghLmlgIlNO
         +Phg==
X-Gm-Message-State: AJcUukdWQenKkNOnP+P8gm+5LUQfWx6ir64kRHQ2e7heuZiGTv/UeRXL
        XWXhWohDitqRCJUvW2lv+AZNUPBaxFbOTu5N22IV5Q==
X-Google-Smtp-Source: ALg8bN41ZqL8iO66URwEiSpaZ74jg0B+MTzxJaV4r8IGMSJ6GjR5eoDT7oRbie8D53VRvEXYr1UMLQ0q99hNvgqLFnw=
X-Received: by 2002:a24:5411:: with SMTP id t17mr7083194ita.32.1546874313737;
 Mon, 07 Jan 2019 07:18:33 -0800 (PST)
MIME-Version: 1.0
References: <20181210161729.29720-1-jagan@amarulasolutions.com>
 <20181210161729.29720-8-jagan@amarulasolutions.com> <20181211164900.wfmkmbrbj3nmlb3h@flea>
 <CAMty3ZB5F5jD9iJT1soXSA5HtQOf5W9rKO9nCdGFUfVo0hpO4Q@mail.gmail.com> <20190107141158.zaimizk4rlqa6xli@flea>
In-Reply-To: <20190107141158.zaimizk4rlqa6xli@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Mon, 7 Jan 2019 20:48:21 +0530
Message-ID: <CAMty3ZBb8byOwh=_W83Ta0Dse1qkoqccOeaBEY9oHPaxDxe9QA@mail.gmail.com>
Subject: Re: [PATCH v5 07/17] drm/sun4i: sun6i_mipi_dsi: Refactor vertical
 video start delay
To:     Maxime Ripard <maxime.ripard@bootlin.com>
Cc:     Chen-Yu Tsai <wens@csie.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Michael Trimarchi <michael@amarulasolutions.com>,
        linux-sunxi <linux-sunxi@googlegroups.com>,
        linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Jan 7, 2019 at 7:42 PM Maxime Ripard <maxime.ripard@bootlin.com> wrote:
>
> On Fri, Dec 21, 2018 at 02:26:11AM +0530, Jagan Teki wrote:
> > On Tue, Dec 11, 2018 at 10:19 PM Maxime Ripard
> > <maxime.ripard@bootlin.com> wrote:
> > >
> > > On Mon, Dec 10, 2018 at 09:47:19PM +0530, Jagan Teki wrote:
> > > > Video start delay can be computed by subtracting total vertical
> > > > timing with front porch timing and with adding 1 delay line for TCON.
> > > >
> > > > BSP code form BPI-M64-bsp is computing video start delay as
> > > > (from linux-sunxi/
> > > > drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> > > >
> > > > u32 vfp = panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;
> > > > => (panel->lcd_vt) - panel->lcd_y - (panel->lcd_vbp)
> > > > => (timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y)
> > > >    - panel->lcd_y - (panel->lcd_vbp)
> > > > => timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y
> > > >                            - panel->lcd_y - panel->lcd_vbp
> > > > => timmings->ver_front_porch
> > > >
> > > > So, update the start delay computation accordingly.
> > > >
> > > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > >
> > > Even though it's a bit better now on my A33 board and I don't have the
> > > white stripes on the bottom of the display, there's still some
> > > flickering with your patches applied.
> > >
> > > Bisecting it seems to point at that patch, but reverting it doesn't
> > > make the issue go away, so it's not really clear which one exactly is
> > > at fault.
> >
> > Is reverting this patch, work fine or not?
>
> As I was saying, it doesn't.
>
> > This patch is trying to make use of front porch instead of existing
> > back porch to compute the delay. Since we revert the VBP fix patch[1]
> > to assume VBP as VFP value look like your setup would also require to
> > revert this change. But as per BSP or drm_mode details all of my
> > displays even work with and w/o reverting these two.
>
> Again, I cannot help you without the datasheet for the panels you're
> trying to submit.

The panel bound with Sitronix ST7701 IC
http://www.startek-lcd.com/res/starteklcd/pdres/201705/20170512144242904.pdf
