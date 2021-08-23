Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEA5DC4338F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 12:08:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9838561184
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 12:08:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235813AbhHWMJF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 08:09:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234136AbhHWMJA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 08:09:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F955C061757
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:08:18 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u22so37394170lfq.13
        for <linux-clk@vger.kernel.org>; Mon, 23 Aug 2021 05:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4Hsa6LzSuh4SnPB+dspMsqJmQ70/0sIoH9+uWFl96VE=;
        b=cXWu4Tgd2N5ECuiQcdYmburQAuy9zZ8n/4WN+QAAvwWjEseQSvH8EZNRV3xgSm9uGH
         PDCvGppJ0Qe1nyQfHjp2xZ7Q0YhBU+5K57JqS4ASjxPHLSGfM7Jyg6peTKl5cvq5gHbG
         FUBZ5mM2vrd0+AU9BXpvgnJGAaUnZIiy5Idos=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4Hsa6LzSuh4SnPB+dspMsqJmQ70/0sIoH9+uWFl96VE=;
        b=ERwXjZfTLNpKrrMdFKeEKnDJE6gu0yhCfp3m3VDR2DZiCtsdfr2VQFxIzxtXMEaqIB
         PZCMWd5Kvx5VqS/tmvAFMTo7W8K92Zd3UABFdWnQS8kRaYKB4s3ztU/97iWBmasJcj/T
         Bz9Jmg1x4jvw9zHspjHcgeaIxBK082eFnvEnH2YswcM3z/0DHSt+HLkCxZoLiZIQkW7R
         J4wza2PUpVItCt9yqsxmJ+Zmour3eLZJtRi3b4E/G4TSBIByiBQkeJXb+8jcKPImgp+T
         WlwAxSQp/4rZ8pfXvtooxxXI0jr/lkuckgZLQ5GwPzuzvADU/7XPhlg9T/MgsiV4Vuol
         3bDw==
X-Gm-Message-State: AOAM5309xrnSTv79C9gpbu35afqioFY87y8mmK8nAW0R5Bc424KZZpie
        am/NoN2JHU3HF2M97ZhYk0V1mIn0rls4LDs5phSAmQ==
X-Google-Smtp-Source: ABdhPJyzS8m5t0li8KicBhE6A/4pI2DH+LUTJ6HsAjU3uRg8k0SlYkSR0AN/jSdIKZo30cWApO+L9hMdKMOVWdmdslQ=
X-Received: by 2002:a05:6512:456:: with SMTP id y22mr24337026lfk.647.1629720496635;
 Mon, 23 Aug 2021 05:08:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210820111504.350-1-chun-jie.chen@mediatek.com> <20210820111504.350-16-chun-jie.chen@mediatek.com>
In-Reply-To: <20210820111504.350-16-chun-jie.chen@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 23 Aug 2021 20:08:05 +0800
Message-ID: <CAGXv+5FcV0NrA+gES78jUSgWDt15q4h66=PkPGGT_85QOVMGqQ@mail.gmail.com>
Subject: Re: [v2 15/24] clk: mediatek: Add MT8195 scp adsp clock support
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

On Fri, Aug 20, 2021 at 7:27 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8195 scp adsp clock controller which provides clock gate
> control for Audio DSP.
>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  drivers/clk/mediatek/Makefile              |  2 +-
>  drivers/clk/mediatek/clk-mt8195-scp_adsp.c | 47 ++++++++++++++++++++++
>  2 files changed, 48 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/clk/mediatek/clk-mt8195-scp_adsp.c
>
> diff --git a/drivers/clk/mediatek/Makefile b/drivers/clk/mediatek/Makefile
> index 042db433245a..472e5bc40fcb 100644
> --- a/drivers/clk/mediatek/Makefile
> +++ b/drivers/clk/mediatek/Makefile
> @@ -81,6 +81,6 @@ obj-$(CONFIG_COMMON_CLK_MT8192_SCP_ADSP) += clk-mt8192-scp_adsp.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VDECSYS) += clk-mt8192-vdec.o
>  obj-$(CONFIG_COMMON_CLK_MT8192_VENCSYS) += clk-mt8192-venc.o
>  obj-$(CONFIG_COMMON_CLK_MT8195) += clk-mt8195-apmixedsys.o clk-mt8195-topckgen.o clk-mt8195-peri_ao.o clk-mt8195-infra_ao.o clk-mt8195-cam.o \
> -                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o
> +                                       clk-mt8195-ccu.o clk-mt8195-img.o clk-mt8195-ipe.o clk-mt8195-mfg.o clk-mt8195-scp_adsp.o

Wrap line, please.

Otherwise,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
