Return-Path: <SRS0=8I5m=AU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92905C433E0
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jul 2020 11:33:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71B7E207C4
	for <linux-clk@archiver.kernel.org>; Thu,  9 Jul 2020 11:33:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="fuWDO70E"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726315AbgGILdX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 Jul 2020 07:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgGILdW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 9 Jul 2020 07:33:22 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B738C08C5CE
        for <linux-clk@vger.kernel.org>; Thu,  9 Jul 2020 04:33:22 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id o8so1418525wmh.4
        for <linux-clk@vger.kernel.org>; Thu, 09 Jul 2020 04:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZIb74klp0h6UWr6/TS/11mmFGV/72HoMTQo4qJf3ORo=;
        b=fuWDO70EKTbi49qR9wTXqgGu0SPbyIT24LkwnflguPA9AnZZP8ZS+I3J+I3gAt9DPd
         p47yE80SfJY2aZHrT7TqCbIUHHrjgvcZf93KM7tKJYSnS39Y/gXqsz4Tf6FOSf6EEuCG
         pH0eHFJRc8HiEZg4O6qPPbZV1iFNrYHHEa6BzGztKF4y+h3cE9mBbmAl5MBr+AyiHpBM
         GdSF4/yXJNmhUBkJrtsXd6j03YQb540XNfhUSGgT9koPaTfQWdqwERI3DxOwrqa5y6Ec
         B7dLDboAHNGk6e/R02K5D93b/OZCy69NhDzihGqfTuCh/PXaW1ZAa3XrAQICB9qQ6Zyf
         cYkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZIb74klp0h6UWr6/TS/11mmFGV/72HoMTQo4qJf3ORo=;
        b=toXJBr3QtyHgieLvVQQfjEPm9Odm2zyN7r6it16VESMxs08QJDt7hfekh+I1QB+nkV
         ITzAxVqu+/dhog1leoHn3WXRfzm8jGabD6gu/FqQkS4QfXun2nOOYyjSW4v2oBZYti7m
         YnttoM3ZjmmdcZsrrINfDvkXLh5Gvgw4H1llUBN2if6SC0dswiJRV3nwARSlTk4cCPfh
         lVB8UrTswyQu3/12DCZUPyGQK0iZeLszMlYdxOwcMJZgHLngk2wk8TkrJJEinLRI2g5e
         a+oJhE6Xxk/oej/huutY6Pk/SG7hZMNmvAatSXa872i8z6xfJoaltNnMa0o6v4s+HuTw
         sPCw==
X-Gm-Message-State: AOAM533h1ijou+IvdZuUVVqbWVldyB8vOKRPrFOeENkkeE7Cl1pYmJo6
        mpkzgewYsIn58NANhdK9mJpoqA==
X-Google-Smtp-Source: ABdhPJxoHQM+D4+hSCTnqJVzGv7ThVF6Lyz/19dZbPBvXwJCLjDYojSfxytI6Qb/R+mCvL+LAMy62w==
X-Received: by 2002:a05:600c:2182:: with SMTP id e2mr13495604wme.186.1594294400952;
        Thu, 09 Jul 2020 04:33:20 -0700 (PDT)
Received: from holly.lan (cpc141214-aztw34-2-0-cust773.18-1.cable.virginm.net. [86.9.19.6])
        by smtp.gmail.com with ESMTPSA id w12sm5453165wrm.79.2020.07.09.04.33.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2020 04:33:20 -0700 (PDT)
Date:   Thu, 9 Jul 2020 12:33:18 +0100
From:   Daniel Thompson <daniel.thompson@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Liviu Dudau <liviu.dudau@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        "open list:THERMAL" <linux-pm@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Kevin Brodsky <Kevin.Brodsky@arm.com>,
        Sebastian Reichel <sre@kernel.org>,
        Will Deacon <will@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Lee Jones <lee.jones@linaro.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 00/17] Modularizing Versatile Express
Message-ID: <20200709113318.w5jcj3kjy4xc3v7p@holly.lan>
References: <20200429205825.10604-1-robh@kernel.org>
 <20200617150850.t23gwj3p2qnduq2a@holly.lan>
 <CAL_Jsq+uTW_-cNOQFWPcYEVRvqf3DEqiaGTfV5uWag0zvAzjgA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAL_Jsq+uTW_-cNOQFWPcYEVRvqf3DEqiaGTfV5uWag0zvAzjgA@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jul 08, 2020 at 10:39:43AM -0600, Rob Herring wrote:
> On Wed, Jun 17, 2020 at 9:08 AM Daniel Thompson
> <daniel.thompson@linaro.org> wrote:
> >
> > On Wed, Apr 29, 2020 at 03:58:09PM -0500, Rob Herring wrote:
> > > This series enables building various Versatile Express platform drivers
> > > as modules. The primary target is the Fast Model FVP which is supported
> > > in Android. As Android is moving towards their GKI, or generic kernel,
> > > the hardware support has to be in modules. Currently ARCH_VEXPRESS
> > > enables several built-in only drivers. Some of these are needed, but
> > > some are only needed for older 32-bit VExpress platforms and can just
> > > be disabled. For FVP, the pl111 display driver is needed. The pl111
> > > driver depends on vexpress-osc clocks which had a dependency chain of
> > > vexpress-config --> vexpress-syscfg --> vexpress-sysreg. These
> > > components relied on fixed initcall ordering and didn't support deferred
> > > probe which would have complicated making them modules. All these levels
> > > of abstraction are needlessly complicated, so this series simplifies
> > > things a bit by merging the vexpress-config and vexpress-syscfg
> > > functionality.
> > >
> > > There's a couple of other pieces to this which I've sent out separately
> > > as they don't have dependencies with this series. The cross subsystem
> > > dependencies in this series are mainly the ordering of enabling drivers
> > > as modules.
> >
> > This series results in the vexpress-a15 console not coming up until very
> > late in the boot process because the console arch_initcall() ends up
> > being deferred because it's dependencies are no longer use
> > core_initcall() to ensure they get in first.
> 
> Which was a hack...
> 
> > Is there a problem registering vexpress-osc, vexpress-sysreg and
> > vexpress-config as core_initcall's so the console behaves nicely
> > when they are all compiled as built-ins?
> 
> I think the correct way to solve this is with devlinks which reduces
> the deferred probes. Can you see if that's better? That's still off by
> default and needs a kernel command line option. That may just get the

"fw_devlink=on", right?

I didn't see any difference on time to console activation with this
enabled.


> console up at an earlier initcall level, but not before other h/w
> drivers. I think having some way to prioritize probe order without
> initcall hacks would be good. Then you could prioritize a console or
> splash screen or ???.

I don't disagree on "the right thing to do" although I am a little
surprised to see the old hack removed a replacement is ready. IIUC
the modularization for GKI doesn't require them to be changed.


> Also, if you really need an early console, then use earlycon.

To be honest I have relaxed a few expectations in my test harness and
have already moved on ;-).

Right now the console will not come up until after we have decompressed
the ramdisk even when we have configure the kernel to have a rich set of
console drivers built in. That does feel pretty uncomfortable as a user,
especially if you have a large initrd but the test suite doesn't mind!


Daniel.
