Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35A65C433E6
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 13:41:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DDC1564F51
	for <linux-clk@archiver.kernel.org>; Tue,  9 Mar 2021 13:41:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231137AbhCINkr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Mar 2021 08:40:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231197AbhCINkR (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Mar 2021 08:40:17 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54D4FC06174A;
        Tue,  9 Mar 2021 05:40:17 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id x135so10450185oia.9;
        Tue, 09 Mar 2021 05:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cjli9VTdeq1MHBIa7+/aJFhlvAvBCO+ZUMujE9XxcMY=;
        b=OxTf9zIel19a81G5L5Eri7/vPF/0G0bCp8oJgnflFGL63bWcealBg5P9bzfErt8Lr6
         HN4ScNJ3KPP1X8XR/YQYx2yu7QaFEzRZalIxkd1keWF3piaIL+CLzD1371My31gm2vfr
         guISn4sLm9Ta5uSihq9LkJfufNRzxlAVQMdNcAvI++T+tWQ+Egt8GhVPsVbypB1qmsD1
         U5DdKko//6RKB2uOsVnQ/X2f5SBGo3zMlZoknF9gRr6Cy76spFWdM09M3uyzWShKEndx
         KKST07V9ObGiPYwsfmHc/mjJ+JA/rf3WQ0H/lynM1UHnx6jt5bJbG9hqMToy8Dg8q9T2
         MPmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cjli9VTdeq1MHBIa7+/aJFhlvAvBCO+ZUMujE9XxcMY=;
        b=ryJnLWGJ+lCJePSduBjbGTkZpYLeP2aBDSLj10zaB36MPCLZz4cFowRKbuvgC6bt+w
         4kOIMmIY1EgQYYgQgc4ssqJObKoP/ejewPG8UvhiRfW/PrSPX//82UdPfc+m2FcoLCe0
         i+35Lu+7VkHntq1lOP9JFLzhEABKsXVGK3LfAAxbF/d8iCtAgCUoRcBaYtRVPWrwiPQ2
         YmaPjoz5w9OF+f+mLSeO5rr5F8qiiT53c7fGEcZnnEspPSv6nN8iWYAZo3VyveLl81ZE
         nfq0VSnyeMVlpJncKLAkk8I+uyMcVoKieBpJ3Bxz9uYLsDZb8KMlSEpp5ldnesmA2/Ec
         krTA==
X-Gm-Message-State: AOAM533eWy90F7+0lkAiPDTCwl+Sr2yIPYurrPLeiZtIm30z/9Qy0LEL
        44W58b0JhARkzC8XJkudUISUMQfR4m4+uH+zwG8=
X-Google-Smtp-Source: ABdhPJzpWnBeI8JNju63ZqLrfMEwGSCPE5hb9/9S8BFE/siwMRlDk/QkAw2ATsh10255EmJqnoLg1w0+OAjQlm0cUa4=
X-Received: by 2002:aca:ab86:: with SMTP id u128mr2985140oie.47.1615297216832;
 Tue, 09 Mar 2021 05:40:16 -0800 (PST)
MIME-Version: 1.0
References: <1613750416-11901-1-git-send-email-abel.vesa@nxp.com> <1613750416-11901-6-git-send-email-abel.vesa@nxp.com>
In-Reply-To: <1613750416-11901-6-git-send-email-abel.vesa@nxp.com>
From:   Dong Aisheng <dongas86@gmail.com>
Date:   Tue, 9 Mar 2021 21:40:17 +0800
Message-ID: <CAA+hA=TE+=uiVi1QGijO9icYwHOwwXYSXTrs=NYKfBjyCq4cTw@mail.gmail.com>
Subject: Re: [RFC 05/19] devfreq: imx8m-ddrc: Change governor to powersave
To:     Abel Vesa <abel.vesa@nxp.com>
Cc:     Rob Herring <robh@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Georgi Djakov <djakov@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Peng Fan <peng.fan@nxp.com>,
        Martin Kepplinger <martink@posteo.de>,
        devicetree <devicetree@vger.kernel.org>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, Feb 20, 2021 at 12:03 AM Abel Vesa <abel.vesa@nxp.com> wrote:
>
> By switching to powersave governor, we allow the imx8m-ddrc to always
> run at minimum rate needed by all the running masters.
>
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>

Would you please help clarify a bit more why need use powersave by default?

Regards
Aisheng

> ---
>  drivers/devfreq/imx8m-ddrc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/devfreq/imx8m-ddrc.c b/drivers/devfreq/imx8m-ddrc.c
> index bc82d3653bff..3a6c04ba4f2e 100644
> --- a/drivers/devfreq/imx8m-ddrc.c
> +++ b/drivers/devfreq/imx8m-ddrc.c
> @@ -379,7 +379,7 @@ static int imx8m_ddrc_probe(struct platform_device *pdev)
>  {
>         struct device *dev = &pdev->dev;
>         struct imx8m_ddrc *priv;
> -       const char *gov = DEVFREQ_GOV_USERSPACE;
> +       const char *gov = DEVFREQ_GOV_POWERSAVE;
>         int ret;
>
>         priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> --
> 2.29.2
>
