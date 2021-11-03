Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBE68C433F5
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 14:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC42F61053
	for <linux-clk@archiver.kernel.org>; Wed,  3 Nov 2021 14:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231464AbhKCO16 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 Nov 2021 10:27:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230527AbhKCO15 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 Nov 2021 10:27:57 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0B62C061714
        for <linux-clk@vger.kernel.org>; Wed,  3 Nov 2021 07:25:20 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id g10so9938841edj.1
        for <linux-clk@vger.kernel.org>; Wed, 03 Nov 2021 07:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ebTW3S7oagCWU7eUoCIXa08vSd0/WM7ZYAj63dN4vao=;
        b=JLXuU6E0T11y6XBr9WF54UreUDTpQf3sTkwKbTz+se9SmenLJ3r5qNmzXSq6M0v8Lw
         E4ptsUeyJzDRZiNA+UBsMdLxliufG8wFgaHiF4alVF4X3TiGPo0qzyF41MdUrW40iKoD
         Z5xRX7iBVvmgvM8GhA3MqSDutSljMRyqmOXWtepcIU4zm4rz+HVwAdTzkIUsreMf9su/
         SoRT3JtHlOlbKIZZoh/hWJPfBPg/6wzCm/lXVz38NRw9tbCkw0d6vigxUANnnn1Q8YHq
         0XoBumuy2RkE69n2ioraHAYh9RDk5zANRON1WtVTqvQrRaLeiUMgwCHLPUypJxZDAKdn
         W/7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ebTW3S7oagCWU7eUoCIXa08vSd0/WM7ZYAj63dN4vao=;
        b=TuBj35fn4D3sopzAqgz1GcNqOvOoKZVAABGLR3GhOy37qmL1/hIv1UM6tD9dRgFinr
         JLF0qrwyUvSuH3HMugtFnSiboggnbQWTNKH/2x6zWzsl4QruJ77qpJbb7asJ+idC8RD7
         cMS+VBuXb73KfQzDDK7+A+TUor0kehYFdCoNDPQ6OW5nnMkTjsDS7w8dXWw/hruv6sqL
         +jS6fSGhihj5u+kqL+bDGXXSqlqptkLFgstVXVzSfNK985FZYajkOKLXRHAIOjQz6Gv7
         qg/bpfFiupxGtF+MfcORmB1a2UqcOBX56/oPCfdK1hU19z3++SeORyGESaVuq++MZKrV
         pMmQ==
X-Gm-Message-State: AOAM530bk/mnSCKeb07vsHK98tj2m9kBqF+OAqqq05pWZzX5nnTsGeyX
        tRb9tlIFgbIe39kmhZgFT05bHztvTLdy5DczJ+E=
X-Google-Smtp-Source: ABdhPJzkWS1SVheSx4RFNZXAQ+g+y2CmvzdfYQ32CbE+CqBXnFxSqIvLuSmKxM1eK18is2QQ+/YrQFgy1Q8pDiTTXpo=
X-Received: by 2002:aa7:cd99:: with SMTP id x25mr15895659edv.249.1635949515329;
 Wed, 03 Nov 2021 07:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
In-Reply-To: <20211103123947.3222443-1-alexander.stein@ew.tq-group.com>
From:   Adam Ford <aford173@gmail.com>
Date:   Wed, 3 Nov 2021 09:25:02 -0500
Message-ID: <CAHCN7xJw02XxfWYt_DCKX0p02sPxTMgghYCLaVMJJ4mJXpsKMw@mail.gmail.com>
Subject: Re: [PATCH 1/1] clk: imx8m: Do not set IMX_COMPOSITE_CORE for
 non-regular composites
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 3, 2021 at 7:41 AM Alexander Stein
<alexander.stein@ew.tq-group.com> wrote:
>
> Only imx8m_clk_hw_composite_core needs to set this flag.
>
> Fixes: a60fe746df94 ("clk: imx: Rework all imx_clk_hw_composite wrappers")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> This is from clk_summary on a imx8mq custom board where you can clearly
> see the before the divider is limited to 8 (core composite)
>
> before:
> video_pll1_out        2        2        0  1031999997          0     0  50000         Y
>    dsi_phy_ref        1        1        0   129000000          0     0  50000         Y
>    lcdif_pixel        2        2        0   129000000          0     0  50000         Y
>
> after:
> video_pll1_out        2        2        0  1031999997          0     0  50000         Y
>    dsi_phy_ref        1        1        0    24000000          0     0  50000         Y
>    lcdif_pixel        2        2        0    68800000          0     0  50000         Y
>
>  drivers/clk/imx/clk.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/imx/clk.h b/drivers/clk/imx/clk.h

I attempted to apply this against linux/master and it doesn't apply.
What branch did you use?

adam

> index 819949973db1..7d220a01de1f 100644
> --- a/drivers/clk/imx/clk.h
> +++ b/drivers/clk/imx/clk.h
> @@ -391,11 +391,11 @@ struct clk_hw *__imx8m_clk_hw_composite(const char *name,
>
>  #define imx8m_clk_hw_composite(name, parent_names, reg) \
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
> -                       IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
> +                       0, IMX_COMPOSITE_CLK_FLAGS_DEFAULT)
>
>  #define imx8m_clk_hw_composite_critical(name, parent_names, reg) \
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
> -                       IMX_COMPOSITE_CORE, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
> +                       0, IMX_COMPOSITE_CLK_FLAGS_CRITICAL)
>
>  #define imx8m_clk_hw_composite_bus(name, parent_names, reg)    \
>         _imx8m_clk_hw_composite(name, parent_names, reg, \
> --
> 2.25.1
>
