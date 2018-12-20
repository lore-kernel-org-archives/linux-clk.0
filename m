Return-Path: <SRS0=NpU+=O5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3915C43387
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 20:56:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A1C3C218FD
	for <linux-clk@archiver.kernel.org>; Thu, 20 Dec 2018 20:56:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="JNQuNJqZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389685AbeLTU40 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Dec 2018 15:56:26 -0500
Received: from mail-it1-f193.google.com ([209.85.166.193]:52501 "EHLO
        mail-it1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389684AbeLTU4Y (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Dec 2018 15:56:24 -0500
Received: by mail-it1-f193.google.com with SMTP id g76so4024880itg.2
        for <linux-clk@vger.kernel.org>; Thu, 20 Dec 2018 12:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=efF2qmFwsJ1axs0m1B4BUuW+RUh8a4wq2pjaccVYe9c=;
        b=JNQuNJqZv35yGcoTQlpjyNDO1LK/icLfT60oa8Oe1zdECcpIoOi/jLh7f+N+AXGbr4
         b6Yp3533F2UND8fzsMoBSLPV3qQcXdZ8jBlLxTJ7daT78hXkveFq6xwdbd2Mugz8vO5e
         tfkhEYtNZnFFapSAFdmYjwAin4vKTOu2ST8Rg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=efF2qmFwsJ1axs0m1B4BUuW+RUh8a4wq2pjaccVYe9c=;
        b=fZjBs9/G9eMY3ubKJWdzWtpUWbktyB1ybMUhqHPGNySz/F0WAAoFpIhkIwFe72jP84
         WUtT5ALEf/8HBxjOger42vdNyCegT0Rfjf1jF0uLtwyFBppkm7Vqb/Ofd88+3m33MLmz
         9MwYS4Fkx/nZe86SeDpHpduTysij/rr7JYETMqMrleKmHOjyVDK0INpw6kU4WdNAyKRY
         KzyD9xrMkeDtERL5Ae93ozRwev2aw6/ZiFWEtyGdqD5RuVBh0ufpxJNPN2QrYzXfMauT
         raLspRqTAHhb2s2ecx3vvNqbWdHx+e1NAH2MrKpFrCAujm+UmVyozB8eLPZQJF0etX+6
         1xog==
X-Gm-Message-State: AA+aEWZRphnA6j++1PkXeBGXHj58OItRY8HYQ+txN2CxQ6equYsW0s0M
        Tzz5K6Ef85X8Lhtr0EuytDHn+chPSIuuzo6W2eblKg==
X-Google-Smtp-Source: ALg8bN6rfXd4idarU47KMo5Mow2yJjrhhdUXYqRqjjZX8AY37yXXMGazvLIMeKxtXulHnZixSS1jALfRLmJ1Sme/Y88=
X-Received: by 2002:a24:5411:: with SMTP id t17mr207706ita.32.1545339383319;
 Thu, 20 Dec 2018 12:56:23 -0800 (PST)
MIME-Version: 1.0
References: <20181210161729.29720-1-jagan@amarulasolutions.com>
 <20181210161729.29720-8-jagan@amarulasolutions.com> <20181211164900.wfmkmbrbj3nmlb3h@flea>
In-Reply-To: <20181211164900.wfmkmbrbj3nmlb3h@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Fri, 21 Dec 2018 02:26:11 +0530
Message-ID: <CAMty3ZB5F5jD9iJT1soXSA5HtQOf5W9rKO9nCdGFUfVo0hpO4Q@mail.gmail.com>
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

On Tue, Dec 11, 2018 at 10:19 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Mon, Dec 10, 2018 at 09:47:19PM +0530, Jagan Teki wrote:
> > Video start delay can be computed by subtracting total vertical
> > timing with front porch timing and with adding 1 delay line for TCON.
> >
> > BSP code form BPI-M64-bsp is computing video start delay as
> > (from linux-sunxi/
> > drivers/video/sunxi/disp2/disp/de/lowlevel_sun50iw1/de_dsi.c)
> >
> > u32 vfp = panel->lcd_vt - panel->lcd_y - panel->lcd_vbp;
> > => (panel->lcd_vt) - panel->lcd_y - (panel->lcd_vbp)
> > => (timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y)
> >    - panel->lcd_y - (panel->lcd_vbp)
> > => timmings->ver_front_porch + panel->lcd_vbp + panel->lcd_y
> >                            - panel->lcd_y - panel->lcd_vbp
> > => timmings->ver_front_porch
> >
> > So, update the start delay computation accordingly.
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
>
> Even though it's a bit better now on my A33 board and I don't have the
> white stripes on the bottom of the display, there's still some
> flickering with your patches applied.
>
> Bisecting it seems to point at that patch, but reverting it doesn't
> make the issue go away, so it's not really clear which one exactly is
> at fault.

Is reverting this patch, work fine or not?

This patch is trying to make use of front porch instead of existing
back porch to compute the delay. Since we revert the VBP fix patch[1]
to assume VBP as VFP value look like your setup would also require to
revert this change. But as per BSP or drm_mode details all of my
displays even work with and w/o reverting these two.

I'm thinking your display should work in the same behavior since the
dsi controller making this route.

[1] https://patchwork.kernel.org/patch/10680309/
