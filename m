Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76788C11F65
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 09:12:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5824061D06
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jun 2021 09:12:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233675AbhF3JPR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jun 2021 05:15:17 -0400
Received: from mail-vs1-f44.google.com ([209.85.217.44]:41505 "EHLO
        mail-vs1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233651AbhF3JPR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jun 2021 05:15:17 -0400
Received: by mail-vs1-f44.google.com with SMTP id c26so1266234vso.8;
        Wed, 30 Jun 2021 02:12:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YFZTpq9AIylHNWWsWaOcMUiQ2RrllyQXnwmltgGyIDg=;
        b=AzN9i4ENEyHAP4SkFLtz6dVeqdXNLfWuoFSwZtl6oODLcuYit4j5/0tzwtpTfqAKQW
         BYrzvCQJrhKZU4t+78Rr2Riad43EYGWUTKw58mOK0sKIHJ0fiaSzdr7unwGEYC/cw0AV
         AVqyYDvqW6LSyk0vhhT03+SZoaN/J2koRUui68DiTuUJGB18ezb9aMds00ORbaqH/E2/
         3C5FtSifmKt4r/VlcJ19sn9MivPKsX4V4T171DKWJ+NWwjpUAtrJiQZDJfaOB/W9MBK0
         VDzaJmasnKsbPe1Elyc53l9J295F9sEGP1gMy3Qp4HydZBDivqjh8W7QDo1VMC4HtXUm
         BHzA==
X-Gm-Message-State: AOAM531+Z6+T/11XFQwRBOH6f/ta4aC81Qb6U3SWKD/zlm72/lrWAn74
        VuLeJvHXzLIVZr4eQcaKONS58wdq7lQNfy7IBwQ=
X-Google-Smtp-Source: ABdhPJy/3BYAY9mZXAbb1TArEJQOgaREV9oEL46JuUVq80QJJz/x1fkY7lImvtwmOYffbg6EK3afpnsSjNCVlDT3j2I=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr28623235vsd.42.1625044368219;
 Wed, 30 Jun 2021 02:12:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210629154740.3091884-1-sean.anderson@seco.com>
 <9edd6194-3a71-4f31-dd39-ba831e00b9d8@lucaceresoli.net> <3feea852-cd59-520a-ec60-5dd1c1c7a824@seco.com>
 <b546c671-2bec-4db7-2f5d-63c97c3a3258@lucaceresoli.net>
In-Reply-To: <b546c671-2bec-4db7-2f5d-63c97c3a3258@lucaceresoli.net>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 30 Jun 2021 11:12:36 +0200
Message-ID: <CAMuHMdWau7XH_Krpws6U_n1GeX-AFh139PsrmOux-5oO2DwNuA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Sean Anderson <sean.anderson@seco.com>,
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

Hi Luca,

On Wed, Jun 30, 2021 at 9:57 AM Luca Ceresoli <luca@lucaceresoli.net> wrote:
> On 29/06/21 23:41, Sean Anderson wrote:
> > On 6/29/21 5:23 PM, Luca Ceresoli wrote:
> >> On 29/06/21 17:47, Sean Anderson wrote:
> >>> These properties allow configuring the SD/OE pin as described in the
> >>> datasheet.
> >>
> >> *Many* thanks for addressing this issue so quickly!
> >>
> >>> Signed-off-by: Sean Anderson <sean.anderson@seco.com>

> >>> a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >>> b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >>> index 28675b0b80f1..51f0f78cc3f4 100644
> >>> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >>> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >>> @@ -30,6 +30,22 @@ description: |
> >>>      3 -- OUT3
> >>>      4 -- OUT4
> >>>
> >>> +  The idt,(en|dis)able-shutdown and idt,output-enable-active-(high|low)
> >>> +  properties control the SH (en_global_shutdown) and SP bits of the
> >>> +  Primary Source and Shutdown Register, respectively. Their behavior is
> >>> +  summarized by the following table:
> >>> +
> >>> +  SH SP Output when the SD/OE pin is Low/High
> >>> +  == == =====================================
> >>> +   0  0 Active/Inactive
> >>> +   0  1 Inactive/Active
> >>> +   1  0 Active/Shutdown
> >>> +   1  1 Inactive/Shutdown
> >>> +
> >>> +  If no properties related to these bits are specified, then they will
> >>> +  be left in their default state. This may be useful if the SH and SP
> >>> +  bits are set to a default value using the OTP memory.
> >>
> >> This paragraph looks more an implementation description than a hardware
> >> description.
> >
> > It of course *is* an implementation description. As Geert found out, it
> > is important to keep the defaults if none of these properties are
> > specified.
>
> DT should describe hardware, not implementation. The difference is
> subtle at times, but it is important. Other OSes, bootloaders,
> firmwares, whatever can have a totally different implementation but use
> the same DT.

In general, it's best for a driver not to rely on any preprogramming
done by e.g. the bootloader before.

The concept of "One-Time Programming (OTP) bits" adds yet another
dimension to the already complicated boot chain of dependencies.
But due to the one-time feature I consider that more stable than
other firmware, which can be upgraded, causing changed behavior,
unlike OTP bits.

> Perhaps these properties might be made mandatory later, after upgrading
> all DTs (at least those in mainline Linux). and a grace period.

Yes, they should be marked as required.
But the driver can keep on not touching the bits if none of
the new properties is specified.

BTW, I didn't check the datasheet, but is there a way to read the OTP
bits from software?  If yes, the driver could use these values if the
new properties are not present.  That would make the system more
robust, as it would reset the values (if ever changed) to a sane
state in case of a soft reboot.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
