Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AC27C433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Nov 2022 11:32:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229980AbiKULcf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Nov 2022 06:32:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231410AbiKULcG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Nov 2022 06:32:06 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 144D8BFF5A
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 03:27:05 -0800 (PST)
Received: from mail-yb1-f199.google.com (mail-yb1-f199.google.com [209.85.219.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 94E543F128
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 11:27:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1669030023;
        bh=nVDeZyW08L6nlsmG9j40la0+32+2f6F/+Ex3JCMFolQ=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=RMHBFopqbrm4ahbWARLygpU613O26PLOhmQ7ewl7YFyhIaYddu0Y4lhaWmxm+5B1b
         99pGBB3uWuKGC0p0rKtg2PFT5Wq48e4cSDxqNa1NPvvPdTNrvsb0QxC0TFM0mwHl9n
         WFLOc0jtTAE2yiXWUWDgHPJSIgwZrJMRPvncPES6hK/ikpwyab+XEPRB3oBW/nHWje
         e82V0ayXkCL/OUvLHQOdngGvCWR5vH5cy+xf7SLjOdThZX5axpb/cYCeFyh4qDbGIU
         UYrMh04NcAnkx9nTjAiufQM7qYQBrDE2B3BWU5j5bMYMrzXKrV7l0OZ6w0d5FVGIGm
         H6fp9UjriSutg==
Received: by mail-yb1-f199.google.com with SMTP id a1-20020a056902056100b006e6f103d4c1so10895049ybt.23
        for <linux-clk@vger.kernel.org>; Mon, 21 Nov 2022 03:27:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nVDeZyW08L6nlsmG9j40la0+32+2f6F/+Ex3JCMFolQ=;
        b=cQa+pQY2T0Arpxb4W0sXd2HE+jhHk36QP/3ZnZcXAukyWvL6QBxkFkKC8bOkMRI6gR
         pPabTyjnYNTeaQagvtm7K4ko8L4G7OK/WwCwfFoL4B8hIzKJb09Yvakqe9lirFYlgnlr
         iYgiMJwc3YwEmA3nlOarrhShIViaTRYVTPKhI7gJVM/icfRVSU2tojs0EJCVKvZwdM72
         GAaMZY6W01Qvw21z8e6kuBe37rC2yPwH28Dvo11079LeJmsjbjbCq55x7sgYvzfrDPxQ
         NcrdJgEUP0hYC6Qxdn/AMr8E0GUDfzVY3XvScHFMHNHUe8jEiUG8YSeOt2SxavUBJ426
         KZsA==
X-Gm-Message-State: ANoB5pmhlg34pJ6Qn5Agu6D28/CazdXLUb9xlvEM++dDDQ8GlP/ejLoK
        SJiWaLwONyB6xP2IyT9WtSJF0xnt4khkgG8CL9PN5zUk/pOEPOpTTtMJpau/nkfxG4PNZERgcwP
        +/LojITIZhiKzoTvygHBjjrWixZAWao6RqbvoyldhcfnPWJgnn24lVQ==
X-Received: by 2002:a81:7287:0:b0:36d:451:1ae3 with SMTP id n129-20020a817287000000b0036d04511ae3mr17133995ywc.412.1669030022444;
        Mon, 21 Nov 2022 03:27:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7BNoHMhxvvMA27fb1kHBCpUPwqHXSX7q0wPPmbNiJG25wYB+LqAmx8G+JjyU2pjpZ5G11Fsrh4Vg711umxRCY=
X-Received: by 2002:a81:7287:0:b0:36d:451:1ae3 with SMTP id
 n129-20020a817287000000b0036d04511ae3mr17133979ywc.412.1669030022234; Mon, 21
 Nov 2022 03:27:02 -0800 (PST)
MIME-Version: 1.0
References: <20221118010627.70576-1-hal.feng@starfivetech.com>
 <20221118010627.70576-5-hal.feng@starfivetech.com> <CAJM55Z8z9OLU5_Z0HiyKN0mMZHrKSkGJqbP_1QOw3nEt6b5MxQ@mail.gmail.com>
 <4dd7ebaf-89db-3c22-e8bc-e9f7211fa06b@starfivetech.com>
In-Reply-To: <4dd7ebaf-89db-3c22-e8bc-e9f7211fa06b@starfivetech.com>
From:   Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date:   Mon, 21 Nov 2022 12:26:45 +0100
Message-ID: <CAJM55Z-eQMXES0v4m-a6THyydyCDhqD0=ETjk8_bWxTw_Q5sLw@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] reset: starfive: Factor out common JH71X0 reset code
To:     Hal Feng <hal.feng@starfivetech.com>
Cc:     "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Conor Dooley <conor@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 21 Nov 2022 at 10:24, Hal Feng <hal.feng@starfivetech.com> wrote:
>
> On Sat, 19 Nov 2022 00:39:35 +0800, Emil Renner Berthing wrote:
> > On Fri, 18 Nov 2022 at 02:06, Hal Feng <hal.feng@starfivetech.com> wrote:
> > > diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/reset/starfive/reset-starfive-jh71x0.c
> > > similarity index 50%
> > > copy from drivers/reset/starfive/reset-starfive-jh7100.c
> > > copy to drivers/reset/starfive/reset-starfive-jh71x0.c
> > > index fc44b2fb3e03..1e230f3f9841 100644
> > > --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> > > +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
>
> [...]
>
> > > -static int __init jh7100_reset_probe(struct platform_device *pdev)
> > > +int reset_starfive_jh7100_register(struct device *dev, struct device_node *of_node,
> > > +                                  void __iomem *assert, void __iomem *status,
> > > +                                  const u64 *asserted, unsigned int nr_resets,
> > > +                                  bool is_module)
> > >  {
> > >         struct jh7100_reset *data;
> > >
> > > -       data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
> > > +       data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > >         if (!data)
> > >                 return -ENOMEM;
> > >
> > > -       data->base = devm_platform_ioremap_resource(pdev, 0);
> > > -       if (IS_ERR(data->base))
> > > -               return PTR_ERR(data->base);
> > > -
> > >         data->rcdev.ops = &jh7100_reset_ops;
> > > -       data->rcdev.owner = THIS_MODULE;
> > > -       data->rcdev.nr_resets = JH7100_RSTN_END;
> > > -       data->rcdev.dev = &pdev->dev;
> > > -       data->rcdev.of_node = pdev->dev.of_node;
> > > +       if (is_module)
> > > +               data->rcdev.owner = THIS_MODULE;
> >
> > nit: consider just passing the owner directly, so this would just be
> > data->rcdev.owner = owner;
> >
> > ..and callers that used false can just pass NULL.
>
> Yeah, will fix it.
>
> >
> > > +       data->rcdev.nr_resets = nr_resets;
> > > +       data->rcdev.dev = dev;
> > > +       data->rcdev.of_node = of_node;
> >
> > Is it important to register this with the auxiliary device and not
> > just use the parent device?
>
> I'm not sure whether it still works if we use the same device,

Try it.

> but
> it's general to separate the devices of clock and reset. They have
> different device names and different drivers.
>
> Best regards,
> Hal
>
> > If not you can just always pass the device that has the right of_node
> > and have this be
> >
> > data->rcdev.of_node = dev->of_node;
> >
> > > +
> > >         spin_lock_init(&data->lock);
> > > +       data->assert = assert;
> > > +       data->status = status;
> > > +       data->asserted = asserted;
> > >
> > > -       return devm_reset_controller_register(&pdev->dev, &data->rcdev);
> > > +       return devm_reset_controller_register(dev, &data->rcdev);
> > >  }
>
