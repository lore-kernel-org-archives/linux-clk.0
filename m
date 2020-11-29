Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 018E7C5519F
	for <linux-clk@archiver.kernel.org>; Sun, 29 Nov 2020 21:34:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6F6D2078D
	for <linux-clk@archiver.kernel.org>; Sun, 29 Nov 2020 21:34:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LzYwWyNh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728075AbgK2Veb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 29 Nov 2020 16:34:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728015AbgK2Vea (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 29 Nov 2020 16:34:30 -0500
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C59C0617A6
        for <linux-clk@vger.kernel.org>; Sun, 29 Nov 2020 13:33:50 -0800 (PST)
Received: by mail-lj1-x244.google.com with SMTP id f18so14018173ljg.9
        for <linux-clk@vger.kernel.org>; Sun, 29 Nov 2020 13:33:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DRks1S+Ljz02h+7aEMkPQyYH0KJUMNRRjQT6vkjrJ6U=;
        b=LzYwWyNh2aq60HnaalbW2E/tfDV3QS5ABPetwv/LjVocBlaMX7p8EW6wSpLS5A+xb6
         3RYtKYPxh3tlC4eQbu6yQKmPtsDYTe+XHrG3aefbkfkGpkyuGSceFP20lxofOmU62OuZ
         jCDZzZvOeeb9rr+liyzgPtp15kW0t5oMmCWPVHMtFmJUzKwYJoSvUw+IOgwl+OIitkEt
         0GYNtHEFzYR21Fqyfr9LrWkLBvuAdd7WcEJWkhAd5/ypnjcyODBcG34cskFi3J5BnKCE
         bwGyj3H502ljkfysjViKkFi0CqGDKaKGdxv8ZMvvVu2cqiGIfoSS8QAhEPPPNcA5KDjB
         cyMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DRks1S+Ljz02h+7aEMkPQyYH0KJUMNRRjQT6vkjrJ6U=;
        b=qxmuzq67fQlLQPpxQFkWj2r3XhDOJRo/MdWLgSOZ/4OHKFAszYtkw9mksMr8adlqSm
         /4+z9/pVPEnrqKkA4AYRjEu2tp7cJFnoPtq3SmtFStmJ2DhGWyNxf84MiD4rkGP2P+9a
         30+ClebeK4dR6EHKGjO+2k7HFN6/umGUsNZi9m3YncDQZKRIcifiW9mAuShlEweOG6yS
         BYpo6jo/ocyrrGlUxsHTvBwMOc4xF2tl7BszxOS54EjuXScQB7ftQVkxMoQ7piTHNva8
         ZnbRJZXTg/rKG5YodXakDEB4ZbAE2VuZ6BIumSyBrvvRKQ/a9smJpfYJTepoEZVFF9Ck
         5cOg==
X-Gm-Message-State: AOAM530REiOPiKPJaUklAV/m+lnvryHRb8wZ2cMwz9uEAbrl1Z6k1QAr
        43oP5lE/4zObY1wrkQoH1KaHItB6VnhuFXxcqzoAvg==
X-Google-Smtp-Source: ABdhPJytWDlyUMuTJm2jW8TQXYrQA7Ue6rxAsqM+YqSfqeqX2hNWQDHsQOsrBzNYb3DWeZ5mYjjq9y/2I8HLd94BvcY=
X-Received: by 2002:a2e:321a:: with SMTP id y26mr7756884ljy.293.1606685627784;
 Sun, 29 Nov 2020 13:33:47 -0800 (PST)
MIME-Version: 1.0
References: <20201107081420.60325-1-damien.lemoal@wdc.com> <20201107081420.60325-21-damien.lemoal@wdc.com>
 <CACRpkdZhOxz5NhrkFxZ5G4aOrmBoAcQodOvqzNROQtXpHVQGDQ@mail.gmail.com> <CH2PR04MB65228DE061918A4D2A08A0CFE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
In-Reply-To: <CH2PR04MB65228DE061918A4D2A08A0CFE7FB0@CH2PR04MB6522.namprd04.prod.outlook.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Sun, 29 Nov 2020 22:33:36 +0100
Message-ID: <CACRpkdbA_JMiyraKC_3WT26mMUxfuLD=Q_HREmbEB=yNPpuHjw@mail.gmail.com>
Subject: Re: [PATCH 20/32] riscv: Add Kendryte K210 FPIOA pinctrl driver
To:     Damien Le Moal <Damien.LeMoal@wdc.com>
Cc:     Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Serge Semin <fancer.lancer@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 24, 2020 at 9:53 AM Damien Le Moal <Damien.LeMoal@wdc.com> wrote:
> On 2020/11/24 17:43, Linus Walleij wrote:

> > Would also be nice if the maintainer could add some comments?
>
> What do you mean ? I do not understand. scripts/get_maintainer.pl indicates that
> you are the maintainer of the pinctrl drivers subsystem.

Sorry I thought we had a RISCV driver already, and we don't
so this is cool.

> Do you mean adding an
> entry to the MAINTAINER file for this driver ? I can do that and put my self as
> maintainer. Or do you mean you would like a comment from Palmer (riscv arch
> maintainer) ?

That would be nice. Whoever will enthusiastically review patches to
this driver and make sure it works and get modernized should ideally
be listed as maintainer. I suggest you list yourself.

The only input I want from the RISCV arch maintainer would
be on this code:

+/*
+ * Most devices on the K210 SoC depend on pin mapping changes to initialize
+ * correctly. So initialize this driver early as part of the post core
+ * initialization.
+ */
+static int __init k210_fpioa_init(void)
+{
+       return platform_driver_register(&k210_fpioa_driver);
+}
+postcore_initcall(k210_fpioa_init);

This is a bit nasty and we do not recommend it. But I will accept it
if the arch maintainer claims it is necessary. What happens if you
just make it initialize at driver level?

Yours,
Linus Walleij
