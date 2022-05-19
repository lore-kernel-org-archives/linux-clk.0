Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B92EAC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 09:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236248AbiESJrf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 05:47:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235319AbiESJre (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 05:47:34 -0400
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36996970F;
        Thu, 19 May 2022 02:47:33 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id s22so4466086qta.0;
        Thu, 19 May 2022 02:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iKSoheoQptDFa3QVeXneo99zoGHd1dA/7lDHXoCagCw=;
        b=BCLA6G3RZiNxA/1MUWyRrJB3nTKiieiNuXAUAx14vujMF5EiM/L9ELsEs1oCXmDQZc
         ilfbBVNa8uZ4P8SWj4nUFSC7pTFJzjMtgwK9iV+vvCp1HLUcLMlPTJFf3gHMUxUAc5gT
         6FmICLItvSNN7vB4JSi3zxpxYuoPUaXOu/IyR2JnLcUrurCVGzCTCqIg+5S9rNgciU4y
         3brJwNvuHJJJZS3cg/apxR8kefN0h+hUd6rrEZHhx63c8YIcqs/1hNFUWIY30q4aWkpv
         sgbEt18pQ4/yr1yFpl5gmFHRfKfqkcNjm7Jvwl7J50dMi6Mso2dWvg/FqDtg1FIURYMY
         i74g==
X-Gm-Message-State: AOAM531h+vR/pHLAJzSl84dNmb8+ko+LGFXHgnn4+W/uonc11moZnXql
        b2cJqWF5IC09xS47Bpu6i23F2q/F4RPITw==
X-Google-Smtp-Source: ABdhPJw8ehsCKOOpWZ2Jzfy8BXKzzB0ldQdtMLd8QAS4q6xHJlaI/2Qd92CTJeDOWRdZbxMGoV7JwQ==
X-Received: by 2002:ac8:7c4e:0:b0:2f3:fb43:c767 with SMTP id o14-20020ac87c4e000000b002f3fb43c767mr3120452qtv.188.1652953652646;
        Thu, 19 May 2022 02:47:32 -0700 (PDT)
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com. [209.85.128.169])
        by smtp.gmail.com with ESMTPSA id t65-20020ae9df44000000b0069fc13ce232sm1017691qkf.99.2022.05.19.02.47.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 May 2022 02:47:32 -0700 (PDT)
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-2fee9fe48c2so51318047b3.3;
        Thu, 19 May 2022 02:47:31 -0700 (PDT)
X-Received: by 2002:a81:234b:0:b0:2f8:4082:bbd3 with SMTP id
 j72-20020a81234b000000b002f84082bbd3mr3760840ywj.47.1652953651678; Thu, 19
 May 2022 02:47:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220510110653.7326-1-biju.das.jz@bp.renesas.com> <20220510110653.7326-3-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220510110653.7326-3-biju.das.jz@bp.renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Thu, 19 May 2022 11:47:19 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXn1aHATE9-QnMOx7t33LXSwA433ymiKKMbOCgwOQCaoA@mail.gmail.com>
Message-ID: <CAMuHMdXn1aHATE9-QnMOx7t33LXSwA433ymiKKMbOCgwOQCaoA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a07g044: Add POEG clock and reset entries
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, May 10, 2022 at 1:07 PM Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add POEG clock and reset entries to CPG driver.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v5.20.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
