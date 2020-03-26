Return-Path: <SRS0=aVCd=5L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC739C43331
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 15:31:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABC1E2076A
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 15:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgCZPbv convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Mar 2020 11:31:51 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:46648 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727345AbgCZPbv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Mar 2020 11:31:51 -0400
Received: by mail-ot1-f68.google.com with SMTP id 111so6187997oth.13
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2020 08:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=XTkjkxktGYVZu1YuzBjsBjxOC6QKuT6CUAB31DIHFjc=;
        b=mkBF+6DCBnALMUwUI54dZ7p4dbg8ERTaEtrUqLp65TqehcMAS17/jO2SvWimjOJvZQ
         j7Vic1BSKjUEswrbAA2sMyrgvk/8YjysP7NPCLFwUS9CaxNKiZQVMzSoi0N46A9SB3kV
         WjZmHmTIlgJUOe3XBNXDd81i0pRhcukdtIQDCrG7oeJWkC94qm8/OtjG0YDEMcKEvAsB
         YOyfTTqMaa/mt7KDpaMjTNiQNwkgpW5omniag9rXrM5z6Pqv1GEgX4qu0tzHOVcNEEBr
         GxXX+Aj91lzbjKlQCXrI2X11y61czsEVRtKw4F7cmtR3sqZiNezmyQxItLEzQ4UBNfqw
         ms8A==
X-Gm-Message-State: ANhLgQ1r8uS+7nlK+HQmgpVgGcx7/lg//1m1RMe/9ZDHT1QYK1bSojxn
        SlXi5WUQA69YX/sZEnOsgBY2utm/+R/0729mLns=
X-Google-Smtp-Source: ADFU+vtISW4Cc/lOTpsR8iCtEMqgOt8HbkosAvUpULKrxq2q94u8VIBgjINOhV0/ykBD+p9s4UDoxKwL/DYSfkijdtI=
X-Received: by 2002:a9d:5c0c:: with SMTP id o12mr6588642otk.145.1585236710072;
 Thu, 26 Mar 2020 08:31:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200302155703.278421-1-mylene.josserand@collabora.com>
 <20200302155703.278421-2-mylene.josserand@collabora.com> <2221545.2vEflg7qi2@diego>
 <CAMuHMdXJQqaCcMko9GUAeUiYQzmy3vnX42yVQNPzhj5ijtFuYA@mail.gmail.com> <5802ec08-5e6a-8547-ee8e-dde630791235@collabora.com>
In-Reply-To: <5802ec08-5e6a-8547-ee8e-dde630791235@collabora.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 26 Mar 2020 16:31:38 +0100
Message-ID: <CAMuHMdVKFT7eNK0RUi3miJ08O9FMAVs5Qz=YmbHH5-9UUzLNPw@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: Rockchip: Handle rk3288/rk3288w revision
To:     Mylene Josserand <mylene.josserand@collabora.com>
Cc:     =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
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

Hi Mylene,

On Thu, Mar 26, 2020 at 2:50 PM Mylene Josserand
<mylene.josserand@collabora.com> wrote:
> On 3/6/20 11:45 AM, Geert Uytterhoeven wrote:
> > On Wed, Mar 4, 2020 at 12:00 PM Heiko Stübner <heiko@sntech.de> wrote:
> >> Am Montag, 2. März 2020, 16:57:02 CET schrieb Mylène Josserand:
> >>> Determine which revision of rk3288 by checking the HDMI version.
> >>> According to the Rockchip BSP kernel, on rk3288w, the HDMI
> >>> revision equals 0x1A which is not the case for the rk3288 [1].
> >>>
> >>> As these SOC have some differences, the new function
> >>> 'soc_is_rk3288w' will help us to know on which revision
> >>> we are.
> >>
> >> what happened to just having a different compatible in the dts?
> >> Aka doing a
> >>
> >> rk3288w.dtsi with
> >>
> >> #include "rk3288.dtsi"
> >>
> >> &cru {
> >>          compatible = "rockchip,rk3288w-cru";
> >> }
> >>
> >> I somehow don't expect boards to just switch between soc variants
> >> on the fly.
> >>
> >> Also, doing things in mach-rockchip is not very future-proof:
> >>
> >> (1) having random soc-specific APIs spanning the kernel feels wrong,
> >>      especially as at some point it might not be contained to our own special
> >>      drivers like the cru. I cannot really see people being enthusiastic if
> >>      something like this would be needed in say the core Analogix-DP bridge ;-)
> >
> > Indeed.  You're better of registering an soc_device_attribute using
> > soc_device_register(), after which any driver can use soc_device_match()
> > to differentiate based on the SoC revision.
>
> Thank you for this suggestion. The issue is that clocks are registered
> at an early stage of the boot so using initcalls is too late for the
> clock differentiation :(

IC, rk388 is still using CLK_OF_DECLARE().
What about converting it to a platform driver, registered from e.g.
subsys_initcall()?
If you need some clocks early (e.g. for timers), you can do split
registration, with the early part still using CLK_OF_DECLARE().
That should work, assumed the timer clocks don't need differentiation.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
