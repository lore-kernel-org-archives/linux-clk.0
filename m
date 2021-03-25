Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4AE2C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 09:59:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CB6161A1D
	for <linux-clk@archiver.kernel.org>; Thu, 25 Mar 2021 09:59:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbhCYJ6o (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:58:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:45562 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229890AbhCYJ6M (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 25 Mar 2021 05:58:12 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id D9B9161A27;
        Thu, 25 Mar 2021 09:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1616666291;
        bh=m1wmidU0pX5a5zTXwMlXxkjrnZelkYrUQgNYA+nkkeo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dYAU3PjDCGiN5cGWNWGneP46ylwDROApTamVE62JjlGIxJ+3toIEupLYKgFAIOjAm
         sB3abPcuanO+G/FvkLo1ITg30lVN8jzITVcEjcpnMwGQr1F0lwOq642bpN/Pwa5Lhe
         MpunHSckfhAVwAXNuuNbs6C7s478sCrhTQv9QoCq/FV92mFaGvpSHRza/87cd/+P40
         DyukFh/HZtHNgwZZeKlsEW4JphqrmWnsTbrXjcbgJYdphG9OTTN6P6VrbVBo4MBbVn
         8KJsG4Dz12qQYy1dARXA3t2nlPFlGTpaOHoPuv7dOXrXCRgQpizTXfjLoQvV/J9uYk
         Lhpu/Q3xKIZRw==
Date:   Thu, 25 Mar 2021 11:58:07 +0200
From:   Abel Vesa <abelvesa@kernel.org>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Subject: Re: Scaling back down a shared clock
Message-ID: <YFxerzh3a4xSzRu/@ryzen.lan>
References: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210319150355.xzw7ikwdaga2dwhv@gilmour>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-03-19 16:03:55, Maxime Ripard wrote:
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
> 

Maybe interconnect + devfreq is the solution here.

I did something similar here:

https://lore.kernel.org/lkml/1613750416-11901-1-git-send-email-abel.vesa@nxp.com/

> We were thinking about either adding a flag to the clock that would make
> it run always at its lowest frequency, or to introduce a "boost" API to
> bump temporarily the clock rate and then once done brings it back to its
> default rate.
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


