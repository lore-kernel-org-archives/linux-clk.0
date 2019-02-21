Return-Path: <SRS0=pin/=Q4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09285C00319
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 09:18:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7F27214AF
	for <linux-clk@archiver.kernel.org>; Thu, 21 Feb 2019 09:18:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727573AbfBUJSz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Feb 2019 04:18:55 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40501 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfBUJSz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Feb 2019 04:18:55 -0500
Received: by mail-vs1-f66.google.com with SMTP id z18so15755559vso.7;
        Thu, 21 Feb 2019 01:18:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GLQ9kgqysd7lyEgI1/YYsugDHPv6WJmjwqK5/jhuiJ4=;
        b=gMWYayph9zF92NBcSkgDaK2gnXdmYt+cw07s8hL8igKV6g+Sf6osmQTg35yEgCWhux
         acTALTiqEc0YYboSAeh1SlNlF8F9QAxCl9uCadnNYjwfQ/Fwjo15E7XkN53Zz14ukzbG
         5w9NBbu3Au8W2keKVW2sqbp2yCzOiaaXFkZJzYjpsgxH2y9TYKA/8NNuPf1kvfvj9iXN
         H6ytnTBX+ZvtJ+/bvnunfsKURlYL5BuOV0kDPInOucIgrHzHCasW7JUVuqIz8LdEKURa
         wJBs5Oj90VWoSNoqTkdjeiT9ACY3PEiE1+in0pjZJAQ5WjbBeNak7uOHepkGHbK7Z/vn
         FgDw==
X-Gm-Message-State: AHQUAubyVmQfp/OMnrwv5WCouM4x1jBEBmPBRzdfHmMOvUCbtHXoJrER
        4i4DAqcRqUQR8N5gTXuNXkpE7qyvub6YIDPxe9twMw==
X-Google-Smtp-Source: AHgI3IZ+xaYPn7zfWuDCm0psP7/YLIwcrv/WfmYw13e432blmMfOHVH8WSssGDCFnp0JB9x70ZAx+mTOOcWhhs6DIfk=
X-Received: by 2002:a67:78ce:: with SMTP id t197mr19824839vsc.152.1550740734096;
 Thu, 21 Feb 2019 01:18:54 -0800 (PST)
MIME-Version: 1.0
References: <20190212102050.32229-1-geert+renesas@glider.be>
In-Reply-To: <20190212102050.32229-1-geert+renesas@glider.be>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 21 Feb 2019 10:18:41 +0100
Message-ID: <CAMuHMdUwNwVQ-4o8WKdH4pEUtk=Jmyq7gy7frXGW82rgu+afVA@mail.gmail.com>
Subject: Re: [git pull] clk: renesas: Updates for v5.1 (take two)
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Mike, Stephen,

On Tue, Feb 12, 2019 at 11:48 AM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> The following changes since commit d9286d9743b6e8cfbf1a13f8db84e9c65c0b09c7:
>
>   clk: renesas: r8a774c0: Correct parent clock of DU (2019-01-24 16:01:08 +0100)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git tags/clk-renesas-for-v5.1-tag2
>
> for you to fetch changes up to d1de227de8145e661e940377e050286098197eeb:
>
>   clk: renesas: r8a774c0: Add TMU clock (2019-02-05 10:40:05 +0100)
>
> ----------------------------------------------------------------
> clk: renesas: Updates for v5.1 (take two)
>
>   - Add RPC (QSPI/HyperFLASH) clocks on R-Car V3H,
>   - Add TMU (timer) clocks on RZ/G2E,
>   - Small fixes and cleanups.
>
> Thanks for pulling!
>
> ----------------------------------------------------------------
> Biju Das (1):
>       clk: renesas: r8a774c0: Add TMU clock
>
> Sergei Shtylyov (4):
>       clk: renesas: rcar-gen3: Factor out cpg_reg_modify()
>       clk: renesas: rcar-gen3: Add spinlock
>       clk: renesas: rcar-gen3: Add RPC clocks
>       clk: renesas: r8a77980: Add RPC clocks
>
>  drivers/clk/renesas/r8a774c0-cpg-mssr.c |   5 ++
>  drivers/clk/renesas/r8a77980-cpg-mssr.c |   8 ++
>  drivers/clk/renesas/rcar-gen3-cpg.c     | 147 ++++++++++++++++++++++++++++----
>  drivers/clk/renesas/rcar-gen3-cpg.h     |   4 +
>  4 files changed, 146 insertions(+), 18 deletions(-)

I was wondering if you've received my pull request?

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
