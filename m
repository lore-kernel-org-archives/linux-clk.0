Return-Path: <SRS0=rTxN=ID=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A93FDC433DB
	for <linux-clk@archiver.kernel.org>; Fri,  5 Mar 2021 20:13:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 619DC6509A
	for <linux-clk@archiver.kernel.org>; Fri,  5 Mar 2021 20:13:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229730AbhCEUMk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Mar 2021 15:12:40 -0500
Received: from mail-ot1-f50.google.com ([209.85.210.50]:34988 "EHLO
        mail-ot1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229711AbhCEUMU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Mar 2021 15:12:20 -0500
Received: by mail-ot1-f50.google.com with SMTP id r19so3026636otk.2;
        Fri, 05 Mar 2021 12:12:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=875edoqPTwLaeBdP/hCdLSycFekTh6YOomAg2kS4rbA=;
        b=cgjtLFmYOgsbMJKoJlgwe0oGSBeGPtHxAi3mR2YQtZ5YJlVQpzn6nOM1bJjWuXioOI
         ywG8mpA6BlDJEj7Dw5wJhvhuj9PNXOchfecQsomhvZDlSHXgmvBY5HX/ezwbYEoZuv1/
         rKHE0ieLU6Hdme7dzV94xmw6hf5ejIYGQBdAbxJByTzKpwNa8MqgErCzfk7Bho/k/db3
         DCLKwnbjaOdvOfPvdgA3/KeBMgc2SrDIDwl9SEclNphrAsPH52TvqMDb1k0U0xemNCxR
         bJe2G5GV1zdEeVEzuUI74ZaqOEwt1KU40odwETPcoY5OZzZLL87ByV6YuCWLdJ1YClNY
         WyIA==
X-Gm-Message-State: AOAM532zqoMZgMNH1WTRb+rvtVr4aoQk7tjEdQM2VPpf+b95wqjrgLQT
        Wh0khXbcp0oRglzxUcNUaQ==
X-Google-Smtp-Source: ABdhPJyBVM0+iUTlVIlobVptbL3vhLdst0ZaqdYIXlYlckZTxsKq8Cqti45jYgHdFWiUkayoh3n6Bg==
X-Received: by 2002:a9d:6e01:: with SMTP id e1mr9410538otr.74.1614975139693;
        Fri, 05 Mar 2021 12:12:19 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n1sm748614oog.31.2021.03.05.12.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Mar 2021 12:12:18 -0800 (PST)
Received: (nullmailer pid 571580 invoked by uid 1000);
        Fri, 05 Mar 2021 20:12:18 -0000
Date:   Fri, 5 Mar 2021 14:12:18 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Palmer <daniel@0x0f.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] dt-bindings: clk: Mstar msc313 clkgen mux
Message-ID: <20210305201218.GA568065@robh.at.kernel.org>
References: <20210212111649.3251306-1-daniel@0x0f.com>
 <20210212111649.3251306-2-daniel@0x0f.com>
 <161317510165.1254594.14810451393733659018@swboyd.mtv.corp.google.com>
 <CAFr9PXmhnW8PgdZ7i3W2J0SGfW5sNfYd6cHDMSt_E_4Z9XNbUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFr9PXmhnW8PgdZ7i3W2J0SGfW5sNfYd6cHDMSt_E_4Z9XNbUg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Feb 13, 2021 at 10:18:14AM +0900, Daniel Palmer wrote:
> Hi Stephen,
> 
> On Sat, 13 Feb 2021 at 09:11, Stephen Boyd <sboyd@kernel.org> wrote:
> > > +examples:
> > > +  - |
> > > +    clkgen_mux_mspi0: clkgen_mux_mspi0 {
> > > +      compatible = "mstar,msc313-clkgen-mux";
> > > +      regmap = <&clkgen>;
> > > +      offset = <0xcc>;
> > > +      #clock-cells = <1>;
> > > +      mstar,gate = <0>;
> > > +      mstar,mux-shift = <2>;
> > > +      mstar,mux-width = <2>;
> >
> > It looks like a node-per clk sort of binding which has been rejected
> > multiple times in the past. If the clks are spread across various
> > devices then it sounds like the mediatek design where they have many
> > syscon nodes that also register clks inside those register spaces. In
> > this case, I would expect the clkgen node to be registering clks. Given
> > that there isn't a reg property and there's these mstar specific
> > properties like shift/width it looks really wrong. Please don't do this.
> 
> Ok. I will rethink this. One of the problems I face here is that there
> isn't any documentation for what the clkgen looks like.

All the more reason to not do a node per clock.

> I have a list of offsets and bit positions for these muxes but very little else.
> Looking at the mediatek clock drivers it seems like they have a driver
> that consumes some register areas and then creates all of the muxes
> etc within those areas within the driver instead. If that's an
> acceptable solution I will go for that.
> There would probably be 2 compatible strings right now (one for the pm
> area and one for the normal area) and that would take a phandle to the
> syscon that holds the registers. Then there would be a big table of
> the offsets, masks etc in the driver.

Ideally, the 'syscon' is just the clock provider or a child node is.

Rob
