Return-Path: <SRS0=hB7x=4X=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC8F7C10DCE
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 10:45:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B93DD2084E
	for <linux-clk@archiver.kernel.org>; Fri,  6 Mar 2020 10:45:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726069AbgCFKpi convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 6 Mar 2020 05:45:38 -0500
Received: from mail-oi1-f194.google.com ([209.85.167.194]:46024 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgCFKpi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 6 Mar 2020 05:45:38 -0500
Received: by mail-oi1-f194.google.com with SMTP id v19so2058321oic.12
        for <linux-clk@vger.kernel.org>; Fri, 06 Mar 2020 02:45:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=HroD0on08tLEMYhs9qrREoR+/CxJ/32j4jpzzO71uX0=;
        b=Z5wMs/coYeoADCQXX6FRUPtXvpO2hY+BtsLb9DQ/NQAzWP05gSApTR4kZBFu+mEyHf
         lTBtSv6k8dZOUwgW/ouAcL4Nam3ynwSfnBF6GVgZmqoWbv9XHO+aadNU9p37jFGHdZbu
         ET+9ndP4CaeS3eNtxXEIpVyYKZjE/iPl4DBtMGi4z1hqVvDXzGZgeHrH0pNwXExlq37x
         6BKv5R2kAri34G/KJ0PbtaUojJIBWQpqm9SimHf2UbWfsgnRVferGSng9brsOROZWHyf
         q1TyTQEPOdBpBp6cAD+q3s8TlHyRWwL3R2NWT9k572KuASibjKE7AjLr2rDKqoXl3gvr
         p4ew==
X-Gm-Message-State: ANhLgQ1TvHkJA3pIor/pLjK7UAAgk2IllLPhDVoEn/ni18dabaiHPyg7
        05hRRCC7XR5hIK8o4K55Lj8pxEzipnLbZlVgLqA=
X-Google-Smtp-Source: ADFU+vvtUPH3/Ph9fb3frspC4QqnvQ+CWNfeWzdZ5p3uA2hEhHOsJ1oZpb7TnnmVwlAmCRdczLdbAoij4DJyvJ/brwE=
X-Received: by 2002:aca:1a06:: with SMTP id a6mr2005904oia.148.1583491536148;
 Fri, 06 Mar 2020 02:45:36 -0800 (PST)
MIME-Version: 1.0
References: <20200302155703.278421-1-mylene.josserand@collabora.com>
 <20200302155703.278421-2-mylene.josserand@collabora.com> <2221545.2vEflg7qi2@diego>
In-Reply-To: <2221545.2vEflg7qi2@diego>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 6 Mar 2020 11:45:25 +0100
Message-ID: <CAMuHMdXJQqaCcMko9GUAeUiYQzmy3vnX42yVQNPzhj5ijtFuYA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: Rockchip: Handle rk3288/rk3288w revision
To:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc:     =?UTF-8?Q?Myl=C3=A8ne_Josserand?= <mylene.josserand@collabora.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Russell King <linux@armlinux.org.uk>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Collabora Kernel ML <kernel@collabora.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Heiko,

On Wed, Mar 4, 2020 at 12:00 PM Heiko Stübner <heiko@sntech.de> wrote:
> Am Montag, 2. März 2020, 16:57:02 CET schrieb Mylène Josserand:
> > Determine which revision of rk3288 by checking the HDMI version.
> > According to the Rockchip BSP kernel, on rk3288w, the HDMI
> > revision equals 0x1A which is not the case for the rk3288 [1].
> >
> > As these SOC have some differences, the new function
> > 'soc_is_rk3288w' will help us to know on which revision
> > we are.
>
> what happened to just having a different compatible in the dts?
> Aka doing a
>
> rk3288w.dtsi with
>
> #include "rk3288.dtsi"
>
> &cru {
>         compatible = "rockchip,rk3288w-cru";
> }
>
> I somehow don't expect boards to just switch between soc variants
> on the fly.
>
> Also, doing things in mach-rockchip is not very future-proof:
>
> (1) having random soc-specific APIs spanning the kernel feels wrong,
>     especially as at some point it might not be contained to our own special
>     drivers like the cru. I cannot really see people being enthusiastic if
>     something like this would be needed in say the core Analogix-DP bridge ;-)

Indeed.  You're better of registering an soc_device_attribute using
soc_device_register(), after which any driver can use soc_device_match()
to differentiate based on the SoC revision.

> (2) I guess the rk3288w will not be the last soc doing this and on arm64 you
>     can't do it that way, as there is no mach-rockchip there

There's drivers/soc/rockchip ;-)

> So my personal preference would really would be just a specific compatible
> for affected ip blocks.

Doing that only for affected IP blocks may miss integration differences.
Of course, you can always resort to soc_device_match() to handle those...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
