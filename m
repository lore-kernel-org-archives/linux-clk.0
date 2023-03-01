Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B350FC64EC7
	for <linux-clk@archiver.kernel.org>; Wed,  1 Mar 2023 01:06:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbjCABGX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Feb 2023 20:06:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbjCABGW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Feb 2023 20:06:22 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD501E2A4;
        Tue, 28 Feb 2023 17:06:21 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id ee7so47707748edb.2;
        Tue, 28 Feb 2023 17:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ntMlB8tUMTxfsC0GrFp2J+8lL/27lfUXu3oM6wbn744=;
        b=PprWuKMV7WpSgqmEXbYQIdsI2Y80bAnVmj++7Ldciu54FpEHWmr99uqdPZ4m6ZXSj1
         4zGCiCRFJu5sC0IZkyHgUhpxTf5+eET3HpQelxrdjoNTxrYaVaYmFTiqK7avD2siqsFp
         lhtalSkVoEpNcm7hhAwrydOtn+egUwai6yFKU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ntMlB8tUMTxfsC0GrFp2J+8lL/27lfUXu3oM6wbn744=;
        b=NVuun93OyGYzuVohfPkG8FHPO0WhogQFIjtN2wdWD/hjnayhx67uUJ7tN3Jq6+g0WM
         0v5lPFgd+BWjwQI4+GRfsKoVdOcdihVxPcYl+DnzLFWKYOw1lR5FEuUuaSeDSYHERDFH
         ZrGDnJaDk9HdFbhSTvyA168shh7OIfGMyVwTDpqht8hKrELr1kF2E4VBKdlRmfbNiH9V
         R1KlXXaGruIH8ROjLC75sFUn7oJo7AoDkMTLfi6Da66blQVKSe6ME30pKRQD9GGXyF+k
         8Kt7V80OB4yajIQ6Mu8ZlKR54MOsgCvvy3i9CmdZG7UeQpWSa/RFguFDoibNuxrcIGw2
         Wh6w==
X-Gm-Message-State: AO0yUKXtys4UtNgPQukKKbw7v1U3OayyXnKKuiFbB3Ln5BcvlteFexl3
        WX7M1jCX2ROs00Ror+Zl7eDYHc/QGmqiLOyAuG8=
X-Google-Smtp-Source: AK7set88rqwV4LYOMsTnEC1Hn1DhWWXoane1rPqIDpdVR8bXYOAQBHwU/oCt/7oEewEy4sUSGldGvTwbi6z+oHuzvXU=
X-Received: by 2002:a17:907:d30d:b0:88d:ba79:4317 with SMTP id
 vg13-20020a170907d30d00b0088dba794317mr9636315ejc.7.1677632779652; Tue, 28
 Feb 2023 17:06:19 -0800 (PST)
MIME-Version: 1.0
References: <20230228091638.206569-1-jk@codeconstruct.com.au>
 <20230228091638.206569-4-jk@codeconstruct.com.au> <CACPK8XfZCaLK+1kRkHa+wvGyt3YCwiZDR7CKRPKxdjuBFH+01Q@mail.gmail.com>
 <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
In-Reply-To: <1024ddf2c4047e5a6cd516809d4d15ea5e0349b6.camel@codeconstruct.com.au>
From:   Joel Stanley <joel@jms.id.au>
Date:   Wed, 1 Mar 2023 01:06:07 +0000
Message-ID: <CACPK8Xfd5UzSC=pnVL+Rn6xj4sFkWBfB27c4O=qX8CjdL=fSqg@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] clk: ast2600: Add full configs for I3C clocks
To:     Jeremy Kerr <jk@codeconstruct.com.au>
Cc:     linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Dylan Hung <dylan_hung@aspeedtech.com>,
        Andrew Jeffery <andrew@aj.id.au>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 1 Mar 2023 at 00:58, Jeremy Kerr <jk@codeconstruct.com.au> wrote:
>
> Hi Joel,
>
> Thanks for the review. Some replies inline:
>
> > > @@ -15,7 +16,7 @@
> > >
> > >  #include "clk-aspeed.h"
> > >
> > > -#define ASPEED_G6_NUM_CLKS             71
> > > +#define ASPEED_G6_NUM_CLKS             72
> >
> > NUM_CLKS seems dangerous. Should we instead use
> > ARRAY_SIZE(aspeed_g6_gates)?
>
> Yep, that would have saved me some time debugging. That would suit as a
> separate change though, would you like it in the same series?

Doesn't matter much. Perhaps include it at the end, for both the
aspeed drivers? But separately is fine too.

>
> > >         /* USB 2.0 port1 phy 40MHz clock */
> > >         hw = clk_hw_register_fixed_rate(NULL, "usb-phy-40m", NULL,
> > > 0, 40000000);
> > >         aspeed_g6_clk_data->hws[ASPEED_CLK_USBPHY_40M] = hw;
> > > +
> > > +       /* i3c clock: source from apll, divide by 8 */
> > > +       regmap_read(map, ASPEED_G6_CLK_SELECTION5, &val);
> > > +       val &= ~(I3C_CLK_SELECTION | APLL_DIV_SELECTION);
> >
> > Is there any value in registering a mux device here? See the emmc
> > extclk device.
>
> We won't be doing any mux configuration here, so I figure the static
> setup is fine.

ack

>
> > > +       val |= FIELD_PREP(I3C_CLK_SELECTION,
> > > I3C_CLK_SELECT_APLL_DIV);
> > > +       val |= FIELD_PREP(APLL_DIV_SELECTION, APLL_DIV_8);
> > > +       regmap_write(map, ASPEED_G6_CLK_SELECTION5, val);
> >
> > This is a departure in style from the existing code. The existing
> > code did things like this:
> >
> >         regmap_update_bits(map, ASPEED_G6_CLK_SELECTION1, GENMASK(10, 8), BIT(10));
> >
> > Which uses the regmap API instead of FIELD_PREP macros.
>
> Yep, that's much nicer, I'll change. The FIELD_PREP parts are just from
> the initial ASPEED implementation.

Cool.
