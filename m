Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B9F6EB64DC
	for <linux-clk@archiver.kernel.org>; Mon,  3 Jul 2023 10:02:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjGCKCt convert rfc822-to-8bit (ORCPT
        <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Jul 2023 06:02:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231217AbjGCKC3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 06:02:29 -0400
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E1CA4690;
        Mon,  3 Jul 2023 03:00:06 -0700 (PDT)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-579ed2829a8so13955767b3.1;
        Mon, 03 Jul 2023 03:00:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688378405; x=1690970405;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=00zdOELNHoGtantaf4JPu8FnRGXRfG9PIC7WPkzfT0g=;
        b=C00UIL0ktZTyL029dQjgEYB1t/6LiS6wf1gorK8pTov7lzJxqmvlu6VKfiGq6USzMw
         UfpJFK4env2L5SyiYtpxI1quh8o8F4mNjN3grHrHFR18SjFN+CNybVETFgRMSkR0OwP2
         XrzWD8dJ+ZjJLO+WYNWqm5YxXDCPVbbobQrsB+CjISIcoEbS5DC5A/ySXflAaD0BMsHs
         l4MqF9hm8+Hm9HyHi+z/spIgVIZUfAWhhAlWdmumjc/wiX26XAuzBwvatwiFuZhsHy9s
         /N1yPI9IKFxHfpJ48X6tUCvzOmP6Zoa4IE/Truph8s7GusUqFsLx8P3U7WEKsJbO8ILy
         VI0g==
X-Gm-Message-State: ABy/qLbSeImUJNTxFujlb8wxePtVxUq8ZQSd7hO+9bDirohNU1Jis1Bj
        C2HKEghfpmIIq6E1RWmEplvxKhoSoeqhRw==
X-Google-Smtp-Source: APBJJlHX+xjReSbCSJMs+RsjTmq7EKi6DXemn7jU4es5qH3FpT++/mb0uwbRM2B84k89amug4qHpPQ==
X-Received: by 2002:a81:6d02:0:b0:577:60ec:6966 with SMTP id i2-20020a816d02000000b0057760ec6966mr8544348ywc.13.1688378405356;
        Mon, 03 Jul 2023 03:00:05 -0700 (PDT)
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com. [209.85.219.176])
        by smtp.gmail.com with ESMTPSA id y127-20020a818885000000b00576cd8f9770sm3970906ywf.146.2023.07.03.03.00.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jul 2023 03:00:04 -0700 (PDT)
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-bb15165ba06so3741330276.2;
        Mon, 03 Jul 2023 03:00:04 -0700 (PDT)
X-Received: by 2002:a25:3104:0:b0:c36:3d2a:8336 with SMTP id
 x4-20020a253104000000b00c363d2a8336mr9567373ybx.32.1688378404662; Mon, 03 Jul
 2023 03:00:04 -0700 (PDT)
MIME-Version: 1.0
References: <20230622113341.657842-1-fabrizio.castro.jz@renesas.com> <20230622113341.657842-3-fabrizio.castro.jz@renesas.com>
In-Reply-To: <20230622113341.657842-3-fabrizio.castro.jz@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 3 Jul 2023 11:59:53 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXtM6gQTWpJgLDpDf1x+NdSfi23RVfj34q5fHXts=2ogw@mail.gmail.com>
Message-ID: <CAMuHMdXtM6gQTWpJgLDpDf1x+NdSfi23RVfj34q5fHXts=2ogw@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] clk: renesas: r9a09g011: Add CSI related clocks
To:     Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Fabrizio,

Thanks for your patch!

On Thu, Jun 22, 2023 at 1:34 PM Fabrizio Castro
<fabrizio.castro.jz@renesas.com> wrote:
> The Renesas RZ/V2M SoC comes with 6 CSI IPs (CSI0, CSI1, CSI2
> CSI3, CSI4, and CSI5), however Linux is only allowed control
> of CSI0 and CSI4.
> CSI0 shares its reset and PCLK lines with CSI1, CSI2, and CSI3.
> CSI4 shares its reset and PCLK lines with CSI5.

That sounds like a marvelous idea.... :-(

> This commit adds support for the relevant clocks.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> ---
>
> v2: no changes

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk-for-v6.6.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
