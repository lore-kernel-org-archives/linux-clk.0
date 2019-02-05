Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90D4CC4151A
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:18:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 69DA220844
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:18:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728250AbfBEJSk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 04:18:40 -0500
Received: from mail-vk1-f196.google.com ([209.85.221.196]:35026 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727501AbfBEJSj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 04:18:39 -0500
Received: by mail-vk1-f196.google.com with SMTP id b18so631482vke.2;
        Tue, 05 Feb 2019 01:18:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pZaQ24PW9Dp6MLsoAPEgDHAKsI2NZzh46Wyq8QHKFq0=;
        b=PiJrZqyMNOdnfbSVcX6+KHISi5VS9TdBH+qAwCPNL6Gi9ivtoL4GOYQQrmGSB3VS4f
         fO5Jmi7qwuUDlvIsxDb8gRsKqJOhq4nTFqSIOpyhWI+QpLVdvzf6NPAF0/qz6UOaaeEV
         ijY9IIeiTvgzgXIPOoBLxS5cFsWdex7fHd0sfdTbYbSrROXV5tKzAGChkUg3Uj2sXDXL
         rBeCg4vpAY3OOyMGK/g7g2BzzQ9H1YTC4uDKN+jl8m01P3coVVVxE2zC/eHkAnKCin2B
         In189oNyv89sCKXaKE6dDHx5VAR+T7I6VaPtvfa4tWF2qs/bD992vrWgq5WRBTwHTB7m
         ccPA==
X-Gm-Message-State: AHQUAua91tDnLoVjxGcDOdVuNoR0mdyA2sPzbE35bX7qLBf6aGgtnurP
        +1PlakjZZfb2dcqoudSYasl3n/X/vBVD9Y8DgPQ=
X-Google-Smtp-Source: AHgI3IY5v0NK5WXAabTf901u79B6QhS69x2goY3UlE7I2rosY+pyIg3Cnk/0vRJR5cj1aH2QzYd7jIMByzVFN9MqkKk=
X-Received: by 2002:a1f:8e49:: with SMTP id q70mr35555vkd.40.1549358318009;
 Tue, 05 Feb 2019 01:18:38 -0800 (PST)
MIME-Version: 1.0
References: <20190131094021.3092-1-horms+renesas@verge.net.au> <20190131094021.3092-4-horms+renesas@verge.net.au>
In-Reply-To: <20190131094021.3092-4-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 10:18:26 +0100
Message-ID: <CAMuHMdWX8j9W3wc5Xias+tK0ztQb89ngOw9uV2we2HMd__u_Xg@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] clk: renesas: rcar-gen3: Support Z and Z2 clocks
 with high frequency parents
To:     Simon Horman <horms+renesas@verge.net.au>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 31, 2019 at 10:40 AM Simon Horman
<horms+renesas@verge.net.au> wrote:
> Support Z and Z2 clocks with parent frequencies greater than
> UINT32_MAX Hz (~4.29GHz).
>
> The DIV_ROUND_CLOSEST_ULL() macro accepts a 64bit numerator and 32bit
> denominator. This leads to truncation of the numerator, which is the Z or
> Z2 parent clock frequency in HZ, on platforms where frequency of that clock
> is greater than UINT32_MAX Hz.
>
> To resolve this problem the DIV_ROUND_CLOSEST() macro, which accepts the
> prevailing types of the numerator and denominator, is used. In this case
> the type of the numerator is unsigned long long (64 bit) and the type of
> the denominator is unsigned long (64bit on 64bit platforms and 32bit on
> 32bit platforms). This allows parents whose frequency is greater than
> UINT32_MAX Hz on 64bit platforms.
>
> This appears to be sufficient as this driver is only intended for use
> on 64bit systems. And in particular, the motivation for this change is
> to allow a 4.8GHz clock on the R-Car Gen3 E3 (r8a77990) SoC which is
> a 64bit platform.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
