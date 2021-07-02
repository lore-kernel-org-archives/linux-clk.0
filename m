Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 733E6C11F68
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 15:18:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5214361423
	for <linux-clk@archiver.kernel.org>; Fri,  2 Jul 2021 15:18:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231145AbhGBPUn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 2 Jul 2021 11:20:43 -0400
Received: from mail-io1-f51.google.com ([209.85.166.51]:37688 "EHLO
        mail-io1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231134AbhGBPUm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 2 Jul 2021 11:20:42 -0400
Received: by mail-io1-f51.google.com with SMTP id b15so12056022iow.4;
        Fri, 02 Jul 2021 08:18:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=WB/Iy++8+d6EwbqT2Vw1Mm04L/H7dKksp6VYeRutpIM=;
        b=lae84tAuWoCdHSvCOb4wvkZUcVzfJrtvGJFD93wsHGrefMo6Pp4K53sLibCSD45s3U
         QFOuf7nEb/tG/eWT4t3FX72uxUJ9m9so/85cdPCDZOVN2QUwiqDH13RsOppwTrZGOz4m
         PScxi2Xq7qeO7IVT4na7/Tx0iaccDibJb35+EMNQhedTeMTDhINzpp7dcCqjUsXDH47p
         XpRR+XDTEHRsx2pbq6tIcPGpA4oP/sjafjDrKU3Kuk5xC0sZFZoCgTEIuqjztNACeIXn
         GYJVEubHLGbEXjZtiFs+gJP3V/WPqzF2z0c2cj7RzuDIxYnffENFjeaGnQEnnS+Cc9hD
         OEMw==
X-Gm-Message-State: AOAM5336NzoxDjcmVngoTi+E3eD98Mf933qW/UH5nSq8ArRuzHsWK8Sz
        Ke9zh2QXaj4h3FjlcxYaWQ==
X-Google-Smtp-Source: ABdhPJx44mOoatPm/ATr1baOIQS1AkjQF5vUY1VUNABlaLY14UMbiHBg9C26NDUHU1DtF1ALOY4Fgw==
X-Received: by 2002:a02:cbd9:: with SMTP id u25mr22685jaq.49.1625239090261;
        Fri, 02 Jul 2021 08:18:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h19sm2073186iow.1.2021.07.02.08.18.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jul 2021 08:18:09 -0700 (PDT)
Received: (nullmailer pid 444120 invoked by uid 1000);
        Fri, 02 Jul 2021 15:18:05 -0000
Date:   Fri, 2 Jul 2021 09:18:05 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [PATCH v4 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
Message-ID: <20210702151805.GA439387@robh.at.kernel.org>
References: <20210701182012.3421679-1-sean.anderson@seco.com>
 <CAMuHMdVfeWH9G3sh3REfqYp8v3KHmX712Ar8XRxZpg9NWoVfGQ@mail.gmail.com>
 <c1f93c0f-a155-a487-c168-b82e135d1781@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c1f93c0f-a155-a487-c168-b82e135d1781@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jul 02, 2021 at 11:07:57AM -0400, Sean Anderson wrote:
> 
> 
> On 7/2/21 3:14 AM, Geert Uytterhoeven wrote:
> > Hi Sean,
> >
> > On Thu, Jul 1, 2021 at 8:20 PM Sean Anderson <sean.anderson@seco.com> wrote:
> >> These properties allow configuring the SD/OE pin as described in the
> >> datasheet.
> >>
> >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> >> ---
> >>
> >> Changes in v4:
> >> - Specify that bindings should specify these properties, but don't make
> >>   any guarantees about the driver's behavior when they are not present.
> >> - Clarify description of idt,(en|dis)able-shutdown properties.
> >> - Make opposing properties mutually exclusive.
> >> - Add these properties to the example.
> >
> > Thanks for the update!
> >
> >> --- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >> +++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> >
> >> @@ -109,6 +152,22 @@ allOf:
> >>        required:
> >>          - clock-names
> >>          - clocks
> >> +  - if:
> >> +      true
> >> +    then:
> >> +      oneOf:
> >> +        - required:
> >> +            - idt,enable-shutdown
> >> +        - required:
> >> +            - idt,disable-shutdown
> >> +  - if:
> >> +      true
> >> +    then:
> >> +      oneOf:
> >> +        - required:
> >> +            - idt,output-enable-active-high
> >> +        - required:
> >> +            - idt,output-enable-active-low
> >
> > Do you really need the "if: true then:"?
> > Just the "oneOf: ..." worked fine for me in another binding, but then I
> > didn't have a surrounding "allOf" to interfere...
> 
> Yes. If you want to have multiple oneOfs, they have to go under an
> allOf. And allOf *only* allows if statements. This is a pretty big
> deficiency, IMO, but not something I can address here.

Humm, we should relax that, not work around it.

Rob
