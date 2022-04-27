Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EEE2C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 27 Apr 2022 12:49:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234674AbiD0MwN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 27 Apr 2022 08:52:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234698AbiD0MwM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 27 Apr 2022 08:52:12 -0400
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E5EE2BD004;
        Wed, 27 Apr 2022 05:49:01 -0700 (PDT)
Received: by mail-qt1-f170.google.com with SMTP id y3so995468qtn.8;
        Wed, 27 Apr 2022 05:49:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WFUJPZyPa9jMX7ykKlKZoQbCP5YOPmzPXfT2p0KFBPE=;
        b=k8Ez6K8RUWcU4bx2QX3wcSVv6oOPCJn3a2uPw04OFoTLctf23HeG2YW4othPi4pPqf
         mT7RlRW0MK2jY1Sa7TxzL1J1JKo4bmiLYgpU8rPkBrQ+KlFVKni4p/uQsBh83khjmhwA
         9bHGhTVJQRCqU9w8s43OePXVU3HcCNihvSvJ4/acFJ0+IEpqTjv3g7rq2NJ95mjYsf73
         C1WuHvIPRbb2EyFf3/H4PMA2znnENEUtpT3ZFP1aN+t6VP59H+qJ5Zahn/WM9+az8oM7
         M6A1Q2Zkp2xe/lQcuEA6BVAvHY6NtWtqKjny3TlTYPzKyxR3RXaGRBvZ3VK2m6jEwQBL
         JHcg==
X-Gm-Message-State: AOAM530kfhdTY15br4arE+YAwX7Z7gWIeK1HtTEKYNQopD7f6vDF9NvD
        oMdKvPzGnkVvhcUpxvNXXUdzsUMa6sYR5g==
X-Google-Smtp-Source: ABdhPJwcfFaRxVSdLx0cIC41PNuM+zRikrE0GGcgEeLiqICv++Ke37bBlEgBd9LM3FKSEy287CZKoA==
X-Received: by 2002:ac8:5f8d:0:b0:2f3:3f9a:d5bb with SMTP id j13-20020ac85f8d000000b002f33f9ad5bbmr18756730qta.314.1651063740304;
        Wed, 27 Apr 2022 05:49:00 -0700 (PDT)
Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com. [209.85.128.175])
        by smtp.gmail.com with ESMTPSA id h14-20020a05620a21ce00b0069e8c2d2bd9sm7703108qka.42.2022.04.27.05.48.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Apr 2022 05:49:00 -0700 (PDT)
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-2f83983782fso17177167b3.6;
        Wed, 27 Apr 2022 05:48:59 -0700 (PDT)
X-Received: by 2002:a81:e10d:0:b0:2f7:bb2a:6529 with SMTP id
 w13-20020a81e10d000000b002f7bb2a6529mr23587238ywh.62.1651063739499; Wed, 27
 Apr 2022 05:48:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220427095653.91804-1-miquel.raynal@bootlin.com> <20220427095653.91804-3-miquel.raynal@bootlin.com>
In-Reply-To: <20220427095653.91804-3-miquel.raynal@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 27 Apr 2022 14:48:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUJOXwsFYTsMv9K+0MnJRnB5q7z4T52=yP_BVS8om6CBQ@mail.gmail.com>
Message-ID: <CAMuHMdUJOXwsFYTsMv9K+0MnJRnB5q7z4T52=yP_BVS8om6CBQ@mail.gmail.com>
Subject: Re: [PATCH v12 2/9] dt-bindings: clock: r9a06g032-sysctrl: Reference
 the DMAMUX subnode
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>,
        Gareth Williams <gareth.williams.jx@renesas.com>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Vinod Koul <vkoul@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        dmaengine <dmaengine@vger.kernel.org>,
        Milan Stevanovic <milan.stevanovic@se.com>,
        Jimmy Lalande <jimmy.lalande@se.com>,
        Pascal Eberhard <pascal.eberhard@se.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Herve Codina <herve.codina@bootlin.com>,
        Clement Leger <clement.leger@bootlin.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Ilpo Jarvinen <ilpo.jarvinen@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 27, 2022 at 11:57 AM Miquel Raynal
<miquel.raynal@bootlin.com> wrote:
> This system controller contains several registers that have nothing to
> do with the clock handling, like the DMA mux register. Describe this
> part of the system controller as a subnode.
>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Stephen Boyd <sboyd@kernel.org>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
