Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2E5CC25B4E
	for <linux-clk@archiver.kernel.org>; Tue, 24 Jan 2023 08:28:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjAXI23 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 24 Jan 2023 03:28:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjAXI22 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 24 Jan 2023 03:28:28 -0500
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C1D2688;
        Tue, 24 Jan 2023 00:28:26 -0800 (PST)
Received: by mail-qt1-f175.google.com with SMTP id g16so10433650qtu.2;
        Tue, 24 Jan 2023 00:28:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2Nk8GShX5LyBmobalGDGLvAPzTPwxt28vl4/lWIeTZc=;
        b=h/G2eImV4QWScXVaTdUZ7ekOeV5nr4QEKn+R3yJEbY4ByH9P+Y0mXJAwEEKVGu5X7C
         ju8exuqTI5LY+a/R95tu/pmM/wOB75qCZ4MQ+zYJj5CEJcRUF92VAuXZ8PMCGAtkgop+
         9J4sHA/rrzRmRyYZ/wrzHBJD+O/olVROXsA8+OJVkQwly2w/87FS7ay5jvGNcetkQgVe
         A4vCYoJ96z9diDEHx/jOlT2GFnwv3gJcZglLd6fbqcdhmrw5NiOBj3oW9b6FDX6OKHCE
         /rS/TZ3sGQeEN0nQ4apbgx0bqzYT2lD2QX1WLSunqYnbdGAD+pO94jamwBOGNI8XV3Kx
         P38g==
X-Gm-Message-State: AFqh2kqFFfrhRujzMXzcaRBExFeYZrbxNkZcoRLhCh3xiR4Veym08dkL
        6QflpOWLi4daaAvAioYZb0XUbFlaOuYMow==
X-Google-Smtp-Source: AMrXdXud+svVoxONXp54cGAOViiuv7kcautUgUkDqVLqKez433S8ud4RErjPjpLdgp5mkZjl0+ayTw==
X-Received: by 2002:ac8:58c3:0:b0:3b6:3594:3470 with SMTP id u3-20020ac858c3000000b003b635943470mr53349342qta.43.1674548905282;
        Tue, 24 Jan 2023 00:28:25 -0800 (PST)
Received: from mail-yb1-f173.google.com (mail-yb1-f173.google.com. [209.85.219.173])
        by smtp.gmail.com with ESMTPSA id x6-20020ac87306000000b003b34650039bsm828920qto.76.2023.01.24.00.28.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jan 2023 00:28:24 -0800 (PST)
Received: by mail-yb1-f173.google.com with SMTP id b1so12637818ybn.11;
        Tue, 24 Jan 2023 00:28:24 -0800 (PST)
X-Received: by 2002:a25:9801:0:b0:7d5:b884:3617 with SMTP id
 a1-20020a259801000000b007d5b8843617mr2419327ybo.380.1674548904206; Tue, 24
 Jan 2023 00:28:24 -0800 (PST)
MIME-Version: 1.0
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
 <5da02a9b-3d42-a26f-0d18-29a6b5b181e5@seco.com> <20230124091236.1bf8c6da@booty>
In-Reply-To: <20230124091236.1bf8c6da@booty>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 24 Jan 2023 09:28:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
Message-ID: <CAMuHMdV8_+dF03VD6mST2zMDQ68cgsLLRQi6UeXK2jH-eWqWZg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     Sean Anderson <sean.anderson@seco.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-reneas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Luca,

On Tue, Jan 24, 2023 at 9:12 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> On Thu, 19 Jan 2023 14:27:43 -0500
> Sean Anderson <sean.anderson@seco.com> wrote:
> > On 1/11/23 10:55, Geert Uytterhoeven wrote:
> > > "make dtbs_check":
> > >
> > >     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
> > >         From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > >     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
> > >         From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > >
> > > Versaclock 5 clock generators can have their configuration stored in
> > > One-Time Programmable (OTP) memory.  Hence there is no need to specify
> > > DT properties for manual configuration if the OTP has been programmed
> > > before.  Likewise, the Linux driver does not touch the SD/OE bits if the
> > > corresponding properties are not specified, cfr. commit d83e561d43bc71e5
> > > ("clk: vc5: Add properties for configuring SD/OE behavior").
> > >
> > > Reflect this in the bindings by making the "idt,shutdown" and
> > > "idt,output-enable-active" properties not required, just like the
> > > various "idt,*" properties in the per-output child nodes.
> >
> > IMO we should set this stuff explicitly.
>
> I took a moment to think better about this and I think I get your point
> Sean in preferring that the hardware is described in detail.
>
> However I'm still leaning towards approving Geert's proposal.
>
> I'm based on the principle that DT is there to describe the aspects of
> the hardware that the software needs _and_ it is unable to discover by
> itself.
>
> Based on that, does the software need to know SD/OR configuration? If
> they are already written in the OTP then it doesn't. Also if the chip
> default is the use that is implemented on the board, it also doesn't
> (like lots of optional properties, especially when in most cases a
> given chip is used in the default configuration but not always).

These clock generators are typically programmed through OTP because
(at least some of) the configuration is needed to boot the board.

> To some extent, writing settings in an OTP is similar to producing a
> different chip where these values are hard-coded and not configured.

Indeed. Except that here they can still be overwritten by software
later.

The latter is an inherent danger, and is probably the reason why Sean
wants to make it explicit: if the configuration is ever changed by
software, and the system is restarted without resetting the clock
generator (at least 5P49V6901A does not have a reset line), or using
kexec/kdump, the newly booted kernel does not know the intended
settings, and won't restore the correct configuration.

> I'm wondering whether Geert has a practical example of a situation
> where it is better to have these properties optional.

My issue was that these properties were introduced long after the
initial bindings, hence pre-existing DTS does not have them.
Yes, we can add them, but then we have to read out the OTP-programmed
settings first. If that's the way to go, I can look into that, though...

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
