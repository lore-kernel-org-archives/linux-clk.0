Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73BC0C282D7
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DDA420844
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 09:28:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726098AbfBEJ2K (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 04:28:10 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:46882 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbfBEJ2K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 04:28:10 -0500
Received: by mail-vs1-f66.google.com with SMTP id n10so1689249vso.13;
        Tue, 05 Feb 2019 01:28:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iQH+FPH6qAFHiY7B63f6L/FQlQWWmK/1P0mACkaaIg4=;
        b=awGN6qbu3yEjo83LGg68n+P/lsykEkjf5seeGDwbp3oNtyS9TuvDyTjA7tfTT7oHFT
         26nVl/si/kri9UT/mFZoJWLw+vjvjqx/bWr8PIAzxN5i8P0uYPcE7SGl2j9MxEM8lkF9
         20Olwcb7JfY88ge7c6fqvE56LG4hlRkLMkknim5pmzSnt4wMNE/t7j9t7PK5CgfMDXl0
         pdi20kF3slEH3EWFq4bbsyjD2OwQqgO/M4pzo7g5IXoVainlJkpE1bFT8cG3rHMMqdfV
         ulfA8Xz46ZRBCc+de8zhU1DkWPY9TWQntm7bHilg0p7Oq7mzjGMy+cwtItcGTPVquRR6
         wciw==
X-Gm-Message-State: AHQUAuaPkn6TDWeYBG3/jXZMYBfJ7W3yrqkkGd4y0n0Ubgi3snlQEk3d
        safPY2AsO5aKM80zcpPgcuDzk9Spog7gqfTfRoY=
X-Google-Smtp-Source: AHgI3IZliUG2H2XEAiDqlErF6eHLy/v74F/6iAFMQVSVsmSYs/bihHj6KZFfwK1/3y8hm2/iA4bIStC3lqAy0M8//Ho=
X-Received: by 2002:a67:c202:: with SMTP id i2mr1614256vsj.11.1549358889564;
 Tue, 05 Feb 2019 01:28:09 -0800 (PST)
MIME-Version: 1.0
References: <20190131094021.3092-1-horms+renesas@verge.net.au> <20190131094021.3092-6-horms+renesas@verge.net.au>
In-Reply-To: <20190131094021.3092-6-horms+renesas@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 10:27:57 +0100
Message-ID: <CAMuHMdVSFz332a+dvoACJ9ROhxs0-Mwcnhx2hK-Jcz-kGdaqTQ@mail.gmail.com>
Subject: Re: [PATCH/RFT v3 5/5] clk: renesas: r8a774c0: Add Z2 clock
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
> Adds support for R-Car RZ/G2E (r8a774c0) Z2 clock.
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
