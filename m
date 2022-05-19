Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A222C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 09:41:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236208AbiESJlT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 05:41:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234045AbiESJlS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 05:41:18 -0400
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BAD2B187;
        Thu, 19 May 2022 02:41:14 -0700 (PDT)
Received: by mail-qk1-f169.google.com with SMTP id i68so3078670qke.11;
        Thu, 19 May 2022 02:41:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Q7V150mb6/0J4OYV2KLPM2iYzqsUWtFhMlTSpuefm4=;
        b=domi192LRQNAxe4KnZcC0Wyz/vtjNgyYXCiUotQZZcv3cEfXn2EJRu0CziUhWxG06M
         V2mHuGmnTYN6l8LA5X1mW3HoTKW/kFyVWRJloPYRw6CwXdWHZWD72oerC0hdfBKwi6js
         nTiHniuzeJDe2lbbFV5CuLIyIc/yGOt8JYTo9hW7GQObdlgNqZO05bSlz0xlRgspOjJv
         loCW9Jj84CRObQmgOj0l2WE4Gs9NoLB4wPyWVRreOuagLf0M+tQDmbq0Foqc1uFAssWD
         SdBFGLMglQ5KIu+n8ACnCSVvF7Pi9BLDsjGlwhz3osADhPVsxRTS8Opb/dC42IGlx6WQ
         c5bw==
X-Gm-Message-State: AOAM533flSm+krvYsjYJf4Lh/iWHte3vyXeVx2jlRtG77zB3w1PrErxQ
        nyLFtEe4L/SeG7DbDgt0OQcK2ZHmaNr6GA==
X-Google-Smtp-Source: ABdhPJzUmCxwrQKoFvYWk0G4iK59k6X38hg3EQViA5SWFRyh4HMaTZIwGU0snt8+BS6eI4xU+Vnc7Q==
X-Received: by 2002:a37:6c46:0:b0:60d:d526:7e48 with SMTP id h67-20020a376c46000000b0060dd5267e48mr2343748qkc.451.1652953273850;
        Thu, 19 May 2022 02:41:13 -0700 (PDT)
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com. [209.85.219.178])
        by smtp.gmail.com with ESMTPSA id y25-20020ac87099000000b002f39b99f6acsm1011993qto.70.2022.05.19.02.41.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:41:12 -0700 (PDT)
Received: by mail-yb1-f178.google.com with SMTP id d137so8003574ybc.13;
        Thu, 19 May 2022 02:41:12 -0700 (PDT)
X-Received: by 2002:a05:6902:905:b0:64a:2089:f487 with SMTP id
 bu5-20020a056902090500b0064a2089f487mr3752535ybb.202.1652953272161; Thu, 19
 May 2022 02:41:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220518172808.1691450-1-ralph.siemsen@linaro.org> <20220518172808.1691450-2-ralph.siemsen@linaro.org>
In-Reply-To: <20220518172808.1691450-2-ralph.siemsen@linaro.org>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 11:41:00 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVPA-azZoU81wYjxb9TES_YDBNNGy3K5yvNLooN2HvRCA@mail.gmail.com>
Message-ID: <CAMuHMdVPA-azZoU81wYjxb9TES_YDBNNGy3K5yvNLooN2HvRCA@mail.gmail.com>
Subject: Re: [PATCH 2/3] clk: renesas: r9a06g032: drop some unused fields
To:     Ralph Siemsen <ralph.siemsen@linaro.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Phil Edworthy <phil.edworthy@renesas.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Ralph,

On Wed, May 18, 2022 at 7:28 PM Ralph Siemsen <ralph.siemsen@linaro.org> wrote:
> Minor cleanup, remove unused fields from struct r9a06g032_clkdesc.
>
> Signed-off-by: Ralph Siemsen <ralph.siemsen@linaro.org>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.20.

> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
> @@ -84,7 +82,7 @@ struct r9a06g032_clkdesc {
>  #define D_UGATE(_idx, _n, _src, _g, _gi, _g1, _r1, _g2, _r2) \
>         { .type = K_DUALGATE, .index = R9A06G032_##_idx, \
>                 .source = 1 + R9A06G032_##_src, .name = _n, \
> -               .dual = { .group = _g, .index = _gi, \
> +               .dual = { .group = _g, \

My first reaction was: this makes _gi unused.
Then I noticed you handle that in your next patch.
I'll merge them into a single commit while applying.

>                         .g1 = _g1, .r1 = _r1, .g2 = _g2, .r2 = _r2 }, }
>
>  enum { K_GATE = 0, K_FFC, K_DIV, K_BITSEL, K_DUALGATE };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
