Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E1AEC433F5
	for <linux-clk@archiver.kernel.org>; Thu, 21 Apr 2022 07:52:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1386216AbiDUHzX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 21 Apr 2022 03:55:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1382347AbiDUHzW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 21 Apr 2022 03:55:22 -0400
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com [IPv6:2607:f8b0:4864:20::b30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1781FE023
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 00:52:33 -0700 (PDT)
Received: by mail-yb1-xb30.google.com with SMTP id j2so7331033ybu.0
        for <linux-clk@vger.kernel.org>; Thu, 21 Apr 2022 00:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0TSxfaRJixCAUsy/W0YnBm1Z96qqxM5YEF3UUxdXL0A=;
        b=O0bAOrR/OPesc12k+60IKnlLJE0jrSTcj0YLI1lgEdQzMVoPfHycKJksCpEzUre3Zh
         /InYBrd5hhV6xPePuu2QRdt8JwSAbKQsDgrrFYwrEHp8xDaO7wwMfOx6nHbTCF3jOu3p
         1Znq/Unn8vgjnxqPqjWNrjk4NA8O1q5xMbI4Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0TSxfaRJixCAUsy/W0YnBm1Z96qqxM5YEF3UUxdXL0A=;
        b=qwv+GroGYykQO1API+IGp1M4wogHyFt2GInoga1JZUOAERNkq4BtFIp/F+rXkpSYDI
         98Npp/OBKgmZ6ql9nV7Lx0YkFJH1tfUsJtnbKQlY0PqQIRvOCNWewVxv+TGkSlO1mZpi
         NEdNHFplrb4RQhxSQ+3KpNxGTAvsrf7JPKsyVxseVzgLJrp9ud4gN/vfX744VBugJtCG
         FcuJHv/Bo9jqw2Ji0q9AMO0BGpWEtkaVuksP8OBUNWdn6uRa6ORBv4B+ym2/xMGg6TWZ
         NWCo4ieC/Ukq+XkpzjSSKxHD/YNHVhvpgFhJgna8CjwZPAJSQUNhEFOEPYvrl5IVk1up
         MOXw==
X-Gm-Message-State: AOAM531kCniye3XmAE+8uOPQGRhh6Et/AlUvFQdXVyh7MYA6B+sNwCl9
        MRrmCIB+xesXw8UEV0HfnHz1KVo+yc/Q1qA3FFmGNA==
X-Google-Smtp-Source: ABdhPJyqt6Fgg3AF7Jbew907+pTxsU4C3o4jAvQcqeSLeYvWEOQ70ahpJmDA890Baw5jr3SxUODlQxxwEQAVCXygbdw=
X-Received: by 2002:a25:30d:0:b0:640:df7f:74c4 with SMTP id
 13-20020a25030d000000b00640df7f74c4mr23042769ybd.278.1650527552381; Thu, 21
 Apr 2022 00:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com> <20220420130527.23200-3-rex-bc.chen@mediatek.com>
In-Reply-To: <20220420130527.23200-3-rex-bc.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Thu, 21 Apr 2022 15:52:21 +0800
Message-ID: <CAGXv+5FJBKYoEuazH9broYSM4uOy=e_3O-86tOOQrsp0xH=4wQ@mail.gmail.com>
Subject: Re: [PATCH V2 02/12] clk: mediatek: reset: Use simple reset operations
To:     Rex-BC Chen <rex-bc.chen@mediatek.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
        chun-jie.chen@mediatek.com, runyang.chen@mediatek.com,
        linux-kernel@vger.kernel.org, allen-kh.cheng@mediatek.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Apr 20, 2022 at 9:05 PM Rex-BC Chen <rex-bc.chen@mediatek.com> wrote:
>
> There are two version for clock reset register control of MediaTek SoCs.
> The reset operations before MT8183 can use simple reset to cover.

I would go slightly into more detail, i.e.

    The old hardware is one bit per reset control, and does not have
    separate registers for bit set, clear and read-back operations. This
    matches the scheme supported by the simple reset driver. ...

> Therefore, we replace mtk_reset_ops with reset_simple_ops.

   ... to remove redundant code.

The "why" is more important than "what" in commit logs. "What" you did
is already visible in the diff.

> In addition, we also rename mtk_register_reset_controller to
> mtk_register_reset_controller_simple.
>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Kconfig          |  1 +
>  drivers/clk/mediatek/clk-mt2701-eth.c |  2 +-
>  drivers/clk/mediatek/clk-mt2701-g3d.c |  2 +-
>  drivers/clk/mediatek/clk-mt2701-hif.c |  2 +-
>  drivers/clk/mediatek/clk-mt2701.c     |  4 +--
>  drivers/clk/mediatek/clk-mt2712.c     |  4 +--
>  drivers/clk/mediatek/clk-mt7622-eth.c |  2 +-
>  drivers/clk/mediatek/clk-mt7622-hif.c |  4 +--
>  drivers/clk/mediatek/clk-mt7622.c     |  4 +--
>  drivers/clk/mediatek/clk-mt7629-eth.c |  2 +-
>  drivers/clk/mediatek/clk-mt7629-hif.c |  4 +--
>  drivers/clk/mediatek/clk-mt8135.c     |  4 +--
>  drivers/clk/mediatek/clk-mt8173.c     |  4 +--
>  drivers/clk/mediatek/clk-mtk.h        |  6 ++--
>  drivers/clk/mediatek/reset.c          | 43 +++------------------------
>  15 files changed, 27 insertions(+), 61 deletions(-)

[...]

>  void mtk_register_reset_controller_set_clr(struct device_node *np,
>         unsigned int num_regs, int regofs)
>  {
>         mtk_register_reset_controller_common(np, num_regs, regofs,
> -               &mtk_reset_ops_set_clr);
> +                                            &mtk_reset_ops_set_clr);

This change is unrelated and should not be included.

ChenYu


>  }
>
>  MODULE_LICENSE("GPL");
> --
> 2.18.0
>
