Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C72BBC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jan 2022 09:32:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349274AbiAKJcy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jan 2022 04:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236995AbiAKJcx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jan 2022 04:32:53 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04922C06173F
        for <linux-clk@vger.kernel.org>; Tue, 11 Jan 2022 01:32:53 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id v123so10534519wme.2
        for <linux-clk@vger.kernel.org>; Tue, 11 Jan 2022 01:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=LMy8F7bXkWrfEku+dhz2YISyVBkNNTuMoqdf7ZkD0To=;
        b=swXL9gRXyWFnGDtv9BadckJ6mLhM/69zfWU8+ocZOa4z77GDZ8hKX0DOB+IIRfXo+x
         b674NAHat2ChsOGpuPvzN/U3YLXZyFBO4hmbtepec/oXDUnmVHK4Ebt9s41Vl8Wc8MNX
         nrA2tpPjnjIAnICQLZjtg4UV4b6iTP5OImqH8UEpFlJkZ/vzL00kYYg44u2zjAOtIyKa
         /6xKppWMPDmcz6K60WT/NXf77pvlHdaEiLHIaoXPVLkGVzaUEBNLI7jJ72q6nsIJ7401
         L5zwEFYwKbcsEKnFcjL5eS1n2WQ5bhgV1FcYc+2zPJtOPHAi4QHPVLQeyfJaSVvBs7aN
         e+og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=LMy8F7bXkWrfEku+dhz2YISyVBkNNTuMoqdf7ZkD0To=;
        b=YM6BpQCOy4EkQqLSyXviLuvdrpvSZnwuXhYMJ2CfUYCoS8KaJMe/kVkOCYYJC2WQ0t
         UbbWhVlZPd1PMUBou5A4+QKXtL0ptUUJQp4mH2ambdh9NpVYibZc+BRsAlkWiah3nzdg
         ACVZvp6+uQfDtd7XGMD8v/BtYhCLCo7ebvkkTWF7Tpm/OJgrS8EfcmL0AtVM0dZL2xoZ
         DmJp0vsh4AgBPrtJGhRoxgwNxIV6VHkqRHw1/QM0N9yckwDI0Us1EZ+bmbpluh8PCyLP
         XHhg9c404t88H2GxDzXek7zyr4KRbB8Ua6L3dJZOTLu/oL06tVaRAK8mKVhIhJfFwOrB
         2IGQ==
X-Gm-Message-State: AOAM532BT4odnriFa4QRz/RdRO/2Qn5Tdq+0/NzYlRLRjwLkKD18kjEa
        1KSVRQkO2dCzAYG1AhkaSCDhxw==
X-Google-Smtp-Source: ABdhPJwQ6g3l92q6YTIRewH/TedS5Xf7kkSd9jd60tQw54xnN2pnwEFRMhX7cN9SGsdpzYFiPEF0gA==
X-Received: by 2002:a1c:f70d:: with SMTP id v13mr1624941wmh.133.1641893571493;
        Tue, 11 Jan 2022 01:32:51 -0800 (PST)
Received: from google.com ([31.124.24.179])
        by smtp.gmail.com with ESMTPSA id b14sm8798529wrg.15.2022.01.11.01.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jan 2022 01:32:51 -0800 (PST)
Date:   Tue, 11 Jan 2022 09:32:44 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Zong Li <zong.li@sifive.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-riscv <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v3 RESEND] clk: sifive: Fix W=1 kernel build warning
Message-ID: <Yd1OvFZ4pKw+aTgv@google.com>
References: <20220107090715.2601-1-zong.li@sifive.com>
 <YdwBWmF8OJYab7qS@google.com>
 <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANXhq0ookagQTZZrNduP5DjXs2awQdRkUxNzTWU=-dz+TVuUwg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 11 Jan 2022, Zong Li wrote:

> On Mon, Jan 10, 2022 at 5:50 PM Lee Jones <lee.jones@linaro.org> wrote:
> >
> > Please improve the subject line.
> >
> > If this is a straight revert, the subject line should reflect that.
> >
> > If not, you need to give us specific information regarding the purpose
> > of this patch.  Please read the Git log for better, more forthcoming
> > examples.
> >
> 
> It seems to me that this patch is not a straight revert, it provides
> another way to fix the original build warnings, just like
> '487dc7bb6a0c' tried to do. I guess the commit message has described
> what the original warnings is and what the root cause is, it also
> mentioned what is changed in this patch. I'm a bit confused whether we
> need to add fixes tag, it looks like that it might cause some
> misunderstanding?

I think it's the patch description and subject that is causing the
misunderstanding.

Please help me with a couple of points and I'll help you draft
something up.

Firstly, what alerted you to the problem you're attempting to solve?

> > > --- a/drivers/clk/sifive/fu540-prci.c
> > > +++ b/drivers/clk/sifive/fu540-prci.c
> > > @@ -20,7 +20,6 @@
> > >
> > >  #include <dt-bindings/clock/sifive-fu540-prci.h>
> > >
> > > -#include "fu540-prci.h"

How is this related to the issue/patch?

> > > +struct prci_clk_desc prci_clk_fu540 = {
> > > +     .clks = __prci_init_clocks_fu540,
> > > +     .num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> > > +};

> > > diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
> > > index c220677dc010..931d6cad8c1c 100644
> > > --- a/drivers/clk/sifive/fu540-prci.h
> > > +++ b/drivers/clk/sifive/fu540-prci.h
> > > @@ -7,10 +7,6 @@
> > > +extern struct prci_clk_desc prci_clk_fu540;

> > > diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
> > > index 80a288c59e56..916d2fc28b9c 100644
> > > --- a/drivers/clk/sifive/sifive-prci.c
> > > +++ b/drivers/clk/sifive/sifive-prci.c
> > > @@ -12,11 +12,6 @@
> > >  #include "fu540-prci.h"
> > >  #include "fu740-prci.h"
> > >
> > > -static const struct prci_clk_desc prci_clk_fu540 = {
> > > -     .clks = __prci_init_clocks_fu540,
> > > -     .num_clks = ARRAY_SIZE(__prci_init_clocks_fu540),
> > > -};
> > > -

I'm not sure if it's you or I that is missing the point here, but
prci_clk_fu540 is used within *this* file itself:

 static const struct of_device_id sifive_prci_of_match[] = {
         {.compatible = "sifive,fu540-c000-prci", .data = &prci_clk_fu540},
         {.compatible = "sifive,fu740-c000-prci", .data = &prci_clk_fu740},
         {}
 };

So why are you moving it out to somewhere it is *not* used and making
it an extern?  This sounds like the opposite to what you'd want?

-- 
Lee Jones [李琼斯]
Principal Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
