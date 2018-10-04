Return-Path: <SRS0=t8U+=MQ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AEB3C64EBC
	for <linux-clk@archiver.kernel.org>; Thu,  4 Oct 2018 16:04:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 092F02087D
	for <linux-clk@archiver.kernel.org>; Thu,  4 Oct 2018 16:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="AGLGAye7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 092F02087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727407AbeJDW6F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Oct 2018 18:58:05 -0400
Received: from mail-it1-f194.google.com ([209.85.166.194]:35492 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727505AbeJDW6F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Oct 2018 18:58:05 -0400
Received: by mail-it1-f194.google.com with SMTP id p64-v6so14794123itp.0
        for <linux-clk@vger.kernel.org>; Thu, 04 Oct 2018 09:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vwEVPK7g+G6IG5OUpcekUK8SjOHzZUDvQ1Qm+UOVuxA=;
        b=AGLGAye7OFM0zPwioofgF6/V7lEd2rxtdMpw5vb3khHB16z38ZH6Zo3lmiIPeVuyR5
         acEa9d9Lf2P+rerqYhAg6iS7J+tCBvSsgHSyFYoGvl50TjnGU1IvKlt12YjGadaopWsq
         fo/N0RfHcl6+UnQ77sTf52jFaWwb4tDzsr2AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vwEVPK7g+G6IG5OUpcekUK8SjOHzZUDvQ1Qm+UOVuxA=;
        b=TijFt108XyTTI49Xbwmeegpa3WeKkIGe7RBwULVeJ0fkTEbnZqjrwfp6JvWgmMOaMj
         2xrgjvnwwuPV09o6ZbZMlBrAWjPdnkXhg53ozToLXZ/b8sifk2xI4YwMhLEbZJ7FjYza
         3lbZXKk6Jog8nJzwOMVqxI6/nM7/LLsGnmzuASYvgJ51vSmz7aqZUOMwrLw2wgyAk0St
         cyjrwFZV4kbt4573wUmw2Oftre0RvkDD/PuDF7R6ndB9KhSH0UoAF67PDx5EjgHBDVxg
         5WWcyw+3Ouzp/g/i39YMm+OGROPDwaxyOECY9F0mCf1/PJLiOJW3kHJy4LSi7cb2gcW7
         oelQ==
X-Gm-Message-State: ABuFfoiH0xU3vV1e21JiPCY0EV5zJi+WOHiASNnTzARs0diQKHBM44CP
        e0ocGTdWvaspgSrHD0DWqlX8/XGcGFcPLq4vCeD04g==
X-Google-Smtp-Source: ACcGV620muuzwsjcr54OoSn1hFK27VkPEFhpmckiWKVjCNCVfir6fILO5vrknaTUMlm3U4O9sDpCo3sDjv6a05RWr2U=
X-Received: by 2002:a24:8012:: with SMTP id g18-v6mr5853444itd.2.1538669050404;
 Thu, 04 Oct 2018 09:04:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180927114850.24565-1-jagan@amarulasolutions.com>
 <20180927114850.24565-13-jagan@amarulasolutions.com> <20180927171747.wqdt5eiwktyyoefz@flea>
In-Reply-To: <20180927171747.wqdt5eiwktyyoefz@flea>
From:   Jagan Teki <jagan@amarulasolutions.com>
Date:   Thu, 4 Oct 2018 21:33:59 +0530
Message-ID: <CAMty3ZBb25EBF85oGYZFMGkW1F8DwojfwWp=UKhoTrJZmQkjZQ@mail.gmail.com>
Subject: Re: [PATCH 12/12] arm64: dts: allwinner: bananapi-m64: Bananapi
 S070WV20-CT16 DSI panel
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

On Thu, Sep 27, 2018 at 10:47 PM Maxime Ripard
<maxime.ripard@bootlin.com> wrote:
>
> On Thu, Sep 27, 2018 at 05:18:50PM +0530, Jagan Teki wrote:
> > This patch add support for Bananapi S070WV20-CT16 DSI panel to
> > BPI-M64 board.
> >
> > DSI panel connected via board DSI port with,
> > - DC1SW as AVDD supply
> > - DCDC1 as DVDD supply
> > - PD6 gpio for reset pin
> > - PD5 gpio for backlight enable pin
> > - PD7 gpio for backlight vdd supply
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../dts/allwinner/sun50i-a64-bananapi-m64.dts | 42 +++++++++++++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > index ef1c90401bb2..c0be949be68d 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-bananapi-m64.dts
> > @@ -45,6 +45,7 @@
> >  #include "sun50i-a64.dtsi"
> >
> >  #include <dt-bindings/gpio/gpio.h>
> > +#include <dt-bindings/pwm/pwm.h>
> >
> >  / {
> >       model = "BananaPi-M64";
> > @@ -56,6 +57,24 @@
> >               serial1 = &uart1;
> >       };
> >
> > +     vdd_bl: regulator@0 {
> > +             compatible = "regulator-fixed";
> > +             regulator-name = "bl-3v3";
> > +             regulator-min-microvolt = <3300000>;
> > +             regulator-max-microvolt = <3300000>;
> > +             gpio = <&pio 3 7 GPIO_ACTIVE_HIGH>; /* PD7 */
> > +             enable-active-high;
> > +     };
> > +
> > +     backlight_dsi: backlight-dsi {
> > +             compatible = "pwm-backlight";
> > +             pwms = <&r_pwm 0 50000 PWM_POLARITY_INVERTED>;
> > +             brightness-levels = <0 10 20 30 40 50 60 70 80 90 100>;
>
> The brightness levels should be increasing linearly from a user point
> of view. Usually, with a PWM backlight, a quadratic rule works much
> better.

Does that mean, 0 40 80 ...
