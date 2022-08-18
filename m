Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B657C28B2B
	for <linux-clk@archiver.kernel.org>; Thu, 18 Aug 2022 11:34:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244432AbiHRLeF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Aug 2022 07:34:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244434AbiHRLeE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Aug 2022 07:34:04 -0400
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB6F44056D;
        Thu, 18 Aug 2022 04:34:03 -0700 (PDT)
Received: by mail-qv1-f46.google.com with SMTP id mn10so953298qvb.10;
        Thu, 18 Aug 2022 04:34:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=6/l7jq2mF+LaTtaX4OBuP/Imnu9uV4/SlCktDIrs/UU=;
        b=3N3m8MRs1Zc5XkjijCAcJmAm1iXGzA/2Mb7jh81UN6/aAbyFJfRqEJSh4E3GIp9pf+
         HLc/h2hfXIcSGok0+yVS66/7BfChnFDIUlke3Wi2am/t+xoGownryHcDTjjfUQVC9LHt
         5/ZHO3fSX92W1cJzqyzEuHMtODnQWqL/JSKJgnbKR0UOunrvfJxm6YLIGVpuf2HF6FQP
         Ok8peVQen+7YACPfDqsfU7dl/026z+enQtoizcpYtyriSjCiN3BEzTowrTQTpXDhKL9B
         QztraJrL1BqgoE3cUfWQgZQgFGSzIGyY3m9xVmAvOYT+uEttW4v3yEz7PFKvyoCvxnvB
         h7vg==
X-Gm-Message-State: ACgBeo3SeBKfmNGlO6dgnqqwssm6SELncYGkhyidAIZFddxeuDq7pE7x
        W74BBRwEnUazggAilYXQMve65eX3qwR2ew==
X-Google-Smtp-Source: AA6agR7nEtioK2rFtsHGxSqmIeKD8A3gO7CeLpqetLvUOiUf9S1xqV/nyTalWFsUpGRwhCfGLO9j5w==
X-Received: by 2002:ad4:5dea:0:b0:476:6a9e:b5ea with SMTP id jn10-20020ad45dea000000b004766a9eb5eamr2129417qvb.122.1660822441285;
        Thu, 18 Aug 2022 04:34:01 -0700 (PDT)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com. [209.85.128.171])
        by smtp.gmail.com with ESMTPSA id l8-20020ac84cc8000000b0031f0b43629dsm843290qtv.23.2022.08.18.04.34.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 04:34:00 -0700 (PDT)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-335624d1e26so33088987b3.4;
        Thu, 18 Aug 2022 04:34:00 -0700 (PDT)
X-Received: by 2002:a81:658:0:b0:334:a23e:6caa with SMTP id
 85-20020a810658000000b00334a23e6caamr2222272ywg.283.1660822440418; Thu, 18
 Aug 2022 04:34:00 -0700 (PDT)
MIME-Version: 1.0
References: <20220804082605.157269-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220804082605.157269-1-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 18 Aug 2022 13:33:48 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVLb4TE-u5Pkq3Z0_Oi3+0k1LEQu3ff6UuBDe9XH5HF=g@mail.gmail.com>
Message-ID: <CAMuHMdVLb4TE-u5Pkq3Z0_Oi3+0k1LEQu3ff6UuBDe9XH5HF=g@mail.gmail.com>
Subject: Re: [PATCH] clk: renesas: r9a07g044: Add conditional compilation for r9a07g044_cpg_info
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Pavel Machek <pavel@denx.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Aug 4, 2022 at 10:26 AM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add conditional compilation for struct r9a07g044_cpg_info, as
> the compiler won't allocate any memory for this variable in case
> CONFIG_CLK_R9A07G044 is disabled.
>
> Reported-by: Pavel Machek <pavel@denx.de>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.1.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
