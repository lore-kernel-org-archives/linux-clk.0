Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86787C2F3D5
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:18:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4EFA620861
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 14:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729413AbfAUOSZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 09:18:25 -0500
Received: from mail-ua1-f65.google.com ([209.85.222.65]:35329 "EHLO
        mail-ua1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729957AbfAUOSY (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 09:18:24 -0500
Received: by mail-ua1-f65.google.com with SMTP id d2so6964226ual.2;
        Mon, 21 Jan 2019 06:18:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wL4EyWNaO7v1d1ya8IQ8ykV92aVCbDqzMmKejo95VUk=;
        b=T+vvACEcXUl1L72Yt4PBhybkELRdF3l+/bNzT211+CvC7oB6IrtOkF+cWC42rGOxlM
         EQVkQVcdrQF+6RWweQ1jN2gBiSfocdAi3Aq2a65/4Pv9pcUGK8CJSh64EJ3apgUcrLuE
         ryehhIjYhpegrF/Qdi0bt+W1f1Fj+i6U4heOy2nf0x1HWrhhQKAG5n44U4WAqASo0fkI
         a7FzxHCMjq61fm67HCE+uOvgD4/UVJVa+h2v5kSyh7fkI2T+1BhMjOvhY7Bf3oygBuRQ
         KtJd6zZ5Op55M8CtQrfmgZoUKJabXCLknYZKccl7yipcNyEij6Kqz9W0AinlUcMGVWoL
         yIRQ==
X-Gm-Message-State: AJcUukdumV51xoWk4K/0J4ei/LtBz9So9dmFU5aJuOO5aLjBhiPOK4kU
        k9CcHTDiHEb5n2x8gRWFsVVkOLuj7cBVjB7Dnkc=
X-Google-Smtp-Source: ALg8bN5J+75P3uO6bXq9KlOL7SDwoVW8z3+RdqqZaxwUAZ43XkR+l7nzvKJyMx/LWlVsy5De6ZGIpk3PQnnW4hD/CCA=
X-Received: by 2002:ab0:210e:: with SMTP id d14mr11770374ual.20.1548080303495;
 Mon, 21 Jan 2019 06:18:23 -0800 (PST)
MIME-Version: 1.0
References: <cfd91d1f-3b1e-c6c4-0975-7aac09383fdf@cogentembedded.com> <c4921d75-3e1a-80a5-10ce-12671bffddd5@cogentembedded.com>
In-Reply-To: <c4921d75-3e1a-80a5-10ce-12671bffddd5@cogentembedded.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 21 Jan 2019 15:18:12 +0100
Message-ID: <CAMuHMdWetvUOLfxC1p5C_inciFvO2YwRsEi0UyKm14ZtOg2iMw@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] clk: renesas: r8a77980-cpg-mssr: add RPC clocks
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Dec 4, 2018 at 8:52 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Describe the RPCSRC internal clock and the RPC[D2] clocks derived from it,
> as well as the RPC-IF module clock, in the R-Car V3H (R8A77980) CPG/MSSR
> driver.
>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> Changes in version 2:
> - moved the RPCSRC clock support to the R-Car gen3 CPG patch adding the RPC
>   clocks;
> - rewrote the patch description.

Thanks for the update!

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
