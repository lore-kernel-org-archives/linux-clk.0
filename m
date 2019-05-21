Return-Path: <SRS0=Jypq=TV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDDA7C072B5
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 22:43:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 995FC21773
	for <linux-clk@archiver.kernel.org>; Tue, 21 May 2019 22:43:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sBHQ9lvY"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfEUWnU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 21 May 2019 18:43:20 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:53477 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfEUWnU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 21 May 2019 18:43:20 -0400
Received: by mail-wm1-f67.google.com with SMTP id 198so219283wme.3
        for <linux-clk@vger.kernel.org>; Tue, 21 May 2019 15:43:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rh5zhmB9pIXrzawqY8AKtcg1nijof3Pl+JZMPvAKIzI=;
        b=sBHQ9lvYYxn/XTvH7+SdJa/IDZqqFTmcRI3bdiKSLSVdBpU9GaM3Bu6X25o8dM/3a2
         qI1wkOioqEXX2qHB++OCUs/P4XIPejw/FJK9z8V50OKPZaEa4bzEWIJ+ToAP9P85LVid
         KHU+joijWlZm0cGtqdgbRK9mSKz6GJvrKcjt/Tt735dU3Hx7+CJquNnwAH/ggWevEV1C
         kHweFjDll9zVhB0K4XL9QTFLrZPq19CamY5CNdgnYa5Nff+/ZSAGgQ0BAt09x9KCujos
         PbBWhTCh8P8lBLPGjiKULHPCwYUSajJ5WnP2Fm8BpQuB+dT/5dF0ue/9iT4Q7jAU23lR
         V/7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rh5zhmB9pIXrzawqY8AKtcg1nijof3Pl+JZMPvAKIzI=;
        b=qMLoFpGV1mUNHZY9kvtZ6lG8jhq84ELrpNJNSerPxjDDcIMsfss1urnRc/A1hWlQeK
         DoUa4mBvOsL/eVLw8eqkQKM8JRjHQpFv1dAkwj5DNe0PFPEgjzPIfxv9cKk2oWz72DYC
         Ikny8VUR/nktOM2zxuYkhEkk1MEAYPfr94Th/H+IwEw2X73okX4rmFuUt8JpkoSVrxzm
         PuZRpugdbXpuw5eC4DbUN8e+LrfSHt+ZlNjhwmVkohtRn5//1+W7w4ZH2TvrZpdNff2O
         YRLi52BcYSwzWY6Z7uGtbWyVXdVDFERW7+vS4Z+PcWq1pfM1Gj8/bz4TEZqrfshmJsMX
         NvBw==
X-Gm-Message-State: APjAAAUTT7H9H4nAb9cL7TM7edct7icX6I4TUtKcsQwqHEBdlWFEaIfC
        M91IHZZK0DoZ6rayb3BWRhXQKWOAzijNYFSfgxa/
X-Google-Smtp-Source: APXvYqwGSHyBn5RiOCFkhuZPXWdleQytgHyzzVkjLADG8gu+JFArhym1azbwi1YXhYp8TCGjSWX5MV989/0Pk0bWPJE=
X-Received: by 2002:a1c:6783:: with SMTP id b125mr4851689wmc.79.1558478597215;
 Tue, 21 May 2019 15:43:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190521130357.20803-1-miquel.raynal@bootlin.com> <20190521130357.20803-3-miquel.raynal@bootlin.com>
In-Reply-To: <20190521130357.20803-3-miquel.raynal@bootlin.com>
From:   Bjorn Helgaas <bhelgaas@google.com>
Date:   Tue, 21 May 2019 17:43:05 -0500
Message-ID: <CAErSpo5i3y4CxZXV7E4tUR66uXaUa3B_-YT2+zfzZUGMmge7Ow@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] clk: mvebu: armada-37xx-periph: change
 suspend/resume time
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Linux PM list <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Tue, May 21, 2019 at 8:04 AM
To: Michael Turquette, Stephen Boyd, Rob Herring, Mark Rutland
Cc: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>, Thomas
Petazzoni, Antoine Tenart, Gregory Clement, Maxime Chevallier, Nadav
Haklai, Bjorn Helgaas, Rafael J . Wysocki, <linux-pm@vger.kernel.org>,
Miquel Raynal

> Armada 3700 PCIe IP relies on the PCIe clock managed by this
> driver. For reasons related to the PCI core's organization when
> suspending/resuming, PCI host controller drivers must reconfigure
> their register at suspend_noirq()/resume_noirq() which happens after
> suspend()/suspend_late() and before resume_early()/resume().

"For reasons related to the PCI core's organization" manages to
suggest that this change wouldn't be needed if only the PCI core did
something differently, without actually being specific about what it
would need to do differently.

Is there something the PCI core could do better to make this easier?
Or is it just something like "the PCI core needs to access registers
after suspend_late()"?  You mention the host controller, but of course
that's not itself a PCI device, so the PCI core doesn't have much to
do with it directly.

s/register/registers/ ?

> Device link support in the clock framework enforce that the clock
> driver's resume() callback will be called before the PCIe
> driver's. But, any resume_noirq() callback will be called before all
> the registered resume() callbacks.
>
> The solution to support PCIe resume operation is to change the
> "priority" of this clock driver PM callbacks to "_noirq()".
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/clk/mvebu/armada-37xx-periph.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/mvebu/armada-37xx-periph.c b/drivers/clk/mvebu/armada-37xx-periph.c
> index 1e18c5a875bd..bee45e43a85f 100644
> --- a/drivers/clk/mvebu/armada-37xx-periph.c
> +++ b/drivers/clk/mvebu/armada-37xx-periph.c
> @@ -715,8 +715,8 @@ static int __maybe_unused armada_3700_periph_clock_resume(struct device *dev)
>  }
>
>  static const struct dev_pm_ops armada_3700_periph_clock_pm_ops = {
> -       SET_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
> -                               armada_3700_periph_clock_resume)
> +       SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(armada_3700_periph_clock_suspend,
> +                                     armada_3700_periph_clock_resume)
>  };
>
>  static int armada_3700_periph_clock_probe(struct platform_device *pdev)
> --
> 2.19.1
>
