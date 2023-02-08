Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7F81C05027
	for <linux-clk@archiver.kernel.org>; Wed,  8 Feb 2023 08:28:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230073AbjBHI2f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 8 Feb 2023 03:28:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230224AbjBHI2e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 8 Feb 2023 03:28:34 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCB7A442D6
        for <linux-clk@vger.kernel.org>; Wed,  8 Feb 2023 00:28:32 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id p10so19090127vsu.5
        for <linux-clk@vger.kernel.org>; Wed, 08 Feb 2023 00:28:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PDwdCkBr+epoTFV8128V+K8ZDu4uZiFedibzdz23bSY=;
        b=evtZGJLNjmw9Zm4yLdTXY8KBBja9oIjRep6uxIqQmpn4T0huYcPiv+gjhczlK27ZEA
         1nIgQ8Vx2VTTBD5GZBYzQ+fmXsxYTrUkRNvIZfzFAyzT7rq0Z1c424O2AY3RxD6lM99p
         bHFbQcz6EyNmWuDnfmpIshtHoFIbtyHaoYqO0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PDwdCkBr+epoTFV8128V+K8ZDu4uZiFedibzdz23bSY=;
        b=eWMw8o1JlYt7xFEeFB6OCu5KaHjkwc91svGOdxx5rwy72/RYx3m1r4PBORF6bu63N+
         tXmctdVfILX00+q9AP2Jt3JRPL0dCwa0XOnJGDuntv91cZOWQ+OuDFm65yVIxll3RZKR
         xC/rNedeH+9YYjQIr0C75ABOhhoK12p5AZ1TWMcYofU2K7LIZbqiOtQt9hf1YT8gDwfR
         o5qIPZghsGO9uqPF7VC459OWI9Jf5ylRqwPoOxhFIXkghTkr6s8cvAuzZ1C9eVy9BN6C
         RE+aOE0pVpMQJcxpADUTJEGcMZQsBxDy41Cb8gccNk4j668fCozEBHwN7Vi7Z6Db4rlI
         lE5Q==
X-Gm-Message-State: AO0yUKXBtM+GCCnK7nareDULD3RuTOaY2E8M1gKWscfYmFOfz/A4kjf7
        NJghIvKBnblicE8yFtV1Jxvr/IqIaBtHeiUaMgLspA==
X-Google-Smtp-Source: AK7set/hpRWfHJFWXLG17yEKzouX556hGHZ4DtbxJ5D9T8cyICAY1smDzFL5vj/d6St643qyfmjA84QzpHZ0Ei2fbTQ=
X-Received: by 2002:a05:6102:4b8:b0:3fe:ae88:d22 with SMTP id
 r24-20020a05610204b800b003feae880d22mr1523855vsa.65.1675844911888; Wed, 08
 Feb 2023 00:28:31 -0800 (PST)
MIME-Version: 1.0
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com> <20230206152928.918562-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230206152928.918562-36-angelogioacchino.delregno@collabora.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Wed, 8 Feb 2023 16:28:21 +0800
Message-ID: <CAGXv+5HTP0cLGEQ+qkAt8nsOp5DqCOgPyAOJ66fF91SKX=hZvw@mail.gmail.com>
Subject: Re: [PATCH v1 35/45] clk: mediatek: Split MT8195 clock drivers and
 allow module build
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        johnson.wang@mediatek.com, miles.chen@mediatek.com,
        chun-jie.chen@mediatek.com, daniel@makrotopia.org,
        fparent@baylibre.com, msp@baylibre.com, nfraprado@collabora.com,
        rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
        sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
        yangyingliang@huawei.com, granquet@baylibre.com,
        pablo.sun@mediatek.com, sean.wang@mediatek.com,
        chen.zhong@mediatek.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Feb 6, 2023 at 11:30 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> MT8195 clock drivers were encapsulated in one single (and big) Kconfig
> option: there's no reason to do that, as it is totally unnecessary to
> build in all or none of them.
>
> Split them out: keep boot-critical clocks as bool and allow choosing
> non critical clocks as tristate.

The power domain controller references vppsys*, vdecsys*, vdosys*, wpesys,
imgsys and camsys. I'd argue that this makes these clock drivers
semi-boot-critical. Maybe mfgcfg as well when we add the GPU?

They should be bundled together at the very least. The power domain
controller not probing disables all display and multimedia capabilities.

Also wondering if we should have "default COMMON_CLK_MT8195" ...

I suppose the same questions apply to other SoCs.

ChenYu
