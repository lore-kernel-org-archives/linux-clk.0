Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F5F7C433DB
	for <linux-clk@archiver.kernel.org>; Fri, 19 Mar 2021 19:59:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5991A61976
	for <linux-clk@archiver.kernel.org>; Fri, 19 Mar 2021 19:59:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230438AbhCST6w (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 Mar 2021 15:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230384AbhCST6c (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 Mar 2021 15:58:32 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D853C06175F
        for <linux-clk@vger.kernel.org>; Fri, 19 Mar 2021 12:58:32 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id v8so3457087plz.10
        for <linux-clk@vger.kernel.org>; Fri, 19 Mar 2021 12:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r6kE/DGRUVX2+tIU9DY3aXyNBS2dExA1NH5fcxRSLUQ=;
        b=d+GdIGpc0drzVmBZJAKkvuCnL7aMfPzLcAGULIVX+S57rXME23t2wyamSXfC3bqfip
         YBJsYNzTFnvIy+fO1QVXx7swqiuBg5GzG8YcuNJbPhbHmKNpYoYz11Qk/R/jaNkXUK+b
         6zXp6/gm/+zFHUA5JcHg+7WOgRDFJJM0gwivDEQqA+b6NW8dmrJHCUTM2KONZ33IX92Y
         RuOxAab6iluBX9sOvcMT9UwRr9Z5453Pcj/1KtWxgD+uWk3GtxeilXS9MwzYDOuiZW+T
         vqG1zcNsZ1H3GMFQ0L8CgOvv/EqqNZygjZpbqbDzyk2KR8maJSojZJZqhbTer4fmZXIZ
         NTfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r6kE/DGRUVX2+tIU9DY3aXyNBS2dExA1NH5fcxRSLUQ=;
        b=jc85IE3iE01J2c2sliF2+QDZcYPv2a3sgfX4SjVHlDTtxq4OG4HiFUHOB5bjYuFx92
         UdQqN/3agpRb3v88+TPw6+wldNuoIQFS1FaQUXah8o2EJzkAhXzBiazV2AdqUJrPfjpT
         J/roWwKBc6GZRyCbh4qL6vk9jkH1dRw0ZdzGXJisEYrsaaqwHo/X4x+Nwl8v12qZRdSk
         CbD0c1msE/o0IOt6ES6RlpcSjqGJZqNtq8YU2l45U4NEFQdfyWq061K0nMnjfSOmioK1
         +zbefLfAAHl+b3y/G221poQrQHmo8yvGLpWNDqT0gmewkcyqFtOwAGBaIpwNdaCSvskP
         DWFg==
X-Gm-Message-State: AOAM5308g0RUzr9zQHXXGVY5ZeIw5HWIYMQW9RAgRDVQXatBS8vojGIZ
        RXq3t+k+Llo2BbGMFoHl7HOgs8GQTfGq0zvWSI5tA40a1SOMLYpE
X-Google-Smtp-Source: ABdhPJyRdavVWY/px8a8H2FB5/urdA5I5+hBegKibDL5V9p3p0rgEBShUT5NwFTpLtQKEy3P2kff18w6UC7NHVBUqN0=
X-Received: by 2002:a17:90b:1198:: with SMTP id gk24mr191620pjb.84.1616183911608;
 Fri, 19 Mar 2021 12:58:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
In-Reply-To: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
From:   Michael Turquette <mturquette@baylibre.com>
Date:   Fri, 19 Mar 2021 12:58:05 -0700
Message-ID: <CAEG3pNA70G8R=ntBb4=XrQ6g2t7HKY-D-XYCOaww=usQ14KkrQ@mail.gmail.com>
Subject: Re: Scaling back down a shared clock
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?Q?Jerome_Brunet_=3Cjbrunet=40baylibre=2Ecom=3E=2C_linux=2Dclk=40vger=2Ekernel=2E?=
         =?UTF-8?Q?org=2C_linux=2Dkernel=40vger=2Ekernel=2Eorg=2C_Russell_King_=3Clinux=40armli?=
         =?UTF-8?Q?nux=2Eorg=2Euk=3E=2C_Linus_Walleij_=3Clinus=2Ewalleij=40linaro=2Eorg=3E=2C_Quent?=
         =?UTF-8?Q?in_Schulz_=3Cquentin=2Eschulz=40free=2Delectrons=2Ecom=3E=2C_Kevin_Hilman_?=
         =?UTF-8?Q?=3Ckhilman=40baylibre=2Ecom=3E=2C_Peter_De_Schrijver?= 
        <linux-clk@vger.kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

On Fri, Mar 19, 2021 at 8:03 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Mike, Stephen,
>
> The SoCs used in the RaspberryPi have a bunch of shared clocks (between
> two HDMI controllers for example) that need to be at a given minimum
> rate for each instance (based on the resolution for the HDMI
> controllers), but don't really have any maximum requirement other than
> the operating boundaries of that clock.
>
> We've supported it so far using the clk_set_min_rate function which
> handles nicely that requirement and the fact that it's shared.
>
> However, those clocks run at a fairly high frequency and there's some
> interest in keeping them at their minimum to draw less power. Currently,
> if we increase the minimum to a rate higher than the current clock rate,
> it will raise its rate, but once that minimum is lowered the clock rate
> doesn't change (which makes sense).
>
> How could we put some kind of downward pressure on the clock rate to
> make it run at its minimum all the time? It looks like the PM QoS
> framework implements something similar for the bus bandwidth, except
> that it's not really a bus that have this requirement here.

I'm a fan of _get/_put semantics for these types of critical sections.
In hindsight I wish that the all of the rate change APIs followed a
_set/_release or _get/_put pattern. clk_rate_exclusive{_get,_put}
probably gets the idea right, but only for a limited use case.

In your case, it would be cool to set the min rate at driver probe,
then _set the rate to perform work and then later _release the rate
once work was finished, and the default behavior in that case could be
to try and target the lowest possible rate.

Seeing as how the common clk framework just celebrated its ninth
birthday a few days ago on March 16, maybe it's time for a rewrite
with almost a decade of lessons learned? ;-)

Anyways, I digress. For a real solution to your actual problem, could
your driver do something like:

  clk_set_min_rate(clk, min_rate);
  clk_set_rate(clk, operating_rate);
  do_work();
  clk_set_rate(clk, min_rate);

The final rate at the end of this sequence may end up being min_rate,
or could be something higher based on the constraints of a different
struct clk in another device driver, which is taken into consideration
during clk_core_get_boundaries() which gets called in the clk_set_rate
-> clk_calc_new_rates path.

>
> We were thinking about either adding a flag to the clock that would make
> it run always at its lowest frequency, or to introduce a "boost" API to
> bump temporarily the clock rate and then once done brings it back to its
> default rate.

New flags and boost APIs both make me a little sad :-(

Best regards,
Mike


>
> The first one though would be a bit dangerous, since it's mostly
> use-case based, and if we don't get any clock user reporting a minimum
> it might have a bunch of weird side effects, making clk_set_rate_min
> required de facto while it wasn't before.
>
> The boost API semantics would probably have a bunch of weird corner
> cases. For example, how long is "temporarily" exactly, since for all we
> know it might actually last forever. What would happen if we change the
> boundaries or even the rate of the clock during a boost? etc.
>
> I'd really like to get your opinion on this before I start working on
> something.
>
> Thanks!
> Maxime
