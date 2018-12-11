Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB47EC07E85
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 17:00:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 901EE2086D
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 17:00:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="hVfpngYF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 901EE2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726808AbeLKRAW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 12:00:22 -0500
Received: from mail-io1-f65.google.com ([209.85.166.65]:38259 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726714AbeLKRAV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 12:00:21 -0500
Received: by mail-io1-f65.google.com with SMTP id l14so12361681ioj.5
        for <linux-clk@vger.kernel.org>; Tue, 11 Dec 2018 09:00:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oRCOPzMLIrDwVjWJ2tEJutI5NVsDV0X/Aiu/VaWtEw0=;
        b=hVfpngYF4ZURKVO1lak5Y+rAxRsd5bNbTZhiA8UgVdFMiUSp0oim5XNVLDvbf9HZVF
         9zT+XYy0QsL7JuTLtYENzfM8rGh3CvcvNp36AMMhEd+mM6Izh69V5llW+JXGFW8aIojM
         wGY/iS/3svL7kQDhbr5mTsw2hiH6fYfHyxIac=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oRCOPzMLIrDwVjWJ2tEJutI5NVsDV0X/Aiu/VaWtEw0=;
        b=gumzeTnq77og0Z21FrXrwItSOa8U02LETSwAbq2Ppgus8YeCSkZV2oOiRqE82DnCDM
         Kp8kPDbAa7Kzx2Jmlt4aff5qcHurWZ5/+S/z+FF8D4JOaGBqPnWRK4KoaZFgX0AohrTD
         hOxNpNjz7W1/2ZQBkg6oT3ELfDU9dVkjH0o53zUTv5V6JoAbp+sBK86pH1c5iZvSLJny
         K6Mnx/BKyaktv5g/SoOn6ml0hAIZeyjh+m+FMRr5Cx9gvn/mkhAnW46+6FlRLbZ2hf5b
         MHpO93FidiseyuH1Xyuu/5AgbnqLghpinl11Aro2xaSjrcuD/pEKhKtpIr12c7HBoBK1
         Gm+Q==
X-Gm-Message-State: AA+aEWb4X3Zl6gvZSVkPX3hq3IloPOLBdMnhFcS/of5zuDHAJVCXBrgK
        WFjbSgOIbPrgUU71Xq6WweQzwn837u2cuQ4MF2prIw==
X-Google-Smtp-Source: AFSGD/X81VVihlLYP6XLcjhLKO7UOwos3IttGs5h+I85lBgxxLy+W1l64a29hAep4YMp64aI5Jxa1EEtAnhTarBFhMc=
X-Received: by 2002:a5e:c609:: with SMTP id f9mr1247997iok.114.1544547620650;
 Tue, 11 Dec 2018 09:00:20 -0800 (PST)
MIME-Version: 1.0
References: <20181210161729.29720-1-jagan@amarulasolutions.com>
 <20181210161729.29720-8-jagan@amarulasolutions.com> <20181211164900.wfmkmbrbj3nmlb3h@flea>
In-Reply-To: <20181211164900.wfmkmbrbj3nmlb3h@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Tue, 11 Dec 2018 22:30:08 +0530
Message-ID: <CAMty3ZBzOyAGwgOZwArbvnqtcvwMkJrqwGQ-q7+XFX-BVs34RQ@mail.gmail.com>
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
>
> So, just like I asked in your v4, twice,
>
> http://lists.infradead.org/pipermail/linux-arm-kernel/2018-November/615339.html

I don't know how can I comment here. Not quite clearly understand your
setup, because I have verified 3 different panels from different
vendors one with 2-lane, another with 4-lane and one with video format
and another one is burstmode format. I even verified with the clock
rate and register details.

Please suggest me, what can look further on this.
