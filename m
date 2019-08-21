Return-Path: <SRS0=LMZy=WR=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09787C3A59E
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 09:26:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD75E22D6D
	for <linux-clk@archiver.kernel.org>; Wed, 21 Aug 2019 09:26:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726616AbfHUJ0J (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Aug 2019 05:26:09 -0400
Received: from mail-oi1-f195.google.com ([209.85.167.195]:38284 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726317AbfHUJ0J (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Aug 2019 05:26:09 -0400
Received: by mail-oi1-f195.google.com with SMTP id q8so797563oij.5;
        Wed, 21 Aug 2019 02:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O8XvB0zHNxZrlyVSQdX3PAdkXmvUD1MSe7DEMRpMBmU=;
        b=frOOQiHmUZg0QOkcoJK7LLoclMHUo8zKp5FyfXtI2g1YX+rfENFH0mwlDSmV/QS0pu
         98N48MBSHfDDm+4te97RE9vdNg87nMKS2MmewM/41oNMH6KeL525+naE5H63n3XeeVyr
         /Aa9ggZZbyrnV3m0jRK+Casjc+48PqtF3dfw5LnhXVHSLKxjUC3eQtkLTIcgc/UNCus1
         COBr/OB3a1NOzdPYlaUWY/ehe9eiEsdmMKkrmuKRQfEOO2nUxDJoBI7QFwgmYa5Vhef5
         Ih8m9hW1tsQ8HpTgWjYt0R8YmMIlwE6OR3nMkYYpqlKk/fq8xf7FENsqKSADDQcrG+p/
         NyYg==
X-Gm-Message-State: APjAAAV/rZf9sQwZG5n87js6GcVvZZOHGaaTf8jixnmwkkwUYZoxPW7/
        CXVIrh3M+YKndBllI75/yYgFjbXMxgrHAp2/2Y2diw==
X-Google-Smtp-Source: APXvYqwdT8hnfIhQqIN2QFlt+KwRsITJKoK9EXpt7808Kwag4yAhC/VoMkeUXmSvEOJBy0DDg6NG9lz3tCRnoiYDE/U=
X-Received: by 2002:aca:f4ca:: with SMTP id s193mr2879695oih.131.1566379568403;
 Wed, 21 Aug 2019 02:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190821091516.16372-1-horms+renesas@verge.net.au>
In-Reply-To: <20190821091516.16372-1-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 21 Aug 2019 11:25:57 +0200
Message-ID: <CAMuHMdWdnWh_BPJ1vqKAn71bzZTQqAzBvaJENDWmm5n9gPxc9w@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: clk: emev2: Rename bindings documentation file
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Aug 21, 2019 at 11:15 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> Rename the device tree clock bindings for Renesas EMMA Mobile EV2
> from emev2-clock.txt to renesas,emev2-smu.txt.
>
> This is part of an ongoing effort to name bindings documentation files for
> Renesas IP blocks consistently, in line with the compat strings they
> document.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
