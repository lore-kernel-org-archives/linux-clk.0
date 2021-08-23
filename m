Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF376C4320A
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 11:22:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 922D1613A6
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 11:22:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236467AbhHWLXh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 07:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236606AbhHWLXe (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 07:23:34 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BCB0C0613C1
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 04:22:52 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id f10so22396236lfv.6
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 04:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ELGM60ioRNSpEBzYZwyHjOCmGIGPOYG6GuLk6IRUkX8=;
        b=Zltmc5NLRVbIQ8NyRHU2exemKEv33SP1S6SB4IcnWOtnDM5jBR+Kaq6FJ37spEGpU4
         9xILArIF32MOXrRQA6vRU4rd+wWWbkLgyQbBgKSAImUFGA3B3/zXzkBY3uncPeM8kSFB
         FzQk8innsUI2hULjvtCr50zg667kzG2noY9gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ELGM60ioRNSpEBzYZwyHjOCmGIGPOYG6GuLk6IRUkX8=;
        b=Mkvy9AZibqPJQ+s6P2v76PEJsU5kOhN2x2XlevfRDlsjcnE7emHo8f392IB+IbLVfE
         uObnNtn8390Hi1USEpQY794JlPd9H9CGdJx6Zr7I0gXFW/4Jyi+Q/8TeD4nMQ/SdfISO
         1OvKF/YG+Tncfn6XaO765/WLZflZyJoINRhKylNfhvOpomQ8jtM1v7zmhMZFwpoP8J5L
         4O0DRiupFyCdi1VXb0KKsngb+wus7GS5y5pU2Ekj//jRel6bzVXRx4DGWTQwTzM5UQZY
         GK6QIPXQLQivsmUVj4pQXqoEmDJVyyqrPQzqavrZhDQyLj/zRArxVHd82YNXou3s3nQa
         Rcfw==
X-Gm-Message-State: AOAM532ZL5YVYpkYUzc2lobMKa1Ib3B97GwfH9xu6qPMOnJEu8B8wcap
        R7bdqpHvwv+YAyNYSkO7GPkSmSkapW+0vxWshM6t4g==
X-Google-Smtp-Source: ABdhPJwP9D31B1uYiBuq2tMnF2HScsZGxvRJlqQkq5AEq3DdOVXuXbdYvtGrLT0w0XdcfiX69R1/S0lj0GEqrYmeyrU=
X-Received: by 2002:a19:ca09:: with SMTP id a9mr9039073lfg.342.1629717770496;
 Mon, 23 Aug 2021 04:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-9-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-9-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 19:22:39 +0800
Message-ID: <CAGXv+5GqELj5QEx7bCvyMkKdjG5jOFziefA4pHZGqiZgHR58BQ@mail.gmail.com>
Subject: Re: [v2 08/24] clk: mediatek: Add MT8195 peripheral clock support
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

On Fri, Aug 20, 2021 at 7:20 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 peripheral clock controller which provides clock
> gate control for ethernet/flashif/pcie/ssusb.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile             |  2 +-
>  drivers/clk/mediatek/clk-mt8195-peri_ao.c | 62 +++++++++++++++++++++++
>  2 files changed, 63 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-peri_ao.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index a142342a0cea..d5ee396dcded 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -80,6 +80,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_MSDC) += clk-mt8192-msdc.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
> -obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o
> +obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o

This line is getting too long. Please wrap it to within 100 characters.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
