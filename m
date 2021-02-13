Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD232C433DB
	for <linux-clk@archiver.kernel.org>; Sat, 13 Feb 2021 01:18:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE0A764E8E
	for <linux-clk@archiver.kernel.org>; Sat, 13 Feb 2021 01:18:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhBMBRw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Feb 2021 20:17:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbhBMBRq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Feb 2021 20:17:46 -0500
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FBEC061756
        for <linux-clk@vger.kernel.org>; Fri, 12 Feb 2021 17:17:06 -0800 (PST)
Received: by mail-qk1-x735.google.com with SMTP id h8so1456098qkk.6
        for <linux-clk@vger.kernel.org>; Fri, 12 Feb 2021 17:17:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mTEbv5UNbSTlYB1xm32x9/DCqXjo1QtRBFU8/a0HqNA=;
        b=pHzRw8KSl/NOw8kNlFNbA9bpBrNgc14HZimZ4rnKUaZGHNNs+Q4oSdFLhUTOlyW2c+
         cFuCbWYTyWVx84Ee649373Tr7VG3szkZH1PF0jeoneZ630F7qYHlw7N0W+Fqsx8iQRrH
         htYT7DQ4b5cEUJYTigzRLK7UZ8JYJw46C37vQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mTEbv5UNbSTlYB1xm32x9/DCqXjo1QtRBFU8/a0HqNA=;
        b=lcPolbtYIPw0ne7xF3yFU+PmnG4k3G4RLxQk/Nv8sOeiseI9LCAErkexKOGU8y7K6k
         Ons51N4Ap4sB5WMMzABZ/4UQ/XaMlcchR74wwPDz0r4TOyhg0kh0yreo0oXzeBItj4H7
         dr7OEmAqf53vGkcW0ULSoRwv083KFt0MPF5Jl7bKSjKnr/kAUNS68u8pdrC9x/hC6iV0
         ZyF8rhwYnH76spLhqswzXm9Mg15goikC0p9wqtp9Sfh6GjI6jkqBiVdwpV+tXBJ8QPdn
         +e5qpsg1fBe3qgfvu9pFC4+w0UUKWdGNR1P2fHgTqPzLXwr0KeJwi+3wefDHdTw3F28h
         kjng==
X-Gm-Message-State: AOAM532NDlNPDplwv3b/cpLLvA1xMQAp/sRfT84YFDla5H8lQ6kgtGEz
        X3eJulm5oqdO3MsHXjnC2Y5/7NWp2Cso0Nba91c8kA==
X-Google-Smtp-Source: ABdhPJxIcWVe9/GQdJ9gQ61xMbgGggEPVTVmkiUHQj1/Wb9bBIqZlbXQcht/hgLm0X9lJs8edVu/G9kMV+iikB2Tz9c=
X-Received: by 2002:a37:7c84:: with SMTP id x126mr5593134qkc.390.1613179025739;
 Fri, 12 Feb 2021 17:17:05 -0800 (PST)
MIME-Version: 1.0
References: <20210212111649.3251306-1-daniel@0x0f.com> <20210212111649.3251306-2-daniel@0x0f.com>
 <161317510165.1254594.14810451393733659018@swboyd.mtv.corp.google.com>
In-Reply-To: <161317510165.1254594.14810451393733659018@swboyd.mtv.corp.google.com>
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Sat, 13 Feb 2021 10:18:14 +0900
Message-ID: <CAFr9PXmhnW8PgdZ7i3W2J0SGfW5sNfYd6cHDMSt_E_4Z9XNbUg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/1] dt-bindings: clk: Mstar msc313 clkgen mux
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     DTML <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On Sat, 13 Feb 2021 at 09:11, Stephen Boyd <sboyd@kernel.org> wrote:
> > +examples:
> > +  - |
> > +    clkgen_mux_mspi0: clkgen_mux_mspi0 {
> > +      compatible = "mstar,msc313-clkgen-mux";
> > +      regmap = <&clkgen>;
> > +      offset = <0xcc>;
> > +      #clock-cells = <1>;
> > +      mstar,gate = <0>;
> > +      mstar,mux-shift = <2>;
> > +      mstar,mux-width = <2>;
>
> It looks like a node-per clk sort of binding which has been rejected
> multiple times in the past. If the clks are spread across various
> devices then it sounds like the mediatek design where they have many
> syscon nodes that also register clks inside those register spaces. In
> this case, I would expect the clkgen node to be registering clks. Given
> that there isn't a reg property and there's these mstar specific
> properties like shift/width it looks really wrong. Please don't do this.

Ok. I will rethink this. One of the problems I face here is that there
isn't any documentation for what the clkgen looks like.
I have a list of offsets and bit positions for these muxes but very little else.
Looking at the mediatek clock drivers it seems like they have a driver
that consumes some register areas and then creates all of the muxes
etc within those areas within the driver instead. If that's an
acceptable solution I will go for that.
There would probably be 2 compatible strings right now (one for the pm
area and one for the normal area) and that would take a phandle to the
syscon that holds the registers. Then there would be a big table of
the offsets, masks etc in the driver.

Thanks,

Daniel
