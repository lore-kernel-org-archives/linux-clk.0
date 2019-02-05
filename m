Return-Path: <SRS0=JsB9=QM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 581CDC282CB
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 08:23:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31B2320818
	for <linux-clk@archiver.kernel.org>; Tue,  5 Feb 2019 08:23:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727613AbfBEIW7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 5 Feb 2019 03:22:59 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:39324 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725898AbfBEIW7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 5 Feb 2019 03:22:59 -0500
Received: by mail-vk1-f195.google.com with SMTP id s184so594572vkd.6;
        Tue, 05 Feb 2019 00:22:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gKTwy7jAxEnqGdvt/x8mKm6529oUNBNOPnOOvT3w+bs=;
        b=buHyf5MCn/Axz4AnVcbjw+i6ciZxXYW/0HyDTDXCAII9r4FaCWZBC0GfICbekfaO52
         1og7ieYaTFgPWaNEPLUGCyGI7B2mxrz939A0q2y5Jj+fjKuB/IYpfGmn2FlOjT5EG/1u
         wdGO/xwg1nupxy7NBUcxQby23pjXJa77C3aJqM/tgElGnvZgUo2YmHrnE+EA8Pgn2wX3
         46zHdAV7j9koJJiPVin5xqziy+J/VouzhzsDv3ZzZdAV7AwXgBGIYJQFHIURqcS6+aPb
         4YvM1GtHuzN+imGKtqdVKUVSyROHzEbOYM1AaITOoNgf3y4t7tHP6/Fno6kT3TxEqa3N
         zFvQ==
X-Gm-Message-State: AHQUAub0N2US6mRnrppLSgiZmjwTX0INT2e+kPBSEMn9qI+pQSp04cFA
        AmvOyUAtwSZlJfO50UvKsk46PoGLXKSx6gAtz/U=
X-Google-Smtp-Source: AHgI3IYm79OF6hLGSJygo7Fc2FGc0De0VbHil9qh5ykv485unGlvqB1LGQKF5Kwrz476zFOkG06qeIMBFN+oaOuFnTo=
X-Received: by 2002:a1f:298e:: with SMTP id p136mr1480152vkp.40.1549354978486;
 Tue, 05 Feb 2019 00:22:58 -0800 (PST)
MIME-Version: 1.0
References: <1549272007-33471-1-git-send-email-biju.das@bp.renesas.com> <1549272007-33471-4-git-send-email-biju.das@bp.renesas.com>
In-Reply-To: <1549272007-33471-4-git-send-email-biju.das@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 5 Feb 2019 09:22:46 +0100
Message-ID: <CAMuHMdX8X9taBNVigxhDZbSiJ4j=y-96iMBS_ove43VQkfeeSQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] clk: renesas: r8a774c0: Add TMU clock
To:     Biju Das <biju.das@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Biju,

On Mon, Feb 4, 2019 at 10:25 AM Biju Das <biju.das@bp.renesas.com> wrote:
> This patch adds TMU clock to the R8A774C0 SoC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> V1-->V2 Incorporated Geert's review comment.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in clk-renesas-for-v5.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
