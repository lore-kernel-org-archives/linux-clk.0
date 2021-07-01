Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 204BEC11F64
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 16:44:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3539613DC
	for <linux-clk@archiver.kernel.org>; Thu,  1 Jul 2021 16:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbhGAQqt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 1 Jul 2021 12:46:49 -0400
Received: from mail-vk1-f179.google.com ([209.85.221.179]:45682 "EHLO
        mail-vk1-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229759AbhGAQqq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 1 Jul 2021 12:46:46 -0400
Received: by mail-vk1-f179.google.com with SMTP id n19so696271vkl.12;
        Thu, 01 Jul 2021 09:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rNSmf6B2Lp5Ni3r8C+3XioZhDBEjQYkKkaF9nG/fIRU=;
        b=A1lxa/W9fCVpwAi/MjtyOadokTXtc7tjbRX6hDqnxJQ9pjNuM1P44SHKZ/nCie4wFf
         ILbPhaUODXOinus/BQOej0AwSduXgEGMsT/CmJXNyqbEHhqQ8oD3LdAQz8i0m7MlUhw5
         kQvRIoWbcbvieOSFVjmP7cmGHKTprQ6Ub16Msp3nRTj7+KctBbTY3fSc6r5eLXiaMoJo
         yuCjkQkBJv16WxEYsYtcu7uqGlh+1wx9YcicqCO7eAB93hRN0rC9pOSD3mNBJPvFulCM
         1P1YbVmaB6q9UNfZeKNRFi2bxvrJENjlUStQ8JHKnO86431k3hQoB3vXJBFXZF9iQkjA
         /ETQ==
X-Gm-Message-State: AOAM530wjgNcOW6DYGuWgjDBJ/YXY4rLn2V/chjURHfwK8wT7JAFujQF
        xXG9MnEEcXzYpPQkc3XwE2CowLHIlmnU+8RWzBA=
X-Google-Smtp-Source: ABdhPJxf5jI1RXYckQGV+wx7dKKVWn1ugXLTjgcGK4PMkbXSCvBGlxwDTgUHZ+uemj9VkpW9BVvRAh6H2qIw5tssuHA=
X-Received: by 2002:a05:6122:b72:: with SMTP id h18mr949370vkf.1.1625157854220;
 Thu, 01 Jul 2021 09:44:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210629154740.3091884-1-sean.anderson@seco.com>
 <9edd6194-3a71-4f31-dd39-ba831e00b9d8@lucaceresoli.net> <3feea852-cd59-520a-ec60-5dd1c1c7a824@seco.com>
 <b546c671-2bec-4db7-2f5d-63c97c3a3258@lucaceresoli.net> <CAMuHMdWau7XH_Krpws6U_n1GeX-AFh139PsrmOux-5oO2DwNuA@mail.gmail.com>
 <af422b9e-8820-5c43-527a-ca1d9ee413f6@seco.com>
In-Reply-To: <af422b9e-8820-5c43-527a-ca1d9ee413f6@seco.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 1 Jul 2021 18:44:03 +0200
Message-ID: <CAMuHMdUYwEJ8Jauv1vdou_5kyx7WhMan8Zkme55LJixMqPCqKQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Luca Ceresoli <luca@lucaceresoli.net>,
        linux-clk <linux-clk@vger.kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Sean,

On Thu, Jul 1, 2021 at 5:52 PM Sean Anderson <sean.anderson@seco.com> wrote:
> On 6/30/21 5:12 AM, Geert Uytterhoeven wrote:
> > On Wed, Jun 30, 2021 at 9:57 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> >> On 29/06/21 23:41, Sean Anderson wrote:
> >> > On 6/29/21 5:23 PM, Luca Ceresoli wrote:
> >> >> On 29/06/21 17:47, Sean Anderson wrote:
> >> >>> These properties allow configuring the SD/OE pin as described in the
> >> >>> datasheet.
> >> >>
> >> >> *Many* thanks for addressing this issue so quickly!
> >> >>
> >> >>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> >
> >> >>> a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >> >>> b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >> >>> index 28675b0b80f1..51f0f78cc3f4 100644
> >> >>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >> >>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >> >>> @@ -30,6 +30,22 @@ description: |
> >> >>>      3 -- OUT3
> >> >>>      4 -- OUT4
> >> >>>
> >> >>> +  The idt,(en|dis)able-shutdown and idt,output-enable-active-(high|low)
> >> >>> +  properties control the SH (en_global_shutdown) and SP bits of the
> >> >>> +  Primary Source and Shutdown Register, respectively. Their behavior is
> >> >>> +  summarized by the following table:
> >> >>> +
> >> >>> +  SH SP Output when the SD/OE pin is Low/High
> >> >>> +  == == =====================================
> >> >>> +   0  0 Active/Inactive
> >> >>> +   0  1 Inactive/Active
> >> >>> +   1  0 Active/Shutdown
> >> >>> +   1  1 Inactive/Shutdown
> >> >>> +
> >> >>> +  If no properties related to these bits are specified, then they will
> >> >>> +  be left in their default state. This may be useful if the SH and SP
> >> >>> +  bits are set to a default value using the OTP memory.
> >> >>
> >> >> This paragraph looks more an implementation description than a hardware
> >> >> description.
> >> >
> >> > It of course *is* an implementation description. As Geert found out, it
> >> > is important to keep the defaults if none of these properties are
> >> > specified.
> >>
> >> DT should describe hardware, not implementation. The difference is
> >> subtle at times, but it is important. Other OSes, bootloaders,
> >> firmwares, whatever can have a totally different implementation but use
> >> the same DT.
> >
> > In general, it's best for a driver not to rely on any preprogramming
> > done by e.g. the bootloader before.
>
> This is part of the reason I wanted to add these properties in the first
> place. I'm working on a board where one version has had the OTP
> programmed, and one version has not. But of course, if we set these bits
> in software then I do not have to worry about whether the OTP has set up
> something sane.
>
> >
> > The concept of "One-Time Programming (OTP) bits" adds yet another
> > dimension to the already complicated boot chain of dependencies.
> > But due to the one-time feature I consider that more stable than
> > other firmware, which can be upgraded, causing changed behavior,
> > unlike OTP bits.
> >
> >> Perhaps these properties might be made mandatory later, after upgrading
> >> all DTs (at least those in mainline Linux). and a grace period.
> >
> > Yes, they should be marked as required.
>
> I don't think I can do that without going through all existing users and
> defining these properties for them. Otherwise, dt_bindings_check will
> complain. I believe (but please correct me if I'm wrong) that patches
> are not to introduce new warnings.
>
> However, setting these propreties is not possible for me to do; I would
> need someone familiar with their board to determine how the SD/OE pin is
> used, and what the correct setting is.

Sure, we can only make them required once all in-tree DTS files have been
fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
