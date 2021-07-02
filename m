Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA98C07E95
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 21:15:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD9A4613FC
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 21:15:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231472AbhGBVS3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 17:18:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:49284 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231234AbhGBVS3 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 2 Jul 2021 17:18:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id EC40D613F7;
        Fri,  2 Jul 2021 21:15:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1625260557;
        bh=4wFLQ48wFThUcK/CfYJTsCWt3xeAD1rkzdwUUptSxcM=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=q2wxxqSCoXscRVU8OwfWM9q3pstnA41nE10TT6TZmVkUGQoeFo1CUuL2ValWaX8St
         Xm/+jQmMw94OPsngB3wDk5NOoCgB6FAmOwLd5COs2aQ8Xr8TPIDMyTv17vqubHWt+d
         8DLK+JKqoN/Z4OH2akvs/Otm09XzRHky0tzsvN3L9u4+vKbWNFFn1v1x3HfAjoMyX8
         9VGKW0d1M4JURaXYlIewpyOtPvMa0mm9PBSFwZbKOjWtbAJpyq1iISWkOlLhvHJeKe
         qFV7JYpNcxmy117E+OLCqn2Arat5TKH5TCGLZMvfypuTCEBRXa+P5F0+pGJn8ZzVuJ
         EeJz9vxEaVNTg==
Received: by mail-ej1-f45.google.com with SMTP id nd37so18280578ejc.3;
        Fri, 02 Jul 2021 14:15:56 -0700 (PDT)
X-Gm-Message-State: AOAM533Qwd7J9GGBDALoi/MNp83LBdRjY0CjjAp7nAtFe//E28SNVN1v
        CZZrUHB4fEyjZmXWEtrclWbCthE/TWhjNxUiOA==
X-Google-Smtp-Source: ABdhPJxk2/HCaUznen7fVVUzuE+saFITZAgN6nH5c+BczYgZyBXeUtvLDlOQwjFUYQwMwlv/sQHEWu1ogJg2MuNrlYQ=
X-Received: by 2002:a17:906:b18d:: with SMTP id w13mr1719514ejy.341.1625260555469;
 Fri, 02 Jul 2021 14:15:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210701182012.3421679-1-sean.anderson@seco.com>
 <CAMuHMdVfeWH9G3sh3REfqYp8v3KHmX712Ar8XRxZpg9NWoVfGQ@mail.gmail.com>
 <c1f93c0f-a155-a487-c168-b82e135d1781@seco.com> <20210702151805.GA439387@robh.at.kernel.org>
In-Reply-To: <20210702151805.GA439387@robh.at.kernel.org>
From:   Rob Herring <robh@kernel.org>
Date:   Fri, 2 Jul 2021 15:15:43 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+akWGskGUxLp38cMRgr5uXiRbdhuZwxYEkouQhWNyL2g@mail.gmail.com>
Message-ID: <CAL_Jsq+akWGskGUxLp38cMRgr5uXiRbdhuZwxYEkouQhWNyL2g@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 2, 2021 at 9:18 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jul 02, 2021 at 11:07:57AM -0400, Sean Anderson wrote:
> >
> >
> > On 7/2/21 3:14 AM, Geert Uytterhoeven wrote:
> > > Hi Sean,
> > >
> > > On Thu, Jul 1, 2021 at 8:20 PM Sean Anderson <sean.anderson@seco.com> wrote:
> > >> These properties allow configuring the SD/OE pin as described in the
> > >> datasheet.
> > >>
> > >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> > >> ---
> > >>
> > >> Changes in v4:
> > >> - Specify that bindings should specify these properties, but don't make
> > >>   any guarantees about the driver's behavior when they are not present.
> > >> - Clarify description of idt,(en|dis)able-shutdown properties.
> > >> - Make opposing properties mutually exclusive.
> > >> - Add these properties to the example.
> > >
> > > Thanks for the update!
> > >
> > >> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > >> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> > >
> > >> @@ -109,6 +152,22 @@ allOf:
> > >>        required:
> > >>          - clock-names
> > >>          - clocks
> > >> +  - if:
> > >> +      true
> > >> +    then:
> > >> +      oneOf:
> > >> +        - required:
> > >> +            - idt,enable-shutdown
> > >> +        - required:
> > >> +            - idt,disable-shutdown
> > >> +  - if:
> > >> +      true
> > >> +    then:
> > >> +      oneOf:
> > >> +        - required:
> > >> +            - idt,output-enable-active-high
> > >> +        - required:
> > >> +            - idt,output-enable-active-low
> > >
> > > Do you really need the "if: true then:"?
> > > Just the "oneOf: ..." worked fine for me in another binding, but then I
> > > didn't have a surrounding "allOf" to interfere...
> >
> > Yes. If you want to have multiple oneOfs, they have to go under an
> > allOf. And allOf *only* allows if statements. This is a pretty big
> > deficiency, IMO, but not something I can address here.
>
> Humm, we should relax that, not work around it.

I've now relaxed this restriction in dt-schema master.

Rob

P.S. I probably broke something because it's Friday afternoon before
going on holiday for a week (so I'll do a tagged release when back).
