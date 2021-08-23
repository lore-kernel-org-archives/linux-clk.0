Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFB0DC4338F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 12:48:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B4D39613AC
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 12:48:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236574AbhHWMtV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 08:49:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236014AbhHWMtV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 08:49:21 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 607B6C06175F
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:48:38 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id y7so31367194ljp.3
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jW88Mmr9kKDSsQvXNUmfFT239ViVAMgYapLhyDQd6No=;
        b=jrcE9KAVRTDTCyaS7h3RvPgbiT1PjcDchBYeawJaqWt4FU+7CQhua86DdX45l9VL82
         aAmXjPTB1MJySt1b7k0J68jdTSMw8ar/eQf6gtNlcknCNDhTgTFHu1cHjqxzhXpVYFIJ
         Q2NvBezkST/1wLHB79f4zjGRQKIfGVGBQhX4w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jW88Mmr9kKDSsQvXNUmfFT239ViVAMgYapLhyDQd6No=;
        b=ju94uNuvuS8aZLoN8jpOK3i1rlXr9CbfotcweOFcA7RYhl2cRvwkRM3bEvQI2RqdOj
         L3mSxMuq3VE8v/ZZbIfc/CddfasdQHAuNEgM3ZD5VN0bvKvGgQjEcY354AwSW05GyVud
         lqPv93Uaxb9wwtqdkQ3J78DitRc/0HI58OxlJFkNjrK3B1YqTb84U9L7tjHWazf32DWa
         FcWfna+EwdreCmCvdks3TaB07xWMvujGJUd8u3xdUUSdPW6dkYpaDLMAeRk3wnpx5OKr
         ScK0pqc1J6aofQp7USdXMkS9VY3IWVJxZIwNhvj/7YQdmJGmvCS/8ADTjCx2jJ2uF8Mf
         rYVA==
X-Gm-Message-State: AOAM530QVkB7pCCTO87as3kODx7NhFx1iA6NSwtB3Vy5bis2xiaJGonm
        UJlJh12XS0pzBwuR7aeeyJqDQSfK1h/lUDNFLc/jKg==
X-Google-Smtp-Source: ABdhPJxVdu+J2/ouZrq35GIQglMEtR89HwwgR9u2T2JxSfcRKL1Jm3K4FSNW8564lZ+iNMFT8P5OiCEU/eXRM3gABIc=
X-Received: by 2002:a05:651c:211a:: with SMTP id a26mr14057616ljq.305.1629722916767;
 Mon, 23 Aug 2021 05:48:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-25-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-25-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 20:48:25 +0800
Message-ID: <CAGXv+5H6pLtNk_KzAoCreX24t4Fs-7wswPwiZaJYmpXo=9p5iw@mail.gmail.com>
Subject: Re: [v2 24/24] clk: mediatek: Add MT8195 apusys clock support
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Boichat <drinkcat@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org,
        Devicetree List <devicetree@vger.kernel.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Aug 20, 2021 at 7:37 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 apusys clock controller which provides PLLs
> in AI processor Unit.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile                |  2 +-
>  drivers/clk/mediatek/clk-mt8195-apusys_pll.c | 92 ++++++++++++++++++++
>  2 files changed, 93 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-apusys_pll.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 4288ad39ba41..e10b1d6b0cf4 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -83,6 +83,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
>                                         clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
>                                         clk-mt8195-vdec.o clk-mt8195-vdo0.o clk-mt8195-vdo1.o clk-mt8195-venc.o clk-mt8195-vpp0.o \
> -                                       clk-mt8195-vpp1.o clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o
> +                                       clk-mt8195-vpp1.o clk-mt8195-wpe.o clk-mt8195-imp_iic_wrap.o clk-mt8195-apusys_pll.o

Wrap line ...

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
