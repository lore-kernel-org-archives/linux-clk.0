Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03110C4361B
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 06:43:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C88DD222F9
	for <linux-clk@archiver.kernel.org>; Sun, 20 Dec 2020 06:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbgLTGnc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 20 Dec 2020 01:43:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726992AbgLTGnb (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 20 Dec 2020 01:43:31 -0500
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB830C0617B0
        for <linux-clk@vger.kernel.org>; Sat, 19 Dec 2020 22:42:51 -0800 (PST)
Received: by mail-qv1-xf35.google.com with SMTP id d11so3068216qvo.11
        for <linux-clk@vger.kernel.org>; Sat, 19 Dec 2020 22:42:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WguVvw/vtMSeOUQpG1ZOK8abIBiR79EnZH6HCETFfGI=;
        b=eAT7+oYosAS3VOmoH7hn64EGWYoMXlX0zHF2zzWWeKCeSdme+pwbiusT3KTNb/jD0k
         93jONKiABvjA0dPcuLUBvcc6JgWRxqqcLg63Jpfuw+QIg5jz6X3Im/vVXlMqSwIpT/cc
         vmYIFWgt4bgvXIyDLBNf6b4VkgsZP3jzGZOBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WguVvw/vtMSeOUQpG1ZOK8abIBiR79EnZH6HCETFfGI=;
        b=TZpWMrjzlRSwLGFbpamFDiPCohrE/ZtuLjMxQwk/rlLQ0/QMlMp/Y1URQrP9dQQHQI
         dVGWfI/7cUvxGTUllWD6BUdzHFT6XW2aBmWKmP+R+VWysgT5LbECr41cEYMzafaHu2nj
         tC4xdGMFYxbB54T12ZhptHykYx0AlCWTpLeNxuxHsVeE2QV6L3PLK4wxd//yWjhnolyf
         z1xykwaCJ2ITEAgjUJ1pS+9pcgYyEB1J1qBRoltt2B5REIS2Ngl6N1GzZh3y1rxCbUMs
         aY8sbazRI3I+OvxRHtB9dAz0Fo9jXPEKPxbQ19JtkzEVrFrin+xEIsTUBK6Ct77xC6cg
         tR3g==
X-Gm-Message-State: AOAM533EzfK9oEBgKXivKBesUuLDoa0AS7sXWpYZni9+zxo7EY4cJMtv
        zAJeo7Rnr3M1ScOxCchYv0uquYbYtdNXBVILJSr5WA==
X-Google-Smtp-Source: ABdhPJxjlAMSsP/Y/ZWXurDseNeDAb6c/quzmV0MWCHgCUexOBRdyUd0oTVwR7Al3n/h86HzMixJBzBgBN8sqeySa7E=
X-Received: by 2002:a05:6214:140d:: with SMTP id n13mr12306172qvx.45.1608446570717;
 Sat, 19 Dec 2020 22:42:50 -0800 (PST)
MIME-Version: 1.0
References: <20201114135044.724385-1-daniel@0x0f.com> <20201114135044.724385-4-daniel@0x0f.com>
 <160843899675.1580929.13271525932327387602@swboyd.mtv.corp.google.com>
In-Reply-To: <160843899675.1580929.13271525932327387602@swboyd.mtv.corp.google.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sun, 20 Dec 2020 15:42:40 +0900
Message-ID: <CAFr9PXmAe9o5KtTG58twpumWi3A=7YfsM7b7pOwRTk1f=jCKQQ@mail.gmail.com>
Subject: Re: [PATCH 3/6] clk: mstar: MStar/SigmaStar MPLL driver
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>, linux-clk@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Willy Tarreau <w@1wt.eu>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Sun, 20 Dec 2020 at 13:36, Stephen Boyd <sboyd@kernel.org> wrote:
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index da8fcf147eb1..b758aae17ab8 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -124,3 +124,4 @@ endif
> >  obj-$(CONFIG_ARCH_ZX)                  += zte/
> >  obj-$(CONFIG_ARCH_ZYNQ)                        += zynq/
> >  obj-$(CONFIG_COMMON_CLK_ZYNQMP)         += zynqmp/
> > +obj-$(CONFIG_ARCH_MSTARV7)             += mstar/
>
> This is in the wrong place. It looks to be sorted based on the path
> name, so mstar/ comes much earlier in this file.

Noted. I'll fix this.

> > +
> > +#include <linux/platform_device.h>
> > +#include <linux/of.h>
> > +#include <linux/clk-provider.h>
> > +#include <linux/clkdev.h>
>
> Please remove unused includes
>
> > +#include <linux/of_address.h>
> > +#include <linux/module.h>
>
> Isn't it builtin? This include should be removed.

Yes. Sorry it was originally a module and there are some leftovers I
didn't clean up when I changed it to builtin.

> > +#define to_mpll(_hw) container_of(_hw, struct msc313_mpll, clk_hw)
> > +#define to_divider_hw(_mpll, _which) _mpll->clk_data->hws[_which + 1]
>
> I'd rather not have this macro. It's confusing given that to_foo()
> macros are usually a container_of() invocation. Given that it's only
> used in the registration/unregistration loops please inline it and use a
> local variable.
>

Ok I'll rework that.

> > +
> > +static int msc313_mpll_remove(struct platform_device *pdev)
> > +{
> > +       struct msc313_mpll *mpll = platform_get_drvdata(pdev);
> > +       int i;
> > +
> > +       for (i = 0; i < ARRAY_SIZE(output_dividers); i++)
> > +               clk_hw_unregister_fixed_factor(to_divider_hw(mpll, i));
>
> Maybe add a devm_ for this if it doesn't exist.

I did think about adding this. Would I need to do that in a separate
series or would it be ok to roll it into this one?

Thanks,

Daniel
