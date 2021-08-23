Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0639BC4338F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 12:22:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D6103613A6
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 12:22:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236173AbhHWMWs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 08:22:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233895AbhHWMWs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 08:22:48 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C390C061575
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:22:05 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id f10so22717966lfv.6
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Pc12zDw8HcYKb0baS7+gSB5w4I/LyyBVqE2pxnJzv8s=;
        b=kX3AskkyzPKb03HvUEmuGI9gh4CNya94lDJ22/YV9n7LSxvdZ5BI3MdTs5iqJV5pnM
         o4yyRUYje7OVexrfH1pDJQqobRchfSZ3nvXQWBxVucSaCcG9OahIUluKY/qONVy8QFzB
         R6v1jrIOx5y6/DX9OSvDV/MrWYzj1tP/cs5/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Pc12zDw8HcYKb0baS7+gSB5w4I/LyyBVqE2pxnJzv8s=;
        b=U0M2IlSMVRuzyOuLu41AX3a7C9ocQrnF0CKV3DNH7T3D7ZEQPMsq8r/JpphryHAyAb
         mw8CKiUvmhdmJcVYTS3k9PENypoplA/3RNutPgJKRWqbJb29xj4hrxbiGTPo6sOQ7SMU
         Aop2mXPlS3bq1Zq12pMyak/zcTmvv9ucKARITXGyHAAi68x/4HaVrryJkfEnwlivAXKp
         j2PFBT43QviTo2lujE1WjTSaPidpCwY18Xs/lA1PXdaahwSdfXf/VW4/k9IyOfaK6YPf
         hly0SfSkZDw85AUE0tjDn16srMmk3oFz5zsDmLIeaEx7Tfdoy/uTNjIRM81mEPeuAKHo
         omqQ==
X-Gm-Message-State: AOAM530jOdVj50lYAiaFpgZGQCCIsOx6FVsw1Lxxg+Fr67UHDrirfhPL
        Ey3AIubYZaVJyzqQoDmgCQ4CQKyZ04RbkblsfGZfdw==
X-Google-Smtp-Source: ABdhPJx1FKfj17h2z7cPtACyH3OONTpQ2GGSY9YpNwF75edIYpH95oAYMUAh5Qab+UPPELdq1wRLFzXO5IVlm+50bBk=
X-Received: by 2002:ac2:5e8f:: with SMTP id b15mr22656456lfq.656.1629721324078;
 Mon, 23 Aug 2021 05:22:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-17-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-17-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 20:21:53 +0800
Message-ID: <CAGXv+5HGjd4tQ4rg11VmQYOzUxkSrGStV8vS7kXkKWS1N4nM3Q@mail.gmail.com>
Subject: Re: [v2 16/24] clk: mediatek: Add MT8195 vdecsys clock support
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

On Fri, Aug 20, 2021 at 7:28 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 vdec clock controllers which provide clock gate
> control for video decoder.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile          |   3 +-
>  drivers/clk/mediatek/clk-mt8195-vdec.c | 104 +++++++++++++++++++++++++
>  2 files changed, 106 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-vdec.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 472e5bc40fcb..ac269f6d39e3 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -81,6 +81,7 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
> -                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o
> +                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o \
> +                                       clk-mt8195-vdec.o

Apart from the line wrapping,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
